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
%define BREPCLASS3DDOCSTRING
"BRepClass3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepclass3d.html"
%enddef
%module (package="OCC.Core", docstring=BREPCLASS3DDOCSTRING) BRepClass3d


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
#include<BRepClass3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<IntCurvesFace_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<IntSurf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import TopAbs.i
%import IntCurveSurface.i
%import Bnd.i
%import TopTools.i
%import IntCurvesFace.i
%import BRepAdaptor.i

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
%template(BRepClass3d_BndBoxTree) NCollection_UBTree<Standard_Integer,Bnd_Box>;
%template(BRepClass3d_MapOfInter) NCollection_DataMap<TopoDS_Shape,Standard_Address,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_UBTree<Standard_Integer, Bnd_Box> BRepClass3d_BndBoxTree;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Address, TopTools_ShapeMapHasher>::Iterator BRepClass3d_DataMapIteratorOfMapOfInter;
typedef NCollection_DataMap<TopoDS_Shape, Standard_Address, TopTools_ShapeMapHasher> BRepClass3d_MapOfInter;
/* end typedefs declaration */

/********************
* class BRepClass3d *
********************/
%rename(brepclass3d) BRepClass3d;
class BRepClass3d {
	public:
		/****************** OuterShell ******************/
		/**** md5 signature: f7b79b3e5e2fdf723525467fdb7a08ef ****/
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "Returns the outer most shell of <s>. returns a null shell if <s> has no outer shell. if <s> has only one shell, then it will return, without checking orientation.

Parameters
----------
S: TopoDS_Solid

Returns
-------
TopoDS_Shell
") OuterShell;
		static TopoDS_Shell OuterShell(const TopoDS_Solid & S);

};


%extend BRepClass3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepClass3d_Intersector3d *
**********************************/
class BRepClass3d_Intersector3d {
	public:
		/****************** BRepClass3d_Intersector3d ******************/
		/**** md5 signature: 5313248e9a4d9e528b75267702000c25 ****/
		%feature("compactdefaultargs") BRepClass3d_Intersector3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepClass3d_Intersector3d;
		 BRepClass3d_Intersector3d();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the significant face used to determine the intersection.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** HasAPoint ******************/
		/**** md5 signature: 95bdb18305d0dc0e9acb6e3a09a77c66 ****/
		%feature("compactdefaultargs") HasAPoint;
		%feature("autodoc", "True is returned if a point has been found.

Returns
-------
bool
") HasAPoint;
		Standard_Boolean HasAPoint();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True is returned when the intersection have been computed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: fbf207842cdabc9dffc461de3afdbc7f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform the intersection between the segment l(0) ... l(prm) and the shape <sh>. //! only the point with the smallest parameter on the line is returned. //! the tolerance <tol> is used to determine if the first point of the segment is near the face. in that case, the parameter of the intersection point on the line can be a negative value (greater than -tol).

Parameters
----------
L: gp_Lin
Prm: float
Tol: float
F: TopoDS_Face

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real Prm, const Standard_Real Tol, const TopoDS_Face & F);

		/****************** Pnt ******************/
		/**** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the geometric point of the intersection between the line and the surface.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the state of the point on the face. the values can be either topabs_in ( the point is in the face) or topabs_on ( the point is on a boudary of the face).

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

		/****************** Transition ******************/
		/**** md5 signature: bd528dc9c78a60a5b26409b8cf4f3afe ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Returns the transition of the line on the surface.

Returns
-------
IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****************** UParameter ******************/
		/**** md5 signature: 5a3c6fef4fc1a6f599cc725a940f8581 ****/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Returns the u parameter of the intersection point on the surface.

Returns
-------
float
") UParameter;
		Standard_Real UParameter();

		/****************** VParameter ******************/
		/**** md5 signature: 5b56cd11dcb65aaedb7fac8351dbfbc8 ****/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Returns the v parameter of the intersection point on the surface.

Returns
-------
float
") VParameter;
		Standard_Real VParameter();

		/****************** WParameter ******************/
		/**** md5 signature: a33035afb8654e081d0823499e659e46 ****/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "Returns the parameter of the intersection point on the line.

Returns
-------
float
") WParameter;
		Standard_Real WParameter();

};


%extend BRepClass3d_Intersector3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepClass3d_SClassifier *
********************************/
class BRepClass3d_SClassifier {
	public:
		/****************** BRepClass3d_SClassifier ******************/
		/**** md5 signature: 0e43e1bcc9eb18eda4d1709f9787e45f ****/
		%feature("compactdefaultargs") BRepClass3d_SClassifier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier();

		/****************** BRepClass3d_SClassifier ******************/
		/**** md5 signature: 0e7fbee80d781c22f36939e8cf1adb7e ****/
		%feature("compactdefaultargs") BRepClass3d_SClassifier;
		%feature("autodoc", "Constructor to classify the point p with the tolerance tol on the solid s.

Parameters
----------
S: BRepClass3d_SolidExplorer
P: gp_Pnt
Tol: float

Returns
-------
None
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier(BRepClass3d_SolidExplorer & S, const gp_Pnt & P, const Standard_Real Tol);

		/****************** Face ******************/
		/**** md5 signature: 64c75db1e9c1285068e9dd474618f74f ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face used to determine the classification. when the state is on, this is the face containing the point. //! when rejected() returns true, face() has no signification.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** IsOnAFace ******************/
		/**** md5 signature: e7c1af4ae72eee2a9b46452df227e5ed ****/
		%feature("compactdefaultargs") IsOnAFace;
		%feature("autodoc", "Returns true when the point is a point of a face.

Returns
-------
bool
") IsOnAFace;
		Standard_Boolean IsOnAFace();

		/****************** Perform ******************/
		/**** md5 signature: 9c6284684be6a59e66779a905c370b7a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Classify the point p with the tolerance tol on the solid s.

Parameters
----------
S: BRepClass3d_SolidExplorer
P: gp_Pnt
Tol: float

Returns
-------
None
") Perform;
		void Perform(BRepClass3d_SolidExplorer & S, const gp_Pnt & P, const Standard_Real Tol);

		/****************** PerformInfinitePoint ******************/
		/**** md5 signature: b38a28b443037933c522597a4245e901 ****/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "Classify an infinite point with the tolerance tol on the solid s.

Parameters
----------
S: BRepClass3d_SolidExplorer
Tol: float

Returns
-------
None
") PerformInfinitePoint;
		void PerformInfinitePoint(BRepClass3d_SolidExplorer & S, const Standard_Real Tol);

		/****************** Rejected ******************/
		/**** md5 signature: 56d604911041dd9f442bde612c88e4cd ****/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Returns true if the classification has been computed by rejection. the state is then out.

Returns
-------
bool
") Rejected;
		Standard_Boolean Rejected();

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the result of the classification.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

};


%extend BRepClass3d_SClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepClass3d_SolidExplorer *
**********************************/
class BRepClass3d_SolidExplorer {
	public:
		/****************** BRepClass3d_SolidExplorer ******************/
		/**** md5 signature: 2cb6e9ade85fff9fe417a5fe5c1853ef ****/
		%feature("compactdefaultargs") BRepClass3d_SolidExplorer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer();

		/****************** BRepClass3d_SolidExplorer ******************/
		/**** md5 signature: 4fbcac149406b40fbabba612a552e1fd ****/
		%feature("compactdefaultargs") BRepClass3d_SolidExplorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer(const TopoDS_Shape & S);

		/****************** Box ******************/
		/**** md5 signature: 7c4ea237507e51916495e768089f878e ****/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "No available documentation.

Returns
-------
Bnd_Box
") Box;
		const Bnd_Box & Box();

		/****************** CurrentFace ******************/
		/**** md5 signature: 88a3d5d94862043bde89d78000693450 ****/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "Returns the current face.

Returns
-------
TopoDS_Face
") CurrentFace;
		TopoDS_Face CurrentFace();

		/****************** CurrentShell ******************/
		/**** md5 signature: 16e51d9904504dd5dccd12b1a05b6190 ****/
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "Returns the current shell.

Returns
-------
TopoDS_Shell
") CurrentShell;
		TopoDS_Shell CurrentShell();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** DumpSegment ******************/
		/**** md5 signature: 956e65b65651fa5abd6d4e99a756a224 ****/
		%feature("compactdefaultargs") DumpSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
L: gp_Lin
Par: float
S: TopAbs_State

Returns
-------
None
") DumpSegment;
		virtual void DumpSegment(const gp_Pnt & P, const gp_Lin & L, const Standard_Real Par, const TopAbs_State S);

		/****************** FindAPointInTheFace ******************/
		/**** md5 signature: 017b38099efc4045694c9c0eec7a0305 ****/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "Compute a point p in the face f. param is a real in ]0,1[ and is used to initialise the algorithm. for different values , different points are returned.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Returns
-------
Param: float
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue);

		/****************** FindAPointInTheFace ******************/
		/**** md5 signature: cfa5d85e3e48ef9c6fa4b8a92d14a8e3 ****/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Returns
-------
u: float
v: float
Param: float
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FindAPointInTheFace ******************/
		/**** md5 signature: c28fe2e7cc35377cd66ce9290933d0a3 ****/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt
theVecD1U: gp_Vec
theVecD1V: gp_Vec

Returns
-------
u: float
v: float
Param: float
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Vec & theVecD1U, gp_Vec & theVecD1V);

		/****************** FindAPointInTheFace ******************/
		/**** md5 signature: 6c69107d08aa717df4761c1ae3a12191 ****/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Returns
-------
u: float
v: float
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FindAPointInTheFace ******************/
		/**** md5 signature: 947dd7c60afdf4e19b5af7c8c915c5a4 ****/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Returns
-------
bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P);

		/****************** FindAPointInTheFace ******************/
		/**** md5 signature: 1a53cc75214db16eaf466520aec6f0cf ****/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
u: float
v: float
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetFaceSegmentIndex ******************/
		/**** md5 signature: 83baeb3358902c7f4be1cb4a7cc78576 ****/
		%feature("compactdefaultargs") GetFaceSegmentIndex;
		%feature("autodoc", "Returns the index of face for which last segment is calculated.

Returns
-------
int
") GetFaceSegmentIndex;
		Standard_Integer GetFaceSegmentIndex();

		/****************** GetMapEV ******************/
		/**** md5 signature: 9321b6d327f7742e505f8eef3f9d8710 ****/
		%feature("compactdefaultargs") GetMapEV;
		%feature("autodoc", "Return edge/vertices map for current shape.

Returns
-------
TopTools_IndexedMapOfShape
") GetMapEV;
		const TopTools_IndexedMapOfShape & GetMapEV();

		/****************** GetShape ******************/
		/**** md5 signature: 68adf76e3cbb4c2e8340f398e62eb4da ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** GetTree ******************/
		/**** md5 signature: 8b49ac1118352d12ae778510be4c79fc ****/
		%feature("compactdefaultargs") GetTree;
		%feature("autodoc", "Return ub-tree instance which is used for edge / vertex checks.

Returns
-------
BRepClass3d_BndBoxTree
") GetTree;
		const BRepClass3d_BndBoxTree & GetTree();

		/****************** InitFace ******************/
		/**** md5 signature: 0e969d0225b2576ac55e2fb0e7a91460 ****/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Starts an exploration of the faces of the current shell.

Returns
-------
None
") InitFace;
		void InitFace();

		/****************** InitShape ******************/
		/**** md5 signature: d9bc37c7ee2a5ff0f8819cf45d1e822f ****/
		%feature("compactdefaultargs") InitShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") InitShape;
		void InitShape(const TopoDS_Shape & S);

		/****************** InitShell ******************/
		/**** md5 signature: da47ddbaca584bd5639e7c69797b28f8 ****/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "Starts an exploration of the shells.

Returns
-------
None
") InitShell;
		void InitShell();

		/****************** Intersector ******************/
		/**** md5 signature: 4031f4a71f4a73a8fa5ed1228f085e89 ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
IntCurvesFace_Intersector
") Intersector;
		IntCurvesFace_Intersector & Intersector(const TopoDS_Face & F);

		/****************** MoreFace ******************/
		/**** md5 signature: 9ce280b3ff0f94e82bd4ccb635ad91a7 ****/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Returns true if current face in current shell.

Returns
-------
bool
") MoreFace;
		Standard_Boolean MoreFace();

		/****************** MoreShell ******************/
		/**** md5 signature: 9123faff7480a9cd91e7d3a7625f4cdb ****/
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "Returns true if there is a current shell.

Returns
-------
bool
") MoreShell;
		Standard_Boolean MoreShell();

		/****************** NextFace ******************/
		/**** md5 signature: 33ae62d7d15ec80966f0219be1a267db ****/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Sets the explorer to the next face of the current shell.

Returns
-------
None
") NextFace;
		void NextFace();

		/****************** NextShell ******************/
		/**** md5 signature: acf25ab192bbd1382fada471f35632f3 ****/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "Sets the explorer to the next shell.

Returns
-------
None
") NextShell;
		void NextShell();

		/****************** OtherSegment ******************/
		/**** md5 signature: 8a68c80fe5592baef8f2dc32aae030e8 ****/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "Returns in <l>, <par> a segment having at least one intersection with the shape boundary to compute intersections. //! the first call to this method returns a line which point to a point of the first face of the shape. the second call provide a line to the second face and so on.

Parameters
----------
P: gp_Pnt
L: gp_Lin

Returns
-------
Par: float
") OtherSegment;
		Standard_Integer OtherSegment(const gp_Pnt & P, gp_Lin & L, Standard_Real &OutValue);

		/****************** PointInTheFace ******************/
		/**** md5 signature: 02e05914677a68ed8d75572f3a199575 ****/
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Returns
-------
u: float
v: float
Param: float
Index: int
") PointInTheFace;
		Standard_Boolean PointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****************** PointInTheFace ******************/
		/**** md5 signature: 2409cfffa35ee7af69816ed64caca69e ****/
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt
surf: BRepAdaptor_HSurface
u1: float
v1: float
u2: float
v2: float

Returns
-------
u: float
v: float
Param: float
Index: int
") PointInTheFace;
		Standard_Boolean PointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, const opencascade::handle<BRepAdaptor_HSurface> & surf, const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2);

		/****************** PointInTheFace ******************/
		/**** md5 signature: ab70975c9887205d9944a58eab4d39a9 ****/
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "<index> gives point index to search from and returns point index of succeseful search.

Parameters
----------
F: TopoDS_Face
P: gp_Pnt
surf: BRepAdaptor_HSurface
u1: float
v1: float
u2: float
v2: float
theVecD1U: gp_Vec
theVecD1V: gp_Vec

Returns
-------
u: float
v: float
Param: float
Index: int
") PointInTheFace;
		Standard_Boolean PointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, const opencascade::handle<BRepAdaptor_HSurface> & surf, const Standard_Real u1, const Standard_Real v1, const Standard_Real u2, const Standard_Real v2, gp_Vec & theVecD1U, gp_Vec & theVecD1V);

		/****************** Reject ******************/
		/**** md5 signature: 51de68ac10b383926f08d5ff11ad46ef ****/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "Should return true if p outside of bounding vol. of the shape.

Parameters
----------
P: gp_Pnt

Returns
-------
bool
") Reject;
		virtual Standard_Boolean Reject(const gp_Pnt & P);

		/****************** RejectFace ******************/
		/**** md5 signature: ac0d5a52c1e8c11624a4126529ce95a1 ****/
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "Returns true if the face is rejected.

Parameters
----------
L: gp_Lin

Returns
-------
bool
") RejectFace;
		virtual Standard_Boolean RejectFace(const gp_Lin & L);

		/****************** RejectShell ******************/
		/**** md5 signature: 2e32cb4f65a91d1adc50db91830d6b88 ****/
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "Returns true if the shell is rejected.

Parameters
----------
L: gp_Lin

Returns
-------
bool
") RejectShell;
		virtual Standard_Boolean RejectShell(const gp_Lin & L);

		/****************** Segment ******************/
		/**** md5 signature: 65c1df49fa25b2d5c8218cf933983a20 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns in <l>, <par> a segment having at least one intersection with the shape boundary to compute intersections.

Parameters
----------
P: gp_Pnt
L: gp_Lin

Returns
-------
Par: float
") Segment;
		Standard_Integer Segment(const gp_Pnt & P, gp_Lin & L, Standard_Real &OutValue);

};


%extend BRepClass3d_SolidExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepClass3d_SolidPassiveClassifier *
*******************************************/
class BRepClass3d_SolidPassiveClassifier {
	public:
		/****************** BRepClass3d_SolidPassiveClassifier ******************/
		/**** md5 signature: 753c34115a953d0d1d184f6dbce546d6 ****/
		%feature("compactdefaultargs") BRepClass3d_SolidPassiveClassifier;
		%feature("autodoc", "Creates an undefined classifier.

Returns
-------
None
") BRepClass3d_SolidPassiveClassifier;
		 BRepClass3d_SolidPassiveClassifier();

		/****************** Compare ******************/
		/**** md5 signature: b56f046d5b1a7e24fd1a5f6c7f16401a ****/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Updates the classification process with the face <f> from the boundary.

Parameters
----------
F: TopoDS_Face
Or: TopAbs_Orientation

Returns
-------
None
") Compare;
		void Compare(const TopoDS_Face & F, const TopAbs_Orientation Or);

		/****************** HasIntersection ******************/
		/**** md5 signature: 94c3b976d93201cedbd7868f3cc308ec ****/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "Returns true if an intersection is computed.

Returns
-------
bool
") HasIntersection;
		Standard_Boolean HasIntersection();

		/****************** Intersector ******************/
		/**** md5 signature: 89ae7485d04a83ad1143250d9364ad9b ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Returns the intersecting algorithm.

Returns
-------
BRepClass3d_Intersector3d
") Intersector;
		BRepClass3d_Intersector3d & Intersector();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the current value of the parameter.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reset ******************/
		/**** md5 signature: e6b050ae118cd9e842409d971e4257e9 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Starts a classification process. the point to classify is the origin of the line <l>. <p> is the original length of the segment on <l> used to compute intersections. <tol> is the tolerance attached to the intersections.

Parameters
----------
L: gp_Lin
P: float
Tol: float

Returns
-------
None
") Reset;
		void Reset(const gp_Lin & L, const Standard_Real P, const Standard_Real Tol);

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the current state of the point.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

};


%extend BRepClass3d_SolidPassiveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepClass3d_BndBoxTreeSelectorLine *
*******************************************/
/********************************************
* class BRepClass3d_BndBoxTreeSelectorPoint *
********************************************/
/************************************
* class BRepClass3d_SolidClassifier *
************************************/
class BRepClass3d_SolidClassifier : public BRepClass3d_SClassifier {
	public:
		/****************** BRepClass3d_SolidClassifier ******************/
		/**** md5 signature: 8dbf40d196a6056c1a2b07197983a030 ****/
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier();

		/****************** BRepClass3d_SolidClassifier ******************/
		/**** md5 signature: af852678708e27ec7563b8a0e065a3cf ****/
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "Constructor from a shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier(const TopoDS_Shape & S);

		/****************** BRepClass3d_SolidClassifier ******************/
		/**** md5 signature: 1931c86413bceb6f0e5cc65c93485f4e ****/
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "Constructor to classify the point p with the tolerance tol on the solid s.

Parameters
----------
S: TopoDS_Shape
P: gp_Pnt
Tol: float

Returns
-------
None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier(const TopoDS_Shape & S, const gp_Pnt & P, const Standard_Real Tol);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Load ******************/
		/**** md5 signature: e8cac8ea20706569fcef43af3e2c23ea ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Load;
		void Load(const TopoDS_Shape & S);

		/****************** Perform ******************/
		/**** md5 signature: 8c78cd2f3c59b3c38b2c86a830e5298b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Classify the point p with the tolerance tol on the solid s.

Parameters
----------
P: gp_Pnt
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt & P, const Standard_Real Tol);

		/****************** PerformInfinitePoint ******************/
		/**** md5 signature: 8af7800b756e0bb955df7574967e9884 ****/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "Classify an infinite point with the tolerance tol on the solid s. useful for compute the orientation of a solid.

Parameters
----------
Tol: float

Returns
-------
None
") PerformInfinitePoint;
		void PerformInfinitePoint(const Standard_Real Tol);

};


%extend BRepClass3d_SolidClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepClass3d_BndBoxTreeSelectorLine:
	pass

@classnotwrapped
class BRepClass3d_BndBoxTreeSelectorPoint:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
