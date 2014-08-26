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
%module MAT2d

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

%include MAT2d_required_python_modules.i
%include MAT2d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor MAT2d_Array2OfConnexion;
class MAT2d_Array2OfConnexion {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") MAT2d_Array2OfConnexion;
		 MAT2d_Array2OfConnexion (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(Handle_MAT2d_Connexion)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") MAT2d_Array2OfConnexion;
		 MAT2d_Array2OfConnexion (const Handle_MAT2d_Connexion & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_MAT2d_Connexion & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(MAT2d_Array2OfConnexion)

Returns:
	MAT2d_Array2OfConnexion

No detailed docstring for this function.") Assign;
		const MAT2d_Array2OfConnexion & Assign (const MAT2d_Array2OfConnexion & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_Array2OfConnexion)

Returns:
	MAT2d_Array2OfConnexion

No detailed docstring for this function.") operator=;
		const MAT2d_Array2OfConnexion & operator = (const MAT2d_Array2OfConnexion & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_MAT2d_Connexion & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Value;
		const Handle_MAT2d_Connexion & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	I1(Standard_Integer)
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") MAT2d_BiInt;
		 MAT2d_BiInt (const Standard_Integer I1,const Standard_Integer I2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") FirstIndex;
		Standard_Integer FirstIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SecondIndex;
		Standard_Integer SecondIndex ();
		%feature("autodoc", "Args:
	I1(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") FirstIndex;
		void FirstIndex (const Standard_Integer I1);
		%feature("autodoc", "Args:
	I2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SecondIndex;
		void SecondIndex (const Standard_Integer I2);
		%feature("autodoc", "Args:
	B(MAT2d_BiInt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const MAT2d_BiInt & B);
		%feature("autodoc", "Args:
	B(MAT2d_BiInt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator==;
		Standard_Boolean operator == (const MAT2d_BiInt & B);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_Circuit;
		 MAT2d_Circuit ();
		%feature("autodoc", "Args:
	aFigure(MAT2d_SequenceOfSequenceOfGeometry)
	IsClosed(TColStd_SequenceOfBoolean)
	IndRefLine(Standard_Integer)
	Trigo(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (MAT2d_SequenceOfSequenceOfGeometry & aFigure,const TColStd_SequenceOfBoolean & IsClosed,const Standard_Integer IndRefLine,const Standard_Boolean Trigo);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Number of Items .") NumberOfItems;
		Standard_Integer NumberOfItems ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

Returns the item at position <Index> in <self>.") Value;
		Handle_Geom2d_Geometry Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	IndexLine(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of items on the line <IndexLine>.") LineLength;
		Standard_Integer LineLength (const Standard_Integer IndexLine);
		%feature("autodoc", "Args:
	IndLine(Standard_Integer)
	IndCurve(Standard_Integer)

Returns:
	TColStd_SequenceOfInteger

Returns the set of index of the items in <self>corresponding  
         to the curve <IndCurve> on the line <IndLine> from the  
         initial figure.") RefToEqui;
		const TColStd_SequenceOfInteger & RefToEqui (const Standard_Integer IndLine,const Standard_Integer IndCurve);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

Returns the Connexion on the item <Index> in me.") Connexion;
		Handle_MAT2d_Connexion Connexion (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns <True> is there is a connexion on the item <Index>  
         in <self>.") ConnexionOn;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_Connexion;
		 MAT2d_Connexion ();
		%feature("autodoc", "Args:
	LineA(Standard_Integer)
	LineB(Standard_Integer)
	ItemA(Standard_Integer)
	ItemB(Standard_Integer)
	Distance(Standard_Real)
	ParameterOnA(Standard_Real)
	ParameterOnB(Standard_Real)
	PointA(gp_Pnt2d)
	PointB(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") MAT2d_Connexion;
		 MAT2d_Connexion (const Standard_Integer LineA,const Standard_Integer LineB,const Standard_Integer ItemA,const Standard_Integer ItemB,const Standard_Real Distance,const Standard_Real ParameterOnA,const Standard_Real ParameterOnB,const gp_Pnt2d & PointA,const gp_Pnt2d & PointB);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Index on the first line.") IndexFirstLine;
		Standard_Integer IndexFirstLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Index on the Second line.") IndexSecondLine;
		Standard_Integer IndexSecondLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Index of the item on the first line.") IndexItemOnFirst;
		Standard_Integer IndexItemOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Index of the item on the second line.") IndexItemOnSecond;
		Standard_Integer IndexItemOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the point on the firstline.") ParameterOnFirst;
		Standard_Real ParameterOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the point on the secondline.") ParameterOnSecond;
		Standard_Real ParameterOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the point on the firstline.") PointOnFirst;
		gp_Pnt2d PointOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the point on the secondline.") PointOnSecond;
		gp_Pnt2d PointOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the distance between the two points.") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexFirstLine;
		void IndexFirstLine (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexSecondLine;
		void IndexSecondLine (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexItemOnFirst;
		void IndexItemOnFirst (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IndexItemOnSecond;
		void IndexItemOnSecond (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aParameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParameterOnFirst;
		void ParameterOnFirst (const Standard_Real aParameter);
		%feature("autodoc", "Args:
	aParameter(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParameterOnSecond;
		void ParameterOnSecond (const Standard_Real aParameter);
		%feature("autodoc", "Args:
	aPoint(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") PointOnFirst;
		void PointOnFirst (const gp_Pnt2d & aPoint);
		%feature("autodoc", "Args:
	aPoint(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") PointOnSecond;
		void PointOnSecond (const gp_Pnt2d & aPoint);
		%feature("autodoc", "Args:
	aDistance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Distance;
		void Distance (const Standard_Real aDistance);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Connexion

Returns the reverse connexion of <self>.  
         the firstpoint  is the secondpoint.  
         the secondpoint is the firstpoint.") Reverse;
		Handle_MAT2d_Connexion Reverse ();
		%feature("autodoc", "Args:
	aConnexion(Handle_MAT2d_Connexion)
	aSense(Standard_Real)

Returns:
	Standard_Boolean

Returns <True> if my firstPoint is on the same line  
         than the firstpoint of <aConnexion> and my firstpoint  
         is after the firstpoint of <aConnexion> on the line.  
         <aSense> = 1 if <aConnexion> is on the Left of its  
         firstline, else <aSense> = -1.") IsAfter;
		Standard_Boolean IsAfter (const Handle_MAT2d_Connexion & aConnexion,const Standard_Real aSense);
		%feature("autodoc", "Args:
	Deep(Standard_Integer)=0
	Offset(Standard_Integer)=0

Returns:
	None

Print <self>.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntInteger ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfBiIntInteger)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfBiIntInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntInteger (const MAT2d_DataMapOfBiIntInteger & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfBiIntInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfBiIntInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_BiInt

No detailed docstring for this function.") Key;
		const MAT2d_BiInt & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfBiIntSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapIteratorOfDataMapOfBiIntSequenceOfInteger (const MAT2d_DataMapOfBiIntSequenceOfInteger & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfBiIntSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfBiIntSequenceOfInteger & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_BiInt

No detailed docstring for this function.") Key;
		const MAT2d_BiInt & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerBisec ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerBisec)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerBisec;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerBisec (const MAT2d_DataMapOfIntegerBisec & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerBisec)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerBisec & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bisector_Bisec

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerConnexion)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerConnexion (const MAT2d_DataMapOfIntegerConnexion & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerConnexion)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerConnexion & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerPnt2d)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerPnt2d (const MAT2d_DataMapOfIntegerPnt2d & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerPnt2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerPnt2d & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		const gp_Pnt2d & Value ();
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerSequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerSequenceOfConnexion (const MAT2d_DataMapOfIntegerSequenceOfConnexion & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerSequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerSequenceOfConnexion & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_SequenceOfConnexion

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d ();
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerVec2d)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d;
		 MAT2d_DataMapIteratorOfDataMapOfIntegerVec2d (const MAT2d_DataMapOfIntegerVec2d & aMap);
		%feature("autodoc", "Args:
	aMap(MAT2d_DataMapOfIntegerVec2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const MAT2d_DataMapOfIntegerVec2d & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		const Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Value;
		const gp_Vec2d & Value ();
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
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)
	I(Standard_Integer)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfBiIntInteger;
		 MAT2d_DataMapNodeOfDataMapOfBiIntInteger (const MAT2d_BiInt & K,Standard_Integer &OutValue,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_BiInt

No detailed docstring for this function.") Key;
		MAT2d_BiInt & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Value;
		Standard_Integer & Value ();
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
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)
	I(TColStd_SequenceOfInteger)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapNodeOfDataMapOfBiIntSequenceOfInteger (const MAT2d_BiInt & K,const TColStd_SequenceOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_BiInt

No detailed docstring for this function.") Key;
		MAT2d_BiInt & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Bisector_Bisec)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfIntegerBisec;
		 MAT2d_DataMapNodeOfDataMapOfIntegerBisec (Standard_Integer &OutValue,const Bisector_Bisec & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bisector_Bisec

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_MAT2d_Connexion)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfIntegerConnexion;
		 MAT2d_DataMapNodeOfDataMapOfIntegerConnexion (Standard_Integer &OutValue,const Handle_MAT2d_Connexion & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(gp_Pnt2d)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d;
		 MAT2d_DataMapNodeOfDataMapOfIntegerPnt2d (Standard_Integer &OutValue,const gp_Pnt2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		gp_Pnt2d & Value ();
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(MAT2d_SequenceOfConnexion)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapNodeOfDataMapOfIntegerSequenceOfConnexion (Standard_Integer &OutValue,const MAT2d_SequenceOfConnexion & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_SequenceOfConnexion

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(gp_Vec2d)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapNodeOfDataMapOfIntegerVec2d;
		 MAT2d_DataMapNodeOfDataMapOfIntegerVec2d (Standard_Integer &OutValue,const gp_Vec2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Key;
		Standard_Integer & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") Value;
		gp_Vec2d & Value ();
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfBiIntInteger;
		 MAT2d_DataMapOfBiIntInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfBiIntInteger)

Returns:
	MAT2d_DataMapOfBiIntInteger

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfBiIntInteger & Assign (const MAT2d_DataMapOfBiIntInteger & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfBiIntInteger)

Returns:
	MAT2d_DataMapOfBiIntInteger

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfBiIntInteger & operator = (const MAT2d_DataMapOfBiIntInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)
	I(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const MAT2d_BiInt & K,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Integer

No detailed docstring for this function.") Find;
		const Standard_Integer & Find (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Integer

No detailed docstring for this function.") ChangeFind;
		Standard_Integer & ChangeFind (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfBiIntSequenceOfInteger;
		 MAT2d_DataMapOfBiIntSequenceOfInteger (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfBiIntSequenceOfInteger)

Returns:
	MAT2d_DataMapOfBiIntSequenceOfInteger

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfBiIntSequenceOfInteger & Assign (const MAT2d_DataMapOfBiIntSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfBiIntSequenceOfInteger)

Returns:
	MAT2d_DataMapOfBiIntSequenceOfInteger

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfBiIntSequenceOfInteger & operator = (const MAT2d_DataMapOfBiIntSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)
	I(TColStd_SequenceOfInteger)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const MAT2d_BiInt & K,const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Find;
		const TColStd_SequenceOfInteger & Find (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") ChangeFind;
		TColStd_SequenceOfInteger & ChangeFind (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const MAT2d_BiInt & K);
		%feature("autodoc", "Args:
	K(MAT2d_BiInt)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfIntegerBisec;
		 MAT2d_DataMapOfIntegerBisec (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerBisec)

Returns:
	MAT2d_DataMapOfIntegerBisec

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfIntegerBisec & Assign (const MAT2d_DataMapOfIntegerBisec & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerBisec)

Returns:
	MAT2d_DataMapOfIntegerBisec

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfIntegerBisec & operator = (const MAT2d_DataMapOfIntegerBisec & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Bisector_Bisec)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Bisector_Bisec & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Bisector_Bisec

No detailed docstring for this function.") Find;
		const Bisector_Bisec & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Bisector_Bisec

No detailed docstring for this function.") ChangeFind;
		Bisector_Bisec & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfIntegerConnexion;
		 MAT2d_DataMapOfIntegerConnexion (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerConnexion)

Returns:
	MAT2d_DataMapOfIntegerConnexion

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfIntegerConnexion & Assign (const MAT2d_DataMapOfIntegerConnexion & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerConnexion)

Returns:
	MAT2d_DataMapOfIntegerConnexion

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfIntegerConnexion & operator = (const MAT2d_DataMapOfIntegerConnexion & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(Handle_MAT2d_Connexion)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const Handle_MAT2d_Connexion & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Find;
		const Handle_MAT2d_Connexion & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") ChangeFind;
		Handle_MAT2d_Connexion & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfIntegerPnt2d;
		 MAT2d_DataMapOfIntegerPnt2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerPnt2d)

Returns:
	MAT2d_DataMapOfIntegerPnt2d

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfIntegerPnt2d & Assign (const MAT2d_DataMapOfIntegerPnt2d & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerPnt2d)

Returns:
	MAT2d_DataMapOfIntegerPnt2d

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfIntegerPnt2d & operator = (const MAT2d_DataMapOfIntegerPnt2d & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(gp_Pnt2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const gp_Pnt2d & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") Find;
		const gp_Pnt2d & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") ChangeFind;
		gp_Pnt2d & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfIntegerSequenceOfConnexion;
		 MAT2d_DataMapOfIntegerSequenceOfConnexion (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerSequenceOfConnexion)

Returns:
	MAT2d_DataMapOfIntegerSequenceOfConnexion

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfIntegerSequenceOfConnexion & Assign (const MAT2d_DataMapOfIntegerSequenceOfConnexion & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerSequenceOfConnexion)

Returns:
	MAT2d_DataMapOfIntegerSequenceOfConnexion

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfIntegerSequenceOfConnexion & operator = (const MAT2d_DataMapOfIntegerSequenceOfConnexion & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(MAT2d_SequenceOfConnexion)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const MAT2d_SequenceOfConnexion & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	MAT2d_SequenceOfConnexion

No detailed docstring for this function.") Find;
		const MAT2d_SequenceOfConnexion & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	MAT2d_SequenceOfConnexion

No detailed docstring for this function.") ChangeFind;
		MAT2d_SequenceOfConnexion & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") MAT2d_DataMapOfIntegerVec2d;
		 MAT2d_DataMapOfIntegerVec2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerVec2d)

Returns:
	MAT2d_DataMapOfIntegerVec2d

No detailed docstring for this function.") Assign;
		MAT2d_DataMapOfIntegerVec2d & Assign (const MAT2d_DataMapOfIntegerVec2d & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_DataMapOfIntegerVec2d)

Returns:
	MAT2d_DataMapOfIntegerVec2d

No detailed docstring for this function.") operator=;
		MAT2d_DataMapOfIntegerVec2d & operator = (const MAT2d_DataMapOfIntegerVec2d & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Standard_Integer)
	I(gp_Vec2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (Standard_Integer &OutValue,const gp_Vec2d & I);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	gp_Vec2d

No detailed docstring for this function.") Find;
		const gp_Vec2d & Find (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	gp_Vec2d

No detailed docstring for this function.") ChangeFind;
		gp_Vec2d & ChangeFind (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	K(Standard_Integer)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	Key1(MAT2d_BiInt)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const MAT2d_BiInt & Key1,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	Key1(MAT2d_BiInt)
	Key2(MAT2d_BiInt)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_Mat2d;
		 MAT2d_Mat2d ();
		%feature("autodoc", "Args:
	aTool(MAT2d_Tool2d)

Returns:
	None

No detailed docstring for this function.") CreateMat;
		void CreateMat (MAT2d_Tool2d & aTool);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Bisector

No detailed docstring for this function.") Bisector;
		Handle_MAT_Bisector Bisector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SemiInfinite;
		Standard_Boolean SemiInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NumberOfBisectors;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_MiniPath;
		 MAT2d_MiniPath ();
		%feature("autodoc", "Args:
	Figure(MAT2d_SequenceOfSequenceOfGeometry)
	IndStart(Standard_Integer)
	Sense(Standard_Boolean)

Returns:
	None

Computes the path  to link the  lines in <Figure>.  
         the path   starts on the  line  of index <IndStart>  
         <Sense>  = True    if  the Circuit turns in the  
         trigonometric  sense.") Perform;
		void Perform (const MAT2d_SequenceOfSequenceOfGeometry & Figure,const Standard_Integer IndStart,const Standard_Boolean Sense);
		%feature("autodoc", "Args:
	None
Returns:
	None

Run on the set of connexions to compute the path.  
         the path is an exploration of the tree which contains  
         the connexions and their reverses.  
         if the tree of connexions is  
                 A  
                /  
               B   E  
              / \    
             C   D   F  
 
         the path is A->B, B->C, C->B, B->D, D->B, B->A, A->E,  
                     E->F, F->E, E->A.") RunOnConnexions;
		void RunOnConnexions ();
		%feature("autodoc", "Args:
	None
Returns:
	MAT2d_SequenceOfConnexion

Returns  the  sequence of  connexions corresponding to  
         the  path.") Path;
		const MAT2d_SequenceOfConnexion & Path ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns <True> if there is one Connexion which starts  
         on line designed by <Index>.") IsConnexionsFrom;
		Standard_Boolean IsConnexionsFrom (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	MAT2d_SequenceOfConnexion

Returns    the  connexions  which   start  on line  
         designed  by <Index>.") ConnexionsFrom;
		MAT2d_SequenceOfConnexion & ConnexionsFrom (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Boolean

Returns <True> if the line designed by <Index> is  
         the root.") IsRoot;
		Standard_Boolean IsRoot (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

Returns    the  connexion  which ends  on line  
         designed  by <Index>.") Father;
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
		%feature("autodoc", "Args:
	I(Handle_MAT2d_Connexion)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_SequenceNodeOfSequenceOfConnexion;
		 MAT2d_SequenceNodeOfSequenceOfConnexion (const Handle_MAT2d_Connexion & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(TColGeom2d_SequenceOfCurve)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve;
		 MAT2d_SequenceNodeOfSequenceOfSequenceOfCurve (const TColGeom2d_SequenceOfCurve & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(TColGeom2d_SequenceOfGeometry)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry;
		 MAT2d_SequenceNodeOfSequenceOfSequenceOfGeometry (const TColGeom2d_SequenceOfGeometry & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_SequenceOfConnexion;
		 MAT2d_SequenceOfConnexion ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(MAT2d_SequenceOfConnexion)

Returns:
	MAT2d_SequenceOfConnexion

No detailed docstring for this function.") Assign;
		const MAT2d_SequenceOfConnexion & Assign (const MAT2d_SequenceOfConnexion & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_SequenceOfConnexion)

Returns:
	MAT2d_SequenceOfConnexion

No detailed docstring for this function.") operator=;
		const MAT2d_SequenceOfConnexion & operator = (const MAT2d_SequenceOfConnexion & Other);
		%feature("autodoc", "Args:
	T(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "Args:
	S(MAT2d_SequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "Args:
	T(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "Args:
	S(MAT2d_SequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT2d_SequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_MAT2d_Connexion & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT2d_SequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT2d_SequenceOfConnexion & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") First;
		const Handle_MAT2d_Connexion & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Last;
		const Handle_MAT2d_Connexion & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(MAT2d_SequenceOfConnexion)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,MAT2d_SequenceOfConnexion & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") Value;
		const Handle_MAT2d_Connexion & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_MAT2d_Connexion)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_MAT2d_Connexion & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_MAT2d_Connexion

No detailed docstring for this function.") ChangeValue;
		Handle_MAT2d_Connexion & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_SequenceOfSequenceOfCurve;
		 MAT2d_SequenceOfSequenceOfCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	MAT2d_SequenceOfSequenceOfCurve

No detailed docstring for this function.") Assign;
		const MAT2d_SequenceOfSequenceOfCurve & Assign (const MAT2d_SequenceOfSequenceOfCurve & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	MAT2d_SequenceOfSequenceOfCurve

No detailed docstring for this function.") operator=;
		const MAT2d_SequenceOfSequenceOfCurve & operator = (const MAT2d_SequenceOfSequenceOfCurve & Other);
		%feature("autodoc", "Args:
	T(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "Args:
	S(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "Args:
	T(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "Args:
	S(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColGeom2d_SequenceOfCurve & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfCurve & S);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") First;
		const TColGeom2d_SequenceOfCurve & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") Last;
		const TColGeom2d_SequenceOfCurve & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(MAT2d_SequenceOfSequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfCurve & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") Value;
		const TColGeom2d_SequenceOfCurve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TColGeom2d_SequenceOfCurve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColGeom2d_SequenceOfCurve & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColGeom2d_SequenceOfCurve

No detailed docstring for this function.") ChangeValue;
		TColGeom2d_SequenceOfCurve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MAT2d_SequenceOfSequenceOfGeometry;
		 MAT2d_SequenceOfSequenceOfGeometry ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	MAT2d_SequenceOfSequenceOfGeometry

No detailed docstring for this function.") Assign;
		const MAT2d_SequenceOfSequenceOfGeometry & Assign (const MAT2d_SequenceOfSequenceOfGeometry & Other);
		%feature("autodoc", "Args:
	Other(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	MAT2d_SequenceOfSequenceOfGeometry

No detailed docstring for this function.") operator=;
		const MAT2d_SequenceOfSequenceOfGeometry & operator = (const MAT2d_SequenceOfSequenceOfGeometry & Other);
		%feature("autodoc", "Args:
	T(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "Args:
	S(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "Args:
	T(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "Args:
	S(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const TColGeom2d_SequenceOfGeometry & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfGeometry & S);
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") First;
		const TColGeom2d_SequenceOfGeometry & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") Last;
		const TColGeom2d_SequenceOfGeometry & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(MAT2d_SequenceOfSequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,MAT2d_SequenceOfSequenceOfGeometry & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") Value;
		const TColGeom2d_SequenceOfGeometry & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(TColGeom2d_SequenceOfGeometry)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const TColGeom2d_SequenceOfGeometry & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TColGeom2d_SequenceOfGeometry

No detailed docstring for this function.") ChangeValue;
		TColGeom2d_SequenceOfGeometry & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor.") MAT2d_Tool2d;
		 MAT2d_Tool2d ();
		%feature("autodoc", "Args:
	aside(MAT_Side)

Returns:
	None

//!<aSide> defines the side of the computation of the map.") Sense;
		void Sense (const MAT_Side aside);
		%feature("autodoc", "Args:
	aCircuit(Handle_MAT2d_Circuit)

Returns:
	None

InitItems cuts the line in Items.  
           this Items are the geometrics representations of  
           the BasicElts from MAT.") InitItems;
		void InitItems (const Handle_MAT2d_Circuit & aCircuit);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Number of Items .") NumberOfItems;
		Standard_Integer NumberOfItems ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns tolerance to test the confusion of two points.") ToleranceOfConfusion;
		Standard_Real ToleranceOfConfusion ();
		%feature("autodoc", "Args:
	anitem(Standard_Integer)
	dist(Standard_Real)

Returns:
	Standard_Integer

Creates the point at the origin of the bisector between  
           anitem and the previous  item.  
           dist is the distance from the FirstPoint to <anitem>.  
           Returns the index of this point in <theGeomPnts>.") FirstPoint;
		Standard_Integer FirstPoint (const Standard_Integer anitem,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	anitem(Standard_Integer)

Returns:
	Standard_Integer

Creates the Tangent at the end of the Item defined  
           by <anitem>. Returns the index of this vector in  
           <theGeomVecs>") TangentBefore;
		Standard_Integer TangentBefore (const Standard_Integer anitem);
		%feature("autodoc", "Args:
	anitem(Standard_Integer)

Returns:
	Standard_Integer

Creates the Reversed Tangent at the origin of the Item  
           defined by <anitem>. Returns the index of this vector in  
           <theGeomVecs>") TangentAfter;
		Standard_Integer TangentAfter (const Standard_Integer anitem);
		%feature("autodoc", "Args:
	bisector(Standard_Integer)

Returns:
	Standard_Integer

Creates the Tangent at the end of the bisector defined  
           by <bisector>. Returns the index of this vector in  
           <theGeomVecs>") Tangent;
		Standard_Integer Tangent (const Standard_Integer bisector);
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)

Returns:
	None

Creates the geometric bisector defined by <abisector>.") CreateBisector;
		void CreateBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)

Returns:
	Standard_Boolean

Trims the geometric bisector by the <firstparameter>  
           of <abisector>.  
           If the parameter is out of the bisector, Return FALSE.  
           else Return True.") TrimBisector;
		Standard_Boolean TrimBisector (const Handle_MAT_Bisector & abisector);
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)
	apoint(Standard_Integer)

Returns:
	Standard_Boolean

Trims the geometric bisector by the point of index  
           <apoint> in <theGeomPnts>.  
           If the point is out of the bisector, Return FALSE.  
           else Return True.") TrimBisector;
		Standard_Boolean TrimBisector (const Handle_MAT_Bisector & abisector,const Standard_Integer apoint);
		%feature("autodoc", "Args:
	bisectorone(Handle_MAT_Bisector)
	bisectortwo(Handle_MAT_Bisector)
	intpnt(Standard_Integer)

Returns:
	Standard_Real

Computes  the point  of  intersection between  the  
            bisectors defined  by  <bisectorone>  and  
            <bisectortwo> .  
            If this point exists,  <intpnt> is its  index  
            in <theGeomPnts> and Return the distance of the point  
            from the bisector else Return <RealLast>.") IntersectBisector;
		Standard_Real IntersectBisector (const Handle_MAT_Bisector & bisectorone,const Handle_MAT_Bisector & bisectortwo,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	abisector(Handle_MAT_Bisector)
	param1(Standard_Real)
	param2(Standard_Real)

Returns:
	Standard_Real

Returns the distance between the two points designed  
         by their parameters on <abisector>.") Distance;
		Standard_Real Distance (const Handle_MAT_Bisector & abisector,const Standard_Real param1,const Standard_Real param2);
		%feature("autodoc", "Args:
	bisector(Standard_Integer)
	erease(Standard_Integer)

Returns:
	None

displays informations about the bisector defined by  
           <bisector>.") Dump;
		void Dump (const Standard_Integer bisector,const Standard_Integer erease);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bisector_Bisec

Returns the <Bisec> of index <Index> in  
           <theGeomBisectors>.") GeomBis;
		const Bisector_Bisec & GeomBis (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Geometry

Returns the Geometry of index <Index> in <theGeomElts>.") GeomElt;
		Handle_Geom2d_Geometry GeomElt (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt2d

Returns the point of index <Index> in the <theGeomPnts>.") GeomPnt;
		const gp_Pnt2d & GeomPnt (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Vec2d

Returns the  vector  of index <Index> in the  
           <theGeomVecs>.") GeomVec;
		const gp_Vec2d & GeomVec (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT2d_Circuit

") Circuit;
		Handle_MAT2d_Circuit Circuit ();
		%feature("autodoc", "Args:
	Index1(Standard_Integer)
	Index2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BisecFusion;
		void BisecFusion (const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bisector_Bisec

Returns the <Bisec> of index <Index> in  
           <theGeomBisectors>.") ChangeGeomBis;
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
