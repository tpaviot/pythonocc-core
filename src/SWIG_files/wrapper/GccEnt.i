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
%module GccEnt

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

%include GccEnt_required_python_modules.i
%include GccEnt_headers.i

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
%nodefaultctor GccEnt;
class GccEnt {
	public:
		%feature("autodoc", "Args:
	Obj(gp_Lin2d)

Returns:
	static GccEnt_QualifiedLin

Constructs a qualified line,  
so that the relative position to the circle or line of the  
solution computed by a construction algorithm using the  
qualified circle or line is not qualified, i.e. all solutions apply.") Unqualified;
		static GccEnt_QualifiedLin Unqualified (const gp_Lin2d & Obj);
		%feature("autodoc", "Args:
	Obj(gp_Circ2d)

Returns:
	static GccEnt_QualifiedCirc

Constructs a qualified circle  
so that the relative position to the circle or line of the  
solution computed by a construction algorithm using the  
qualified circle or line is not qualified, i.e. all solutions apply.") Unqualified;
		static GccEnt_QualifiedCirc Unqualified (const gp_Circ2d & Obj);
		%feature("autodoc", "Args:
	Obj(gp_Circ2d)

Returns:
	static GccEnt_QualifiedCirc

Constructs such a qualified circle that the solution  
computed by a construction algorithm using the qualified  
circle encloses the circle.") Enclosing;
		static GccEnt_QualifiedCirc Enclosing (const gp_Circ2d & Obj);
		%feature("autodoc", "Args:
	Obj(gp_Lin2d)

Returns:
	static GccEnt_QualifiedLin

Constructs a qualified line,  
so that the solution computed by a construction  
algorithm using the qualified circle or line is enclosed by  
the circle or line.") Enclosed;
		static GccEnt_QualifiedLin Enclosed (const gp_Lin2d & Obj);
		%feature("autodoc", "Args:
	Obj(gp_Circ2d)

Returns:
	static GccEnt_QualifiedCirc

Constructs a qualified circle  
so that the solution computed by a construction  
algorithm using the qualified circle or line is enclosed by  
the circle or line.") Enclosed;
		static GccEnt_QualifiedCirc Enclosed (const gp_Circ2d & Obj);
		%feature("autodoc", "Args:
	Obj(gp_Lin2d)

Returns:
	static GccEnt_QualifiedLin

Constructs a qualified line,  
so that the solution computed by a construction  
algorithm using the qualified circle or line and the circle  
or line are external to one another.") Outside;
		static GccEnt_QualifiedLin Outside (const gp_Lin2d & Obj);
		%feature("autodoc", "Args:
	Obj(gp_Circ2d)

Returns:
	static GccEnt_QualifiedCirc

Constructs a qualified circle  
so that the solution computed by a construction  
algorithm using the qualified circle or line and the circle  
or line are external to one another.") Outside;
		static GccEnt_QualifiedCirc Outside (const gp_Circ2d & Obj);
};


%feature("shadow") GccEnt::~GccEnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccEnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccEnt_Array1OfPosition;
class GccEnt_Array1OfPosition {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GccEnt_Array1OfPosition;
		 GccEnt_Array1OfPosition (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(GccEnt_Position)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") GccEnt_Array1OfPosition;
		 GccEnt_Array1OfPosition (const GccEnt_Position & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const GccEnt_Position & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(GccEnt_Array1OfPosition)

Returns:
	GccEnt_Array1OfPosition

No detailed docstring for this function.") Assign;
		const GccEnt_Array1OfPosition & Assign (const GccEnt_Array1OfPosition & Other);
		%feature("autodoc", "Args:
	Other(GccEnt_Array1OfPosition)

Returns:
	GccEnt_Array1OfPosition

No detailed docstring for this function.") operator=;
		const GccEnt_Array1OfPosition & operator = (const GccEnt_Array1OfPosition & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const GccEnt_Position & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	GccEnt_Position

No detailed docstring for this function.") Value;
		const GccEnt_Position & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	GccEnt_Position

No detailed docstring for this function.") ChangeValue;
		GccEnt_Position & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") GccEnt_Array1OfPosition::~GccEnt_Array1OfPosition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccEnt_Array1OfPosition {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccEnt_QualifiedCirc;
class GccEnt_QualifiedCirc {
	public:
		%feature("autodoc", "Args:
	Qualified(gp_Circ2d)
	Qualifier(GccEnt_Position)

Returns:
	None

Constructs a qualified circle by assigning the qualifier  
Qualifier to the circle Qualified. Qualifier may be:  
-   GccEnt_enclosing if the solution computed by a  
  construction algorithm using the qualified circle  
  encloses the circle, or  
-   GccEnt_enclosed if the solution is enclosed by the circle, or  
-   GccEnt_outside if both the solution and the circle  
  are external to one another, or  
-   GccEnt_unqualified if all solutions apply.") GccEnt_QualifiedCirc;
		 GccEnt_QualifiedCirc (const gp_Circ2d & Qualified,const GccEnt_Position Qualifier);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

Returns a 2D circle to which the qualifier is assigned.") Qualified;
		gp_Circ2d Qualified ();
		%feature("autodoc", "Args:
	None
Returns:
	GccEnt_Position

Returns  
-   the qualifier of this qualified circle, if it is enclosing,  
enclosed or outside, or  
-   GccEnt_noqualifier if it is unqualified.") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the Circ2d is Unqualified and false in  
         the other cases.") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the solution computed by a construction  
algorithm using this qualified circle encloses the circle.") IsEnclosing;
		Standard_Boolean IsEnclosing ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the solution computed by a construction  
algorithm using this qualified circle is enclosed by the circle.") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if both the solution computed by a  
construction algorithm using this qualified circle and the  
circle are external to one another.") IsOutside;
		Standard_Boolean IsOutside ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GccEnt_QualifiedCirc;
		 GccEnt_QualifiedCirc ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

No detailed docstring for this function.") _CSFDB_GetGccEnt_QualifiedCircTheQualified;
		const gp_Circ2d & _CSFDB_GetGccEnt_QualifiedCircTheQualified ();
		%feature("autodoc", "Args:
	None
Returns:
	GccEnt_Position

No detailed docstring for this function.") _CSFDB_GetGccEnt_QualifiedCircTheQualifier;
		GccEnt_Position _CSFDB_GetGccEnt_QualifiedCircTheQualifier ();
		%feature("autodoc", "Args:
	p(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetGccEnt_QualifiedCircTheQualifier;
		void _CSFDB_SetGccEnt_QualifiedCircTheQualifier (const GccEnt_Position p);
};


%feature("shadow") GccEnt_QualifiedCirc::~GccEnt_QualifiedCirc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccEnt_QualifiedCirc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GccEnt_QualifiedLin;
class GccEnt_QualifiedLin {
	public:
		%feature("autodoc", "Args:
	Qualified(gp_Lin2d)
	Qualifier(GccEnt_Position)

Returns:
	None

Constructs a qualified line by assigning the qualifier  
Qualifier to the line Qualified.  
Qualifier may be:  
-   GccEnt_enclosed if the solution is enclosed by the line, or  
-   GccEnt_outside if both the solution and the line are external to one another, or  
-   GccEnt_unqualified if all solutions apply.  
Note : the interior of a line is defined as the left-hand  
side of the line in relation to its orientation.") GccEnt_QualifiedLin;
		 GccEnt_QualifiedLin (const gp_Lin2d & Qualified,const GccEnt_Position Qualifier);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

Returns a 2D line to which the qualifier is assigned.") Qualified;
		gp_Lin2d Qualified ();
		%feature("autodoc", "Args:
	None
Returns:
	GccEnt_Position

Returns the qualifier of this qualified line, if it is 'enclosed' or  
  'outside', or  
-   GccEnt_noqualifier if it is unqualified.") Qualifier;
		GccEnt_Position Qualifier ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the solution is unqualified and false in  
         the other cases.") IsUnqualified;
		Standard_Boolean IsUnqualified ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the solution is Enclosed in the Lin2d and false in  
         the other cases.") IsEnclosed;
		Standard_Boolean IsEnclosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the solution is Outside the Lin2d and false in  
         the other cases.") IsOutside;
		Standard_Boolean IsOutside ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GccEnt_QualifiedLin;
		 GccEnt_QualifiedLin ();
		%feature("autodoc", "Args:
	None
Returns:
	GccEnt_Position

No detailed docstring for this function.") _CSFDB_GetGccEnt_QualifiedLinTheQualifier;
		GccEnt_Position _CSFDB_GetGccEnt_QualifiedLinTheQualifier ();
		%feature("autodoc", "Args:
	p(GccEnt_Position)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetGccEnt_QualifiedLinTheQualifier;
		void _CSFDB_SetGccEnt_QualifiedLinTheQualifier (const GccEnt_Position p);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

No detailed docstring for this function.") _CSFDB_GetGccEnt_QualifiedLinTheQualified;
		const gp_Lin2d & _CSFDB_GetGccEnt_QualifiedLinTheQualified ();
};


%feature("shadow") GccEnt_QualifiedLin::~GccEnt_QualifiedLin %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GccEnt_QualifiedLin {
	void _kill_pointed() {
		delete $self;
	}
};
