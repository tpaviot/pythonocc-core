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
%define TOPBASDOCSTRING
"TopBas module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topbas.html"
%enddef
%module (package="OCC.Core", docstring=TOPBASDOCSTRING) TopBas


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


%{
#include<TopBas_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopAbs.i
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

/********************************
* class TopBas_TestInterference *
********************************/
class TopBas_TestInterference {
	public:
		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", ":param B:
	:type B: int
	:rtype: None") Boundary;
		void Boundary (const Standard_Integer & B);

		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", ":rtype: int") Boundary;
		const Standard_Integer & Boundary ();

		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", ":param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None") BoundaryTransition;
		void BoundaryTransition (const TopAbs_Orientation BTr);

		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", ":rtype: TopAbs_Orientation") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetChangeBoundary() {
            return (Standard_Integer) $self->ChangeBoundary();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeBoundary(Standard_Integer value) {
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
            void SetChangeIntersection(Standard_Real value) {
            $self->ChangeIntersection()=value;
            }
        };
		/****************** Intersection ******************/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", ":param I:
	:type I: float
	:rtype: None") Intersection;
		void Intersection (const Standard_Real & I);

		/****************** Intersection ******************/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", ":rtype: float") Intersection;
		const Standard_Real & Intersection ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const TopAbs_Orientation O);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** TopBas_TestInterference ******************/
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", ":rtype: None") TopBas_TestInterference;
		 TopBas_TestInterference ();

		/****************** TopBas_TestInterference ******************/
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", ":param Inters:
	:type Inters: float
	:param Bound:
	:type Bound: int
	:param Orient:
	:type Orient: TopAbs_Orientation
	:param Trans:
	:type Trans: TopAbs_Orientation
	:param BTrans:
	:type BTrans: TopAbs_Orientation
	:rtype: None") TopBas_TestInterference;
		 TopBas_TestInterference (const Standard_Real & Inters,const Standard_Integer & Bound,const TopAbs_Orientation Orient,const TopAbs_Orientation Trans,const TopAbs_Orientation BTrans);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":param Tr:
	:type Tr: TopAbs_Orientation
	:rtype: None") Transition;
		void Transition (const TopAbs_Orientation Tr);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Transition;
		TopAbs_Orientation Transition ();

};


%extend TopBas_TestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
