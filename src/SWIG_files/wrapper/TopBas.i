/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(TopBas_ListIteratorOfListOfTestInterference) NCollection_TListIterator<TopBas_TestInterference>;
%template(TopBas_ListOfTestInterference) NCollection_List<TopBas_TestInterference>;

%extend NCollection_List<TopBas_TestInterference> {
    %pythoncode {
    def __len__(self):
        return self.Size()
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
		/****************** TopBas_TestInterference ******************/
		/**** md5 signature: f64fbfc4cc1078a992596a2f293c8e91 ****/
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopBas_TestInterference;
		 TopBas_TestInterference();

		/****************** TopBas_TestInterference ******************/
		/**** md5 signature: 061045265274175b5f63816b64c27bda ****/
		%feature("compactdefaultargs") TopBas_TestInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Inters: float
Bound: int
Orient: TopAbs_Orientation
Trans: TopAbs_Orientation
BTrans: TopAbs_Orientation

Returns
-------
None
") TopBas_TestInterference;
		 TopBas_TestInterference(const Standard_Real & Inters, const Standard_Integer & Bound, const TopAbs_Orientation Orient, const TopAbs_Orientation Trans, const TopAbs_Orientation BTrans);

		/****************** Boundary ******************/
		/**** md5 signature: ecae0f95113748e5b795787ee692f4c0 ****/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: int

Returns
-------
None
") Boundary;
		void Boundary(const Standard_Integer & B);

		/****************** Boundary ******************/
		/**** md5 signature: acc72cfdb7b0883700c27aa7017b6785 ****/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Boundary;
		const Standard_Integer & Boundary();

		/****************** BoundaryTransition ******************/
		/**** md5 signature: 91679118cf407fa213ebb9eb07832014 ****/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
BTr: TopAbs_Orientation

Returns
-------
None
") BoundaryTransition;
		void BoundaryTransition(const TopAbs_Orientation BTr);

		/****************** BoundaryTransition ******************/
		/**** md5 signature: 74f690bd95102dfac559cd0dc3a25347 ****/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();


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
		/**** md5 signature: c3dbdbf5d97cf229d568555db8710cff ****/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: float

Returns
-------
None
") Intersection;
		void Intersection(const Standard_Real & I);

		/****************** Intersection ******************/
		/**** md5 signature: 7c98d12ea59d47ac6c13b08665a38692 ****/
		%feature("compactdefaultargs") Intersection;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Intersection;
		const Standard_Real & Intersection();

		/****************** Orientation ******************/
		/**** md5 signature: 21772d27fe13757c215d17da49a64c59 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(const TopAbs_Orientation O);

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Transition ******************/
		/**** md5 signature: bd64fa200b58d8f275e2f343a85da4ac ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tr: TopAbs_Orientation

Returns
-------
None
") Transition;
		void Transition(const TopAbs_Orientation Tr);

		/****************** Transition ******************/
		/**** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition();

};


%extend TopBas_TestInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
