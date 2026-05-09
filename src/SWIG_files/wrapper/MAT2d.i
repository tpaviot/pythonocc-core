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
%define MAT2DDOCSTRING
"MAT2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_mat2d.html"
%enddef
%module (package="OCC.Core", docstring=MAT2DDOCSTRING) MAT2d


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
#include<MAT2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<MAT_module.hxx>
#include<Bisector_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i
%import TColStd.i
%import Geom2d.i
%import gp.i
%import MAT.i
%import Bisector.i

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
%wrap_handle(MAT2d_Circuit)
%wrap_handle(MAT2d_Connexion)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<MAT2d_BiInt,int>::Items;
%ignore NCollection_DataMap<MAT2d_BiInt,int>::KeyValues;
%template(MAT2d_DataMapOfBiIntInteger) NCollection_DataMap<MAT2d_BiInt,int>;
%ignore NCollection_DataMap<MAT2d_BiInt,TColStd_SequenceOfInteger>::Items;
%ignore NCollection_DataMap<MAT2d_BiInt,TColStd_SequenceOfInteger>::KeyValues;
%template(MAT2d_DataMapOfBiIntSequenceOfInteger) NCollection_DataMap<MAT2d_BiInt,TColStd_SequenceOfInteger>;
%ignore NCollection_DataMap<int,Bisector_Bisec>::Items;
%ignore NCollection_DataMap<int,Bisector_Bisec>::KeyValues;
%template(MAT2d_DataMapOfIntegerBisec) NCollection_DataMap<int,Bisector_Bisec>;

%extend NCollection_DataMap<int,Bisector_Bisec> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT2d_DataMapOfIntegerBisec::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%ignore NCollection_DataMap<int,opencascade::handle<MAT2d_Connexion>>::Items;
%ignore NCollection_DataMap<int,opencascade::handle<MAT2d_Connexion>>::KeyValues;
%template(MAT2d_DataMapOfIntegerConnexion) NCollection_DataMap<int,opencascade::handle<MAT2d_Connexion>>;

%extend NCollection_DataMap<int,opencascade::handle<MAT2d_Connexion>> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT2d_DataMapOfIntegerConnexion::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%ignore NCollection_DataMap<int,gp_Pnt2d>::Items;
%ignore NCollection_DataMap<int,gp_Pnt2d>::KeyValues;
%template(MAT2d_DataMapOfIntegerPnt2d) NCollection_DataMap<int,gp_Pnt2d>;

%extend NCollection_DataMap<int,gp_Pnt2d> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT2d_DataMapOfIntegerPnt2d::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%ignore NCollection_DataMap<int,MAT2d_SequenceOfConnexion>::Items;
%ignore NCollection_DataMap<int,MAT2d_SequenceOfConnexion>::KeyValues;
%template(MAT2d_DataMapOfIntegerSequenceOfConnexion) NCollection_DataMap<int,MAT2d_SequenceOfConnexion>;

%extend NCollection_DataMap<int,MAT2d_SequenceOfConnexion> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT2d_DataMapOfIntegerSequenceOfConnexion::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%ignore NCollection_DataMap<int,gp_Vec2d>::Items;
%ignore NCollection_DataMap<int,gp_Vec2d>::KeyValues;
%template(MAT2d_DataMapOfIntegerVec2d) NCollection_DataMap<int,gp_Vec2d>;

%extend NCollection_DataMap<int,gp_Vec2d> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT2d_DataMapOfIntegerVec2d::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MAT2d_SequenceOfConnexion) NCollection_Sequence<opencascade::handle<MAT2d_Connexion>>;

%extend NCollection_Sequence<opencascade::handle<MAT2d_Connexion>> {
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
%template(MAT2d_SequenceOfSequenceOfCurve) NCollection_Sequence<TColGeom2d_SequenceOfCurve>;

%extend NCollection_Sequence<TColGeom2d_SequenceOfCurve> {
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
%template(MAT2d_SequenceOfSequenceOfGeometry) NCollection_Sequence<TColGeom2d_SequenceOfGeometry>;

%extend NCollection_Sequence<TColGeom2d_SequenceOfGeometry> {
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
typedef NCollection_Array2<opencascade::handle<MAT2d_Connexion>> MAT2d_Array2OfConnexion;
typedef NCollection_DataMap<MAT2d_BiInt, int>::Iterator MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
typedef NCollection_DataMap<MAT2d_BiInt, TColStd_SequenceOfInteger>::Iterator MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
typedef NCollection_DataMap<int, Bisector_Bisec>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
typedef NCollection_DataMap<int, opencascade::handle<MAT2d_Connexion>>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
typedef NCollection_DataMap<int, gp_Pnt2d>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
typedef NCollection_DataMap<int, MAT2d_SequenceOfConnexion>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
typedef NCollection_DataMap<int, gp_Vec2d>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
typedef NCollection_DataMap<MAT2d_BiInt, int> MAT2d_DataMapOfBiIntInteger;
typedef NCollection_DataMap<MAT2d_BiInt, TColStd_SequenceOfInteger> MAT2d_DataMapOfBiIntSequenceOfInteger;
typedef NCollection_DataMap<int, Bisector_Bisec> MAT2d_DataMapOfIntegerBisec;
typedef NCollection_DataMap<int, opencascade::handle<MAT2d_Connexion>> MAT2d_DataMapOfIntegerConnexion;
typedef NCollection_DataMap<int, gp_Pnt2d> MAT2d_DataMapOfIntegerPnt2d;
typedef NCollection_DataMap<int, MAT2d_SequenceOfConnexion> MAT2d_DataMapOfIntegerSequenceOfConnexion;
typedef NCollection_DataMap<int, gp_Vec2d> MAT2d_DataMapOfIntegerVec2d;
typedef NCollection_Sequence<opencascade::handle<MAT2d_Connexion>> MAT2d_SequenceOfConnexion;
typedef NCollection_Sequence<TColGeom2d_SequenceOfCurve> MAT2d_SequenceOfSequenceOfCurve;
typedef NCollection_Sequence<TColGeom2d_SequenceOfGeometry> MAT2d_SequenceOfSequenceOfGeometry;
/* end typedefs declaration */

/********************
* class MAT2d_BiInt *
********************/
class MAT2d_BiInt {
	public:
		/****** MAT2d_BiInt::MAT2d_BiInt ******/
		/****** md5 signature: 1cbb581b673b39b548ea7b70d8243ace ******/
		%feature("compactdefaultargs") MAT2d_BiInt;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int

Return
-------
None

Description
-----------
No available documentation.
") MAT2d_BiInt;
		 MAT2d_BiInt(const int I1, const int I2);

		/****** MAT2d_BiInt::FirstIndex ******/
		/****** md5 signature: c2b7b4d6b4f0ddb59b0587df9e596c4e ******/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FirstIndex;
		int FirstIndex();

		/****** MAT2d_BiInt::FirstIndex ******/
		/****** md5 signature: f98c1a2e064d8ebf96dd9c59a57334e2 ******/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "
Parameters
----------
I1: int

Return
-------
None

Description
-----------
No available documentation.
") FirstIndex;
		void FirstIndex(const int I1);

		/****** MAT2d_BiInt::IsEqual ******/
		/****** md5 signature: ae454d5d97a7cc37345e7c65a4189e8f ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
B: MAT2d_BiInt

Return
-------
bool

Description
-----------
No available documentation.
") IsEqual;
		bool IsEqual(const MAT2d_BiInt & B);

		/****** MAT2d_BiInt::SecondIndex ******/
		/****** md5 signature: 431cb9ad8256a1ede42d510fad3f52b3 ******/
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SecondIndex;
		int SecondIndex();

		/****** MAT2d_BiInt::SecondIndex ******/
		/****** md5 signature: 857ae16753f236f81e40733e46354559 ******/
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", "
Parameters
----------
I2: int

Return
-------
None

Description
-----------
No available documentation.
") SecondIndex;
		void SecondIndex(const int I2);


%extend{
    bool __eq_wrapper__(const MAT2d_BiInt other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend MAT2d_BiInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class MAT2d_Circuit *
**********************/
class MAT2d_Circuit : public Standard_Transient {
	public:
		/****** MAT2d_Circuit::MAT2d_Circuit ******/
		/****** md5 signature: 2c41fd20290af559362f32d3056b3762 ******/
		%feature("compactdefaultargs") MAT2d_Circuit;
		%feature("autodoc", "
Parameters
----------
aJoinType: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") MAT2d_Circuit;
		 MAT2d_Circuit(const GeomAbs_JoinType aJoinType = GeomAbs_Arc, const bool IsOpenResult = false);

		/****** MAT2d_Circuit::Connexion ******/
		/****** md5 signature: b88d26be5064c3638e01f1cbcb1abc21 ******/
		%feature("compactdefaultargs") Connexion;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT2d_Connexion>

Description
-----------
Returns the Connexion on the item <Index> in me.
") Connexion;
		opencascade::handle<MAT2d_Connexion> Connexion(const int Index);

		/****** MAT2d_Circuit::ConnexionOn ******/
		/****** md5 signature: c32b8e5291c9fea745450407fdcb8a5d ******/
		%feature("compactdefaultargs") ConnexionOn;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns <True> is there is a connexion on the item <Index> in <self>.
") ConnexionOn;
		bool ConnexionOn(const int Index);

		/****** MAT2d_Circuit::LineLength ******/
		/****** md5 signature: 177459723a221e97869f5201b5fa9b9a ******/
		%feature("compactdefaultargs") LineLength;
		%feature("autodoc", "
Parameters
----------
IndexLine: int

Return
-------
int

Description
-----------
Returns the number of items on the line <IndexLine>.
") LineLength;
		int LineLength(const int IndexLine);

		/****** MAT2d_Circuit::NumberOfItems ******/
		/****** md5 signature: 73d110ccea72b5d023475507d3e849af ******/
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Number of Items .
") NumberOfItems;
		int NumberOfItems();

		/****** MAT2d_Circuit::Perform ******/
		/****** md5 signature: 998aade1985a18b25950ca87349c5c1f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
aFigure: NCollection_Sequence<TColGeom2d_SequenceOfGeometry >
IsClosed: TColStd_SequenceOfBoolean
IndRefLine: int
Trigo: bool

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(NCollection_Sequence<TColGeom2d_SequenceOfGeometry > & aFigure, const TColStd_SequenceOfBoolean & IsClosed, const int IndRefLine, const bool Trigo);

		/****** MAT2d_Circuit::RefToEqui ******/
		/****** md5 signature: 772616c2e19b113067904e5ba8af6988 ******/
		%feature("compactdefaultargs") RefToEqui;
		%feature("autodoc", "
Parameters
----------
IndLine: int
IndCurve: int

Return
-------
TColStd_SequenceOfInteger

Description
-----------
Returns the set of index of the items in <self>corresponding to the curve <IndCurve> on the line <IndLine> from the initial figure.
") RefToEqui;
		const TColStd_SequenceOfInteger & RefToEqui(const int IndLine, const int IndCurve);

		/****** MAT2d_Circuit::Value ******/
		/****** md5 signature: 4ba4404f3282d32f220058a0d13e6c74 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Returns the item at position <Index> in <self>.
") Value;
		opencascade::handle<Geom2d_Geometry> Value(const int Index);

};


%make_alias(MAT2d_Circuit)

%extend MAT2d_Circuit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class MAT2d_Connexion *
************************/
class MAT2d_Connexion : public Standard_Transient {
	public:
		/****** MAT2d_Connexion::MAT2d_Connexion ******/
		/****** md5 signature: 3839f447b9973506e7c31a3c602f8582 ******/
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT2d_Connexion;
		 MAT2d_Connexion();

		/****** MAT2d_Connexion::MAT2d_Connexion ******/
		/****** md5 signature: ce7bd3159c0854d24bf22203c0c77b08 ******/
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", "
Parameters
----------
LineA: int
LineB: int
ItemA: int
ItemB: int
Distance: double
ParameterOnA: double
ParameterOnB: double
PointA: gp_Pnt2d
PointB: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") MAT2d_Connexion;
		 MAT2d_Connexion(const int LineA, const int LineB, const int ItemA, const int ItemB, const double Distance, const double ParameterOnA, const double ParameterOnB, const gp_Pnt2d & PointA, const gp_Pnt2d & PointB);

		/****** MAT2d_Connexion::Distance ******/
		/****** md5 signature: 4132595ec8b1977b3cfc8920d72365c4 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the distance between the two points.
") Distance;
		double Distance();

		/****** MAT2d_Connexion::Distance ******/
		/****** md5 signature: 88a0a76023cc524d009e464c5cbb8f6b ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
aDistance: double

Return
-------
None

Description
-----------
No available documentation.
") Distance;
		void Distance(const double aDistance);

		/****** MAT2d_Connexion::Dump ******/
		/****** md5 signature: 80020b5ebb73e4528ffd0899ab5418e2 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Deep: int (optional, default to 0)
Offset: int (optional, default to 0)

Return
-------
None

Description
-----------
Print <self>.
") Dump;
		void Dump(const int Deep = 0, const int Offset = 0);

		/****** MAT2d_Connexion::IndexFirstLine ******/
		/****** md5 signature: 4ba399481837ae0fcad56ddbf52ffc95 ******/
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index on the first line.
") IndexFirstLine;
		int IndexFirstLine();

		/****** MAT2d_Connexion::IndexFirstLine ******/
		/****** md5 signature: 915874b37f9e7bca6a0f5d7d027a7f34 ******/
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", "
Parameters
----------
anIndex: int

Return
-------
None

Description
-----------
No available documentation.
") IndexFirstLine;
		void IndexFirstLine(const int anIndex);

		/****** MAT2d_Connexion::IndexItemOnFirst ******/
		/****** md5 signature: 8bfce618e9258056c30d6ff373323570 ******/
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index of the item on the first line.
") IndexItemOnFirst;
		int IndexItemOnFirst();

		/****** MAT2d_Connexion::IndexItemOnFirst ******/
		/****** md5 signature: 8432d8b893955a4dc97fc03f27e3f872 ******/
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", "
Parameters
----------
anIndex: int

Return
-------
None

Description
-----------
No available documentation.
") IndexItemOnFirst;
		void IndexItemOnFirst(const int anIndex);

		/****** MAT2d_Connexion::IndexItemOnSecond ******/
		/****** md5 signature: 9f2c32bb0140017744c1a81ffffe899c ******/
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index of the item on the second line.
") IndexItemOnSecond;
		int IndexItemOnSecond();

		/****** MAT2d_Connexion::IndexItemOnSecond ******/
		/****** md5 signature: 5f3f291170c8a0ae989567a1334c92a1 ******/
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", "
Parameters
----------
anIndex: int

Return
-------
None

Description
-----------
No available documentation.
") IndexItemOnSecond;
		void IndexItemOnSecond(const int anIndex);

		/****** MAT2d_Connexion::IndexSecondLine ******/
		/****** md5 signature: f844fef6eee01f557100bad6c42fdf1e ******/
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index on the Second line.
") IndexSecondLine;
		int IndexSecondLine();

		/****** MAT2d_Connexion::IndexSecondLine ******/
		/****** md5 signature: ed5b8622d06188683728acc0d8bbd810 ******/
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", "
Parameters
----------
anIndex: int

Return
-------
None

Description
-----------
No available documentation.
") IndexSecondLine;
		void IndexSecondLine(const int anIndex);

		/****** MAT2d_Connexion::IsAfter ******/
		/****** md5 signature: 216ff8eee2d461999120fb61c683c201 ******/
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "
Parameters
----------
aConnexion: MAT2d_Connexion
aSense: double

Return
-------
bool

Description
-----------
Returns <True> if my firstPoint is on the same line than the firstpoint of <aConnexion> and my firstpoint is after the firstpoint of <aConnexion> on the line. <aSense> = 1 if <aConnexion> is on the Left of its firstline, else <aSense> = -1.
") IsAfter;
		bool IsAfter(const opencascade::handle<MAT2d_Connexion> & aConnexion, const double aSense);

		/****** MAT2d_Connexion::ParameterOnFirst ******/
		/****** md5 signature: 3cf218c78795997e9d73f5784af37809 ******/
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the firstline.
") ParameterOnFirst;
		double ParameterOnFirst();

		/****** MAT2d_Connexion::ParameterOnFirst ******/
		/****** md5 signature: 3035bffcb63a9540dbbd957949658dac ******/
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", "
Parameters
----------
aParameter: double

Return
-------
None

Description
-----------
No available documentation.
") ParameterOnFirst;
		void ParameterOnFirst(const double aParameter);

		/****** MAT2d_Connexion::ParameterOnSecond ******/
		/****** md5 signature: bdd5fb511ef7223a92419113d5a18e8f ******/
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the secondline.
") ParameterOnSecond;
		double ParameterOnSecond();

		/****** MAT2d_Connexion::ParameterOnSecond ******/
		/****** md5 signature: 7477a66107d0203cc1758e919e75d196 ******/
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", "
Parameters
----------
aParameter: double

Return
-------
None

Description
-----------
No available documentation.
") ParameterOnSecond;
		void ParameterOnSecond(const double aParameter);

		/****** MAT2d_Connexion::PointOnFirst ******/
		/****** md5 signature: 54421f5c73f6ba0c74b5afa285990e5b ******/
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the point on the firstline.
") PointOnFirst;
		gp_Pnt2d PointOnFirst();

		/****** MAT2d_Connexion::PointOnFirst ******/
		/****** md5 signature: 74ebc8964e1ee6fe1859ebf395eea102 ******/
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", "
Parameters
----------
aPoint: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") PointOnFirst;
		void PointOnFirst(const gp_Pnt2d & aPoint);

		/****** MAT2d_Connexion::PointOnSecond ******/
		/****** md5 signature: c95615a95f51f947e56f5937e2249445 ******/
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the point on the secondline.
") PointOnSecond;
		gp_Pnt2d PointOnSecond();

		/****** MAT2d_Connexion::PointOnSecond ******/
		/****** md5 signature: 6968b9f51d7a90d8452620c6db0ae4d6 ******/
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", "
Parameters
----------
aPoint: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") PointOnSecond;
		void PointOnSecond(const gp_Pnt2d & aPoint);

		/****** MAT2d_Connexion::Reverse ******/
		/****** md5 signature: e07079d2c4c2287fa0e4da37ec459818 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT2d_Connexion>

Description
-----------
Returns the reverse connexion of <self>. the firstpoint is the secondpoint. the secondpoint is the firstpoint.
") Reverse;
		opencascade::handle<MAT2d_Connexion> Reverse();

};


%make_alias(MAT2d_Connexion)

%extend MAT2d_Connexion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class MAT2d_CutCurve *
***********************/
/********************
* class MAT2d_Mat2d *
********************/
class MAT2d_Mat2d {
	public:
		/****** MAT2d_Mat2d::MAT2d_Mat2d ******/
		/****** md5 signature: b71c5c682f4f6bef6714372a15c57b85 ******/
		%feature("compactdefaultargs") MAT2d_Mat2d;
		%feature("autodoc", "
Parameters
----------
IsOpenResult: bool (optional, default to false)

Return
-------
None

Description
-----------
Empty constructor.
") MAT2d_Mat2d;
		 MAT2d_Mat2d(const bool IsOpenResult = false);

		/****** MAT2d_Mat2d::Bisector ******/
		/****** md5 signature: 67b6ad5e7794a47e193cacc71d0ac1c6 ******/
		%feature("compactdefaultargs") Bisector;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
Returns the current root.
") Bisector;
		opencascade::handle<MAT_Bisector> Bisector();

		/****** MAT2d_Mat2d::CreateMat ******/
		/****** md5 signature: 717224e1f2d3269fea646a133206ad70 ******/
		%feature("compactdefaultargs") CreateMat;
		%feature("autodoc", "
Parameters
----------
aTool: MAT2d_Tool2d

Return
-------
None

Description
-----------
Algorithm of computation of the bisecting locus.
") CreateMat;
		void CreateMat(MAT2d_Tool2d & aTool);

		/****** MAT2d_Mat2d::CreateMatOpen ******/
		/****** md5 signature: 79ad82fccb9da722fb02fd80f0334bde ******/
		%feature("compactdefaultargs") CreateMatOpen;
		%feature("autodoc", "
Parameters
----------
aTool: MAT2d_Tool2d

Return
-------
None

Description
-----------
Algorithm of computation of the bisecting locus for open wire.
") CreateMatOpen;
		void CreateMatOpen(MAT2d_Tool2d & aTool);

		/****** MAT2d_Mat2d::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initialize an iterator on the set of the roots of the trees of bisectors.
") Init;
		void Init();

		/****** MAT2d_Mat2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <True> if CreateMat has succeeded.
") IsDone;
		bool IsDone();

		/****** MAT2d_Mat2d::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return False if there is no more roots.
") More;
		bool More();

		/****** MAT2d_Mat2d::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next root.
") Next;
		void Next();

		/****** MAT2d_Mat2d::NumberOfBisectors ******/
		/****** md5 signature: a00da309aa566b0aa7cc3688ed59e15c ******/
		%feature("compactdefaultargs") NumberOfBisectors;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total number of bisectors.
") NumberOfBisectors;
		int NumberOfBisectors();

		/****** MAT2d_Mat2d::SemiInfinite ******/
		/****** md5 signature: ca4dd20816814c9aab6d400acb45d265 ******/
		%feature("compactdefaultargs") SemiInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are semi_infinite bisectors. So there is a tree for each semi_infinte bisector.
") SemiInfinite;
		bool SemiInfinite();

};


%extend MAT2d_Mat2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class MAT2d_MiniPath *
***********************/
class MAT2d_MiniPath {
	public:
		/****** MAT2d_MiniPath::MAT2d_MiniPath ******/
		/****** md5 signature: 9164c07248d1c0b69ed9710f1a89afad ******/
		%feature("compactdefaultargs") MAT2d_MiniPath;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT2d_MiniPath;
		 MAT2d_MiniPath();

		/****** MAT2d_MiniPath::ConnexionsFrom ******/
		/****** md5 signature: 675f070bcee2dbfd9199c8e0f155c6e2 ******/
		%feature("compactdefaultargs") ConnexionsFrom;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
NCollection_Sequence<opencascade::handle<MAT2d_Connexion>>

Description
-----------
Returns the connexions which start on line designed by <Index>.
") ConnexionsFrom;
		NCollection_Sequence<opencascade::handle<MAT2d_Connexion>> & ConnexionsFrom(const int Index);

		/****** MAT2d_MiniPath::Father ******/
		/****** md5 signature: 633c15c87c8dccc6301bcdb349bbb19e ******/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT2d_Connexion>

Description
-----------
Returns the connexion which ends on line designed by <Index>.
") Father;
		opencascade::handle<MAT2d_Connexion> Father(const int Index);

		/****** MAT2d_MiniPath::IsConnexionsFrom ******/
		/****** md5 signature: 7c5a7eb4361392967f006e86c13e2f8f ******/
		%feature("compactdefaultargs") IsConnexionsFrom;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns <True> if there is one Connexion which starts on line designed by <Index>.
") IsConnexionsFrom;
		bool IsConnexionsFrom(const int Index);

		/****** MAT2d_MiniPath::IsRoot ******/
		/****** md5 signature: c0e979ec1f11138b66c654d30fdf2013 ******/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Returns <True> if the line designed by <Index> is the root.
") IsRoot;
		bool IsRoot(const int Index);

		/****** MAT2d_MiniPath::Path ******/
		/****** md5 signature: a0886d0ba47ef84348d31422cdd60151 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<MAT2d_Connexion>>

Description
-----------
Returns the sequence of connexions corresponding to the path.
") Path;
		const NCollection_Sequence<opencascade::handle<MAT2d_Connexion>> & Path();

		/****** MAT2d_MiniPath::Perform ******/
		/****** md5 signature: 506fb229bfd92d2f6f8a52658c8c610c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Figure: NCollection_Sequence<TColGeom2d_SequenceOfGeometry >
IndStart: int
Sense: bool

Return
-------
None

Description
-----------
Computes the path to link the lines in <Figure>. the path starts on the line of index <IndStart> <Sense> = True if the Circuit turns in the trigonometric sense.
") Perform;
		void Perform(const NCollection_Sequence<TColGeom2d_SequenceOfGeometry > & Figure, const int IndStart, const bool Sense);

		/****** MAT2d_MiniPath::RunOnConnexions ******/
		/****** md5 signature: ee2ac7d20b87c24fc63fb1334502d079 ******/
		%feature("compactdefaultargs") RunOnConnexions;
		%feature("autodoc", "Return
-------
None

Description
-----------
Run on the set of connexions to compute the path. the path is an exploration of the tree which contains the connexions and their reverses. if the tree of connexions is A / | B E / | | C D F //! the path is A->B, B->C, C->B, B->D, D->B, B->A, A->E, E->F, F->E, E->A.
") RunOnConnexions;
		void RunOnConnexions();

};


%extend MAT2d_MiniPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class MAT2d_Tool2d *
*********************/
class MAT2d_Tool2d {
	public:
		/****** MAT2d_Tool2d::MAT2d_Tool2d ******/
		/****** md5 signature: 40b373afb67e3235c19bb3bbc1b3741a ******/
		%feature("compactdefaultargs") MAT2d_Tool2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") MAT2d_Tool2d;
		 MAT2d_Tool2d();

		/****** MAT2d_Tool2d::BisecFusion ******/
		/****** md5 signature: 00c28f02af9478a6238874fa66b8cf27 ******/
		%feature("compactdefaultargs") BisecFusion;
		%feature("autodoc", "
Parameters
----------
Index1: int
Index2: int

Return
-------
None

Description
-----------
No available documentation.
") BisecFusion;
		void BisecFusion(const int Index1, const int Index2);

		/****** MAT2d_Tool2d::ChangeGeomBis ******/
		/****** md5 signature: e853b99ad990055ab9ae74e770ebd657 ******/
		%feature("compactdefaultargs") ChangeGeomBis;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Bisector_Bisec

Description
-----------
Returns the <Bisec> of index <Index> in <theGeomBisectors>.
") ChangeGeomBis;
		Bisector_Bisec & ChangeGeomBis(const int Index);

		/****** MAT2d_Tool2d::Circuit ******/
		/****** md5 signature: 1e2ccb6c6c69d007d1b82b258a079b2c ******/
		%feature("compactdefaultargs") Circuit;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT2d_Circuit>

Description
-----------
No available documentation.
") Circuit;
		opencascade::handle<MAT2d_Circuit> Circuit();

		/****** MAT2d_Tool2d::CreateBisector ******/
		/****** md5 signature: 91533521b7368c9e2fe26d017383aa92 ******/
		%feature("compactdefaultargs") CreateBisector;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector

Return
-------
None

Description
-----------
Creates the geometric bisector defined by <abisector>.
") CreateBisector;
		void CreateBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****** MAT2d_Tool2d::Distance ******/
		/****** md5 signature: 984eca4731c33e2c059ef10410b09c4a ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector
param1: double
param2: double

Return
-------
double

Description
-----------
Returns the distance between the two points designed by their parameters on <abisector>.
") Distance;
		double Distance(const opencascade::handle<MAT_Bisector> & abisector, const double param1, const double param2);

		/****** MAT2d_Tool2d::Dump ******/
		/****** md5 signature: 48e17d9b3d9a825ff7206b5336acc6bb ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
bisector: int
erease: int

Return
-------
None

Description
-----------
displays information about the bisector defined by <bisector>.
") Dump;
		void Dump(const int bisector, const int erease);

		/****** MAT2d_Tool2d::FirstPoint ******/
		/****** md5 signature: 4734049c6ae92915a643aeaa0e9d5d8d ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------
anitem: int

Return
-------
dist: double

Description
-----------
Creates the point at the origin of the bisector between anitem and the previous item. dist is the distance from the FirstPoint to <anitem>. Returns the index of this point in <theGeomPnts>.
") FirstPoint;
		int FirstPoint(const int anitem, Standard_Real &OutValue);

		/****** MAT2d_Tool2d::GeomBis ******/
		/****** md5 signature: 55773b584e84e40c28518ab890e4257c ******/
		%feature("compactdefaultargs") GeomBis;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Bisector_Bisec

Description
-----------
Returns the <Bisec> of index <Index> in <theGeomBisectors>.
") GeomBis;
		const Bisector_Bisec & GeomBis(const int Index);

		/****** MAT2d_Tool2d::GeomElt ******/
		/****** md5 signature: fb56d0b494081b4bdb38291d615b40a3 ******/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Geometry>

Description
-----------
Returns the Geometry of index <Index> in <theGeomElts>.
") GeomElt;
		opencascade::handle<Geom2d_Geometry> GeomElt(const int Index);

		/****** MAT2d_Tool2d::GeomPnt ******/
		/****** md5 signature: 2d51e0ce334287ee44f46141a3728548 ******/
		%feature("compactdefaultargs") GeomPnt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the point of index <Index> in the <theGeomPnts>.
") GeomPnt;
		const gp_Pnt2d GeomPnt(const int Index);

		/****** MAT2d_Tool2d::GeomVec ******/
		/****** md5 signature: e1b72deb278fead7465235157cb487ee ******/
		%feature("compactdefaultargs") GeomVec;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Vec2d

Description
-----------
Returns the vector of index <Index> in the <theGeomVecs>.
") GeomVec;
		const gp_Vec2d GeomVec(const int Index);

		/****** MAT2d_Tool2d::InitItems ******/
		/****** md5 signature: 710fae1c32a164ce6272271d003ecbb2 ******/
		%feature("compactdefaultargs") InitItems;
		%feature("autodoc", "
Parameters
----------
aCircuit: MAT2d_Circuit

Return
-------
None

Description
-----------
InitItems cuts the line in Items. this Items are the geometrics representations of the BasicElts from MAT.
") InitItems;
		void InitItems(const opencascade::handle<MAT2d_Circuit> & aCircuit);

		/****** MAT2d_Tool2d::IntersectBisector ******/
		/****** md5 signature: 7054d6471c98e395b6028b9849d243d9 ******/
		%feature("compactdefaultargs") IntersectBisector;
		%feature("autodoc", "
Parameters
----------
bisectorone: MAT_Bisector
bisectortwo: MAT_Bisector

Return
-------
intpnt: int

Description
-----------
Computes the point of intersection between the bisectors defined by <bisectorone> and <bisectortwo> . If this point exists, <intpnt> is its index in <theGeomPnts> and Return the distance of the point from the bisector else Return <RealLast>.
") IntersectBisector;
		double IntersectBisector(const opencascade::handle<MAT_Bisector> & bisectorone, const opencascade::handle<MAT_Bisector> & bisectortwo, Standard_Integer &OutValue);

		/****** MAT2d_Tool2d::NumberOfItems ******/
		/****** md5 signature: 73d110ccea72b5d023475507d3e849af ******/
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Number of Items .
") NumberOfItems;
		int NumberOfItems();

		/****** MAT2d_Tool2d::Sense ******/
		/****** md5 signature: 1a0b245e555341dbcd06115c68217691 ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "
Parameters
----------
aside: MAT_Side

Return
-------
None

Description
-----------
<aSide> defines the side of the computation of the map.
") Sense;
		void Sense(const MAT_Side aside);

		/****** MAT2d_Tool2d::SetJoinType ******/
		/****** md5 signature: f42fabf7bf117604f0107e91d840719b ******/
		%feature("compactdefaultargs") SetJoinType;
		%feature("autodoc", "
Parameters
----------
aJoinType: GeomAbs_JoinType

Return
-------
None

Description
-----------
No available documentation.
") SetJoinType;
		void SetJoinType(const GeomAbs_JoinType aJoinType);

		/****** MAT2d_Tool2d::Tangent ******/
		/****** md5 signature: c9c729531ecfa4ea7474bfbc3374286f ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
bisector: int

Return
-------
int

Description
-----------
Creates the Tangent at the end of the bisector defined by <bisector>. Returns the index of this vector in <theGeomVecs>.
") Tangent;
		int Tangent(const int bisector);

		/****** MAT2d_Tool2d::TangentAfter ******/
		/****** md5 signature: 79f67e253d8e0403cebee3a94efa5951 ******/
		%feature("compactdefaultargs") TangentAfter;
		%feature("autodoc", "
Parameters
----------
anitem: int
IsOpenResult: bool

Return
-------
int

Description
-----------
Creates the Reversed Tangent at the origin of the Item defined by <anitem>. Returns the index of this vector in <theGeomVecs>.
") TangentAfter;
		int TangentAfter(const int anitem, const bool IsOpenResult);

		/****** MAT2d_Tool2d::TangentBefore ******/
		/****** md5 signature: 473e9cab317ea086702bba3a83b1baf7 ******/
		%feature("compactdefaultargs") TangentBefore;
		%feature("autodoc", "
Parameters
----------
anitem: int
IsOpenResult: bool

Return
-------
int

Description
-----------
Creates the Tangent at the end of the Item defined by <anitem>. Returns the index of this vector in <theGeomVecs>.
") TangentBefore;
		int TangentBefore(const int anitem, const bool IsOpenResult);

		/****** MAT2d_Tool2d::ToleranceOfConfusion ******/
		/****** md5 signature: 4a195a452b5f0d3448f5dc9b0af0b975 ******/
		%feature("compactdefaultargs") ToleranceOfConfusion;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns tolerance to test the confusion of two points.
") ToleranceOfConfusion;
		double ToleranceOfConfusion();

		/****** MAT2d_Tool2d::TrimBisector ******/
		/****** md5 signature: 0649fce80e7b9083f62b33209345e133 ******/
		%feature("compactdefaultargs") TrimBisector;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector

Return
-------
bool

Description
-----------
Trims the geometric bisector by the <firstparameter> of <abisector>. If the parameter is out of the bisector, Return False. else Return True.
") TrimBisector;
		bool TrimBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****** MAT2d_Tool2d::TrimBisector ******/
		/****** md5 signature: 0b4ce2595fcb4571e610bc1951ee9a85 ******/
		%feature("compactdefaultargs") TrimBisector;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector
apoint: int

Return
-------
bool

Description
-----------
Trims the geometric bisector by the point of index <apoint> in <theGeomPnts>. If the point is out of the bisector, Return False. else Return True.
") TrimBisector;
		bool TrimBisector(const opencascade::handle<MAT_Bisector> & abisector, const int apoint);

};


%extend MAT2d_Tool2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class hash<MAT2d_BiInt> *
**************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class MAT2d_SketchExplorer:
	pass

@classnotwrapped
class MAT2d_CutCurve:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
