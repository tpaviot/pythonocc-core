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
%define GEOM2DHATCHDOCSTRING
"Geom2dHatch module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dhatch.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DHATCHDOCSTRING) Geom2dHatch


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
#include<Geom2dHatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<gp_module.hxx>
#include<IntRes2d_module.hxx>
#include<TopAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<HatchGen_module.hxx>
#include<Geom2dInt_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom2d_module.hxx>
#include<Intf_module.hxx>
#include<Extrema_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2dAdaptor.i
%import gp.i
%import IntRes2d.i
%import TopAbs.i
%import Geom2d.i
%import HatchGen.i
%import Geom2dInt.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(Geom2dHatch_MapOfElements) NCollection_DataMap <Standard_Integer , Geom2dHatch_Element , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Geom2dHatch_Element , TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (Geom2dHatch_MapOfElements::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(Geom2dHatch_Hatchings) NCollection_DataMap <Standard_Integer , Geom2dHatch_Hatching , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Geom2dHatch_Hatching , TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (Geom2dHatch_Hatchings::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <Standard_Integer , Geom2dHatch_Element , TColStd_MapIntegerHasher> Geom2dHatch_MapOfElements;
typedef NCollection_DataMap <Standard_Integer , Geom2dHatch_Element , TColStd_MapIntegerHasher>::Iterator Geom2dHatch_DataMapIteratorOfMapOfElements;
typedef NCollection_DataMap <Standard_Integer , Geom2dHatch_Hatching , TColStd_MapIntegerHasher> Geom2dHatch_Hatchings;
typedef NCollection_DataMap <Standard_Integer , Geom2dHatch_Hatching , TColStd_MapIntegerHasher>::Iterator Geom2dHatch_DataMapIteratorOfHatchings;
/* end typedefs declaration */

/*******************************
* class Geom2dHatch_Classifier *
*******************************/
class Geom2dHatch_Classifier {
	public:
		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the Edge used to determine the classification. When the State is ON this is the Edge containing the point.
	:rtype: Geom2dAdaptor_Curve") Edge;
		const Geom2dAdaptor_Curve & Edge ();

		/****************** EdgeParameter ******************/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "* Returns the parameter on Edge() used to determine the classification.
	:rtype: float") EdgeParameter;
		Standard_Real EdgeParameter ();

		/****************** Geom2dHatch_Classifier ******************/
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "* Empty constructor, undefined algorithm.
	:rtype: None") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier ();

		/****************** Geom2dHatch_Classifier ******************/
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "* Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
	:param F:
	:type F: Geom2dHatch_Elements
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier (Geom2dHatch_Elements & F,const gp_Pnt2d & P,const Standard_Real Tol);

		/****************** NoWires ******************/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "* Returns True if the face contains no wire. The state is IN.
	:rtype: bool") NoWires;
		Standard_Boolean NoWires ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Classify the Point P with Tolerance <T> on the face described by <F>.
	:param F:
	:type F: Geom2dHatch_Elements
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (Geom2dHatch_Elements & F,const gp_Pnt2d & P,const Standard_Real Tol);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the position of the point on the edge returned by Edge.
	:rtype: IntRes2d_Position") Position;
		IntRes2d_Position Position ();

		/****************** Rejected ******************/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "* Returns True when the state was computed by a rejection. The state is OUT.
	:rtype: bool") Rejected;
		Standard_Boolean Rejected ();

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns the result of the classification.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

};


%extend Geom2dHatch_Classifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dHatch_Element *
****************************/
class Geom2dHatch_Element {
	public:
		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve associated to the element.
	:rtype: Geom2dAdaptor_Curve") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve associated to the element.
	:rtype: Geom2dAdaptor_Curve") Curve;
		const Geom2dAdaptor_Curve & Curve ();

		/****************** Geom2dHatch_Element ******************/
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", ":rtype: None") Geom2dHatch_Element;
		 Geom2dHatch_Element ();

		/****************** Geom2dHatch_Element ******************/
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "* Magic constructor.
	:param Other:
	:type Other: Geom2dHatch_Element
	:rtype: None") Geom2dHatch_Element;
		 Geom2dHatch_Element (const Geom2dHatch_Element & Other);

		/****************** Geom2dHatch_Element ******************/
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "* Creates an element.
	:param Curve:
	:type Curve: Geom2dAdaptor_Curve
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: None") Geom2dHatch_Element;
		 Geom2dHatch_Element (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Sets the orientation of the element.
	:param Orientation:
	:type Orientation: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const TopAbs_Orientation Orientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the orientation of the element.
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

};


%extend Geom2dHatch_Element {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dHatch_Elements *
*****************************/
class Geom2dHatch_Elements {
	public:
		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param K:
	:type K: int
	:param I:
	:type I: Geom2dHatch_Element
	:rtype: bool") Bind;
		Standard_Boolean Bind (const Standard_Integer K,const Geom2dHatch_Element & I);

		/****************** ChangeFind ******************/
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", ":param K:
	:type K: int
	:rtype: Geom2dHatch_Element") ChangeFind;
		Geom2dHatch_Element & ChangeFind (const Standard_Integer K);

		/****************** CheckPoint ******************/
		%feature("compactdefaultargs") CheckPoint;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: bool") CheckPoint;
		Standard_Boolean CheckPoint (gp_Pnt2d & P);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", ":param E:
	:type E: Geom2dAdaptor_Curve
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None") CurrentEdge;
		void CurrentEdge (Geom2dAdaptor_Curve & E,TopAbs_Orientation & Or);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", ":param K:
	:type K: int
	:rtype: Geom2dHatch_Element") Find;
		const Geom2dHatch_Element & Find (const Standard_Integer K);

		/****************** Geom2dHatch_Elements ******************/
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", ":rtype: None") Geom2dHatch_Elements;
		 Geom2dHatch_Elements ();

		/****************** Geom2dHatch_Elements ******************/
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", ":param Other:
	:type Other: Geom2dHatch_Elements
	:rtype: None") Geom2dHatch_Elements;
		 Geom2dHatch_Elements (const Geom2dHatch_Elements & Other);

		/****************** InitEdges ******************/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", ":rtype: None") InitEdges;
		void InitEdges ();

		/****************** InitWires ******************/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", ":rtype: None") InitWires;
		void InitWires ();

		/****************** IsBound ******************/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", ":param K:
	:type K: int
	:rtype: bool") IsBound;
		Standard_Boolean IsBound (const Standard_Integer K);

		/****************** MoreEdges ******************/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", ":rtype: bool") MoreEdges;
		Standard_Boolean MoreEdges ();

		/****************** MoreWires ******************/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", ":rtype: bool") MoreWires;
		Standard_Boolean MoreWires ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":rtype: None") NextEdge;
		void NextEdge ();

		/****************** NextWire ******************/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", ":rtype: None") NextWire;
		void NextWire ();

		/****************** OtherSegment ******************/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") OtherSegment;
		Standard_Boolean OtherSegment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);

		/****************** Reject ******************/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: bool") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);

		/****************** RejectEdge ******************/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", ":param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);

		/****************** RejectWire ******************/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", ":param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") Segment;
		Standard_Boolean Segment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);

		/****************** UnBind ******************/
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", ":param K:
	:type K: int
	:rtype: bool") UnBind;
		Standard_Boolean UnBind (const Standard_Integer K);

};


%extend Geom2dHatch_Elements {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Geom2dHatch_FClass2dOfClassifier *
*****************************************/
class Geom2dHatch_FClass2dOfClassifier {
	public:
		/****************** ClosestIntersection ******************/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "* Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
	:rtype: int") ClosestIntersection;
		Standard_Integer ClosestIntersection ();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Updates the classification process with the edge <E> from the boundary.
	:param E:
	:type E: Geom2dAdaptor_Curve
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None") Compare;
		void Compare (const Geom2dAdaptor_Curve & E,const TopAbs_Orientation Or);

		/****************** Geom2dHatch_FClass2dOfClassifier ******************/
		%feature("compactdefaultargs") Geom2dHatch_FClass2dOfClassifier;
		%feature("autodoc", "* Creates an undefined classifier.
	:rtype: None") Geom2dHatch_FClass2dOfClassifier;
		 Geom2dHatch_FClass2dOfClassifier ();

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "* Returns the intersecting algorithm.
	:rtype: Geom2dHatch_Intersector") Intersector;
		Geom2dHatch_Intersector & Intersector ();

		/****************** IsHeadOrEnd ******************/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "* Returns the Standard_True if the closest intersection point represents head or end of the edge. Returns Standard_False otherwise.
	:rtype: bool") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the current value of the parameter.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns the current state of the point.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

};


%extend Geom2dHatch_FClass2dOfClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dHatch_Hatcher *
****************************/
class Geom2dHatch_Hatcher {
	public:
		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "* Adds an element to the hatcher and returns its index.
	:param Curve:
	:type Curve: Geom2dAdaptor_Curve
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: int") AddElement;
		Standard_Integer AddElement (const Geom2dAdaptor_Curve & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****************** AddElement ******************/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "* Adds an element to the hatcher and returns its index.
	:param Curve:
	:type Curve: Geom2d_Curve
	:param Orientation: default value is TopAbs_FORWARD
	:type Orientation: TopAbs_Orientation
	:rtype: int") AddElement;
		Standard_Integer AddElement (const opencascade::handle<Geom2d_Curve> & Curve,const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****************** AddHatching ******************/
		%feature("compactdefaultargs") AddHatching;
		%feature("autodoc", "* Adds a hatching to the hatcher and returns its index.
	:param Curve:
	:type Curve: Geom2dAdaptor_Curve
	:rtype: int") AddHatching;
		Standard_Integer AddHatching (const Geom2dAdaptor_Curve & Curve);

		/****************** ChangeIntersector ******************/
		%feature("compactdefaultargs") ChangeIntersector;
		%feature("autodoc", "* Returns the associated intersector.
	:rtype: Geom2dHatch_Intersector") ChangeIntersector;
		Geom2dHatch_Intersector & ChangeIntersector ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all the hatchings and all the elements.
	:rtype: None") Clear;
		void Clear ();

		/****************** ClrElements ******************/
		%feature("compactdefaultargs") ClrElements;
		%feature("autodoc", "* Removes all the elements from the hatcher.
	:rtype: None") ClrElements;
		void ClrElements ();

		/****************** ClrHatchings ******************/
		%feature("compactdefaultargs") ClrHatchings;
		%feature("autodoc", "* Removes all the hatchings from the hatcher.
	:rtype: None") ClrHatchings;
		void ClrHatchings ();

		/****************** ComputeDomains ******************/
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "* Computes the domains of all the hatchings.
	:rtype: None") ComputeDomains;
		void ComputeDomains ();

		/****************** ComputeDomains ******************/
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "* Computes the domains of the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:rtype: None") ComputeDomains;
		void ComputeDomains (const Standard_Integer IndH);

		/****************** Confusion2d ******************/
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "* Sets the confusion tolerance.
	:param Confusion:
	:type Confusion: float
	:rtype: None") Confusion2d;
		void Confusion2d (const Standard_Real Confusion);

		/****************** Confusion2d ******************/
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "* Returns the 2d confusion tolerance, i.e. the value under which two points are considered identical in the parametric space of the hatching.
	:rtype: float") Confusion2d;
		Standard_Real Confusion2d ();

		/****************** Confusion3d ******************/
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "* Sets the confusion tolerance.
	:param Confusion:
	:type Confusion: float
	:rtype: None") Confusion3d;
		void Confusion3d (const Standard_Real Confusion);

		/****************** Confusion3d ******************/
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "* Returns the 3d confusion tolerance, i.e. the value under which two points are considered identical in the 3d space of the hatching.
	:rtype: float") Confusion3d;
		Standard_Real Confusion3d ();

		/****************** Domain ******************/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "* Returns the IDom-th domain of the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:param IDom:
	:type IDom: int
	:rtype: HatchGen_Domain") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer IndH,const Standard_Integer IDom);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump the hatcher.
	:rtype: None") Dump;
		void Dump ();

		/****************** ElementCurve ******************/
		%feature("compactdefaultargs") ElementCurve;
		%feature("autodoc", "* Returns the curve associated to the IndE-th element.
	:param IndE:
	:type IndE: int
	:rtype: Geom2dAdaptor_Curve") ElementCurve;
		const Geom2dAdaptor_Curve & ElementCurve (const Standard_Integer IndE);

		/****************** Geom2dHatch_Hatcher ******************/
		%feature("compactdefaultargs") Geom2dHatch_Hatcher;
		%feature("autodoc", "* Returns an empty hatcher.
	:param Intersector:
	:type Intersector: Geom2dHatch_Intersector
	:param Confusion2d:
	:type Confusion2d: float
	:param Confusion3d:
	:type Confusion3d: float
	:param KeepPnt: default value is Standard_False
	:type KeepPnt: bool
	:param KeepSeg: default value is Standard_False
	:type KeepSeg: bool
	:rtype: None") Geom2dHatch_Hatcher;
		 Geom2dHatch_Hatcher (const Geom2dHatch_Intersector & Intersector,const Standard_Real Confusion2d,const Standard_Real Confusion3d,const Standard_Boolean KeepPnt = Standard_False,const Standard_Boolean KeepSeg = Standard_False);

		/****************** HatchingCurve ******************/
		%feature("compactdefaultargs") HatchingCurve;
		%feature("autodoc", "* Returns the curve associated to the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:rtype: Geom2dAdaptor_Curve") HatchingCurve;
		const Geom2dAdaptor_Curve & HatchingCurve (const Standard_Integer IndH);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "* Sets the associated intersector.
	:param Intersector:
	:type Intersector: Geom2dHatch_Intersector
	:rtype: None") Intersector;
		void Intersector (const Geom2dHatch_Intersector & Intersector);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "* Returns the associated intersector.
	:rtype: Geom2dHatch_Intersector") Intersector;
		const Geom2dHatch_Intersector & Intersector ();

		/****************** KeepPoints ******************/
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "* Sets the above flag.
	:param Keep:
	:type Keep: bool
	:rtype: None") KeepPoints;
		void KeepPoints (const Standard_Boolean Keep);

		/****************** KeepPoints ******************/
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "* Returns the flag about the points consideration.
	:rtype: bool") KeepPoints;
		Standard_Boolean KeepPoints ();

		/****************** KeepSegments ******************/
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "* Sets the above flag.
	:param Keep:
	:type Keep: bool
	:rtype: None") KeepSegments;
		void KeepSegments (const Standard_Boolean Keep);

		/****************** KeepSegments ******************/
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "* Returns the flag about the segments consideration.
	:rtype: bool") KeepSegments;
		Standard_Boolean KeepSegments ();

		/****************** NbDomains ******************/
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "* Returns the number of domains of the IndH-th hatching. Only ONE 'INFINITE' domain means that the hatching is fully included in the contour defined by the elements.
	:param IndH:
	:type IndH: int
	:rtype: int") NbDomains;
		Standard_Integer NbDomains (const Standard_Integer IndH);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection points of the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:rtype: int") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer IndH);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the IndP-th intersection point of the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:param IndP:
	:type IndP: int
	:rtype: HatchGen_PointOnHatching") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer IndH,const Standard_Integer IndP);

		/****************** RemElement ******************/
		%feature("compactdefaultargs") RemElement;
		%feature("autodoc", "* Removes the IndE-th element from the hatcher.
	:param IndE:
	:type IndE: int
	:rtype: None") RemElement;
		void RemElement (const Standard_Integer IndE);

		/****************** RemHatching ******************/
		%feature("compactdefaultargs") RemHatching;
		%feature("autodoc", "* Removes the IndH-th hatching from the hatcher.
	:param IndH:
	:type IndH: int
	:rtype: None") RemHatching;
		void RemHatching (const Standard_Integer IndH);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status about the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:rtype: HatchGen_ErrorStatus") Status;
		HatchGen_ErrorStatus Status (const Standard_Integer IndH);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Trims all the hatchings of the hatcher by all the elements of the hatcher.
	:rtype: None") Trim;
		void Trim ();

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Adds a hatching to the hatcher and trims it by the elements already given and returns its index.
	:param Curve:
	:type Curve: Geom2dAdaptor_Curve
	:rtype: int") Trim;
		Standard_Integer Trim (const Geom2dAdaptor_Curve & Curve);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Trims the IndH-th hatching by the elements already given.
	:param IndH:
	:type IndH: int
	:rtype: None") Trim;
		void Trim (const Standard_Integer IndH);

		/****************** TrimDone ******************/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "* Returns the fact that the intersections were computed for the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:rtype: bool") TrimDone;
		Standard_Boolean TrimDone (const Standard_Integer IndH);

		/****************** TrimFailed ******************/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "* Returns the fact that the intersections failed for the IndH-th hatching.
	:param IndH:
	:type IndH: int
	:rtype: bool") TrimFailed;
		Standard_Boolean TrimFailed (const Standard_Integer IndH);

};


%extend Geom2dHatch_Hatcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2dHatch_Hatching *
*****************************/
class Geom2dHatch_Hatching {
	public:
		/****************** AddDomain ******************/
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "* Adds a domain to the hatching.
	:param Domain:
	:type Domain: HatchGen_Domain
	:rtype: None") AddDomain;
		void AddDomain (const HatchGen_Domain & Domain);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Adds an intersection point to the hatching.
	:param Point:
	:type Point: HatchGen_PointOnHatching
	:param Confusion:
	:type Confusion: float
	:rtype: None") AddPoint;
		void AddPoint (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve associated to the hatching.
	:rtype: Geom2dAdaptor_Curve") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve ();

		/****************** ChangePoint ******************/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "* Returns the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching") ChangePoint;
		HatchGen_PointOnHatching & ChangePoint (const Standard_Integer Index);

		/****************** ClassificationPoint ******************/
		%feature("compactdefaultargs") ClassificationPoint;
		%feature("autodoc", "* Returns a point on the curve. This point will be used for the classification.
	:rtype: gp_Pnt2d") ClassificationPoint;
		gp_Pnt2d ClassificationPoint ();

		/****************** ClrDomains ******************/
		%feature("compactdefaultargs") ClrDomains;
		%feature("autodoc", "* Removes all the domains of the hatching.
	:rtype: None") ClrDomains;
		void ClrDomains ();

		/****************** ClrPoints ******************/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "* Removes all the intersection points of the hatching.
	:rtype: None") ClrPoints;
		void ClrPoints ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve associated to the hatching.
	:rtype: Geom2dAdaptor_Curve") Curve;
		const Geom2dAdaptor_Curve & Curve ();

		/****************** Domain ******************/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "* Returns the Index-th domain of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbDomains.
	:param Index:
	:type Index: int
	:rtype: HatchGen_Domain") Domain;
		const HatchGen_Domain & Domain (const Standard_Integer Index);

		/****************** Geom2dHatch_Hatching ******************/
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", ":rtype: None") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching ();

		/****************** Geom2dHatch_Hatching ******************/
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", "* Creates a hatching.
	:param Curve:
	:type Curve: Geom2dAdaptor_Curve
	:rtype: None") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching (const Geom2dAdaptor_Curve & Curve);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Sets the flag about the domains computation to the given value.
	:param Flag:
	:type Flag: bool
	:rtype: None") IsDone;
		void IsDone (const Standard_Boolean Flag);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns the flag about the domains computation.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbDomains ******************/
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "* Returns the number of domains of the hatching.
	:rtype: int") NbDomains;
		Standard_Integer NbDomains ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection points of the hatching.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: HatchGen_PointOnHatching") Point;
		const HatchGen_PointOnHatching & Point (const Standard_Integer Index);

		/****************** RemDomain ******************/
		%feature("compactdefaultargs") RemDomain;
		%feature("autodoc", "* Removes the Index-th domain of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbDomains.
	:param Index:
	:type Index: int
	:rtype: None") RemDomain;
		void RemDomain (const Standard_Integer Index);

		/****************** RemPoint ******************/
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "* Removes the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: None") RemPoint;
		void RemPoint (const Standard_Integer Index);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Sets the error status.
	:param theStatus:
	:type theStatus: HatchGen_ErrorStatus
	:rtype: None") Status;
		void Status (const HatchGen_ErrorStatus theStatus);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the error status.
	:rtype: HatchGen_ErrorStatus") Status;
		HatchGen_ErrorStatus Status ();

		/****************** TrimDone ******************/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "* Sets the flag about the trimming computations to the given value.
	:param Flag:
	:type Flag: bool
	:rtype: None") TrimDone;
		void TrimDone (const Standard_Boolean Flag);

		/****************** TrimDone ******************/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "* Returns the flag about the trimming computations.
	:rtype: bool") TrimDone;
		Standard_Boolean TrimDone ();

		/****************** TrimFailed ******************/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "* Sets the flag about the trimming failure to the given value.
	:param Flag:
	:type Flag: bool
	:rtype: None") TrimFailed;
		void TrimFailed (const Standard_Boolean Flag);

		/****************** TrimFailed ******************/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "* Returns the flag about the trimming failure.
	:rtype: bool") TrimFailed;
		Standard_Boolean TrimFailed ();

};


%extend Geom2dHatch_Hatching {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Geom2dHatch_Intersector *
********************************/
class Geom2dHatch_Intersector : public Geom2dInt_GInter {
	public:
		/****************** ConfusionTolerance ******************/
		%feature("compactdefaultargs") ConfusionTolerance;
		%feature("autodoc", "* Returns the confusion tolerance of the intersector.
	:rtype: float") ConfusionTolerance;
		Standard_Real ConfusionTolerance ();

		/****************** Geom2dHatch_Intersector ******************/
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "* Creates an intersector.
	:param Confusion:
	:type Confusion: float
	:param Tangency:
	:type Tangency: float
	:rtype: None") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector (const Standard_Real Confusion,const Standard_Real Tangency);

		/****************** Geom2dHatch_Intersector ******************/
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", ":rtype: None") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector ();

		/****************** Intersect ******************/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "* Intersects the curves C1 and C2. The results are retreived by the usual methods described in IntRes2d_Intersection. Creates an intersector.
	:param C1:
	:type C1: Geom2dAdaptor_Curve
	:param C2:
	:type C2: Geom2dAdaptor_Curve
	:rtype: None") Intersect;
		void Intersect (const Geom2dAdaptor_Curve & C1,const Geom2dAdaptor_Curve & C2);

		/****************** LocalGeometry ******************/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "* Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.
	:param E:
	:type E: Geom2dAdaptor_Curve
	:param U:
	:type U: float
	:param T:
	:type T: gp_Dir2d
	:param N:
	:type N: gp_Dir2d
	:param C:
	:type C: float
	:rtype: None") LocalGeometry;
		void LocalGeometry (const Geom2dAdaptor_Curve & E,const Standard_Real U,gp_Dir2d & T,gp_Dir2d & N,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between the 2d line segment (<L>, <P>) and the Curve <E>. The line segment is the part of the 2d line <L> of parameter range [0, <P>] (P is positive and can be RealLast()). Tol is the Tolerance on the segment. The order is relevant, the first argument is the segment, the second the Edge.
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:param E:
	:type E: Geom2dAdaptor_Curve
	:rtype: None") Perform;
		void Perform (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol,const Geom2dAdaptor_Curve & E);

		/****************** SetConfusionTolerance ******************/
		%feature("compactdefaultargs") SetConfusionTolerance;
		%feature("autodoc", "* Sets the confusion tolerance of the intersector.
	:param Confusion:
	:type Confusion: float
	:rtype: None") SetConfusionTolerance;
		void SetConfusionTolerance (const Standard_Real Confusion);

		/****************** SetTangencyTolerance ******************/
		%feature("compactdefaultargs") SetTangencyTolerance;
		%feature("autodoc", "* Sets the tangency tolerance of the intersector.
	:param Tangency:
	:type Tangency: float
	:rtype: None") SetTangencyTolerance;
		void SetTangencyTolerance (const Standard_Real Tangency);

		/****************** TangencyTolerance ******************/
		%feature("compactdefaultargs") TangencyTolerance;
		%feature("autodoc", "* Returns the tangency tolerance of the intersector.
	:rtype: float") TangencyTolerance;
		Standard_Real TangencyTolerance ();

};


%extend Geom2dHatch_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
