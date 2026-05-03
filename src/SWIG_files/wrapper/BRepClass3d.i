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
%define BREPCLASS3DDOCSTRING
"BRepClass3d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepclass3d.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepClass3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<IntCurveSurface_module.hxx>
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
%import IntCurvesFace.i
%import BRepAdaptor.i

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
%ignore NCollection_DataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepClass3d_MapOfInter) NCollection_DataMap<TopoDS_Shape,void*,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, void *, TopTools_ShapeMapHasher>::Iterator BRepClass3d_DataMapIteratorOfMapOfInter;
typedef NCollection_DataMap<TopoDS_Shape, void *, TopTools_ShapeMapHasher> BRepClass3d_MapOfInter;
/* end typedefs declaration */

/********************
* class BRepClass3d *
********************/
%rename(brepclass3d) BRepClass3d;
class BRepClass3d {
	public:
		/****** BRepClass3d::OuterShell ******/
		/****** md5 signature: f7b79b3e5e2fdf723525467fdb7a08ef ******/
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Solid

Return
-------
TopoDS_Shell

Description
-----------
Returns the outer most shell of <S>. Returns a Null shell if <S> has no outer shell. If <S> has only one shell, then it will return, without checking orientation.
") OuterShell;
		static TopoDS_Shell OuterShell(const TopoDS_Solid & S);

};


%extend BRepClass3d {
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
/**********************************
* class BRepClass3d_Intersector3d *
**********************************/
class BRepClass3d_Intersector3d {
	public:
		/****** BRepClass3d_Intersector3d::BRepClass3d_Intersector3d ******/
		/****** md5 signature: 5313248e9a4d9e528b75267702000c25 ******/
		%feature("compactdefaultargs") BRepClass3d_Intersector3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepClass3d_Intersector3d;
		 BRepClass3d_Intersector3d();

		/****** BRepClass3d_Intersector3d::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the significant face used to determine the intersection.
") Face;
		const TopoDS_Face Face();

		/****** BRepClass3d_Intersector3d::HasAPoint ******/
		/****** md5 signature: cca0f013f007fab2f7dc577f263a74e6 ******/
		%feature("compactdefaultargs") HasAPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True is returned if a point has been found.
") HasAPoint;
		bool HasAPoint();

		/****** BRepClass3d_Intersector3d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True is returned when the intersection have been computed.
") IsDone;
		bool IsDone();

		/****** BRepClass3d_Intersector3d::Perform ******/
		/****** md5 signature: 3bd67b609d9c7057653b601e812ae084 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Prm: double
Tol: double
F: TopoDS_Face

Return
-------
None

Description
-----------
Perform the intersection between the segment L(0) ... L(Prm) and the Shape <Sh>. //! Only the point with the smallest parameter on the line is returned. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol).
") Perform;
		void Perform(const gp_Lin & L, const double Prm, const double Tol, const TopoDS_Face & F);

		/****** BRepClass3d_Intersector3d::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the geometric point of the intersection between the line and the surface.
") Pnt;
		const gp_Pnt Pnt();

		/****** BRepClass3d_Intersector3d::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boundary of the face).
") State;
		TopAbs_State State();

		/****** BRepClass3d_Intersector3d::Transition ******/
		/****** md5 signature: bd528dc9c78a60a5b26409b8cf4f3afe ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
IntCurveSurface_TransitionOnCurve

Description
-----------
Returns the transition of the line on the surface.
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****** BRepClass3d_Intersector3d::UParameter ******/
		/****** md5 signature: e3619e0fc934b8845eca6d78e91beefc ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the U parameter of the intersection point on the surface.
") UParameter;
		double UParameter();

		/****** BRepClass3d_Intersector3d::VParameter ******/
		/****** md5 signature: 51f6dfa4cbe7f690de623144e70e17c4 ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the V parameter of the intersection point on the surface.
") VParameter;
		double VParameter();

		/****** BRepClass3d_Intersector3d::WParameter ******/
		/****** md5 signature: 59c3ff2344090434605e32de635a5287 ******/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the intersection point on the line.
") WParameter;
		double WParameter();

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
		/****** BRepClass3d_SClassifier::BRepClass3d_SClassifier ******/
		/****** md5 signature: 0e43e1bcc9eb18eda4d1709f9787e45f ******/
		%feature("compactdefaultargs") BRepClass3d_SClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier();

		/****** BRepClass3d_SClassifier::BRepClass3d_SClassifier ******/
		/****** md5 signature: 38993000b5422f7197956d8a0fa3f8f4 ******/
		%feature("compactdefaultargs") BRepClass3d_SClassifier;
		%feature("autodoc", "
Parameters
----------
S: BRepClass3d_SolidExplorer
P: gp_Pnt
Tol: double

Return
-------
None

Description
-----------
Constructor to classify the point P with the tolerance Tol on the solid S.
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier(BRepClass3d_SolidExplorer & S, const gp_Pnt & P, const double Tol);

		/****** BRepClass3d_SClassifier::Face ******/
		/****** md5 signature: 64c75db1e9c1285068e9dd474618f74f ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the face used to determine the classification. When the state is ON, this is the face containing the point. //! When Rejected() returns True, Face() has no signification.
") Face;
		TopoDS_Face Face();

		/****** BRepClass3d_SClassifier::IsOnAFace ******/
		/****** md5 signature: b28cbc18afb8794f9f200d1b47f01f5a ******/
		%feature("compactdefaultargs") IsOnAFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the point is a point of a face.
") IsOnAFace;
		bool IsOnAFace();

		/****** BRepClass3d_SClassifier::Perform ******/
		/****** md5 signature: e5086db1d44784995ba9001ba1c5d572 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S: BRepClass3d_SolidExplorer
P: gp_Pnt
Tol: double

Return
-------
None

Description
-----------
Classify the point P with the tolerance Tol on the solid S.
") Perform;
		void Perform(BRepClass3d_SolidExplorer & S, const gp_Pnt & P, const double Tol);

		/****** BRepClass3d_SClassifier::PerformInfinitePoint ******/
		/****** md5 signature: 22676fb474f57da1bea62303991ceedb ******/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "
Parameters
----------
S: BRepClass3d_SolidExplorer
Tol: double

Return
-------
None

Description
-----------
Classify an infinite point with the tolerance Tol on the solid S.
") PerformInfinitePoint;
		void PerformInfinitePoint(BRepClass3d_SolidExplorer & S, const double Tol);

		/****** BRepClass3d_SClassifier::Rejected ******/
		/****** md5 signature: 170633d70c32f054a8586e6e62bde7f9 ******/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the classification has been computed by rejection. The State is then OUT.
") Rejected;
		bool Rejected();

		/****** BRepClass3d_SClassifier::State ******/
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
		/****** BRepClass3d_SolidExplorer::BRepClass3d_SolidExplorer ******/
		/****** md5 signature: 2cb6e9ade85fff9fe417a5fe5c1853ef ******/
		%feature("compactdefaultargs") BRepClass3d_SolidExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer();

		/****** BRepClass3d_SolidExplorer::BRepClass3d_SolidExplorer ******/
		/****** md5 signature: 4fbcac149406b40fbabba612a552e1fd ******/
		%feature("compactdefaultargs") BRepClass3d_SolidExplorer;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer(const TopoDS_Shape & S);

		/****** BRepClass3d_SolidExplorer::CurrentFace ******/
		/****** md5 signature: 88a3d5d94862043bde89d78000693450 ******/
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the current face.
") CurrentFace;
		TopoDS_Face CurrentFace();

		/****** BRepClass3d_SolidExplorer::CurrentShell ******/
		/****** md5 signature: 16e51d9904504dd5dccd12b1a05b6190 ******/
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the current shell.
") CurrentShell;
		TopoDS_Shell CurrentShell();

		/****** BRepClass3d_SolidExplorer::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** BRepClass3d_SolidExplorer::DumpSegment ******/
		/****** md5 signature: 52c17dbb393a85e4f9e010f45e4a8d4c ******/
		%feature("compactdefaultargs") DumpSegment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
L: gp_Lin
Par: double
S: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") DumpSegment;
		virtual void DumpSegment(const gp_Pnt & P, const gp_Lin & L, const double Par, const TopAbs_State S);

		/****** BRepClass3d_SolidExplorer::FindAPointInTheFace ******/
		/****** md5 signature: 4433b15f32d58e130073f988237dc963 ******/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Return
-------
Param: double

Description
-----------
compute a point P in the face F. Param is a Real in ]0,1[ and is used to initialise the algorithm. For different values , different points are returned.
") FindAPointInTheFace;
		static bool FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue);

		/****** BRepClass3d_SolidExplorer::FindAPointInTheFace ******/
		/****** md5 signature: d83144fc701f8dcf214213936f8fdfa8 ******/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Return
-------
u: double
v: double
Param: double

Description
-----------
No available documentation.
") FindAPointInTheFace;
		static bool FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepClass3d_SolidExplorer::FindAPointInTheFace ******/
		/****** md5 signature: 8c8e4fb639c2cb7f546689a5a521bdca ******/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt
theVecD1U: gp_Vec
theVecD1V: gp_Vec

Return
-------
u: double
v: double
Param: double

Description
-----------
No available documentation.
") FindAPointInTheFace;
		static bool FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Vec & theVecD1U, gp_Vec & theVecD1V);

		/****** BRepClass3d_SolidExplorer::FindAPointInTheFace ******/
		/****** md5 signature: 6731ca7faa1d91092d5a6a7e4c3ad41d ******/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Return
-------
u: double
v: double

Description
-----------
No available documentation.
") FindAPointInTheFace;
		static bool FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepClass3d_SolidExplorer::FindAPointInTheFace ******/
		/****** md5 signature: 9780e816b690906105daff1db1229600 ******/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Return
-------
bool

Description
-----------
No available documentation.
") FindAPointInTheFace;
		static bool FindAPointInTheFace(const TopoDS_Face & F, gp_Pnt & P);

		/****** BRepClass3d_SolidExplorer::FindAPointInTheFace ******/
		/****** md5 signature: d3ff359fb93356fa7e692e5003e24e76 ******/
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
u: double
v: double

Description
-----------
No available documentation.
") FindAPointInTheFace;
		static bool FindAPointInTheFace(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepClass3d_SolidExplorer::GetFaceSegmentIndex ******/
		/****** md5 signature: 3b953829edada255838191a5e3131463 ******/
		%feature("compactdefaultargs") GetFaceSegmentIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of face for which last segment is calculated.
") GetFaceSegmentIndex;
		int GetFaceSegmentIndex();

		/****** BRepClass3d_SolidExplorer::GetMapEV ******/
		/****** md5 signature: 890c66ca86a3edb9ce58171c10158a4c ******/
		%feature("compactdefaultargs") GetMapEV;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher>

Description
-----------
Return edge/vertices map for current shape.
") GetMapEV;
		const NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> GetMapEV();

		/****** BRepClass3d_SolidExplorer::GetShape ******/
		/****** md5 signature: 68adf76e3cbb4c2e8340f398e62eb4da ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") GetShape;
		const TopoDS_Shape GetShape();

		/****** BRepClass3d_SolidExplorer::GetTree ******/
		/****** md5 signature: c8bb8433ad31e60de7793ddeebdcc546 ******/
		%feature("compactdefaultargs") GetTree;
		%feature("autodoc", "Return
-------
NCollection_UBTree<int, Bnd_Box>

Description
-----------
Return UB-tree instance which is used for edge / vertex checks.
") GetTree;
		const NCollection_UBTree<int, Bnd_Box> & GetTree();

		/****** BRepClass3d_SolidExplorer::InitFace ******/
		/****** md5 signature: 0e969d0225b2576ac55e2fb0e7a91460 ******/
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts an exploration of the faces of the current shell.
") InitFace;
		void InitFace();

		/****** BRepClass3d_SolidExplorer::InitShape ******/
		/****** md5 signature: d9bc37c7ee2a5ff0f8819cf45d1e822f ******/
		%feature("compactdefaultargs") InitShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InitShape;
		void InitShape(const TopoDS_Shape & S);

		/****** BRepClass3d_SolidExplorer::InitShell ******/
		/****** md5 signature: da47ddbaca584bd5639e7c69797b28f8 ******/
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts an exploration of the shells.
") InitShell;
		void InitShell();

		/****** BRepClass3d_SolidExplorer::Intersector ******/
		/****** md5 signature: 4031f4a71f4a73a8fa5ed1228f085e89 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
IntCurvesFace_Intersector

Description
-----------
No available documentation.
") Intersector;
		IntCurvesFace_Intersector & Intersector(const TopoDS_Face & F);

		/****** BRepClass3d_SolidExplorer::MoreFace ******/
		/****** md5 signature: bff7dacb9d14d55afd6f709576086160 ******/
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if current face in current shell.
") MoreFace;
		bool MoreFace();

		/****** BRepClass3d_SolidExplorer::MoreShell ******/
		/****** md5 signature: c58d1a5522c7d62e59763f1b09775cef ******/
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current shell.
") MoreShell;
		bool MoreShell();

		/****** BRepClass3d_SolidExplorer::NextFace ******/
		/****** md5 signature: 33ae62d7d15ec80966f0219be1a267db ******/
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the explorer to the next Face of the current shell.
") NextFace;
		void NextFace();

		/****** BRepClass3d_SolidExplorer::NextShell ******/
		/****** md5 signature: acf25ab192bbd1382fada471f35632f3 ******/
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the explorer to the next shell.
") NextShell;
		void NextShell();

		/****** BRepClass3d_SolidExplorer::OtherSegment ******/
		/****** md5 signature: 16bcb019899390d39d81c01f90e1fd94 ******/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
L: gp_Lin

Return
-------
Par: double

Description
-----------
Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections. //! The First Call to this method returns a line which point to a point of the first face of the shape. The Second Call provide a line to the second face and so on.
") OtherSegment;
		int OtherSegment(const gp_Pnt & P, gp_Lin & L, Standard_Real &OutValue);

		/****** BRepClass3d_SolidExplorer::PointInTheFace ******/
		/****** md5 signature: ff361b95a6d279ee8d2e5706d26cff9c ******/
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt

Return
-------
u: double
v: double
Param: double
Index: int

Description
-----------
No available documentation.
") PointInTheFace;
		bool PointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue);

		/****** BRepClass3d_SolidExplorer::PointInTheFace ******/
		/****** md5 signature: 20fa21300e27d98c2aaa55a2869234f9 ******/
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt
surf: BRepAdaptor_Surface
u1: double
v1: double
u2: double
v2: double

Return
-------
u: double
v: double
Param: double
Index: int

Description
-----------
No available documentation.
") PointInTheFace;
		bool PointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, const opencascade::handle<BRepAdaptor_Surface> & surf, const double u1, const double v1, const double u2, const double v2);

		/****** BRepClass3d_SolidExplorer::PointInTheFace ******/
		/****** md5 signature: 5a81de59c0ccf0811d40cb8ee617ee9b ******/
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
P: gp_Pnt
surf: BRepAdaptor_Surface
u1: double
v1: double
u2: double
v2: double
theVecD1U: gp_Vec
theVecD1V: gp_Vec

Return
-------
u: double
v: double
Param: double
Index: int

Description
-----------
<Index> gives point index to search from and returns point index of succeseful search.
") PointInTheFace;
		bool PointInTheFace(const TopoDS_Face & F, gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Integer &OutValue, const opencascade::handle<BRepAdaptor_Surface> & surf, const double u1, const double v1, const double u2, const double v2, gp_Vec & theVecD1U, gp_Vec & theVecD1V);

		/****** BRepClass3d_SolidExplorer::Reject ******/
		/****** md5 signature: b74a227627229818e3e8d099c0aef25f ******/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
bool

Description
-----------
Should return True if P outside of bounding vol. of the shape.
") Reject;
		virtual bool Reject(const gp_Pnt & P);

		/****** BRepClass3d_SolidExplorer::RejectFace ******/
		/****** md5 signature: 98da817eb4679da2513ba97b76075d39 ******/
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
bool

Description
-----------
returns True if the face is rejected.
") RejectFace;
		virtual bool RejectFace(const gp_Lin & L);

		/****** BRepClass3d_SolidExplorer::RejectShell ******/
		/****** md5 signature: 09d46caa0e5b8cea2d34cdc07586e165 ******/
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
bool

Description
-----------
Returns True if the Shell is rejected.
") RejectShell;
		virtual bool RejectShell(const gp_Lin & L);

		/****** BRepClass3d_SolidExplorer::Segment ******/
		/****** md5 signature: f0f7cd8535fdf9cb77d45c13a440f7d6 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
L: gp_Lin

Return
-------
Par: double

Description
-----------
Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections.
") Segment;
		int Segment(const gp_Pnt & P, gp_Lin & L, Standard_Real &OutValue);

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
		/****** BRepClass3d_SolidPassiveClassifier::BRepClass3d_SolidPassiveClassifier ******/
		/****** md5 signature: 753c34115a953d0d1d184f6dbce546d6 ******/
		%feature("compactdefaultargs") BRepClass3d_SolidPassiveClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined classifier.
") BRepClass3d_SolidPassiveClassifier;
		 BRepClass3d_SolidPassiveClassifier();

		/****** BRepClass3d_SolidPassiveClassifier::Compare ******/
		/****** md5 signature: b56f046d5b1a7e24fd1a5f6c7f16401a ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
Updates the classification process with the face <F> from the boundary.
") Compare;
		void Compare(const TopoDS_Face & F, const TopAbs_Orientation Or);

		/****** BRepClass3d_SolidPassiveClassifier::HasIntersection ******/
		/****** md5 signature: 0056685440f56dba8f3b35f7970dc2c9 ******/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if an intersection is computed.
") HasIntersection;
		bool HasIntersection();

		/****** BRepClass3d_SolidPassiveClassifier::Intersector ******/
		/****** md5 signature: b339e86a1f3b2bdef697aa467bca345d ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
BRepClass3d_Intersector3d

Description
-----------
Returns the intersecting algorithm.
") Intersector;
		BRepClass3d_Intersector3d & Intersector();

		/****** BRepClass3d_SolidPassiveClassifier::Parameter ******/
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

		/****** BRepClass3d_SolidPassiveClassifier::Reset ******/
		/****** md5 signature: dc4bc894e5998df52ad80e01e196518d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: double
Tol: double

Return
-------
None

Description
-----------
Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the intersections.
") Reset;
		void Reset(const gp_Lin & L, const double P, const double Tol);

		/****** BRepClass3d_SolidPassiveClassifier::State ******/
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


%extend BRepClass3d_SolidPassiveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepClass3d_SolidClassifier *
************************************/
class BRepClass3d_SolidClassifier : public BRepClass3d_SClassifier {
	public:
		/****** BRepClass3d_SolidClassifier::BRepClass3d_SolidClassifier ******/
		/****** md5 signature: 8dbf40d196a6056c1a2b07197983a030 ******/
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier();

		/****** BRepClass3d_SolidClassifier::BRepClass3d_SolidClassifier ******/
		/****** md5 signature: af852678708e27ec7563b8a0e065a3cf ******/
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Constructor from a Shape.
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier(const TopoDS_Shape & S);

		/****** BRepClass3d_SolidClassifier::BRepClass3d_SolidClassifier ******/
		/****** md5 signature: 083e2c323652d960c9877bccd691cd10 ******/
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
P: gp_Pnt
Tol: double

Return
-------
None

Description
-----------
Constructor to classify the point P with the tolerance Tol on the solid S.
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier(const TopoDS_Shape & S, const gp_Pnt & P, const double Tol);

		/****** BRepClass3d_SolidClassifier::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** BRepClass3d_SolidClassifier::Load ******/
		/****** md5 signature: e8cac8ea20706569fcef43af3e2c23ea ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const TopoDS_Shape & S);

		/****** BRepClass3d_SolidClassifier::Perform ******/
		/****** md5 signature: 85dc123f9930bf790014cb34ac0ada7d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double

Return
-------
None

Description
-----------
Classify the point P with the tolerance Tol on the solid S.
") Perform;
		void Perform(const gp_Pnt & P, const double Tol);

		/****** BRepClass3d_SolidClassifier::PerformInfinitePoint ******/
		/****** md5 signature: e11e5d3dc778c5fb236fc5f7cb2e0867 ******/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Classify an infinite point with the tolerance Tol on the solid S. Useful for compute the orientation of a solid.
") PerformInfinitePoint;
		void PerformInfinitePoint(const double Tol);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def brepclass3d_OuterShell(*args):
	return brepclass3d.OuterShell(*args)

@deprecated
def BRepClass3d_SolidExplorer_FindAPointInTheFace(*args):
	return BRepClass3d_SolidExplorer.FindAPointInTheFace(*args)

@deprecated
def BRepClass3d_SolidExplorer_FindAPointInTheFace(*args):
	return BRepClass3d_SolidExplorer.FindAPointInTheFace(*args)

@deprecated
def BRepClass3d_SolidExplorer_FindAPointInTheFace(*args):
	return BRepClass3d_SolidExplorer.FindAPointInTheFace(*args)

@deprecated
def BRepClass3d_SolidExplorer_FindAPointInTheFace(*args):
	return BRepClass3d_SolidExplorer.FindAPointInTheFace(*args)

@deprecated
def BRepClass3d_SolidExplorer_FindAPointInTheFace(*args):
	return BRepClass3d_SolidExplorer.FindAPointInTheFace(*args)

@deprecated
def BRepClass3d_SolidExplorer_FindAPointInTheFace(*args):
	return BRepClass3d_SolidExplorer.FindAPointInTheFace(*args)

}
