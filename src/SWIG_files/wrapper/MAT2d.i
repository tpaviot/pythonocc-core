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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(MAT2d_Circuit)
%wrap_handle(MAT2d_Connexion)
/* end handles declaration */

/* templates */
%template(MAT2d_DataMapOfIntegerSequenceOfConnexion) NCollection_DataMap <Standard_Integer , MAT2d_SequenceOfConnexion , TColStd_MapIntegerHasher>;
%template(MAT2d_DataMapOfIntegerConnexion) NCollection_DataMap <Standard_Integer , opencascade::handle <MAT2d_Connexion>, TColStd_MapIntegerHasher>;
%template(MAT2d_DataMapOfIntegerPnt2d) NCollection_DataMap <Standard_Integer , gp_Pnt2d , TColStd_MapIntegerHasher>;
%template(MAT2d_DataMapOfIntegerVec2d) NCollection_DataMap <Standard_Integer , gp_Vec2d , TColStd_MapIntegerHasher>;
%template(MAT2d_DataMapOfIntegerBisec) NCollection_DataMap <Standard_Integer , Bisector_Bisec , TColStd_MapIntegerHasher>;
%template(MAT2d_Array2OfConnexion) NCollection_Array2 <opencascade::handle <MAT2d_Connexion>>;
%template(MAT2d_SequenceOfSequenceOfCurve) NCollection_Sequence <TColGeom2d_SequenceOfCurve>;
%template(MAT2d_SequenceOfSequenceOfGeometry) NCollection_Sequence <TColGeom2d_SequenceOfGeometry>;
%template(MAT2d_SequenceOfConnexion) NCollection_Sequence <opencascade::handle <MAT2d_Connexion>>;
%template(MAT2d_DataMapOfBiIntSequenceOfInteger) NCollection_DataMap <MAT2d_BiInt , TColStd_SequenceOfInteger , MAT2d_MapBiIntHasher>;
%template(MAT2d_DataMapOfBiIntInteger) NCollection_DataMap <MAT2d_BiInt , Standard_Integer , MAT2d_MapBiIntHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <Standard_Integer , MAT2d_SequenceOfConnexion , TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerSequenceOfConnexion;
typedef NCollection_DataMap <Standard_Integer , MAT2d_SequenceOfConnexion , TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <MAT2d_Connexion>, TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerConnexion;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <MAT2d_Connexion>, TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
typedef NCollection_DataMap <Standard_Integer , gp_Pnt2d , TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerPnt2d;
typedef NCollection_DataMap <Standard_Integer , gp_Pnt2d , TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
typedef NCollection_DataMap <Standard_Integer , gp_Vec2d , TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerVec2d;
typedef NCollection_DataMap <Standard_Integer , gp_Vec2d , TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
typedef NCollection_DataMap <Standard_Integer , Bisector_Bisec , TColStd_MapIntegerHasher> MAT2d_DataMapOfIntegerBisec;
typedef NCollection_DataMap <Standard_Integer , Bisector_Bisec , TColStd_MapIntegerHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
typedef NCollection_Array2 <opencascade::handle <MAT2d_Connexion>> MAT2d_Array2OfConnexion;
typedef NCollection_Sequence <TColGeom2d_SequenceOfCurve> MAT2d_SequenceOfSequenceOfCurve;
typedef NCollection_Sequence <TColGeom2d_SequenceOfGeometry> MAT2d_SequenceOfSequenceOfGeometry;
typedef NCollection_Sequence <opencascade::handle <MAT2d_Connexion>> MAT2d_SequenceOfConnexion;
typedef NCollection_DataMap <MAT2d_BiInt , TColStd_SequenceOfInteger , MAT2d_MapBiIntHasher> MAT2d_DataMapOfBiIntSequenceOfInteger;
typedef NCollection_DataMap <MAT2d_BiInt , TColStd_SequenceOfInteger , MAT2d_MapBiIntHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
typedef NCollection_DataMap <MAT2d_BiInt , Standard_Integer , MAT2d_MapBiIntHasher> MAT2d_DataMapOfBiIntInteger;
typedef NCollection_DataMap <MAT2d_BiInt , Standard_Integer , MAT2d_MapBiIntHasher>::Iterator MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
/* end typedefs declaration */

/********************
* class MAT2d_BiInt *
********************/
%nodefaultctor MAT2d_BiInt;
class MAT2d_BiInt {
	public:
		/****************** FirstIndex ******************/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", ":rtype: int") FirstIndex;
		Standard_Integer FirstIndex ();

		/****************** FirstIndex ******************/
		%feature("compactdefaultargs") FirstIndex;
		%feature("autodoc", ":param I1:
	:type I1: int
	:rtype: None") FirstIndex;
		void FirstIndex (const Standard_Integer I1);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param B:
	:type B: MAT2d_BiInt
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const MAT2d_BiInt & B);

		/****************** MAT2d_BiInt ******************/
		%feature("compactdefaultargs") MAT2d_BiInt;
		%feature("autodoc", ":param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:rtype: None") MAT2d_BiInt;
		 MAT2d_BiInt (const Standard_Integer I1,const Standard_Integer I2);

		/****************** SecondIndex ******************/
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", ":rtype: int") SecondIndex;
		Standard_Integer SecondIndex ();

		/****************** SecondIndex ******************/
		%feature("compactdefaultargs") SecondIndex;
		%feature("autodoc", ":param I2:
	:type I2: int
	:rtype: None") SecondIndex;
		void SecondIndex (const Standard_Integer I2);


        %extend{
            bool __eq_wrapper__(const MAT2d_BiInt  other) {
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
%nodefaultctor MAT2d_Circuit;
class MAT2d_Circuit : public Standard_Transient {
	public:
		/****************** Connexion ******************/
		%feature("compactdefaultargs") Connexion;
		%feature("autodoc", "* Returns the Connexion on the item <Index> in me.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<MAT2d_Connexion>") Connexion;
		opencascade::handle<MAT2d_Connexion> Connexion (const Standard_Integer Index);

		/****************** ConnexionOn ******************/
		%feature("compactdefaultargs") ConnexionOn;
		%feature("autodoc", "* Returns <True> is there is a connexion on the item <Index> in <self>.
	:param Index:
	:type Index: int
	:rtype: bool") ConnexionOn;
		Standard_Boolean ConnexionOn (const Standard_Integer Index);

		/****************** LineLength ******************/
		%feature("compactdefaultargs") LineLength;
		%feature("autodoc", "* Returns the number of items on the line <IndexLine>.
	:param IndexLine:
	:type IndexLine: int
	:rtype: int") LineLength;
		Standard_Integer LineLength (const Standard_Integer IndexLine);

		/****************** MAT2d_Circuit ******************/
		%feature("compactdefaultargs") MAT2d_Circuit;
		%feature("autodoc", ":param aJoinType: default value is GeomAbs_Arc
	:type aJoinType: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None") MAT2d_Circuit;
		 MAT2d_Circuit (const GeomAbs_JoinType aJoinType = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);

		/****************** NumberOfItems ******************/
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "* Returns the Number of Items .
	:rtype: int") NumberOfItems;
		Standard_Integer NumberOfItems ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param aFigure:
	:type aFigure: MAT2d_SequenceOfSequenceOfGeometry
	:param IsClosed:
	:type IsClosed: TColStd_SequenceOfBoolean
	:param IndRefLine:
	:type IndRefLine: int
	:param Trigo:
	:type Trigo: bool
	:rtype: None") Perform;
		void Perform (MAT2d_SequenceOfSequenceOfGeometry & aFigure,const TColStd_SequenceOfBoolean & IsClosed,const Standard_Integer IndRefLine,const Standard_Boolean Trigo);

		/****************** RefToEqui ******************/
		%feature("compactdefaultargs") RefToEqui;
		%feature("autodoc", "* Returns the set of index of the items in <self>corresponding to the curve <IndCurve> on the line <IndLine> from the initial figure.
	:param IndLine:
	:type IndLine: int
	:param IndCurve:
	:type IndCurve: int
	:rtype: TColStd_SequenceOfInteger") RefToEqui;
		const TColStd_SequenceOfInteger & RefToEqui (const Standard_Integer IndLine,const Standard_Integer IndCurve);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the item at position <Index> in <self>.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Geometry>") Value;
		opencascade::handle<Geom2d_Geometry> Value (const Standard_Integer Index);

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
%nodefaultctor MAT2d_Connexion;
class MAT2d_Connexion : public Standard_Transient {
	public:
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Returns the distance between the two points.
	:rtype: float") Distance;
		Standard_Real Distance ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", ":param aDistance:
	:type aDistance: float
	:rtype: None") Distance;
		void Distance (const Standard_Real aDistance);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Print <self>.
	:param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);

		/****************** IndexFirstLine ******************/
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", "* Returns the Index on the first line.
	:rtype: int") IndexFirstLine;
		Standard_Integer IndexFirstLine ();

		/****************** IndexFirstLine ******************/
		%feature("compactdefaultargs") IndexFirstLine;
		%feature("autodoc", ":param anIndex:
	:type anIndex: int
	:rtype: None") IndexFirstLine;
		void IndexFirstLine (const Standard_Integer anIndex);

		/****************** IndexItemOnFirst ******************/
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", "* Returns the Index of the item on the first line.
	:rtype: int") IndexItemOnFirst;
		Standard_Integer IndexItemOnFirst ();

		/****************** IndexItemOnFirst ******************/
		%feature("compactdefaultargs") IndexItemOnFirst;
		%feature("autodoc", ":param anIndex:
	:type anIndex: int
	:rtype: None") IndexItemOnFirst;
		void IndexItemOnFirst (const Standard_Integer anIndex);

		/****************** IndexItemOnSecond ******************/
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", "* Returns the Index of the item on the second line.
	:rtype: int") IndexItemOnSecond;
		Standard_Integer IndexItemOnSecond ();

		/****************** IndexItemOnSecond ******************/
		%feature("compactdefaultargs") IndexItemOnSecond;
		%feature("autodoc", ":param anIndex:
	:type anIndex: int
	:rtype: None") IndexItemOnSecond;
		void IndexItemOnSecond (const Standard_Integer anIndex);

		/****************** IndexSecondLine ******************/
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", "* Returns the Index on the Second line.
	:rtype: int") IndexSecondLine;
		Standard_Integer IndexSecondLine ();

		/****************** IndexSecondLine ******************/
		%feature("compactdefaultargs") IndexSecondLine;
		%feature("autodoc", ":param anIndex:
	:type anIndex: int
	:rtype: None") IndexSecondLine;
		void IndexSecondLine (const Standard_Integer anIndex);

		/****************** IsAfter ******************/
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "* Returns <True> if my firstPoint is on the same line than the firstpoint of <aConnexion> and my firstpoint is after the firstpoint of <aConnexion> on the line. <aSense> = 1 if <aConnexion> is on the Left of its firstline, else <aSense> = -1.
	:param aConnexion:
	:type aConnexion: MAT2d_Connexion
	:param aSense:
	:type aSense: float
	:rtype: bool") IsAfter;
		Standard_Boolean IsAfter (const opencascade::handle<MAT2d_Connexion> & aConnexion,const Standard_Real aSense);

		/****************** MAT2d_Connexion ******************/
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", ":rtype: None") MAT2d_Connexion;
		 MAT2d_Connexion ();

		/****************** MAT2d_Connexion ******************/
		%feature("compactdefaultargs") MAT2d_Connexion;
		%feature("autodoc", ":param LineA:
	:type LineA: int
	:param LineB:
	:type LineB: int
	:param ItemA:
	:type ItemA: int
	:param ItemB:
	:type ItemB: int
	:param Distance:
	:type Distance: float
	:param ParameterOnA:
	:type ParameterOnA: float
	:param ParameterOnB:
	:type ParameterOnB: float
	:param PointA:
	:type PointA: gp_Pnt2d
	:param PointB:
	:type PointB: gp_Pnt2d
	:rtype: None") MAT2d_Connexion;
		 MAT2d_Connexion (const Standard_Integer LineA,const Standard_Integer LineB,const Standard_Integer ItemA,const Standard_Integer ItemB,const Standard_Real Distance,const Standard_Real ParameterOnA,const Standard_Real ParameterOnB,const gp_Pnt2d & PointA,const gp_Pnt2d & PointB);

		/****************** ParameterOnFirst ******************/
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", "* Returns the parameter of the point on the firstline.
	:rtype: float") ParameterOnFirst;
		Standard_Real ParameterOnFirst ();

		/****************** ParameterOnFirst ******************/
		%feature("compactdefaultargs") ParameterOnFirst;
		%feature("autodoc", ":param aParameter:
	:type aParameter: float
	:rtype: None") ParameterOnFirst;
		void ParameterOnFirst (const Standard_Real aParameter);

		/****************** ParameterOnSecond ******************/
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", "* Returns the parameter of the point on the secondline.
	:rtype: float") ParameterOnSecond;
		Standard_Real ParameterOnSecond ();

		/****************** ParameterOnSecond ******************/
		%feature("compactdefaultargs") ParameterOnSecond;
		%feature("autodoc", ":param aParameter:
	:type aParameter: float
	:rtype: None") ParameterOnSecond;
		void ParameterOnSecond (const Standard_Real aParameter);

		/****************** PointOnFirst ******************/
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", "* Returns the point on the firstline.
	:rtype: gp_Pnt2d") PointOnFirst;
		gp_Pnt2d PointOnFirst ();

		/****************** PointOnFirst ******************/
		%feature("compactdefaultargs") PointOnFirst;
		%feature("autodoc", ":param aPoint:
	:type aPoint: gp_Pnt2d
	:rtype: None") PointOnFirst;
		void PointOnFirst (const gp_Pnt2d & aPoint);

		/****************** PointOnSecond ******************/
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", "* Returns the point on the secondline.
	:rtype: gp_Pnt2d") PointOnSecond;
		gp_Pnt2d PointOnSecond ();

		/****************** PointOnSecond ******************/
		%feature("compactdefaultargs") PointOnSecond;
		%feature("autodoc", ":param aPoint:
	:type aPoint: gp_Pnt2d
	:rtype: None") PointOnSecond;
		void PointOnSecond (const gp_Pnt2d & aPoint);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* Returns the reverse connexion of <self>. the firstpoint is the secondpoint. the secondpoint is the firstpoint.
	:rtype: opencascade::handle<MAT2d_Connexion>") Reverse;
		opencascade::handle<MAT2d_Connexion> Reverse ();

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
		%feature("autodoc", "* Computes a hash code for the given key, in the range [1, theUpperBound] @param theKey the key which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theKey:
	:type theKey: MAT2d_BiInt
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const MAT2d_BiInt & theKey,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param Key1:
	:type Key1: MAT2d_BiInt
	:param Key2:
	:type Key2: MAT2d_BiInt
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const MAT2d_BiInt & Key1,const MAT2d_BiInt & Key2);

};


%extend MAT2d_MapBiIntHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class MAT2d_Mat2d *
********************/
%nodefaultctor MAT2d_Mat2d;
class MAT2d_Mat2d {
	public:
		/****************** Bisector ******************/
		%feature("compactdefaultargs") Bisector;
		%feature("autodoc", "* Returns the current root.
	:rtype: opencascade::handle<MAT_Bisector>") Bisector;
		opencascade::handle<MAT_Bisector> Bisector ();

		/****************** CreateMat ******************/
		%feature("compactdefaultargs") CreateMat;
		%feature("autodoc", "* Algoritm of computation of the bisecting locus.
	:param aTool:
	:type aTool: MAT2d_Tool2d
	:rtype: None") CreateMat;
		void CreateMat (MAT2d_Tool2d & aTool);

		/****************** CreateMatOpen ******************/
		%feature("compactdefaultargs") CreateMatOpen;
		%feature("autodoc", "* Algoritm of computation of the bisecting locus for open wire.
	:param aTool:
	:type aTool: MAT2d_Tool2d
	:rtype: None") CreateMatOpen;
		void CreateMatOpen (MAT2d_Tool2d & aTool);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize an iterator on the set of the roots of the trees of bisectors.
	:rtype: None") Init;
		void Init ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns <True> if CreateMat has succeeded.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MAT2d_Mat2d ******************/
		%feature("compactdefaultargs") MAT2d_Mat2d;
		%feature("autodoc", "* Empty construtor.
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None") MAT2d_Mat2d;
		 MAT2d_Mat2d (const Standard_Boolean IsOpenResult = Standard_False);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Return False if there is no more roots.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move to the next root.
	:rtype: None") Next;
		void Next ();

		/****************** NumberOfBisectors ******************/
		%feature("compactdefaultargs") NumberOfBisectors;
		%feature("autodoc", "* Returns the total number of bisectors.
	:rtype: int") NumberOfBisectors;
		Standard_Integer NumberOfBisectors ();

		/****************** SemiInfinite ******************/
		%feature("compactdefaultargs") SemiInfinite;
		%feature("autodoc", "* Returns True if there are semi_infinite bisectors. So there is a tree for each semi_infinte bisector.
	:rtype: bool") SemiInfinite;
		Standard_Boolean SemiInfinite ();

};


%extend MAT2d_Mat2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class MAT2d_MiniPath *
***********************/
%nodefaultctor MAT2d_MiniPath;
class MAT2d_MiniPath {
	public:
		/****************** ConnexionsFrom ******************/
		%feature("compactdefaultargs") ConnexionsFrom;
		%feature("autodoc", "* Returns the connexions which start on line designed by <Index>.
	:param Index:
	:type Index: int
	:rtype: MAT2d_SequenceOfConnexion") ConnexionsFrom;
		MAT2d_SequenceOfConnexion & ConnexionsFrom (const Standard_Integer Index);

		/****************** Father ******************/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "* Returns the connexion which ends on line designed by <Index>.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<MAT2d_Connexion>") Father;
		opencascade::handle<MAT2d_Connexion> Father (const Standard_Integer Index);

		/****************** IsConnexionsFrom ******************/
		%feature("compactdefaultargs") IsConnexionsFrom;
		%feature("autodoc", "* Returns <True> if there is one Connexion which starts on line designed by <Index>.
	:param Index:
	:type Index: int
	:rtype: bool") IsConnexionsFrom;
		Standard_Boolean IsConnexionsFrom (const Standard_Integer Index);

		/****************** IsRoot ******************/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "* Returns <True> if the line designed by <Index> is the root.
	:param Index:
	:type Index: int
	:rtype: bool") IsRoot;
		Standard_Boolean IsRoot (const Standard_Integer Index);

		/****************** MAT2d_MiniPath ******************/
		%feature("compactdefaultargs") MAT2d_MiniPath;
		%feature("autodoc", ":rtype: None") MAT2d_MiniPath;
		 MAT2d_MiniPath ();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "* Returns the sequence of connexions corresponding to the path.
	:rtype: MAT2d_SequenceOfConnexion") Path;
		const MAT2d_SequenceOfConnexion & Path ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the path to link the lines in <Figure>. the path starts on the line of index <IndStart> <Sense> = True if the Circuit turns in the trigonometric sense.
	:param Figure:
	:type Figure: MAT2d_SequenceOfSequenceOfGeometry
	:param IndStart:
	:type IndStart: int
	:param Sense:
	:type Sense: bool
	:rtype: None") Perform;
		void Perform (const MAT2d_SequenceOfSequenceOfGeometry & Figure,const Standard_Integer IndStart,const Standard_Boolean Sense);

		/****************** RunOnConnexions ******************/
		%feature("compactdefaultargs") RunOnConnexions;
		%feature("autodoc", "* Run on the set of connexions to compute the path. the path is an exploration of the tree which contains the connexions and their reverses. if the tree of connexions is A / | B E / | | C D F //! the path is A->B, B->C, C->B, B->D, D->B, B->A, A->E, E->F, F->E, E->A.
	:rtype: None") RunOnConnexions;
		void RunOnConnexions ();

};


%extend MAT2d_MiniPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class MAT2d_Tool2d *
*********************/
%nodefaultctor MAT2d_Tool2d;
class MAT2d_Tool2d {
	public:
		/****************** BisecFusion ******************/
		%feature("compactdefaultargs") BisecFusion;
		%feature("autodoc", ":param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:rtype: None") BisecFusion;
		void BisecFusion (const Standard_Integer Index1,const Standard_Integer Index2);

		/****************** ChangeGeomBis ******************/
		%feature("compactdefaultargs") ChangeGeomBis;
		%feature("autodoc", "* Returns the <Bisec> of index <Index> in <theGeomBisectors>.
	:param Index:
	:type Index: int
	:rtype: Bisector_Bisec") ChangeGeomBis;
		Bisector_Bisec & ChangeGeomBis (const Standard_Integer Index);

		/****************** Circuit ******************/
		%feature("compactdefaultargs") Circuit;
		%feature("autodoc", ":rtype: opencascade::handle<MAT2d_Circuit>") Circuit;
		opencascade::handle<MAT2d_Circuit> Circuit ();

		/****************** CreateBisector ******************/
		%feature("compactdefaultargs") CreateBisector;
		%feature("autodoc", "* Creates the geometric bisector defined by <abisector>.
	:param abisector:
	:type abisector: MAT_Bisector
	:rtype: None") CreateBisector;
		void CreateBisector (const opencascade::handle<MAT_Bisector> & abisector);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Returns the distance between the two points designed by their parameters on <abisector>.
	:param abisector:
	:type abisector: MAT_Bisector
	:param param1:
	:type param1: float
	:param param2:
	:type param2: float
	:rtype: float") Distance;
		Standard_Real Distance (const opencascade::handle<MAT_Bisector> & abisector,const Standard_Real param1,const Standard_Real param2);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* displays informations about the bisector defined by <bisector>.
	:param bisector:
	:type bisector: int
	:param erease:
	:type erease: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer bisector,const Standard_Integer erease);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Creates the point at the origin of the bisector between anitem and the previous item. dist is the distance from the FirstPoint to <anitem>. Returns the index of this point in <theGeomPnts>.
	:param anitem:
	:type anitem: int
	:param dist:
	:type dist: float
	:rtype: int") FirstPoint;
		Standard_Integer FirstPoint (const Standard_Integer anitem,Standard_Real &OutValue);

		/****************** GeomBis ******************/
		%feature("compactdefaultargs") GeomBis;
		%feature("autodoc", "* Returns the <Bisec> of index <Index> in <theGeomBisectors>.
	:param Index:
	:type Index: int
	:rtype: Bisector_Bisec") GeomBis;
		const Bisector_Bisec & GeomBis (const Standard_Integer Index);

		/****************** GeomElt ******************/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "* Returns the Geometry of index <Index> in <theGeomElts>.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Geometry>") GeomElt;
		opencascade::handle<Geom2d_Geometry> GeomElt (const Standard_Integer Index);

		/****************** GeomPnt ******************/
		%feature("compactdefaultargs") GeomPnt;
		%feature("autodoc", "* Returns the point of index <Index> in the <theGeomPnts>.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d") GeomPnt;
		const gp_Pnt2d  GeomPnt (const Standard_Integer Index);

		/****************** GeomVec ******************/
		%feature("compactdefaultargs") GeomVec;
		%feature("autodoc", "* Returns the vector of index <Index> in the <theGeomVecs>.
	:param Index:
	:type Index: int
	:rtype: gp_Vec2d") GeomVec;
		const gp_Vec2d  GeomVec (const Standard_Integer Index);

		/****************** InitItems ******************/
		%feature("compactdefaultargs") InitItems;
		%feature("autodoc", "* InitItems cuts the line in Items. this Items are the geometrics representations of the BasicElts from MAT.
	:param aCircuit:
	:type aCircuit: MAT2d_Circuit
	:rtype: None") InitItems;
		void InitItems (const opencascade::handle<MAT2d_Circuit> & aCircuit);

		/****************** IntersectBisector ******************/
		%feature("compactdefaultargs") IntersectBisector;
		%feature("autodoc", "* Computes the point of intersection between the bisectors defined by <bisectorone> and <bisectortwo> . If this point exists, <intpnt> is its index in <theGeomPnts> and Return the distance of the point from the bisector else Return <RealLast>.
	:param bisectorone:
	:type bisectorone: MAT_Bisector
	:param bisectortwo:
	:type bisectortwo: MAT_Bisector
	:param intpnt:
	:type intpnt: int
	:rtype: float") IntersectBisector;
		Standard_Real IntersectBisector (const opencascade::handle<MAT_Bisector> & bisectorone,const opencascade::handle<MAT_Bisector> & bisectortwo,Standard_Integer &OutValue);

		/****************** MAT2d_Tool2d ******************/
		%feature("compactdefaultargs") MAT2d_Tool2d;
		%feature("autodoc", "* Empty Constructor.
	:rtype: None") MAT2d_Tool2d;
		 MAT2d_Tool2d ();

		/****************** NumberOfItems ******************/
		%feature("compactdefaultargs") NumberOfItems;
		%feature("autodoc", "* Returns the Number of Items .
	:rtype: int") NumberOfItems;
		Standard_Integer NumberOfItems ();

		/****************** Sense ******************/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "* <aSide> defines the side of the computation of the map.
	:param aside:
	:type aside: MAT_Side
	:rtype: None") Sense;
		void Sense (const MAT_Side aside);

		/****************** SetJoinType ******************/
		%feature("compactdefaultargs") SetJoinType;
		%feature("autodoc", ":param aJoinType:
	:type aJoinType: GeomAbs_JoinType
	:rtype: None") SetJoinType;
		void SetJoinType (const GeomAbs_JoinType aJoinType);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "* Creates the Tangent at the end of the bisector defined by <bisector>. Returns the index of this vector in <theGeomVecs>
	:param bisector:
	:type bisector: int
	:rtype: int") Tangent;
		Standard_Integer Tangent (const Standard_Integer bisector);

		/****************** TangentAfter ******************/
		%feature("compactdefaultargs") TangentAfter;
		%feature("autodoc", "* Creates the Reversed Tangent at the origin of the Item defined by <anitem>. Returns the index of this vector in <theGeomVecs>
	:param anitem:
	:type anitem: int
	:param IsOpenResult:
	:type IsOpenResult: bool
	:rtype: int") TangentAfter;
		Standard_Integer TangentAfter (const Standard_Integer anitem,const Standard_Boolean IsOpenResult);

		/****************** TangentBefore ******************/
		%feature("compactdefaultargs") TangentBefore;
		%feature("autodoc", "* Creates the Tangent at the end of the Item defined by <anitem>. Returns the index of this vector in <theGeomVecs>
	:param anitem:
	:type anitem: int
	:param IsOpenResult:
	:type IsOpenResult: bool
	:rtype: int") TangentBefore;
		Standard_Integer TangentBefore (const Standard_Integer anitem,const Standard_Boolean IsOpenResult);

		/****************** ToleranceOfConfusion ******************/
		%feature("compactdefaultargs") ToleranceOfConfusion;
		%feature("autodoc", "* Returns tolerance to test the confusion of two points.
	:rtype: float") ToleranceOfConfusion;
		Standard_Real ToleranceOfConfusion ();

		/****************** TrimBisector ******************/
		%feature("compactdefaultargs") TrimBisector;
		%feature("autodoc", "* Trims the geometric bisector by the <firstparameter> of <abisector>. If the parameter is out of the bisector, Return False. else Return True.
	:param abisector:
	:type abisector: MAT_Bisector
	:rtype: bool") TrimBisector;
		Standard_Boolean TrimBisector (const opencascade::handle<MAT_Bisector> & abisector);

		/****************** TrimBisector ******************/
		%feature("compactdefaultargs") TrimBisector;
		%feature("autodoc", "* Trims the geometric bisector by the point of index <apoint> in <theGeomPnts>. If the point is out of the bisector, Return False. else Return True.
	:param abisector:
	:type abisector: MAT_Bisector
	:param apoint:
	:type apoint: int
	:rtype: bool") TrimBisector;
		Standard_Boolean TrimBisector (const opencascade::handle<MAT_Bisector> & abisector,const Standard_Integer apoint);

};


%extend MAT2d_Tool2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
