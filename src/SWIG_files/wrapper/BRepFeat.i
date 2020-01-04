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
%define BREPFEATDOCSTRING
"BRepFeat module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepfeat.html"
%enddef
%module (package="OCC.Core", docstring=BREPFEATDOCSTRING) BRepFeat


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
#include<BRepFeat_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TopAbs_module.hxx>
#include<BOPAlgo_module.hxx>
#include<TopTools_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TColGeom_module.hxx>
#include<LocOpe_module.hxx>
#include<TopLoc_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<BRepTools_module.hxx>
#include<BOPDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntSurf_module.hxx>
#include<IntTools_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Approx_module.hxx>
#include<IntPatch_module.hxx>
#include<Geom2d_module.hxx>
#include<TShort_module.hxx>
#include<BRep_module.hxx>
#include<Extrema_module.hxx>
#include<Message_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import Geom.i
%import TColgp.i
%import TopAbs.i
%import BOPAlgo.i
%import TopTools.i
%import BRepBuilderAPI.i
%import TColGeom.i
%import LocOpe.i
/* public enums */
enum BRepFeat_Status {
	BRepFeat_NoError = 0,
	BRepFeat_InvalidPlacement = 1,
	BRepFeat_HoleTooLong = 2,
};

enum BRepFeat_StatusError {
	BRepFeat_OK = 0,
	BRepFeat_BadDirect = 1,
	BRepFeat_BadIntersect = 2,
	BRepFeat_EmptyBaryCurve = 3,
	BRepFeat_EmptyCutResult = 4,
	BRepFeat_FalseSide = 5,
	BRepFeat_IncDirection = 6,
	BRepFeat_IncSlidFace = 7,
	BRepFeat_IncParameter = 8,
	BRepFeat_IncTypes = 9,
	BRepFeat_IntervalOverlap = 10,
	BRepFeat_InvFirstShape = 11,
	BRepFeat_InvOption = 12,
	BRepFeat_InvShape = 13,
	BRepFeat_LocOpeNotDone = 14,
	BRepFeat_LocOpeInvNotDone = 15,
	BRepFeat_NoExtFace = 16,
	BRepFeat_NoFaceProf = 17,
	BRepFeat_NoGluer = 18,
	BRepFeat_NoIntersectF = 19,
	BRepFeat_NoIntersectU = 20,
	BRepFeat_NoParts = 21,
	BRepFeat_NoProjPt = 22,
	BRepFeat_NotInitialized = 23,
	BRepFeat_NotYetImplemented = 24,
	BRepFeat_NullRealTool = 25,
	BRepFeat_NullToolF = 26,
	BRepFeat_NullToolU = 27,
};

enum BRepFeat_PerfSelection {
	BRepFeat_NoSelection = 0,
	BRepFeat_SelectionFU = 1,
	BRepFeat_SelectionU = 2,
	BRepFeat_SelectionSh = 3,
	BRepFeat_SelectionShU = 4,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class BRepFeat *
*****************/
%rename(brepfeat) BRepFeat;
class BRepFeat {
	public:
		/****************** Barycenter ******************/
		%feature("compactdefaultargs") Barycenter;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Pt:
	:type Pt: gp_Pnt
	:rtype: void") Barycenter;
		static void Barycenter (const TopoDS_Shape & S,gp_Pnt & Pt);

		/****************** FaceUntil ******************/
		%feature("compactdefaultargs") FaceUntil;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param F:
	:type F: TopoDS_Face
	:rtype: void") FaceUntil;
		static void FaceUntil (const TopoDS_Shape & S,TopoDS_Face & F);

		/****************** IsInside ******************/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:rtype: bool") IsInside;
		static Standard_Boolean IsInside (const TopoDS_Face & F1,const TopoDS_Face & F2);

		/****************** ParametricBarycenter ******************/
		%feature("compactdefaultargs") ParametricBarycenter;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param C:
	:type C: Geom_Curve
	:rtype: float") ParametricBarycenter;
		static Standard_Real ParametricBarycenter (const TopoDS_Shape & S,const opencascade::handle<Geom_Curve> & C);

		/****************** ParametricMinMax ******************/
		%feature("compactdefaultargs") ParametricMinMax;
		%feature("autodoc", "* Ori = True taking account the orientation
	:param S:
	:type S: TopoDS_Shape
	:param C:
	:type C: Geom_Curve
	:param prmin:
	:type prmin: float
	:param prmax:
	:type prmax: float
	:param prbmin:
	:type prbmin: float
	:param prbmax:
	:type prbmax: float
	:param flag:
	:type flag: bool
	:param Ori: default value is Standard_False
	:type Ori: bool
	:rtype: void") ParametricMinMax;
		static void ParametricMinMax (const TopoDS_Shape & S,const opencascade::handle<Geom_Curve> & C,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean &OutValue,const Standard_Boolean Ori = Standard_False);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the Error description of the State <St> as a String on the Stream <S> and returns <S>.
	:param SE:
	:type SE: BRepFeat_StatusError
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const BRepFeat_StatusError SE,Standard_OStream & S);

		/****************** SampleEdges ******************/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Pt:
	:type Pt: TColgp_SequenceOfPnt
	:rtype: void") SampleEdges;
		static void SampleEdges (const TopoDS_Shape & S,TColgp_SequenceOfPnt & Pt);

		/****************** Tool ******************/
		%feature("compactdefaultargs") Tool;
		%feature("autodoc", ":param SRef:
	:type SRef: TopoDS_Shape
	:param Fac:
	:type Fac: TopoDS_Face
	:param Orf:
	:type Orf: TopAbs_Orientation
	:rtype: TopoDS_Solid") Tool;
		static TopoDS_Solid Tool (const TopoDS_Shape & SRef,const TopoDS_Face & Fac,const TopAbs_Orientation Orf);

};


%extend BRepFeat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepFeat_Builder *
*************************/
class BRepFeat_Builder : public BOPAlgo_BOP {
	public:
		/****************** BRepFeat_Builder ******************/
		%feature("compactdefaultargs") BRepFeat_Builder;
		%feature("autodoc", ":rtype: None") BRepFeat_Builder;
		 BRepFeat_Builder ();

		/****************** CheckSolidImages ******************/
		%feature("compactdefaultargs") CheckSolidImages;
		%feature("autodoc", "* Collects the images of the object, that contains in the images of the tool.
	:rtype: None") CheckSolidImages;
		void CheckSolidImages ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears internal fields and arguments.
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** FillRemoved ******************/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "* Collects the removed parts of the tool into myRemoved map.
	:rtype: None") FillRemoved;
		void FillRemoved ();

		/****************** FillRemoved ******************/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "* Adds the shape S and its sub-shapes into myRemoved map.
	:param theS:
	:type theS: TopoDS_Shape
	:param theM:
	:type theM: TopTools_MapOfShape
	:rtype: None") FillRemoved;
		void FillRemoved (const TopoDS_Shape & theS,TopTools_MapOfShape & theM);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialyzes the object of local boolean operation.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & theShape);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialyzes the arguments of local boolean operation.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theTool:
	:type theTool: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & theShape,const TopoDS_Shape & theTool);

		/****************** KeepPart ******************/
		%feature("compactdefaultargs") KeepPart;
		%feature("autodoc", "* Adds shape theS and all its sub-shapes into myShapes map.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: None") KeepPart;
		void KeepPart (const TopoDS_Shape & theS);

		/****************** KeepParts ******************/
		%feature("compactdefaultargs") KeepParts;
		%feature("autodoc", "* Initialyzes parts of the tool for second step of algorithm. Collects shapes and all sub-shapes into myShapes map.
	:param theIm:
	:type theIm: TopTools_ListOfShape
	:rtype: None") KeepParts;
		void KeepParts (const TopTools_ListOfShape & theIm);

		/****************** PartsOfTool ******************/
		%feature("compactdefaultargs") PartsOfTool;
		%feature("autodoc", "* Collects parts of the tool.
	:param theLT:
	:type theLT: TopTools_ListOfShape
	:rtype: None") PartsOfTool;
		void PartsOfTool (TopTools_ListOfShape & theLT);

		/****************** PerformResult ******************/
		%feature("compactdefaultargs") PerformResult;
		%feature("autodoc", "* Main function to build the result of the local operation required.
	:rtype: None") PerformResult;
		void PerformResult ();

		/****************** RebuildEdge ******************/
		%feature("compactdefaultargs") RebuildEdge;
		%feature("autodoc", "* Rebuilds edges in accordance with the kept parts of the tool.
	:param theE:
	:type theE: TopoDS_Shape
	:param theF:
	:type theF: TopoDS_Face
	:param theME:
	:type theME: TopTools_MapOfShape
	:param aLEIm:
	:type aLEIm: TopTools_ListOfShape
	:rtype: None") RebuildEdge;
		void RebuildEdge (const TopoDS_Shape & theE,const TopoDS_Face & theF,const TopTools_MapOfShape & theME,TopTools_ListOfShape & aLEIm);

		/****************** RebuildFaces ******************/
		%feature("compactdefaultargs") RebuildFaces;
		%feature("autodoc", "* Rebuilds faces in accordance with the kept parts of the tool.
	:rtype: None") RebuildFaces;
		void RebuildFaces ();

		/****************** SetOperation ******************/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "* Sets the operation of local boolean operation. If theFuse = 0 than the operation is CUT, otherwise FUSE.
	:param theFuse:
	:type theFuse: int
	:rtype: None") SetOperation;
		void SetOperation (const Standard_Integer theFuse);

		/****************** SetOperation ******************/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "* Sets the operation of local boolean operation. If theFlag = True it means that no selection of parts of the tool is needed, t.e. no second part. In that case if theFuse = 0 than operation is COMMON, otherwise CUT21. If theFlag = False SetOperation(theFuse) function is called.
	:param theFuse:
	:type theFuse: int
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetOperation;
		void SetOperation (const Standard_Integer theFuse,const Standard_Boolean theFlag);

};


%extend BRepFeat_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepFeat_Form *
**********************/
%nodefaultctor BRepFeat_Form;
class BRepFeat_Form : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		virtual opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** BasisShapeValid ******************/
		%feature("compactdefaultargs") BasisShapeValid;
		%feature("autodoc", "* Initializes the topological construction if the basis shape is present.
	:rtype: None") BasisShapeValid;
		void BasisShapeValid ();

		/****************** CurrentStatusError ******************/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", ":rtype: BRepFeat_StatusError") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param S:
	:type S: TColGeom_SequenceOfCurve
	:rtype: void") Curves;
		virtual void Curves (TColGeom_SequenceOfCurve & S);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the list of shapes created at the bottom of the created form. It may be an empty list.
	:rtype: TopTools_ListOfShape") FirstShape;
		const TopTools_ListOfShape & FirstShape ();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* returns a list of the created faces from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** GeneratedShapeValid ******************/
		%feature("compactdefaultargs") GeneratedShapeValid;
		%feature("autodoc", "* Initializes the topological construction if the generated shape S is present.
	:rtype: None") GeneratedShapeValid;
		void GeneratedShapeValid ();

		/****************** GluedFacesValid ******************/
		%feature("compactdefaultargs") GluedFacesValid;
		%feature("autodoc", "* Initializes the topological construction if the glued face is present.
	:rtype: None") GluedFacesValid;
		void GluedFacesValid ();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the list of shapes created at the top of the created form. It may be an empty list.
	:rtype: TopTools_ListOfShape") LastShape;
		const TopTools_ListOfShape & LastShape ();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* returns the list of generated Faces.
	:param F:
	:type F: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "* Returns a list of the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of fillets. It may be an empty list.
	:rtype: TopTools_ListOfShape") NewEdges;
		const TopTools_ListOfShape & NewEdges ();

		/****************** PerfSelectionValid ******************/
		%feature("compactdefaultargs") PerfSelectionValid;
		%feature("autodoc", "* Initializes the topological construction if the selected face is present.
	:rtype: None") PerfSelectionValid;
		void PerfSelectionValid ();

		/****************** ShapeFromValid ******************/
		%feature("compactdefaultargs") ShapeFromValid;
		%feature("autodoc", "* Initializes the topological construction if the shape is present from the specified integer on.
	:rtype: None") ShapeFromValid;
		void ShapeFromValid ();

		/****************** ShapeUntilValid ******************/
		%feature("compactdefaultargs") ShapeUntilValid;
		%feature("autodoc", "* Initializes the topological construction if the shape is present until the specified integer.
	:rtype: None") ShapeUntilValid;
		void ShapeUntilValid ();

		/****************** SketchFaceValid ******************/
		%feature("compactdefaultargs") SketchFaceValid;
		%feature("autodoc", "* Initializes the topological construction if the sketch face is present. If the sketch face is inside the basis shape, local operations such as glueing can be performed.
	:rtype: None") SketchFaceValid;
		void SketchFaceValid ();

		/****************** TgtEdges ******************/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "* Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. The list provides the information necessary for subsequent addition of fillets. It may be an empty list. If an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.
	:rtype: TopTools_ListOfShape") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();

};


%extend BRepFeat_Form {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepFeat_Gluer *
***********************/
class BRepFeat_Gluer : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepFeat_Gluer ******************/
		%feature("compactdefaultargs") BRepFeat_Gluer;
		%feature("autodoc", "* Initializes an empty constructor
	:rtype: None") BRepFeat_Gluer;
		 BRepFeat_Gluer ();

		/****************** BRepFeat_Gluer ******************/
		%feature("compactdefaultargs") BRepFeat_Gluer;
		%feature("autodoc", "* Initializes the shapes to be glued, the new shape Snew and the basis shape Sbase.
	:param Snew:
	:type Snew: TopoDS_Shape
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:rtype: None") BRepFeat_Gluer;
		 BRepFeat_Gluer (const TopoDS_Shape & Snew,const TopoDS_Shape & Sbase);

		/****************** BasisShape ******************/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "* Returns the basis shape of the compound shape.
	:rtype: TopoDS_Shape") BasisShape;
		const TopoDS_Shape  BasisShape ();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Defines a contact between Fnew on the new shape Snew and Fbase on the basis shape Sbase. Informs other methods that Fnew in the new shape Snew is connected to the face Fbase in the basis shape Sbase. The contact faces of the glued shape must not have parts outside the contact faces of the basis shape. This indicates that glueing is possible.
	:param Fnew:
	:type Fnew: TopoDS_Face
	:param Fbase:
	:type Fbase: TopoDS_Face
	:rtype: None") Bind;
		void Bind (const TopoDS_Face & Fnew,const TopoDS_Face & Fbase);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* nforms other methods that the edge Enew in the new shape is the same as the edge Ebase in the basis shape and is therefore attached to the basis shape. This indicates that glueing is possible.
	:param Enew:
	:type Enew: TopoDS_Edge
	:param Ebase:
	:type Ebase: TopoDS_Edge
	:rtype: None") Bind;
		void Bind (const TopoDS_Edge & Enew,const TopoDS_Edge & Ebase);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* This is called by Shape(). It does nothing but may be redefined.
	:rtype: void") Build;
		virtual void Build ();

		/****************** GluedShape ******************/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "* Returns the resulting compound shape.
	:rtype: TopoDS_Shape") GluedShape;
		const TopoDS_Shape  GluedShape ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the new shape Snew and the basis shape Sbase for the local glueing operation.
	:param Snew:
	:type Snew: TopoDS_Shape
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Snew,const TopoDS_Shape & Sbase);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* returns the status of the Face after the shape creation.
	:param F:
	:type F: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* returns the list of generated Faces.
	:param F:
	:type F: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);

		/****************** OpeType ******************/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", "* Determine which operation type to use glueing or sliding.
	:rtype: LocOpe_Operation") OpeType;
		LocOpe_Operation OpeType ();

};


%extend BRepFeat_Gluer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepFeat_RibSlot *
*************************/
%nodefaultctor BRepFeat_RibSlot;
class BRepFeat_RibSlot : public BRepBuilderAPI_MakeShape {
	public:
		/****************** ChoiceOfFaces ******************/
		%feature("compactdefaultargs") ChoiceOfFaces;
		%feature("autodoc", ":param faces:
	:type faces: TopTools_ListOfShape
	:param cc:
	:type cc: Geom_Curve
	:param par:
	:type par: float
	:param bnd:
	:type bnd: float
	:param Pln:
	:type Pln: Geom_Plane
	:rtype: TopoDS_Face") ChoiceOfFaces;
		static TopoDS_Face ChoiceOfFaces (TopTools_ListOfShape & faces,const opencascade::handle<Geom_Curve> & cc,const Standard_Real par,const Standard_Real bnd,const opencascade::handle<Geom_Plane> & Pln);

		/****************** CurrentStatusError ******************/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", ":rtype: BRepFeat_StatusError") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError ();

		/****************** FacesForDraft ******************/
		%feature("compactdefaultargs") FacesForDraft;
		%feature("autodoc", "* Returns a list of the limiting and glueing faces generated by the feature. These faces did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of a draft to a face. It may be an empty list. If a face has tangent edges, no draft is possible, and the tangent edges must subsequently be removed if you want to add a draft to the face.
	:rtype: TopTools_ListOfShape") FacesForDraft;
		const TopTools_ListOfShape & FacesForDraft ();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the list of shapes created at the bottom of the created form. It may be an empty list.
	:rtype: TopTools_ListOfShape") FirstShape;
		const TopTools_ListOfShape & FirstShape ();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns a list TopTools_ListOfShape of the faces S created in the shape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** IntPar ******************/
		%feature("compactdefaultargs") IntPar;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:param P:
	:type P: gp_Pnt
	:rtype: float") IntPar;
		static Standard_Real IntPar (const opencascade::handle<Geom_Curve> & C,const gp_Pnt & P);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns true if F a TopoDS_Shape of type edge or face has been deleted.
	:param F:
	:type F: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the list of shapes created at the top of the created form. It may be an empty list.
	:rtype: TopTools_ListOfShape") LastShape;
		const TopTools_ListOfShape & LastShape ();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns the list of generated Faces F. This list may be empty.
	:param F:
	:type F: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "* Returns a list of the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of fillets. It may be an empty list.
	:rtype: TopTools_ListOfShape") NewEdges;
		const TopTools_ListOfShape & NewEdges ();

		/****************** TgtEdges ******************/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "* Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. The list provides the information necessary for subsequent addition of fillets. It may be an empty list. If an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.
	:rtype: TopTools_ListOfShape") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();

};


%extend BRepFeat_RibSlot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepFeat_SplitShape *
****************************/
class BRepFeat_SplitShape : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add splitting edges or wires for whole initial shape withot additional specification edge->face, edge->edge This method puts edge on the corresponding faces from initial shape
	:param theEdges:
	:type theEdges: TopTools_SequenceOfShape
	:rtype: bool") Add;
		Standard_Boolean Add (const TopTools_SequenceOfShape & theEdges);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the wire <W> on the face <F>. Raises NoSuchObject if <F> does not belong to the original shape.
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the edge <E> on the face <F>.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the compound <Comp> on the face <F>. The compound <Comp> must consist of edges lying on the face <F>. If edges are geometrically connected, they must be connected topologically, i.e. they must share common vertices. //! Raises NoSuchObject if <F> does not belong to the original shape.
	:param Comp:
	:type Comp: TopoDS_Compound
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Compound & Comp,const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the edge <E> on the existing edge <EOn>.
	:param E:
	:type E: TopoDS_Edge
	:param EOn:
	:type EOn: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Edge & EOn);

		/****************** BRepFeat_SplitShape ******************/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "* Empty constructor
	:rtype: None") BRepFeat_SplitShape;
		 BRepFeat_SplitShape ();

		/****************** BRepFeat_SplitShape ******************/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "* Creates the process with the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") BRepFeat_SplitShape;
		 BRepFeat_SplitShape (const TopoDS_Shape & S);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the cut and the resulting faces and edges as well.
	:rtype: None") Build;
		void Build ();

		/****************** DirectLeft ******************/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "* Returns the faces which are the left of the projected wires.
	:rtype: TopTools_ListOfShape") DirectLeft;
		const TopTools_ListOfShape & DirectLeft ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the process on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns true if the shape has been deleted.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);

		/****************** Left ******************/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "* Returns the faces of the 'left' part on the shape. (It is build from DirectLeft, with the faces connected to this set, and so on...). Raises NotDone if IsDone returns <Standard_False>.
	:rtype: TopTools_ListOfShape") Left;
		const TopTools_ListOfShape & Left ();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns the list of generated Faces.
	:param F:
	:type F: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);

		/****************** SetCheckInterior ******************/
		%feature("compactdefaultargs") SetCheckInterior;
		%feature("autodoc", "* Set the flag of check internal intersections default value is True (to check)
	:param ToCheckInterior:
	:type ToCheckInterior: bool
	:rtype: None") SetCheckInterior;
		void SetCheckInterior (const Standard_Boolean ToCheckInterior);

};


%extend BRepFeat_SplitShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BRepFeat_MakeCylindricalHole *
*************************************/
class BRepFeat_MakeCylindricalHole : public BRepFeat_Builder {
	public:
		/****************** BRepFeat_MakeCylindricalHole ******************/
		%feature("compactdefaultargs") BRepFeat_MakeCylindricalHole;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") BRepFeat_MakeCylindricalHole;
		 BRepFeat_MakeCylindricalHole ();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the resulting shape (redefined from MakeShape). Invalidates the given parts of tools if any, and performs the result of the local operation.
	:rtype: None") Build;
		void Build ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Sets the axis of the hole(s).
	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None") Init;
		void Init (const gp_Ax1 & Axis);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Sets the shape and axis on which hole(s) will be performed.
	:param S:
	:type S: TopoDS_Shape
	:param Axis:
	:type Axis: gp_Ax1
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S,const gp_Ax1 & Axis);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs every holes of radius <Radius>. This command has the same effect as a cut operation with an infinite cylinder defined by the given axis and <Radius>.
	:param Radius:
	:type Radius: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Radius);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs evry hole of radius <Radius> located between PFrom and PTo on the given axis. If <WithControl> is set to Standard_False no control are done on the resulting shape after the operation is performed.
	:param Radius:
	:type Radius: float
	:param PFrom:
	:type PFrom: float
	:param PTo:
	:type PTo: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None") Perform;
		void Perform (const Standard_Real Radius,const Standard_Real PFrom,const Standard_Real PTo,const Standard_Boolean WithControl = Standard_True);

		/****************** PerformBlind ******************/
		%feature("compactdefaultargs") PerformBlind;
		%feature("autodoc", "* Performs a blind hole of radius <Radius> and length <Length>. The length is measured from the origin of the given axis. If <WithControl> is set to Standard_False no control are done after the operation is performed.
	:param Radius:
	:type Radius: float
	:param Length:
	:type Length: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None") PerformBlind;
		void PerformBlind (const Standard_Real Radius,const Standard_Real Length,const Standard_Boolean WithControl = Standard_True);

		/****************** PerformThruNext ******************/
		%feature("compactdefaultargs") PerformThruNext;
		%feature("autodoc", "* Performs the first hole of radius <Radius>, in the direction of the defined axis. First hole signify first encountered after the origin of the axis. If <WithControl> is set to Standard_False no control are done on the resulting shape after the operation is performed.
	:param Radius:
	:type Radius: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None") PerformThruNext;
		void PerformThruNext (const Standard_Real Radius,const Standard_Boolean WithControl = Standard_True);

		/****************** PerformUntilEnd ******************/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "* Performs evry holes of radius <Radius> located after the origin of the given axis. If <WithControl> is set to Standard_False no control are done on the resulting shape after the operation is performed.
	:param Radius:
	:type Radius: float
	:param WithControl: default value is Standard_True
	:type WithControl: bool
	:rtype: None") PerformUntilEnd;
		void PerformUntilEnd (const Standard_Real Radius,const Standard_Boolean WithControl = Standard_True);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns the status after a hole is performed.
	:rtype: BRepFeat_Status") Status;
		BRepFeat_Status Status ();

};


%extend BRepFeat_MakeCylindricalHole {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepFeat_MakeDPrism *
****************************/
class BRepFeat_MakeDPrism : public BRepFeat_Form {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
	:param E:
	:type E: TopoDS_Edge
	:param OnFace:
	:type OnFace: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);

		/****************** BRepFeat_MakeDPrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "* A face Pbase is selected in the shape Sbase to serve as the basis for the draft prism. The draft will be defined by the angle Angle and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed. Initializes the draft prism class
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Face
	:param Skface:
	:type Skface: TopoDS_Face
	:param Angle:
	:type Angle: float
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism (const TopoDS_Shape & Sbase,const TopoDS_Face & Pbase,const TopoDS_Face & Skface,const Standard_Real Angle,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** BRepFeat_MakeDPrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", ":rtype: None") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism ();

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** BossEdges ******************/
		%feature("compactdefaultargs") BossEdges;
		%feature("autodoc", "* Determination of TopEdges and LatEdges. sig = 1 -> TopEdges = FirstShape of the DPrism sig = 2 -> TOpEdges = LastShape of the DPrism
	:param sig:
	:type sig: int
	:rtype: None") BossEdges;
		void BossEdges (const Standard_Integer sig);

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param S:
	:type S: TColGeom_SequenceOfCurve
	:rtype: None") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this algorithm for building draft prisms along surfaces. A face Pbase is selected in the basis shape Sbase to serve as the basis from the draft prism. The draft will be defined by the angle Angle and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Face
	:param Skface:
	:type Skface: TopoDS_Face
	:param Angle:
	:type Angle: float
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Face & Pbase,const TopoDS_Face & Skface,const Standard_Real Angle,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** LatEdges ******************/
		%feature("compactdefaultargs") LatEdges;
		%feature("autodoc", "* Returns the list of TopoDS Edges of the bottom of the boss.
	:rtype: TopTools_ListOfShape") LatEdges;
		const TopTools_ListOfShape & LatEdges ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Height:
	:type Height: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Height);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Assigns one of the following semantics - to a height Height - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.
	:param From:
	:type From: TopoDS_Shape
	:param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);

		/****************** PerformFromEnd ******************/
		%feature("compactdefaultargs") PerformFromEnd;
		%feature("autodoc", "* Realizes a semi-infinite prism, limited by the face Funtil.
	:param FUntil:
	:type FUntil: TopoDS_Shape
	:rtype: None") PerformFromEnd;
		void PerformFromEnd (const TopoDS_Shape & FUntil);

		/****************** PerformThruAll ******************/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "* Builds an infinite prism. The infinite descendants will not be kept in the result.
	:rtype: None") PerformThruAll;
		void PerformThruAll ();

		/****************** PerformUntilEnd ******************/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "* Realizes a semi-infinite prism, limited by the position of the prism base.
	:rtype: None") PerformUntilEnd;
		void PerformUntilEnd ();

		/****************** PerformUntilHeight ******************/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "* Assigns both a limiting shape, Until from TopoDS_Shape, and a height, Height at which to stop generation of the prism feature.
	:param Until:
	:type Until: TopoDS_Shape
	:param Height:
	:type Height: float
	:rtype: None") PerformUntilHeight;
		void PerformUntilHeight (const TopoDS_Shape & Until,const Standard_Real Height);

		/****************** TopEdges ******************/
		%feature("compactdefaultargs") TopEdges;
		%feature("autodoc", "* Returns the list of TopoDS Edges of the top of the boss.
	:rtype: TopTools_ListOfShape") TopEdges;
		const TopTools_ListOfShape & TopEdges ();

};


%extend BRepFeat_MakeDPrism {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepFeat_MakeLinearForm *
********************************/
class BRepFeat_MakeLinearForm : public BRepFeat_RibSlot {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
	:param E:
	:type E: TopoDS_Edge
	:param OnFace:
	:type OnFace: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);

		/****************** BRepFeat_MakeLinearForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "* initializes the linear form class
	:rtype: None") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm ();

		/****************** BRepFeat_MakeLinearForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "* contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. Direction and Direction1 give The vectors for defining the direction(s) in which thickness will be built up. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param W:
	:type W: TopoDS_Wire
	:param P:
	:type P: Geom_Plane
	:param Direction:
	:type Direction: gp_Vec
	:param Direction1:
	:type Direction1: gp_Vec
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const opencascade::handle<Geom_Plane> & P,const gp_Vec & Direction,const gp_Vec & Direction1,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this construction algorithm. A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The vectors for defining the direction(s) in which thickness will be built up are given by Direction and Direction1. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param W:
	:type W: TopoDS_Wire
	:param P:
	:type P: Geom_Plane
	:param Direction:
	:type Direction: gp_Vec
	:param Direction1:
	:type Direction1: gp_Vec
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const opencascade::handle<Geom_Plane> & P,const gp_Vec & Direction,const gp_Vec & Direction1,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs a prism from the wire to the plane along the basis shape Sbase. Reconstructs the feature topologically.
	:rtype: None") Perform;
		void Perform ();

		/****************** Propagate ******************/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", ":param L:
	:type L: TopTools_ListOfShape
	:param F:
	:type F: TopoDS_Face
	:param FPoint:
	:type FPoint: gp_Pnt
	:param LPoint:
	:type LPoint: gp_Pnt
	:param falseside:
	:type falseside: bool
	:rtype: bool") Propagate;
		Standard_Boolean Propagate (TopTools_ListOfShape & L,const TopoDS_Face & F,const gp_Pnt & FPoint,const gp_Pnt & LPoint,Standard_Boolean &OutValue);

};


%extend BRepFeat_MakeLinearForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepFeat_MakePipe *
**************************/
class BRepFeat_MakePipe : public BRepFeat_Form {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
	:param E:
	:type E: TopoDS_Edge
	:param OnFace:
	:type OnFace: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);

		/****************** BRepFeat_MakePipe ******************/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "* initializes the pipe class.
	:rtype: None") BRepFeat_MakePipe;
		 BRepFeat_MakePipe ();

		/****************** BRepFeat_MakePipe ******************/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "* A face Pbase is selected in the shape Sbase to serve as the basis for the pipe. It will be defined by the wire Spine. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Shape
	:param Skface:
	:type Skface: TopoDS_Face
	:param Spine:
	:type Spine: TopoDS_Wire
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") BRepFeat_MakePipe;
		 BRepFeat_MakePipe (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const TopoDS_Wire & Spine,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param S:
	:type S: TColGeom_SequenceOfCurve
	:rtype: None") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this algorithm for adding pipes to shapes. A face Pbase is selected in the shape Sbase to serve as the basis for the pipe. It will be defined by the wire Spine. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Shape
	:param Skface:
	:type Skface: TopoDS_Face
	:param Spine:
	:type Spine: TopoDS_Wire
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const TopoDS_Wire & Spine,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Assigns one of the following semantics - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.
	:param From:
	:type From: TopoDS_Shape
	:param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);

};


%extend BRepFeat_MakePipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFeat_MakePrism *
***************************/
class BRepFeat_MakePrism : public BRepFeat_Form {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
	:param E:
	:type E: TopoDS_Edge
	:param OnFace:
	:type OnFace: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);

		/****************** BRepFeat_MakePrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "* Builds a prism by projecting a wire along the face of a shape. Initializes the prism class.
	:rtype: None") BRepFeat_MakePrism;
		 BRepFeat_MakePrism ();

		/****************** BRepFeat_MakePrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "* Builds a prism by projecting a wire along the face of a shape. a face Pbase is selected in the shape Sbase to serve as the basis for the prism. The orientation of the prism will be defined by the vector Direction. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed. Exceptions Standard_ConstructionError if the face does not belong to the basis or the prism shape.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Shape
	:param Skface:
	:type Skface: TopoDS_Face
	:param Direction:
	:type Direction: gp_Dir
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") BRepFeat_MakePrism;
		 BRepFeat_MakePrism (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Dir & Direction,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "* Generates a curve along the center of mass of the primitive.
	:rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "* Returns the list of curves S parallel to the axis of the prism.
	:param S:
	:type S: TColGeom_SequenceOfCurve
	:rtype: None") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this algorithm for building prisms along surfaces. A face Pbase is selected in the shape Sbase to serve as the basis for the prism. The orientation of the prism will be defined by the vector Direction. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Shape
	:param Skface:
	:type Skface: TopoDS_Face
	:param Direction:
	:type Direction: gp_Dir
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Dir & Direction,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Length:
	:type Length: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Length);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Assigns one of the following semantics - to a height Length - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.
	:param From:
	:type From: TopoDS_Shape
	:param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);

		/****************** PerformFromEnd ******************/
		%feature("compactdefaultargs") PerformFromEnd;
		%feature("autodoc", "* Realizes a semi-infinite prism, limited by the face Funtil.
	:param FUntil:
	:type FUntil: TopoDS_Shape
	:rtype: None") PerformFromEnd;
		void PerformFromEnd (const TopoDS_Shape & FUntil);

		/****************** PerformThruAll ******************/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "* Builds an infinite prism. The infinite descendants will not be kept in the result.
	:rtype: None") PerformThruAll;
		void PerformThruAll ();

		/****************** PerformUntilEnd ******************/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "* Realizes a semi-infinite prism, limited by the position of the prism base. All other faces extend infinitely.
	:rtype: None") PerformUntilEnd;
		void PerformUntilEnd ();

		/****************** PerformUntilHeight ******************/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "* Assigns both a limiting shape, Until from TopoDS_Shape, and a height, Length at which to stop generation of the prism feature.
	:param Until:
	:type Until: TopoDS_Shape
	:param Length:
	:type Length: float
	:rtype: None") PerformUntilHeight;
		void PerformUntilHeight (const TopoDS_Shape & Until,const Standard_Real Length);

};


%extend BRepFeat_MakePrism {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFeat_MakeRevol *
***************************/
class BRepFeat_MakeRevol : public BRepFeat_Form {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
	:param E:
	:type E: TopoDS_Edge
	:param OnFace:
	:type OnFace: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);

		/****************** BRepFeat_MakeRevol ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "* initializes the revolved shell class.
	:rtype: None") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol ();

		/****************** BRepFeat_MakeRevol ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "* a face Pbase is selected in the shape Sbase to serve as the basis for the revolved shell. The revolution will be defined by the axis Axis and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Shape
	:param Skface:
	:type Skface: TopoDS_Face
	:param Axis:
	:type Axis: gp_Ax1
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Ax1 & Axis,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param S:
	:type S: TColGeom_SequenceOfCurve
	:rtype: None") Curves;
		void Curves (TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Sbase:
	:type Sbase: TopoDS_Shape
	:param Pbase:
	:type Pbase: TopoDS_Shape
	:param Skface:
	:type Skface: TopoDS_Face
	:param Axis:
	:type Axis: gp_Ax1
	:param Fuse:
	:type Fuse: int
	:param Modify:
	:type Modify: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Pbase,const TopoDS_Face & Skface,const gp_Ax1 & Axis,const Standard_Integer Fuse,const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Angle:
	:type Angle: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Angle);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Reconstructs the feature topologically.
	:param From:
	:type From: TopoDS_Shape
	:param Until:
	:type Until: TopoDS_Shape
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & From,const TopoDS_Shape & Until);

		/****************** PerformThruAll ******************/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "* Builds an infinite shell. The infinite descendants will not be kept in the result.
	:rtype: None") PerformThruAll;
		void PerformThruAll ();

		/****************** PerformUntilAngle ******************/
		%feature("compactdefaultargs") PerformUntilAngle;
		%feature("autodoc", "* Assigns both a limiting shape, Until from TopoDS_Shape, and an angle, Angle at which to stop generation of the revolved shell feature.
	:param Until:
	:type Until: TopoDS_Shape
	:param Angle:
	:type Angle: float
	:rtype: None") PerformUntilAngle;
		void PerformUntilAngle (const TopoDS_Shape & Until,const Standard_Real Angle);

};


%extend BRepFeat_MakeRevol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepFeat_MakeRevolutionForm *
************************************/
class BRepFeat_MakeRevolutionForm : public BRepFeat_RibSlot {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
	:param E:
	:type E: TopoDS_Edge
	:param OnFace:
	:type OnFace: TopoDS_Face
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E,const TopoDS_Face & OnFace);

		/****************** BRepFeat_MakeRevolutionForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "* initializes the linear form class.
	:rtype: None") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm ();

		/****************** BRepFeat_MakeRevolutionForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "* a contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The axis Axis of the revolved surface in the basis shape defines the feature's axis of revolution. Height1 and Height2 may be used as limits to the construction of the feature. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param W:
	:type W: TopoDS_Wire
	:param Plane:
	:type Plane: Geom_Plane
	:param Axis:
	:type Axis: gp_Ax1
	:param Height1:
	:type Height1: float
	:param Height2:
	:type Height2: float
	:param Fuse:
	:type Fuse: int
	:param Sliding:
	:type Sliding: bool
	:rtype: None") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const opencascade::handle<Geom_Plane> & Plane,const gp_Ax1 & Axis,const Standard_Real Height1,const Standard_Real Height2,const Standard_Integer Fuse,Standard_Boolean &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this construction algorithm A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The axis Axis of the revolved surface in the basis shape defines the feature's axis of revolution. Height1 and Height2 may be used as limits to the construction of the feature. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
	:param Sbase:
	:type Sbase: TopoDS_Shape
	:param W:
	:type W: TopoDS_Wire
	:param Plane:
	:type Plane: Geom_Plane
	:param Axis:
	:type Axis: gp_Ax1
	:param Height1:
	:type Height1: float
	:param Height2:
	:type Height2: float
	:param Fuse:
	:type Fuse: int
	:param Sliding:
	:type Sliding: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Wire & W,const opencascade::handle<Geom_Plane> & Plane,const gp_Ax1 & Axis,const Standard_Real Height1,const Standard_Real Height2,const Standard_Integer Fuse,Standard_Boolean &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs a prism from the wire to the plane along the basis shape S. Reconstructs the feature topologically.
	:rtype: None") Perform;
		void Perform ();

		/****************** Propagate ******************/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", ":param L:
	:type L: TopTools_ListOfShape
	:param F:
	:type F: TopoDS_Face
	:param FPoint:
	:type FPoint: gp_Pnt
	:param LPoint:
	:type LPoint: gp_Pnt
	:param falseside:
	:type falseside: bool
	:rtype: bool") Propagate;
		Standard_Boolean Propagate (TopTools_ListOfShape & L,const TopoDS_Face & F,const gp_Pnt & FPoint,const gp_Pnt & LPoint,Standard_Boolean &OutValue);

};


%extend BRepFeat_MakeRevolutionForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
