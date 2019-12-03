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
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(BRepMAT2d_DataMapOfBasicEltShape) NCollection_DataMap <opencascade::handle <MAT_BasicElt>, TopoDS_Shape , TColStd_MapTransientHasher>;
%template(BRepMAT2d_DataMapOfShapeSequenceOfBasicElt) NCollection_DataMap <TopoDS_Shape , MAT_SequenceOfBasicElt , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <opencascade::handle <MAT_BasicElt>, TopoDS_Shape , TColStd_MapTransientHasher> BRepMAT2d_DataMapOfBasicEltShape;
typedef NCollection_DataMap <opencascade::handle <MAT_BasicElt>, TopoDS_Shape , TColStd_MapTransientHasher>::Iterator BRepMAT2d_DataMapIteratorOfDataMapOfBasicEltShape;
typedef NCollection_DataMap <TopoDS_Shape , MAT_SequenceOfBasicElt , TopTools_ShapeMapHasher> BRepMAT2d_DataMapOfShapeSequenceOfBasicElt;
typedef NCollection_DataMap <TopoDS_Shape , MAT_SequenceOfBasicElt , TopTools_ShapeMapHasher>::Iterator BRepMAT2d_DataMapIteratorOfDataMapOfShapeSequenceOfBasicElt;
/* end typedefs declaration */

/*********************************
* class BRepMAT2d_BisectingLocus *
*********************************/
%nodefaultctor BRepMAT2d_BisectingLocus;
class BRepMAT2d_BisectingLocus {
	public:
		/****************** BRepMAT2d_BisectingLocus ******************/
		%feature("compactdefaultargs") BRepMAT2d_BisectingLocus;
		%feature("autodoc", ":rtype: None") BRepMAT2d_BisectingLocus;
		 BRepMAT2d_BisectingLocus ();

		/****************** BasicElt ******************/
		%feature("compactdefaultargs") BasicElt;
		%feature("autodoc", "* Returns the BasicElts located at the position <Index> on the contour designed by <IndLine>. Remark: the BasicElts on a contour are sorted.
	:param IndLine:
	:type IndLine: int
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<MAT_BasicElt>") BasicElt;
		opencascade::handle<MAT_BasicElt> BasicElt (const Standard_Integer IndLine,const Standard_Integer Index);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Computation of the Bisector_Locus in a set of Lines defined in <anExplo>. The bisecting locus are computed on the side <aSide> from the line <LineIndex> in <anExplo>.
	:param anExplo:
	:type anExplo: BRepMAT2d_Explorer
	:param LineIndex: default value is 1
	:type LineIndex: int
	:param aSide: default value is MAT_Left
	:type aSide: MAT_Side
	:param aJoinType: default value is GeomAbs_Arc
	:type aJoinType: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None") Compute;
		void Compute (BRepMAT2d_Explorer & anExplo,const Standard_Integer LineIndex = 1,const MAT_Side aSide = MAT_Left,const GeomAbs_JoinType aJoinType = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);

		/****************** GeomBis ******************/
		%feature("compactdefaultargs") GeomBis;
		%feature("autodoc", "* Returns the geometry of type <Bissec> linked to the arc <ARC>. <Reverse> is False when the FirstNode of <anArc> correspond to the first point of geometry.
	:param anArc:
	:type anArc: MAT_Arc
	:param Reverse:
	:type Reverse: bool
	:rtype: Bisector_Bisec") GeomBis;
		Bisector_Bisec GeomBis (const opencascade::handle<MAT_Arc> & anArc,Standard_Boolean &OutValue);

		/****************** GeomElt ******************/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "* Returns the geometry linked to the <BasicElt>.
	:param aBasicElt:
	:type aBasicElt: MAT_BasicElt
	:rtype: opencascade::handle<Geom2d_Geometry>") GeomElt;
		opencascade::handle<Geom2d_Geometry> GeomElt (const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****************** GeomElt ******************/
		%feature("compactdefaultargs") GeomElt;
		%feature("autodoc", "* Returns the geometry of type <gp> linked to the <Node>.
	:param aNode:
	:type aNode: MAT_Node
	:rtype: gp_Pnt2d") GeomElt;
		gp_Pnt2d GeomElt (const opencascade::handle<MAT_Node> & aNode);

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "* Returns <theGraph> of <self>.
	:rtype: opencascade::handle<MAT_Graph>") Graph;
		opencascade::handle<MAT_Graph> Graph ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if Compute has succeeded.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NumberOfContours ******************/
		%feature("compactdefaultargs") NumberOfContours;
		%feature("autodoc", "* Returns the number of contours.
	:rtype: int") NumberOfContours;
		Standard_Integer NumberOfContours ();

		/****************** NumberOfElts ******************/
		%feature("compactdefaultargs") NumberOfElts;
		%feature("autodoc", "* Returns the number of BasicElts on the line <IndLine>.
	:param IndLine:
	:type IndLine: int
	:rtype: int") NumberOfElts;
		Standard_Integer NumberOfElts (const Standard_Integer IndLine);

		/****************** NumberOfSections ******************/
		%feature("compactdefaultargs") NumberOfSections;
		%feature("autodoc", "* Returns the number of sections of a curve. this curve is the Indexth curve in the IndLineth contour given by anExplo.
	:param IndLine:
	:type IndLine: int
	:param Index:
	:type Index: int
	:rtype: int") NumberOfSections;
		Standard_Integer NumberOfSections (const Standard_Integer IndLine,const Standard_Integer Index);

};


%extend BRepMAT2d_BisectingLocus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepMAT2d_Explorer *
***************************/
%nodefaultctor BRepMAT2d_Explorer;
class BRepMAT2d_Explorer {
	public:
		/****************** BRepMAT2d_Explorer ******************/
		%feature("compactdefaultargs") BRepMAT2d_Explorer;
		%feature("autodoc", ":rtype: None") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer ();

		/****************** BRepMAT2d_Explorer ******************/
		%feature("compactdefaultargs") BRepMAT2d_Explorer;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Face
	:rtype: None") BRepMAT2d_Explorer;
		 BRepMAT2d_Explorer (const TopoDS_Face & aFace);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clear the contents of <self>.
	:rtype: None") Clear;
		void Clear ();

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", ":param IndexContour:
	:type IndexContour: int
	:rtype: TColGeom2d_SequenceOfCurve") Contour;
		const TColGeom2d_SequenceOfCurve & Contour (const Standard_Integer IndexContour);

		/****************** GetIsClosed ******************/
		%feature("compactdefaultargs") GetIsClosed;
		%feature("autodoc", ":rtype: TColStd_SequenceOfBoolean") GetIsClosed;
		const TColStd_SequenceOfBoolean & GetIsClosed ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialisation of an Iterator on the curves of the Contour number <IndexContour>.
	:param IndexContour:
	:type IndexContour: int
	:rtype: None") Init;
		void Init (const Standard_Integer IndexContour);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:rtype: bool") IsModified;
		Standard_Boolean IsModified (const TopoDS_Shape & aShape);

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "* If the shape is not modified, returns the shape itself.
	:param aShape:
	:type aShape: TopoDS_Shape
	:rtype: TopoDS_Shape") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & aShape);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Return False if there is no more curves on the Contour initialised by the method Init.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move to the next curve of the current Contour.
	:rtype: None") Next;
		void Next ();

		/****************** NumberOfContours ******************/
		%feature("compactdefaultargs") NumberOfContours;
		%feature("autodoc", "* Returns the Number of contours.
	:rtype: int") NumberOfContours;
		Standard_Integer NumberOfContours ();

		/****************** NumberOfCurves ******************/
		%feature("compactdefaultargs") NumberOfCurves;
		%feature("autodoc", "* Returns the Number of Curves in the Contour number <IndexContour>.
	:param IndexContour:
	:type IndexContour: int
	:rtype: int") NumberOfCurves;
		Standard_Integer NumberOfCurves (const Standard_Integer IndexContour);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Face
	:rtype: None") Perform;
		void Perform (const TopoDS_Face & aFace);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current curve on the current Contour.
	:rtype: opencascade::handle<Geom2d_Curve>") Value;
		opencascade::handle<Geom2d_Curve> Value ();

};


%extend BRepMAT2d_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepMAT2d_LinkTopoBilo *
*******************************/
%nodefaultctor BRepMAT2d_LinkTopoBilo;
class BRepMAT2d_LinkTopoBilo {
	public:
		/****************** BRepMAT2d_LinkTopoBilo ******************/
		%feature("compactdefaultargs") BRepMAT2d_LinkTopoBilo;
		%feature("autodoc", ":rtype: None") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo ();

		/****************** BRepMAT2d_LinkTopoBilo ******************/
		%feature("compactdefaultargs") BRepMAT2d_LinkTopoBilo;
		%feature("autodoc", "* Constructs the links Between S and BiLo. //! raises if <S> is not a face.
	:param Explo:
	:type Explo: BRepMAT2d_Explorer
	:param BiLo:
	:type BiLo: BRepMAT2d_BisectingLocus
	:rtype: None") BRepMAT2d_LinkTopoBilo;
		 BRepMAT2d_LinkTopoBilo (const BRepMAT2d_Explorer & Explo,const BRepMAT2d_BisectingLocus & BiLo);

		/****************** GeneratingShape ******************/
		%feature("compactdefaultargs") GeneratingShape;
		%feature("autodoc", "* Returns the Shape linked to <aBE>.
	:param aBE:
	:type aBE: MAT_BasicElt
	:rtype: TopoDS_Shape") GeneratingShape;
		TopoDS_Shape GeneratingShape (const opencascade::handle<MAT_BasicElt> & aBE);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialise the Iterator on <S> <S> is an edge or a vertex of the initial wire or face. raises if <S> is not an edge or a vertex.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current BasicElt.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Proceed to the next BasicElt.
	:rtype: None") Next;
		void Next ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Constructs the links Between S and BiLo. //! raises if <S> is not a face or a wire.
	:param Explo:
	:type Explo: BRepMAT2d_Explorer
	:param BiLo:
	:type BiLo: BRepMAT2d_BisectingLocus
	:rtype: None") Perform;
		void Perform (const BRepMAT2d_Explorer & Explo,const BRepMAT2d_BisectingLocus & BiLo);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current BasicElt.
	:rtype: opencascade::handle<MAT_BasicElt>") Value;
		opencascade::handle<MAT_BasicElt> Value ();

};


%extend BRepMAT2d_LinkTopoBilo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
