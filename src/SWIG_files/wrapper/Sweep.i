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
%module (package="OCC") Sweep

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

%include Sweep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Sweep_NumShape;
class Sweep_NumShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a dummy indexed edge.") Sweep_NumShape;
		 Sweep_NumShape ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Type(TopAbs_ShapeEnum)
	Closed(Standard_Boolean)=Standard_False
	BegInf(Standard_Boolean)=Standard_False
	EndInf(Standard_Boolean)=Standard_False

Returns:
	None

Creates a new simple indexed edge.  
 
         For an Edge : Index is the  number of vertices (0,  
         1 or 2),Type is TopAbs_EDGE, Closed  is true if it  
         is a  closed edge, BegInf is true  if  the Edge is  
         infinite at the  begenning, EndInf is true  if the  
         edge is infinite at the end.  
 
         For a Vertex : Index is the index of the vertex in  
         the edge (1 or 2),  Type  is TopAbsVERTEX, all the  
         other fields have no meanning.") Sweep_NumShape;
		 Sweep_NumShape (const Standard_Integer Index,const TopAbs_ShapeEnum Type,const Standard_Boolean Closed = Standard_False,const Standard_Boolean BegInf = Standard_False,const Standard_Boolean EndInf = Standard_False);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Type(TopAbs_ShapeEnum)
	Closed(Standard_Boolean)=Standard_False
	BegInf(Standard_Boolean)=Standard_False
	EndInf(Standard_Boolean)=Standard_False

Returns:
	None

Reinitialize a simple indexed edge.  
 
         For an Edge : Index is the  number of vertices (0,  
         1 or 2),Type is TopAbs_EDGE, Closed  is true if it  
         is a  closed edge, BegInf is true  if  the Edge is  
         infinite at the  begenning, EndInf is true  if the  
         edge is infinite at the end.  
 
         For a Vertex : Index is the index of the vertex in  
         the edge (1 or 2), Type is TopAbsVERTEX, Closed is  
         true if it is the vertex of a closed edge, all the  
         other fields have no meanning.") Init;
		void Init (const Standard_Integer Index,const TopAbs_ShapeEnum Type,const Standard_Boolean Closed = Standard_False,const Standard_Boolean BegInf = Standard_False,const Standard_Boolean EndInf = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

No detailed docstring for this function.") Type;
		TopAbs_ShapeEnum Type ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") BegInfinite;
		Standard_Boolean BegInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") EndInfinite;
		Standard_Boolean EndInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
};


%feature("shadow") Sweep_NumShape::~Sweep_NumShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Sweep_NumShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Sweep_NumShapeIterator;
class Sweep_NumShapeIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Sweep_NumShapeIterator;
		 Sweep_NumShapeIterator ();
		%feature("autodoc", "Args:
	aShape(Sweep_NumShape)

Returns:
	None

Resest the NumShapeIterator on sub-shapes of <aShape>.") Init;
		void Init (const Sweep_NumShape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current sub-shape.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves to the next sub-shape.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Sweep_NumShape

Returns the current sub-shape.") Value;
		const Sweep_NumShape & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the orientation of the current sub-shape.") Orientation;
		TopAbs_Orientation Orientation ();
};


%feature("shadow") Sweep_NumShapeIterator::~Sweep_NumShapeIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Sweep_NumShapeIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Sweep_NumShapeTool;
class Sweep_NumShapeTool {
	public:
		%feature("autodoc", "Args:
	aShape(Sweep_NumShape)

Returns:
	None

Create a new NumShapeTool with <aShape>.  The Tool  
         must prepare an indexation  for  all the subshapes  
         of this shape.") Sweep_NumShapeTool;
		 Sweep_NumShapeTool (const Sweep_NumShape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of subshapes in the shape.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	aShape(Sweep_NumShape)

Returns:
	Standard_Integer

Returns the index of <aShape>.") Index;
		Standard_Integer Index (const Sweep_NumShape & aShape);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Sweep_NumShape

Returns the Shape at index anIndex") Shape;
		Sweep_NumShape Shape (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	aShape(Sweep_NumShape)

Returns:
	TopAbs_ShapeEnum

Returns the type of <aShape>.") Type;
		TopAbs_ShapeEnum Type (const Sweep_NumShape & aShape);
		%feature("autodoc", "Args:
	aShape(Sweep_NumShape)

Returns:
	TopAbs_Orientation

Returns the orientation of <aShape>.") Orientation;
		TopAbs_Orientation Orientation (const Sweep_NumShape & aShape);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a First Vertex in the Shape.") HasFirstVertex;
		Standard_Boolean HasFirstVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is a Last Vertex in the Shape.") HasLastVertex;
		Standard_Boolean HasLastVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Sweep_NumShape

Returns the first vertex.") FirstVertex;
		Sweep_NumShape FirstVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Sweep_NumShape

Returns the last vertex.") LastVertex;
		Sweep_NumShape LastVertex ();
};


%feature("shadow") Sweep_NumShapeTool::~Sweep_NumShapeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Sweep_NumShapeTool {
	void _kill_pointed() {
		delete $self;
	}
};
