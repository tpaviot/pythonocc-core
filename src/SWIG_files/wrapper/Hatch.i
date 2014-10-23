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
		%feature("autodoc", "	* Returns a empty hatcher. <Tol> is the tolerance for intersections.

	:param Tol:
	:type Tol: float
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Hatch_Hatcher;
		 Hatch_Hatcher (const Standard_Real Tol,const Standard_Boolean Oriented = Standard_True);
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	* Add a line <L> to be trimmed. <T> the type is only kept from information. It is not used in the computation.

	:param L:
	:type L: gp_Lin2d
	:param T: default value is Hatch_ANYLINE
	:type T: Hatch_LineForm
	:rtype: None
") AddLine;
		void AddLine (const gp_Lin2d & L,const Hatch_LineForm T = Hatch_ANYLINE);
		%feature("autodoc", "	* Add an infinite line on direction <D> at distance <Dist> from the origin to be trimmed. <Dist> may be negative.  If O is the origin of the 2D plane, and V the vector perpendicular to D (in the direct direction).  A point P is on the line if :  OP dot V = Dist The parameter of P on the line is  OP dot D

	:param D:
	:type D: gp_Dir2d
	:param Dist:
	:type Dist: float
	:rtype: None
") AddLine;
		void AddLine (const gp_Dir2d & D,const Standard_Real Dist);
		%feature("autodoc", "	* Add an infinite line parallel to the Y-axis at abciss <X>.

	:param X:
	:type X: float
	:rtype: None
") AddXLine;
		void AddXLine (const Standard_Real X);
		%feature("autodoc", "	* Add an infinite line parallel to the X-axis at ordinate <Y>.

	:param Y:
	:type Y: float
	:rtype: None
") AddYLine;
		void AddYLine (const Standard_Real Y);
		%feature("autodoc", "	* Trims the lines at intersections with <L>.

	:param L:
	:type L: gp_Lin2d
	:param Index: default value is 0
	:type Index: Standard_Integer
	:rtype: None
") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Integer Index = 0);
		%feature("autodoc", "	* Trims the lines at intersections with <L> in the parameter range <Start>, <End>

	:param L:
	:type L: gp_Lin2d
	:param Start:
	:type Start: float
	:param End:
	:type End: float
	:param Index: default value is 0
	:type Index: Standard_Integer
	:rtype: None
") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Real Start,const Standard_Real End,const Standard_Integer Index = 0);
		%feature("autodoc", "	* Trims the line at intersection with the oriented segment P1,P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param Index: default value is 0
	:type Index: Standard_Integer
	:rtype: None
") Trim;
		void Trim (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Integer Index = 0);
		%feature("autodoc", "	* Returns the total number of intervals on all the lines.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "	* Returns the number of lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "	* Returns the line of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: gp_Lin2d
") Line;
		const gp_Lin2d  Line (const Standard_Integer I);
		%feature("autodoc", "	* Returns the type of the line of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: Hatch_LineForm
") LineForm;
		Hatch_LineForm LineForm (const Standard_Integer I);
		%feature("autodoc", "	* Returns True if the line of index <I> has a constant X value.

	:param I:
	:type I: Standard_Integer
	:rtype: bool
") IsXLine;
		Standard_Boolean IsXLine (const Standard_Integer I);
		%feature("autodoc", "	* Returns True if the line of index <I> has a constant Y value.

	:param I:
	:type I: Standard_Integer
	:rtype: bool
") IsYLine;
		Standard_Boolean IsYLine (const Standard_Integer I);
		%feature("autodoc", "	* Returns the X or Y coordinate of the line of index <I> if it is a X or a Y line.

	:param I:
	:type I: Standard_Integer
	:rtype: float
") Coordinate;
		Standard_Real Coordinate (const Standard_Integer I);
		%feature("autodoc", "	* Returns the number of intervals on line of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const Standard_Integer I);
		%feature("autodoc", "	* Returns the first parameter of interval <J> on line <I>.

	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:rtype: float
") Start;
		Standard_Real Start (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "	* Returns the first Index and Par2 of interval <J> on line <I>.

	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:param Index:
	:type Index: Standard_Integer &
	:param Par2:
	:type Par2: float &
	:rtype: None
") StartIndex;
		void StartIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the last parameter of interval <J> on line <I>.

	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:rtype: float
") End;
		Standard_Real End (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "	* Returns the last Index and Par2 of interval <J> on line <I>.

	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:param Index:
	:type Index: Standard_Integer &
	:param Par2:
	:type Par2: float &
	:rtype: None
") EndIndex;
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
		%feature("autodoc", "	:rtype: None
") Hatch_Line;
		 Hatch_Line ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param T:
	:type T: Hatch_LineForm
	:rtype: None
") Hatch_Line;
		 Hatch_Line (const gp_Lin2d & L,const Hatch_LineForm T);
		%feature("autodoc", "	* Insert a new intersection in the sorted list.

	:param Par1:
	:type Par1: float
	:param Start:
	:type Start: bool
	:param Index:
	:type Index: Standard_Integer
	:param Par2:
	:type Par2: float
	:param theToler:
	:type theToler: float
	:rtype: None
") AddIntersection;
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
		%feature("autodoc", "	:rtype: None
") Hatch_Parameter;
		 Hatch_Parameter ();
		%feature("autodoc", "	:param Par1:
	:type Par1: float
	:param Start:
	:type Start: bool
	:param Index: default value is 0
	:type Index: Standard_Integer
	:param Par2: default value is 0
	:type Par2: float
	:rtype: None
") Hatch_Parameter;
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
		%feature("autodoc", "	:param I:
	:type I: Hatch_Line &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Hatch_SequenceNodeOfSequenceOfLine;
		 Hatch_SequenceNodeOfSequenceOfLine (const Hatch_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Hatch_Line
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Hatch_Parameter &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Hatch_SequenceNodeOfSequenceOfParameter;
		 Hatch_SequenceNodeOfSequenceOfParameter (const Hatch_Parameter & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Hatch_Parameter
") Value;
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
		%feature("autodoc", "	:rtype: None
") Hatch_SequenceOfLine;
		 Hatch_SequenceOfLine ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfLine &
	:rtype: Hatch_SequenceOfLine
") Assign;
		const Hatch_SequenceOfLine & Assign (const Hatch_SequenceOfLine & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfLine &
	:rtype: Hatch_SequenceOfLine
") operator=;
		const Hatch_SequenceOfLine & operator = (const Hatch_SequenceOfLine & Other);
		%feature("autodoc", "	:param T:
	:type T: Hatch_Line &
	:rtype: None
") Append;
		void Append (const Hatch_Line & T);
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") Append;
		void Append (Hatch_SequenceOfLine & S);
		%feature("autodoc", "	:param T:
	:type T: Hatch_Line &
	:rtype: None
") Prepend;
		void Prepend (const Hatch_Line & T);
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") Prepend;
		void Prepend (Hatch_SequenceOfLine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Hatch_Line &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Hatch_Line & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Hatch_SequenceOfLine & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Hatch_Line &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Hatch_Line & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Hatch_SequenceOfLine & S);
		%feature("autodoc", "	:rtype: Hatch_Line
") First;
		const Hatch_Line & First ();
		%feature("autodoc", "	:rtype: Hatch_Line
") Last;
		const Hatch_Line & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Hatch_SequenceOfLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Hatch_SequenceOfLine & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Hatch_Line
") Value;
		const Hatch_Line & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Hatch_Line &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Hatch_Line & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Hatch_Line
") ChangeValue;
		Hatch_Line & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") Hatch_SequenceOfParameter;
		 Hatch_SequenceOfParameter ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfParameter &
	:rtype: Hatch_SequenceOfParameter
") Assign;
		const Hatch_SequenceOfParameter & Assign (const Hatch_SequenceOfParameter & Other);
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfParameter &
	:rtype: Hatch_SequenceOfParameter
") operator=;
		const Hatch_SequenceOfParameter & operator = (const Hatch_SequenceOfParameter & Other);
		%feature("autodoc", "	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") Append;
		void Append (const Hatch_Parameter & T);
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") Append;
		void Append (Hatch_SequenceOfParameter & S);
		%feature("autodoc", "	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") Prepend;
		void Prepend (const Hatch_Parameter & T);
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") Prepend;
		void Prepend (Hatch_SequenceOfParameter & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Hatch_Parameter & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Hatch_SequenceOfParameter & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Hatch_Parameter & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Hatch_SequenceOfParameter & S);
		%feature("autodoc", "	:rtype: Hatch_Parameter
") First;
		const Hatch_Parameter & First ();
		%feature("autodoc", "	:rtype: Hatch_Parameter
") Last;
		const Hatch_Parameter & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: Hatch_SequenceOfParameter &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Hatch_SequenceOfParameter & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Hatch_Parameter
") Value;
		const Hatch_Parameter & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Hatch_Parameter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Hatch_Parameter & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Hatch_Parameter
") ChangeValue;
		Hatch_Parameter & ChangeValue (const Standard_Integer Index);
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
