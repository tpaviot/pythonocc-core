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

/* macros */

%define Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
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

%enddef

%define Array1NumpyTemplate(name, array_dtype, T)

    %template(name) NCollection_Array1<T>;

    Array1ExtendIter(T)

    %extend NCollection_Array1<T> {
        void AddDataFromNumpyArray(array_dtype* numpyArray1, int nRows1) {
            for (int rowID = 0; rowID < nRows1; rowID++)
            {
                array_dtype v = numpyArray1[rowID];
                self->SetValue(rowID + 1, v);
            }
        }

        void BuildNumpyArray(array_dtype* numpyArray1Argout, int nRows1Argout) {
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
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                for (int colID = 0; colID < nCols2; colID++)
                {
                    array_dtype v = numpyArray2[flatID];
                    flatID += 1;
                    self->SetValue(rowID + 1, colID + 1, v);
                }
            }
        }

        void BuildNumpyArray(array_dtype* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nCols2Argout) {
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
            double x=0., y=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                x = numpyArray2[flatID];
                y = numpyArray2[flatID + 1];
                flatID += nDims2;
                self->SetValue(rowID + 1, T(x, y));
            }
        }

        void BuildNumpyArray(double* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nDims2Argout) {
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
            double x=0., y=0., z=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                x = numpyArray2[flatID];
                y = numpyArray2[flatID + 1];
                z = numpyArray2[flatID + 2];
                flatID += nDims2;
                self->SetValue(rowID + 1, T(x, y, z));
            }
        }

        void BuildNumpyArray(double* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nDims2Argout) {
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
            long long p1=0, p2=0, p3=0;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows2; rowID++)
            {
                p1 = numpyArray2[flatID];
                p2 = numpyArray2[flatID + 1];
                p3 = numpyArray2[flatID + 2];
                flatID += nDims2;
                self->SetValue(rowID + 1, T(p1, p2, p3));
            }
        }

        void BuildNumpyArray(long long* numpyArray2Argout, int aSizeArgout, int nRows2Argout, int nDims2Argout) {
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
            double x=0., y=0.;
            int flatID = 0;

            for (int rowID = 0; rowID < nRows3; rowID++)
            {
                for (int colID = 0; colID < nCols3; colID++)
                {
                    x = numpyArray3[flatID];
                    y = numpyArray3[flatID + 1];
                    flatID += nDims3;
                    self->SetValue(rowID + 1, colID + 1, T(x, y));
                }
            }
        }

        void BuildNumpyArray(double* numpyArray3Argout, int aSizeArgout, int nRows3Argout, int nCols3Argout, int nDims3Argout) {
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
                    self->SetValue(rowID + 1, colID + 1, T(x, y, z));
                }
            }
        }

        void BuildNumpyArray(double* numpyArray3Argout, int aSizeArgout, int nRows3Argout, int nCols3Argout, int nDims3Argout) {
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