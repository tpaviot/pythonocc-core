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
%module (package="OCC") GccEnt

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


%include GccEnt_headers.i


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
enum GccEnt_Position {
	GccEnt_unqualified = 0,
	GccEnt_enclosing = 1,
	GccEnt_enclosed = 2,
	GccEnt_outside = 3,
	GccEnt_noqualifier = 4,
};

/* end public enums declaration */

%rename(gccent) GccEnt;
class GccEnt {
	public:
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "	* Constructs a qualified line, so that the relative position to the circle or line of the solution computed by a construction algorithm using the qualified circle or line is not qualified, i.e. all solutions apply.

	:param Obj:
	:type Obj: gp_Lin2d
	:rtype: GccEnt_QualifiedLin
") Unqualified;
		static GccEnt_QualifiedLin Unqualified (const gp_Lin2d & Obj);
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "	* Constructs a qualified circle so that the relative position to the circle or line of the solution computed by a construction algorithm using the qualified circle or line is not qualified, i.e. all solutions apply.

	:param Obj:
	:type Obj: gp_Circ2d
	:rtype: GccEnt_QualifiedCirc
") Unqualified;
		static GccEnt_QualifiedCirc Unqualified (const gp_Circ2d & Obj);
		%feature("compactdefaultargs") Enclosing;
		%feature("autodoc", "	* Constructs such a qualified circle that the solution computed by a construction algorithm using the qualified circle encloses the circle.

	:param Obj:
	:type Obj: gp_Circ2d
	:rtype: GccEnt_QualifiedCirc
") Enclosing;
		static GccEnt_QualifiedCirc Enclosing (const gp_Circ2d & Obj);
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "	* Constructs a qualified line, so that the solution computed by a construction algorithm using the qualified circle or line is enclosed by the circle or line.

	:param Obj:
	:type Obj: gp_Lin2d
	:rtype: GccEnt_QualifiedLin
") Enclosed;
		static GccEnt_QualifiedLin Enclosed (const gp_Lin2d & Obj);
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "	* Constructs a qualified circle so that the solution computed by a construction algorithm using the qualified circle or line is enclosed by the circle or line.

	:param Obj:
	:type Obj: gp_Circ2d
	:rtype: GccEnt_QualifiedCirc
") Enclosed;
		static GccEnt_QualifiedCirc Enclosed (const gp_Circ2d & Obj);
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "	* Constructs a qualified line, so that the solution computed by a construction algorithm using the qualified circle or line and the circle or line are external to one another.

	:param Obj:
	:type Obj: gp_Lin2d
	:rtype: GccEnt_QualifiedLin
") Outside;
		static GccEnt_QualifiedLin Outside (const gp_Lin2d & Obj);
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "	* Constructs a qualified circle so that the solution computed by a construction algorithm using the qualified circle or line and the circle or line are external to one another.

	:param Obj:
	:type Obj: gp_Circ2d
	:rtype: GccEnt_QualifiedCirc
") Outside;
		static GccEnt_QualifiedCirc Outside (const gp_Circ2d & Obj);
};


%extend GccEnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GccEnt_Array1OfPosition;
class GccEnt_Array1OfPosition {
	public:
		%feature("compactdefaultargs") GccEnt_Array1OfPosition;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GccEnt_Array1OfPosition;
		 GccEnt_Array1OfPosition (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") GccEnt_Array1OfPosition;
		%feature("autodoc", "	:param Item:
	:type Item: GccEnt_Position &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GccEnt_Array1OfPosition;
		 GccEnt_Array1OfPosition (const GccEnt_Position & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: GccEnt_Position &
	:rtype: None
") Init;
		void Init (const GccEnt_Position & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: GccEnt_Array1OfPosition &
	:rtype: GccEnt_Array1OfPosition
") Assign;
		const GccEnt_Array1OfPosition & Assign (const GccEnt_Array1OfPosition & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GccEnt_Array1OfPosition &
	:rtype: GccEnt_Array1OfPosition
") operator =;
		const GccEnt_Array1OfPosition & operator = (const GccEnt_Array1OfPosition & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: GccEnt_Position &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const GccEnt_Position & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: GccEnt_Position
") Value;
		const GccEnt_Position & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: GccEnt_Position
") ChangeValue;
		GccEnt_Position & ChangeValue (const Standard_Integer Index);
};


%extend GccEnt_Array1OfPosition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GccEnt_QualifiedCirc;
class GccEnt_QualifiedCirc {
	public:
		%feature("compactdefaultargs") GccEnt_QualifiedCirc;
		%feature("autodoc", "	* Constructs a qualified circle by assigning the qualifier Qualifier to the circle Qualified. Qualifier may be: - GccEnt_enclosing if the solution computed by a construction algorithm using the qualified circle encloses the circle, or - GccEnt_enclosed if the solution is enclosed by the circle, or - GccEnt_outside if both the solution and the circle are external to one another, or - GccEnt_unqualified if all solutions apply.

	:param Qualified:
	:type Qualified: gp_Circ2d
	:param Qualifier:
	:type Qualifier: GccEnt_Position
	:rtype: None
") GccEnt_QualifiedCirc;
		 GccEnt_QualifiedCirc (const gp_Circ2d & Qualified,const GccEnt_Position Qualifier);
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "	* Returns a 2D circle to which the qualifier is assigned.

	:rtype: gp_Circ2d
") Qualified;
		gp_Circ2d Qualified ();
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "	* Returns - the qualifier of this qualified circle, if it is enclosing, enclosed or outside, or - GccEnt_noqualifier if it is unqualified.

	:rtype: GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "	* Returns true if the Circ2d is Unqualified and false in the other cases.

	:rtype: bool
") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "	* Returns true if the solution computed by a construction algorithm using this qualified circle encloses the circle.

	:rtype: bool
") IsEnclosing;
		Standard_Boolean IsEnclosing ();
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "	* Returns true if the solution computed by a construction algorithm using this qualified circle is enclosed by the circle.

	:rtype: bool
") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "	* Returns true if both the solution computed by a construction algorithm using this qualified circle and the circle are external to one another.

	:rtype: bool
") IsOutside;
		Standard_Boolean IsOutside ();
		%feature("compactdefaultargs") GccEnt_QualifiedCirc;
		%feature("autodoc", "	:rtype: None
") GccEnt_QualifiedCirc;
		 GccEnt_QualifiedCirc ();
		%feature("compactdefaultargs") _CSFDB_GetGccEnt_QualifiedCircTheQualified;
		%feature("autodoc", "	:rtype: gp_Circ2d
") _CSFDB_GetGccEnt_QualifiedCircTheQualified;
		const gp_Circ2d  _CSFDB_GetGccEnt_QualifiedCircTheQualified ();
		%feature("compactdefaultargs") _CSFDB_GetGccEnt_QualifiedCircTheQualifier;
		%feature("autodoc", "	:rtype: GccEnt_Position
") _CSFDB_GetGccEnt_QualifiedCircTheQualifier;
		GccEnt_Position _CSFDB_GetGccEnt_QualifiedCircTheQualifier ();
		%feature("compactdefaultargs") _CSFDB_SetGccEnt_QualifiedCircTheQualifier;
		%feature("autodoc", "	:param p:
	:type p: GccEnt_Position
	:rtype: None
") _CSFDB_SetGccEnt_QualifiedCircTheQualifier;
		void _CSFDB_SetGccEnt_QualifiedCircTheQualifier (const GccEnt_Position p);
};


%extend GccEnt_QualifiedCirc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GccEnt_QualifiedLin;
class GccEnt_QualifiedLin {
	public:
		%feature("compactdefaultargs") GccEnt_QualifiedLin;
		%feature("autodoc", "	* Constructs a qualified line by assigning the qualifier Qualifier to the line Qualified. Qualifier may be: - GccEnt_enclosed if the solution is enclosed by the line, or - GccEnt_outside if both the solution and the line are external to one another, or - GccEnt_unqualified if all solutions apply. Note : the interior of a line is defined as the left-hand side of the line in relation to its orientation.

	:param Qualified:
	:type Qualified: gp_Lin2d
	:param Qualifier:
	:type Qualifier: GccEnt_Position
	:rtype: None
") GccEnt_QualifiedLin;
		 GccEnt_QualifiedLin (const gp_Lin2d & Qualified,const GccEnt_Position Qualifier);
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "	* Returns a 2D line to which the qualifier is assigned.

	:rtype: gp_Lin2d
") Qualified;
		gp_Lin2d Qualified ();
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "	* Returns the qualifier of this qualified line, if it is 'enclosed' or 'outside', or - GccEnt_noqualifier if it is unqualified.

	:rtype: GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "	* Returns true if the solution is unqualified and false in the other cases.

	:rtype: bool
") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "	* Returns true if the solution is Enclosed in the Lin2d and false in the other cases.

	:rtype: bool
") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "	* Returns true if the solution is Outside the Lin2d and false in the other cases.

	:rtype: bool
") IsOutside;
		Standard_Boolean IsOutside ();
		%feature("compactdefaultargs") GccEnt_QualifiedLin;
		%feature("autodoc", "	:rtype: None
") GccEnt_QualifiedLin;
		 GccEnt_QualifiedLin ();
		%feature("compactdefaultargs") _CSFDB_GetGccEnt_QualifiedLinTheQualifier;
		%feature("autodoc", "	:rtype: GccEnt_Position
") _CSFDB_GetGccEnt_QualifiedLinTheQualifier;
		GccEnt_Position _CSFDB_GetGccEnt_QualifiedLinTheQualifier ();
		%feature("compactdefaultargs") _CSFDB_SetGccEnt_QualifiedLinTheQualifier;
		%feature("autodoc", "	:param p:
	:type p: GccEnt_Position
	:rtype: None
") _CSFDB_SetGccEnt_QualifiedLinTheQualifier;
		void _CSFDB_SetGccEnt_QualifiedLinTheQualifier (const GccEnt_Position p);
		%feature("compactdefaultargs") _CSFDB_GetGccEnt_QualifiedLinTheQualified;
		%feature("autodoc", "	:rtype: gp_Lin2d
") _CSFDB_GetGccEnt_QualifiedLinTheQualified;
		const gp_Lin2d  _CSFDB_GetGccEnt_QualifiedLinTheQualified ();
};


%extend GccEnt_QualifiedLin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
