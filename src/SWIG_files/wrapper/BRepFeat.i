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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class BRepFeat_Status(IntEnum):
	BRepFeat_NoError = 0
	BRepFeat_InvalidPlacement = 1
	BRepFeat_HoleTooLong = 2
BRepFeat_NoError = BRepFeat_Status.BRepFeat_NoError
BRepFeat_InvalidPlacement = BRepFeat_Status.BRepFeat_InvalidPlacement
BRepFeat_HoleTooLong = BRepFeat_Status.BRepFeat_HoleTooLong

class BRepFeat_StatusError(IntEnum):
	BRepFeat_OK = 0
	BRepFeat_BadDirect = 1
	BRepFeat_BadIntersect = 2
	BRepFeat_EmptyBaryCurve = 3
	BRepFeat_EmptyCutResult = 4
	BRepFeat_FalseSide = 5
	BRepFeat_IncDirection = 6
	BRepFeat_IncSlidFace = 7
	BRepFeat_IncParameter = 8
	BRepFeat_IncTypes = 9
	BRepFeat_IntervalOverlap = 10
	BRepFeat_InvFirstShape = 11
	BRepFeat_InvOption = 12
	BRepFeat_InvShape = 13
	BRepFeat_LocOpeNotDone = 14
	BRepFeat_LocOpeInvNotDone = 15
	BRepFeat_NoExtFace = 16
	BRepFeat_NoFaceProf = 17
	BRepFeat_NoGluer = 18
	BRepFeat_NoIntersectF = 19
	BRepFeat_NoIntersectU = 20
	BRepFeat_NoParts = 21
	BRepFeat_NoProjPt = 22
	BRepFeat_NotInitialized = 23
	BRepFeat_NotYetImplemented = 24
	BRepFeat_NullRealTool = 25
	BRepFeat_NullToolF = 26
	BRepFeat_NullToolU = 27
BRepFeat_OK = BRepFeat_StatusError.BRepFeat_OK
BRepFeat_BadDirect = BRepFeat_StatusError.BRepFeat_BadDirect
BRepFeat_BadIntersect = BRepFeat_StatusError.BRepFeat_BadIntersect
BRepFeat_EmptyBaryCurve = BRepFeat_StatusError.BRepFeat_EmptyBaryCurve
BRepFeat_EmptyCutResult = BRepFeat_StatusError.BRepFeat_EmptyCutResult
BRepFeat_FalseSide = BRepFeat_StatusError.BRepFeat_FalseSide
BRepFeat_IncDirection = BRepFeat_StatusError.BRepFeat_IncDirection
BRepFeat_IncSlidFace = BRepFeat_StatusError.BRepFeat_IncSlidFace
BRepFeat_IncParameter = BRepFeat_StatusError.BRepFeat_IncParameter
BRepFeat_IncTypes = BRepFeat_StatusError.BRepFeat_IncTypes
BRepFeat_IntervalOverlap = BRepFeat_StatusError.BRepFeat_IntervalOverlap
BRepFeat_InvFirstShape = BRepFeat_StatusError.BRepFeat_InvFirstShape
BRepFeat_InvOption = BRepFeat_StatusError.BRepFeat_InvOption
BRepFeat_InvShape = BRepFeat_StatusError.BRepFeat_InvShape
BRepFeat_LocOpeNotDone = BRepFeat_StatusError.BRepFeat_LocOpeNotDone
BRepFeat_LocOpeInvNotDone = BRepFeat_StatusError.BRepFeat_LocOpeInvNotDone
BRepFeat_NoExtFace = BRepFeat_StatusError.BRepFeat_NoExtFace
BRepFeat_NoFaceProf = BRepFeat_StatusError.BRepFeat_NoFaceProf
BRepFeat_NoGluer = BRepFeat_StatusError.BRepFeat_NoGluer
BRepFeat_NoIntersectF = BRepFeat_StatusError.BRepFeat_NoIntersectF
BRepFeat_NoIntersectU = BRepFeat_StatusError.BRepFeat_NoIntersectU
BRepFeat_NoParts = BRepFeat_StatusError.BRepFeat_NoParts
BRepFeat_NoProjPt = BRepFeat_StatusError.BRepFeat_NoProjPt
BRepFeat_NotInitialized = BRepFeat_StatusError.BRepFeat_NotInitialized
BRepFeat_NotYetImplemented = BRepFeat_StatusError.BRepFeat_NotYetImplemented
BRepFeat_NullRealTool = BRepFeat_StatusError.BRepFeat_NullRealTool
BRepFeat_NullToolF = BRepFeat_StatusError.BRepFeat_NullToolF
BRepFeat_NullToolU = BRepFeat_StatusError.BRepFeat_NullToolU

class BRepFeat_PerfSelection(IntEnum):
	BRepFeat_NoSelection = 0
	BRepFeat_SelectionFU = 1
	BRepFeat_SelectionU = 2
	BRepFeat_SelectionSh = 3
	BRepFeat_SelectionShU = 4
BRepFeat_NoSelection = BRepFeat_PerfSelection.BRepFeat_NoSelection
BRepFeat_SelectionFU = BRepFeat_PerfSelection.BRepFeat_SelectionFU
BRepFeat_SelectionU = BRepFeat_PerfSelection.BRepFeat_SelectionU
BRepFeat_SelectionSh = BRepFeat_PerfSelection.BRepFeat_SelectionSh
BRepFeat_SelectionShU = BRepFeat_PerfSelection.BRepFeat_SelectionShU
};
/* end python proxy for enums */

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Pt: gp_Pnt

Returns
-------
None
") Barycenter;
		static void Barycenter(const TopoDS_Shape & S, gp_Pnt & Pt);

		/****************** FaceUntil ******************/
		%feature("compactdefaultargs") FaceUntil;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
F: TopoDS_Face

Returns
-------
None
") FaceUntil;
		static void FaceUntil(const TopoDS_Shape & S, TopoDS_Face & F);

		/****************** IsInside ******************/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
bool
") IsInside;
		static Standard_Boolean IsInside(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** ParametricBarycenter ******************/
		%feature("compactdefaultargs") ParametricBarycenter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
C: Geom_Curve

Returns
-------
float
") ParametricBarycenter;
		static Standard_Real ParametricBarycenter(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C);

		/****************** ParametricMinMax ******************/
		%feature("compactdefaultargs") ParametricMinMax;
		%feature("autodoc", "Ori = true taking account the orientation.

Parameters
----------
S: TopoDS_Shape
C: Geom_Curve
Ori: bool,optional
	default value is Standard_False

Returns
-------
prmin: float
prmax: float
prbmin: float
prbmax: float
flag: bool
") ParametricMinMax;
		static void ParametricMinMax(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue, const Standard_Boolean Ori = Standard_False);

		/****************** SampleEdges ******************/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Pt: TColgp_SequenceOfPnt

Returns
-------
None
") SampleEdges;
		static void SampleEdges(const TopoDS_Shape & S, TColgp_SequenceOfPnt & Pt);

		/****************** Tool ******************/
		%feature("compactdefaultargs") Tool;
		%feature("autodoc", "No available documentation.

Parameters
----------
SRef: TopoDS_Shape
Fac: TopoDS_Face
Orf: TopAbs_Orientation

Returns
-------
TopoDS_Solid
") Tool;
		static TopoDS_Solid Tool(const TopoDS_Shape & SRef, const TopoDS_Face & Fac, const TopAbs_Orientation Orf);

};


%extend BRepFeat {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def IsInOut(self):
		pass
	}
};

/*************************
* class BRepFeat_Builder *
*************************/
class BRepFeat_Builder : public BOPAlgo_BOP {
	public:
		/****************** BRepFeat_Builder ******************/
		%feature("compactdefaultargs") BRepFeat_Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFeat_Builder;
		 BRepFeat_Builder();

		/****************** CheckSolidImages ******************/
		%feature("compactdefaultargs") CheckSolidImages;
		%feature("autodoc", "Collects the images of the object, that contains in the images of the tool.

Returns
-------
None
") CheckSolidImages;
		void CheckSolidImages();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields and arguments.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** FillRemoved ******************/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "Collects the removed parts of the tool into myremoved map.

Returns
-------
None
") FillRemoved;
		void FillRemoved();

		/****************** FillRemoved ******************/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "Adds the shape s and its sub-shapes into myremoved map.

Parameters
----------
theS: TopoDS_Shape
theM: TopTools_MapOfShape

Returns
-------
None
") FillRemoved;
		void FillRemoved(const TopoDS_Shape & theS, TopTools_MapOfShape & theM);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialyzes the object of local boolean operation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & theShape);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialyzes the arguments of local boolean operation.

Parameters
----------
theShape: TopoDS_Shape
theTool: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & theShape, const TopoDS_Shape & theTool);

		/****************** KeepPart ******************/
		%feature("compactdefaultargs") KeepPart;
		%feature("autodoc", "Adds shape thes and all its sub-shapes into myshapes map.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
None
") KeepPart;
		void KeepPart(const TopoDS_Shape & theS);

		/****************** KeepParts ******************/
		%feature("compactdefaultargs") KeepParts;
		%feature("autodoc", "Initialyzes parts of the tool for second step of algorithm. collects shapes and all sub-shapes into myshapes map.

Parameters
----------
theIm: TopTools_ListOfShape

Returns
-------
None
") KeepParts;
		void KeepParts(const TopTools_ListOfShape & theIm);

		/****************** PartsOfTool ******************/
		%feature("compactdefaultargs") PartsOfTool;
		%feature("autodoc", "Collects parts of the tool.

Parameters
----------
theLT: TopTools_ListOfShape

Returns
-------
None
") PartsOfTool;
		void PartsOfTool(TopTools_ListOfShape & theLT);

		/****************** PerformResult ******************/
		%feature("compactdefaultargs") PerformResult;
		%feature("autodoc", "Main function to build the result of the local operation required.

Returns
-------
None
") PerformResult;
		void PerformResult();

		/****************** RebuildEdge ******************/
		%feature("compactdefaultargs") RebuildEdge;
		%feature("autodoc", "Rebuilds edges in accordance with the kept parts of the tool.

Parameters
----------
theE: TopoDS_Shape
theF: TopoDS_Face
theME: TopTools_MapOfShape
aLEIm: TopTools_ListOfShape

Returns
-------
None
") RebuildEdge;
		void RebuildEdge(const TopoDS_Shape & theE, const TopoDS_Face & theF, const TopTools_MapOfShape & theME, TopTools_ListOfShape & aLEIm);

		/****************** RebuildFaces ******************/
		%feature("compactdefaultargs") RebuildFaces;
		%feature("autodoc", "Rebuilds faces in accordance with the kept parts of the tool.

Returns
-------
None
") RebuildFaces;
		void RebuildFaces();

		/****************** SetOperation ******************/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "Sets the operation of local boolean operation. if thefuse = 0 than the operation is cut, otherwise fuse.

Parameters
----------
theFuse: int

Returns
-------
None
") SetOperation;
		void SetOperation(const Standard_Integer theFuse);

		/****************** SetOperation ******************/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "Sets the operation of local boolean operation. if theflag = true it means that no selection of parts of the tool is needed, t.e. no second part. in that case if thefuse = 0 than operation is common, otherwise cut21. if theflag = false setoperation(thefuse) function is called.

Parameters
----------
theFuse: int
theFlag: bool

Returns
-------
None
") SetOperation;
		void SetOperation(const Standard_Integer theFuse, const Standard_Boolean theFlag);

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
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		virtual opencascade::handle<Geom_Curve> BarycCurve();

		/****************** BasisShapeValid ******************/
		%feature("compactdefaultargs") BasisShapeValid;
		%feature("autodoc", "Initializes the topological construction if the basis shape is present.

Returns
-------
None
") BasisShapeValid;
		void BasisShapeValid();

		/****************** CurrentStatusError ******************/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepFeat_StatusError
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		virtual void Curves(TColGeom_SequenceOfCurve & S);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the list of shapes created at the bottom of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") FirstShape;
		const TopTools_ListOfShape & FirstShape();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns a list of the created faces from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** GeneratedShapeValid ******************/
		%feature("compactdefaultargs") GeneratedShapeValid;
		%feature("autodoc", "Initializes the topological construction if the generated shape s is present.

Returns
-------
None
") GeneratedShapeValid;
		void GeneratedShapeValid();

		/****************** GluedFacesValid ******************/
		%feature("compactdefaultargs") GluedFacesValid;
		%feature("autodoc", "Initializes the topological construction if the glued face is present.

Returns
-------
None
") GluedFacesValid;
		void GluedFacesValid();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the list of shapes created at the top of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") LastShape;
		const TopTools_ListOfShape & LastShape();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of generated faces.

Parameters
----------
F: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns a list of the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of fillets. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges();

		/****************** PerfSelectionValid ******************/
		%feature("compactdefaultargs") PerfSelectionValid;
		%feature("autodoc", "Initializes the topological construction if the selected face is present.

Returns
-------
None
") PerfSelectionValid;
		void PerfSelectionValid();

		/****************** ShapeFromValid ******************/
		%feature("compactdefaultargs") ShapeFromValid;
		%feature("autodoc", "Initializes the topological construction if the shape is present from the specified integer on.

Returns
-------
None
") ShapeFromValid;
		void ShapeFromValid();

		/****************** ShapeUntilValid ******************/
		%feature("compactdefaultargs") ShapeUntilValid;
		%feature("autodoc", "Initializes the topological construction if the shape is present until the specified integer.

Returns
-------
None
") ShapeUntilValid;
		void ShapeUntilValid();

		/****************** SketchFaceValid ******************/
		%feature("compactdefaultargs") SketchFaceValid;
		%feature("autodoc", "Initializes the topological construction if the sketch face is present. if the sketch face is inside the basis shape, local operations such as glueing can be performed.

Returns
-------
None
") SketchFaceValid;
		void SketchFaceValid();

		/****************** TgtEdges ******************/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. the list provides the information necessary for subsequent addition of fillets. it may be an empty list. if an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.

Returns
-------
TopTools_ListOfShape
") TgtEdges;
		const TopTools_ListOfShape & TgtEdges();

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
		%feature("autodoc", "Initializes an empty constructor.

Returns
-------
None
") BRepFeat_Gluer;
		 BRepFeat_Gluer();

		/****************** BRepFeat_Gluer ******************/
		%feature("compactdefaultargs") BRepFeat_Gluer;
		%feature("autodoc", "Initializes the shapes to be glued, the new shape snew and the basis shape sbase.

Parameters
----------
Snew: TopoDS_Shape
Sbase: TopoDS_Shape

Returns
-------
None
") BRepFeat_Gluer;
		 BRepFeat_Gluer(const TopoDS_Shape & Snew, const TopoDS_Shape & Sbase);

		/****************** BasisShape ******************/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "Returns the basis shape of the compound shape.

Returns
-------
TopoDS_Shape
") BasisShape;
		const TopoDS_Shape BasisShape();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Defines a contact between fnew on the new shape snew and fbase on the basis shape sbase. informs other methods that fnew in the new shape snew is connected to the face fbase in the basis shape sbase. the contact faces of the glued shape must not have parts outside the contact faces of the basis shape. this indicates that glueing is possible.

Parameters
----------
Fnew: TopoDS_Face
Fbase: TopoDS_Face

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Face & Fnew, const TopoDS_Face & Fbase);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Nforms other methods that the edge enew in the new shape is the same as the edge ebase in the basis shape and is therefore attached to the basis shape. this indicates that glueing is possible.

Parameters
----------
Enew: TopoDS_Edge
Ebase: TopoDS_Edge

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Edge & Enew, const TopoDS_Edge & Ebase);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "This is called by shape(). it does nothing but may be redefined.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** GluedShape ******************/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "Returns the resulting compound shape.

Returns
-------
TopoDS_Shape
") GluedShape;
		const TopoDS_Shape GluedShape();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the new shape snew and the basis shape sbase for the local glueing operation.

Parameters
----------
Snew: TopoDS_Shape
Sbase: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Snew, const TopoDS_Shape & Sbase);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns the status of the face after the shape creation.

Parameters
----------
F: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of generated faces.

Parameters
----------
F: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****************** OpeType ******************/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", "Determine which operation type to use glueing or sliding.

Returns
-------
LocOpe_Operation
") OpeType;
		LocOpe_Operation OpeType();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
faces: TopTools_ListOfShape
cc: Geom_Curve
par: float
bnd: float
Pln: Geom_Plane

Returns
-------
TopoDS_Face
") ChoiceOfFaces;
		static TopoDS_Face ChoiceOfFaces(TopTools_ListOfShape & faces, const opencascade::handle<Geom_Curve> & cc, const Standard_Real par, const Standard_Real bnd, const opencascade::handle<Geom_Plane> & Pln);

		/****************** CurrentStatusError ******************/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepFeat_StatusError
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError();

		/****************** FacesForDraft ******************/
		%feature("compactdefaultargs") FacesForDraft;
		%feature("autodoc", "Returns a list of the limiting and glueing faces generated by the feature. these faces did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of a draft to a face. it may be an empty list. if a face has tangent edges, no draft is possible, and the tangent edges must subsequently be removed if you want to add a draft to the face.

Returns
-------
TopTools_ListOfShape
") FacesForDraft;
		const TopTools_ListOfShape & FacesForDraft();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the list of shapes created at the bottom of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") FirstShape;
		const TopTools_ListOfShape & FirstShape();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns a list toptools_listofshape of the faces s created in the shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IntPar ******************/
		%feature("compactdefaultargs") IntPar;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
P: gp_Pnt

Returns
-------
float
") IntPar;
		static Standard_Real IntPar(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if f a topods_shape of type edge or face has been deleted.

Parameters
----------
F: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the list of shapes created at the top of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") LastShape;
		const TopTools_ListOfShape & LastShape();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of generated faces f. this list may be empty.

Parameters
----------
F: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns a list of the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of fillets. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges();

		/****************** TgtEdges ******************/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. the list provides the information necessary for subsequent addition of fillets. it may be an empty list. if an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.

Returns
-------
TopTools_ListOfShape
") TgtEdges;
		const TopTools_ListOfShape & TgtEdges();

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
		/****************** BRepFeat_SplitShape ******************/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape();

		/****************** BRepFeat_SplitShape ******************/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "Creates the process with the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape(const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add splitting edges or wires for whole initial shape withot additional specification edge->face, edge->edge this method puts edge on the corresponding faces from initial shape.

Parameters
----------
theEdges: TopTools_SequenceOfShape

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopTools_SequenceOfShape & theEdges);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the wire <w> on the face <f>. raises nosuchobject if <f> does not belong to the original shape.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the edge <e> on the face <f>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the compound <comp> on the face <f>. the compound <comp> must consist of edges lying on the face <f>. if edges are geometrically connected, they must be connected topologically, i.e. they must share common vertices. //! raises nosuchobject if <f> does not belong to the original shape.

Parameters
----------
Comp: TopoDS_Compound
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Compound & Comp, const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the edge <e> on the existing edge <eon>.

Parameters
----------
E: TopoDS_Edge
EOn: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Edge & EOn);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the cut and the resulting faces and edges as well.

Returns
-------
None
") Build;
		void Build();

		/****************** DirectLeft ******************/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Returns the faces which are the left of the projected wires.

Returns
-------
TopTools_ListOfShape
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the process on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape has been deleted.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** Left ******************/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Returns the faces of the 'left' part on the shape. (it is build from directleft, with the faces connected to this set, and so on...). raises notdone if isdone returns <standard_false>.

Returns
-------
TopTools_ListOfShape
") Left;
		const TopTools_ListOfShape & Left();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of generated faces.

Parameters
----------
F: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****************** SetCheckInterior ******************/
		%feature("compactdefaultargs") SetCheckInterior;
		%feature("autodoc", "Set the flag of check internal intersections default value is true (to check).

Parameters
----------
ToCheckInterior: bool

Returns
-------
None
") SetCheckInterior;
		void SetCheckInterior(const Standard_Boolean ToCheckInterior);

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
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepFeat_MakeCylindricalHole;
		 BRepFeat_MakeCylindricalHole();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape). invalidates the given parts of tools if any, and performs the result of the local operation.

Returns
-------
None
") Build;
		void Build();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Sets the axis of the hole(s).

Parameters
----------
Axis: gp_Ax1

Returns
-------
None
") Init;
		void Init(const gp_Ax1 & Axis);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Sets the shape and axis on which hole(s) will be performed.

Parameters
----------
S: TopoDS_Shape
Axis: gp_Ax1

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const gp_Ax1 & Axis);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs every holes of radius <radius>. this command has the same effect as a cut operation with an infinite cylinder defined by the given axis and <radius>.

Parameters
----------
Radius: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Radius);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs evry hole of radius <radius> located between pfrom and pto on the given axis. if <withcontrol> is set to standard_false no control are done on the resulting shape after the operation is performed.

Parameters
----------
Radius: float
PFrom: float
PTo: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Radius, const Standard_Real PFrom, const Standard_Real PTo, const Standard_Boolean WithControl = Standard_True);

		/****************** PerformBlind ******************/
		%feature("compactdefaultargs") PerformBlind;
		%feature("autodoc", "Performs a blind hole of radius <radius> and length <length>. the length is measured from the origin of the given axis. if <withcontrol> is set to standard_false no control are done after the operation is performed.

Parameters
----------
Radius: float
Length: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") PerformBlind;
		void PerformBlind(const Standard_Real Radius, const Standard_Real Length, const Standard_Boolean WithControl = Standard_True);

		/****************** PerformThruNext ******************/
		%feature("compactdefaultargs") PerformThruNext;
		%feature("autodoc", "Performs the first hole of radius <radius>, in the direction of the defined axis. first hole signify first encountered after the origin of the axis. if <withcontrol> is set to standard_false no control are done on the resulting shape after the operation is performed.

Parameters
----------
Radius: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") PerformThruNext;
		void PerformThruNext(const Standard_Real Radius, const Standard_Boolean WithControl = Standard_True);

		/****************** PerformUntilEnd ******************/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Performs evry holes of radius <radius> located after the origin of the given axis. if <withcontrol> is set to standard_false no control are done on the resulting shape after the operation is performed.

Parameters
----------
Radius: float
WithControl: bool,optional
	default value is Standard_True

Returns
-------
None
") PerformUntilEnd;
		void PerformUntilEnd(const Standard_Real Radius, const Standard_Boolean WithControl = Standard_True);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns the status after a hole is performed.

Returns
-------
BRepFeat_Status
") Status;
		BRepFeat_Status Status();

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
		/****************** BRepFeat_MakeDPrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "A face pbase is selected in the shape sbase to serve as the basis for the draft prism. the draft will be defined by the angle angle and fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed. initializes the draft prism class.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Face
Skface: TopoDS_Face
Angle: float
Fuse: int
Modify: bool

Returns
-------
None
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism(const TopoDS_Shape & Sbase, const TopoDS_Face & Pbase, const TopoDS_Face & Skface, const Standard_Real Angle, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** BRepFeat_MakeDPrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.

Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** BossEdges ******************/
		%feature("compactdefaultargs") BossEdges;
		%feature("autodoc", "Determination of topedges and latedges. sig = 1 -> topedges = firstshape of the dprism sig = 2 -> topedges = lastshape of the dprism.

Parameters
----------
sig: int

Returns
-------
None
") BossEdges;
		void BossEdges(const Standard_Integer sig);

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm for building draft prisms along surfaces. a face pbase is selected in the basis shape sbase to serve as the basis from the draft prism. the draft will be defined by the angle angle and fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Face
Skface: TopoDS_Face
Angle: float
Fuse: int
Modify: bool

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Face & Pbase, const TopoDS_Face & Skface, const Standard_Real Angle, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** LatEdges ******************/
		%feature("compactdefaultargs") LatEdges;
		%feature("autodoc", "Returns the list of topods edges of the bottom of the boss.

Returns
-------
TopTools_ListOfShape
") LatEdges;
		const TopTools_ListOfShape & LatEdges();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Height: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Height);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Assigns one of the following semantics - to a height height - to a face until - from a face from to a height until. reconstructs the feature topologically according to the semantic option chosen.

Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

		/****************** PerformFromEnd ******************/
		%feature("compactdefaultargs") PerformFromEnd;
		%feature("autodoc", "Realizes a semi-infinite prism, limited by the face funtil.

Parameters
----------
FUntil: TopoDS_Shape

Returns
-------
None
") PerformFromEnd;
		void PerformFromEnd(const TopoDS_Shape & FUntil);

		/****************** PerformThruAll ******************/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Builds an infinite prism. the infinite descendants will not be kept in the result.

Returns
-------
None
") PerformThruAll;
		void PerformThruAll();

		/****************** PerformUntilEnd ******************/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Realizes a semi-infinite prism, limited by the position of the prism base.

Returns
-------
None
") PerformUntilEnd;
		void PerformUntilEnd();

		/****************** PerformUntilHeight ******************/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "Assigns both a limiting shape, until from topods_shape, and a height, height at which to stop generation of the prism feature.

Parameters
----------
Until: TopoDS_Shape
Height: float

Returns
-------
None
") PerformUntilHeight;
		void PerformUntilHeight(const TopoDS_Shape & Until, const Standard_Real Height);

		/****************** TopEdges ******************/
		%feature("compactdefaultargs") TopEdges;
		%feature("autodoc", "Returns the list of topods edges of the top of the boss.

Returns
-------
TopTools_ListOfShape
") TopEdges;
		const TopTools_ListOfShape & TopEdges();

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
		/****************** BRepFeat_MakeLinearForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "Initializes the linear form class.

Returns
-------
None
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm();

		/****************** BRepFeat_MakeLinearForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "Contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. direction and direction1 give the vectors for defining the direction(s) in which thickness will be built up. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.

Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
P: Geom_Plane
Direction: gp_Vec
Direction1: gp_Vec
Fuse: int
Modify: bool

Returns
-------
None
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & P, const gp_Vec & Direction, const gp_Vec & Direction1, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.

Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this construction algorithm. a contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. the vectors for defining the direction(s) in which thickness will be built up are given by direction and direction1. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.

Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
P: Geom_Plane
Direction: gp_Vec
Direction1: gp_Vec
Fuse: int
Modify: bool

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & P, const gp_Vec & Direction, const gp_Vec & Direction1, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs a prism from the wire to the plane along the basis shape sbase. reconstructs the feature topologically.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Propagate ******************/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopTools_ListOfShape
F: TopoDS_Face
FPoint: gp_Pnt
LPoint: gp_Pnt

Returns
-------
falseside: bool
") Propagate;
		Standard_Boolean Propagate(TopTools_ListOfShape & L, const TopoDS_Face & F, const gp_Pnt & FPoint, const gp_Pnt & LPoint, Standard_Boolean &OutValue);

};


%extend BRepFeat_MakeLinearForm {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def TransformShapeFU(self):
		pass
	}
};

/**************************
* class BRepFeat_MakePipe *
**************************/
class BRepFeat_MakePipe : public BRepFeat_Form {
	public:
		/****************** BRepFeat_MakePipe ******************/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "Initializes the pipe class.

Returns
-------
None
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe();

		/****************** BRepFeat_MakePipe ******************/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "A face pbase is selected in the shape sbase to serve as the basis for the pipe. it will be defined by the wire spine. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Spine: TopoDS_Wire
Fuse: int
Modify: bool

Returns
-------
None
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const TopoDS_Wire & Spine, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.

Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm for adding pipes to shapes. a face pbase is selected in the shape sbase to serve as the basis for the pipe. it will be defined by the wire spine. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Spine: TopoDS_Wire
Fuse: int
Modify: bool

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const TopoDS_Wire & Spine, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Assigns one of the following semantics - to a face until - from a face from to a height until. reconstructs the feature topologically according to the semantic option chosen.

Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

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
		/****************** BRepFeat_MakePrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "Builds a prism by projecting a wire along the face of a shape. initializes the prism class.

Returns
-------
None
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism();

		/****************** BRepFeat_MakePrism ******************/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "Builds a prism by projecting a wire along the face of a shape. a face pbase is selected in the shape sbase to serve as the basis for the prism. the orientation of the prism will be defined by the vector direction. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed. exceptions standard_constructionerror if the face does not belong to the basis or the prism shape.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Direction: gp_Dir
Fuse: int
Modify: bool

Returns
-------
None
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Dir & Direction, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.

Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Generates a curve along the center of mass of the primitive.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Returns the list of curves s parallel to the axis of the prism.

Parameters
----------
S: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm for building prisms along surfaces. a face pbase is selected in the shape sbase to serve as the basis for the prism. the orientation of the prism will be defined by the vector direction. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Direction: gp_Dir
Fuse: int
Modify: bool

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Dir & Direction, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Length: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Length);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Assigns one of the following semantics - to a height length - to a face until - from a face from to a height until. reconstructs the feature topologically according to the semantic option chosen.

Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

		/****************** PerformFromEnd ******************/
		%feature("compactdefaultargs") PerformFromEnd;
		%feature("autodoc", "Realizes a semi-infinite prism, limited by the face funtil.

Parameters
----------
FUntil: TopoDS_Shape

Returns
-------
None
") PerformFromEnd;
		void PerformFromEnd(const TopoDS_Shape & FUntil);

		/****************** PerformThruAll ******************/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Builds an infinite prism. the infinite descendants will not be kept in the result.

Returns
-------
None
") PerformThruAll;
		void PerformThruAll();

		/****************** PerformUntilEnd ******************/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Realizes a semi-infinite prism, limited by the position of the prism base. all other faces extend infinitely.

Returns
-------
None
") PerformUntilEnd;
		void PerformUntilEnd();

		/****************** PerformUntilHeight ******************/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "Assigns both a limiting shape, until from topods_shape, and a height, length at which to stop generation of the prism feature.

Parameters
----------
Until: TopoDS_Shape
Length: float

Returns
-------
None
") PerformUntilHeight;
		void PerformUntilHeight(const TopoDS_Shape & Until, const Standard_Real Length);

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
		/****************** BRepFeat_MakeRevol ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "Initializes the revolved shell class.

Returns
-------
None
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol();

		/****************** BRepFeat_MakeRevol ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "A face pbase is selected in the shape sbase to serve as the basis for the revolved shell. the revolution will be defined by the axis axis and fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Axis: gp_Ax1
Fuse: int
Modify: bool

Returns
-------
None
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Ax1 & Axis, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.

Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Axis: gp_Ax1
Fuse: int
Modify: bool

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Ax1 & Axis, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Angle: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Angle);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Reconstructs the feature topologically.

Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

		/****************** PerformThruAll ******************/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Builds an infinite shell. the infinite descendants will not be kept in the result.

Returns
-------
None
") PerformThruAll;
		void PerformThruAll();

		/****************** PerformUntilAngle ******************/
		%feature("compactdefaultargs") PerformUntilAngle;
		%feature("autodoc", "Assigns both a limiting shape, until from topods_shape, and an angle, angle at which to stop generation of the revolved shell feature.

Parameters
----------
Until: TopoDS_Shape
Angle: float

Returns
-------
None
") PerformUntilAngle;
		void PerformUntilAngle(const TopoDS_Shape & Until, const Standard_Real Angle);

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
		/****************** BRepFeat_MakeRevolutionForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "Initializes the linear form class.

Returns
-------
None
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm();

		/****************** BRepFeat_MakeRevolutionForm ******************/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "A contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. the axis axis of the revolved surface in the basis shape defines the feature's axis of revolution. height1 and height2 may be used as limits to the construction of the feature. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.

Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
Plane: Geom_Plane
Axis: gp_Ax1
Height1: float
Height2: float
Fuse: int

Returns
-------
Sliding: bool
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & Plane, const gp_Ax1 & Axis, const Standard_Real Height1, const Standard_Real Height2, const Standard_Integer Fuse, Standard_Boolean &OutValue);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.

Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this construction algorithm a contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. the axis axis of the revolved surface in the basis shape defines the feature's axis of revolution. height1 and height2 may be used as limits to the construction of the feature. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.

Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
Plane: Geom_Plane
Axis: gp_Ax1
Height1: float
Height2: float
Fuse: int

Returns
-------
Sliding: bool
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & Plane, const gp_Ax1 & Axis, const Standard_Real Height1, const Standard_Real Height2, const Standard_Integer Fuse, Standard_Boolean &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs a prism from the wire to the plane along the basis shape s. reconstructs the feature topologically.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Propagate ******************/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopTools_ListOfShape
F: TopoDS_Face
FPoint: gp_Pnt
LPoint: gp_Pnt

Returns
-------
falseside: bool
") Propagate;
		Standard_Boolean Propagate(TopTools_ListOfShape & L, const TopoDS_Face & F, const gp_Pnt & FPoint, const gp_Pnt & LPoint, Standard_Boolean &OutValue);

};


%extend BRepFeat_MakeRevolutionForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
