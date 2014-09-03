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
%module (package="OCC") Hatch

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

%include Hatch_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Hatch_LineForm {
	Hatch_XLINE = 0,
	Hatch_YLINE = 1,
	Hatch_ANYLINE = 2,
};

/* end public enums declaration */

%nodefaultctor Hatch_Hatcher;
class Hatch_Hatcher {
	public:
		%feature("autodoc", "Args:
	Tol(Standard_Real)
	Oriented(Standard_Boolean)=Standard_True

Returns:
	None

Returns a empty  hatcher.  <Tol> is the  tolerance  
         for intersections.") Hatch_Hatcher;
		 Hatch_Hatcher (const Standard_Real Tol,const Standard_Boolean Oriented = Standard_True);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	T(Hatch_LineForm)=Hatch_ANYLINE

Returns:
	None

Add a line <L>  to  be trimmed.   <T> the  type is  
         only kept from information. It is not used  in the  
         computation.") AddLine;
		void AddLine (const gp_Lin2d & L,const Hatch_LineForm T = Hatch_ANYLINE);
		%feature("autodoc", "Args:
	D(gp_Dir2d)
	Dist(Standard_Real)

Returns:
	None

Add an infinite line on  direction <D> at distance  
         <Dist> from the origin  to be  trimmed. <Dist> may  
         be negative.  
 
         If O  is the origin  of the  2D plane, and   V the  
         vector perpendicular to D (in the direct direction).  
 
         A point P is on the line if :  
           OP dot V = Dist  
         The parameter of P on the line is  
           OP dot D") AddLine;
		void AddLine (const gp_Dir2d & D,const Standard_Real Dist);
		%feature("autodoc", "Args:
	X(Standard_Real)

Returns:
	None

Add an infinite line   parallel to the Y-axis   at  
         abciss <X>.") AddXLine;
		void AddXLine (const Standard_Real X);
		%feature("autodoc", "Args:
	Y(Standard_Real)

Returns:
	None

Add an infinite line   parallel to the X-axis   at  
         ordinate <Y>.") AddYLine;
		void AddYLine (const Standard_Real Y);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	Index(Standard_Integer)=0

Returns:
	None

Trims the lines at intersections with  <L>.") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Integer Index = 0);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	Start(Standard_Real)
	End(Standard_Real)
	Index(Standard_Integer)=0

Returns:
	None

Trims the lines at intersections  with <L>  in the  
         parameter range <Start>, <End>") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Real Start,const Standard_Real End,const Standard_Integer Index = 0);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)
	Index(Standard_Integer)=0

Returns:
	None

Trims the line at  intersection with  the oriented  
         segment P1,P2.") Trim;
		void Trim (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Integer Index = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the total number  of intervals on  all the  
         lines.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of lines.") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	gp_Lin2d

Returns the line of index <I>.") Line;
		const gp_Lin2d & Line (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Hatch_LineForm

Returns  the type of the  line   of  index <I>.") LineForm;
		Hatch_LineForm LineForm (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

Returns  True if the  line   of  index <I>  has  a  
         constant X value.") IsXLine;
		Standard_Boolean IsXLine (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Boolean

Returns  True if the  line   of  index <I>  has  a  
         constant Y value.") IsYLine;
		Standard_Boolean IsYLine (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Real

Returns the X or Y coordinate of the line of index  
         <I> if it is a X or a Y line.") Coordinate;
		Standard_Real Coordinate (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Integer

Returns the number of intervals on line of index <I>.") NbIntervals;
		Standard_Integer NbIntervals (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	Standard_Real

Returns the first   parameter of  interval <J>  on  
         line  <I>.") Start;
		Standard_Real Start (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)
	Index(Standard_Integer)
	Par2(Standard_Real)

Returns:
	None

Returns the first Index and Par2 of  interval <J>  on  
         line  <I>.") StartIndex;
		void StartIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	Standard_Real

Returns the last   parameter of  interval <J>  on  
         line  <I>.") End;
		Standard_Real End (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)
	Index(Standard_Integer)
	Par2(Standard_Real)

Returns:
	None

Returns the last Index and Par2 of  interval <J>  on  
         line  <I>.") EndIndex;
		void EndIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Hatch_Hatcher::~Hatch_Hatcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_Hatcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Hatch_Line;
class Hatch_Line {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Hatch_Line;
		 Hatch_Line ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	T(Hatch_LineForm)

Returns:
	None

No detailed docstring for this function.") Hatch_Line;
		 Hatch_Line (const gp_Lin2d & L,const Hatch_LineForm T);
		%feature("autodoc", "Args:
	Par1(Standard_Real)
	Start(Standard_Boolean)
	Index(Standard_Integer)
	Par2(Standard_Real)
	theToler(Standard_Real)

Returns:
	None

Insert a new intersection in the sorted list.") AddIntersection;
		void AddIntersection (const Standard_Real Par1,const Standard_Boolean Start,const Standard_Integer Index,const Standard_Real Par2,const Standard_Real theToler);
};


%feature("shadow") Hatch_Line::~Hatch_Line %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_Line {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Hatch_Parameter;
class Hatch_Parameter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Hatch_Parameter;
		 Hatch_Parameter ();
		%feature("autodoc", "Args:
	Par1(Standard_Real)
	Start(Standard_Boolean)
	Index(Standard_Integer)=0
	Par2(Standard_Real)=0

Returns:
	None

No detailed docstring for this function.") Hatch_Parameter;
		 Hatch_Parameter (const Standard_Real Par1,const Standard_Boolean Start,const Standard_Integer Index = 0,const Standard_Real Par2 = 0);
};


%feature("shadow") Hatch_Parameter::~Hatch_Parameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_Parameter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Hatch_SequenceNodeOfSequenceOfLine;
class Hatch_SequenceNodeOfSequenceOfLine : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Hatch_Line)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Hatch_SequenceNodeOfSequenceOfLine;
		 Hatch_SequenceNodeOfSequenceOfLine (const Hatch_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Hatch_Line

No detailed docstring for this function.") Value;
		Hatch_Line & Value ();
};


%feature("shadow") Hatch_SequenceNodeOfSequenceOfLine::~Hatch_SequenceNodeOfSequenceOfLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_SequenceNodeOfSequenceOfLine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Hatch_SequenceNodeOfSequenceOfLine {
	Handle_Hatch_SequenceNodeOfSequenceOfLine GetHandle() {
	return *(Handle_Hatch_SequenceNodeOfSequenceOfLine*) &$self;
	}
};

%nodefaultctor Handle_Hatch_SequenceNodeOfSequenceOfLine;
class Handle_Hatch_SequenceNodeOfSequenceOfLine : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Hatch_SequenceNodeOfSequenceOfLine();
        Handle_Hatch_SequenceNodeOfSequenceOfLine(const Handle_Hatch_SequenceNodeOfSequenceOfLine &aHandle);
        Handle_Hatch_SequenceNodeOfSequenceOfLine(const Hatch_SequenceNodeOfSequenceOfLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Hatch_SequenceNodeOfSequenceOfLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Hatch_SequenceNodeOfSequenceOfLine {
    Hatch_SequenceNodeOfSequenceOfLine* GetObject() {
    return (Hatch_SequenceNodeOfSequenceOfLine*)$self->Access();
    }
};
%feature("shadow") Handle_Hatch_SequenceNodeOfSequenceOfLine::~Handle_Hatch_SequenceNodeOfSequenceOfLine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Hatch_SequenceNodeOfSequenceOfLine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Hatch_SequenceNodeOfSequenceOfParameter;
class Hatch_SequenceNodeOfSequenceOfParameter : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Hatch_Parameter)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Hatch_SequenceNodeOfSequenceOfParameter;
		 Hatch_SequenceNodeOfSequenceOfParameter (const Hatch_Parameter & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Hatch_Parameter

No detailed docstring for this function.") Value;
		Hatch_Parameter & Value ();
};


%feature("shadow") Hatch_SequenceNodeOfSequenceOfParameter::~Hatch_SequenceNodeOfSequenceOfParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_SequenceNodeOfSequenceOfParameter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Hatch_SequenceNodeOfSequenceOfParameter {
	Handle_Hatch_SequenceNodeOfSequenceOfParameter GetHandle() {
	return *(Handle_Hatch_SequenceNodeOfSequenceOfParameter*) &$self;
	}
};

%nodefaultctor Handle_Hatch_SequenceNodeOfSequenceOfParameter;
class Handle_Hatch_SequenceNodeOfSequenceOfParameter : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Hatch_SequenceNodeOfSequenceOfParameter();
        Handle_Hatch_SequenceNodeOfSequenceOfParameter(const Handle_Hatch_SequenceNodeOfSequenceOfParameter &aHandle);
        Handle_Hatch_SequenceNodeOfSequenceOfParameter(const Hatch_SequenceNodeOfSequenceOfParameter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Hatch_SequenceNodeOfSequenceOfParameter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Hatch_SequenceNodeOfSequenceOfParameter {
    Hatch_SequenceNodeOfSequenceOfParameter* GetObject() {
    return (Hatch_SequenceNodeOfSequenceOfParameter*)$self->Access();
    }
};
%feature("shadow") Handle_Hatch_SequenceNodeOfSequenceOfParameter::~Handle_Hatch_SequenceNodeOfSequenceOfParameter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Hatch_SequenceNodeOfSequenceOfParameter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Hatch_SequenceOfLine;
class Hatch_SequenceOfLine : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Hatch_SequenceOfLine;
		 Hatch_SequenceOfLine ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Hatch_SequenceOfLine)

Returns:
	Hatch_SequenceOfLine

No detailed docstring for this function.") Assign;
		const Hatch_SequenceOfLine & Assign (const Hatch_SequenceOfLine & Other);
		%feature("autodoc", "Args:
	Other(Hatch_SequenceOfLine)

Returns:
	Hatch_SequenceOfLine

No detailed docstring for this function.") operator=;
		const Hatch_SequenceOfLine & operator = (const Hatch_SequenceOfLine & Other);
		%feature("autodoc", "Args:
	T(Hatch_Line)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Hatch_Line & T);
		%feature("autodoc", "Args:
	S(Hatch_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Hatch_SequenceOfLine & S);
		%feature("autodoc", "Args:
	T(Hatch_Line)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Hatch_Line & T);
		%feature("autodoc", "Args:
	S(Hatch_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Hatch_SequenceOfLine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Hatch_Line)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Hatch_Line & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Hatch_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Hatch_SequenceOfLine & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Hatch_Line)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Hatch_Line & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Hatch_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Hatch_SequenceOfLine & S);
		%feature("autodoc", "Args:
	None
Returns:
	Hatch_Line

No detailed docstring for this function.") First;
		const Hatch_Line & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Hatch_Line

No detailed docstring for this function.") Last;
		const Hatch_Line & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Hatch_SequenceOfLine)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Hatch_SequenceOfLine & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Hatch_Line

No detailed docstring for this function.") Value;
		const Hatch_Line & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Hatch_Line)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Hatch_Line & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Hatch_Line

No detailed docstring for this function.") ChangeValue;
		Hatch_Line & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Hatch_SequenceOfLine::~Hatch_SequenceOfLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_SequenceOfLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Hatch_SequenceOfParameter;
class Hatch_SequenceOfParameter : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Hatch_SequenceOfParameter;
		 Hatch_SequenceOfParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Hatch_SequenceOfParameter)

Returns:
	Hatch_SequenceOfParameter

No detailed docstring for this function.") Assign;
		const Hatch_SequenceOfParameter & Assign (const Hatch_SequenceOfParameter & Other);
		%feature("autodoc", "Args:
	Other(Hatch_SequenceOfParameter)

Returns:
	Hatch_SequenceOfParameter

No detailed docstring for this function.") operator=;
		const Hatch_SequenceOfParameter & operator = (const Hatch_SequenceOfParameter & Other);
		%feature("autodoc", "Args:
	T(Hatch_Parameter)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Hatch_Parameter & T);
		%feature("autodoc", "Args:
	S(Hatch_SequenceOfParameter)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Hatch_SequenceOfParameter & S);
		%feature("autodoc", "Args:
	T(Hatch_Parameter)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Hatch_Parameter & T);
		%feature("autodoc", "Args:
	S(Hatch_SequenceOfParameter)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Hatch_SequenceOfParameter & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Hatch_Parameter)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Hatch_Parameter & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Hatch_SequenceOfParameter)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Hatch_SequenceOfParameter & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Hatch_Parameter)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Hatch_Parameter & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Hatch_SequenceOfParameter)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Hatch_SequenceOfParameter & S);
		%feature("autodoc", "Args:
	None
Returns:
	Hatch_Parameter

No detailed docstring for this function.") First;
		const Hatch_Parameter & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Hatch_Parameter

No detailed docstring for this function.") Last;
		const Hatch_Parameter & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Hatch_SequenceOfParameter)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Hatch_SequenceOfParameter & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Hatch_Parameter

No detailed docstring for this function.") Value;
		const Hatch_Parameter & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Hatch_Parameter)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Hatch_Parameter & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Hatch_Parameter

No detailed docstring for this function.") ChangeValue;
		Hatch_Parameter & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Hatch_SequenceOfParameter::~Hatch_SequenceOfParameter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Hatch_SequenceOfParameter {
	void _kill_pointed() {
		delete $self;
	}
};
