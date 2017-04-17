/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Hatch_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

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
		%feature("compactdefaultargs") Hatch_Hatcher;
		%feature("autodoc", "	* Returns a empty hatcher. <Tol> is the tolerance for intersections.

	:param Tol:
	:type Tol: float
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Hatch_Hatcher;
		 Hatch_Hatcher (const Standard_Real Tol,const Standard_Boolean Oriented = Standard_True);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "	* Add a line <L> to be trimmed. <T> the type is only kept from information. It is not used in the computation.

	:param L:
	:type L: gp_Lin2d
	:param T: default value is Hatch_ANYLINE
	:type T: Hatch_LineForm
	:rtype: None
") AddLine;
		void AddLine (const gp_Lin2d & L,const Hatch_LineForm T = Hatch_ANYLINE);
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "	* Add an infinite line on direction <D> at distance <Dist> from the origin to be trimmed. <Dist> may be negative. //! If O is the origin of the 2D plane, and V the vector perpendicular to D (in the direct direction). //! A point P is on the line if : OP dot V = Dist The parameter of P on the line is OP dot D

	:param D:
	:type D: gp_Dir2d
	:param Dist:
	:type Dist: float
	:rtype: None
") AddLine;
		void AddLine (const gp_Dir2d & D,const Standard_Real Dist);
		%feature("compactdefaultargs") AddXLine;
		%feature("autodoc", "	* Add an infinite line parallel to the Y-axis at abciss <X>.

	:param X:
	:type X: float
	:rtype: None
") AddXLine;
		void AddXLine (const Standard_Real X);
		%feature("compactdefaultargs") AddYLine;
		%feature("autodoc", "	* Add an infinite line parallel to the X-axis at ordinate <Y>.

	:param Y:
	:type Y: float
	:rtype: None
") AddYLine;
		void AddYLine (const Standard_Real Y);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the lines at intersections with <L>.

	:param L:
	:type L: gp_Lin2d
	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Integer Index = 0);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the lines at intersections with <L> in the parameter range <Start>, <End>

	:param L:
	:type L: gp_Lin2d
	:param Start:
	:type Start: float
	:param End:
	:type End: float
	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Real Start,const Standard_Real End,const Standard_Integer Index = 0);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the line at intersection with the oriented segment P1,P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Trim;
		void Trim (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Integer Index = 0);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the total number of intervals on all the lines.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of index <I>.

	:param I:
	:type I: int
	:rtype: gp_Lin2d
") Line;
		const gp_Lin2d  Line (const Standard_Integer I);
		%feature("compactdefaultargs") LineForm;
		%feature("autodoc", "	* Returns the type of the line of index <I>.

	:param I:
	:type I: int
	:rtype: Hatch_LineForm
") LineForm;
		Hatch_LineForm LineForm (const Standard_Integer I);
		%feature("compactdefaultargs") IsXLine;
		%feature("autodoc", "	* Returns True if the line of index <I> has a constant X value.

	:param I:
	:type I: int
	:rtype: bool
") IsXLine;
		Standard_Boolean IsXLine (const Standard_Integer I);
		%feature("compactdefaultargs") IsYLine;
		%feature("autodoc", "	* Returns True if the line of index <I> has a constant Y value.

	:param I:
	:type I: int
	:rtype: bool
") IsYLine;
		Standard_Boolean IsYLine (const Standard_Integer I);
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "	* Returns the X or Y coordinate of the line of index <I> if it is a X or a Y line.

	:param I:
	:type I: int
	:rtype: float
") Coordinate;
		Standard_Real Coordinate (const Standard_Integer I);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals on line of index <I>.

	:param I:
	:type I: int
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const Standard_Integer I);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Returns the first parameter of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: float
") Start;
		Standard_Real Start (const Standard_Integer I,const Standard_Integer J);
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "	* Returns the first Index and Par2 of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:param Index:
	:type Index: int &
	:param Par2:
	:type Par2: float &
	:rtype: None
") StartIndex;
		void StartIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") End;
		%feature("autodoc", "	* Returns the last parameter of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: float
") End;
		Standard_Real End (const Standard_Integer I,const Standard_Integer J);
		%feature("compactdefaultargs") EndIndex;
		%feature("autodoc", "	* Returns the last Index and Par2 of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:param Index:
	:type Index: int &
	:param Par2:
	:type Par2: float &
	:rtype: None
") EndIndex;
		void EndIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
};


%extend Hatch_Hatcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_Line;
class Hatch_Line {
	public:
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "	:rtype: None
") Hatch_Line;
		 Hatch_Line ();
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param T:
	:type T: Hatch_LineForm
	:rtype: None
") Hatch_Line;
		 Hatch_Line (const gp_Lin2d & L,const Hatch_LineForm T);
		%feature("compactdefaultargs") AddIntersection;
		%feature("autodoc", "	* Insert a new intersection in the sorted list.

	:param Par1:
	:type Par1: float
	:param Start:
	:type Start: bool
	:param Index:
	:type Index: int
	:param Par2:
	:type Par2: float
	:param theToler:
	:type theToler: float
	:rtype: None
") AddIntersection;
		void AddIntersection (const Standard_Real Par1,const Standard_Boolean Start,const Standard_Integer Index,const Standard_Real Par2,const Standard_Real theToler);
};


%extend Hatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_Parameter;
class Hatch_Parameter {
	public:
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "	:rtype: None
") Hatch_Parameter;
		 Hatch_Parameter ();
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "	:param Par1:
	:type Par1: float
	:param Start:
	:type Start: bool
	:param Index: default value is 0
	:type Index: int
	:param Par2: default value is 0
	:type Par2: float
	:rtype: None
") Hatch_Parameter;
		 Hatch_Parameter (const Standard_Real Par1,const Standard_Boolean Start,const Standard_Integer Index = 0,const Standard_Real Par2 = 0);
};


%extend Hatch_Parameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_SequenceNodeOfSequenceOfLine;
class Hatch_SequenceNodeOfSequenceOfLine : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Hatch_SequenceNodeOfSequenceOfLine;
		%feature("autodoc", "	:param I:
	:type I: Hatch_Line &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Hatch_SequenceNodeOfSequenceOfLine;
		 Hatch_SequenceNodeOfSequenceOfLine (const Hatch_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Hatch_Line
") Value;
		Hatch_Line & Value ();
};


%extend Hatch_SequenceNodeOfSequenceOfLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Hatch_SequenceNodeOfSequenceOfLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Hatch_SequenceNodeOfSequenceOfLine::Handle_Hatch_SequenceNodeOfSequenceOfLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Hatch_SequenceNodeOfSequenceOfLine* _get_reference() {
    return (Hatch_SequenceNodeOfSequenceOfLine*)$self->Access();
    }
};

%extend Handle_Hatch_SequenceNodeOfSequenceOfLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Hatch_SequenceNodeOfSequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_SequenceNodeOfSequenceOfParameter;
class Hatch_SequenceNodeOfSequenceOfParameter : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Hatch_SequenceNodeOfSequenceOfParameter;
		%feature("autodoc", "	:param I:
	:type I: Hatch_Parameter &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Hatch_SequenceNodeOfSequenceOfParameter;
		 Hatch_SequenceNodeOfSequenceOfParameter (const Hatch_Parameter & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Hatch_Parameter
") Value;
		Hatch_Parameter & Value ();
};


%extend Hatch_SequenceNodeOfSequenceOfParameter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Hatch_SequenceNodeOfSequenceOfParameter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Hatch_SequenceNodeOfSequenceOfParameter::Handle_Hatch_SequenceNodeOfSequenceOfParameter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Hatch_SequenceNodeOfSequenceOfParameter* _get_reference() {
    return (Hatch_SequenceNodeOfSequenceOfParameter*)$self->Access();
    }
};

%extend Handle_Hatch_SequenceNodeOfSequenceOfParameter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Hatch_SequenceNodeOfSequenceOfParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_SequenceOfLine;
class Hatch_SequenceOfLine : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Hatch_SequenceOfLine;
		%feature("autodoc", "	:rtype: None
") Hatch_SequenceOfLine;
		 Hatch_SequenceOfLine ();
		%feature("compactdefaultargs") Hatch_SequenceOfLine;
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfLine &
	:rtype: None
") Hatch_SequenceOfLine;
		 Hatch_SequenceOfLine (const Hatch_SequenceOfLine & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfLine &
	:rtype: Hatch_SequenceOfLine
") Assign;
		const Hatch_SequenceOfLine & Assign (const Hatch_SequenceOfLine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfLine &
	:rtype: Hatch_SequenceOfLine
") operator =;
		const Hatch_SequenceOfLine & operator = (const Hatch_SequenceOfLine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Hatch_Line &
	:rtype: None
") Append;
		void Append (const Hatch_Line & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") Append;
		void Append (Hatch_SequenceOfLine & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Hatch_Line &
	:rtype: None
") Prepend;
		void Prepend (const Hatch_Line & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") Prepend;
		void Prepend (Hatch_SequenceOfLine & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Hatch_Line &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Hatch_Line & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Hatch_SequenceOfLine & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Hatch_Line &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Hatch_Line & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Hatch_SequenceOfLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Hatch_SequenceOfLine & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Hatch_Line
") First;
		const Hatch_Line & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Hatch_Line
") Last;
		const Hatch_Line & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Hatch_SequenceOfLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Hatch_SequenceOfLine & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Hatch_Line
") Value;
		const Hatch_Line & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Hatch_Line &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Hatch_Line & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Hatch_Line
") ChangeValue;
		Hatch_Line & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Hatch_SequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_SequenceOfParameter;
class Hatch_SequenceOfParameter : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Hatch_SequenceOfParameter;
		%feature("autodoc", "	:rtype: None
") Hatch_SequenceOfParameter;
		 Hatch_SequenceOfParameter ();
		%feature("compactdefaultargs") Hatch_SequenceOfParameter;
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfParameter &
	:rtype: None
") Hatch_SequenceOfParameter;
		 Hatch_SequenceOfParameter (const Hatch_SequenceOfParameter & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfParameter &
	:rtype: Hatch_SequenceOfParameter
") Assign;
		const Hatch_SequenceOfParameter & Assign (const Hatch_SequenceOfParameter & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Hatch_SequenceOfParameter &
	:rtype: Hatch_SequenceOfParameter
") operator =;
		const Hatch_SequenceOfParameter & operator = (const Hatch_SequenceOfParameter & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") Append;
		void Append (const Hatch_Parameter & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") Append;
		void Append (Hatch_SequenceOfParameter & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") Prepend;
		void Prepend (const Hatch_Parameter & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") Prepend;
		void Prepend (Hatch_SequenceOfParameter & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Hatch_Parameter & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Hatch_SequenceOfParameter & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Hatch_Parameter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Hatch_Parameter & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Hatch_SequenceOfParameter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Hatch_SequenceOfParameter & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Hatch_Parameter
") First;
		const Hatch_Parameter & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Hatch_Parameter
") Last;
		const Hatch_Parameter & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Hatch_SequenceOfParameter &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Hatch_SequenceOfParameter & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Hatch_Parameter
") Value;
		const Hatch_Parameter & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Hatch_Parameter &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Hatch_Parameter & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Hatch_Parameter
") ChangeValue;
		Hatch_Parameter & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Hatch_SequenceOfParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
