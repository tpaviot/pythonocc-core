/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_geom2dhatch.html"
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


%{
#include<Geom2dHatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Geom2dAdaptor_module.hxx>
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
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Geom2dAdaptor.i
%import IntRes2d.i
%import TopAbs.i
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
%template(Geom2dHatch_Hatchings) NCollection_DataMap<Standard_Integer,Geom2dHatch_Hatching,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Geom2dHatch_Hatching,TColStd_MapIntegerHasher> {
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
%template(Geom2dHatch_MapOfElements) NCollection_DataMap<Standard_Integer,Geom2dHatch_Element,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Geom2dHatch_Element,TColStd_MapIntegerHasher> {
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
typedef NCollection_DataMap<Standard_Integer, Geom2dHatch_Hatching, TColStd_MapIntegerHasher>::Iterator Geom2dHatch_DataMapIteratorOfHatchings;
typedef NCollection_DataMap<Standard_Integer, Geom2dHatch_Element, TColStd_MapIntegerHasher>::Iterator Geom2dHatch_DataMapIteratorOfMapOfElements;
typedef NCollection_DataMap<Standard_Integer, Geom2dHatch_Hatching, TColStd_MapIntegerHasher> Geom2dHatch_Hatchings;
typedef NCollection_DataMap<Standard_Integer, Geom2dHatch_Element, TColStd_MapIntegerHasher> Geom2dHatch_MapOfElements;
/* end typedefs declaration */

/*******************************
* class Geom2dHatch_Classifier *
*******************************/
class Geom2dHatch_Classifier {
	public:
		/****************** Geom2dHatch_Classifier ******************/
		/**** md5 signature: 890cc459e67944b97d32307aa60ca1df ****/
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, undefined algorithm.
") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier();

		/****************** Geom2dHatch_Classifier ******************/
		/**** md5 signature: 63d13333c2e6e4bcb47bb73a28635103 ****/
		%feature("compactdefaultargs") Geom2dHatch_Classifier;
		%feature("autodoc", "
Parameters
----------
F: Geom2dHatch_Elements
P: gp_Pnt2d
Tol: float

Return
-------
None

Description
-----------
Creates an algorithm to classify the point p with tolerance <t> on the face described by <f>.
") Geom2dHatch_Classifier;
		 Geom2dHatch_Classifier(Geom2dHatch_Elements & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****************** Edge ******************/
		/**** md5 signature: 4ef596a40082b0b9b1d8e5366c52ac1b ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the edge used to determine the classification. when the state is on this is the edge containing the point.
") Edge;
		const Geom2dAdaptor_Curve & Edge();

		/****************** EdgeParameter ******************/
		/**** md5 signature: a4ccdc0e9c154705af034e3ac274511c ****/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on edge() used to determine the classification.
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****************** NoWires ******************/
		/**** md5 signature: 990679762274e4aefbb7c462574e4bcd ****/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the face contains no wire. the state is in.
") NoWires;
		Standard_Boolean NoWires();

		/****************** Perform ******************/
		/**** md5 signature: 6763c7244137184be57781cdb8a509c2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: Geom2dHatch_Elements
P: gp_Pnt2d
Tol: float

Return
-------
None

Description
-----------
Classify the point p with tolerance <t> on the face described by <f>.
") Perform;
		void Perform(Geom2dHatch_Elements & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****************** Position ******************/
		/**** md5 signature: 675457384dc44fc07e204a19b6850fe8 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
IntRes2d_Position

Description
-----------
Returns the position of the point on the edge returned by edge.
") Position;
		IntRes2d_Position Position();

		/****************** Rejected ******************/
		/**** md5 signature: 56d604911041dd9f442bde612c88e4cd ****/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true when the state was computed by a rejection. the state is out.
") Rejected;
		Standard_Boolean Rejected();

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
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
		/****************** Geom2dHatch_Element ******************/
		/**** md5 signature: 19b7f864164cc189cb47648c17f7066b ****/
		%feature("compactdefaultargs") Geom2dHatch_Element;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Element;
		 Geom2dHatch_Element();

		/****************** Geom2dHatch_Element ******************/
		/**** md5 signature: db7543fb06b4f62b6f2d9dd9372100b3 ****/
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

		/****************** ChangeCurve ******************/
		/**** md5 signature: fe0ef69eab3edfb44b3acc292d7c73be ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the element.
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve();

		/****************** Curve ******************/
		/**** md5 signature: e12bcd64b0a466dce7601de6fe68db77 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the element.
") Curve;
		const Geom2dAdaptor_Curve & Curve();

		/****************** Orientation ******************/
		/**** md5 signature: 854e5a15aa2f2078927a5c9e7d88dcf5 ****/
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

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
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
		/****************** Geom2dHatch_Elements ******************/
		/**** md5 signature: 1db61b20f9f6bb0dfc5227f3c196ffbc ****/
		%feature("compactdefaultargs") Geom2dHatch_Elements;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Elements;
		 Geom2dHatch_Elements();

		/****************** Geom2dHatch_Elements ******************/
		/**** md5 signature: 96a4878bf071792827f0bd8b8a008ab5 ****/
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

		/****************** Bind ******************/
		/**** md5 signature: 0a4e84986672f2d5640236cbce2f453e ****/
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
		Standard_Boolean Bind(const Standard_Integer K, const Geom2dHatch_Element & I);

		/****************** ChangeFind ******************/
		/**** md5 signature: 9f4af5c3ceac8973547b5aa2bf163311 ****/
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
		Geom2dHatch_Element & ChangeFind(const Standard_Integer K);

		/****************** CheckPoint ******************/
		/**** md5 signature: 30b6651418d3d6bd1f89ce3e43a0c300 ****/
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
		Standard_Boolean CheckPoint(gp_Pnt2d & P);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** CurrentEdge ******************/
		/**** md5 signature: aefaf443b65e7c54bdbb44af89cd5be8 ****/
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

		/****************** Find ******************/
		/**** md5 signature: 09042a6b22fc21ef573ed77bf386c9b9 ****/
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
		const Geom2dHatch_Element & Find(const Standard_Integer K);

		/****************** InitEdges ******************/
		/**** md5 signature: 91bbc4c29d3c5c1c40b8c41a10bba4ae ****/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdges;
		void InitEdges();

		/****************** InitWires ******************/
		/**** md5 signature: ebff8f083b93df212af42dee4111419b ****/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitWires;
		void InitWires();

		/****************** IsBound ******************/
		/**** md5 signature: 83c42346d336d27c4f96db87f36ec3b3 ****/
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
		Standard_Boolean IsBound(const Standard_Integer K);

		/****************** MoreEdges ******************/
		/**** md5 signature: ae9c44c48922d7def77564a0d6f2c592 ****/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****************** MoreWires ******************/
		/**** md5 signature: b99e6f15aacc2cac79d7fb8f92595589 ****/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreWires;
		Standard_Boolean MoreWires();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****************** NextWire ******************/
		/**** md5 signature: 11b92f2dcc830f98b32d40bd651c0b28 ****/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextWire;
		void NextWire();

		/****************** OtherSegment ******************/
		/**** md5 signature: 27490dca9d2d53354d092dd2a3334ce2 ****/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: float

Description
-----------
No available documentation.
") OtherSegment;
		Standard_Boolean OtherSegment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****************** Reject ******************/
		/**** md5 signature: a145789dcdf45149993e111ed41174ea ****/
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
		Standard_Boolean Reject(const gp_Pnt2d & P);

		/****************** RejectEdge ******************/
		/**** md5 signature: ac46be93532b1dfcf60e7e385f949d17 ****/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: float

Return
-------
bool

Description
-----------
No available documentation.
") RejectEdge;
		Standard_Boolean RejectEdge(const gp_Lin2d & L, const Standard_Real Par);

		/****************** RejectWire ******************/
		/**** md5 signature: a3caa1d04bab721ad3228acbea576ecb ****/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: float

Return
-------
bool

Description
-----------
No available documentation.
") RejectWire;
		Standard_Boolean RejectWire(const gp_Lin2d & L, const Standard_Real Par);

		/****************** Segment ******************/
		/**** md5 signature: 5eb3735a7b24946e69be33f96fb9d7b5 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: float

Description
-----------
No available documentation.
") Segment;
		Standard_Boolean Segment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****************** UnBind ******************/
		/**** md5 signature: beff00ad6ead6cd8e48016f872c0f7c7 ****/
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
		Standard_Boolean UnBind(const Standard_Integer K);

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
		/****************** Geom2dHatch_FClass2dOfClassifier ******************/
		/**** md5 signature: 46403459555e0636347ccfb376dd1cb2 ****/
		%feature("compactdefaultargs") Geom2dHatch_FClass2dOfClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined classifier.
") Geom2dHatch_FClass2dOfClassifier;
		 Geom2dHatch_FClass2dOfClassifier();

		/****************** ClosestIntersection ******************/
		/**** md5 signature: 025d23acf1aa6c435dba31dbf4248fd0 ****/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the last compared edge had no relevant intersection. else returns the index of this intersection in the last intersection algorithm.
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****************** Compare ******************/
		/**** md5 signature: 8847c5ed00295e2cbe677ffdcccdc312 ****/
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
Updates the classification process with the edge <e> from the boundary.
") Compare;
		void Compare(const Geom2dAdaptor_Curve & E, const TopAbs_Orientation Or);

		/****************** Intersector ******************/
		/**** md5 signature: 1dd65a31c65d3ed0cb2ef570bb23e710 ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
Geom2dHatch_Intersector

Description
-----------
Returns the intersecting algorithm.
") Intersector;
		Geom2dHatch_Intersector & Intersector();

		/****************** IsHeadOrEnd ******************/
		/**** md5 signature: bb302ba418a265161aeac4ed94262010 ****/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the standard_true if the closest intersection point represents head or end of the edge. returns standard_false otherwise.
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current value of the parameter.
") Parameter;
		Standard_Real Parameter();

		/****************** Reset ******************/
		/**** md5 signature: a8c5889582c62cd16da1026d9b738b50 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: float
Tol: float

Return
-------
None

Description
-----------
Starts a classification process. the point to classify is the origin of the line <l>. <p> is the original length of the segment on <l> used to compute intersections. <tol> is the tolerance attached to the line segment in intersections.
") Reset;
		void Reset(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol);

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
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
		/****************** Geom2dHatch_Hatcher ******************/
		/**** md5 signature: 187b4dcb3ab1500dccf3be0f421e2aa5 ****/
		%feature("compactdefaultargs") Geom2dHatch_Hatcher;
		%feature("autodoc", "
Parameters
----------
Intersector: Geom2dHatch_Intersector
Confusion2d: float
Confusion3d: float
KeepPnt: bool (optional, default to Standard_False)
KeepSeg: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns an empty hatcher.
") Geom2dHatch_Hatcher;
		 Geom2dHatch_Hatcher(const Geom2dHatch_Intersector & Intersector, const Standard_Real Confusion2d, const Standard_Real Confusion3d, const Standard_Boolean KeepPnt = Standard_False, const Standard_Boolean KeepSeg = Standard_False);

		/****************** AddElement ******************/
		/**** md5 signature: 1795e334b38d7b7b840911f4d7afab35 ****/
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
		Standard_Integer AddElement(const Geom2dAdaptor_Curve & Curve, const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****************** AddElement ******************/
		/**** md5 signature: 1f114769a432a77d228adb9e8d05239d ****/
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
		Standard_Integer AddElement(const opencascade::handle<Geom2d_Curve> & Curve, const TopAbs_Orientation Orientation = TopAbs_FORWARD);

		/****************** AddHatching ******************/
		/**** md5 signature: c5a53d2a733f5a8b1881e7499c52e61e ****/
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
		Standard_Integer AddHatching(const Geom2dAdaptor_Curve & Curve);

		/****************** ChangeIntersector ******************/
		/**** md5 signature: 1ee41f0166a88d5c0b6b493b6da60d02 ****/
		%feature("compactdefaultargs") ChangeIntersector;
		%feature("autodoc", "Return
-------
Geom2dHatch_Intersector

Description
-----------
Returns the associated intersector.
") ChangeIntersector;
		Geom2dHatch_Intersector & ChangeIntersector();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the hatchings and all the elements.
") Clear;
		void Clear();

		/****************** ClrElements ******************/
		/**** md5 signature: f3ef546889a6370ed2e0c706890f4a15 ****/
		%feature("compactdefaultargs") ClrElements;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the elements from the hatcher.
") ClrElements;
		void ClrElements();

		/****************** ClrHatchings ******************/
		/**** md5 signature: f7850978ed1a1f8a1e54a87d5568ad99 ****/
		%feature("compactdefaultargs") ClrHatchings;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the hatchings from the hatcher.
") ClrHatchings;
		void ClrHatchings();

		/****************** ComputeDomains ******************/
		/**** md5 signature: c85a4118552e35af32b2d36511b6bf5e ****/
		%feature("compactdefaultargs") ComputeDomains;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the domains of all the hatchings.
") ComputeDomains;
		void ComputeDomains();

		/****************** ComputeDomains ******************/
		/**** md5 signature: b7e820a44e2a6bc312d42a71e29c5121 ****/
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
Computes the domains of the indh-th hatching.
") ComputeDomains;
		void ComputeDomains(const Standard_Integer IndH);

		/****************** Confusion2d ******************/
		/**** md5 signature: 627c715c323135f6eff3a40837fae3a6 ****/
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "
Parameters
----------
Confusion: float

Return
-------
None

Description
-----------
Sets the confusion tolerance.
") Confusion2d;
		void Confusion2d(const Standard_Real Confusion);

		/****************** Confusion2d ******************/
		/**** md5 signature: 05d7bf6f3e8fb541be61933e883a4241 ****/
		%feature("compactdefaultargs") Confusion2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the 2d confusion tolerance, i.e. the value under which two points are considered identical in the parametric space of the hatching.
") Confusion2d;
		Standard_Real Confusion2d();

		/****************** Confusion3d ******************/
		/**** md5 signature: d3548d5270cfbc65c491dfa71a0474e0 ****/
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "
Parameters
----------
Confusion: float

Return
-------
None

Description
-----------
Sets the confusion tolerance.
") Confusion3d;
		void Confusion3d(const Standard_Real Confusion);

		/****************** Confusion3d ******************/
		/**** md5 signature: d01bb76166a4bbcfea896dac72b5f667 ****/
		%feature("compactdefaultargs") Confusion3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the 3d confusion tolerance, i.e. the value under which two points are considered identical in the 3d space of the hatching.
") Confusion3d;
		Standard_Real Confusion3d();

		/****************** Domain ******************/
		/**** md5 signature: 6032d5398ada3cf66e558ed75fe21bea ****/
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
Returns the idom-th domain of the indh-th hatching.
") Domain;
		const HatchGen_Domain & Domain(const Standard_Integer IndH, const Standard_Integer IDom);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump the hatcher.
") Dump;
		void Dump();

		/****************** ElementCurve ******************/
		/**** md5 signature: 7b82bcd07d993461dce6bf3b3b98fcbd ****/
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
Returns the curve associated to the inde-th element.
") ElementCurve;
		const Geom2dAdaptor_Curve & ElementCurve(const Standard_Integer IndE);

		/****************** HatchingCurve ******************/
		/**** md5 signature: b1fa8a098ff9f80a6f4e6d2a784c6793 ****/
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
Returns the curve associated to the indh-th hatching.
") HatchingCurve;
		const Geom2dAdaptor_Curve & HatchingCurve(const Standard_Integer IndH);

		/****************** Intersector ******************/
		/**** md5 signature: d4ab1df6bb73c74fdc4de0978582e354 ****/
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

		/****************** Intersector ******************/
		/**** md5 signature: 697d6c432ae510993f9234013244b045 ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
Geom2dHatch_Intersector

Description
-----------
Returns the associated intersector.
") Intersector;
		const Geom2dHatch_Intersector & Intersector();

		/****************** KeepPoints ******************/
		/**** md5 signature: 027651edb5748a4f9dcd520314dbd93a ****/
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
		void KeepPoints(const Standard_Boolean Keep);

		/****************** KeepPoints ******************/
		/**** md5 signature: 8ada9044d41ff216e29e7377b2793980 ****/
		%feature("compactdefaultargs") KeepPoints;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the points consideration.
") KeepPoints;
		Standard_Boolean KeepPoints();

		/****************** KeepSegments ******************/
		/**** md5 signature: d3ed6d7cf52ae62cad0e06281b198d31 ****/
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
		void KeepSegments(const Standard_Boolean Keep);

		/****************** KeepSegments ******************/
		/**** md5 signature: 7d1a74e2496ac2b5cc2da55e862a4747 ****/
		%feature("compactdefaultargs") KeepSegments;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the segments consideration.
") KeepSegments;
		Standard_Boolean KeepSegments();

		/****************** NbDomains ******************/
		/**** md5 signature: d48395d7e40b2e4422ef860c44d28ee9 ****/
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
Returns the number of domains of the indh-th hatching. only one 'infinite' domain means that the hatching is fully included in the contour defined by the elements.
") NbDomains;
		Standard_Integer NbDomains(const Standard_Integer IndH);

		/****************** NbPoints ******************/
		/**** md5 signature: c809871526b75b966177fc20bdcc65a5 ****/
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
Returns the number of intersection points of the indh-th hatching.
") NbPoints;
		Standard_Integer NbPoints(const Standard_Integer IndH);

		/****************** Point ******************/
		/**** md5 signature: 406dd4973b782e4acc78e842b4000820 ****/
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
Returns the indp-th intersection point of the indh-th hatching.
") Point;
		const HatchGen_PointOnHatching & Point(const Standard_Integer IndH, const Standard_Integer IndP);

		/****************** RemElement ******************/
		/**** md5 signature: 3d9f4dc777513f61512183f442d2c1b2 ****/
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
Removes the inde-th element from the hatcher.
") RemElement;
		void RemElement(const Standard_Integer IndE);

		/****************** RemHatching ******************/
		/**** md5 signature: 890abff5548474a792e109dec3568ba1 ****/
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
Removes the indh-th hatching from the hatcher.
") RemHatching;
		void RemHatching(const Standard_Integer IndH);

		/****************** Status ******************/
		/**** md5 signature: 528338a7f66ec9b9d06ff74af6ea1b34 ****/
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
Returns the status about the indh-th hatching.
") Status;
		HatchGen_ErrorStatus Status(const Standard_Integer IndH);

		/****************** Trim ******************/
		/**** md5 signature: f2db9e8c741c03532ffc3979cda30640 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Return
-------
None

Description
-----------
Trims all the hatchings of the hatcher by all the elements of the hatcher.
") Trim;
		void Trim();

		/****************** Trim ******************/
		/**** md5 signature: 8ede1b0e1bc16299ed7e530304c71aa6 ****/
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
		Standard_Integer Trim(const Geom2dAdaptor_Curve & Curve);

		/****************** Trim ******************/
		/**** md5 signature: feeee1e44f575b2a531349e0279c673a ****/
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
Trims the indh-th hatching by the elements already given.
") Trim;
		void Trim(const Standard_Integer IndH);

		/****************** TrimDone ******************/
		/**** md5 signature: 8bd5bf94a182ef475c4c3267e1a188c7 ****/
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
Returns the fact that the intersections were computed for the indh-th hatching.
") TrimDone;
		Standard_Boolean TrimDone(const Standard_Integer IndH);

		/****************** TrimFailed ******************/
		/**** md5 signature: b6f1c1f3c2d6e9c97215966124430f71 ****/
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
Returns the fact that the intersections failed for the indh-th hatching.
") TrimFailed;
		Standard_Boolean TrimFailed(const Standard_Integer IndH);

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
		/****************** Geom2dHatch_Hatching ******************/
		/**** md5 signature: 2062046bf5b1c714e46f8a4687c70549 ****/
		%feature("compactdefaultargs") Geom2dHatch_Hatching;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Hatching;
		 Geom2dHatch_Hatching();

		/****************** Geom2dHatch_Hatching ******************/
		/**** md5 signature: ccf226b872b3ecf832b2d589a6dc49d0 ****/
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

		/****************** AddDomain ******************/
		/**** md5 signature: ba9481eec256629b6fe9381a3088e6da ****/
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

		/****************** AddPoint ******************/
		/**** md5 signature: dbba22fac9cf431f5cd0498363256d72 ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
Point: HatchGen_PointOnHatching
Confusion: float

Return
-------
None

Description
-----------
Adds an intersection point to the hatching.
") AddPoint;
		void AddPoint(const HatchGen_PointOnHatching & Point, const Standard_Real Confusion);

		/****************** ChangeCurve ******************/
		/**** md5 signature: fe0ef69eab3edfb44b3acc292d7c73be ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the hatching.
") ChangeCurve;
		Geom2dAdaptor_Curve & ChangeCurve();

		/****************** ChangePoint ******************/
		/**** md5 signature: ed257bfbad147d866f4e6d64b57cae2c ****/
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
Returns the index-th intersection point of the hatching. the exception outofrange is raised if index < 1 or index > nbpoints.
") ChangePoint;
		HatchGen_PointOnHatching & ChangePoint(const Standard_Integer Index);

		/****************** ClassificationPoint ******************/
		/**** md5 signature: 3cb51d9b6c6a01e7e016aeec532a9266 ****/
		%feature("compactdefaultargs") ClassificationPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns a point on the curve. this point will be used for the classification.
") ClassificationPoint;
		gp_Pnt2d ClassificationPoint();

		/****************** ClrDomains ******************/
		/**** md5 signature: b3871988cee79159b996f0c8b2e2fb30 ****/
		%feature("compactdefaultargs") ClrDomains;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the domains of the hatching.
") ClrDomains;
		void ClrDomains();

		/****************** ClrPoints ******************/
		/**** md5 signature: e99750252922662025bcc4d5f2030893 ****/
		%feature("compactdefaultargs") ClrPoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all the intersection points of the hatching.
") ClrPoints;
		void ClrPoints();

		/****************** Curve ******************/
		/**** md5 signature: e12bcd64b0a466dce7601de6fe68db77 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
Geom2dAdaptor_Curve

Description
-----------
Returns the curve associated to the hatching.
") Curve;
		const Geom2dAdaptor_Curve & Curve();

		/****************** Domain ******************/
		/**** md5 signature: f3c8220f5a10c7deff66f6c669170c4f ****/
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
Returns the index-th domain of the hatching. the exception outofrange is raised if index < 1 or index > nbdomains.
") Domain;
		const HatchGen_Domain & Domain(const Standard_Integer Index);

		/****************** IsDone ******************/
		/**** md5 signature: c5ee0df671d976d747baf3c96c1e3e0a ****/
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
		void IsDone(const Standard_Boolean Flag);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the domains computation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbDomains ******************/
		/**** md5 signature: 88f695e65a56f270d89ba3c02d0a11e0 ****/
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of domains of the hatching.
") NbDomains;
		Standard_Integer NbDomains();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points of the hatching.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: eda4bbd7f8aa7bfe072b5cf54ac61ec8 ****/
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
Returns the index-th intersection point of the hatching. the exception outofrange is raised if index < 1 or index > nbpoints.
") Point;
		const HatchGen_PointOnHatching & Point(const Standard_Integer Index);

		/****************** RemDomain ******************/
		/**** md5 signature: ac1a9d30bab474f2fd3be2fcd38b3a59 ****/
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
Removes the index-th domain of the hatching. the exception outofrange is raised if index < 1 or index > nbdomains.
") RemDomain;
		void RemDomain(const Standard_Integer Index);

		/****************** RemPoint ******************/
		/**** md5 signature: 4fd025fee44e20642cf1dc77eaa95334 ****/
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
Removes the index-th intersection point of the hatching. the exception outofrange is raised if index < 1 or index > nbpoints.
") RemPoint;
		void RemPoint(const Standard_Integer Index);

		/****************** Status ******************/
		/**** md5 signature: 81c4e8f2ad9b32fcff84b60598915bb5 ****/
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

		/****************** Status ******************/
		/**** md5 signature: 1c05122e5a611d2704c6ce8428cd3fda ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
HatchGen_ErrorStatus

Description
-----------
Returns the error status.
") Status;
		HatchGen_ErrorStatus Status();

		/****************** TrimDone ******************/
		/**** md5 signature: 85dd69850d8c5318d2171bd9dbe8c677 ****/
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
		void TrimDone(const Standard_Boolean Flag);

		/****************** TrimDone ******************/
		/**** md5 signature: a90282f07c7070914885c7cdce67dbad ****/
		%feature("compactdefaultargs") TrimDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the trimming computations.
") TrimDone;
		Standard_Boolean TrimDone();

		/****************** TrimFailed ******************/
		/**** md5 signature: 0285f5ea6875e7092a42e0f67932cd6d ****/
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
		void TrimFailed(const Standard_Boolean Flag);

		/****************** TrimFailed ******************/
		/**** md5 signature: a80e96591b7c028bf8e6a9f4968fcca7 ****/
		%feature("compactdefaultargs") TrimFailed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag about the trimming failure.
") TrimFailed;
		Standard_Boolean TrimFailed();

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
		/****************** Geom2dHatch_Intersector ******************/
		/**** md5 signature: 9486d58b881107b1a6ec26b97fd475f8 ****/
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "
Parameters
----------
Confusion: float
Tangency: float

Return
-------
None

Description
-----------
Creates an intersector.
") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector(const Standard_Real Confusion, const Standard_Real Tangency);

		/****************** Geom2dHatch_Intersector ******************/
		/**** md5 signature: 418f7110f267139f168df9ee1f11e3d8 ****/
		%feature("compactdefaultargs") Geom2dHatch_Intersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dHatch_Intersector;
		 Geom2dHatch_Intersector();

		/****************** ConfusionTolerance ******************/
		/**** md5 signature: 5d8ed07ec143cde8876ff216d95d6417 ****/
		%feature("compactdefaultargs") ConfusionTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the confusion tolerance of the intersector.
") ConfusionTolerance;
		Standard_Real ConfusionTolerance();

		/****************** Intersect ******************/
		/**** md5 signature: ed6de426a99bea19436b81b6be37110e ****/
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
Intersects the curves c1 and c2. the results are retrieved by the usual methods described in intres2d_intersection. creates an intersector.
") Intersect;
		void Intersect(const Geom2dAdaptor_Curve & C1, const Geom2dAdaptor_Curve & C2);

		/****************** LocalGeometry ******************/
		/**** md5 signature: 6143ed35952d1f3e9b10f961ea5cdb07 ****/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "
Parameters
----------
E: Geom2dAdaptor_Curve
U: float
T: gp_Dir2d
N: gp_Dir2d

Return
-------
C: float

Description
-----------
Returns in <t>, <n> and <c> the tangent, normal and curvature of the edge <e> at parameter value <u>.
") LocalGeometry;
		void LocalGeometry(const Geom2dAdaptor_Curve & E, const Standard_Real U, gp_Dir2d & T, gp_Dir2d & N, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: b636c75bbc716ecf3af70fb9dc9625dd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: float
Tol: float
E: Geom2dAdaptor_Curve

Return
-------
None

Description
-----------
Performs the intersection between the 2d line segment (<l>, <p>) and the curve <e>. the line segment is the part of the 2d line <l> of parameter range [0, <p>] (p is positive and can be reallast()). tol is the tolerance on the segment. the order is relevant, the first argument is the segment, the second the edge.
") Perform;
		void Perform(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol, const Geom2dAdaptor_Curve & E);

		/****************** SetConfusionTolerance ******************/
		/**** md5 signature: f38b1a3647fa12a69e11d7bb1f1675d9 ****/
		%feature("compactdefaultargs") SetConfusionTolerance;
		%feature("autodoc", "
Parameters
----------
Confusion: float

Return
-------
None

Description
-----------
Sets the confusion tolerance of the intersector.
") SetConfusionTolerance;
		void SetConfusionTolerance(const Standard_Real Confusion);

		/****************** SetTangencyTolerance ******************/
		/**** md5 signature: 7977322a03a23c6d1893fcd54da58aa9 ****/
		%feature("compactdefaultargs") SetTangencyTolerance;
		%feature("autodoc", "
Parameters
----------
Tangency: float

Return
-------
None

Description
-----------
Sets the tangency tolerance of the intersector.
") SetTangencyTolerance;
		void SetTangencyTolerance(const Standard_Real Tangency);

		/****************** TangencyTolerance ******************/
		/**** md5 signature: d3276b86847c4d68f8409fb4fa2e0af6 ****/
		%feature("compactdefaultargs") TangencyTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tangency tolerance of the intersector.
") TangencyTolerance;
		Standard_Real TangencyTolerance();

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
