/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") MAT2d

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include MAT2d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor MAT2d_Array2OfConnexion;
class MAT2d_Array2OfConnexion {
	public:
		%feature("autodoc", "	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") MAT2d_Array2OfConnexion;
		 MAT2d_Array2OfConnexion (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param Item:
	:type Item: Handle_MAT2d_Connexion &
	:param R1:
	:type R1: Standard_Integer
	:param R2:
	:type R2: Standard_Integer
	:param C1:
	:type C1: Standard_Integer
	:param C2:
	:type C2: Standard_Integer
	:rtype: None
") MAT2d_Array2OfConnexion;
		 MAT2d_Array2OfConnexion (const Handle_MAT2d_Connexion & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "	:param V:
	:type V: Handle_MAT2d_Connexion &
	:rtype: None
") Init;
		void Init (const Handle_MAT2d_Connexion & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_Array2OfConnexion &
	:rtype: MAT2d_Array2OfConnexion
") Assign;
		const MAT2d_Array2OfConnexion & Assign (const MAT2d_Array2OfConnexion & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_Array2OfConnexion &
	:rtype: MAT2d_Array2OfConnexion
") operator=;
		const MAT2d_Array2OfConnexion & operator = (const MAT2d_Array2OfConnexion & Other);
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:param Value:
	:type Value: Handle_MAT2d_Connexion &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_MAT2d_Connexion & Value);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_MAT2d_Connexion
") Value;
		const Handle_MAT2d_Connexion & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "	:param Row:
	:type Row: Standard_Integer
	:param Col:
	:type Col: Standard_Integer
	:rtype: Handle_MAT2d_Connexion
") ChangeValue;
		Handle_MAT2d_Connexion & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") MAT2d_Array2OfConnexion::~MAT2d_Array2OfConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_Array2OfConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_BiInt;
class MAT2d_BiInt {
	public:
		%feature("autodoc", "	:param I1:
	:type I1: Standard_Integer
	:param I2:
	:type I2: Standard_Integer
	:rtype: None
") MAT2d_BiInt;
		 MAT2d_BiInt (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "	:rtype: int
") FirstIndex;
		Standard_Integer FirstIndex ();
		%feature("autodoc", "	:rtype: int
") SecondIndex;
		Standard_Integer SecondIndex ();
		%feature("autodoc", "	:param I1:
	:type I1: Standard_Integer
	:rtype: None
") FirstIndex;
		void FirstIndex (const Standard_Integer I1);
		%feature("autodoc", "	:param I2:
	:type I2: Standard_Integer
	:rtype: None
") SecondIndex;
		void SecondIndex (const Standard_Integer I2);
		%feature("autodoc", "	:param B:
	:type B: MAT2d_BiInt &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const MAT2d_BiInt & B);

        %extend{
            bool __eq_wrapper__(const MAT2d_BiInt  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%feature("shadow") MAT2d_BiInt::~MAT2d_BiInt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_BiInt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_Circuit;
class MAT2d_Circuit : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_Circuit;
		 MAT2d_Circuit ();
		%feature("autodoc", "	:param aFigure:
	:type aFigure: MAT2d_SequenceOfSequenceOfGeometry &
	:param IsClosed:
	:type IsClosed: TColStd_SequenceOfBoolean &
	:param IndRefLine:
	:type IndRefLine: Standard_Integer
	:param Trigo:
	:type Trigo: bool
	:rtype: None
") Perform;
		void Perform (MAT2d_SequenceOfSequenceOfGeometry & aFigure,const TColStd_SequenceOfBoolean & IsClosed,const Standard_Integer IndRefLine,const Standard_Boolean Trigo);
		%feature("autodoc", "	* Returns the Number of Items .

	:rtype: int
") NumberOfItems;
		Standard_Integer NumberOfItems ();
		%feature("autodoc", "	* Returns the item at position <Index> in <self>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Geometry
") Value;
		Handle_Geom2d_Geometry Value (const Standard_Integer Index);
		%feature("autodoc", "	* Returns the number of items on the line <IndexLine>.

	:param IndexLine:
	:type IndexLine: Standard_Integer
	:rtype: int
") LineLength;
		Standard_Integer LineLength (const Standard_Integer IndexLine);
		%feature("autodoc", "	* Returns the set of index of the items in <self>corresponding to the curve <IndCurve> on the line <IndLine> from the initial figure.

	:param IndLine:
	:type IndLine: Standard_Integer
	:param IndCurve:
	:type IndCurve: Standard_Integer
	:rtype: TColStd_SequenceOfInteger
") RefToEqui;
		const TColStd_SequenceOfInteger & RefToEqui (const Standard_Integer IndLine,const Standard_Integer IndCurve);
		%feature("autodoc", "	* Returns the Connexion on the item <Index> in me.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT2d_Connexion
") Connexion;
		Handle_MAT2d_Connexion Connexion (const Standard_Integer Index);
		%feature("autodoc", "	* Returns <True> is there is a connexion on the item <Index> in <self>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: bool
") ConnexionOn;
		Standard_Boolean ConnexionOn (const Standard_Integer Index);
};


%feature("shadow") MAT2d_Circuit::~MAT2d_Circuit %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_Circuit {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_Circuit {
	Handle_MAT2d_Circuit GetHandle() {
	return *(Handle_MAT2d_Circuit*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_Circuit;
class Handle_MAT2d_Circuit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT2d_Circuit();
        Handle_MAT2d_Circuit(const Handle_MAT2d_Circuit &aHandle);
        Handle_MAT2d_Circuit(const MAT2d_Circuit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_Circuit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_Circuit {
    MAT2d_Circuit* GetObject() {
    return (MAT2d_Circuit*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_Circuit::~Handle_MAT2d_Circuit %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_Circuit {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_Connexion;
class MAT2d_Connexion : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_Connexion;
		 MAT2d_Connexion ();
		%feature("autodoc", "	:param LineA:
	:type LineA: Standard_Integer
	:param LineB:
	:type LineB: Standard_Integer
	:param ItemA:
	:type ItemA: Standard_Integer
	:param ItemB:
	:type ItemB: Standard_Integer
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
	:rtype: None
") MAT2d_Connexion;
		 MAT2d_Connexion (const Standard_Integer LineA,const Standard_Integer LineB,const Standard_Integer ItemA,const Standard_Integer ItemB,const Standard_Real Distance,const Standard_Real ParameterOnA,const Standard_Real ParameterOnB,const gp_Pnt2d & PointA,const gp_Pnt2d & PointB);
		%feature("autodoc", "	* Returns the Index on the first line.

	:rtype: int
") IndexFirstLine;
		Standard_Integer IndexFirstLine ();
		%feature("autodoc", "	* Returns the Index on the Second line.

	:rtype: int
") IndexSecondLine;
		Standard_Integer IndexSecondLine ();
		%feature("autodoc", "	* Returns the Index of the item on the first line.

	:rtype: int
") IndexItemOnFirst;
		Standard_Integer IndexItemOnFirst ();
		%feature("autodoc", "	* Returns the Index of the item on the second line.

	:rtype: int
") IndexItemOnSecond;
		Standard_Integer IndexItemOnSecond ();
		%feature("autodoc", "	* Returns the parameter of the point on the firstline.

	:rtype: float
") ParameterOnFirst;
		Standard_Real ParameterOnFirst ();
		%feature("autodoc", "	* Returns the parameter of the point on the secondline.

	:rtype: float
") ParameterOnSecond;
		Standard_Real ParameterOnSecond ();
		%feature("autodoc", "	* Returns the point on the firstline.

	:rtype: gp_Pnt2d
") PointOnFirst;
		gp_Pnt2d PointOnFirst ();
		%feature("autodoc", "	* Returns the point on the secondline.

	:rtype: gp_Pnt2d
") PointOnSecond;
		gp_Pnt2d PointOnSecond ();
		%feature("autodoc", "	* Returns the distance between the two points.

	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") IndexFirstLine;
		void IndexFirstLine (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") IndexSecondLine;
		void IndexSecondLine (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") IndexItemOnFirst;
		void IndexItemOnFirst (const Standard_Integer anIndex);
		%feature("autodoc", "	:param anIndex:
	:type anIndex: Standard_Integer
	:rtype: None
") IndexItemOnSecond;
		void IndexItemOnSecond (const Standard_Integer anIndex);
		%feature("autodoc", "	:param aParameter:
	:type aParameter: float
	:rtype: None
") ParameterOnFirst;
		void ParameterOnFirst (const Standard_Real aParameter);
		%feature("autodoc", "	:param aParameter:
	:type aParameter: float
	:rtype: None
") ParameterOnSecond;
		void ParameterOnSecond (const Standard_Real aParameter);
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt2d
	:rtype: None
") PointOnFirst;
		void PointOnFirst (const gp_Pnt2d & aPoint);
		%feature("autodoc", "	:param aPoint:
	:type aPoint: gp_Pnt2d
	:rtype: None
") PointOnSecond;
		void PointOnSecond (const gp_Pnt2d & aPoint);
		%feature("autodoc", "	:param aDistance:
	:type aDistance: float
	:rtype: None
") Distance;
		void Distance (const Standard_Real aDistance);
		%feature("autodoc", "	* Returns the reverse connexion of <self>. the firstpoint is the secondpoint. the secondpoint is the firstpoint.

	:rtype: Handle_MAT2d_Connexion
") Reverse;
		Handle_MAT2d_Connexion Reverse ();
		%feature("autodoc", "	* Returns <True> if my firstPoint is on the same line than the firstpoint of <aConnexion> and my firstpoint is after the firstpoint of <aConnexion> on the line. <aSense> = 1 if <aConnexion> is on the Left of its firstline, else <aSense> = -1.

	:param aConnexion:
	:type aConnexion: Handle_MAT2d_Connexion &
	:param aSense:
	:type aSense: float
	:rtype: bool
") IsAfter;
		Standard_Boolean IsAfter (const Handle_MAT2d_Connexion & aConnexion,const Standard_Real aSense);
		%feature("autodoc", "	* Print <self>.

	:param Deep: default value is 0
	:type Deep: Standard_Integer
	:param Offset: default value is 0
	:type Offset: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
};


%feature("shadow") MAT2d_Connexion::~MAT2d_Connexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_Connexion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_Connexion {
	Handle_MAT2d_Connexion GetHandle() {
	return *(Handle_MAT2d_Connexion*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_Connexion;
class Handle_MAT2d_Connexion : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_MAT2d_Connexion();
        Handle_MAT2d_Connexion(const Handle_MAT2d_Connexion &aHandle);
        Handle_MAT2d_Connexion(const MAT2d_Connexion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_Connexion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_Connexion {
    MAT2d_Connexion* GetObject() {
    return (MAT2d_Connexion*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_Connexion::~Handle_MAT2d_Connexion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_Connexion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
class MAT2d_DataMapIteratorOfDataMapOfBiIntInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntInteger ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfBiIntInteger &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntInteger (const MAT2d_DataMapOfBiIntInteger & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfBiIntInteger &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfBiIntInteger & aMap);
		%feature("autodoc", "	:rtype: MAT2d_BiInt
") Key;
		const MAT2d_BiInt & Key ();
		%feature("autodoc", "	:rtype: int
") Value;
		const Standard_Integer & Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfBiIntInteger::~MAT2d_DataMapIteratorOfDataMapOfBiIntInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfBiIntInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
class MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfBiIntSequenceOfInteger &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger (const MAT2d_DataMapOfBiIntSequenceOfInteger & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfBiIntSequenceOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfBiIntSequenceOfInteger & aMap);
		%feature("autodoc", "	:rtype: MAT2d_BiInt
") Key;
		const MAT2d_BiInt & Key ();
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Value;
		const TColStd_SequenceOfInteger & Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger::~MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
class MAT2d_DataMapIteratorOfDataMapOfIntegerBisec : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerBisec ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerBisec &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerBisec (const MAT2d_DataMapOfIntegerBisec & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerBisec &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerBisec & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: Bisector_Bisec
") Value;
		const Bisector_Bisec & Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfIntegerBisec::~MAT2d_DataMapIteratorOfDataMapOfIntegerBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfIntegerBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
class MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerConnexion &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion (const MAT2d_DataMapOfIntegerConnexion & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerConnexion &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerConnexion & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: Handle_MAT2d_Connexion
") Value;
		const Handle_MAT2d_Connexion & Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion::~MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
class MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerPnt2d &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d (const MAT2d_DataMapOfIntegerPnt2d & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerPnt2d &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerPnt2d & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d::~MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
class MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerSequenceOfConnexion &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion (const MAT2d_DataMapOfIntegerSequenceOfConnexion & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerSequenceOfConnexion &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerSequenceOfConnexion & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: MAT2d_SequenceOfConnexion
") Value;
		const MAT2d_SequenceOfConnexion & Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion::~MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
class MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d ();
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerVec2d &
	:rtype: None
") MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d (const MAT2d_DataMapOfIntegerVec2d & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: MAT2d_DataMapOfIntegerVec2d &
	:rtype: None
") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerVec2d & aMap);
		%feature("autodoc", "	:rtype: int
") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") Value;
		const gp_Vec2d  Value ();
};


%feature("shadow") MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d::~MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapNodeOfDataMapOfBiIntInteger;
class MAT2d_DataMapNodeOfDataMapOfBiIntInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:param I:
	:type I: Standard_Integer &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfBiIntInteger;
		 MAT2d_DataMapNodeOfDataMapOfBiIntInteger (const MAT2d_BiInt & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: MAT2d_BiInt
") Key;
		MAT2d_BiInt & Key ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetValue() {
                return (Standard_Integer) $self->Value();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetValue(Standard_Integer value ) {
                $self->Value()=value;
                }
            };
            };


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfBiIntInteger::~MAT2d_DataMapNodeOfDataMapOfBiIntInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfBiIntInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfBiIntInteger {
	Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger;
class Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger();
        Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger(const Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger(const MAT2d_DataMapNodeOfDataMapOfBiIntInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger {
    MAT2d_DataMapNodeOfDataMapOfBiIntInteger* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfBiIntInteger*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger::~Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfBiIntInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger;
class MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger (const MAT2d_BiInt & K,const TColStd_SequenceOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: MAT2d_BiInt
") Key;
		MAT2d_BiInt & Key ();
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Value;
		TColStd_SequenceOfInteger & Value ();
};


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger::~MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger {
	Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger;
class Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger();
        Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger(const Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger(const MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger {
    MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger::~Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapNodeOfDataMapOfIntegerBisec;
class MAT2d_DataMapNodeOfDataMapOfIntegerBisec : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Bisector_Bisec &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfIntegerBisec;
		 MAT2d_DataMapNodeOfDataMapOfIntegerBisec (Standard_Integer &OutValue,const Bisector_Bisec & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: Bisector_Bisec
") Value;
		Bisector_Bisec & Value ();
};


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfIntegerBisec::~MAT2d_DataMapNodeOfDataMapOfIntegerBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfIntegerBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfIntegerBisec {
	Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec;
class Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec();
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec(const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec(const MAT2d_DataMapNodeOfDataMapOfIntegerBisec *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec {
    MAT2d_DataMapNodeOfDataMapOfIntegerBisec* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfIntegerBisec*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec::~Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerBisec {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapNodeOfDataMapOfIntegerConnexion;
class MAT2d_DataMapNodeOfDataMapOfIntegerConnexion : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT2d_Connexion &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfIntegerConnexion;
		 MAT2d_DataMapNodeOfDataMapOfIntegerConnexion (Standard_Integer &OutValue,const Handle_MAT2d_Connexion & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: Handle_MAT2d_Connexion
") Value;
		Handle_MAT2d_Connexion & Value ();
};


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfIntegerConnexion::~MAT2d_DataMapNodeOfDataMapOfIntegerConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfIntegerConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfIntegerConnexion {
	Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion;
class Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion();
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion(const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion(const MAT2d_DataMapNodeOfDataMapOfIntegerConnexion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion {
    MAT2d_DataMapNodeOfDataMapOfIntegerConnexion* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfIntegerConnexion*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion::~Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerConnexion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d;
class MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: gp_Pnt2d
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d;
		 MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d (Standard_Integer &OutValue,const gp_Pnt2d & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d  Value ();
};


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d::~MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d {
	Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d;
class Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d();
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d(const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d(const MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d {
    MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d::~Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion;
class MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: MAT2d_SequenceOfConnexion &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion (Standard_Integer &OutValue,const MAT2d_SequenceOfConnexion & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: MAT2d_SequenceOfConnexion
") Value;
		MAT2d_SequenceOfConnexion & Value ();
};


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion::~MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion {
	Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion;
class Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion();
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion(const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion(const MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion {
    MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion::~Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapNodeOfDataMapOfIntegerVec2d;
class MAT2d_DataMapNodeOfDataMapOfIntegerVec2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: gp_Vec2d
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") MAT2d_DataMapNodeOfDataMapOfIntegerVec2d;
		 MAT2d_DataMapNodeOfDataMapOfIntegerVec2d (Standard_Integer &OutValue,const gp_Vec2d & I,const TCollection_MapNodePtr & n);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey() {
                return (Standard_Integer) $self->Key();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey(Standard_Integer value ) {
                $self->Key()=value;
                }
            };
            		%feature("autodoc", "	:rtype: gp_Vec2d
") Value;
		gp_Vec2d  Value ();
};


%feature("shadow") MAT2d_DataMapNodeOfDataMapOfIntegerVec2d::~MAT2d_DataMapNodeOfDataMapOfIntegerVec2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapNodeOfDataMapOfIntegerVec2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_DataMapNodeOfDataMapOfIntegerVec2d {
	Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d GetHandle() {
	return *(Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d;
class Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d();
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d(const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d &aHandle);
        Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d(const MAT2d_DataMapNodeOfDataMapOfIntegerVec2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d {
    MAT2d_DataMapNodeOfDataMapOfIntegerVec2d* GetObject() {
    return (MAT2d_DataMapNodeOfDataMapOfIntegerVec2d*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d::~Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_DataMapNodeOfDataMapOfIntegerVec2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_DataMapOfBiIntInteger;
class MAT2d_DataMapOfBiIntInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfBiIntInteger;
		 MAT2d_DataMapOfBiIntInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfBiIntInteger &
	:rtype: MAT2d_DataMapOfBiIntInteger
") Assign;
		MAT2d_DataMapOfBiIntInteger & Assign (const MAT2d_DataMapOfBiIntInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfBiIntInteger &
	:rtype: MAT2d_DataMapOfBiIntInteger
") operator=;
		MAT2d_DataMapOfBiIntInteger & operator = (const MAT2d_DataMapOfBiIntInteger & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:param I:
	:type I: Standard_Integer &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const MAT2d_BiInt & K,Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: int
") Find;
		const Standard_Integer & Find (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: int
") ChangeFind;
		Standard_Integer & ChangeFind (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const MAT2d_BiInt & K);
};


%feature("shadow") MAT2d_DataMapOfBiIntInteger::~MAT2d_DataMapOfBiIntInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfBiIntInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapOfBiIntSequenceOfInteger;
class MAT2d_DataMapOfBiIntSequenceOfInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapOfBiIntSequenceOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfBiIntSequenceOfInteger &
	:rtype: MAT2d_DataMapOfBiIntSequenceOfInteger
") Assign;
		MAT2d_DataMapOfBiIntSequenceOfInteger & Assign (const MAT2d_DataMapOfBiIntSequenceOfInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfBiIntSequenceOfInteger &
	:rtype: MAT2d_DataMapOfBiIntSequenceOfInteger
") operator=;
		MAT2d_DataMapOfBiIntSequenceOfInteger & operator = (const MAT2d_DataMapOfBiIntSequenceOfInteger & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:param I:
	:type I: TColStd_SequenceOfInteger &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const MAT2d_BiInt & K,const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: TColStd_SequenceOfInteger
") Find;
		const TColStd_SequenceOfInteger & Find (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: TColStd_SequenceOfInteger
") ChangeFind;
		TColStd_SequenceOfInteger & ChangeFind (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const MAT2d_BiInt & K);
		%feature("autodoc", "	:param K:
	:type K: MAT2d_BiInt &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const MAT2d_BiInt & K);
};


%feature("shadow") MAT2d_DataMapOfBiIntSequenceOfInteger::~MAT2d_DataMapOfBiIntSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfBiIntSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapOfIntegerBisec;
class MAT2d_DataMapOfIntegerBisec : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfIntegerBisec;
		 MAT2d_DataMapOfIntegerBisec (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerBisec &
	:rtype: MAT2d_DataMapOfIntegerBisec
") Assign;
		MAT2d_DataMapOfIntegerBisec & Assign (const MAT2d_DataMapOfIntegerBisec & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerBisec &
	:rtype: MAT2d_DataMapOfIntegerBisec
") operator=;
		MAT2d_DataMapOfIntegerBisec & operator = (const MAT2d_DataMapOfIntegerBisec & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Bisector_Bisec &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Bisector_Bisec & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Bisector_Bisec
") Find;
		const Bisector_Bisec & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Bisector_Bisec
") ChangeFind;
		Bisector_Bisec & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT2d_DataMapOfIntegerBisec::~MAT2d_DataMapOfIntegerBisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfIntegerBisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapOfIntegerConnexion;
class MAT2d_DataMapOfIntegerConnexion : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfIntegerConnexion;
		 MAT2d_DataMapOfIntegerConnexion (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerConnexion &
	:rtype: MAT2d_DataMapOfIntegerConnexion
") Assign;
		MAT2d_DataMapOfIntegerConnexion & Assign (const MAT2d_DataMapOfIntegerConnexion & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerConnexion &
	:rtype: MAT2d_DataMapOfIntegerConnexion
") operator=;
		MAT2d_DataMapOfIntegerConnexion & operator = (const MAT2d_DataMapOfIntegerConnexion & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: Handle_MAT2d_Connexion &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT2d_Connexion & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT2d_Connexion
") Find;
		const Handle_MAT2d_Connexion & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Handle_MAT2d_Connexion
") ChangeFind;
		Handle_MAT2d_Connexion & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT2d_DataMapOfIntegerConnexion::~MAT2d_DataMapOfIntegerConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfIntegerConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapOfIntegerPnt2d;
class MAT2d_DataMapOfIntegerPnt2d : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfIntegerPnt2d;
		 MAT2d_DataMapOfIntegerPnt2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerPnt2d &
	:rtype: MAT2d_DataMapOfIntegerPnt2d
") Assign;
		MAT2d_DataMapOfIntegerPnt2d & Assign (const MAT2d_DataMapOfIntegerPnt2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerPnt2d &
	:rtype: MAT2d_DataMapOfIntegerPnt2d
") operator=;
		MAT2d_DataMapOfIntegerPnt2d & operator = (const MAT2d_DataMapOfIntegerPnt2d & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: gp_Pnt2d
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const gp_Pnt2d & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: gp_Pnt2d
") Find;
		const gp_Pnt2d  Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: gp_Pnt2d
") ChangeFind;
		gp_Pnt2d  ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT2d_DataMapOfIntegerPnt2d::~MAT2d_DataMapOfIntegerPnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfIntegerPnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapOfIntegerSequenceOfConnexion;
class MAT2d_DataMapOfIntegerSequenceOfConnexion : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapOfIntegerSequenceOfConnexion (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerSequenceOfConnexion &
	:rtype: MAT2d_DataMapOfIntegerSequenceOfConnexion
") Assign;
		MAT2d_DataMapOfIntegerSequenceOfConnexion & Assign (const MAT2d_DataMapOfIntegerSequenceOfConnexion & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerSequenceOfConnexion &
	:rtype: MAT2d_DataMapOfIntegerSequenceOfConnexion
") operator=;
		MAT2d_DataMapOfIntegerSequenceOfConnexion & operator = (const MAT2d_DataMapOfIntegerSequenceOfConnexion & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: MAT2d_SequenceOfConnexion &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const MAT2d_SequenceOfConnexion & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: MAT2d_SequenceOfConnexion
") Find;
		const MAT2d_SequenceOfConnexion & Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: MAT2d_SequenceOfConnexion
") ChangeFind;
		MAT2d_SequenceOfConnexion & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT2d_DataMapOfIntegerSequenceOfConnexion::~MAT2d_DataMapOfIntegerSequenceOfConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfIntegerSequenceOfConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_DataMapOfIntegerVec2d;
class MAT2d_DataMapOfIntegerVec2d : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") MAT2d_DataMapOfIntegerVec2d;
		 MAT2d_DataMapOfIntegerVec2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerVec2d &
	:rtype: MAT2d_DataMapOfIntegerVec2d
") Assign;
		MAT2d_DataMapOfIntegerVec2d & Assign (const MAT2d_DataMapOfIntegerVec2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_DataMapOfIntegerVec2d &
	:rtype: MAT2d_DataMapOfIntegerVec2d
") operator=;
		MAT2d_DataMapOfIntegerVec2d & operator = (const MAT2d_DataMapOfIntegerVec2d & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:param I:
	:type I: gp_Vec2d
	:rtype: bool
") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const gp_Vec2d & I);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: gp_Vec2d
") Find;
		const gp_Vec2d  Find (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: gp_Vec2d
") ChangeFind;
		gp_Vec2d  ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "	:param K:
	:type K: Standard_Integer &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (Standard_Integer &OutValue);
};


%feature("shadow") MAT2d_DataMapOfIntegerVec2d::~MAT2d_DataMapOfIntegerVec2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_DataMapOfIntegerVec2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_MapBiIntHasher;
class MAT2d_MapBiIntHasher {
	public:
		%feature("autodoc", "	:param Key1:
	:type Key1: MAT2d_BiInt &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const MAT2d_BiInt & Key1,const Standard_Integer Upper);
		%feature("autodoc", "	:param Key1:
	:type Key1: MAT2d_BiInt &
	:param Key2:
	:type Key2: MAT2d_BiInt &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const MAT2d_BiInt & Key1,const MAT2d_BiInt & Key2);
};


%feature("shadow") MAT2d_MapBiIntHasher::~MAT2d_MapBiIntHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_MapBiIntHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_Mat2d;
class MAT2d_Mat2d {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_Mat2d;
		 MAT2d_Mat2d ();
		%feature("autodoc", "	:param aTool:
	:type aTool: MAT2d_Tool2d &
	:rtype: None
") CreateMat;
		void CreateMat (MAT2d_Tool2d & aTool);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_MAT_Bisector
") Bisector;
		Handle_MAT_Bisector Bisector ();
		%feature("autodoc", "	:rtype: bool
") SemiInfinite;
		Standard_Boolean SemiInfinite ();
		%feature("autodoc", "	:rtype: int
") NumberOfBisectors;
		Standard_Integer NumberOfBisectors ();
};


%feature("shadow") MAT2d_Mat2d::~MAT2d_Mat2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_Mat2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_MiniPath;
class MAT2d_MiniPath {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_MiniPath;
		 MAT2d_MiniPath ();
		%feature("autodoc", "	* Computes the path to link the lines in <Figure>. the path starts on the line of index <IndStart> <Sense> = True if the Circuit turns in the trigonometric sense.

	:param Figure:
	:type Figure: MAT2d_SequenceOfSequenceOfGeometry &
	:param IndStart:
	:type IndStart: Standard_Integer
	:param Sense:
	:type Sense: bool
	:rtype: None
") Perform;
		void Perform (const MAT2d_SequenceOfSequenceOfGeometry & Figure,const Standard_Integer IndStart,const Standard_Boolean Sense);
		%feature("autodoc", "	* Run on the set of connexions to compute the path. the path is an exploration of the tree which contains the connexions and their reverses. if the tree of connexions is  A  / B E  / \ C D F  the path is A->B, B->C, C->B, B->D, D->B, B->A, A->E, E->F, F->E, E->A.

	:rtype: None
") RunOnConnexions;
		void RunOnConnexions ();
		%feature("autodoc", "	* Returns the sequence of connexions corresponding to the path.

	:rtype: MAT2d_SequenceOfConnexion
") Path;
		const MAT2d_SequenceOfConnexion & Path ();
		%feature("autodoc", "	* Returns <True> if there is one Connexion which starts on line designed by <Index>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: bool
") IsConnexionsFrom;
		Standard_Boolean IsConnexionsFrom (const Standard_Integer Index);
		%feature("autodoc", "	* Returns the connexions which start on line designed by <Index>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: MAT2d_SequenceOfConnexion
") ConnexionsFrom;
		MAT2d_SequenceOfConnexion & ConnexionsFrom (const Standard_Integer Index);
		%feature("autodoc", "	* Returns <True> if the line designed by <Index> is the root.

	:param Index:
	:type Index: Standard_Integer
	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot (const Standard_Integer Index);
		%feature("autodoc", "	* Returns the connexion which ends on line designed by <Index>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT2d_Connexion
") Father;
		Handle_MAT2d_Connexion Father (const Standard_Integer Index);
};


%feature("shadow") MAT2d_MiniPath::~MAT2d_MiniPath %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_MiniPath {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_SequenceNodeOfSequenceOfConnexion;
class MAT2d_SequenceNodeOfSequenceOfConnexion : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Handle_MAT2d_Connexion &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MAT2d_SequenceNodeOfSequenceOfConnexion;
		 MAT2d_SequenceNodeOfSequenceOfConnexion (const Handle_MAT2d_Connexion & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Handle_MAT2d_Connexion
") Value;
		Handle_MAT2d_Connexion & Value ();
};


%feature("shadow") MAT2d_SequenceNodeOfSequenceOfConnexion::~MAT2d_SequenceNodeOfSequenceOfConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_SequenceNodeOfSequenceOfConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_SequenceNodeOfSequenceOfConnexion {
	Handle_MAT2d_SequenceNodeOfSequenceOfConnexion GetHandle() {
	return *(Handle_MAT2d_SequenceNodeOfSequenceOfConnexion*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_SequenceNodeOfSequenceOfConnexion;
class Handle_MAT2d_SequenceNodeOfSequenceOfConnexion : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MAT2d_SequenceNodeOfSequenceOfConnexion();
        Handle_MAT2d_SequenceNodeOfSequenceOfConnexion(const Handle_MAT2d_SequenceNodeOfSequenceOfConnexion &aHandle);
        Handle_MAT2d_SequenceNodeOfSequenceOfConnexion(const MAT2d_SequenceNodeOfSequenceOfConnexion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_SequenceNodeOfSequenceOfConnexion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_SequenceNodeOfSequenceOfConnexion {
    MAT2d_SequenceNodeOfSequenceOfConnexion* GetObject() {
    return (MAT2d_SequenceNodeOfSequenceOfConnexion*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_SequenceNodeOfSequenceOfConnexion::~Handle_MAT2d_SequenceNodeOfSequenceOfConnexion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_SequenceNodeOfSequenceOfConnexion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve;
class MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: TColGeom2d_SequenceOfCurve &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve;
		 MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve (const TColGeom2d_SequenceOfCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfCurve
") Value;
		TColGeom2d_SequenceOfCurve & Value ();
};


%feature("shadow") MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve::~MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve {
	Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve GetHandle() {
	return *(Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve;
class Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve();
        Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve(const Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve &aHandle);
        Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve(const MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve {
    MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve* GetObject() {
    return (MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve::~Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry;
class MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: TColGeom2d_SequenceOfGeometry &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry;
		 MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry (const TColGeom2d_SequenceOfGeometry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfGeometry
") Value;
		TColGeom2d_SequenceOfGeometry & Value ();
};


%feature("shadow") MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry::~MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
%extend MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry {
	Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry GetHandle() {
	return *(Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry*) &$self;
	}
};

%nodefaultctor Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry;
class Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry();
        Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry(const Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry &aHandle);
        Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry(const MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry {
    MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry* GetObject() {
    return (MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry*)$self->Access();
    }
};
%feature("shadow") Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry::~Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor MAT2d_SequenceOfConnexion;
class MAT2d_SequenceOfConnexion : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_SequenceOfConnexion;
		 MAT2d_SequenceOfConnexion ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_SequenceOfConnexion &
	:rtype: MAT2d_SequenceOfConnexion
") Assign;
		const MAT2d_SequenceOfConnexion & Assign (const MAT2d_SequenceOfConnexion & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_SequenceOfConnexion &
	:rtype: MAT2d_SequenceOfConnexion
") operator=;
		const MAT2d_SequenceOfConnexion & operator = (const MAT2d_SequenceOfConnexion & Other);
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT2d_Connexion &
	:rtype: None
") Append;
		void Append (const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "	:param S:
	:type S: MAT2d_SequenceOfConnexion &
	:rtype: None
") Append;
		void Append (MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "	:param T:
	:type T: Handle_MAT2d_Connexion &
	:rtype: None
") Prepend;
		void Prepend (const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "	:param S:
	:type S: MAT2d_SequenceOfConnexion &
	:rtype: None
") Prepend;
		void Prepend (MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_MAT2d_Connexion &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT2d_SequenceOfConnexion &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Handle_MAT2d_Connexion &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT2d_SequenceOfConnexion &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "	:rtype: Handle_MAT2d_Connexion
") First;
		const Handle_MAT2d_Connexion & First ();
		%feature("autodoc", "	:rtype: Handle_MAT2d_Connexion
") Last;
		const Handle_MAT2d_Connexion & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: MAT2d_SequenceOfConnexion &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MAT2d_SequenceOfConnexion & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT2d_Connexion
") Value;
		const Handle_MAT2d_Connexion & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Handle_MAT2d_Connexion &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT2d_Connexion & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_MAT2d_Connexion
") ChangeValue;
		Handle_MAT2d_Connexion & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") MAT2d_SequenceOfConnexion::~MAT2d_SequenceOfConnexion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_SequenceOfConnexion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_SequenceOfSequenceOfCurve;
class MAT2d_SequenceOfSequenceOfCurve : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_SequenceOfSequenceOfCurve;
		 MAT2d_SequenceOfSequenceOfCurve ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: MAT2d_SequenceOfSequenceOfCurve
") Assign;
		const MAT2d_SequenceOfSequenceOfCurve & Assign (const MAT2d_SequenceOfSequenceOfCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: MAT2d_SequenceOfSequenceOfCurve
") operator=;
		const MAT2d_SequenceOfSequenceOfCurve & operator = (const MAT2d_SequenceOfSequenceOfCurve & Other);
		%feature("autodoc", "	:param T:
	:type T: TColGeom2d_SequenceOfCurve &
	:rtype: None
") Append;
		void Append (const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "	:param S:
	:type S: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: None
") Append;
		void Append (MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "	:param T:
	:type T: TColGeom2d_SequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "	:param S:
	:type S: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: None
") Prepend;
		void Prepend (MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TColGeom2d_SequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TColGeom2d_SequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfCurve
") First;
		const TColGeom2d_SequenceOfCurve & First ();
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfCurve
") Last;
		const TColGeom2d_SequenceOfCurve & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: MAT2d_SequenceOfSequenceOfCurve &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfCurve & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColGeom2d_SequenceOfCurve
") Value;
		const TColGeom2d_SequenceOfCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: TColGeom2d_SequenceOfCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColGeom2d_SequenceOfCurve & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColGeom2d_SequenceOfCurve
") ChangeValue;
		TColGeom2d_SequenceOfCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") MAT2d_SequenceOfSequenceOfCurve::~MAT2d_SequenceOfSequenceOfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_SequenceOfSequenceOfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_SequenceOfSequenceOfGeometry;
class MAT2d_SequenceOfSequenceOfGeometry : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") MAT2d_SequenceOfSequenceOfGeometry;
		 MAT2d_SequenceOfSequenceOfGeometry ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: MAT2d_SequenceOfSequenceOfGeometry
") Assign;
		const MAT2d_SequenceOfSequenceOfGeometry & Assign (const MAT2d_SequenceOfSequenceOfGeometry & Other);
		%feature("autodoc", "	:param Other:
	:type Other: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: MAT2d_SequenceOfSequenceOfGeometry
") operator=;
		const MAT2d_SequenceOfSequenceOfGeometry & operator = (const MAT2d_SequenceOfSequenceOfGeometry & Other);
		%feature("autodoc", "	:param T:
	:type T: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") Append;
		void Append (const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "	:param S:
	:type S: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: None
") Append;
		void Append (MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "	:param T:
	:type T: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") Prepend;
		void Prepend (const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "	:param S:
	:type S: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: None
") Prepend;
		void Prepend (MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfGeometry
") First;
		const TColGeom2d_SequenceOfGeometry & First ();
		%feature("autodoc", "	:rtype: TColGeom2d_SequenceOfGeometry
") Last;
		const TColGeom2d_SequenceOfGeometry & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: MAT2d_SequenceOfSequenceOfGeometry &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfGeometry & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColGeom2d_SequenceOfGeometry
") Value;
		const TColGeom2d_SequenceOfGeometry & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: TColGeom2d_SequenceOfGeometry &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColGeom2d_SequenceOfGeometry & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColGeom2d_SequenceOfGeometry
") ChangeValue;
		TColGeom2d_SequenceOfGeometry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") MAT2d_SequenceOfSequenceOfGeometry::~MAT2d_SequenceOfSequenceOfGeometry %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_SequenceOfSequenceOfGeometry {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor MAT2d_Tool2d;
class MAT2d_Tool2d {
	public:
		%feature("autodoc", "	* Empty Constructor.

	:rtype: None
") MAT2d_Tool2d;
		 MAT2d_Tool2d ();
		%feature("autodoc", "	* //!<aSide> defines the side of the computation of the map.

	:param aside:
	:type aside: MAT_Side
	:rtype: None
") Sense;
		void Sense (const MAT_Side aside);
		%feature("autodoc", "	* InitItems cuts the line in Items.  this Items are the geometrics representations of  the BasicElts from MAT.

	:param aCircuit:
	:type aCircuit: Handle_MAT2d_Circuit &
	:rtype: None
") InitItems;
		void InitItems (const Handle_MAT2d_Circuit & aCircuit);
		%feature("autodoc", "	* Returns the Number of Items .

	:rtype: int
") NumberOfItems;
		Standard_Integer NumberOfItems ();
		%feature("autodoc", "	* Returns tolerance to test the confusion of two points.

	:rtype: float
") ToleranceOfConfusion;
		Standard_Real ToleranceOfConfusion ();
		%feature("autodoc", "	* Creates the point at the origin of the bisector between  anitem and the previous item.  dist is the distance from the FirstPoint to <anitem>.  Returns the index of this point in <theGeomPnts>.

	:param anitem:
	:type anitem: Standard_Integer
	:param dist:
	:type dist: float &
	:rtype: int
") FirstPoint;
		Standard_Integer FirstPoint (const Standard_Integer anitem,Standard_Real &OutValue);
		%feature("autodoc", "	* Creates the Tangent at the end of the Item defined  by <anitem>. Returns the index of this vector in  <theGeomVecs>

	:param anitem:
	:type anitem: Standard_Integer
	:rtype: int
") TangentBefore;
		Standard_Integer TangentBefore (const Standard_Integer anitem);
		%feature("autodoc", "	* Creates the Reversed Tangent at the origin of the Item  defined by <anitem>. Returns the index of this vector in  <theGeomVecs>

	:param anitem:
	:type anitem: Standard_Integer
	:rtype: int
") TangentAfter;
		Standard_Integer TangentAfter (const Standard_Integer anitem);
		%feature("autodoc", "	* Creates the Tangent at the end of the bisector defined  by <bisector>. Returns the index of this vector in  <theGeomVecs>

	:param bisector:
	:type bisector: Standard_Integer
	:rtype: int
") Tangent;
		Standard_Integer Tangent (const Standard_Integer bisector);
		%feature("autodoc", "	* Creates the geometric bisector defined by <abisector>.

	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:rtype: None
") CreateBisector;
		void CreateBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "	* Trims the geometric bisector by the <firstparameter>  of <abisector>.  If the parameter is out of the bisector, Return False.  else Return True.

	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:rtype: bool
") TrimBisector;
		Standard_Boolean TrimBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "	* Trims the geometric bisector by the point of index  <apoint> in <theGeomPnts>.  If the point is out of the bisector, Return False.  else Return True.

	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:param apoint:
	:type apoint: Standard_Integer
	:rtype: bool
") TrimBisector;
		Standard_Boolean TrimBisector (const Handle_MAT_Bisector & abisector,const Standard_Integer apoint);
		%feature("autodoc", "	* Computes the point of intersection between the bisectors defined by <bisectorone> and <bisectortwo> . If this point exists, <intpnt> is its index in <theGeomPnts> and Return the distance of the point from the bisector else Return <RealLast>.

	:param bisectorone:
	:type bisectorone: Handle_MAT_Bisector &
	:param bisectortwo:
	:type bisectortwo: Handle_MAT_Bisector &
	:param intpnt:
	:type intpnt: Standard_Integer &
	:rtype: float
") IntersectBisector;
		Standard_Real IntersectBisector (const Handle_MAT_Bisector & bisectorone,const Handle_MAT_Bisector & bisectortwo,Standard_Integer &OutValue);
		%feature("autodoc", "	* Returns the distance between the two points designed by their parameters on <abisector>.

	:param abisector:
	:type abisector: Handle_MAT_Bisector &
	:param param1:
	:type param1: float
	:param param2:
	:type param2: float
	:rtype: float
") Distance;
		Standard_Real Distance (const Handle_MAT_Bisector & abisector,const Standard_Real param1,const Standard_Real param2);
		%feature("autodoc", "	* displays informations about the bisector defined by  <bisector>.

	:param bisector:
	:type bisector: Standard_Integer
	:param erease:
	:type erease: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer bisector,const Standard_Integer erease);
		%feature("autodoc", "	* Returns the <Bisec> of index <Index> in  <theGeomBisectors>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Bisector_Bisec
") GeomBis;
		const Bisector_Bisec & GeomBis (const Standard_Integer Index);
		%feature("autodoc", "	* Returns the Geometry of index <Index> in <theGeomElts>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Geometry
") GeomElt;
		Handle_Geom2d_Geometry GeomElt (const Standard_Integer Index);
		%feature("autodoc", "	* Returns the point of index <Index> in the <theGeomPnts>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt2d
") GeomPnt;
		const gp_Pnt2d  GeomPnt (const Standard_Integer Index);
		%feature("autodoc", "	* Returns the vector of index <Index> in the  <theGeomVecs>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Vec2d
") GeomVec;
		const gp_Vec2d  GeomVec (const Standard_Integer Index);
		%feature("autodoc", "	* 

	:rtype: Handle_MAT2d_Circuit
") Circuit;
		Handle_MAT2d_Circuit Circuit ();
		%feature("autodoc", "	:param Index1:
	:type Index1: Standard_Integer
	:param Index2:
	:type Index2: Standard_Integer
	:rtype: None
") BisecFusion;
		void BisecFusion (const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "	* Returns the <Bisec> of index <Index> in  <theGeomBisectors>.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Bisector_Bisec
") ChangeGeomBis;
		Bisector_Bisec & ChangeGeomBis (const Standard_Integer Index);
};


%feature("shadow") MAT2d_Tool2d::~MAT2d_Tool2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend MAT2d_Tool2d {
	void _kill_pointed() {
		delete $self;
	}
};
