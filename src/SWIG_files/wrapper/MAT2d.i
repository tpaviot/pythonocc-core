/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_mat2d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(MAT2d_Circuit)
%wrap_handle(MAT2d_Connexion)
/* end handles declaration */

/* templates */
%template(MAT2d_Array2OfConnexion) NCollection_Array2<opencascade::handle<MAT2d_Connexion>>;
%template(MAT2d_DataMapOfBiIntInteger) NCollection_DataMap<MAT2d_BiInt,Standard_Integer,MAT2d_MapBiIntHasher>;
%template(MAT2d_DataMapOfBiIntSequenceOfInteger) NCollection_DataMap<MAT2d_BiInt,TColStd_SequenceOfInteger,MAT2d_MapBiIntHasher>;
%template(MAT2d_DataMapOfIntegerBisec) NCollection_DataMap<Standard_Integer,Bisector_Bisec,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Bisector_Bisec,TColStd_MapIntegerHasher> {
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
%template(MAT2d_DataMapOfIntegerConnexion) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT2d_Connexion>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT2d_Connexion>,TColStd_MapIntegerHasher> {
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
%template(MAT2d_DataMapOfIntegerPnt2d) NCollection_DataMap<Standard_Integer,gp_Pnt2d,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,gp_Pnt2d,TColStd_MapIntegerHasher> {
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
%template(MAT2d_DataMapOfIntegerSequenceOfConnexion) NCollection_DataMap<Standard_Integer,MAT2d_SequenceOfConnexion,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,MAT2d_SequenceOfConnexion,TColStd_MapIntegerHasher> {
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
%template(MAT2d_DataMapOfIntegerVec2d) NCollection_DataMap<Standard_Integer,gp_Vec2d,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,gp_Vec2d,TColStd_MapIntegerHasher> {
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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(MAT2d_SequenceOfSequenceOfCurve) NCollection_Sequence<TColGeom2d_SequenceOfCurve>;

%extend NCollection_Sequence<TColGeom2d_SequenceOfCurve> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(MAT2d_SequenceOfSequenceOfGeometry) NCollection_Sequence<TColGeom2d_SequenceOfGeometry>;

%extend NCollection_Sequence<TColGeom2d_SequenceOfGeometry> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2<opencascade::handle<MAT2d_Connexion>> MAT2d_Array2OfConnexion;
typedef NCollection_DataMap<MAT2d_BiInt, Standard_Integer, MAT2d_MapBiIntHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
typedef NCollection_DataMap<MAT2d_BiInt, TColStd_SequenceOfInteger, MAT2d_MapBiIntHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
typedef NCollection_DataMap<Standard_Integer, Bisector_Bisec, TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT2d_Connexion>, TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
typedef NCollection_DataMap<Standard_Integer, gp_Pnt2d, TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
typedef NCollection_DataMap<Standard_Integer, MAT2d_SequenceOfConnexion, TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
typedef NCollection_DataMap<Standard_Integer, gp_Vec2d, TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
typedef NCollection_DataMap<MAT2d_BiInt, Standard_Integer, MAT2d_MapBiIntHasher> MAT2d_DataMapOfBiIntInteger;
typedef NCollection_DataMap<MAT2d_BiInt, TColStd_SequenceOfInteger, MAT2d_MapBiIntHasher> MAT2d_DataMapOfBiIntSequenceOfInteger;
typedef NCollection_DataMap<Standard_Integer, Bisector_Bisec, TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerBisec;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT2d_Connexion>, TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerConnexion;
typedef NCollection_DataMap<Standard_Integer, gp_Pnt2d, TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerPnt2d;
typedef NCollection_DataMap<Standard_Integer, MAT2d_SequenceOfConnexion, TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerSequenceOfConnexion;
typedef NCollection_DataMap<Standard_Integer, gp_Vec2d, TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerVec2d;
typedef NCollection_Sequence<opencascade::handle<MAT2d_Connexion>> MAT2d_SequenceOfConnexion;
typedef NCollection_Sequence<TColGeom2d_SequenceOfCurve> MAT2d_SequenceOfSequenceOfCurve;
typedef NCollection_Sequence<TColGeom2d_SequenceOfGeometry> MAT2d_SequenceOfSequenceOfGeometry;
/* end typedefs declaration */

/********************
* class MAT2d_BiInt *
********************/
class MAT2d_BiInt {
	public:
		/****************** MAT2d_BiInt ******************/
		/**** md5 signature: 78ab96464b0d583cf551a2b9faedb8d9 ****/
		%feature("compactdefaultargs") MAT2d_BiInt;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: int
I2: int

Returns
-------
None
") MAT2d_BiInt;
		 MAT2d_BiInt(const Standard_Integer I1, const Standard_Integer I2);

		/****************** FirstIndex ******************/
		/**** md5 signature: d46869d30abf824c62a68bd55acf0cb1 ****/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstIndex;
		Standard_Integer FirstIndex();

		/****************** FirstIndex ******************/
		/**** md5 signature: 17918e8ddbf3e2e971bdf84b0112a1fd ****/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: int

Returns
-------
None
") FirstIndex;
		void FirstIndex(const Standard_Integer I1);

		/****************** IsEqual ******************/
		/**** md5 signature: b7f23e99a6a59778d6a351f9dbeadc3c ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: MAT2d_BiInt

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const MAT2d_BiInt & B);

		/****************** SecondIndex ******************/
		/**** md5 signature: 10d01ee45fc32a68b77d02ef99308fa9 ****/
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SecondIndex;
		Standard_Integer SecondIndex();

		/****************** SecondIndex ******************/
		/**** md5 signature: 2d51f4e6989ca684356bd87abf2c6f3d ****/
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I2: int

Returns
-------
None
") SecondIndex;
		void SecondIndex(const Standard_Integer I2);


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
		/****************** MAT2d_Circuit ******************/
		/**** md5 signature: 3d83ae3a1ddee5ab13cec53a08223b5d ****/
		%feature("compactdefaultargs") MAT2d_Circuit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aJoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") MAT2d_Circuit;
		 MAT2d_Circuit(const GeomAbs_JoinType aJoinType = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** Connexion ******************/
		/**** md5 signature: 326ba50670f9d4c1c46bce1f115c59e3 ****/
		%feature("compactdefaultargs") Connexion;
		%feature("autodoc", "Returns the connexion on the item <index> in me.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT2d_Connexion>
") Connexion;
		opencascade::handle<MAT2d_Connexion> Connexion(const Standard_Integer Index);

		/****************** ConnexionOn ******************/
		/**** md5 signature: 99421e4e4a56e2a09bb778c89f4ec2dc ****/
		%feature("compactdefaultargs") ConnexionOn;
		%feature("autodoc", "Returns <true> is there is a connexion on the item <index> in <self>.

Parameters
----------
Index: int

Returns
-------
bool
") ConnexionOn;
		Standard_Boolean ConnexionOn(const Standard_Integer Index);

		/****************** LineLength ******************/
		/**** md5 signature: 469351f47df074eb89a0c7e8bfc384ef ****/
		%feature("compactdefaultargs") LineLength;
		%feature("autodoc", "Returns the number of items on the line <indexline>.

Parameters
----------
IndexLine: int

Returns
-------
int
") LineLength;
		Standard_Integer LineLength(const Standard_Integer IndexLine);

		/****************** NumberOfItems ******************/
		/**** md5 signature: 6320550c1d233b98551d924e74a6ceb4 ****/
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "Returns the number of items .

Returns
-------
int
") NumberOfItems;
		Standard_Integer NumberOfItems();

		/****************** Perform ******************/
		/**** md5 signature: 9f56ef9060926bd1e36ee0efe117b1f7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFigure: MAT2d_SequenceOfSequenceOfGeometry
IsClosed: TColStd_SequenceOfBoolean
IndRefLine: int
Trigo: bool

Returns
-------
None
") Perform;
		void Perform(MAT2d_SequenceOfSequenceOfGeometry & aFigure, const TColStd_SequenceOfBoolean & IsClosed, const Standard_Integer IndRefLine, const Standard_Boolean Trigo);

		/****************** RefToEqui ******************/
		/**** md5 signature: d22a10fa0d9d9576992fd9ec8dc805bb ****/
		%feature("compactdefaultargs") RefToEqui;
		%feature("autodoc", "Returns the set of index of the items in <self>corresponding to the curve <indcurve> on the line <indline> from the initial figure.

Parameters
----------
IndLine: int
IndCurve: int

Returns
-------
TColStd_SequenceOfInteger
") RefToEqui;
		const TColStd_SequenceOfInteger & RefToEqui(const Standard_Integer IndLine, const Standard_Integer IndCurve);

		/****************** Value ******************/
		/**** md5 signature: 46459dc52092fe0b601c69e4b3658782 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the item at position <index> in <self>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Geometry>
") Value;
		opencascade::handle<Geom2d_Geometry> Value(const Standard_Integer Index);

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
		/****************** MAT2d_Connexion ******************/
		/**** md5 signature: 3839f447b9973506e7c31a3c602f8582 ****/
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT2d_Connexion;
		 MAT2d_Connexion();

		/****************** MAT2d_Connexion ******************/
		/**** md5 signature: 62cffa59d7c45597a0042e456300fe54 ****/
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", "No available documentation.

Parameters
----------
LineA: int
LineB: int
ItemA: int
ItemB: int
Distance: float
ParameterOnA: float
ParameterOnB: float
PointA: gp_Pnt2d
PointB: gp_Pnt2d

Returns
-------
None
") MAT2d_Connexion;
		 MAT2d_Connexion(const Standard_Integer LineA, const Standard_Integer LineB, const Standard_Integer ItemA, const Standard_Integer ItemB, const Standard_Real Distance, const Standard_Real ParameterOnA, const Standard_Real ParameterOnB, const gp_Pnt2d & PointA, const gp_Pnt2d & PointB);

		/****************** Distance ******************/
		/**** md5 signature: c054352e1b604c83d759bc4ccf6c526d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between the two points.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Distance ******************/
		/**** md5 signature: 3ae0b9dfb95cca74bdd17827ec43670b ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDistance: float

Returns
-------
None
") Distance;
		void Distance(const Standard_Real aDistance);

		/****************** Dump ******************/
		/**** md5 signature: 23c1db28cacdaffb331052739c78df8b ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Print <self>.

Parameters
----------
Deep: int,optional
	default value is 0
Offset: int,optional
	default value is 0

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Deep = 0, const Standard_Integer Offset = 0);

		/****************** IndexFirstLine ******************/
		/**** md5 signature: 663d6504efd1a156fa9a482d62bc3dbb ****/
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", "Returns the index on the first line.

Returns
-------
int
") IndexFirstLine;
		Standard_Integer IndexFirstLine();

		/****************** IndexFirstLine ******************/
		/**** md5 signature: e9ddfb6ae51bf8eb16c92d7b42609bca ****/
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
anIndex: int

Returns
-------
None
") IndexFirstLine;
		void IndexFirstLine(const Standard_Integer anIndex);

		/****************** IndexItemOnFirst ******************/
		/**** md5 signature: 3ac29bd3c9804e66c2a315f62a355304 ****/
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", "Returns the index of the item on the first line.

Returns
-------
int
") IndexItemOnFirst;
		Standard_Integer IndexItemOnFirst();

		/****************** IndexItemOnFirst ******************/
		/**** md5 signature: c6e9546b347dc7af06ccb4f85f109de1 ****/
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
anIndex: int

Returns
-------
None
") IndexItemOnFirst;
		void IndexItemOnFirst(const Standard_Integer anIndex);

		/****************** IndexItemOnSecond ******************/
		/**** md5 signature: 9be18043761a97c465053e66cab18002 ****/
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", "Returns the index of the item on the second line.

Returns
-------
int
") IndexItemOnSecond;
		Standard_Integer IndexItemOnSecond();

		/****************** IndexItemOnSecond ******************/
		/**** md5 signature: 20b450ff2c151e3735c3ccf7d96e2aab ****/
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", "No available documentation.

Parameters
----------
anIndex: int

Returns
-------
None
") IndexItemOnSecond;
		void IndexItemOnSecond(const Standard_Integer anIndex);

		/****************** IndexSecondLine ******************/
		/**** md5 signature: 743690301073ae235797f67f19862988 ****/
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", "Returns the index on the second line.

Returns
-------
int
") IndexSecondLine;
		Standard_Integer IndexSecondLine();

		/****************** IndexSecondLine ******************/
		/**** md5 signature: 85add49d77c865a820812ca36a4f15d4 ****/
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
anIndex: int

Returns
-------
None
") IndexSecondLine;
		void IndexSecondLine(const Standard_Integer anIndex);

		/****************** IsAfter ******************/
		/**** md5 signature: b21a8f4e2e039eabad6ae1e4f9672a7c ****/
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "Returns <true> if my firstpoint is on the same line than the firstpoint of <aconnexion> and my firstpoint is after the firstpoint of <aconnexion> on the line. <asense> = 1 if <aconnexion> is on the left of its firstline, else <asense> = -1.

Parameters
----------
aConnexion: MAT2d_Connexion
aSense: float

Returns
-------
bool
") IsAfter;
		Standard_Boolean IsAfter(const opencascade::handle<MAT2d_Connexion> & aConnexion, const Standard_Real aSense);

		/****************** ParameterOnFirst ******************/
		/**** md5 signature: e945fc6b92a0d895f5e2c28fd811543c ****/
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", "Returns the parameter of the point on the firstline.

Returns
-------
float
") ParameterOnFirst;
		Standard_Real ParameterOnFirst();

		/****************** ParameterOnFirst ******************/
		/**** md5 signature: 40eb40758621a9e79b96eda54b924eed ****/
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParameter: float

Returns
-------
None
") ParameterOnFirst;
		void ParameterOnFirst(const Standard_Real aParameter);

		/****************** ParameterOnSecond ******************/
		/**** md5 signature: 370f2ccf1ecbaea4fffac99aaa7fd27f ****/
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", "Returns the parameter of the point on the secondline.

Returns
-------
float
") ParameterOnSecond;
		Standard_Real ParameterOnSecond();

		/****************** ParameterOnSecond ******************/
		/**** md5 signature: cdd43381e112f28bae0990926bc372c0 ****/
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", "No available documentation.

Parameters
----------
aParameter: float

Returns
-------
None
") ParameterOnSecond;
		void ParameterOnSecond(const Standard_Real aParameter);

		/****************** PointOnFirst ******************/
		/**** md5 signature: 54421f5c73f6ba0c74b5afa285990e5b ****/
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", "Returns the point on the firstline.

Returns
-------
gp_Pnt2d
") PointOnFirst;
		gp_Pnt2d PointOnFirst();

		/****************** PointOnFirst ******************/
		/**** md5 signature: 74ebc8964e1ee6fe1859ebf395eea102 ****/
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: gp_Pnt2d

Returns
-------
None
") PointOnFirst;
		void PointOnFirst(const gp_Pnt2d & aPoint);

		/****************** PointOnSecond ******************/
		/**** md5 signature: c95615a95f51f947e56f5937e2249445 ****/
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", "Returns the point on the secondline.

Returns
-------
gp_Pnt2d
") PointOnSecond;
		gp_Pnt2d PointOnSecond();

		/****************** PointOnSecond ******************/
		/**** md5 signature: 6968b9f51d7a90d8452620c6db0ae4d6 ****/
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPoint: gp_Pnt2d

Returns
-------
None
") PointOnSecond;
		void PointOnSecond(const gp_Pnt2d & aPoint);

		/****************** Reverse ******************/
		/**** md5 signature: e07079d2c4c2287fa0e4da37ec459818 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Returns the reverse connexion of <self>. the firstpoint is the secondpoint. the secondpoint is the firstpoint.

Returns
-------
opencascade::handle<MAT2d_Connexion>
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
/*****************************
* class MAT2d_MapBiIntHasher *
*****************************/
class MAT2d_MapBiIntHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 2d93262f8aa010d2027358817cd87e99 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given key, in the range [1, theupperbound] @param thekey the key which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theKey: MAT2d_BiInt
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const MAT2d_BiInt & theKey, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 900a967a8cd8c34f415beccf506796f6 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key1: MAT2d_BiInt
Key2: MAT2d_BiInt

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const MAT2d_BiInt & Key1, const MAT2d_BiInt & Key2);

};


%extend MAT2d_MapBiIntHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class MAT2d_Mat2d *
********************/
class MAT2d_Mat2d {
	public:
		/****************** MAT2d_Mat2d ******************/
		/**** md5 signature: f439b4b585960a22c06e7ea738efcbf9 ****/
		%feature("compactdefaultargs") MAT2d_Mat2d;
		%feature("autodoc", "Empty construtor.

Parameters
----------
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") MAT2d_Mat2d;
		 MAT2d_Mat2d(const Standard_Boolean IsOpenResult = Standard_False);

		/****************** Bisector ******************/
		/**** md5 signature: 67b6ad5e7794a47e193cacc71d0ac1c6 ****/
		%feature("compactdefaultargs") Bisector;
		%feature("autodoc", "Returns the current root.

Returns
-------
opencascade::handle<MAT_Bisector>
") Bisector;
		opencascade::handle<MAT_Bisector> Bisector();

		/****************** CreateMat ******************/
		/**** md5 signature: 717224e1f2d3269fea646a133206ad70 ****/
		%feature("compactdefaultargs") CreateMat;
		%feature("autodoc", "Algoritm of computation of the bisecting locus.

Parameters
----------
aTool: MAT2d_Tool2d

Returns
-------
None
") CreateMat;
		void CreateMat(MAT2d_Tool2d & aTool);

		/****************** CreateMatOpen ******************/
		/**** md5 signature: 79ad82fccb9da722fb02fd80f0334bde ****/
		%feature("compactdefaultargs") CreateMatOpen;
		%feature("autodoc", "Algoritm of computation of the bisecting locus for open wire.

Parameters
----------
aTool: MAT2d_Tool2d

Returns
-------
None
") CreateMatOpen;
		void CreateMatOpen(MAT2d_Tool2d & aTool);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize an iterator on the set of the roots of the trees of bisectors.

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns <true> if createmat has succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return false if there is no more roots.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next root.

Returns
-------
None
") Next;
		void Next();

		/****************** NumberOfBisectors ******************/
		/**** md5 signature: e52804b83739b49416ec49fd614e427c ****/
		%feature("compactdefaultargs") NumberOfBisectors;
		%feature("autodoc", "Returns the total number of bisectors.

Returns
-------
int
") NumberOfBisectors;
		Standard_Integer NumberOfBisectors();

		/****************** SemiInfinite ******************/
		/**** md5 signature: 6c8f4adc9ba1520b1d74688cb6aff3fd ****/
		%feature("compactdefaultargs") SemiInfinite;
		%feature("autodoc", "Returns true if there are semi_infinite bisectors. so there is a tree for each semi_infinte bisector.

Returns
-------
bool
") SemiInfinite;
		Standard_Boolean SemiInfinite();

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
		/****************** MAT2d_MiniPath ******************/
		/**** md5 signature: 9164c07248d1c0b69ed9710f1a89afad ****/
		%feature("compactdefaultargs") MAT2d_MiniPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT2d_MiniPath;
		 MAT2d_MiniPath();

		/****************** ConnexionsFrom ******************/
		/**** md5 signature: f1a567b01e2a9822ac854464cf7cb35b ****/
		%feature("compactdefaultargs") ConnexionsFrom;
		%feature("autodoc", "Returns the connexions which start on line designed by <index>.

Parameters
----------
Index: int

Returns
-------
MAT2d_SequenceOfConnexion
") ConnexionsFrom;
		MAT2d_SequenceOfConnexion & ConnexionsFrom(const Standard_Integer Index);

		/****************** Father ******************/
		/**** md5 signature: 05be18adc3333f3c132390d37e3dc45d ****/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Returns the connexion which ends on line designed by <index>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT2d_Connexion>
") Father;
		opencascade::handle<MAT2d_Connexion> Father(const Standard_Integer Index);

		/****************** IsConnexionsFrom ******************/
		/**** md5 signature: a3d643449bb4c30a5216154cc969d2aa ****/
		%feature("compactdefaultargs") IsConnexionsFrom;
		%feature("autodoc", "Returns <true> if there is one connexion which starts on line designed by <index>.

Parameters
----------
Index: int

Returns
-------
bool
") IsConnexionsFrom;
		Standard_Boolean IsConnexionsFrom(const Standard_Integer Index);

		/****************** IsRoot ******************/
		/**** md5 signature: e2b828672c99106ed633e881d7c63192 ****/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "Returns <true> if the line designed by <index> is the root.

Parameters
----------
Index: int

Returns
-------
bool
") IsRoot;
		Standard_Boolean IsRoot(const Standard_Integer Index);

		/****************** Path ******************/
		/**** md5 signature: 28cbfa9e39501e27ab452cbdcdad0adb ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns the sequence of connexions corresponding to the path.

Returns
-------
MAT2d_SequenceOfConnexion
") Path;
		const MAT2d_SequenceOfConnexion & Path();

		/****************** Perform ******************/
		/**** md5 signature: c6cf1a0b596162a4c426828ee0aee684 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the path to link the lines in <figure>. the path starts on the line of index <indstart> <sense> = true if the circuit turns in the trigonometric sense.

Parameters
----------
Figure: MAT2d_SequenceOfSequenceOfGeometry
IndStart: int
Sense: bool

Returns
-------
None
") Perform;
		void Perform(const MAT2d_SequenceOfSequenceOfGeometry & Figure, const Standard_Integer IndStart, const Standard_Boolean Sense);

		/****************** RunOnConnexions ******************/
		/**** md5 signature: ee2ac7d20b87c24fc63fb1334502d079 ****/
		%feature("compactdefaultargs") RunOnConnexions;
		%feature("autodoc", "Run on the set of connexions to compute the path. the path is an exploration of the tree which contains the connexions and their reverses. if the tree of connexions is a / | b e / | | c d f //! the path is a->b, b->c, c->b, b->d, d->b, b->a, a->e, e->f, f->e, e->a.

Returns
-------
None
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
		/****************** MAT2d_Tool2d ******************/
		/**** md5 signature: 40b373afb67e3235c19bb3bbc1b3741a ****/
		%feature("compactdefaultargs") MAT2d_Tool2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") MAT2d_Tool2d;
		 MAT2d_Tool2d();

		/****************** BisecFusion ******************/
		/**** md5 signature: b36ebe72707aecc8364523c4845ce15b ****/
		%feature("compactdefaultargs") BisecFusion;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index1: int
Index2: int

Returns
-------
None
") BisecFusion;
		void BisecFusion(const Standard_Integer Index1, const Standard_Integer Index2);

		/****************** ChangeGeomBis ******************/
		/**** md5 signature: 55a028194238717752a04f3fd4cce5e3 ****/
		%feature("compactdefaultargs") ChangeGeomBis;
		%feature("autodoc", "Returns the <bisec> of index <index> in <thegeombisectors>.

Parameters
----------
Index: int

Returns
-------
Bisector_Bisec
") ChangeGeomBis;
		Bisector_Bisec & ChangeGeomBis(const Standard_Integer Index);

		/****************** Circuit ******************/
		/**** md5 signature: 1e2ccb6c6c69d007d1b82b258a079b2c ****/
		%feature("compactdefaultargs") Circuit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT2d_Circuit>
") Circuit;
		opencascade::handle<MAT2d_Circuit> Circuit();

		/****************** CreateBisector ******************/
		/**** md5 signature: 91533521b7368c9e2fe26d017383aa92 ****/
		%feature("compactdefaultargs") CreateBisector;
		%feature("autodoc", "Creates the geometric bisector defined by <abisector>.

Parameters
----------
abisector: MAT_Bisector

Returns
-------
None
") CreateBisector;
		void CreateBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****************** Distance ******************/
		/**** md5 signature: c4f9e7dff727fbcecb68acd556aec01c ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between the two points designed by their parameters on <abisector>.

Parameters
----------
abisector: MAT_Bisector
param1: float
param2: float

Returns
-------
float
") Distance;
		Standard_Real Distance(const opencascade::handle<MAT_Bisector> & abisector, const Standard_Real param1, const Standard_Real param2);

		/****************** Dump ******************/
		/**** md5 signature: ed8af339d2cda3e0556fbccf04ebaaea ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Displays informations about the bisector defined by <bisector>.

Parameters
----------
bisector: int
erease: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer bisector, const Standard_Integer erease);

		/****************** FirstPoint ******************/
		/**** md5 signature: af53facaedcf1602dca2af134e2a1e26 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Creates the point at the origin of the bisector between anitem and the previous item. dist is the distance from the firstpoint to <anitem>. returns the index of this point in <thegeompnts>.

Parameters
----------
anitem: int

Returns
-------
dist: float
") FirstPoint;
		Standard_Integer FirstPoint(const Standard_Integer anitem, Standard_Real &OutValue);

		/****************** GeomBis ******************/
		/**** md5 signature: 2669ea1ceaf32dffb2c030ef117a0c36 ****/
		%feature("compactdefaultargs") GeomBis;
		%feature("autodoc", "Returns the <bisec> of index <index> in <thegeombisectors>.

Parameters
----------
Index: int

Returns
-------
Bisector_Bisec
") GeomBis;
		const Bisector_Bisec & GeomBis(const Standard_Integer Index);

		/****************** GeomElt ******************/
		/**** md5 signature: 1527f25e2caa069ccf56038ebf14fb6f ****/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "Returns the geometry of index <index> in <thegeomelts>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Geometry>
") GeomElt;
		opencascade::handle<Geom2d_Geometry> GeomElt(const Standard_Integer Index);

		/****************** GeomPnt ******************/
		/**** md5 signature: eb6a4e9d73821fe2a124ecb7dd200dd9 ****/
		%feature("compactdefaultargs") GeomPnt;
		%feature("autodoc", "Returns the point of index <index> in the <thegeompnts>.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") GeomPnt;
		const gp_Pnt2d GeomPnt(const Standard_Integer Index);

		/****************** GeomVec ******************/
		/**** md5 signature: fb4c975539824a5e046043581866e0a7 ****/
		%feature("compactdefaultargs") GeomVec;
		%feature("autodoc", "Returns the vector of index <index> in the <thegeomvecs>.

Parameters
----------
Index: int

Returns
-------
gp_Vec2d
") GeomVec;
		const gp_Vec2d GeomVec(const Standard_Integer Index);

		/****************** InitItems ******************/
		/**** md5 signature: 710fae1c32a164ce6272271d003ecbb2 ****/
		%feature("compactdefaultargs") InitItems;
		%feature("autodoc", "Inititems cuts the line in items. this items are the geometrics representations of the basicelts from mat.

Parameters
----------
aCircuit: MAT2d_Circuit

Returns
-------
None
") InitItems;
		void InitItems(const opencascade::handle<MAT2d_Circuit> & aCircuit);

		/****************** IntersectBisector ******************/
		/**** md5 signature: 7c49aa3c8064249c2de081b0f6df8114 ****/
		%feature("compactdefaultargs") IntersectBisector;
		%feature("autodoc", "Computes the point of intersection between the bisectors defined by <bisectorone> and <bisectortwo> . if this point exists, <intpnt> is its index in <thegeompnts> and return the distance of the point from the bisector else return <reallast>.

Parameters
----------
bisectorone: MAT_Bisector
bisectortwo: MAT_Bisector

Returns
-------
intpnt: int
") IntersectBisector;
		Standard_Real IntersectBisector(const opencascade::handle<MAT_Bisector> & bisectorone, const opencascade::handle<MAT_Bisector> & bisectortwo, Standard_Integer &OutValue);

		/****************** NumberOfItems ******************/
		/**** md5 signature: 6320550c1d233b98551d924e74a6ceb4 ****/
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "Returns the number of items .

Returns
-------
int
") NumberOfItems;
		Standard_Integer NumberOfItems();

		/****************** Sense ******************/
		/**** md5 signature: 1a0b245e555341dbcd06115c68217691 ****/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "<aside> defines the side of the computation of the map.

Parameters
----------
aside: MAT_Side

Returns
-------
None
") Sense;
		void Sense(const MAT_Side aside);

		/****************** SetJoinType ******************/
		/**** md5 signature: f42fabf7bf117604f0107e91d840719b ****/
		%feature("compactdefaultargs") SetJoinType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aJoinType: GeomAbs_JoinType

Returns
-------
None
") SetJoinType;
		void SetJoinType(const GeomAbs_JoinType aJoinType);

		/****************** Tangent ******************/
		/**** md5 signature: ab662854e61125c88be73685fae8988e ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Creates the tangent at the end of the bisector defined by <bisector>. returns the index of this vector in <thegeomvecs>.

Parameters
----------
bisector: int

Returns
-------
int
") Tangent;
		Standard_Integer Tangent(const Standard_Integer bisector);

		/****************** TangentAfter ******************/
		/**** md5 signature: 18070da22791e48f1a9aa2ab9345bacf ****/
		%feature("compactdefaultargs") TangentAfter;
		%feature("autodoc", "Creates the reversed tangent at the origin of the item defined by <anitem>. returns the index of this vector in <thegeomvecs>.

Parameters
----------
anitem: int
IsOpenResult: bool

Returns
-------
int
") TangentAfter;
		Standard_Integer TangentAfter(const Standard_Integer anitem, const Standard_Boolean IsOpenResult);

		/****************** TangentBefore ******************/
		/**** md5 signature: b181f50d015bb15af38052be8e4c2ce5 ****/
		%feature("compactdefaultargs") TangentBefore;
		%feature("autodoc", "Creates the tangent at the end of the item defined by <anitem>. returns the index of this vector in <thegeomvecs>.

Parameters
----------
anitem: int
IsOpenResult: bool

Returns
-------
int
") TangentBefore;
		Standard_Integer TangentBefore(const Standard_Integer anitem, const Standard_Boolean IsOpenResult);

		/****************** ToleranceOfConfusion ******************/
		/**** md5 signature: 120f891c1d5a826cad7d45027f612828 ****/
		%feature("compactdefaultargs") ToleranceOfConfusion;
		%feature("autodoc", "Returns tolerance to test the confusion of two points.

Returns
-------
float
") ToleranceOfConfusion;
		Standard_Real ToleranceOfConfusion();

		/****************** TrimBisector ******************/
		/**** md5 signature: 6c697b82711f48eb2a48c1a462be3bba ****/
		%feature("compactdefaultargs") TrimBisector;
		%feature("autodoc", "Trims the geometric bisector by the <firstparameter> of <abisector>. if the parameter is out of the bisector, return false. else return true.

Parameters
----------
abisector: MAT_Bisector

Returns
-------
bool
") TrimBisector;
		Standard_Boolean TrimBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****************** TrimBisector ******************/
		/**** md5 signature: ca420d516c26d6ab4100ae3c0e87448b ****/
		%feature("compactdefaultargs") TrimBisector;
		%feature("autodoc", "Trims the geometric bisector by the point of index <apoint> in <thegeompnts>. if the point is out of the bisector, return false. else return true.

Parameters
----------
abisector: MAT_Bisector
apoint: int

Returns
-------
bool
") TrimBisector;
		Standard_Boolean TrimBisector(const opencascade::handle<MAT_Bisector> & abisector, const Standard_Integer apoint);

};


%extend MAT2d_Tool2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

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
