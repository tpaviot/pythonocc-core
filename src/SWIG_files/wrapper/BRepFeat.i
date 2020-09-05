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
		/**** md5 signature: 95775d579f12e55fb164530ec70906cd ****/
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
		/**** md5 signature: 309ff593b2beab1849c6368b9ce43f4d ****/
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
		/**** md5 signature: 63eaa8339348f969538073e9ce46d5b2 ****/
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
		/**** md5 signature: cdd91b88ac72b66970d2700500d4e3cf ****/
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
		/**** md5 signature: 56d330cb4df86fc5c903ada4a5743fa7 ****/
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
		/**** md5 signature: f1154ae22c369e9497c31a5a83612489 ****/
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
		/**** md5 signature: e034f31a8da64d381b1bc24eb325043a ****/
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
		/**** md5 signature: fd1a198e0751532f2ed9562148204d5d ****/
		%feature("compactdefaultargs") BRepFeat_Builder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFeat_Builder;
		 BRepFeat_Builder();

		/****************** CheckSolidImages ******************/
		/**** md5 signature: 24eff084f084a5e8c3f207b7efcb0954 ****/
		%feature("compactdefaultargs") CheckSolidImages;
		%feature("autodoc", "Collects the images of the object, that contains in the images of the tool.

Returns
-------
None
") CheckSolidImages;
		void CheckSolidImages();

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields and arguments.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** FillRemoved ******************/
		/**** md5 signature: 1be497a0c9953c13eff3543c81a2ff52 ****/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "Collects the removed parts of the tool into myremoved map.

Returns
-------
None
") FillRemoved;
		void FillRemoved();

		/****************** FillRemoved ******************/
		/**** md5 signature: c816ecc7c07dc50e02f8c73fac35badb ****/
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
		/**** md5 signature: e8c5d8680206212eeeecebd0f84dc5c5 ****/
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
		/**** md5 signature: 740bc54164d5b82a500c1564e244a758 ****/
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
		/**** md5 signature: dce8aa3a6ec2e00d552d5e6f6662cecf ****/
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
		/**** md5 signature: 87c4cd5b43d1f9a01b576ee02f68e27d ****/
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
		/**** md5 signature: 9044d67ce0e79270261d1a8e7d2ef480 ****/
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
		/**** md5 signature: 3e3cbe6224ffbb0eb5a7338673569f7a ****/
		%feature("compactdefaultargs") PerformResult;
		%feature("autodoc", "Main function to build the result of the local operation required.

Returns
-------
None
") PerformResult;
		void PerformResult();

		/****************** RebuildEdge ******************/
		/**** md5 signature: d7d24342c4440d5e9583f009a4320033 ****/
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
		/**** md5 signature: a13f1f83a7ee0e9f7f7f1dfc7462f976 ****/
		%feature("compactdefaultargs") RebuildFaces;
		%feature("autodoc", "Rebuilds faces in accordance with the kept parts of the tool.

Returns
-------
None
") RebuildFaces;
		void RebuildFaces();

		/****************** SetOperation ******************/
		/**** md5 signature: 89876d5f4747477c7452d0cea9eed11b ****/
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
		/**** md5 signature: 8f486220b30ab20b482b117459ad7941 ****/
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
		/**** md5 signature: d1ddc085cbe99b4dc40aa66869015d0d ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		virtual opencascade::handle<Geom_Curve> BarycCurve();

		/****************** BasisShapeValid ******************/
		/**** md5 signature: ae52416b47a8fa29be6f02618978790f ****/
		%feature("compactdefaultargs") BasisShapeValid;
		%feature("autodoc", "Initializes the topological construction if the basis shape is present.

Returns
-------
None
") BasisShapeValid;
		void BasisShapeValid();

		/****************** CurrentStatusError ******************/
		/**** md5 signature: 5c642a7308522a33086b9a7dc347c71b ****/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepFeat_StatusError
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError();

		/****************** Curves ******************/
		/**** md5 signature: c90fd281c4f780878cf7fa2221d3f3a0 ****/
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
		/**** md5 signature: 3308814aad8b5a3d6b7d0ad13d83c3f8 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the list of shapes created at the bottom of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") FirstShape;
		const TopTools_ListOfShape & FirstShape();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
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
		/**** md5 signature: 63a556c0a5250c6b6acde4db96ea4c68 ****/
		%feature("compactdefaultargs") GeneratedShapeValid;
		%feature("autodoc", "Initializes the topological construction if the generated shape s is present.

Returns
-------
None
") GeneratedShapeValid;
		void GeneratedShapeValid();

		/****************** GluedFacesValid ******************/
		/**** md5 signature: 53476bb17c896d3f0d36b3fefa4028ab ****/
		%feature("compactdefaultargs") GluedFacesValid;
		%feature("autodoc", "Initializes the topological construction if the glued face is present.

Returns
-------
None
") GluedFacesValid;
		void GluedFacesValid();

		/****************** IsDeleted ******************/
		/**** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ****/
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
		/**** md5 signature: 420855638ec0220b6ca81d51c3a55b78 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the list of shapes created at the top of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") LastShape;
		const TopTools_ListOfShape & LastShape();

		/****************** Modified ******************/
		/**** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ****/
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
		/**** md5 signature: cdc7ef234fb9eb0a739ace74b44cca14 ****/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns a list of the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of fillets. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges();

		/****************** PerfSelectionValid ******************/
		/**** md5 signature: e860c269c453c4afb0c3c359332fcefc ****/
		%feature("compactdefaultargs") PerfSelectionValid;
		%feature("autodoc", "Initializes the topological construction if the selected face is present.

Returns
-------
None
") PerfSelectionValid;
		void PerfSelectionValid();

		/****************** ShapeFromValid ******************/
		/**** md5 signature: 3b61d70ac0d5d844804a95a8528936e3 ****/
		%feature("compactdefaultargs") ShapeFromValid;
		%feature("autodoc", "Initializes the topological construction if the shape is present from the specified integer on.

Returns
-------
None
") ShapeFromValid;
		void ShapeFromValid();

		/****************** ShapeUntilValid ******************/
		/**** md5 signature: 4830a2b19464d95992c8450ba3d8a286 ****/
		%feature("compactdefaultargs") ShapeUntilValid;
		%feature("autodoc", "Initializes the topological construction if the shape is present until the specified integer.

Returns
-------
None
") ShapeUntilValid;
		void ShapeUntilValid();

		/****************** SketchFaceValid ******************/
		/**** md5 signature: 748870012fe1dda56261fb89ad219013 ****/
		%feature("compactdefaultargs") SketchFaceValid;
		%feature("autodoc", "Initializes the topological construction if the sketch face is present. if the sketch face is inside the basis shape, local operations such as glueing can be performed.

Returns
-------
None
") SketchFaceValid;
		void SketchFaceValid();

		/****************** TgtEdges ******************/
		/**** md5 signature: 2c3d33bfb9d502b29d86c6dafd2350e0 ****/
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
		/**** md5 signature: 7f789f0b255d65d726f02c3a29cff722 ****/
		%feature("compactdefaultargs") BRepFeat_Gluer;
		%feature("autodoc", "Initializes an empty constructor.

Returns
-------
None
") BRepFeat_Gluer;
		 BRepFeat_Gluer();

		/****************** BRepFeat_Gluer ******************/
		/**** md5 signature: f4486bf2a24695e641a27f281d81a2f1 ****/
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
		/**** md5 signature: 21cd65d6b80cb61a9e13e787117a65b0 ****/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "Returns the basis shape of the compound shape.

Returns
-------
TopoDS_Shape
") BasisShape;
		const TopoDS_Shape BasisShape();

		/****************** Bind ******************/
		/**** md5 signature: 00651bec56a12d0418e54d774f302230 ****/
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
		/**** md5 signature: 3016e09a55c1e17b8452fe31e36138db ****/
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
		/**** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "This is called by shape(). it does nothing but may be redefined.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** GluedShape ******************/
		/**** md5 signature: cc05062c19ffec36edea50e2f74757fb ****/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "Returns the resulting compound shape.

Returns
-------
TopoDS_Shape
") GluedShape;
		const TopoDS_Shape GluedShape();

		/****************** Init ******************/
		/**** md5 signature: 115f57cbd7c4f9c5a742b814b00a0ef6 ****/
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
		/**** md5 signature: 1a016772dc188bec4b890b93a447dc5d ****/
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
		/**** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ****/
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
		/**** md5 signature: 6301740c99fde6f602c33a48a205b637 ****/
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
		/**** md5 signature: 3d2f5131b0512cb094ab2a0a28933417 ****/
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
		/**** md5 signature: 5c642a7308522a33086b9a7dc347c71b ****/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepFeat_StatusError
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError();

		/****************** FacesForDraft ******************/
		/**** md5 signature: bb294b3d28b2baf096a3677dfbc96070 ****/
		%feature("compactdefaultargs") FacesForDraft;
		%feature("autodoc", "Returns a list of the limiting and glueing faces generated by the feature. these faces did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of a draft to a face. it may be an empty list. if a face has tangent edges, no draft is possible, and the tangent edges must subsequently be removed if you want to add a draft to the face.

Returns
-------
TopTools_ListOfShape
") FacesForDraft;
		const TopTools_ListOfShape & FacesForDraft();

		/****************** FirstShape ******************/
		/**** md5 signature: 3308814aad8b5a3d6b7d0ad13d83c3f8 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the list of shapes created at the bottom of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") FirstShape;
		const TopTools_ListOfShape & FirstShape();

		/****************** Generated ******************/
		/**** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ****/
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
		/**** md5 signature: 0532efa1b66eddb1b75d8854720d015d ****/
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
		/**** md5 signature: 1a016772dc188bec4b890b93a447dc5d ****/
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
		/**** md5 signature: 420855638ec0220b6ca81d51c3a55b78 ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the list of shapes created at the top of the created form. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") LastShape;
		const TopTools_ListOfShape & LastShape();

		/****************** Modified ******************/
		/**** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ****/
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
		/**** md5 signature: cdc7ef234fb9eb0a739ace74b44cca14 ****/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Returns a list of the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of fillets. it may be an empty list.

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges();

		/****************** TgtEdges ******************/
		/**** md5 signature: 2c3d33bfb9d502b29d86c6dafd2350e0 ****/
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
		/**** md5 signature: 7fb4c09fb205f747a7f5b474bb0bb2c7 ****/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape();

		/****************** BRepFeat_SplitShape ******************/
		/**** md5 signature: d86eca78d22979b8ff6e67ac09b56988 ****/
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
		/**** md5 signature: a2f8855eb9d20716f921d30ba939fd6a ****/
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
		/**** md5 signature: 73487f98ab9ba9984904e685f5fae091 ****/
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
		/**** md5 signature: d621d461f76c392b22927a1a44cfbc16 ****/
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
		/**** md5 signature: b6f3642f26ba028306325db45aed0ed7 ****/
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
		/**** md5 signature: 058eae25f3940954a03a0173df9bce9b ****/
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
		/**** md5 signature: fbc5fbed76b24de64a843e82da1c1005 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the cut and the resulting faces and edges as well.

Returns
-------
None
") Build;
		void Build();

		/****************** DirectLeft ******************/
		/**** md5 signature: 3439933aeda7f1a1ec21dfaafbe0ab1a ****/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Returns the faces which are the left of the projected wires.

Returns
-------
TopTools_ListOfShape
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
		/**** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ****/
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
		/**** md5 signature: 70ee7865256185190dd6eecfb1fc40f8 ****/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Returns the faces of the 'left' part on the shape. (it is build from directleft, with the faces connected to this set, and so on...). raises notdone if isdone returns <standard_false>.

Returns
-------
TopTools_ListOfShape
") Left;
		const TopTools_ListOfShape & Left();

		/****************** Modified ******************/
		/**** md5 signature: d6a88f48819eaeb375ffa39db07ab939 ****/
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
		/**** md5 signature: 2d00b58c59d6af210c84a7fdd261d94b ****/
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
		/**** md5 signature: 58c4d86e740884755488b274c73f95f1 ****/
		%feature("compactdefaultargs") BRepFeat_MakeCylindricalHole;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BRepFeat_MakeCylindricalHole;
		 BRepFeat_MakeCylindricalHole();

		/****************** Build ******************/
		/**** md5 signature: 634d88e5c99c5ce236c07b337243d591 ****/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape). invalidates the given parts of tools if any, and performs the result of the local operation.

Returns
-------
None
") Build;
		void Build();

		/****************** Init ******************/
		/**** md5 signature: dfebb8f53795a8547d999d68d22be1d7 ****/
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
		/**** md5 signature: 341b409eb6e8df45d9a033137c13c001 ****/
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
		/**** md5 signature: d29e853e573ef7e11a66ef3857a2c5cd ****/
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
		/**** md5 signature: 692010be9cefee836dc51667b7cdc333 ****/
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
		/**** md5 signature: d6ad4465337920a7bace20f06cddf9a4 ****/
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
		/**** md5 signature: 3c97de21db8ff53771e449f91c5b073b ****/
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
		/**** md5 signature: 66cdda3afb2a9ca35971dfed1fd5ab7d ****/
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
		/**** md5 signature: 6857f3614226fbbdaae5e244ae4256ba ****/
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
		/**** md5 signature: ab28b5dd2f9cd5ff4235412c13babcfb ****/
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
		/**** md5 signature: 0ab447d2262f60e1cbeb33c57d85e702 ****/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism();

		/****************** Add ******************/
		/**** md5 signature: 1958ed6feaed653cc58352476d181b28 ****/
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
		/**** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** BossEdges ******************/
		/**** md5 signature: b65728171e50e3a538f10d4a296bea46 ****/
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
		/**** md5 signature: 07f751f9dfafc7503dd439055f5b554f ****/
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
		/**** md5 signature: 1c308bd80cbfde6bd9a04d2c26e4b328 ****/
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
		/**** md5 signature: 8a9db9ef1cd1c382e2f11897bd51d3ed ****/
		%feature("compactdefaultargs") LatEdges;
		%feature("autodoc", "Returns the list of topods edges of the bottom of the boss.

Returns
-------
TopTools_ListOfShape
") LatEdges;
		const TopTools_ListOfShape & LatEdges();

		/****************** Perform ******************/
		/**** md5 signature: 9d97b158b743926dc89782af13894b65 ****/
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
		/**** md5 signature: 10b8c982858685e75beee187b373027e ****/
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
		/**** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ****/
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
		/**** md5 signature: 2ae4aebaae52040c3272099e5b6fc393 ****/
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
		/**** md5 signature: 92616bf7c450284136e687eb7af8bafd ****/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Builds an infinite prism. the infinite descendants will not be kept in the result.

Returns
-------
None
") PerformThruAll;
		void PerformThruAll();

		/****************** PerformUntilEnd ******************/
		/**** md5 signature: 6feb6fa4d6c705b4d577d6e26f2f6b24 ****/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Realizes a semi-infinite prism, limited by the position of the prism base.

Returns
-------
None
") PerformUntilEnd;
		void PerformUntilEnd();

		/****************** PerformUntilHeight ******************/
		/**** md5 signature: eb1cd9128736557f1abf6daa81bfbff4 ****/
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
		/**** md5 signature: 2517b76b176957c99a729b7a6eb5838c ****/
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
		/**** md5 signature: b3a472883e7a5f479ca0056e13391243 ****/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "Initializes the linear form class.

Returns
-------
None
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm();

		/****************** BRepFeat_MakeLinearForm ******************/
		/**** md5 signature: c0ab9d4da64ce70e63532385bc1370ef ****/
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
		/**** md5 signature: 1958ed6feaed653cc58352476d181b28 ****/
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
		/**** md5 signature: c57fb37411988458f322160e1faeec9c ****/
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
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs a prism from the wire to the plane along the basis shape sbase. reconstructs the feature topologically.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Propagate ******************/
		/**** md5 signature: adcdddff34ee701126f7caab0efa651f ****/
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
		/**** md5 signature: b6ec45d33d268911619eb6518659a655 ****/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "Initializes the pipe class.

Returns
-------
None
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe();

		/****************** BRepFeat_MakePipe ******************/
		/**** md5 signature: 9a729843666efd38155cd635e17174fc ****/
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
		/**** md5 signature: 1958ed6feaed653cc58352476d181b28 ****/
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
		/**** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		/**** md5 signature: 07f751f9dfafc7503dd439055f5b554f ****/
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
		/**** md5 signature: 13c3f77362b6067f1fbdd2ba1e92d958 ****/
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
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Perform ******************/
		/**** md5 signature: 10b8c982858685e75beee187b373027e ****/
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
		/**** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ****/
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
		/**** md5 signature: 29088ef3d93f66c4fac678a6bdb1fc3f ****/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "Builds a prism by projecting a wire along the face of a shape. initializes the prism class.

Returns
-------
None
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism();

		/****************** BRepFeat_MakePrism ******************/
		/**** md5 signature: 7db5164394edfcc899ebbd3bb688c3fc ****/
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
		/**** md5 signature: 1958ed6feaed653cc58352476d181b28 ****/
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
		/**** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Generates a curve along the center of mass of the primitive.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		/**** md5 signature: 07f751f9dfafc7503dd439055f5b554f ****/
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
		/**** md5 signature: 27921e8866c46fd571e4916d337b0ff4 ****/
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
		/**** md5 signature: 921dd6f91281e2488215eafa36261fe3 ****/
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
		/**** md5 signature: 10b8c982858685e75beee187b373027e ****/
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
		/**** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ****/
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
		/**** md5 signature: 2ae4aebaae52040c3272099e5b6fc393 ****/
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
		/**** md5 signature: 92616bf7c450284136e687eb7af8bafd ****/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Builds an infinite prism. the infinite descendants will not be kept in the result.

Returns
-------
None
") PerformThruAll;
		void PerformThruAll();

		/****************** PerformUntilEnd ******************/
		/**** md5 signature: 6feb6fa4d6c705b4d577d6e26f2f6b24 ****/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Realizes a semi-infinite prism, limited by the position of the prism base. all other faces extend infinitely.

Returns
-------
None
") PerformUntilEnd;
		void PerformUntilEnd();

		/****************** PerformUntilHeight ******************/
		/**** md5 signature: a7c4efe8d2b443f212d0783579b1403a ****/
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
		/**** md5 signature: 609fe8b8590e4a7f4ae6631dc2857a92 ****/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "Initializes the revolved shell class.

Returns
-------
None
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol();

		/****************** BRepFeat_MakeRevol ******************/
		/**** md5 signature: 2b9607178edc298f7a78ff1d5cf30402 ****/
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
		/**** md5 signature: 1958ed6feaed653cc58352476d181b28 ****/
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
		/**** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		/**** md5 signature: 07f751f9dfafc7503dd439055f5b554f ****/
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
		/**** md5 signature: 204ce292f4f566e4506694c7e7314a55 ****/
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
		/**** md5 signature: 6a7a2ae149125c85eb43bdf43080f3fa ****/
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
		/**** md5 signature: 10b8c982858685e75beee187b373027e ****/
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
		/**** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ****/
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
		/**** md5 signature: 92616bf7c450284136e687eb7af8bafd ****/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Builds an infinite shell. the infinite descendants will not be kept in the result.

Returns
-------
None
") PerformThruAll;
		void PerformThruAll();

		/****************** PerformUntilAngle ******************/
		/**** md5 signature: 1f41e4ebc99ac743b4e9d885ea6242a4 ****/
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
		/**** md5 signature: 302eb4f703035b0ebb1f2db4645e0923 ****/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "Initializes the linear form class.

Returns
-------
None
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm();

		/****************** BRepFeat_MakeRevolutionForm ******************/
		/**** md5 signature: ff82b0fdd2670104a2362ed0daefc10d ****/
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
		/**** md5 signature: 1958ed6feaed653cc58352476d181b28 ****/
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
		/**** md5 signature: 9ca78664b7e171890eaab6bc207dce08 ****/
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
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs a prism from the wire to the plane along the basis shape s. reconstructs the feature topologically.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Propagate ******************/
		/**** md5 signature: adcdddff34ee701126f7caab0efa651f ****/
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
