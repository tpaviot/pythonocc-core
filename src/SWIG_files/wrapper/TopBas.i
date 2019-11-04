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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define TOPBASDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=TOPBASDOCSTRING) TopBas

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include TopBas_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(TopBas_ListOfTestInterference) NCollection_List <TopBas_TestInterference>;
%template(TopBas_ListIteratorOfListOfTestInterference) NCollection_TListIterator<TopBas_TestInterference>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <TopBas_TestInterference> TopBas_ListOfTestInterference;
typedef NCollection_List <TopBas_TestInterference>::Iterator TopBas_ListIteratorOfListOfTestInterference;
/* end typedefs declaration */

%nodefaultctor TopBas_TestInterference;
class TopBas_TestInterference {
	public:
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "	:param B:
	:type B: int &
	:rtype: None
") Boundary;
		void Boundary (const Standard_Integer & B);
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "	:rtype: int
") Boundary;
		const Standard_Integer & Boundary ();
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "	:param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None
") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetChangeBoundary() {
                return (Standard_Integer) $self->ChangeBoundary();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeBoundary(Standard_Integer value ) {
                $self->ChangeBoundary()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Real GetChangeIntersection() {
                return (Standard_Real) $self->ChangeIntersection();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetChangeIntersection(Standard_Real value ) {
                $self->ChangeIntersection()=value;
                }
            };
            		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:param I:
	:type I: float &
	:rtype: None
") Intersection;
		void Intersection (const Standard_Real & I);
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "	:rtype: float
") Intersection;
		const Standard_Real & Intersection ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "	:rtype: None
") TopBas_TestInterference;
		 TopBas_TestInterference ();
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "	:param Inters:
	:type Inters: float &
	:param Bound:
	:type Bound: int &
	:param Orient:
	:type Orient: TopAbs_Orientation
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param BTrans:
	:type BTrans: TopAbs_Orientation
	:rtype: None
") TopBas_TestInterference;
		 TopBas_TestInterference (const Standard_Real & Inters,const Standard_Integer & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:param Tr:
	:type Tr: TopAbs_Orientation
	:rtype: None
") Transition;
		void Transition (const TopAbs_Orientation Tr);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
};


%extend TopBas_TestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
