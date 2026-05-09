/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_topbas.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(TopBas_ListIteratorOfListOfTestInterference) NCollection_TListIterator<TopBas_TestInterference>;
%template(TopBas_ListOfTestInterference) NCollection_List<TopBas_TestInterference>;

%extend NCollection_List<TopBas_TestInterference> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = TopBas_ListIteratorOfListOfTestInterference(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_List<TopBas_TestInterference>::Iterator TopBas_ListIteratorOfListOfTestInterference;
typedef NCollection_List<TopBas_TestInterference> TopBas_ListOfTestInterference;
/* end typedefs declaration */

/********************************
* class TopBas_TestInterference *
********************************/
class TopBas_TestInterference {
	public:
		/****** TopBas_TestInterference::TopBas_TestInterference ******/
		/****** md5 signature: f64fbfc4cc1078a992596a2f293c8e91 ******/
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopBas_TestInterference;
		 TopBas_TestInterference();

		/****** TopBas_TestInterference::TopBas_TestInterference ******/
		/****** md5 signature: fc5e26aa0712321a298a0ab889aaccc2 ******/
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "
Parameters
----------
Inters: double
Bound: int
Orient: TopAbs_Orientation
Trans: TopAbs_Orientation
BTrans: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") TopBas_TestInterference;
		 TopBas_TestInterference(const double & Inters, const int & Bound, const TopAbs_Orientation Orient, const TopAbs_Orientation Trans, const TopAbs_Orientation BTrans);

		/****** TopBas_TestInterference::Boundary ******/
		/****** md5 signature: 315c8def468ac2925ed81a970d1d3307 ******/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "
Parameters
----------
B: int

Return
-------
None

Description
-----------
No available documentation.
") Boundary;
		void Boundary(const int & B);

		/****** TopBas_TestInterference::Boundary ******/
		/****** md5 signature: 64506df5152f80fc9437f47ce5b2ec87 ******/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Boundary;
		const int & Boundary();

		/****** TopBas_TestInterference::BoundaryTransition ******/
		/****** md5 signature: 91679118cf407fa213ebb9eb07832014 ******/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "
Parameters
----------
BTr: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") BoundaryTransition;
		void BoundaryTransition(const TopAbs_Orientation BTr);

		/****** TopBas_TestInterference::BoundaryTransition ******/
		/****** md5 signature: 74f690bd95102dfac559cd0dc3a25347 ******/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****** TopBas_TestInterference::ChangeBoundary ******/
		/****** md5 signature: 84839513932bf3ba89f33e1271b17682 ******/
		%feature("compactdefaultargs") ChangeBoundary;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ChangeBoundary;
		int & ChangeBoundary();

		/****** TopBas_TestInterference::ChangeIntersection ******/
		/****** md5 signature: 5a4cddf542720cc66397eb254f4312f6 ******/
		%feature("compactdefaultargs") ChangeIntersection;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ChangeIntersection;
		double & ChangeIntersection();

		/****** TopBas_TestInterference::Intersection ******/
		/****** md5 signature: ed7d9fb2d8bb260726121ea5e341a695 ******/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "
Parameters
----------
I: double

Return
-------
None

Description
-----------
No available documentation.
") Intersection;
		void Intersection(const double & I);

		/****** TopBas_TestInterference::Intersection ******/
		/****** md5 signature: 3c3aef58e5ecb729cbce0ee31a939c9c ******/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Intersection;
		const double & Intersection();

		/****** TopBas_TestInterference::Orientation ******/
		/****** md5 signature: 21772d27fe13757c215d17da49a64c59 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const TopAbs_Orientation O);

		/****** TopBas_TestInterference::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** TopBas_TestInterference::Transition ******/
		/****** md5 signature: bd64fa200b58d8f275e2f343a85da4ac ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
Tr: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Transition;
		void Transition(const TopAbs_Orientation Tr);

		/****** TopBas_TestInterference::Transition ******/
		/****** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Transition;
		TopAbs_Orientation Transition();

		%extend{
			double GetChangeIntersection() { return self->ChangeIntersection(); }
			void SetChangeIntersection(double value) { self->ChangeIntersection() = value; }
		};
		%extend{
			int GetChangeBoundary() { return self->ChangeBoundary(); }
			void SetChangeBoundary(int value) { self->ChangeBoundary() = value; }
		};
};


%extend TopBas_TestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
