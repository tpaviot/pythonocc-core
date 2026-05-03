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
%define BREPFEATDOCSTRING
"BRepFeat module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepfeat.html"
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
#include<TopAbs_module.hxx>
#include<BOPAlgo_module.hxx>
#include<Message_module.hxx>
#include<BRepBuilderAPI_module.hxx>
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
#include<TopTools_module.hxx>
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
%import TopAbs.i
%import BOPAlgo.i
%import Message.i
%import BRepBuilderAPI.i
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
		/****** md5 signature: 8123e9a01ae3865a51492fb1c33e98d1 ******/
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
		static bool IsInside(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRepFeat::ParametricBarycenter ******/
		/****** md5 signature: 5cb61a968b87f69b0801bad81872b799 ******/
		%feature("compactdefaultargs") ParametricBarycenter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve

Return
-------
double

Description
-----------
No available documentation.
") ParametricBarycenter;
		static double ParametricBarycenter(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C);

		/****** BRepFeat::ParametricMinMax ******/
		/****** md5 signature: 60a2e742a3fd8c61135941a8018512e6 ******/
		%feature("compactdefaultargs") ParametricMinMax;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
C: Geom_Curve
Ori: bool (optional, default to false)

Return
-------
prmin: double
prmax: double
prbmin: double
prbmax: double
flag: bool

Description
-----------
Ori = True taking account the orientation.
") ParametricMinMax;
		static void ParametricMinMax(const TopoDS_Shape & S, const opencascade::handle<Geom_Curve> & C, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean &OutValue, const bool Ori = false);

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
Prints the Error description of the State <St> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const BRepFeat_StatusError SE, std::ostream &OutValue);

		/****** BRepFeat::SampleEdges ******/
		/****** md5 signature: 2ce5cdc73a2ff7a08367472fc563a245 ******/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Pt: NCollection_Sequence<gp_Pnt>

Return
-------
None

Description
-----------
No available documentation.
") SampleEdges;
		static void SampleEdges(const TopoDS_Shape & S, NCollection_Sequence<gp_Pnt> & Pt);

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
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal fields and arguments.
") Clear;
		void Clear();

		/****** BRepFeat_Builder::FillRemoved ******/
		/****** md5 signature: 1be497a0c9953c13eff3543c81a2ff52 ******/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "Return
-------
None

Description
-----------
Collects the removed parts of the tool into myRemoved map.
") FillRemoved;
		void FillRemoved();

		/****** BRepFeat_Builder::FillRemoved ******/
		/****** md5 signature: de67028fa2dca0e3a9c5c38f33d1ccd4 ******/
		%feature("compactdefaultargs") FillRemoved;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theM: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
Adds the shape S and its sub-shapes into myRemoved map.
") FillRemoved;
		void FillRemoved(const TopoDS_Shape & theS, NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theM);

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
Adds shape theS and all its sub-shapes into myShapes map.
") KeepPart;
		void KeepPart(const TopoDS_Shape & theS);

		/****** BRepFeat_Builder::KeepParts ******/
		/****** md5 signature: 3ee77492daed2fe496a2aac2642d2d39 ******/
		%feature("compactdefaultargs") KeepParts;
		%feature("autodoc", "
Parameters
----------
theIm: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Initializes parts of the tool for second step of algorithm. Collects shapes and all sub-shapes into myShapes map.
") KeepParts;
		void KeepParts(const NCollection_List<TopoDS_Shape> & theIm);

		/****** BRepFeat_Builder::PartsOfTool ******/
		/****** md5 signature: d1be5a19e117904ddd8832cd3bc4bf33 ******/
		%feature("compactdefaultargs") PartsOfTool;
		%feature("autodoc", "
Parameters
----------
theLT: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Collects parts of the tool.
") PartsOfTool;
		void PartsOfTool(NCollection_List<TopoDS_Shape> & theLT);

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
		/****** md5 signature: 45c2742d309c3ff90e5e4097362e890f ******/
		%feature("compactdefaultargs") RebuildEdge;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Shape
theF: TopoDS_Face
theME: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>
aLEIm: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Rebuilds edges in accordance with the kept parts of the tool.
") RebuildEdge;
		void RebuildEdge(const TopoDS_Shape & theE, const TopoDS_Face & theF, const NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & theME, NCollection_List<TopoDS_Shape> & aLEIm);

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
		/****** md5 signature: 0595750771d358d97ab46d02516a91a1 ******/
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
Sets the operation of local boolean operation. If theFuse = 0 than the operation is CUT, otherwise FUSE.
") SetOperation;
		void SetOperation(const int theFuse);

		/****** BRepFeat_Builder::SetOperation ******/
		/****** md5 signature: d234007907251c6003c9d7c2a515680b ******/
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
Sets the operation of local boolean operation. If theFlag = True it means that no selection of parts of the tool is needed, t.e. no second part. In that case if theFuse = 0 than operation is COMMON, otherwise CUT21. If theFlag = False SetOperation(theFuse) function is called.
") SetOperation;
		void SetOperation(const int theFuse, const bool theFlag);

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
		/****** md5 signature: edf2e70ce0041c54226b6fe36e5e9734 ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		virtual void Curves(NCollection_Sequence<opencascade::handle<Geom_Curve> > & S);

		/****** BRepFeat_Form::FirstShape ******/
		/****** md5 signature: c9bedc7df57b665d447c534ae0afce77 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes created at the bottom of the created form. It may be an empty list.
") FirstShape;
		const NCollection_List<TopoDS_Shape> FirstShape();

		/****** BRepFeat_Form::Generated ******/
		/****** md5 signature: afef05048bf0a3f20f9295499d9e5555 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
returns a list of the created faces from the shape <S>.
") Generated;
		const NCollection_List<TopoDS_Shape> Generated(const TopoDS_Shape & S);

		/****** BRepFeat_Form::GeneratedShapeValid ******/
		/****** md5 signature: 63a556c0a5250c6b6acde4db96ea4c68 ******/
		%feature("compactdefaultargs") GeneratedShapeValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the topological construction if the generated shape S is present.
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
		/****** md5 signature: bccb9782bf72a0b11faae5cda38123ec ******/
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
		bool IsDeleted(const TopoDS_Shape & S);

		/****** BRepFeat_Form::LastShape ******/
		/****** md5 signature: fbab69e647739e7c9cd1123eb99b9c4b ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes created at the top of the created form. It may be an empty list.
") LastShape;
		const NCollection_List<TopoDS_Shape> LastShape();

		/****** BRepFeat_Form::Modified ******/
		/****** md5 signature: 95d5c065993c1070bee9fdb9225954e4 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
returns the list of generated Faces.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & F);

		/****** BRepFeat_Form::NewEdges ******/
		/****** md5 signature: 86593e867343002ba235ed58e9970c34 ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns a list of the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of fillets. It may be an empty list.
") NewEdges;
		const NCollection_List<TopoDS_Shape> NewEdges();

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
Initializes the topological construction if the sketch face is present. If the sketch face is inside the basis shape, local operations such as glueing can be performed.
") SketchFaceValid;
		void SketchFaceValid();

		/****** BRepFeat_Form::TgtEdges ******/
		/****** md5 signature: 4625c2d2cf027a1f9f8defe365dcab16 ******/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. The list provides the information necessary for subsequent addition of fillets. It may be an empty list. If an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.
") TgtEdges;
		const NCollection_List<TopoDS_Shape> TgtEdges();

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
Initializes the shapes to be glued, the new shape Snew and the basis shape Sbase.
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
Defines a contact between Fnew on the new shape Snew and Fbase on the basis shape Sbase. Informs other methods that Fnew in the new shape Snew is connected to the face Fbase in the basis shape Sbase. The contact faces of the glued shape must not have parts outside the contact faces of the basis shape. This indicates that glueing is possible.
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
nforms other methods that the edge Enew in the new shape is the same as the edge Ebase in the basis shape and is therefore attached to the basis shape. This indicates that glueing is possible.
") Bind;
		void Bind(const TopoDS_Edge & Enew, const TopoDS_Edge & Ebase);

		/****** BRepFeat_Gluer::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
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
This is called by Shape(). It does nothing but may be redefined.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

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
Initializes the new shape Snew and the basis shape Sbase for the local glueing operation.
") Init;
		void Init(const TopoDS_Shape & Snew, const TopoDS_Shape & Sbase);

		/****** BRepFeat_Gluer::IsDeleted ******/
		/****** md5 signature: 287418bb898b77dec0442680837578c0 ******/
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
Returns the status of the Face after the shape creation.
") IsDeleted;
		bool IsDeleted(const TopoDS_Shape & F);

		/****** BRepFeat_Gluer::Modified ******/
		/****** md5 signature: 95d5c065993c1070bee9fdb9225954e4 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of generated Faces.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & F);

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
		/****** md5 signature: 30307479de882361dd3b2f4ac1f89f34 ******/
		%feature("compactdefaultargs") ChoiceOfFaces;
		%feature("autodoc", "
Parameters
----------
faces: NCollection_List<TopoDS_Shape>
cc: Geom_Curve
par: double
bnd: double
Pln: Geom_Plane

Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") ChoiceOfFaces;
		static TopoDS_Face ChoiceOfFaces(NCollection_List<TopoDS_Shape> & faces, const opencascade::handle<Geom_Curve> & cc, const double par, const double bnd, const opencascade::handle<Geom_Plane> & Pln);

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
		/****** md5 signature: 2b2f5fb202fe407f45b6f1bd652787f3 ******/
		%feature("compactdefaultargs") FacesForDraft;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns a list of the limiting and glueing faces generated by the feature. These faces did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of a draft to a face. It may be an empty list. If a face has tangent edges, no draft is possible, and the tangent edges must subsequently be removed if you want to add a draft to the face.
") FacesForDraft;
		const NCollection_List<TopoDS_Shape> FacesForDraft();

		/****** BRepFeat_RibSlot::FirstShape ******/
		/****** md5 signature: c9bedc7df57b665d447c534ae0afce77 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes created at the bottom of the created form. It may be an empty list.
") FirstShape;
		const NCollection_List<TopoDS_Shape> FirstShape();

		/****** BRepFeat_RibSlot::Generated ******/
		/****** md5 signature: afef05048bf0a3f20f9295499d9e5555 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns a list NCollection_List<TopoDS_Shape> of the faces S created in the shape.
") Generated;
		const NCollection_List<TopoDS_Shape> Generated(const TopoDS_Shape & S);

		/****** BRepFeat_RibSlot::IntPar ******/
		/****** md5 signature: 62640fbecfc930ffe1bfe3681e8dc87f ******/
		%feature("compactdefaultargs") IntPar;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
P: gp_Pnt

Return
-------
double

Description
-----------
No available documentation.
") IntPar;
		static double IntPar(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P);

		/****** BRepFeat_RibSlot::IsDeleted ******/
		/****** md5 signature: 287418bb898b77dec0442680837578c0 ******/
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
Returns true if F a TopoDS_Shape of type edge or face has been deleted.
") IsDeleted;
		bool IsDeleted(const TopoDS_Shape & F);

		/****** BRepFeat_RibSlot::LastShape ******/
		/****** md5 signature: fbab69e647739e7c9cd1123eb99b9c4b ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes created at the top of the created form. It may be an empty list.
") LastShape;
		const NCollection_List<TopoDS_Shape> LastShape();

		/****** BRepFeat_RibSlot::Modified ******/
		/****** md5 signature: 95d5c065993c1070bee9fdb9225954e4 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of generated Faces F. This list may be empty.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & F);

		/****** BRepFeat_RibSlot::NewEdges ******/
		/****** md5 signature: 86593e867343002ba235ed58e9970c34 ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns a list of the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape. The list provides the information necessary for subsequent addition of fillets. It may be an empty list.
") NewEdges;
		const NCollection_List<TopoDS_Shape> NewEdges();

		/****** BRepFeat_RibSlot::TgtEdges ******/
		/****** md5 signature: 4625c2d2cf027a1f9f8defe365dcab16 ******/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns a list of the tangent edges among the limiting and glueing edges generated by the feature. These edges did not originally exist in the basis shape and are tangent to the face against which the feature is built. The list provides the information necessary for subsequent addition of fillets. It may be an empty list. If an edge is tangent, no fillet is possible, and the edge must subsequently be removed if you want to add a fillet.
") TgtEdges;
		const NCollection_List<TopoDS_Shape> TgtEdges();

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
Creates the process with the shape <S>.
") BRepFeat_SplitShape;
		 BRepFeat_SplitShape(const TopoDS_Shape & S);

		/****** BRepFeat_SplitShape::Add ******/
		/****** md5 signature: dc061856d6403e7ea77474558c0cb36c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theEdges: NCollection_Sequence<TopoDS_Shape>

Return
-------
bool

Description
-----------
Add splitting edges or wires for whole initial shape without additional specification edge->face, edge->edge This method puts edge on the corresponding faces from initial shape.
") Add;
		bool Add(const NCollection_Sequence<TopoDS_Shape> & theEdges);

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
Adds the wire <W> on the face <F>. Raises NoSuchObject if <F> does not belong to the original shape.
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
Adds the edge <E> on the face <F>.
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
Adds the compound <Comp> on the face <F>. The compound <Comp> must consist of edges lying on the face <F>. If edges are geometrically connected, they must be connected topologically, i.e. they must share common vertices. //! Raises NoSuchObject if <F> does not belong to the original shape.
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
Adds the edge <E> on the existing edge <EOn>.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Edge & EOn);

		/****** BRepFeat_SplitShape::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
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
		/****** md5 signature: 0dcdbf098f12ae717ee8e5124bb48c8d ******/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the faces which are the left of the projected wires.
") DirectLeft;
		const NCollection_List<TopoDS_Shape> DirectLeft();

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
Initializes the process on the shape <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepFeat_SplitShape::IsDeleted ******/
		/****** md5 signature: bccb9782bf72a0b11faae5cda38123ec ******/
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
		bool IsDeleted(const TopoDS_Shape & S);

		/****** BRepFeat_SplitShape::Left ******/
		/****** md5 signature: be2f18492c53905055a91ad1bc70753b ******/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the faces of the 'left' part on the shape. (It is build from DirectLeft, with the faces connected to this set, and so on...). Raises NotDone if IsDone returns <false>.
") Left;
		const NCollection_List<TopoDS_Shape> Left();

		/****** BRepFeat_SplitShape::Modified ******/
		/****** md5 signature: 95d5c065993c1070bee9fdb9225954e4 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of generated Faces.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & F);

		/****** BRepFeat_SplitShape::Right ******/
		/****** md5 signature: da3e6dc85b561fc4dde07609854b7d14 ******/
		%feature("compactdefaultargs") Right;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the faces of the 'right' part on the shape.
") Right;
		const NCollection_List<TopoDS_Shape> Right();

		/****** BRepFeat_SplitShape::SetCheckInterior ******/
		/****** md5 signature: efb1f3d0d41242227a9413162dceab9f ******/
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
Set the flag of check internal intersections default value is True (to check).
") SetCheckInterior;
		void SetCheckInterior(const bool ToCheckInterior);

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
Builds the resulting shape (redefined from MakeShape). Invalidates the given parts of tools if any, and performs the result of the local operation.
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
		/****** md5 signature: 5c72f46c27915c3859ed2a860c701545 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Radius: double

Return
-------
None

Description
-----------
Performs every hole of radius <Radius>. This command has the same effect as a cut operation with an infinite cylinder defined by the given axis and <Radius>.
") Perform;
		void Perform(const double Radius);

		/****** BRepFeat_MakeCylindricalHole::Perform ******/
		/****** md5 signature: 06bd4e8475c6d5fb6b3372770ab80d92 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Radius: double
PFrom: double
PTo: double
WithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs every hole of radius <Radius> located between PFrom and PTo on the given axis. If <WithControl> is set to false no control are done on the resulting shape after the operation is performed.
") Perform;
		void Perform(const double Radius, const double PFrom, const double PTo, const bool WithControl = true);

		/****** BRepFeat_MakeCylindricalHole::PerformBlind ******/
		/****** md5 signature: 6cb17168db22561c20d555d085063615 ******/
		%feature("compactdefaultargs") PerformBlind;
		%feature("autodoc", "
Parameters
----------
Radius: double
Length: double
WithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs a blind hole of radius <Radius> and length <Length>. The length is measured from the origin of the given axis. If <WithControl> is set to false no control are done after the operation is performed.
") PerformBlind;
		void PerformBlind(const double Radius, const double Length, const bool WithControl = true);

		/****** BRepFeat_MakeCylindricalHole::PerformThruNext ******/
		/****** md5 signature: 303a9e80393fdd0e8c6cfdfac9158ff7 ******/
		%feature("compactdefaultargs") PerformThruNext;
		%feature("autodoc", "
Parameters
----------
Radius: double
WithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the first hole of radius <Radius>, in the direction of the defined axis. First hole signify first encountered after the origin of the axis. If <WithControl> is set to false no control are done on the resulting shape after the operation is performed.
") PerformThruNext;
		void PerformThruNext(const double Radius, const bool WithControl = true);

		/****** BRepFeat_MakeCylindricalHole::PerformUntilEnd ******/
		/****** md5 signature: e18580ec952465ec80f080761861c5f1 ******/
		%feature("compactdefaultargs") PerformUntilEnd;
		%feature("autodoc", "
Parameters
----------
Radius: double
WithControl: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs every hole of radius <Radius> located after the origin of the given axis. If <WithControl> is set to false no control are done on the resulting shape after the operation is performed.
") PerformUntilEnd;
		void PerformUntilEnd(const double Radius, const bool WithControl = true);

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
		/****** md5 signature: a4e65af9a20dff51c5b5cc96d296a793 ******/
		%feature("compactdefaultargs") BRepFeat_MakeDPrism;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Face
Skface: TopoDS_Face
Angle: double
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
A face Pbase is selected in the shape Sbase to serve as the basis for the draft prism. The draft will be defined by the angle Angle and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed. Initializes the draft prism class.
") BRepFeat_MakeDPrism;
		 BRepFeat_MakeDPrism(const TopoDS_Shape & Sbase, const TopoDS_Face & Pbase, const TopoDS_Face & Skface, const double Angle, const int Fuse, const bool Modify);

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
Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeDPrism::BarycCurve ******/
		/****** md5 signature: 7751f2bfa19aeb9a939abbcdec314e64 ******/
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
		/****** md5 signature: a2e3625f243eed785f369600bafa59ca ******/
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
Determination of TopEdges and LatEdges. sig = 1 -> TopEdges = FirstShape of the DPrism sig = 2 -> TOpEdges = LastShape of the DPrism.
") BossEdges;
		void BossEdges(const int sig);

		/****** BRepFeat_MakeDPrism::Curves ******/
		/****** md5 signature: 85a76a1749f6b6fed81a9669580f15eb ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(NCollection_Sequence<opencascade::handle<Geom_Curve> > & S);

		/****** BRepFeat_MakeDPrism::Init ******/
		/****** md5 signature: c33155d84a1245f86d179db325aec81d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Pbase: TopoDS_Face
Skface: TopoDS_Face
Angle: double
Fuse: int
Modify: bool

Return
-------
None

Description
-----------
Initializes this algorithm for building draft prisms along surfaces. A face Pbase is selected in the basis shape Sbase to serve as the basis from the draft prism. The draft will be defined by the angle Angle and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Face & Pbase, const TopoDS_Face & Skface, const double Angle, const int Fuse, const bool Modify);

		/****** BRepFeat_MakeDPrism::LatEdges ******/
		/****** md5 signature: 952d0a19c4288a03828f812c057156ab ******/
		%feature("compactdefaultargs") LatEdges;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of TopoDS Edges of the bottom of the boss.
") LatEdges;
		const NCollection_List<TopoDS_Shape> LatEdges();

		/****** BRepFeat_MakeDPrism::Perform ******/
		/****** md5 signature: 2474763ac9fc71c5fd80717db35c55ab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Height: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double Height);

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
Assigns one of the following semantics - to a height Height - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.
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
Realizes a semi-infinite prism, limited by the face Funtil.
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
Builds an infinite prism. The infinite descendants will not be kept in the result.
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
		/****** md5 signature: dbadfa3038da938c360f55705ebb6e5d ******/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape
Height: double

Return
-------
None

Description
-----------
Assigns both a limiting shape, Until from TopoDS_Shape, and a height, Height at which to stop generation of the prism feature.
") PerformUntilHeight;
		void PerformUntilHeight(const TopoDS_Shape & Until, const double Height);

		/****** BRepFeat_MakeDPrism::TopEdges ******/
		/****** md5 signature: 603d06f381ca671e1d58f108fb63e22f ******/
		%feature("compactdefaultargs") TopEdges;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of TopoDS Edges of the top of the boss.
") TopEdges;
		const NCollection_List<TopoDS_Shape> TopEdges();

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
initializes the linear form class.
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm();

		/****** BRepFeat_MakeLinearForm::BRepFeat_MakeLinearForm ******/
		/****** md5 signature: 0f4905a048142d551effd0fc41808468 ******/
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
contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. Direction and Direction1 give The vectors for defining the direction(s) in which thickness will be built up. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
") BRepFeat_MakeLinearForm;
		 BRepFeat_MakeLinearForm(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & P, const gp_Vec & Direction, const gp_Vec & Direction1, const int Fuse, const bool Modify);

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
Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeLinearForm::Init ******/
		/****** md5 signature: d32f3f761d84564ef0371a3aa6486af4 ******/
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
Initializes this construction algorithm. A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The vectors for defining the direction(s) in which thickness will be built up are given by Direction and Direction1. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & P, const gp_Vec & Direction, const gp_Vec & Direction1, const int Fuse, const bool Modify);

		/****** BRepFeat_MakeLinearForm::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs a prism from the wire to the plane along the basis shape Sbase. Reconstructs the feature topologically.
") Perform;
		void Perform();

		/****** BRepFeat_MakeLinearForm::Propagate ******/
		/****** md5 signature: eb529d4e90e0d16110860938aeaba7e4 ******/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", "
Parameters
----------
L: NCollection_List<TopoDS_Shape>
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
		bool Propagate(NCollection_List<TopoDS_Shape> & L, const TopoDS_Face & F, const gp_Pnt & FPoint, const gp_Pnt & LPoint, Standard_Boolean &OutValue);

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
initializes the pipe class.
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe();

		/****** BRepFeat_MakePipe::BRepFeat_MakePipe ******/
		/****** md5 signature: b2b99099703d26822ca66b1666d34357 ******/
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
A face Pbase is selected in the shape Sbase to serve as the basis for the pipe. It will be defined by the wire Spine. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
") BRepFeat_MakePipe;
		 BRepFeat_MakePipe(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const TopoDS_Wire & Spine, const int Fuse, const bool Modify);

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
Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakePipe::BarycCurve ******/
		/****** md5 signature: 7751f2bfa19aeb9a939abbcdec314e64 ******/
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
		/****** md5 signature: 85a76a1749f6b6fed81a9669580f15eb ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(NCollection_Sequence<opencascade::handle<Geom_Curve> > & S);

		/****** BRepFeat_MakePipe::Init ******/
		/****** md5 signature: 76862028d3c54d0384e177c4c3ffef7c ******/
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
Initializes this algorithm for adding pipes to shapes. A face Pbase is selected in the shape Sbase to serve as the basis for the pipe. It will be defined by the wire Spine. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const TopoDS_Wire & Spine, const int Fuse, const bool Modify);

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
Assigns one of the following semantics - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.
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
Builds a prism by projecting a wire along the face of a shape. Initializes the prism class.
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism();

		/****** BRepFeat_MakePrism::BRepFeat_MakePrism ******/
		/****** md5 signature: d56dffac5e5a7907e4283307f66286b7 ******/
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
Builds a prism by projecting a wire along the face of a shape. a face Pbase is selected in the shape Sbase to serve as the basis for the prism. The orientation of the prism will be defined by the vector Direction. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed. Exceptions Standard_ConstructionError if the face does not belong to the basis or the prism shape.
") BRepFeat_MakePrism;
		 BRepFeat_MakePrism(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Dir & Direction, const int Fuse, const bool Modify);

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
Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakePrism::BarycCurve ******/
		/****** md5 signature: 7751f2bfa19aeb9a939abbcdec314e64 ******/
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
		/****** md5 signature: 85a76a1749f6b6fed81a9669580f15eb ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: Geom_Curve

Return
-------
None

Description
-----------
Returns the list of curves S parallel to the axis of the prism.
") Curves;
		void Curves(NCollection_Sequence<opencascade::handle<Geom_Curve> > & S);

		/****** BRepFeat_MakePrism::Init ******/
		/****** md5 signature: 27c09a4d7a08fcc0281741cad3c3a3c8 ******/
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
Initializes this algorithm for building prisms along surfaces. A face Pbase is selected in the shape Sbase to serve as the basis for the prism. The orientation of the prism will be defined by the vector Direction. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Dir & Direction, const int Fuse, const bool Modify);

		/****** BRepFeat_MakePrism::Perform ******/
		/****** md5 signature: 504bc83bd30bb05a97655ea75fb1e1ab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Length: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double Length);

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
Assigns one of the following semantics - to a height Length - to a face Until - from a face From to a height Until. Reconstructs the feature topologically according to the semantic option chosen.
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
Realizes a semi-infinite prism, limited by the face Funtil.
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
Builds an infinite prism. The infinite descendants will not be kept in the result.
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
Realizes a semi-infinite prism, limited by the position of the prism base. All other faces extend infinitely.
") PerformUntilEnd;
		void PerformUntilEnd();

		/****** BRepFeat_MakePrism::PerformUntilHeight ******/
		/****** md5 signature: 09b4f9d2f2e9c8a981a3f14dbca5bd29 ******/
		%feature("compactdefaultargs") PerformUntilHeight;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape
Length: double

Return
-------
None

Description
-----------
Assigns both a limiting shape, Until from TopoDS_Shape, and a height, Length at which to stop generation of the prism feature.
") PerformUntilHeight;
		void PerformUntilHeight(const TopoDS_Shape & Until, const double Length);

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
initializes the revolved shell class.
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol();

		/****** BRepFeat_MakeRevol::BRepFeat_MakeRevol ******/
		/****** md5 signature: dc007849e289a274bc53d67db6301d22 ******/
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
a face Pbase is selected in the shape Sbase to serve as the basis for the revolved shell. The revolution will be defined by the axis Axis and Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 - adding matter with Boolean fusion using the setting 1. The sketch face Skface serves to determine the type of operation. If it is inside the basis shape, a local operation such as glueing can be performed.
") BRepFeat_MakeRevol;
		 BRepFeat_MakeRevol(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Ax1 & Axis, const int Fuse, const bool Modify);

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
Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeRevol::BarycCurve ******/
		/****** md5 signature: 7751f2bfa19aeb9a939abbcdec314e64 ******/
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
		/****** md5 signature: 85a76a1749f6b6fed81a9669580f15eb ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
S: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(NCollection_Sequence<opencascade::handle<Geom_Curve> > & S);

		/****** BRepFeat_MakeRevol::Init ******/
		/****** md5 signature: 05f8f2c41d6ff03878d1d9df687ace7b ******/
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
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Pbase, const TopoDS_Face & Skface, const gp_Ax1 & Axis, const int Fuse, const bool Modify);

		/****** BRepFeat_MakeRevol::Perform ******/
		/****** md5 signature: d8b2134004d2f94a5005a60ede14ad88 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double Angle);

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
Builds an infinite shell. The infinite descendants will not be kept in the result.
") PerformThruAll;
		void PerformThruAll();

		/****** BRepFeat_MakeRevol::PerformUntilAngle ******/
		/****** md5 signature: ada203ac04c5bb2c2df46d4d122767d5 ******/
		%feature("compactdefaultargs") PerformUntilAngle;
		%feature("autodoc", "
Parameters
----------
Until: TopoDS_Shape
Angle: double

Return
-------
None

Description
-----------
Assigns both a limiting shape, Until from TopoDS_Shape, and an angle, Angle at which to stop generation of the revolved shell feature.
") PerformUntilAngle;
		void PerformUntilAngle(const TopoDS_Shape & Until, const double Angle);

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
initializes the linear form class.
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm();

		/****** BRepFeat_MakeRevolutionForm::BRepFeat_MakeRevolutionForm ******/
		/****** md5 signature: f8ac5afb024c3ddaf5310b7cfa6379dd ******/
		%feature("compactdefaultargs") BRepFeat_MakeRevolutionForm;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
Plane: Geom_Plane
Axis: gp_Ax1
Height1: double
Height2: double
Fuse: int

Return
-------
Sliding: bool

Description
-----------
a contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The axis Axis of the revolved surface in the basis shape defines the feature's axis of revolution. Height1 and Height2 may be used as limits to the construction of the feature. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
") BRepFeat_MakeRevolutionForm;
		 BRepFeat_MakeRevolutionForm(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & Plane, const gp_Ax1 & Axis, const double Height1, const double Height2, const int Fuse, Standard_Boolean &OutValue);

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
Indicates that the edge <E> will slide on the face <OnFace>. Raises ConstructionError if the face does not belong to the basis shape, or the edge to the prismed shape.
") Add;
		void Add(const TopoDS_Edge & E, const TopoDS_Face & OnFace);

		/****** BRepFeat_MakeRevolutionForm::Init ******/
		/****** md5 signature: 93385c07c836821d4954e487b24a14d8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
W: TopoDS_Wire
Plane: Geom_Plane
Axis: gp_Ax1
Height1: double
Height2: double
Fuse: int

Return
-------
Sliding: bool

Description
-----------
Initializes this construction algorithm A contour W, a shape Sbase and a plane P are initialized to serve as the basic elements in the construction of the rib or groove. The axis Axis of the revolved surface in the basis shape defines the feature's axis of revolution. Height1 and Height2 may be used as limits to the construction of the feature. Fuse offers a choice between: - removing matter with a Boolean cut using the setting 0 in case of the groove - adding matter with Boolean fusion using the setting 1 in case of the rib.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Wire & W, const opencascade::handle<Geom_Plane> & Plane, const gp_Ax1 & Axis, const double Height1, const double Height2, const int Fuse, Standard_Boolean &OutValue);

		/****** BRepFeat_MakeRevolutionForm::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs a prism from the wire to the plane along the basis shape S. Reconstructs the feature topologically.
") Perform;
		void Perform();

		/****** BRepFeat_MakeRevolutionForm::Propagate ******/
		/****** md5 signature: eb529d4e90e0d16110860938aeaba7e4 ******/
		%feature("compactdefaultargs") Propagate;
		%feature("autodoc", "
Parameters
----------
L: NCollection_List<TopoDS_Shape>
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
		bool Propagate(NCollection_List<TopoDS_Shape> & L, const TopoDS_Face & F, const gp_Pnt & FPoint, const gp_Pnt & LPoint, Standard_Boolean &OutValue);

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
