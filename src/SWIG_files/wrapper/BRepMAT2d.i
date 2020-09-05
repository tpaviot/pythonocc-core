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
%define BREPMAT2DDOCSTRING
"BRepMAT2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepmat2d.html"
%enddef
%module (package="OCC.Core", docstring=BREPMAT2DDOCSTRING) BRepMAT2d


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
#include<BRepMAT2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<MAT_module.hxx>
#include<GeomAbs_module.hxx>
#include<Bisector_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<TColGeom2d_module.hxx>
#include<TColStd_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import MAT.i
%import GeomAbs.i
%import Bisector.i
%import Geom2d.i
%import gp.i
%import TopoDS.i
%import TColGeom2d.i
%import TColStd.i

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
%template(BRepMAT2d_DataMapOfBasicEltShape) NCollection_DataMap<opencascade::handle<MAT_BasicElt>,TopoDS_Shape,TColStd_MapTransientHasher>;
%template(BRepMAT2d_DataMapOfShapeSequenceOfBasicElt) NCollection_DataMap<TopoDS_Shape,MAT_SequenceOfBasicElt,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<MAT_BasicElt>, TopoDS_Shape, TColStd_MapTransientHasher>::Iterator BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
typedef NCollection_DataMap<TopoDS_Shape, MAT_SequenceOfBasicElt, TopTools_ShapeMapHasher>::Iterator BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
typedef NCollection_DataMap<opencascade::handle<MAT_BasicElt>, TopoDS_Shape, TColStd_MapTransientHasher> BRepMAT2d_DataMapOfBasicEltShape;
typedef NCollection_DataMap<TopoDS_Shape, MAT_SequenceOfBasicElt, TopTools_ShapeMapHasher> BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
/* end typedefs declaration */

/*********************************
* class BRepMAT2d_BisectingLocus *
*********************************/
class BRepMAT2d_BisectingLocus {
	public:
		/****************** BRepMAT2d_BisectingLocus ******************/
		/**** md5 signature: 1c9f589ed2119f39637c75c4919e8aaa ****/
		%feature("compactdefaultargs") BRepMAT2d_BisectingLocus;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepMAT2d_BisectingLocus;
		 BRepMAT2d_BisectingLocus();

		/****************** BasicElt ******************/
		/**** md5 signature: 3d0067523ed5e0250793c967c6e6f2f8 ****/
		%feature("compactdefaultargs") BasicElt;
		%feature("autodoc", "Returns the basicelts located at the position <index> on the contour designed by <indline>. remark: the basicelts on a contour are sorted.

Parameters
----------
IndLine: int
Index: int

Returns
-------
opencascade::handle<MAT_BasicElt>
") BasicElt;
		opencascade::handle<MAT_BasicElt> BasicElt(const Standard_Integer IndLine, const Standard_Integer Index);

		/****************** Compute ******************/
		/**** md5 signature: b86912005db7017db1b8639215ff1b3f ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computation of the bisector_locus in a set of lines defined in <anexplo>. the bisecting locus are computed on the side <aside> from the line <lineindex> in <anexplo>.

Parameters
----------
anExplo: BRepMAT2d_Explorer
LineIndex: int,optional
	default value is 1
aSide: MAT_Side,optional
	default value is MAT_Left
aJoinType: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") Compute;
		void Compute(BRepMAT2d_Explorer & anExplo, const Standard_Integer LineIndex = 1, const MAT_Side aSide = MAT_Left, const GeomAbs_JoinType aJoinType = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** GeomBis ******************/
		/**** md5 signature: fc928757a87c93f00c8941a3d64abfe5 ****/
		%feature("compactdefaultargs") GeomBis;
		%feature("autodoc", "Returns the geometry of type <bissec> linked to the arc <arc>. <reverse> is false when the firstnode of <anarc> correspond to the first point of geometry.

Parameters
----------
anArc: MAT_Arc

Returns
-------
Reverse: bool
") GeomBis;
		Bisector_Bisec GeomBis(const opencascade::handle<MAT_Arc> & anArc, Standard_Boolean &OutValue);

		/****************** GeomElt ******************/
		/**** md5 signature: 3094b05485b558a0b6ada2e506bda25a ****/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "Returns the geometry linked to the <basicelt>.

Parameters
----------
aBasicElt: MAT_BasicElt

Returns
-------
opencascade::handle<Geom2d_Geometry>
") GeomElt;
		opencascade::handle<Geom2d_Geometry> GeomElt(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****************** GeomElt ******************/
		/**** md5 signature: f5f102fded3cad27f433e1250d746e27 ****/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "Returns the geometry of type <gp> linked to the <node>.

Parameters
----------
aNode: MAT_Node

Returns
-------
gp_Pnt2d
") GeomElt;
		gp_Pnt2d GeomElt(const opencascade::handle<MAT_Node> & aNode);

		/****************** Graph ******************/
		/**** md5 signature: 6513aaaee674215ea3a22bbe7f65bd68 ****/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns <thegraph> of <self>.

Returns
-------
opencascade::handle<MAT_Graph>
") Graph;
		opencascade::handle<MAT_Graph> Graph();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if compute has succeeded.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NumberOfContours ******************/
		/**** md5 signature: 466b646e5536f1219bac12e9b35bbe15 ****/
		%feature("compactdefaultargs") NumberOfContours;
		%feature("autodoc", "Returns the number of contours.

Returns
-------
int
") NumberOfContours;
		Standard_Integer NumberOfContours();

		/****************** NumberOfElts ******************/
		/**** md5 signature: 99801e5526ee454661c76118ded5fb34 ****/
		%feature("compactdefaultargs") NumberOfElts;
		%feature("autodoc", "Returns the number of basicelts on the line <indline>.

Parameters
----------
IndLine: int

Returns
-------
int
") NumberOfElts;
		Standard_Integer NumberOfElts(const Standard_Integer IndLine);

		/****************** NumberOfSections ******************/
		/**** md5 signature: fb6c2648dc8f1b7e426fa3af236d1d9a ****/
		%feature("compactdefaultargs") NumberOfSections;
		%feature("autodoc", "Returns the number of sections of a curve. this curve is the indexth curve in the indlineth contour given by anexplo.

Parameters
----------
IndLine: int
Index: int

Returns
-------
int
") NumberOfSections;
		Standard_Integer NumberOfSections(const Standard_Integer IndLine, const Standard_Integer Index);

};


%extend BRepMAT2d_BisectingLocus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepMAT2d_Explorer *
***************************/
class BRepMAT2d_Explorer {
	public:
		/****************** BRepMAT2d_Explorer ******************/
		/**** md5 signature: fa74fa874c29b3a1144a1efb889c4543 ****/
		%feature("compactdefaultargs") BRepMAT2d_Explorer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer();

		/****************** BRepMAT2d_Explorer ******************/
		/**** md5 signature: 54cc4fcdafcf467ff86c79d6c6b71792 ****/
		%feature("compactdefaultargs") BRepMAT2d_Explorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face

Returns
-------
None
") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer(const TopoDS_Face & aFace);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear the contents of <self>.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Contour ******************/
		/**** md5 signature: 0abd7c353f6b45daa5e0b5bd0f6b7766 ****/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexContour: int

Returns
-------
TColGeom2d_SequenceOfCurve
") Contour;
		const TColGeom2d_SequenceOfCurve & Contour(const Standard_Integer IndexContour);

		/****************** GetIsClosed ******************/
		/**** md5 signature: fe2549f56b3cb80b5c2da5e5e50f62a0 ****/
		%feature("compactdefaultargs") GetIsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_SequenceOfBoolean
") GetIsClosed;
		const TColStd_SequenceOfBoolean & GetIsClosed();

		/****************** Init ******************/
		/**** md5 signature: 488a24dcd1db8a348e37bafc2ae6f6b7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialisation of an iterator on the curves of the contour number <indexcontour>.

Parameters
----------
IndexContour: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer IndexContour);

		/****************** IsModified ******************/
		/**** md5 signature: 54da3346406078b7c7a1e3bef5b4bfbf ****/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Shape & aShape);

		/****************** ModifiedShape ******************/
		/**** md5 signature: 4cc3fd5d5aff0bcce310ec88a2345639 ****/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "If the shape is not modified, returns the shape itself.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		TopoDS_Shape ModifiedShape(const TopoDS_Shape & aShape);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return false if there is no more curves on the contour initialised by the method init.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next curve of the current contour.

Returns
-------
None
") Next;
		void Next();

		/****************** NumberOfContours ******************/
		/**** md5 signature: 466b646e5536f1219bac12e9b35bbe15 ****/
		%feature("compactdefaultargs") NumberOfContours;
		%feature("autodoc", "Returns the number of contours.

Returns
-------
int
") NumberOfContours;
		Standard_Integer NumberOfContours();

		/****************** NumberOfCurves ******************/
		/**** md5 signature: bbc17284909b7a04d80469d6df5d679d ****/
		%feature("compactdefaultargs") NumberOfCurves;
		%feature("autodoc", "Returns the number of curves in the contour number <indexcontour>.

Parameters
----------
IndexContour: int

Returns
-------
int
") NumberOfCurves;
		Standard_Integer NumberOfCurves(const Standard_Integer IndexContour);

		/****************** Perform ******************/
		/**** md5 signature: c84f1304d8c6b6741bee2823ebd22589 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Face & aFace);

		/****************** Shape ******************/
		/**** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Value ******************/
		/**** md5 signature: 5ee7c7b75ee4ebc058a6e98f3b655bda ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current curve on the current contour.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Value;
		opencascade::handle<Geom2d_Curve> Value();

};


%extend BRepMAT2d_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepMAT2d_LinkTopoBilo *
*******************************/
class BRepMAT2d_LinkTopoBilo {
	public:
		/****************** BRepMAT2d_LinkTopoBilo ******************/
		/**** md5 signature: 1cd1ab766f92fced8a2bdbf812bbef03 ****/
		%feature("compactdefaultargs") BRepMAT2d_LinkTopoBilo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo();

		/****************** BRepMAT2d_LinkTopoBilo ******************/
		/**** md5 signature: 2dc1f521964433428cc7c428c56642c2 ****/
		%feature("compactdefaultargs") BRepMAT2d_LinkTopoBilo;
		%feature("autodoc", "Constructs the links between s and bilo. //! raises if <s> is not a face.

Parameters
----------
Explo: BRepMAT2d_Explorer
BiLo: BRepMAT2d_BisectingLocus

Returns
-------
None
") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo(const BRepMAT2d_Explorer & Explo, const BRepMAT2d_BisectingLocus & BiLo);

		/****************** GeneratingShape ******************/
		/**** md5 signature: fd0c19244afd2eedb4578380434efe72 ****/
		%feature("compactdefaultargs") GeneratingShape;
		%feature("autodoc", "Returns the shape linked to <abe>.

Parameters
----------
aBE: MAT_BasicElt

Returns
-------
TopoDS_Shape
") GeneratingShape;
		TopoDS_Shape GeneratingShape(const opencascade::handle<MAT_BasicElt> & aBE);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialise the iterator on <s> <s> is an edge or a vertex of the initial wire or face. raises if <s> is not an edge or a vertex.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** More ******************/
		/**** md5 signature: f2144011648ae849666b28430a27a0ea ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current basicelt.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Proceed to the next basicelt.

Returns
-------
None
") Next;
		void Next();

		/****************** Perform ******************/
		/**** md5 signature: e58f0cdf711f332828907215f894ed67 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Constructs the links between s and bilo. //! raises if <s> is not a face or a wire.

Parameters
----------
Explo: BRepMAT2d_Explorer
BiLo: BRepMAT2d_BisectingLocus

Returns
-------
None
") Perform;
		void Perform(const BRepMAT2d_Explorer & Explo, const BRepMAT2d_BisectingLocus & BiLo);

		/****************** Value ******************/
		/**** md5 signature: 2aa6c89e250a68722ac2342ac35acc59 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current basicelt.

Returns
-------
opencascade::handle<MAT_BasicElt>
") Value;
		opencascade::handle<MAT_BasicElt> Value();

};


%extend BRepMAT2d_LinkTopoBilo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
