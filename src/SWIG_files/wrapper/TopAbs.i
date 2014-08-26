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
%module TopAbs

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

%include TopAbs_required_python_modules.i
%include TopAbs_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum TopAbs_Orientation {
	TopAbs_FORWARD = 0,
	TopAbs_REVERSED = 1,
	TopAbs_INTERNAL = 2,
	TopAbs_EXTERNAL = 3,
};

enum TopAbs_ShapeEnum {
	TopAbs_COMPOUND = 0,
	TopAbs_COMPSOLID = 1,
	TopAbs_SOLID = 2,
	TopAbs_SHELL = 3,
	TopAbs_FACE = 4,
	TopAbs_WIRE = 5,
	TopAbs_EDGE = 6,
	TopAbs_VERTEX = 7,
	TopAbs_SHAPE = 8,
};

enum TopAbs_State {
	TopAbs_IN = 0,
	TopAbs_OUT = 1,
	TopAbs_ON = 2,
	TopAbs_UNKNOWN = 3,
};

/* end public enums declaration */

%rename(topabs) TopAbs;
%nodefaultctor TopAbs;
class TopAbs {
	public:
		%feature("autodoc", "Args:
	Or1(TopAbs_Orientation)
	Or2(TopAbs_Orientation)

Returns:
	static TopAbs_Orientation

Compose  the Orientation    <Or1>  and  <Or2>.    This  
         composition is not symmetric (if  you switch <Or1> and  
         <Or2> the result  is different). It assumes that <Or1>  
         is the Orientation of a Shape S1 containing a Shape S2  
         of Orientation   Or2.  The result    is the  cumulated  
         orientation of S2 in S1.  The composition law is :  
 
            \ Or2     FORWARD  REVERSED INTERNAL EXTERNAL  
          Or1       -------------------------------------  
          FORWARD   | FORWARD  REVERSED INTERNAL EXTERNAL  
                    |  
          REVERSED  | REVERSED FORWARD  INTERNAL EXTERNAL  
                    |  
          INTERNAL  | INTERNAL INTERNAL INTERNAL INTERNAL  
                    |  
          EXTERNAL  | EXTERNAL EXTERNAL EXTERNAL EXTERNAL  
    Note: The top corner in the table is the most important  
for the purposes of Open CASCADE topology and shape sharing.") Compose;
		static TopAbs_Orientation Compose (const TopAbs_Orientation Or1,const TopAbs_Orientation Or2);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)

Returns:
	static TopAbs_Orientation

xchanges the interior/exterior status of the two  
sides. This is what happens when the sense of  
direction is reversed. The following rules apply:  
 
         FORWARD          REVERSED  
         REVERSED         FORWARD  
         INTERNAL         INTERNAL  
         EXTERNAL         EXTERNAL  
 
         Reverse exchange the material sides.") Reverse;
		static TopAbs_Orientation Reverse (const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)

Returns:
	static TopAbs_Orientation

Reverses the interior/exterior status of each side of  
the object. So, to take the complement of an object  
means to reverse the interior/exterior status of its  
boundary, i.e. inside becomes outside.  
The method returns the complementary orientation,  
following the rules in the table below:  
         FORWARD          REVERSED  
         REVERSED         FORWARD  
         INTERNAL         EXTERNAL  
         EXTERNAL         INTERNAL  
 
         Complement  complements   the  material  side.  Inside  
         becomes outside.") Complement;
		static TopAbs_Orientation Complement (const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	SE(TopAbs_ShapeEnum)
	S(Standard_OStream)

Returns:
	static Standard_OStream

Prints the name  of Shape  <SEq>  as  a String  on the  
         Stream <S> and returns <S>.") Print;
		static Standard_OStream & Print (const TopAbs_ShapeEnum SE,Standard_OStream & S);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)
	S(Standard_OStream)

Returns:
	static Standard_OStream

Prints the name of the Orientation <Or> as a String on  
         the Stream <S> and returns <S>.") Print;
		static Standard_OStream & Print (const TopAbs_Orientation Or,Standard_OStream & S);
		%feature("autodoc", "Args:
	St(TopAbs_State)
	S(Standard_OStream)

Returns:
	static Standard_OStream

Prints the name of the State <St> as a String on  
         the Stream <S> and returns <S>.") Print;
		static Standard_OStream & Print (const TopAbs_State St,Standard_OStream & S);
};


%feature("shadow") TopAbs::~TopAbs %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopAbs {
	void _kill_pointed() {
		delete $self;
	}
};
