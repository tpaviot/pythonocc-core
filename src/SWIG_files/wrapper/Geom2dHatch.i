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
%define GEOM2DHATCHDOCSTRING
"Geom2dHatch module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dhatch.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<Geom2dHatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<IntRes2d_module.hxx>
#include<TopAbs_module.hxx>
#include<Geom2dAdaptor_module.hxx>
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
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import IntRes2d.i
%import TopAbs.i
%import Geom2dAdaptor.i
%import Geom2d.i
%import HatchGen.i
%import Geom2dInt.i

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
%ignore NCollection_DataMap<int,Geom2dHatch_Hatching>::Items;
%ignore NCollection_DataMap<int,Geom2dHatch_Hatching>::KeyValues;
%template(Geom2dHatch_Hatchings) NCollection_DataMap<int,Geom2dHatch_Hatching>;

%extend NCollection_DataMap<int,Geom2dHatch_Hatching> {
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
%ignore NCollection_DataMap<int,Geom2dHatch_Element>::Items;
%ignore NCollection_DataMap<int,Geom2dHatch_Element>::KeyValues;
%template(Geom2dHatch_MapOfElements) NCollection_DataMap<int,Geom2dHatch_Element>;

%extend NCollection_DataMap<int,Geom2dHatch_Element> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<int, Geom2dHatch_Hatching>::Iterator Geom2dHatch_DataMapIteratorOfHatchings;
typedef NCollection_DataMap<int, Geom2dHatch_Element>::Iterator Geom2dHatch_DataMapIteratorOfMapOfElements;
typedef NCollection_DataMap<int, Geom2dHatch_Hatching> Geom2dHatch_Hatchings;
typedef NCollection_DataMap<int, Geom2dHatch_Element> Geom2dHatch_MapOfElements;
/* end typedefs declaration */

/*******************************
* class Geom2dHatch_Classifier *
*******************************/
class Geom2dHatch_Classifier {
	public:
		/****** Geom2dHatch_Classifier::Geom2dHatch_Classifier ******/
		/****** md5 signature: 890cc459e67944b97d32307aa60ca1df ******/
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, undefined algorithm.
") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier();

		/****** Geom2dHatch_Classifier::Geom2dHatch_Classifier ******/
		/****** md5 signature: 3d34bf6e4dd9ff4738a57413da93498c ******/
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "
Parameters
----------
F: Geom2dHatch_Elements
P: gp_Pnt2d
Tol: double

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier(Geom2dHatch_Elements & F, const gp_Pnt2d & P, const double Tol);

		/****** Geom2dHatch_Classifier::Edge ******/
		/****** md5 signature: 4ef596a40082b0b9b1d8e5366c52ac1b ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the Edge used to determine the classification. When the State is ON this is the Edge containing the point.
") Edge;
		Geom2dAdaptor_Curve Edge();

		/****** Geom2dHatch_Classifier::EdgeParameter ******/
		/****** md5 signature: 13815005d0cc2fead11cfb9eb012e308 ******/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on Edge() used to determine the classification.
") EdgeParameter;
		double EdgeParameter();

		/****** Geom2dHatch_Classifier::NoWires ******/
		/****** md5 signature: 36079c7f6360c02941720bb6e5be93b3 ******/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the face contains no wire. The state is IN.
") NoWires;
		bool NoWires();

		/****** Geom2dHatch_Classifier::Perform ******/
		/****** md5 signature: 65304b62e76b2a206d72bbc204e5f5c1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Geom2dHatch_Elements
P: gp_Pnt2d
Tol: double

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>.
") Perform;
		void Perform(Geom2dHatch_Elements & F, const gp_Pnt2d & P, const double Tol);

		/****** Geom2dHatch_Classifier::Position ******/
		/****** md5 signature: f524e9875848f72ebb7d922a7cc6a341 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
IntRes2d_Position

Description
-----------
Returns the position of the point on the edge returned by Edge.
") Position;
		IntRes2d_Position Position();

		/****** Geom2dHatch_Classifier::Rejected ******/
		/****** md5 signature: 789ba27b88c2ab0a5b8a44516e723655 ******/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the state was computed by a rejection. The state is OUT.
") Rejected;
		bool Rejected();

		/****** Geom2dHatch_Classifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the result of the classification.
") State;
		TopAbs_State State();

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
		/****** Geom2dHatch_Element::Geom2dHatch_Element ******/
		/****** md5 signature: 19b7f864164cc189cb47648c17f7066b ******/
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Element;
		 Geom2dHatch_Element();

		/****** Geom2dHatch_Element::Geom2dHatch_Element ******/
		/****** md5 signature: db7543fb06b4f62b6f2d9dd9372100b3 ******/
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve
Orientation: TopAbs_Orientation (optional, default to TopAbs_FORWARD)

Return
-------
None

Description
-----------
Creates an element.
") Geom2dHatch_Element;
		 Geom2dHatch_Element(const Geom2dAdaptor_Curve & Curve, const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****** Geom2dHatch_Element::ChangeCurve ******/
		/****** md5 signature: fe0ef69eab3edfb44b3acc292d7c73be ******/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the element.
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve();

		/****** Geom2dHatch_Element::Curve ******/
		/****** md5 signature: e12bcd64b0a466dce7601de6fe68db77 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the element.
") Curve;
		Geom2dAdaptor_Curve Curve();

		/****** Geom2dHatch_Element::Orientation ******/
		/****** md5 signature: 854e5a15aa2f2078927a5c9e7d88dcf5 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
Orientation: TopAbs_Orientation

Return
-------
None

Description
-----------
Sets the orientation of the element.
") Orientation;
		void Orientation(const TopAbs_Orientation Orientation);

		/****** Geom2dHatch_Element::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the orientation of the element.
") Orientation;
		TopAbs_Orientation Orientation();

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
		/****** Geom2dHatch_Elements::Geom2dHatch_Elements ******/
		/****** md5 signature: 1db61b20f9f6bb0dfc5227f3c196ffbc ******/
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Elements;
		 Geom2dHatch_Elements();

		/****** Geom2dHatch_Elements::Geom2dHatch_Elements ******/
		/****** md5 signature: 96a4878bf071792827f0bd8b8a008ab5 ******/
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", "
Parameters
----------
Other: Geom2dHatch_Elements

Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Elements;
		 Geom2dHatch_Elements(const Geom2dHatch_Elements & Other);

		/****** Geom2dHatch_Elements::Bind ******/
		/****** md5 signature: 9dc253c77adc336398836dba4d179189 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
K: int
I: Geom2dHatch_Element

Return
-------
bool

Description
-----------
No available documentation.
") Bind;
		bool Bind(const int K, const Geom2dHatch_Element & I);

		/****** Geom2dHatch_Elements::ChangeFind ******/
		/****** md5 signature: 1718b6616978140c1c891c631472dfc9 ******/
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
Geom2dHatch_Element

Description
-----------
No available documentation.
") ChangeFind;
		Geom2dHatch_Element & ChangeFind(const int K);

		/****** Geom2dHatch_Elements::CheckPoint ******/
		/****** md5 signature: 485195b8be72224876ba980507f66699 ******/
		%feature("compactdefaultargs") CheckPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
bool

Description
-----------
No available documentation.
") CheckPoint;
		bool CheckPoint(gp_Pnt2d & P);

		/****** Geom2dHatch_Elements::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** Geom2dHatch_Elements::CurrentEdge ******/
		/****** md5 signature: aefaf443b65e7c54bdbb44af89cd5be8 ******/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "
Parameters
----------
E: Geom2dAdaptor_Curve

Return
-------
Or: TopAbs_Orientation

Description
-----------
No available documentation.
") CurrentEdge;
		void CurrentEdge(Geom2dAdaptor_Curve & E, TopAbs_Orientation &OutValue);

		/****** Geom2dHatch_Elements::Find ******/
		/****** md5 signature: b5acdf661794f45ae8f091ecbab54f2e ******/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
Geom2dHatch_Element

Description
-----------
No available documentation.
") Find;
		const Geom2dHatch_Element & Find(const int K);

		/****** Geom2dHatch_Elements::InitEdges ******/
		/****** md5 signature: 91bbc4c29d3c5c1c40b8c41a10bba4ae ******/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdges;
		void InitEdges();

		/****** Geom2dHatch_Elements::InitWires ******/
		/****** md5 signature: ebff8f083b93df212af42dee4111419b ******/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitWires;
		void InitWires();

		/****** Geom2dHatch_Elements::IsBound ******/
		/****** md5 signature: 69c01a594d826dc630afba1b5799b5bd ******/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
bool

Description
-----------
No available documentation.
") IsBound;
		bool IsBound(const int K);

		/****** Geom2dHatch_Elements::MoreEdges ******/
		/****** md5 signature: 5427e761ccb333be8c3787807b5804ee ******/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdges;
		bool MoreEdges();

		/****** Geom2dHatch_Elements::MoreWires ******/
		/****** md5 signature: 849053f04402a4d47216f89ebc6c2607 ******/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreWires;
		bool MoreWires();

		/****** Geom2dHatch_Elements::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****** Geom2dHatch_Elements::NextWire ******/
		/****** md5 signature: 11b92f2dcc830f98b32d40bd651c0b28 ******/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextWire;
		void NextWire();

		/****** Geom2dHatch_Elements::OtherSegment ******/
		/****** md5 signature: 241d674d6a0ba85fa36470a000190605 ******/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: double

Description
-----------
No available documentation.
") OtherSegment;
		bool OtherSegment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****** Geom2dHatch_Elements::Reject ******/
		/****** md5 signature: ed82d82b1709d7c86d3a577df384715a ******/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
bool

Description
-----------
No available documentation.
") Reject;
		bool Reject(const gp_Pnt2d & P);

		/****** Geom2dHatch_Elements::RejectEdge ******/
		/****** md5 signature: 9b3a253e954492e9398385ca3bc1cc03 ******/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: double

Return
-------
bool

Description
-----------
No available documentation.
") RejectEdge;
		bool RejectEdge(const gp_Lin2d & L, const double Par);

		/****** Geom2dHatch_Elements::RejectWire ******/
		/****** md5 signature: ec56899a034fc7d14d5b1f0ccd64bd09 ******/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: double

Return
-------
bool

Description
-----------
No available documentation.
") RejectWire;
		bool RejectWire(const gp_Lin2d & L, const double Par);

		/****** Geom2dHatch_Elements::Segment ******/
		/****** md5 signature: 45aa44dad44a1b63d1dd9da8eac33833 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: double

Description
-----------
No available documentation.
") Segment;
		bool Segment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****** Geom2dHatch_Elements::UnBind ******/
		/****** md5 signature: 906f149e6ac2318f1d2b07c3168bd4f0 ******/
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "
Parameters
----------
K: int

Return
-------
bool

Description
-----------
No available documentation.
") UnBind;
		bool UnBind(const int K);

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
		/****** Geom2dHatch_FClass2dOfClassifier::Geom2dHatch_FClass2dOfClassifier ******/
		/****** md5 signature: 46403459555e0636347ccfb376dd1cb2 ******/
		%feature("compactdefaultargs") Geom2dHatch_FClass2dOfClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined classifier.
") Geom2dHatch_FClass2dOfClassifier;
		 Geom2dHatch_FClass2dOfClassifier();

		/****** Geom2dHatch_FClass2dOfClassifier::ClosestIntersection ******/
		/****** md5 signature: 791df426661ff6f92d48ad8a543e5041 ******/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
") ClosestIntersection;
		int ClosestIntersection();

		/****** Geom2dHatch_FClass2dOfClassifier::Compare ******/
		/****** md5 signature: 8847c5ed00295e2cbe677ffdcccdc312 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
E: Geom2dAdaptor_Curve
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
Updates the classification process with the edge <E> from the boundary.
") Compare;
		void Compare(const Geom2dAdaptor_Curve & E, const TopAbs_Orientation Or);

		/****** Geom2dHatch_FClass2dOfClassifier::Intersector ******/
		/****** md5 signature: 3dca4c3d4666f9ccdcc1548d79506347 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
Geom2dHatch_Intersector

Description
-----------
Returns the intersecting algorithm.
") Intersector;
		Geom2dHatch_Intersector & Intersector();

		/****** Geom2dHatch_FClass2dOfClassifier::IsHeadOrEnd ******/
		/****** md5 signature: f85f957468d96e8492cf8311f2d01e6e ******/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the true if the closest intersection point represents head or end of the edge. Returns false otherwise.
") IsHeadOrEnd;
		bool IsHeadOrEnd();

		/****** Geom2dHatch_FClass2dOfClassifier::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the current value of the parameter.
") Parameter;
		double Parameter();

		/****** Geom2dHatch_FClass2dOfClassifier::Reset ******/
		/****** md5 signature: 3fc673cc28042e0ab8c32b82346f7733 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: double
Tol: double

Return
-------
None

Description
-----------
Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
") Reset;
		void Reset(const gp_Lin2d & L, const double P, const double Tol);

		/****** Geom2dHatch_FClass2dOfClassifier::State ******/
		/****** md5 signature: f060e49862ba79cdeda588bb3f787fae ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the current state of the point.
") State;
		TopAbs_State State();

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
		/****** Geom2dHatch_Hatcher::Geom2dHatch_Hatcher ******/
		/****** md5 signature: 72d5a3bee3ca4c75f513eab5d26574c9 ******/
		%feature("compactdefaultargs") Geom2dHatch_Hatcher;
		%feature("autodoc", "
Parameters
----------
Intersector: Geom2dHatch_Intersector
Confusion2d: double
Confusion3d: double
KeepPnt: bool (optional, default to false)
KeepSeg: bool (optional, default to false)

Return
-------
None

Description
-----------
Returns an empty hatcher.
") Geom2dHatch_Hatcher;
		 Geom2dHatch_Hatcher(const Geom2dHatch_Intersector & Intersector, const double Confusion2d, const double Confusion3d, const bool KeepPnt = false, const bool KeepSeg = false);

		/****** Geom2dHatch_Hatcher::AddElement ******/
		/****** md5 signature: fa8f7cb00c6f2a502bf6fb7d00252c17 ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve
Orientation: TopAbs_Orientation (optional, default to TopAbs_FORWARD)

Return
-------
int

Description
-----------
Adds an element to the hatcher and returns its index.
") AddElement;
		int AddElement(const Geom2dAdaptor_Curve & Curve, const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****** Geom2dHatch_Hatcher::AddElement ******/
		/****** md5 signature: 2120e84079ff0788950a1972638416a7 ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2d_Curve
Orientation: TopAbs_Orientation (optional, default to TopAbs_FORWARD)

Return
-------
int

Description
-----------
Adds an element to the hatcher and returns its index.
") AddElement;
		int AddElement(const opencascade::handle<Geom2d_Curve> & Curve, const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****** Geom2dHatch_Hatcher::AddHatching ******/
		/****** md5 signature: c94063560281d694cc2c436241af9aa4 ******/
		%feature("compactdefaultargs") AddHatching;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve

Return
-------
int

Description
-----------
Adds a hatching to the hatcher and returns its index.
") AddHatching;
		int AddHatching(const Geom2dAdaptor_Curve & Curve);

		/****** Geom2dHatch_Hatcher::ChangeIntersector ******/
		/****** md5 signature: 1ee41f0166a88d5c0b6b493b6da60d02 ******/
		%feature("compactdefaultargs") ChangeIntersector;
		%feature("autodoc", "Return
-------
Geom2dHatch_Intersector

Description
-----------
Returns the associated intersector.
") ChangeIntersector;
		Geom2dHatch_Intersector & ChangeIntersector();

		/****** Geom2dHatch_Hatcher::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the hatchings and all the elements.
") Clear;
		void Clear();

		/****** Geom2dHatch_Hatcher::ClrElements ******/
		/****** md5 signature: f3ef546889a6370ed2e0c706890f4a15 ******/
		%feature("compactdefaultargs") ClrElements;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the elements from the hatcher.
") ClrElements;
		void ClrElements();

		/****** Geom2dHatch_Hatcher::ClrHatchings ******/
		/****** md5 signature: f7850978ed1a1f8a1e54a87d5568ad99 ******/
		%feature("compactdefaultargs") ClrHatchings;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the hatchings from the hatcher.
") ClrHatchings;
		void ClrHatchings();

		/****** Geom2dHatch_Hatcher::ComputeDomains ******/
		/****** md5 signature: c85a4118552e35af32b2d36511b6bf5e ******/
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the domains of all the hatchings.
") ComputeDomains;
		void ComputeDomains();

		/****** Geom2dHatch_Hatcher::ComputeDomains ******/
		/****** md5 signature: 8d2bbe5385ea29e34c6ffe7843f0164f ******/
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
None

Description
-----------
Computes the domains of the IndH-th hatching.
") ComputeDomains;
		void ComputeDomains(const int IndH);

		/****** Geom2dHatch_Hatcher::Confusion2d ******/
		/****** md5 signature: 87ede94356dd7d9a939693d6f1ad4480 ******/
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "
Parameters
----------
Confusion: double

Return
-------
None

Description
-----------
Sets the confusion tolerance.
") Confusion2d;
		void Confusion2d(const double Confusion);

		/****** Geom2dHatch_Hatcher::Confusion2d ******/
		/****** md5 signature: 7f38529ba6117ca27f93f99e7da27ae6 ******/
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the 2d confusion tolerance, i.e. the value under which two points are considered identical in the parametric space of the hatching.
") Confusion2d;
		double Confusion2d();

		/****** Geom2dHatch_Hatcher::Confusion3d ******/
		/****** md5 signature: 0699bed212952bc15095f6068ae14bf9 ******/
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "
Parameters
----------
Confusion: double

Return
-------
None

Description
-----------
Sets the confusion tolerance.
") Confusion3d;
		void Confusion3d(const double Confusion);

		/****** Geom2dHatch_Hatcher::Confusion3d ******/
		/****** md5 signature: f4d6cd72b6297e18a23f91ab6b9611bb ******/
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the 3d confusion tolerance, i.e. the value under which two points are considered identical in the 3d space of the hatching.
") Confusion3d;
		double Confusion3d();

		/****** Geom2dHatch_Hatcher::Domain ******/
		/****** md5 signature: 30583ab62e8444bfd1c6329a0732d03f ******/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "
Parameters
----------
IndH: int
IDom: int

Return
-------
HatchGen_Domain

Description
-----------
Returns the IDom-th domain of the IndH-th hatching.
") Domain;
		const HatchGen_Domain & Domain(const int IndH, const int IDom);

		/****** Geom2dHatch_Hatcher::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump the hatcher.
") Dump;
		void Dump();

		/****** Geom2dHatch_Hatcher::ElementCurve ******/
		/****** md5 signature: 0a02e9fa3b4d55b6c9c7e4f747f4a985 ******/
		%feature("compactdefaultargs") ElementCurve;
		%feature("autodoc", "
Parameters
----------
IndE: int

Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the IndE-th element.
") ElementCurve;
		Geom2dAdaptor_Curve ElementCurve(const int IndE);

		/****** Geom2dHatch_Hatcher::HatchingCurve ******/
		/****** md5 signature: b22564d905b2f030e2d5b0cd4db1687d ******/
		%feature("compactdefaultargs") HatchingCurve;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the IndH-th hatching.
") HatchingCurve;
		Geom2dAdaptor_Curve HatchingCurve(const int IndH);

		/****** Geom2dHatch_Hatcher::Intersector ******/
		/****** md5 signature: d4ab1df6bb73c74fdc4de0978582e354 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "
Parameters
----------
Intersector: Geom2dHatch_Intersector

Return
-------
None

Description
-----------
Sets the associated intersector.
") Intersector;
		void Intersector(const Geom2dHatch_Intersector & Intersector);

		/****** Geom2dHatch_Hatcher::Intersector ******/
		/****** md5 signature: 697d6c432ae510993f9234013244b045 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
Geom2dHatch_Intersector

Description
-----------
Returns the associated intersector.
") Intersector;
		const Geom2dHatch_Intersector & Intersector();

		/****** Geom2dHatch_Hatcher::KeepPoints ******/
		/****** md5 signature: dd802ab95db3e147f5690eb9f257a732 ******/
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "
Parameters
----------
Keep: bool

Return
-------
None

Description
-----------
Sets the above flag.
") KeepPoints;
		void KeepPoints(const bool Keep);

		/****** Geom2dHatch_Hatcher::KeepPoints ******/
		/****** md5 signature: 0e569984fb38af61fa0d90c0b4914687 ******/
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the points consideration.
") KeepPoints;
		bool KeepPoints();

		/****** Geom2dHatch_Hatcher::KeepSegments ******/
		/****** md5 signature: 2988e55480caff5d018227fecca8c780 ******/
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "
Parameters
----------
Keep: bool

Return
-------
None

Description
-----------
Sets the above flag.
") KeepSegments;
		void KeepSegments(const bool Keep);

		/****** Geom2dHatch_Hatcher::KeepSegments ******/
		/****** md5 signature: 8e9e5090652100b27637f3100da43ca0 ******/
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the segments consideration.
") KeepSegments;
		bool KeepSegments();

		/****** Geom2dHatch_Hatcher::NbDomains ******/
		/****** md5 signature: 3e322cf202815c5b5821c058ec81e3de ******/
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
int

Description
-----------
Returns the number of domains of the IndH-th hatching. Only ONE 'INFINITE' domain means that the hatching is fully included in the contour defined by the elements.
") NbDomains;
		int NbDomains(const int IndH);

		/****** Geom2dHatch_Hatcher::NbPoints ******/
		/****** md5 signature: 0f6144f5b447fe4a1a0a753617daf02a ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
int

Description
-----------
Returns the number of intersection points of the IndH-th hatching.
") NbPoints;
		int NbPoints(const int IndH);

		/****** Geom2dHatch_Hatcher::Point ******/
		/****** md5 signature: 2a3c4c3f4a8ca87561f2ca5b12ce110b ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
IndH: int
IndP: int

Return
-------
HatchGen_PointOnHatching

Description
-----------
Returns the IndP-th intersection point of the IndH-th hatching.
") Point;
		const HatchGen_PointOnHatching & Point(const int IndH, const int IndP);

		/****** Geom2dHatch_Hatcher::RemElement ******/
		/****** md5 signature: da4674a51ada7b4870aebd2f6badb455 ******/
		%feature("compactdefaultargs") RemElement;
		%feature("autodoc", "
Parameters
----------
IndE: int

Return
-------
None

Description
-----------
Removes the IndE-th element from the hatcher.
") RemElement;
		void RemElement(const int IndE);

		/****** Geom2dHatch_Hatcher::RemHatching ******/
		/****** md5 signature: 272ad69aed1a50ba98952c9e79ee4eea ******/
		%feature("compactdefaultargs") RemHatching;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
None

Description
-----------
Removes the IndH-th hatching from the hatcher.
") RemHatching;
		void RemHatching(const int IndH);

		/****** Geom2dHatch_Hatcher::Status ******/
		/****** md5 signature: ed5f408b723e7b52ff8df6cc20e8bc77 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
HatchGen_ErrorStatus

Description
-----------
Returns the status about the IndH-th hatching.
") Status;
		HatchGen_ErrorStatus Status(const int IndH);

		/****** Geom2dHatch_Hatcher::Trim ******/
		/****** md5 signature: f2db9e8c741c03532ffc3979cda30640 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Return
-------
None

Description
-----------
Trims all the hatchings of the hatcher by all the elements of the hatcher.
") Trim;
		void Trim();

		/****** Geom2dHatch_Hatcher::Trim ******/
		/****** md5 signature: 44228a60588455b155f5706a1d9d5587 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve

Return
-------
int

Description
-----------
Adds a hatching to the hatcher and trims it by the elements already given and returns its index.
") Trim;
		int Trim(const Geom2dAdaptor_Curve & Curve);

		/****** Geom2dHatch_Hatcher::Trim ******/
		/****** md5 signature: ae80b7505e1043fd71a49679e868ddfd ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
None

Description
-----------
Trims the IndH-th hatching by the elements already given.
") Trim;
		void Trim(const int IndH);

		/****** Geom2dHatch_Hatcher::TrimDone ******/
		/****** md5 signature: 72343f46a1bb2325fd68aa428bf266fb ******/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
bool

Description
-----------
Returns the fact that the intersections were computed for the IndH-th hatching.
") TrimDone;
		bool TrimDone(const int IndH);

		/****** Geom2dHatch_Hatcher::TrimFailed ******/
		/****** md5 signature: 78d00cf8fbaa5bb13eaf69ef9506bfc3 ******/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "
Parameters
----------
IndH: int

Return
-------
bool

Description
-----------
Returns the fact that the intersections failed for the IndH-th hatching.
") TrimFailed;
		bool TrimFailed(const int IndH);

};


%extend Geom2dHatch_Hatcher {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsDone(self):
		pass
	}
};

/*****************************
* class Geom2dHatch_Hatching *
*****************************/
class Geom2dHatch_Hatching {
	public:
		/****** Geom2dHatch_Hatching::Geom2dHatch_Hatching ******/
		/****** md5 signature: 2062046bf5b1c714e46f8a4687c70549 ******/
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching();

		/****** Geom2dHatch_Hatching::Geom2dHatch_Hatching ******/
		/****** md5 signature: ccf226b872b3ecf832b2d589a6dc49d0 ******/
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", "
Parameters
----------
Curve: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
Creates a hatching.
") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching(const Geom2dAdaptor_Curve & Curve);

		/****** Geom2dHatch_Hatching::AddDomain ******/
		/****** md5 signature: ba9481eec256629b6fe9381a3088e6da ******/
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "
Parameters
----------
Domain: HatchGen_Domain

Return
-------
None

Description
-----------
Adds a domain to the hatching.
") AddDomain;
		void AddDomain(const HatchGen_Domain & Domain);

		/****** Geom2dHatch_Hatching::AddPoint ******/
		/****** md5 signature: e97f2f4b400b4f1fd5872f5d0b399fd7 ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: double

Return
-------
None

Description
-----------
Adds an intersection point to the hatching.
") AddPoint;
		void AddPoint(const HatchGen_PointOnHatching & Point, const double Confusion);

		/****** Geom2dHatch_Hatching::ChangeCurve ******/
		/****** md5 signature: fe0ef69eab3edfb44b3acc292d7c73be ******/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the hatching.
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve();

		/****** Geom2dHatch_Hatching::ChangePoint ******/
		/****** md5 signature: d67d170655ffe23e026e09b6d7789e7a ******/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
HatchGen_PointOnHatching

Description
-----------
Returns the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.
") ChangePoint;
		HatchGen_PointOnHatching & ChangePoint(const int Index);

		/****** Geom2dHatch_Hatching::ClassificationPoint ******/
		/****** md5 signature: 3cb51d9b6c6a01e7e016aeec532a9266 ******/
		%feature("compactdefaultargs") ClassificationPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns a point on the curve. This point will be used for the classification.
") ClassificationPoint;
		gp_Pnt2d ClassificationPoint();

		/****** Geom2dHatch_Hatching::ClrDomains ******/
		/****** md5 signature: b3871988cee79159b996f0c8b2e2fb30 ******/
		%feature("compactdefaultargs") ClrDomains;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the domains of the hatching.
") ClrDomains;
		void ClrDomains();

		/****** Geom2dHatch_Hatching::ClrPoints ******/
		/****** md5 signature: e99750252922662025bcc4d5f2030893 ******/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the intersection points of the hatching.
") ClrPoints;
		void ClrPoints();

		/****** Geom2dHatch_Hatching::Curve ******/
		/****** md5 signature: e12bcd64b0a466dce7601de6fe68db77 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the hatching.
") Curve;
		Geom2dAdaptor_Curve Curve();

		/****** Geom2dHatch_Hatching::Domain ******/
		/****** md5 signature: 93a73134b91a61baaf8bd1d4f28b4d4e ******/
		%feature("compactdefaultargs") Domain;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
HatchGen_Domain

Description
-----------
Returns the Index-th domain of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbDomains.
") Domain;
		const HatchGen_Domain & Domain(const int Index);

		/****** Geom2dHatch_Hatching::IsDone ******/
		/****** md5 signature: d3bcfb411585294342be7a89eeb8fbd9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "
Parameters
----------
Flag: bool

Return
-------
None

Description
-----------
Sets the flag about the domains computation to the given value.
") IsDone;
		void IsDone(const bool Flag);

		/****** Geom2dHatch_Hatching::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the domains computation.
") IsDone;
		bool IsDone();

		/****** Geom2dHatch_Hatching::NbDomains ******/
		/****** md5 signature: 4b4a651c889ceae036a9c6ae20bc0ebf ******/
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of domains of the hatching.
") NbDomains;
		int NbDomains();

		/****** Geom2dHatch_Hatching::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points of the hatching.
") NbPoints;
		int NbPoints();

		/****** Geom2dHatch_Hatching::Point ******/
		/****** md5 signature: 6d7e6e43af74adeb9d1fb6a8e730a7d1 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
HatchGen_PointOnHatching

Description
-----------
Returns the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.
") Point;
		const HatchGen_PointOnHatching & Point(const int Index);

		/****** Geom2dHatch_Hatching::RemDomain ******/
		/****** md5 signature: 39b1b74ba59383ca2d270cb9eaf36b45 ******/
		%feature("compactdefaultargs") RemDomain;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Removes the Index-th domain of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbDomains.
") RemDomain;
		void RemDomain(const int Index);

		/****** Geom2dHatch_Hatching::RemPoint ******/
		/****** md5 signature: 07323d3a50ede9b835c517bad7072314 ******/
		%feature("compactdefaultargs") RemPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Removes the Index-th intersection point of the hatching. The exception OutOfRange is raised if Index < 1 or Index > NbPoints.
") RemPoint;
		void RemPoint(const int Index);

		/****** Geom2dHatch_Hatching::Status ******/
		/****** md5 signature: 81c4e8f2ad9b32fcff84b60598915bb5 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
theStatus: HatchGen_ErrorStatus

Return
-------
None

Description
-----------
Sets the error status.
") Status;
		void Status(const HatchGen_ErrorStatus theStatus);

		/****** Geom2dHatch_Hatching::Status ******/
		/****** md5 signature: 1c05122e5a611d2704c6ce8428cd3fda ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
HatchGen_ErrorStatus

Description
-----------
Returns the error status.
") Status;
		HatchGen_ErrorStatus Status();

		/****** Geom2dHatch_Hatching::TrimDone ******/
		/****** md5 signature: 6b184bed638d718006f510332b8d6dd3 ******/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "
Parameters
----------
Flag: bool

Return
-------
None

Description
-----------
Sets the flag about the trimming computations to the given value.
") TrimDone;
		void TrimDone(const bool Flag);

		/****** Geom2dHatch_Hatching::TrimDone ******/
		/****** md5 signature: b5443331746da466ca30f1979ccbc007 ******/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the trimming computations.
") TrimDone;
		bool TrimDone();

		/****** Geom2dHatch_Hatching::TrimFailed ******/
		/****** md5 signature: 3bd92620265956705fea9ea44ff04ab1 ******/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "
Parameters
----------
Flag: bool

Return
-------
None

Description
-----------
Sets the flag about the trimming failure to the given value.
") TrimFailed;
		void TrimFailed(const bool Flag);

		/****** Geom2dHatch_Hatching::TrimFailed ******/
		/****** md5 signature: 1d6222c8bd2983f805c6c63789a79f6c ******/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the trimming failure.
") TrimFailed;
		bool TrimFailed();

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
		/****** Geom2dHatch_Intersector::Geom2dHatch_Intersector ******/
		/****** md5 signature: bf316dafeca3200b4b246055cb1fce1c ******/
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "
Parameters
----------
Confusion: double
Tangency: double

Return
-------
None

Description
-----------
Creates an intersector.
") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector(const double Confusion, const double Tangency);

		/****** Geom2dHatch_Intersector::Geom2dHatch_Intersector ******/
		/****** md5 signature: 418f7110f267139f168df9ee1f11e3d8 ******/
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector();

		/****** Geom2dHatch_Intersector::ConfusionTolerance ******/
		/****** md5 signature: 512f751b0c17c5b59ef7348bd6d787a7 ******/
		%feature("compactdefaultargs") ConfusionTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the confusion tolerance of the intersector.
") ConfusionTolerance;
		double ConfusionTolerance();

		/****** Geom2dHatch_Intersector::Intersect ******/
		/****** md5 signature: ed6de426a99bea19436b81b6be37110e ******/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "
Parameters
----------
C1: Geom2dAdaptor_Curve
C2: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
Intersects the curves C1 and C2. The results are retrieved by the usual methods described in IntRes2d_Intersection. Creates an intersector.
") Intersect;
		void Intersect(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2);

		/****** Geom2dHatch_Intersector::LocalGeometry ******/
		/****** md5 signature: 67c7f03b4ae9b4d8a5a36c40eeac3dae ******/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "
Parameters
----------
E: Geom2dAdaptor_Curve
U: double
T: gp_Dir2d
N: gp_Dir2d

Return
-------
C: double

Description
-----------
Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.
") LocalGeometry;
		void LocalGeometry(const Geom2dAdaptor_Curve & E, const double U, gp_Dir2d & T, gp_Dir2d & N, Standard_Real &OutValue);

		/****** Geom2dHatch_Intersector::Perform ******/
		/****** md5 signature: 2c6c0a2fe01ca9795f95dcb15ec93862 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: double
Tol: double
E: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
Performs the intersection between the 2d line segment (<L>, <P>) and the Curve <E>. The line segment is the part of the 2d line <L> of parameter range [0, <P>] (P is positive and can be RealLast()). Tol is the Tolerance on the segment. The order is relevant, the first argument is the segment, the second the Edge.
") Perform;
		void Perform(const gp_Lin2d & L, const double P, const double Tol, const Geom2dAdaptor_Curve & E);

		/****** Geom2dHatch_Intersector::SetConfusionTolerance ******/
		/****** md5 signature: c0ef8eee871b234aabfd7b2e57c1048d ******/
		%feature("compactdefaultargs") SetConfusionTolerance;
		%feature("autodoc", "
Parameters
----------
Confusion: double

Return
-------
None

Description
-----------
Sets the confusion tolerance of the intersector.
") SetConfusionTolerance;
		void SetConfusionTolerance(const double Confusion);

		/****** Geom2dHatch_Intersector::SetTangencyTolerance ******/
		/****** md5 signature: a78d778fdd167fa2e222e9fd55883e88 ******/
		%feature("compactdefaultargs") SetTangencyTolerance;
		%feature("autodoc", "
Parameters
----------
Tangency: double

Return
-------
None

Description
-----------
Sets the tangency tolerance of the intersector.
") SetTangencyTolerance;
		void SetTangencyTolerance(const double Tangency);

		/****** Geom2dHatch_Intersector::TangencyTolerance ******/
		/****** md5 signature: a70d3484b5472a3690d37fc1352bff8f ******/
		%feature("compactdefaultargs") TangencyTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tangency tolerance of the intersector.
") TangencyTolerance;
		double TangencyTolerance();

};


%extend Geom2dHatch_Intersector {
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
