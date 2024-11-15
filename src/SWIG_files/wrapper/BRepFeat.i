/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepfeat.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Message_module.hxx>
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
#include<IntCurvesFace_module.hxx>
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
%import Message.i
%import BRepBuilderAPI.i
%import TColGeom.i
%import LocOpe.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepFeat_PerfSelection {
	BRepFeat_NoSelection = 0,
	BRepFeat_SelectionFU = 1,
	BRepFeat_SelectionU = 2,
	BRepFeat_SelectionSh = 3,
	BRepFeat_SelectionShU = 4,
};

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

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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
		/****** BRepFeat::Barycenter ******/
		/****** md5 signature: 95775d579f12e55fb164530ec70906cd ******/
		%feature("compactdefaultargs") Barycenter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Pt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Barycenter;
		static void Barycenter(const TopoDS_Shape & S, gp_Pnt & Pt);

		/****** BRepFeat::FaceUntil ******/
		/****** md5 signature: 309ff593b2beab1849c6368b9ce43f4d ******/
		%feature("compactdefaultargs") FaceUntil;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") FaceUntil;
		static void FaceUntil(const TopoDS_Shape & S, TopoDS_Face & F);

		/****** BRepFeat::IsInside ******/
		/****** md5 signature: 63eaa8339348f969538073e9ce46d5b2 ******/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
bool

Description
-----------
No available documentation.
") IsInside;
		static Standard_Boolean IsInside(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepFeat::ParametricBarycenter ******/
		/****** md5 signature: cdd91b88ac72b66970d2700500d4e3cf ******/
		%feature("compactdefaultargs") ParametricBarycenter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve

Return
-------
float

Description
-----------
No available documentation.
") ParametricBarycenter;
		static Standard_Real ParametricBarycenter(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C);

		/****** BRepFeat::ParametricMinMax ******/
		/****** md5 signature: 56d330cb4df86fc5c903ada4a5743fa7 ******/
		%feature("compactdefaultargs") ParametricMinMax;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve
Ori: bool (optional, default to Standard_False)

Return
-------
prmin: float
prmax: float
prbmin: float
prbmax: float
flag: bool

Description
-----------
Ori = true taking account the orientation.
") ParametricMinMax;
		static void ParametricMinMax(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue, const Standard_Boolean Ori = Standard_False);

		/****** BRepFeat::Print ******/
		/****** md5 signature: a6852c8c0afb9e1a2f070d2ece4eddfa ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
SE: BRepFeat_StatusError

Return
-------
S: Standard_OStream

Description
-----------
Prints the error description of the state <st> as a string on the stream <s> and returns <s>.
") Print;
		static Standard_OStream & Print(const BRepFeat_StatusError SE, std::ostream &OutValue);

		/****** BRepFeat::SampleEdges ******/
		/****** md5 signature: f1154ae22c369e9497c31a5a83612489 ******/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Pt: TColgp_SequenceOfPnt

Return
-------
None

Description
-----------
No available documentation.
") SampleEdges;
		static void SampleEdges(const TopoDS_Shape & S, TColgp_SequenceOfPnt & Pt);

		/****** BRepFeat::Tool ******/
		/****** md5 signature: e034f31a8da64d381b1bc24eb325043a ******/
		%feature("compactdefaultargs") Tool;
		%feature("autodoc", "
Parameters
----------
SRef: TopoDS_Shape
Fac: TopoDS_Face
Orf: TopAbs_Orientation

Return
-------
TopoDS_Solid

Description
-----------
No available documentation.
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
		/****** BRepFeat_Builder::BRepFeat_Builder ******/
		/****** md5 signature: fd1a198e0751532f2ed9562148204d5d ******/
		%feature("compactdefaultargs") BRepFeat_Builder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFeat_Builder;
		 BRepFeat_Builder();

		/****** BRepFeat_Builder::CheckSolidImages ******/
		/****** md5 signature: 24eff084f084a5e8c3f207b7efcb0954 ******/
		%feature("compactdefaultargs") CheckSolidImages;
		%feature("autodoc", "Return
-------
None

Description
-----------
Collects the images of the object, that contains in the images of the tool.
") CheckSolidImages;
		void CheckSolidImages();

		/****** BRepFeat_Builder::Clear ******/
		/****** md5 signature: f671931d03948860d0ead34afbe920aa ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields and arguments.
") Clear;
		virtual void Clear();

		/****** BRepFeat_Builder::FillRemoved ******/
		/****** md5 signature: 1be497a0c9953c13eff3543c81a2ff52 ******/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "Return
-------
None

Description
-----------
Collects the removed parts of the tool into myremoved map.
") FillRemoved;
		void FillRemoved();

		/****** BRepFeat_Builder::FillRemoved ******/
		/****** md5 signature: c816ecc7c07dc50e02f8c73fac35badb ******/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theM: TopTools_MapOfShape

Return
-------
None

Description
-----------
Adds the shape s and its sub-shapes into myremoved map.
") FillRemoved;
		void FillRemoved(const TopoDS_Shape & theS, TopTools_MapOfShape & theM);

		/****** BRepFeat_Builder::Init ******/
		/****** md5 signature: e8c5d8680206212eeeecebd0f84dc5c5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the object of local boolean operation.
") Init;
		void Init(const TopoDS_Shape & theShape);

		/****** BRepFeat_Builder::Init ******/
		/****** md5 signature: 740bc54164d5b82a500c1564e244a758 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theTool: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the arguments of local boolean operation.
") Init;
		void Init(const TopoDS_Shape & theShape, const TopoDS_Shape & theTool);

		/****** BRepFeat_Builder::KeepPart ******/
		/****** md5 signature: dce8aa3a6ec2e00d552d5e6f6662cecf ******/
		%feature("compactdefaultargs") KeepPart;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
None

Description
-----------
Adds shape thes and all its sub-shapes into myshapes map.
") KeepPart;
		void KeepPart(const TopoDS_Shape & theS);

		/****** BRepFeat_Builder::KeepParts ******/
		/****** md5 signature: 87c4cd5b43d1f9a01b576ee02f68e27d ******/
		%feature("compactdefaultargs") KeepParts;
		%feature("autodoc", "
Parameters
----------
theIm: TopTools_ListOfShape

Return
-------
None

Description
-----------
Initializes parts of the tool for second step of algorithm. collects shapes and all sub-shapes into myshapes map.
") KeepParts;
		void KeepParts(const TopTools_ListOfShape & theIm);

		/****** BRepFeat_Builder::PartsOfTool ******/
		/****** md5 signature: 9044d67ce0e79270261d1a8e7d2ef480 ******/
		%feature("compactdefaultargs") PartsOfTool;
		%feature("autodoc", "
Parameters
----------
theLT: TopTools_ListOfShape

Return
-------
None

Description
-----------
Collects parts of the tool.
") PartsOfTool;
		void PartsOfTool(TopTools_ListOfShape & theLT);

		/****** BRepFeat_Builder::PerformResult ******/
		/****** md5 signature: ad968597e719efbcf84e11e3ce8b1439 ******/
		%feature("compactdefaultargs") PerformResult;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Main function to build the result of the local operation required.
") PerformResult;
		void PerformResult(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFeat_Builder::RebuildEdge ******/
		/****** md5 signature: d7d24342c4440d5e9583f009a4320033 ******/
		%feature("compactdefaultargs") RebuildEdge;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Shape
theF: TopoDS_Face
theME: TopTools_MapOfShape
aLEIm: TopTools_ListOfShape

Return
-------
None

Description
-----------
Rebuilds edges in accordance with the kept parts of the tool.
") RebuildEdge;
		void RebuildEdge(const TopoDS_Shape & theE, const TopoDS_Face & theF, const TopTools_MapOfShape & theME, TopTools_ListOfShape & aLEIm);

		/****** BRepFeat_Builder::RebuildFaces ******/
		/****** md5 signature: a13f1f83a7ee0e9f7f7f1dfc7462f976 ******/
		%feature("compactdefaultargs") RebuildFaces;
		%feature("autodoc", "Return
-------
None

Description
-----------
Rebuilds faces in accordance with the kept parts of the tool.
") RebuildFaces;
		void RebuildFaces();

		/****** BRepFeat_Builder::SetOperation ******/
		/****** md5 signature: 89876d5f4747477c7452d0cea9eed11b ******/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "
Parameters
----------
theFuse: int

Return
-------
None

Description
-----------
Sets the operation of local boolean operation. if thefuse = 0 than the operation is cut, otherwise fuse.
") SetOperation;
		void SetOperation(const Standard_Integer theFuse);

		/****** BRepFeat_Builder::SetOperation ******/
		/****** md5 signature: 8f486220b30ab20b482b117459ad7941 ******/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "
Parameters
----------
theFuse: int
theFlag: bool

Return
-------
None

Description
-----------
Sets the operation of local boolean operation. if theflag = true it means that no selection of parts of the tool is needed, t.e. no second part. in that case if thefuse = 0 than operation is common, otherwise cut21. if theflag = false setoperation(thefuse) function is called.
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
		/****** BRepFeat_Form::BarycCurve ******/
		/****** md5 signature: d1ddc085cbe99b4dc40aa66869015d0d ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		virtual opencascade::handle<Geom_Curve> BarycCurve();

		/****** BRepFeat_Form::BasisShapeValid ******/
		/****** md5 signature: ae52416b47a8fa29be6f02618978790f ******/
		%feature("compactdefaultargs") BasisShapeValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the basis shape is present.
") BasisShapeValid;
		void BasisShapeValid();

		/****** BRepFeat_Form::CurrentStatusError ******/
		/****** md5 signature: 5c642a7308522a33086b9a7dc347c71b ******/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", "Return
-------
BRepFeat_StatusError

Description
-----------
No available documentation.
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError();

		/****** BRepFeat_Form::Curves ******/
		/****** md5 signature: c90fd281c4f780878cf7fa2221d3f3a0 ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		virtual void Curves(TColGeom_SequenceOfCurve & S);

		/****** BRepFeat_Form::FirstShape ******/
		/****** md5 signature: 3308814aad8b5a3d6b7d0ad13d83c3f8 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes created at the bottom of the created form. it may be an empty list.
") FirstShape;
		const TopTools_ListOfShape & FirstShape();

		/****** BRepFeat_Form::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of the created faces from the shape <s>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepFeat_Form::GeneratedShapeValid ******/
		/****** md5 signature: 63a556c0a5250c6b6acde4db96ea4c68 ******/
		%feature("compactdefaultargs") GeneratedShapeValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the generated shape s is present.
") GeneratedShapeValid;
		void GeneratedShapeValid();

		/****** BRepFeat_Form::GluedFacesValid ******/
		/****** md5 signature: 53476bb17c896d3f0d36b3fefa4028ab ******/
		%feature("compactdefaultargs") GluedFacesValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the glued face is present.
") GluedFacesValid;
		void GluedFacesValid();

		/****** BRepFeat_Form::IsDeleted ******/
		/****** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****** BRepFeat_Form::LastShape ******/
		/****** md5 signature: 420855638ec0220b6ca81d51c3a55b78 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes created at the top of the created form. it may be an empty list.
") LastShape;
		const TopTools_ListOfShape & LastShape();

		/****** BRepFeat_Form::Modified ******/
		/****** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of generated faces.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****** BRepFeat_Form::NewEdges ******/
		/****** md5 signature: cdc7ef234fb9eb0a739ace74b44cca14 ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of fillets. it may be an empty list.
") NewEdges;
		const TopTools_ListOfShape & NewEdges();

		/****** BRepFeat_Form::PerfSelectionValid ******/
		/****** md5 signature: e860c269c453c4afb0c3c359332fcefc ******/
		%feature("compactdefaultargs") PerfSelectionValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the selected face is present.
") PerfSelectionValid;
		void PerfSelectionValid();

		/****** BRepFeat_Form::ShapeFromValid ******/
		/****** md5 signature: 3b61d70ac0d5d844804a95a8528936e3 ******/
		%feature("compactdefaultargs") ShapeFromValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the shape is present from the specified integer on.
") ShapeFromValid;
		void ShapeFromValid();

		/****** BRepFeat_Form::ShapeUntilValid ******/
		/****** md5 signature: 4830a2b19464d95992c8450ba3d8a286 ******/
		%feature("compactdefaultargs") ShapeUntilValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the shape is present until the specified integer.
") ShapeUntilValid;
		void ShapeUntilValid();

		/****** BRepFeat_Form::SketchFaceValid ******/
		/****** md5 signature: 748870012fe1dda56261fb89ad219013 ******/
		%feature("compactdefaultargs") SketchFaceValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the sketch face is present. if the sketch face is inside the basis shape, local operations such as glueing can be performed.
") SketchFaceValid;
		void SketchFaceValid();

		/****** BRepFeat_Form::TgtEdges ******/
		/****** md5 signature: 2c3d33bfb9d502b29d86c6dafd2350e0 ******/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. the list provides the information necessary for subsequent addition of fillets. it may be an empty list. if an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.
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
		/****** BRepFeat_Gluer::BRepFeat_Gluer ******/
		/****** md5 signature: 7f789f0b255d65d726f02c3a29cff722 ******/
		%feature("compactdefaultargs") BRepFeat_Gluer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an empty constructor.
") BRepFeat_Gluer;
		 BRepFeat_Gluer();

		/****** BRepFeat_Gluer::BRepFeat_Gluer ******/
		/****** md5 signature: f4486bf2a24695e641a27f281d81a2f1 ******/
		%feature("compactdefaultargs") BRepFeat_Gluer;
		%feature("autodoc", "
Parameters
----------
Snew: TopoDS_Shape
Sbase: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the shapes to be glued, the new shape snew and the basis shape sbase.
") BRepFeat_Gluer;
		 BRepFeat_Gluer(const TopoDS_Shape & Snew, const TopoDS_Shape & Sbase);

		/****** BRepFeat_Gluer::BasisShape ******/
		/****** md5 signature: 21cd65d6b80cb61a9e13e787117a65b0 ******/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the basis shape of the compound shape.
") BasisShape;
		const TopoDS_Shape BasisShape();

		/****** BRepFeat_Gluer::Bind ******/
		/****** md5 signature: 00651bec56a12d0418e54d774f302230 ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Fnew: TopoDS_Face
Fbase: TopoDS_Face

Return
-------
None

Description
-----------
Defines a contact between fnew on the new shape snew and fbase on the basis shape sbase. informs other methods that fnew in the new shape snew is connected to the face fbase in the basis shape sbase. the contact faces of the glued shape must not have parts outside the contact faces of the basis shape. this indicates that glueing is possible.
") Bind;
		void Bind(const TopoDS_Face & Fnew, const TopoDS_Face & Fbase);

		/****** BRepFeat_Gluer::Bind ******/
		/****** md5 signature: 3016e09a55c1e17b8452fe31e36138db ******/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Enew: TopoDS_Edge
Ebase: TopoDS_Edge

Return
-------
None

Description
-----------
Nforms other methods that the edge enew in the new shape is the same as the edge ebase in the basis shape and is therefore attached to the basis shape. this indicates that glueing is possible.
") Bind;
		void Bind(const TopoDS_Edge & Enew, const TopoDS_Edge & Ebase);

		/****** BRepFeat_Gluer::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
This is called by shape(). it does nothing but may be redefined.
") Build;
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFeat_Gluer::GluedShape ******/
		/****** md5 signature: cc05062c19ffec36edea50e2f74757fb ******/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting compound shape.
") GluedShape;
		const TopoDS_Shape GluedShape();

		/****** BRepFeat_Gluer::Init ******/
		/****** md5 signature: 115f57cbd7c4f9c5a742b814b00a0ef6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Snew: TopoDS_Shape
Sbase: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the new shape snew and the basis shape sbase for the local glueing operation.
") Init;
		void Init(const TopoDS_Shape & Snew, const TopoDS_Shape & Sbase);

		/****** BRepFeat_Gluer::IsDeleted ******/
		/****** md5 signature: 1a016772dc188bec4b890b93a447dc5d ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns the status of the face after the shape creation.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****** BRepFeat_Gluer::Modified ******/
		/****** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of generated faces.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****** BRepFeat_Gluer::OpeType ******/
		/****** md5 signature: 6301740c99fde6f602c33a48a205b637 ******/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", "Return
-------
LocOpe_Operation

Description
-----------
Determine which operation type to use glueing or sliding.
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
		/****** BRepFeat_RibSlot::ChoiceOfFaces ******/
		/****** md5 signature: 3d2f5131b0512cb094ab2a0a28933417 ******/
		%feature("compactdefaultargs") ChoiceOfFaces;
		%feature("autodoc", "
Parameters
----------
faces: TopTools_ListOfShape
cc: Geom_Curve
par: float
bnd: float
Pln: Geom_Plane

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") ChoiceOfFaces;
		static TopoDS_Face ChoiceOfFaces(TopTools_ListOfShape & faces, const opencascade::handle<Geom_Curve> & cc, const Standard_Real par, const Standard_Real bnd, const opencascade::handle<Geom_Plane> & Pln);

		/****** BRepFeat_RibSlot::CurrentStatusError ******/
		/****** md5 signature: 5c642a7308522a33086b9a7dc347c71b ******/
		%feature("compactdefaultargs") CurrentStatusError;
		%feature("autodoc", "Return
-------
BRepFeat_StatusError

Description
-----------
No available documentation.
") CurrentStatusError;
		BRepFeat_StatusError CurrentStatusError();

		/****** BRepFeat_RibSlot::FacesForDraft ******/
		/****** md5 signature: bb294b3d28b2baf096a3677dfbc96070 ******/
		%feature("compactdefaultargs") FacesForDraft;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of the limiting and glueing faces generated by the feature. these faces did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of a draft to a face. it may be an empty list. if a face has tangent edges, no draft is possible, and the tangent edges must subsequently be removed if you want to add a draft to the face.
") FacesForDraft;
		const TopTools_ListOfShape & FacesForDraft();

		/****** BRepFeat_RibSlot::FirstShape ******/
		/****** md5 signature: 3308814aad8b5a3d6b7d0ad13d83c3f8 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes created at the bottom of the created form. it may be an empty list.
") FirstShape;
		const TopTools_ListOfShape & FirstShape();

		/****** BRepFeat_RibSlot::Generated ******/
		/****** md5 signature: 12bed2c8d73d25dddf738c72a9352693 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list toptools_listofshape of the faces s created in the shape.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepFeat_RibSlot::IntPar ******/
		/****** md5 signature: 0532efa1b66eddb1b75d8854720d015d ******/
		%feature("compactdefaultargs") IntPar;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
P: gp_Pnt

Return
-------
float

Description
-----------
No available documentation.
") IntPar;
		static Standard_Real IntPar(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P);

		/****** BRepFeat_RibSlot::IsDeleted ******/
		/****** md5 signature: 1a016772dc188bec4b890b93a447dc5d ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if f a topods_shape of type edge or face has been deleted.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****** BRepFeat_RibSlot::LastShape ******/
		/****** md5 signature: 420855638ec0220b6ca81d51c3a55b78 ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes created at the top of the created form. it may be an empty list.
") LastShape;
		const TopTools_ListOfShape & LastShape();

		/****** BRepFeat_RibSlot::Modified ******/
		/****** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of generated faces f. this list may be empty.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****** BRepFeat_RibSlot::NewEdges ******/
		/****** md5 signature: cdc7ef234fb9eb0a739ace74b44cca14 ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape. the list provides the information necessary for subsequent addition of fillets. it may be an empty list.
") NewEdges;
		const TopTools_ListOfShape & NewEdges();

		/****** BRepFeat_RibSlot::TgtEdges ******/
		/****** md5 signature: 2c3d33bfb9d502b29d86c6dafd2350e0 ******/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. these edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. the list provides the information necessary for subsequent addition of fillets. it may be an empty list. if an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.
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
		/****** BRepFeat_SplitShape::BRepFeat_SplitShape ******/
		/****** md5 signature: 7fb4c09fb205f747a7f5b474bb0bb2c7 ******/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape();

		/****** BRepFeat_SplitShape::BRepFeat_SplitShape ******/
		/****** md5 signature: d86eca78d22979b8ff6e67ac09b56988 ******/
		%feature("compactdefaultargs") BRepFeat_SplitShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates the process with the shape <s>.
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape(const TopoDS_Shape & S);

		/****** BRepFeat_SplitShape::Add ******/
		/****** md5 signature: a2f8855eb9d20716f921d30ba939fd6a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theEdges: TopTools_SequenceOfShape

Return
-------
bool

Description
-----------
Add splitting edges or wires for whole initial shape without additional specification edge->face, edge->edge this method puts edge on the corresponding faces from initial shape.
") Add;
		Standard_Boolean Add(const TopTools_SequenceOfShape & theEdges);

		/****** BRepFeat_SplitShape::Add ******/
		/****** md5 signature: 73487f98ab9ba9984904e685f5fae091 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
None

Description
-----------
Adds the wire <w> on the face <f>. raises nosuchobject if <f> does not belong to the original shape.
") Add;
		void Add(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****** BRepFeat_SplitShape::Add ******/
		/****** md5 signature: d621d461f76c392b22927a1a44cfbc16 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Adds the edge <e> on the face <f>.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepFeat_SplitShape::Add ******/
		/****** md5 signature: b6f3642f26ba028306325db45aed0ed7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Comp: TopoDS_Compound
F: TopoDS_Face

Return
-------
None

Description
-----------
Adds the compound <comp> on the face <f>. the compound <comp> must consist of edges lying on the face <f>. if edges are geometrically connected, they must be connected topologically, i.e. they must share common vertices. //! raises nosuchobject if <f> does not belong to the original shape.
") Add;
		void Add(const TopoDS_Compound & Comp, const TopoDS_Face & F);

		/****** BRepFeat_SplitShape::Add ******/
		/****** md5 signature: 058eae25f3940954a03a0173df9bce9b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
EOn: TopoDS_Edge

Return
-------
None

Description
-----------
Adds the edge <e> on the existing edge <eon>.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Edge & EOn);

		/****** BRepFeat_SplitShape::Build ******/
		/****** md5 signature: 6845a51502d14bd916482d98b6487bc6 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the cut and the resulting faces and edges as well.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFeat_SplitShape::DirectLeft ******/
		/****** md5 signature: 3439933aeda7f1a1ec21dfaafbe0ab1a ******/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces which are the left of the projected wires.
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft();

		/****** BRepFeat_SplitShape::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes the process on the shape <s>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepFeat_SplitShape::IsDeleted ******/
		/****** md5 signature: 28be7c17a3b2776f59567554f488bbf5 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if the shape has been deleted.
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****** BRepFeat_SplitShape::Left ******/
		/****** md5 signature: 70ee7865256185190dd6eecfb1fc40f8 ******/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces of the 'left' part on the shape. (it is build from directleft, with the faces connected to this set, and so on...). raises notdone if isdone returns <standard_false>.
") Left;
		const TopTools_ListOfShape & Left();

		/****** BRepFeat_SplitShape::Modified ******/
		/****** md5 signature: d6a88f48819eaeb375ffa39db07ab939 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of generated faces.
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****** BRepFeat_SplitShape::Right ******/
		/****** md5 signature: 2734ad1e91a0abfa780551bd587a1449 ******/
		%feature("compactdefaultargs") Right;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces of the 'right' part on the shape.
") Right;
		const TopTools_ListOfShape & Right();

		/****** BRepFeat_SplitShape::SetCheckInterior ******/
		/****** md5 signature: 2d00b58c59d6af210c84a7fdd261d94b ******/
		%feature("compactdefaultargs") SetCheckInterior;
		%feature("autodoc", "
Parameters
----------
ToCheckInterior: bool

Return
-------
None

Description
-----------
Set the flag of check internal intersections default value is true (to check).
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
		/****** BRepFeat_MakeCylindricalHole::BRepFeat_MakeCylindricalHole ******/
		/****** md5 signature: 58c4d86e740884755488b274c73f95f1 ******/
		%feature("compactdefaultargs") BRepFeat_MakeCylindricalHole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BRepFeat_MakeCylindricalHole;
		 BRepFeat_MakeCylindricalHole();

		/****** BRepFeat_MakeCylindricalHole::Build ******/
		/****** md5 signature: 634d88e5c99c5ce236c07b337243d591 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds the resulting shape (redefined from makeshape). invalidates the given parts of tools if any, and performs the result of the local operation.
") Build;
		void Build();

		/****** BRepFeat_MakeCylindricalHole::Init ******/
		/****** md5 signature: dfebb8f53795a8547d999d68d22be1d7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1

Return
-------
None

Description
-----------
Sets the axis of the hole(s).
") Init;
		void Init(const gp_Ax1 & Axis);

		/****** BRepFeat_MakeCylindricalHole::Init ******/
		/****** md5 signature: 341b409eb6e8df45d9a033137c13c001 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Axis: gp_Ax1

Return
-------
None

Description
-----------
Sets the shape and axis on which hole(s) will be performed.
") Init;
		void Init(const TopoDS_Shape & S, const gp_Ax1 & Axis);

		/****** BRepFeat_MakeCylindricalHole::Perform ******/
		/****** md5 signature: d29e853e573ef7e11a66ef3857a2c5cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Radius: float

Return
-------
None

Description
-----------
Performs every holes of radius <radius>. this command has the same effect as a cut operation with an infinite cylinder defined by the given axis and <radius>.
") Perform;
		void Perform(const Standard_Real Radius);

		/****** BRepFeat_MakeCylindricalHole::Perform ******/
		/****** md5 signature: 692010be9cefee836dc51667b7cdc333 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Radius: float
PFrom: float
PTo: float
WithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs evry hole of radius <radius> located between pfrom and pto on the given axis. if <withcontrol> is set to standard_false no control are done on the resulting shape after the operation is performed.
") Perform;
		void Perform(const Standard_Real Radius, const Standard_Real PFrom, const Standard_Real PTo, const Standard_Boolean WithControl = Standard_True);

		/****** BRepFeat_MakeCylindricalHole::PerformBlind ******/
		/****** md5 signature: d6ad4465337920a7bace20f06cddf9a4 ******/
		%feature("compactdefaultargs") PerformBlind;
		%feature("autodoc", "
Parameters
----------
Radius: float
Length: float
WithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs a blind hole of radius <radius> and length <length>. the length is measured from the origin of the given axis. if <withcontrol> is set to standard_false no control are done after the operation is performed.
") PerformBlind;
		void PerformBlind(const Standard_Real Radius, const Standard_Real Length, const Standard_Boolean WithControl = Standard_True);

		/****** BRepFeat_MakeCylindricalHole::PerformThruNext ******/
		/****** md5 signature: 3c97de21db8ff53771e449f91c5b073b ******/
		%feature("compactdefaultargs") PerformThruNext;
		%feature("autodoc", "
Parameters
----------
Radius: float
WithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs the first hole of radius <radius>, in the direction of the defined axis. first hole signify first encountered after the origin of the axis. if <withcontrol> is set to standard_false no control are done on the resulting shape after the operation is performed.
") PerformThruNext;
		void PerformThruNext(const Standard_Real Radius, const Standard_Boolean WithControl = Standard_True);

		/****** BRepFeat_MakeCylindricalHole::PerformUntilEnd ******/
		/****** md5 signature: 66cdda3afb2a9ca35971dfed1fd5ab7d ******/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "
Parameters
----------
Radius: float
WithControl: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs evry holes of radius <radius> located after the origin of the given axis. if <withcontrol> is set to standard_false no control are done on the resulting shape after the operation is performed.
") PerformUntilEnd;
		void PerformUntilEnd(const Standard_Real Radius, const Standard_Boolean WithControl = Standard_True);

		/****** BRepFeat_MakeCylindricalHole::Status ******/
		/****** md5 signature: 6857f3614226fbbdaae5e244ae4256ba ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
BRepFeat_Status

Description
-----------
Returns the status after a hole is performed.
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
		/****** BRepFeat_MakeDPrism::BRepFeat_MakeDPrism ******/
		/****** md5 signature: ab28b5dd2f9cd5ff4235412c13babcfb ******/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Face
Skface: TopoDS_Face
Angle: float
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
A face pbase is selected in the shape sbase to serve as the basis for the draft prism. the draft will be defined by the angle angle and fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed. initializes the draft prism class.
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism(const TopoDS_Shape & Sbase, const TopoDS_Face & Pbase, const TopoDS_Face & Skface, const Standard_Real Angle, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakeDPrism::BRepFeat_MakeDPrism ******/
		/****** md5 signature: 72552317c20790f89347229a5f21c621 ******/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism();

		/****** BRepFeat_MakeDPrism::Add ******/
		/****** md5 signature: 1958ed6feaed653cc58352476d181b28 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Return
-------
None

Description
-----------
Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeDPrism::BarycCurve ******/
		/****** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** BRepFeat_MakeDPrism::BossEdges ******/
		/****** md5 signature: b65728171e50e3a538f10d4a296bea46 ******/
		%feature("compactdefaultargs") BossEdges;
		%feature("autodoc", "
Parameters
----------
sig: int

Return
-------
None

Description
-----------
Determination of topedges and latedges. sig = 1 -> topedges = firstshape of the dprism sig = 2 -> topedges = lastshape of the dprism.
") BossEdges;
		void BossEdges(const Standard_Integer sig);

		/****** BRepFeat_MakeDPrism::Curves ******/
		/****** md5 signature: 07f751f9dfafc7503dd439055f5b554f ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****** BRepFeat_MakeDPrism::Init ******/
		/****** md5 signature: 1c308bd80cbfde6bd9a04d2c26e4b328 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Face
Skface: TopoDS_Face
Angle: float
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Initializes this algorithm for building draft prisms along surfaces. a face pbase is selected in the basis shape sbase to serve as the basis from the draft prism. the draft will be defined by the angle angle and fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Face & Pbase, const TopoDS_Face & Skface, const Standard_Real Angle, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakeDPrism::LatEdges ******/
		/****** md5 signature: 8a9db9ef1cd1c382e2f11897bd51d3ed ******/
		%feature("compactdefaultargs") LatEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of topods edges of the bottom of the boss.
") LatEdges;
		const TopTools_ListOfShape & LatEdges();

		/****** BRepFeat_MakeDPrism::Perform ******/
		/****** md5 signature: 9d97b158b743926dc89782af13894b65 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Height: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real Height);

		/****** BRepFeat_MakeDPrism::Perform ******/
		/****** md5 signature: 10b8c982858685e75beee187b373027e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****** BRepFeat_MakeDPrism::Perform ******/
		/****** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Return
-------
None

Description
-----------
Assigns one of the following semantics - to a height height - to a face until - from a face from to a height until. reconstructs the feature topologically according to the semantic option chosen.
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

		/****** BRepFeat_MakeDPrism::PerformFromEnd ******/
		/****** md5 signature: 2ae4aebaae52040c3272099e5b6fc393 ******/
		%feature("compactdefaultargs") PerformFromEnd;
		%feature("autodoc", "
Parameters
----------
FUntil: TopoDS_Shape

Return
-------
None

Description
-----------
Realizes a semi-infinite prism, limited by the face funtil.
") PerformFromEnd;
		void PerformFromEnd(const TopoDS_Shape & FUntil);

		/****** BRepFeat_MakeDPrism::PerformThruAll ******/
		/****** md5 signature: 92616bf7c450284136e687eb7af8bafd ******/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an infinite prism. the infinite descendants will not be kept in the result.
") PerformThruAll;
		void PerformThruAll();

		/****** BRepFeat_MakeDPrism::PerformUntilEnd ******/
		/****** md5 signature: 6feb6fa4d6c705b4d577d6e26f2f6b24 ******/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Return
-------
None

Description
-----------
Realizes a semi-infinite prism, limited by the position of the prism base.
") PerformUntilEnd;
		void PerformUntilEnd();

		/****** BRepFeat_MakeDPrism::PerformUntilHeight ******/
		/****** md5 signature: eb1cd9128736557f1abf6daa81bfbff4 ******/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape
Height: float

Return
-------
None

Description
-----------
Assigns both a limiting shape, until from topods_shape, and a height, height at which to stop generation of the prism feature.
") PerformUntilHeight;
		void PerformUntilHeight(const TopoDS_Shape & Until, const Standard_Real Height);

		/****** BRepFeat_MakeDPrism::TopEdges ******/
		/****** md5 signature: 2517b76b176957c99a729b7a6eb5838c ******/
		%feature("compactdefaultargs") TopEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of topods edges of the top of the boss.
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
		/****** BRepFeat_MakeLinearForm::BRepFeat_MakeLinearForm ******/
		/****** md5 signature: b3a472883e7a5f479ca0056e13391243 ******/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the linear form class.
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm();

		/****** BRepFeat_MakeLinearForm::BRepFeat_MakeLinearForm ******/
		/****** md5 signature: c0ab9d4da64ce70e63532385bc1370ef ******/
		%feature("compactdefaultargs") BRepFeat_MakeLinearForm;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
P: Geom_Plane
Direction: gp_Vec
Direction1: gp_Vec
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. direction and direction1 give the vectors for defining the direction(s) in which thickness will be built up. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & P, const gp_Vec & Direction, const gp_Vec & Direction1, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakeLinearForm::Add ******/
		/****** md5 signature: 1958ed6feaed653cc58352476d181b28 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Return
-------
None

Description
-----------
Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeLinearForm::Init ******/
		/****** md5 signature: c57fb37411988458f322160e1faeec9c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
P: Geom_Plane
Direction: gp_Vec
Direction1: gp_Vec
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Initializes this construction algorithm. a contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. the vectors for defining the direction(s) in which thickness will be built up are given by direction and direction1. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & P, const gp_Vec & Direction, const gp_Vec & Direction1, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakeLinearForm::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs a prism from the wire to the plane along the basis shape sbase. reconstructs the feature topologically.
") Perform;
		void Perform();

		/****** BRepFeat_MakeLinearForm::Propagate ******/
		/****** md5 signature: adcdddff34ee701126f7caab0efa651f ******/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape
F: TopoDS_Face
FPoint: gp_Pnt
LPoint: gp_Pnt

Return
-------
falseside: bool

Description
-----------
No available documentation.
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
		/****** BRepFeat_MakePipe::BRepFeat_MakePipe ******/
		/****** md5 signature: b6ec45d33d268911619eb6518659a655 ******/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the pipe class.
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe();

		/****** BRepFeat_MakePipe::BRepFeat_MakePipe ******/
		/****** md5 signature: 9a729843666efd38155cd635e17174fc ******/
		%feature("compactdefaultargs") BRepFeat_MakePipe;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Spine: TopoDS_Wire
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
A face pbase is selected in the shape sbase to serve as the basis for the pipe. it will be defined by the wire spine. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const TopoDS_Wire & Spine, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakePipe::Add ******/
		/****** md5 signature: 1958ed6feaed653cc58352476d181b28 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Return
-------
None

Description
-----------
Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakePipe::BarycCurve ******/
		/****** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** BRepFeat_MakePipe::Curves ******/
		/****** md5 signature: 07f751f9dfafc7503dd439055f5b554f ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****** BRepFeat_MakePipe::Init ******/
		/****** md5 signature: 13c3f77362b6067f1fbdd2ba1e92d958 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Spine: TopoDS_Wire
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Initializes this algorithm for adding pipes to shapes. a face pbase is selected in the shape sbase to serve as the basis for the pipe. it will be defined by the wire spine. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const TopoDS_Wire & Spine, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakePipe::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** BRepFeat_MakePipe::Perform ******/
		/****** md5 signature: 10b8c982858685e75beee187b373027e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****** BRepFeat_MakePipe::Perform ******/
		/****** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Return
-------
None

Description
-----------
Assigns one of the following semantics - to a face until - from a face from to a height until. reconstructs the feature topologically according to the semantic option chosen.
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
		/****** BRepFeat_MakePrism::BRepFeat_MakePrism ******/
		/****** md5 signature: 29088ef3d93f66c4fac678a6bdb1fc3f ******/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds a prism by projecting a wire along the face of a shape. initializes the prism class.
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism();

		/****** BRepFeat_MakePrism::BRepFeat_MakePrism ******/
		/****** md5 signature: 7db5164394edfcc899ebbd3bb688c3fc ******/
		%feature("compactdefaultargs") BRepFeat_MakePrism;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Direction: gp_Dir
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Builds a prism by projecting a wire along the face of a shape. a face pbase is selected in the shape sbase to serve as the basis for the prism. the orientation of the prism will be defined by the vector direction. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed. exceptions standard_constructionerror if the face does not belong to the basis or the prism shape.
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Dir & Direction, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakePrism::Add ******/
		/****** md5 signature: 1958ed6feaed653cc58352476d181b28 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Return
-------
None

Description
-----------
Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakePrism::BarycCurve ******/
		/****** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Generates a curve along the center of mass of the primitive.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** BRepFeat_MakePrism::Curves ******/
		/****** md5 signature: 07f751f9dfafc7503dd439055f5b554f ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
Returns the list of curves s parallel to the axis of the prism.
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****** BRepFeat_MakePrism::Init ******/
		/****** md5 signature: 27921e8866c46fd571e4916d337b0ff4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Direction: gp_Dir
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Initializes this algorithm for building prisms along surfaces. a face pbase is selected in the shape sbase to serve as the basis for the prism. the orientation of the prism will be defined by the vector direction. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Dir & Direction, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakePrism::Perform ******/
		/****** md5 signature: 921dd6f91281e2488215eafa36261fe3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Length: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real Length);

		/****** BRepFeat_MakePrism::Perform ******/
		/****** md5 signature: 10b8c982858685e75beee187b373027e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****** BRepFeat_MakePrism::Perform ******/
		/****** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Return
-------
None

Description
-----------
Assigns one of the following semantics - to a height length - to a face until - from a face from to a height until. reconstructs the feature topologically according to the semantic option chosen.
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

		/****** BRepFeat_MakePrism::PerformFromEnd ******/
		/****** md5 signature: 2ae4aebaae52040c3272099e5b6fc393 ******/
		%feature("compactdefaultargs") PerformFromEnd;
		%feature("autodoc", "
Parameters
----------
FUntil: TopoDS_Shape

Return
-------
None

Description
-----------
Realizes a semi-infinite prism, limited by the face funtil.
") PerformFromEnd;
		void PerformFromEnd(const TopoDS_Shape & FUntil);

		/****** BRepFeat_MakePrism::PerformThruAll ******/
		/****** md5 signature: 92616bf7c450284136e687eb7af8bafd ******/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an infinite prism. the infinite descendants will not be kept in the result.
") PerformThruAll;
		void PerformThruAll();

		/****** BRepFeat_MakePrism::PerformUntilEnd ******/
		/****** md5 signature: 6feb6fa4d6c705b4d577d6e26f2f6b24 ******/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "Return
-------
None

Description
-----------
Realizes a semi-infinite prism, limited by the position of the prism base. all other faces extend infinitely.
") PerformUntilEnd;
		void PerformUntilEnd();

		/****** BRepFeat_MakePrism::PerformUntilHeight ******/
		/****** md5 signature: a7c4efe8d2b443f212d0783579b1403a ******/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape
Length: float

Return
-------
None

Description
-----------
Assigns both a limiting shape, until from topods_shape, and a height, length at which to stop generation of the prism feature.
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
		/****** BRepFeat_MakeRevol::BRepFeat_MakeRevol ******/
		/****** md5 signature: 609fe8b8590e4a7f4ae6631dc2857a92 ******/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the revolved shell class.
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol();

		/****** BRepFeat_MakeRevol::BRepFeat_MakeRevol ******/
		/****** md5 signature: 2b9607178edc298f7a78ff1d5cf30402 ******/
		%feature("compactdefaultargs") BRepFeat_MakeRevol;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Axis: gp_Ax1
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
A face pbase is selected in the shape sbase to serve as the basis for the revolved shell. the revolution will be defined by the axis axis and fuse offers a choice between: - removing matter with a boolean cut using the setting 0 - adding matter with boolean fusion using the setting 1. the sketch face skface serves to determine the type of operation. if it is inside the basis shape, a local operation such as glueing can be performed.
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Ax1 & Axis, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakeRevol::Add ******/
		/****** md5 signature: 1958ed6feaed653cc58352476d181b28 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Return
-------
None

Description
-----------
Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeRevol::BarycCurve ******/
		/****** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** BRepFeat_MakeRevol::Curves ******/
		/****** md5 signature: 07f751f9dfafc7503dd439055f5b554f ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(TColGeom_SequenceOfCurve & S);

		/****** BRepFeat_MakeRevol::Init ******/
		/****** md5 signature: 204ce292f4f566e4506694c7e7314a55 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Shape
Skface: TopoDS_Face
Axis: gp_Ax1
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Ax1 & Axis, const Standard_Integer Fuse, const Standard_Boolean Modify);

		/****** BRepFeat_MakeRevol::Perform ******/
		/****** md5 signature: 6a7a2ae149125c85eb43bdf43080f3fa ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real Angle);

		/****** BRepFeat_MakeRevol::Perform ******/
		/****** md5 signature: 10b8c982858685e75beee187b373027e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Until);

		/****** BRepFeat_MakeRevol::Perform ******/
		/****** md5 signature: f1fa94f1bd31c2b819e36b79c175c9c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
From: TopoDS_Shape
Until: TopoDS_Shape

Return
-------
None

Description
-----------
Reconstructs the feature topologically.
") Perform;
		void Perform(const TopoDS_Shape & From, const TopoDS_Shape & Until);

		/****** BRepFeat_MakeRevol::PerformThruAll ******/
		/****** md5 signature: 92616bf7c450284136e687eb7af8bafd ******/
		%feature("compactdefaultargs") PerformThruAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds an infinite shell. the infinite descendants will not be kept in the result.
") PerformThruAll;
		void PerformThruAll();

		/****** BRepFeat_MakeRevol::PerformUntilAngle ******/
		/****** md5 signature: 1f41e4ebc99ac743b4e9d885ea6242a4 ******/
		%feature("compactdefaultargs") PerformUntilAngle;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape
Angle: float

Return
-------
None

Description
-----------
Assigns both a limiting shape, until from topods_shape, and an angle, angle at which to stop generation of the revolved shell feature.
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
		/****** BRepFeat_MakeRevolutionForm::BRepFeat_MakeRevolutionForm ******/
		/****** md5 signature: 302eb4f703035b0ebb1f2db4645e0923 ******/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the linear form class.
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm();

		/****** BRepFeat_MakeRevolutionForm::BRepFeat_MakeRevolutionForm ******/
		/****** md5 signature: ff82b0fdd2670104a2362ed0daefc10d ******/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
Plane: Geom_Plane
Axis: gp_Ax1
Height1: float
Height2: float
Fuse: int

Return
-------
Sliding: bool

Description
-----------
A contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. the axis axis of the revolved surface in the basis shape defines the feature's axis of revolution. height1 and height2 may be used as limits to the construction of the feature. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & Plane, const gp_Ax1 & Axis, const Standard_Real Height1, const Standard_Real Height2, const Standard_Integer Fuse, Standard_Boolean &OutValue);

		/****** BRepFeat_MakeRevolutionForm::Add ******/
		/****** md5 signature: 1958ed6feaed653cc58352476d181b28 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnFace: TopoDS_Face

Return
-------
None

Description
-----------
Indicates that the edge <e> will slide on the face <onface>. raises constructionerror if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeRevolutionForm::Init ******/
		/****** md5 signature: 9ca78664b7e171890eaab6bc207dce08 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
Plane: Geom_Plane
Axis: gp_Ax1
Height1: float
Height2: float
Fuse: int

Return
-------
Sliding: bool

Description
-----------
Initializes this construction algorithm a contour w, a shape sbase and a plane p are initialized to serve as the basic elements in the construction of the rib or groove. the axis axis of the revolved surface in the basis shape defines the feature's axis of revolution. height1 and height2 may be used as limits to the construction of the feature. fuse offers a choice between: - removing matter with a boolean cut using the setting 0 in case of the groove - adding matter with boolean fusion using the setting 1 in case of the rib.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & Plane, const gp_Ax1 & Axis, const Standard_Real Height1, const Standard_Real Height2, const Standard_Integer Fuse, Standard_Boolean &OutValue);

		/****** BRepFeat_MakeRevolutionForm::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs a prism from the wire to the plane along the basis shape s. reconstructs the feature topologically.
") Perform;
		void Perform();

		/****** BRepFeat_MakeRevolutionForm::Propagate ******/
		/****** md5 signature: adcdddff34ee701126f7caab0efa651f ******/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape
F: TopoDS_Face
FPoint: gp_Pnt
LPoint: gp_Pnt

Return
-------
falseside: bool

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def brepfeat_Barycenter(*args):
	return brepfeat.Barycenter(*args)

@deprecated
def brepfeat_FaceUntil(*args):
	return brepfeat.FaceUntil(*args)

@deprecated
def brepfeat_IsInside(*args):
	return brepfeat.IsInside(*args)

@deprecated
def brepfeat_ParametricBarycenter(*args):
	return brepfeat.ParametricBarycenter(*args)

@deprecated
def brepfeat_ParametricMinMax(*args):
	return brepfeat.ParametricMinMax(*args)

@deprecated
def brepfeat_Print(*args):
	return brepfeat.Print(*args)

@deprecated
def brepfeat_SampleEdges(*args):
	return brepfeat.SampleEdges(*args)

@deprecated
def brepfeat_Tool(*args):
	return brepfeat.Tool(*args)

@deprecated
def BRepFeat_RibSlot_ChoiceOfFaces(*args):
	return BRepFeat_RibSlot.ChoiceOfFaces(*args)

@deprecated
def BRepFeat_RibSlot_IntPar(*args):
	return BRepFeat_RibSlot.IntPar(*args)

}
