/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_tcolgp.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
%wrap_handle(TColgp_HArray1OfLin2d)
%wrap_handle(TColgp_HArray1OfVec2d)
%wrap_handle(TColgp_HArray1OfXY)
%wrap_handle(TColgp_HArray1OfPnt)
%wrap_handle(TColgp_HArray1OfXYZ)
%wrap_handle(TColgp_HArray1OfDir2d)
%wrap_handle(TColgp_HArray1OfVec)
%wrap_handle(TColgp_HArray1OfDir)
%wrap_handle(TColgp_HArray1OfPnt2d)
%wrap_handle(TColgp_HArray1OfCirc2d)
%wrap_handle(TColgp_HArray2OfDir2d)
%wrap_handle(TColgp_HArray2OfVec2d)
%wrap_handle(TColgp_HArray2OfVec)
%wrap_handle(TColgp_HArray2OfPnt2d)
%wrap_handle(TColgp_HArray2OfPnt)
%wrap_handle(TColgp_HArray2OfXYZ)
%wrap_handle(TColgp_HArray2OfLin2d)
%wrap_handle(TColgp_HArray2OfXY)
%wrap_handle(TColgp_HArray2OfDir)
%wrap_handle(TColgp_HArray2OfCirc2d)
%wrap_handle(TColgp_HSequenceOfXY)
%wrap_handle(TColgp_HSequenceOfPnt2d)
%wrap_handle(TColgp_HSequenceOfDir2d)
%wrap_handle(TColgp_HSequenceOfPnt)
%wrap_handle(TColgp_HSequenceOfVec)
%wrap_handle(TColgp_HSequenceOfXYZ)
%wrap_handle(TColgp_HSequenceOfDir)
%wrap_handle(TColgp_HSequenceOfVec2d)
/* end handles declaration */

/* templates */
%template(TColgp_Array1OfCirc2d) NCollection_Array1<gp_Circ2d>;
Array1ExtendIter(gp_Circ2d)

%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of3DNumpyTemplate(TColgp_Array1OfDir, gp_Dir)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of2DNumpyTemplate(TColgp_Array1OfDir2d, gp_Dir2d)
%template(TColgp_Array1OfLin2d) NCollection_Array1<gp_Lin2d>;
Array1ExtendIter(gp_Lin2d)

%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of3DNumpyTemplate(TColgp_Array1OfPnt, gp_Pnt)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of2DNumpyTemplate(TColgp_Array1OfPnt2d, gp_Pnt2d)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of3DNumpyTemplate(TColgp_Array1OfVec, gp_Vec)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of2DNumpyTemplate(TColgp_Array1OfVec2d, gp_Vec2d)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of2DNumpyTemplate(TColgp_Array1OfXY, gp_XY)
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArray2, int nRows2, int nDims2) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray2Argout, int aSizeArgout) };
Array1Of3DNumpyTemplate(TColgp_Array1OfXYZ, gp_XYZ)
%template(TColgp_Array2OfCirc2d) NCollection_Array2<gp_Circ2d>;
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of3DNumpyTemplate(TColgp_Array2OfDir, gp_Dir)
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of2DNumpyTemplate(TColgp_Array2OfDir2d, gp_Dir2d)
%template(TColgp_Array2OfLin2d) NCollection_Array2<gp_Lin2d>;
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of3DNumpyTemplate(TColgp_Array2OfPnt, gp_Pnt)
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of2DNumpyTemplate(TColgp_Array2OfPnt2d, gp_Pnt2d)
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of3DNumpyTemplate(TColgp_Array2OfVec, gp_Vec)
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of2DNumpyTemplate(TColgp_Array2OfVec2d, gp_Vec2d)
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of2DNumpyTemplate(TColgp_Array2OfXY, gp_XY)
%apply (double* IN_ARRAY3, int DIM1, int DIM2, int DIM3) { (double* numpyArray3, int nRows3, int nCols3, int nDims3) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArray3Argout, int aSizeArgout) };
Array2Of3DNumpyTemplate(TColgp_Array2OfXYZ, gp_XYZ)
%template(TColgp_SequenceOfArray1OfPnt2d) NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt2d>>;

%extend NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt2d>> {
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
%template(TColgp_SequenceOfAx1) NCollection_Sequence<gp_Ax1>;

%extend NCollection_Sequence<gp_Ax1> {
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
%template(TColgp_SequenceOfDir) NCollection_Sequence<gp_Dir>;

%extend NCollection_Sequence<gp_Dir> {
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
%template(TColgp_SequenceOfDir2d) NCollection_Sequence<gp_Dir2d>;

%extend NCollection_Sequence<gp_Dir2d> {
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
%template(TColgp_SequenceOfPnt) NCollection_Sequence<gp_Pnt>;

%extend NCollection_Sequence<gp_Pnt> {
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
%template(TColgp_SequenceOfPnt2d) NCollection_Sequence<gp_Pnt2d>;

%extend NCollection_Sequence<gp_Pnt2d> {
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
%template(TColgp_SequenceOfVec) NCollection_Sequence<gp_Vec>;

%extend NCollection_Sequence<gp_Vec> {
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
%template(TColgp_SequenceOfVec2d) NCollection_Sequence<gp_Vec2d>;

%extend NCollection_Sequence<gp_Vec2d> {
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
%template(TColgp_SequenceOfXY) NCollection_Sequence<gp_XY>;

%extend NCollection_Sequence<gp_XY> {
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
%template(TColgp_SequenceOfXYZ) NCollection_Sequence<gp_XYZ>;

%extend NCollection_Sequence<gp_XYZ> {
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
typedef NCollection_Array1<gp_Circ2d> TColgp_Array1OfCirc2d;
typedef NCollection_Array1<gp_Dir> TColgp_Array1OfDir;
typedef NCollection_Array1<gp_Dir2d> TColgp_Array1OfDir2d;
typedef NCollection_Array1<gp_Lin2d> TColgp_Array1OfLin2d;
typedef NCollection_Array1<gp_Pnt> TColgp_Array1OfPnt;
typedef NCollection_Array1<gp_Pnt2d> TColgp_Array1OfPnt2d;
typedef NCollection_Array1<gp_Vec> TColgp_Array1OfVec;
typedef NCollection_Array1<gp_Vec2d> TColgp_Array1OfVec2d;
typedef NCollection_Array1<gp_XY> TColgp_Array1OfXY;
typedef NCollection_Array1<gp_XYZ> TColgp_Array1OfXYZ;
typedef NCollection_Array2<gp_Circ2d> TColgp_Array2OfCirc2d;
typedef NCollection_Array2<gp_Dir> TColgp_Array2OfDir;
typedef NCollection_Array2<gp_Dir2d> TColgp_Array2OfDir2d;
typedef NCollection_Array2<gp_Lin2d> TColgp_Array2OfLin2d;
typedef NCollection_Array2<gp_Pnt> TColgp_Array2OfPnt;
typedef NCollection_Array2<gp_Pnt2d> TColgp_Array2OfPnt2d;
typedef NCollection_Array2<gp_Vec> TColgp_Array2OfVec;
typedef NCollection_Array2<gp_Vec2d> TColgp_Array2OfVec2d;
typedef NCollection_Array2<gp_XY> TColgp_Array2OfXY;
typedef NCollection_Array2<gp_XYZ> TColgp_Array2OfXYZ;
typedef NCollection_HArray1<gp_Circ2d> TColgp_HArray1OfCirc2d;
typedef NCollection_HArray1<gp_Dir> TColgp_HArray1OfDir;
typedef NCollection_HArray1<gp_Dir2d> TColgp_HArray1OfDir2d;
typedef NCollection_HArray1<gp_Lin2d> TColgp_HArray1OfLin2d;
typedef NCollection_HArray1<gp_Pnt> TColgp_HArray1OfPnt;
typedef NCollection_HArray1<gp_Pnt2d> TColgp_HArray1OfPnt2d;
typedef NCollection_HArray1<gp_Vec> TColgp_HArray1OfVec;
typedef NCollection_HArray1<gp_Vec2d> TColgp_HArray1OfVec2d;
typedef NCollection_HArray1<gp_XY> TColgp_HArray1OfXY;
typedef NCollection_HArray1<gp_XYZ> TColgp_HArray1OfXYZ;
typedef NCollection_HArray2<gp_Circ2d> TColgp_HArray2OfCirc2d;
typedef NCollection_HArray2<gp_Dir> TColgp_HArray2OfDir;
typedef NCollection_HArray2<gp_Dir2d> TColgp_HArray2OfDir2d;
typedef NCollection_HArray2<gp_Lin2d> TColgp_HArray2OfLin2d;
typedef NCollection_HArray2<gp_Pnt> TColgp_HArray2OfPnt;
typedef NCollection_HArray2<gp_Pnt2d> TColgp_HArray2OfPnt2d;
typedef NCollection_HArray2<gp_Vec> TColgp_HArray2OfVec;
typedef NCollection_HArray2<gp_Vec2d> TColgp_HArray2OfVec2d;
typedef NCollection_HArray2<gp_XY> TColgp_HArray2OfXY;
typedef NCollection_HArray2<gp_XYZ> TColgp_HArray2OfXYZ;
typedef NCollection_HSequence<gp_Dir> TColgp_HSequenceOfDir;
typedef NCollection_HSequence<gp_Dir2d> TColgp_HSequenceOfDir2d;
typedef NCollection_HSequence<gp_Pnt> TColgp_HSequenceOfPnt;
typedef NCollection_HSequence<gp_Pnt2d> TColgp_HSequenceOfPnt2d;
typedef NCollection_HSequence<gp_Vec> TColgp_HSequenceOfVec;
typedef NCollection_HSequence<gp_Vec2d> TColgp_HSequenceOfVec2d;
typedef NCollection_HSequence<gp_XY> TColgp_HSequenceOfXY;
typedef NCollection_HSequence<gp_XYZ> TColgp_HSequenceOfXYZ;
typedef NCollection_Sequence<opencascade::handle<TColgp_HArray1OfPnt2d>> TColgp_SequenceOfArray1OfPnt2d;
typedef NCollection_Sequence<gp_Ax1> TColgp_SequenceOfAx1;
typedef NCollection_Sequence<gp_Dir> TColgp_SequenceOfDir;
typedef NCollection_Sequence<gp_Dir2d> TColgp_SequenceOfDir2d;
typedef NCollection_Sequence<gp_Pnt> TColgp_SequenceOfPnt;
typedef NCollection_Sequence<gp_Pnt2d> TColgp_SequenceOfPnt2d;
typedef NCollection_Sequence<gp_Vec> TColgp_SequenceOfVec;
typedef NCollection_Sequence<gp_Vec2d> TColgp_SequenceOfVec2d;
typedef NCollection_Sequence<gp_XY> TColgp_SequenceOfXY;
typedef NCollection_Sequence<gp_XYZ> TColgp_SequenceOfXYZ;
/* end typedefs declaration */

/* harray1 classes */

class TColgp_HArray1OfLin2d : public NCollection_Array1<gp_Lin2d>, public Standard_Transient {
  public:
    TColgp_HArray1OfLin2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfLin2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Lin2d>::value_type& theValue);
    TColgp_HArray1OfLin2d(const NCollection_Array1<gp_Lin2d>& theOther);
    const NCollection_Array1<gp_Lin2d>& Array1();
    NCollection_Array1<gp_Lin2d>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfLin2d)


class TColgp_HArray1OfVec2d : public NCollection_Array1<gp_Vec2d>, public Standard_Transient {
  public:
    TColgp_HArray1OfVec2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfVec2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Vec2d>::value_type& theValue);
    TColgp_HArray1OfVec2d(const NCollection_Array1<gp_Vec2d>& theOther);
    const NCollection_Array1<gp_Vec2d>& Array1();
    NCollection_Array1<gp_Vec2d>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfVec2d)


class TColgp_HArray1OfXY : public NCollection_Array1<gp_XY>, public Standard_Transient {
  public:
    TColgp_HArray1OfXY(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfXY(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_XY>::value_type& theValue);
    TColgp_HArray1OfXY(const NCollection_Array1<gp_XY>& theOther);
    const NCollection_Array1<gp_XY>& Array1();
    NCollection_Array1<gp_XY>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfXY)


class TColgp_HArray1OfPnt : public NCollection_Array1<gp_Pnt>, public Standard_Transient {
  public:
    TColgp_HArray1OfPnt(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfPnt(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Pnt>::value_type& theValue);
    TColgp_HArray1OfPnt(const NCollection_Array1<gp_Pnt>& theOther);
    const NCollection_Array1<gp_Pnt>& Array1();
    NCollection_Array1<gp_Pnt>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfPnt)


class TColgp_HArray1OfXYZ : public NCollection_Array1<gp_XYZ>, public Standard_Transient {
  public:
    TColgp_HArray1OfXYZ(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfXYZ(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_XYZ>::value_type& theValue);
    TColgp_HArray1OfXYZ(const NCollection_Array1<gp_XYZ>& theOther);
    const NCollection_Array1<gp_XYZ>& Array1();
    NCollection_Array1<gp_XYZ>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfXYZ)


class TColgp_HArray1OfDir2d : public NCollection_Array1<gp_Dir2d>, public Standard_Transient {
  public:
    TColgp_HArray1OfDir2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfDir2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Dir2d>::value_type& theValue);
    TColgp_HArray1OfDir2d(const NCollection_Array1<gp_Dir2d>& theOther);
    const NCollection_Array1<gp_Dir2d>& Array1();
    NCollection_Array1<gp_Dir2d>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfDir2d)


class TColgp_HArray1OfVec : public NCollection_Array1<gp_Vec>, public Standard_Transient {
  public:
    TColgp_HArray1OfVec(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfVec(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Vec>::value_type& theValue);
    TColgp_HArray1OfVec(const NCollection_Array1<gp_Vec>& theOther);
    const NCollection_Array1<gp_Vec>& Array1();
    NCollection_Array1<gp_Vec>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfVec)


class TColgp_HArray1OfDir : public NCollection_Array1<gp_Dir>, public Standard_Transient {
  public:
    TColgp_HArray1OfDir(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfDir(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Dir>::value_type& theValue);
    TColgp_HArray1OfDir(const NCollection_Array1<gp_Dir>& theOther);
    const NCollection_Array1<gp_Dir>& Array1();
    NCollection_Array1<gp_Dir>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfDir)


class TColgp_HArray1OfPnt2d : public NCollection_Array1<gp_Pnt2d>, public Standard_Transient {
  public:
    TColgp_HArray1OfPnt2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfPnt2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Pnt2d>::value_type& theValue);
    TColgp_HArray1OfPnt2d(const NCollection_Array1<gp_Pnt2d>& theOther);
    const NCollection_Array1<gp_Pnt2d>& Array1();
    NCollection_Array1<gp_Pnt2d>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfPnt2d)


class TColgp_HArray1OfCirc2d : public NCollection_Array1<gp_Circ2d>, public Standard_Transient {
  public:
    TColgp_HArray1OfCirc2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    TColgp_HArray1OfCirc2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<gp_Circ2d>::value_type& theValue);
    TColgp_HArray1OfCirc2d(const NCollection_Array1<gp_Circ2d>& theOther);
    const NCollection_Array1<gp_Circ2d>& Array1();
    NCollection_Array1<gp_Circ2d>& ChangeArray1();
};
%make_alias(TColgp_HArray1OfCirc2d)

/* harray2 classes */
class TColgp_HArray2OfDir2d : public NCollection_Array2<gp_Dir2d>, public Standard_Transient {
  public:
    TColgp_HArray2OfDir2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfDir2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Dir2d>::value_type& theValue);
    TColgp_HArray2OfDir2d(const NCollection_Array2<gp_Dir2d>& theOther);
    const NCollection_Array2<gp_Dir2d>& Array2 ();
    NCollection_Array2<gp_Dir2d>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfDir2d)


class TColgp_HArray2OfVec2d : public NCollection_Array2<gp_Vec2d>, public Standard_Transient {
  public:
    TColgp_HArray2OfVec2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfVec2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Vec2d>::value_type& theValue);
    TColgp_HArray2OfVec2d(const NCollection_Array2<gp_Vec2d>& theOther);
    const NCollection_Array2<gp_Vec2d>& Array2 ();
    NCollection_Array2<gp_Vec2d>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfVec2d)


class TColgp_HArray2OfVec : public NCollection_Array2<gp_Vec>, public Standard_Transient {
  public:
    TColgp_HArray2OfVec(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfVec(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Vec>::value_type& theValue);
    TColgp_HArray2OfVec(const NCollection_Array2<gp_Vec>& theOther);
    const NCollection_Array2<gp_Vec>& Array2 ();
    NCollection_Array2<gp_Vec>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfVec)


class TColgp_HArray2OfPnt2d : public NCollection_Array2<gp_Pnt2d>, public Standard_Transient {
  public:
    TColgp_HArray2OfPnt2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfPnt2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Pnt2d>::value_type& theValue);
    TColgp_HArray2OfPnt2d(const NCollection_Array2<gp_Pnt2d>& theOther);
    const NCollection_Array2<gp_Pnt2d>& Array2 ();
    NCollection_Array2<gp_Pnt2d>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfPnt2d)


class TColgp_HArray2OfPnt : public NCollection_Array2<gp_Pnt>, public Standard_Transient {
  public:
    TColgp_HArray2OfPnt(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfPnt(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Pnt>::value_type& theValue);
    TColgp_HArray2OfPnt(const NCollection_Array2<gp_Pnt>& theOther);
    const NCollection_Array2<gp_Pnt>& Array2 ();
    NCollection_Array2<gp_Pnt>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfPnt)


class TColgp_HArray2OfXYZ : public NCollection_Array2<gp_XYZ>, public Standard_Transient {
  public:
    TColgp_HArray2OfXYZ(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfXYZ(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_XYZ>::value_type& theValue);
    TColgp_HArray2OfXYZ(const NCollection_Array2<gp_XYZ>& theOther);
    const NCollection_Array2<gp_XYZ>& Array2 ();
    NCollection_Array2<gp_XYZ>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfXYZ)


class TColgp_HArray2OfLin2d : public NCollection_Array2<gp_Lin2d>, public Standard_Transient {
  public:
    TColgp_HArray2OfLin2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfLin2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Lin2d>::value_type& theValue);
    TColgp_HArray2OfLin2d(const NCollection_Array2<gp_Lin2d>& theOther);
    const NCollection_Array2<gp_Lin2d>& Array2 ();
    NCollection_Array2<gp_Lin2d>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfLin2d)


class TColgp_HArray2OfXY : public NCollection_Array2<gp_XY>, public Standard_Transient {
  public:
    TColgp_HArray2OfXY(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfXY(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_XY>::value_type& theValue);
    TColgp_HArray2OfXY(const NCollection_Array2<gp_XY>& theOther);
    const NCollection_Array2<gp_XY>& Array2 ();
    NCollection_Array2<gp_XY>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfXY)


class TColgp_HArray2OfDir : public NCollection_Array2<gp_Dir>, public Standard_Transient {
  public:
    TColgp_HArray2OfDir(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfDir(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Dir>::value_type& theValue);
    TColgp_HArray2OfDir(const NCollection_Array2<gp_Dir>& theOther);
    const NCollection_Array2<gp_Dir>& Array2 ();
    NCollection_Array2<gp_Dir>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfDir)


class TColgp_HArray2OfCirc2d : public NCollection_Array2<gp_Circ2d>, public Standard_Transient {
  public:
    TColgp_HArray2OfCirc2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    TColgp_HArray2OfCirc2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<gp_Circ2d>::value_type& theValue);
    TColgp_HArray2OfCirc2d(const NCollection_Array2<gp_Circ2d>& theOther);
    const NCollection_Array2<gp_Circ2d>& Array2 ();
    NCollection_Array2<gp_Circ2d>& ChangeArray2 (); 
};
%make_alias(TColgp_HArray2OfCirc2d)


/* hsequence classes */
class TColgp_HSequenceOfXY : public NCollection_Sequence<gp_XY>, public Standard_Transient {
  public:
    TColgp_HSequenceOfXY();
    TColgp_HSequenceOfXY(const NCollection_Sequence<gp_XY>& theOther);
    const NCollection_Sequence<gp_XY>& Sequence();
    void Append (const NCollection_Sequence<gp_XY>::value_type& theItem);
    void Append (NCollection_Sequence<gp_XY>& theSequence);
    NCollection_Sequence<gp_XY>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfXY)


class TColgp_HSequenceOfPnt2d : public NCollection_Sequence<gp_Pnt2d>, public Standard_Transient {
  public:
    TColgp_HSequenceOfPnt2d();
    TColgp_HSequenceOfPnt2d(const NCollection_Sequence<gp_Pnt2d>& theOther);
    const NCollection_Sequence<gp_Pnt2d>& Sequence();
    void Append (const NCollection_Sequence<gp_Pnt2d>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Pnt2d>& theSequence);
    NCollection_Sequence<gp_Pnt2d>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfPnt2d)


class TColgp_HSequenceOfDir2d : public NCollection_Sequence<gp_Dir2d>, public Standard_Transient {
  public:
    TColgp_HSequenceOfDir2d();
    TColgp_HSequenceOfDir2d(const NCollection_Sequence<gp_Dir2d>& theOther);
    const NCollection_Sequence<gp_Dir2d>& Sequence();
    void Append (const NCollection_Sequence<gp_Dir2d>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Dir2d>& theSequence);
    NCollection_Sequence<gp_Dir2d>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfDir2d)


class TColgp_HSequenceOfPnt : public NCollection_Sequence<gp_Pnt>, public Standard_Transient {
  public:
    TColgp_HSequenceOfPnt();
    TColgp_HSequenceOfPnt(const NCollection_Sequence<gp_Pnt>& theOther);
    const NCollection_Sequence<gp_Pnt>& Sequence();
    void Append (const NCollection_Sequence<gp_Pnt>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Pnt>& theSequence);
    NCollection_Sequence<gp_Pnt>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfPnt)


class TColgp_HSequenceOfVec : public NCollection_Sequence<gp_Vec>, public Standard_Transient {
  public:
    TColgp_HSequenceOfVec();
    TColgp_HSequenceOfVec(const NCollection_Sequence<gp_Vec>& theOther);
    const NCollection_Sequence<gp_Vec>& Sequence();
    void Append (const NCollection_Sequence<gp_Vec>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Vec>& theSequence);
    NCollection_Sequence<gp_Vec>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfVec)


class TColgp_HSequenceOfXYZ : public NCollection_Sequence<gp_XYZ>, public Standard_Transient {
  public:
    TColgp_HSequenceOfXYZ();
    TColgp_HSequenceOfXYZ(const NCollection_Sequence<gp_XYZ>& theOther);
    const NCollection_Sequence<gp_XYZ>& Sequence();
    void Append (const NCollection_Sequence<gp_XYZ>::value_type& theItem);
    void Append (NCollection_Sequence<gp_XYZ>& theSequence);
    NCollection_Sequence<gp_XYZ>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfXYZ)


class TColgp_HSequenceOfDir : public NCollection_Sequence<gp_Dir>, public Standard_Transient {
  public:
    TColgp_HSequenceOfDir();
    TColgp_HSequenceOfDir(const NCollection_Sequence<gp_Dir>& theOther);
    const NCollection_Sequence<gp_Dir>& Sequence();
    void Append (const NCollection_Sequence<gp_Dir>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Dir>& theSequence);
    NCollection_Sequence<gp_Dir>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfDir)


class TColgp_HSequenceOfVec2d : public NCollection_Sequence<gp_Vec2d>, public Standard_Transient {
  public:
    TColgp_HSequenceOfVec2d();
    TColgp_HSequenceOfVec2d(const NCollection_Sequence<gp_Vec2d>& theOther);
    const NCollection_Sequence<gp_Vec2d>& Sequence();
    void Append (const NCollection_Sequence<gp_Vec2d>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Vec2d>& theSequence);
    NCollection_Sequence<gp_Vec2d>& ChangeSequence();
};
%make_alias(TColgp_HSequenceOfVec2d)


/* class aliases */
%pythoncode {
}
