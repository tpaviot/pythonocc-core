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
%template(MAT2d_SequenceOfSequenceOfCurve) NCollection_Sequence<TColGeom2d_SequenceOfCurve>;
%template(MAT2d_SequenceOfSequenceOfGeometry) NCollection_Sequence<TColGeom2d_SequenceOfGeometry>;
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
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstIndex;
		Standard_Integer FirstIndex();

		/****************** FirstIndex ******************/
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
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SecondIndex;
		Standard_Integer SecondIndex();

		/****************** SecondIndex ******************/
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
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "Returns the number of items .

Returns
-------
int
") NumberOfItems;
		Standard_Integer NumberOfItems();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT2d_Connexion;
		 MAT2d_Connexion();

		/****************** MAT2d_Connexion ******************/
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
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between the two points.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Distance ******************/
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
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", "Returns the index on the first line.

Returns
-------
int
") IndexFirstLine;
		Standard_Integer IndexFirstLine();

		/****************** IndexFirstLine ******************/
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
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", "Returns the index of the item on the first line.

Returns
-------
int
") IndexItemOnFirst;
		Standard_Integer IndexItemOnFirst();

		/****************** IndexItemOnFirst ******************/
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
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", "Returns the index of the item on the second line.

Returns
-------
int
") IndexItemOnSecond;
		Standard_Integer IndexItemOnSecond();

		/****************** IndexItemOnSecond ******************/
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
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", "Returns the index on the second line.

Returns
-------
int
") IndexSecondLine;
		Standard_Integer IndexSecondLine();

		/****************** IndexSecondLine ******************/
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
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", "Returns the parameter of the point on the firstline.

Returns
-------
float
") ParameterOnFirst;
		Standard_Real ParameterOnFirst();

		/****************** ParameterOnFirst ******************/
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
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", "Returns the parameter of the point on the secondline.

Returns
-------
float
") ParameterOnSecond;
		Standard_Real ParameterOnSecond();

		/****************** ParameterOnSecond ******************/
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
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", "Returns the point on the firstline.

Returns
-------
gp_Pnt2d
") PointOnFirst;
		gp_Pnt2d PointOnFirst();

		/****************** PointOnFirst ******************/
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
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", "Returns the point on the secondline.

Returns
-------
gp_Pnt2d
") PointOnSecond;
		gp_Pnt2d PointOnSecond();

		/****************** PointOnSecond ******************/
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
		%feature("compactdefaultargs") Bisector;
		%feature("autodoc", "Returns the current root.

Returns
-------
opencascade::handle<MAT_Bisector>
") Bisector;
		opencascade::handle<MAT_Bisector> Bisector();

		/****************** CreateMat ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize an iterator on the set of the roots of the trees of bisectors.

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns <true> if createmat has succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return false if there is no more roots.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next root.

Returns
-------
None
") Next;
		void Next();

		/****************** NumberOfBisectors ******************/
		%feature("compactdefaultargs") NumberOfBisectors;
		%feature("autodoc", "Returns the total number of bisectors.

Returns
-------
int
") NumberOfBisectors;
		Standard_Integer NumberOfBisectors();

		/****************** SemiInfinite ******************/
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
		%feature("compactdefaultargs") MAT2d_MiniPath;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT2d_MiniPath;
		 MAT2d_MiniPath();

		/****************** ConnexionsFrom ******************/
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
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns the sequence of connexions corresponding to the path.

Returns
-------
MAT2d_SequenceOfConnexion
") Path;
		const MAT2d_SequenceOfConnexion & Path();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") MAT2d_Tool2d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") MAT2d_Tool2d;
		 MAT2d_Tool2d();

		/****************** BisecFusion ******************/
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
		%feature("compactdefaultargs") Circuit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT2d_Circuit>
") Circuit;
		opencascade::handle<MAT2d_Circuit> Circuit();

		/****************** CreateBisector ******************/
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
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "Returns the number of items .

Returns
-------
int
") NumberOfItems;
		Standard_Integer NumberOfItems();

		/****************** Sense ******************/
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
		%feature("compactdefaultargs") ToleranceOfConfusion;
		%feature("autodoc", "Returns tolerance to test the confusion of two points.

Returns
-------
float
") ToleranceOfConfusion;
		Standard_Real ToleranceOfConfusion();

		/****************** TrimBisector ******************/
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
