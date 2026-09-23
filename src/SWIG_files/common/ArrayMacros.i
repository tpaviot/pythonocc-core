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

%{
#include <Standard_DimensionError.hxx>
#include <Standard_OutOfRange.hxx>
%}

/* macros */

/*
The python sequence protocol, with 0-based indices (negative indices count
from the end). __getitem__, __setitem__ and __len__ are C++ methods: a single
call, rather than a python method calling Lower, Upper and Value. __getitem__
returns a copy, like Value (see the const SWIGTYPE & typemap of
FunctionTransformers.i). Standard_OutOfRange is raised as an IndexError
*/
%define Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
        const T& __getitem__(int index) {
            const int length = self->Length();
            if (index < 0) {
                index += length;
            }
            if (index < 0 || index >= length) {
                throw Standard_OutOfRange("array index out of range");
            }
            return self->Value(self->Lower() + index);
        }

        void __setitem__(int index, const T& value) {
            const int length = self->Length();
            if (index < 0) {
                index += length;
            }
            if (index < 0 || index >= length) {
                throw Standard_OutOfRange("array assignment index out of range");
            }
            self->SetValue(self->Lower() + index, value);
        }

        int __len__() {
            return self->Length();
        }

        %pythoncode {
        def __iter__(self):
            value = self.Value
            for i in range(self.Lower(), self.Upper() + 1):
                yield value(i)
        }
    };

%enddef

%define Array1NumpyTemplate(name, array_dtype, T)

    %template(name) NCollection_Array1<T>;

    Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
        void AddDataFromNumpyArray(array_dtype* numpyArray1, int nRows1) {
            if (nRows1 != self->Length()) {
                throw Standard_DimensionError("The numpy array and the NCollection_Array1 don't have the same length");
            }
            for (int rowID = 0; rowID < nRows1; rowID++)
            {
                array_dtype v = numpyArray1[rowID];
                self->SetValue(rowID + self->Lower(), v);
            }
        }

        void BuildNumpyArray(array_dtype* numpyArray1Argout, int nRows1Argout) {
            if (nRows1Argout > self->Length()) {
                throw Standard_DimensionError("The numpy array is larger than the NCollection_Array1");
            }
            for (int rowID = 0; rowID < nRows1Argout; rowID++)
            {
                T v = self->Value(rowID + self->Lower());
                numpyArray1Argout[rowID] = v;
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            inst = cls(1, len(arr))
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(self.Length())

        }
    };

%enddef

%define Array2NumpyTemplate(name, array_dtype, T)

    %template(name) NCollection_Array2<T>;

    %extend NCollection_Array2<T> {
        void AddDataFromNumpyArray(array_dtype* numpyArray2, int nRows2, int nCols2) {
            if (nRows2 != self->ColLength() || nCols2 != self->RowLength()) {
                throw Standard_DimensionError("The numpy array and the NCollection_Array2 don't have the same shape");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                for (int colID = 0; colID < nCols2; colID++)
                {
                    array_dtype v = numpyArray2[flatID];
                    flatID += 1;
                    self->SetValue(rowID + self->LowerRow(), colID + self->LowerCol(), v);
                }
            }
        }

        void BuildNumpyArray(array_dtype* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nCols2Argout) {
            if (nRows2Argout > self->ColLength() || nCols2Argout > self->RowLength()
                || aSizeArgout < nRows2Argout * nCols2Argout) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2Argout; rowID++)
            {
                for (int colID = 0; colID < nCols2Argout; colID++)
                {
                    T v = self->Value(rowID + self->LowerRow(), colID + self->LowerCol());
                    numpyArray2Argout[flatID] = v;
                    flatID += 1;
                }
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            n_rows, n_cols = arr.shape
            inst = cls(1, n_rows, 1, n_cols)
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(self.Size(), self.ColLength(), self.RowLength()).reshape(self.ColLength(), self.RowLength())

        }
    };

%enddef

%define Array1Of2DNumpyTemplate(name, T)

    %template(name) NCollection_Array1<T>;

    Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
        void AddDataFromNumpyArray(double* numpyArray2, int nRows2, int nDims2) {
            if (nRows2 != self->Length() || nDims2 < 2) {
                throw Standard_DimensionError("The numpy array doesn't match the NCollection_Array1 length and point dimension");
            }
            double x=0., y=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                x = numpyArray2[flatID];
                y = numpyArray2[flatID + 1];
                flatID += nDims2;
                self->SetValue(rowID + self->Lower(), T(x, y));
            }
        }

        void BuildNumpyArray(double* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nDims2Argout) {
            if (nRows2Argout > self->Length() || nDims2Argout < 2
                || aSizeArgout < nRows2Argout * nDims2Argout) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2Argout; rowID++)
            {
                T v = self->Value(rowID + self->Lower());
                numpyArray2Argout[flatID] = v.X();
                numpyArray2Argout[flatID + 1] = v.Y();
                flatID += nDims2Argout;
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            inst = cls(1, len(arr))
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(self.Size() * 2, self.Length(), 2).reshape(self.Length(), 2)

        }
    };

%enddef

%define Array1Of3DNumpyTemplate(name, T)

    %template(name) NCollection_Array1<T>;

    Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
        void AddDataFromNumpyArray(double* numpyArray2, int nRows2, int nDims2) {
            if (nRows2 != self->Length() || nDims2 < 3) {
                throw Standard_DimensionError("The numpy array doesn't match the NCollection_Array1 length and point dimension");
            }
            double x=0., y=0., z=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                x = numpyArray2[flatID];
                y = numpyArray2[flatID + 1];
                z = numpyArray2[flatID + 2];
                flatID += nDims2;
                self->SetValue(rowID + self->Lower(), T(x, y, z));
            }
        }

        void BuildNumpyArray(double* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nDims2Argout) {
            if (nRows2Argout > self->Length() || nDims2Argout < 3
                || aSizeArgout < nRows2Argout * nDims2Argout) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2Argout; rowID++)
            {
                T v = self->Value(rowID + self->Lower());
                numpyArray2Argout[flatID] = v.X();
                numpyArray2Argout[flatID + 1] = v.Y();
                numpyArray2Argout[flatID + 2] = v.Z();
                flatID += nDims2Argout;
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            inst = cls(1, len(arr))
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(self.Size() * 3, self.Length(), 3).reshape(self.Length(), 3)

        }
    };

%enddef

%define Array1OfTriaNumpyTemplate(name, T)

    %template(name) NCollection_Array1<T>;

    Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
        void AddDataFromNumpyArray(long long* numpyArray2, int nRows2, int nDims2) {
            if (nRows2 != self->Length() || nDims2 < 3) {
                throw Standard_DimensionError("The numpy array doesn't match the NCollection_Array1 length and point dimension");
            }
            long long p1=0, p2=0, p3=0;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                p1 = numpyArray2[flatID];
                p2 = numpyArray2[flatID + 1];
                p3 = numpyArray2[flatID + 2];
                flatID += nDims2;
                self->SetValue(rowID + self->Lower(), T(p1, p2, p3));
            }
        }

        void BuildNumpyArray(long long* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nDims2Argout) {
            if (nRows2Argout > self->Length() || nDims2Argout < 3
                || aSizeArgout < nRows2Argout * nDims2Argout) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2Argout; rowID++)
            {
                T tria = self->Value(rowID + self->Lower());
                numpyArray2Argout[flatID] = tria.Value(1);
                numpyArray2Argout[flatID + 1] = tria.Value(2);
                numpyArray2Argout[flatID + 2] = tria.Value(3);
                flatID += nDims2Argout;
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            inst = cls(1, len(arr))
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(self.Size() * 3, self.Length(), 3).reshape(self.Length(), 3)

        }
    };

%enddef

%define Array2Of2DNumpyTemplate(name, T)

    %template(name) NCollection_Array2<T>;

    %extend NCollection_Array2<T> {
        void AddDataFromNumpyArray(double* numpyArray3, int nRows3, int nCols3, int nDims3) {
            if (nRows3 != self->ColLength() || nCols3 != self->RowLength() || nDims3 < 2) {
                throw Standard_DimensionError("The numpy array doesn't match the NCollection_Array2 shape and point dimension");
            }
            double x=0., y=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows3; rowID++)
            {
                for (int colID = 0; colID < nCols3; colID++)
                {
                    x = numpyArray3[flatID];
                    y = numpyArray3[flatID + 1];
                    flatID += nDims3;
                    self->SetValue(rowID + self->LowerRow(), colID + self->LowerCol(), T(x, y));
                }
            }
        }

        void BuildNumpyArray(double* numpyArray3Argout, int aSizeArgout, int nRows3Argout, int nCols3Argout, int nDims3Argout) {
            if (nRows3Argout > self->ColLength() || nCols3Argout > self->RowLength()
                || nDims3Argout < 2 || aSizeArgout < nRows3Argout * nCols3Argout * nDims3Argout) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows3Argout; rowID++)
            {
                for (int colID = 0; colID < nCols3Argout; colID++)
                {
                    T v = self->Value(rowID + self->LowerRow(), colID + self->LowerCol());
                    numpyArray3Argout[flatID] = v.X();
                    numpyArray3Argout[flatID + 1] = v.Y();
                    flatID += nDims3Argout;
                }
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            n_rows, n_cols = arr.shape[:-1]
            inst = cls(1, n_rows, 1, n_cols)
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(
                self.Size() * 2, self.ColLength(), self.RowLength(), 2
            ).reshape(self.ColLength(), self.RowLength(), 2)

        }
    };

%enddef

%define Array2Of3DNumpyTemplate(name, T)

    %template(name) NCollection_Array2<T>;

    %extend NCollection_Array2<T> {
        void AddDataFromNumpyArray(double* numpyArray3, int nRows3, int nCols3, int nDims3) {
            if (nRows3 != self->ColLength() || nCols3 != self->RowLength() || nDims3 < 3) {
                throw Standard_DimensionError("The numpy array doesn't match the NCollection_Array2 shape and point dimension");
            }
            double x=0., y=0., z=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows3; rowID++)
            {
                for (int colID = 0; colID < nCols3; colID++)
                {
                    x = numpyArray3[flatID];
                    y = numpyArray3[flatID + 1];
                    z = numpyArray3[flatID + 2];
                    flatID += nDims3;
                    self->SetValue(rowID + self->LowerRow(), colID + self->LowerCol(), T(x, y, z));
                }
            }
        }

        void BuildNumpyArray(double* numpyArray3Argout, int aSizeArgout, int nRows3Argout, int nCols3Argout, int nDims3Argout) {
            if (nRows3Argout > self->ColLength() || nCols3Argout > self->RowLength()
                || nDims3Argout < 3 || aSizeArgout < nRows3Argout * nCols3Argout * nDims3Argout) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRows3Argout; rowID++)
            {
                for (int colID = 0; colID < nCols3Argout; colID++)
                {
                    T v = self->Value(rowID + self->LowerRow(), colID + self->LowerCol());
                    numpyArray3Argout[flatID] = v.X();
                    numpyArray3Argout[flatID + 1] = v.Y();
                    numpyArray3Argout[flatID + 2] = v.Z();
                    flatID += nDims3Argout;
                }
            }
        }

        %pythoncode {
        @classmethod
        def from_numpy_array(cls, arr):
            n_rows, n_cols = arr.shape[:-1]
            inst = cls(1, n_rows, 1, n_cols)
            inst.AddDataFromNumpyArray(arr)
            return inst

        def to_numpy_array(self):
            return self.BuildNumpyArray(
                self.Size() * 3, self.ColLength(), self.RowLength(), 3
            ).reshape(self.ColLength(), self.RowLength(), 3)

        }
    };

%enddef

%define CurveArrayEvalExtend(T)
    %extend T{
        void evalNumpy(double* numpyArrayU, int nRowsU, double* numpyArrayResultArgout, int aSizeArgout, int nDimsResult) {
            if (nDimsResult < 3 || aSizeArgout < nRowsU * nDimsResult) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRowsU; rowID++)
            {
                double u = numpyArrayU[rowID];
                gp_Pnt res = self->Value(u);
                numpyArrayResultArgout[flatID] = res.X();
                numpyArrayResultArgout[flatID + 1] = res.Y();
                numpyArrayResultArgout[flatID + 2] = res.Z();
                flatID += nDimsResult;
            }
        }

        void evalDerivativeNumpy(double* numpyArrayU, int nRowsU, double* numpyArrayResultArgout, int aSizeArgout, int nDimsResult, int nU) {
            if (nDimsResult < 3 || aSizeArgout < nRowsU * nDimsResult) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRowsU; rowID++)
            {
                double u = numpyArrayU[rowID];
                gp_Vec res = self->DN(u, nU);
                numpyArrayResultArgout[flatID] = res.X();
                numpyArrayResultArgout[flatID + 1] = res.Y();
                numpyArrayResultArgout[flatID + 2] = res.Z();
                flatID += nDimsResult;
            }
        }

        %pythoncode {
        def eval_numpy_array(self, u_arr):
            return self.evalNumpy(u_arr, len(u_arr) * 3, 3).reshape(-1, 3)

        def eval_derivative_numpy_array(self, u_arr, n_u):
            return self.evalDerivativeNumpy(u_arr, len(u_arr) * 3, 3, n_u).reshape(-1, 3)
        }

    };

%enddef


%define SurfaceArrayEvalExtend(T)
    %extend T{
        void evalNumpy(double* numpyArrayUV, int nRowsUV, int nColUV, double* numpyArrayResultArgout, int aSizeArgout, int nDimsResult) {
            if (nColUV < 2 || nDimsResult < 3 || aSizeArgout < nRowsUV * nDimsResult) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRowsUV; rowID++)
            {
                double u = numpyArrayUV[rowID * nColUV];
                double v = numpyArrayUV[rowID * nColUV + 1];
                gp_Pnt res = self->Value(u, v);
                numpyArrayResultArgout[flatID] = res.X();
                numpyArrayResultArgout[flatID + 1] = res.Y();
                numpyArrayResultArgout[flatID + 2] = res.Z();
                flatID += nDimsResult;
            }
        }

        void evalDerivativeNumpy(double* numpyArrayUV, int nRowsUV, int nColUV, double* numpyArrayResultArgout, int aSizeArgout, int nDimsResult, int nU, int nV) {
            if (nColUV < 2 || nDimsResult < 3 || aSizeArgout < nRowsUV * nDimsResult) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRowsUV; rowID++)
            {
                double u = numpyArrayUV[rowID * nColUV];
                double v = numpyArrayUV[rowID * nColUV + 1];
                gp_Vec res = self->DN(u, v, nU, nV);
                numpyArrayResultArgout[flatID] = res.X();
                numpyArrayResultArgout[flatID + 1] = res.Y();
                numpyArrayResultArgout[flatID + 2] = res.Z();
                flatID += nDimsResult;
            }
        }

        %pythoncode {
        def eval_numpy_array(self, u_arr):
            return self.evalNumpy(u_arr, len(u_arr) * 3, 3).reshape(-1, 3)

        def eval_derivative_numpy_array(self, u_arr, n_u, n_v):
            return self.evalDerivativeNumpy(u_arr, len(u_arr) * 3, 3, n_u, n_v).reshape(-1, 3)
        }

    };

%enddef

%define Curve2dArrayEvalExtend(T)
    %extend T{
        void evalNumpy(double* numpyArrayU, int nRowsU, double* numpyArrayResultArgout, int aSizeArgout, int nDimsResult) {
            if (nDimsResult < 2 || aSizeArgout < nRowsU * nDimsResult) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRowsU; rowID++)
            {
                double u = numpyArrayU[rowID];
                gp_Pnt2d res = self->Value(u);
                numpyArrayResultArgout[flatID] = res.X();
                numpyArrayResultArgout[flatID + 1] = res.Y();
                flatID += nDimsResult;
            }
        }

        void evalDerivativeNumpy(double* numpyArrayU, int nRowsU, double* numpyArrayResultArgout, int aSizeArgout, int nDimsResult, int nU) {
            if (nDimsResult < 2 || aSizeArgout < nRowsU * nDimsResult) {
                throw Standard_DimensionError("Inconsistent numpy array size");
            }
            int flatID = 0;

            for (int rowID = 0; rowID < nRowsU; rowID++)
            {
                double u = numpyArrayU[rowID];
                gp_Vec2d res = self->DN(u, nU);
                numpyArrayResultArgout[flatID] = res.X();
                numpyArrayResultArgout[flatID + 1] = res.Y();
                flatID += nDimsResult;
            }
        }

        %pythoncode {
        def eval_numpy_array(self, u_arr):
            return self.evalNumpy(u_arr, len(u_arr) * 2, 2).reshape(-1, 2)

        def eval_derivative_numpy_array(self, u_arr, n_u):
            return self.evalDerivativeNumpy(u_arr, len(u_arr) * 2, 2, n_u).reshape(-1, 2)
        }

    };

%enddef

/* end macros declaration */