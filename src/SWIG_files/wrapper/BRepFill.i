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
%define BREPFILLDOCSTRING
"BRepFill module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepfill.html"
%enddef
%module (package="OCC.Core", docstring=BREPFILLDOCSTRING) BRepFill


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
#include<BRepFill_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<MAT_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<AppParCurves_module.hxx>
#include<GeomPlate_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<GeomFill_module.hxx>
#include<AppCont_module.hxx>
#include<BRepMAT2d_module.hxx>
#include<Law_module.hxx>
#include<Bisector_module.hxx>
#include<TColgp_module.hxx>
#include<FEmTool_module.hxx>
#include<TColGeom2d_module.hxx>
#include<PLib_module.hxx>
#include<TopLoc_module.hxx>
#include<Plate_module.hxx>
#include<AdvApp2Var_module.hxx>
#include<TColGeom_module.hxx>
#include<Message_module.hxx>
#include<Convert_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor2d_module.hxx>
#include<MAT_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import MAT.i
%import TopTools.i
%import TopoDS.i
%import gp.i
%import TColStd.i
%import Geom.i
%import Geom2d.i
%import AppParCurves.i
%import GeomPlate.i
%import Adaptor3d.i
%import GeomAbs.i
%import GeomFill.i
%import AppCont.i
%import BRepMAT2d.i
%import Law.i
%import Bisector.i
%import TColgp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum BRepFill_ThruSectionErrorStatus {
	BRepFill_ThruSectionErrorStatus_Done = 0,
	BRepFill_ThruSectionErrorStatus_NotDone = 1,
	BRepFill_ThruSectionErrorStatus_NotSameTopology = 2,
	BRepFill_ThruSectionErrorStatus_ProfilesInconsistent = 3,
	BRepFill_ThruSectionErrorStatus_WrongUsage = 4,
	BRepFill_ThruSectionErrorStatus_Null3DCurve = 5,
	BRepFill_ThruSectionErrorStatus_Failed = 6,
};

enum BRepFill_TransitionStyle {
	BRepFill_Modified = 0,
	BRepFill_Right = 1,
	BRepFill_Round = 2,
};

enum BRepFill_TypeOfContact {
	BRepFill_NoContact = 0,
	BRepFill_Contact = 1,
	BRepFill_ContactOnBorder = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BRepFill_ThruSectionErrorStatus(IntEnum):
	BRepFill_ThruSectionErrorStatus_Done = 0
	BRepFill_ThruSectionErrorStatus_NotDone = 1
	BRepFill_ThruSectionErrorStatus_NotSameTopology = 2
	BRepFill_ThruSectionErrorStatus_ProfilesInconsistent = 3
	BRepFill_ThruSectionErrorStatus_WrongUsage = 4
	BRepFill_ThruSectionErrorStatus_Null3DCurve = 5
	BRepFill_ThruSectionErrorStatus_Failed = 6
BRepFill_ThruSectionErrorStatus_Done = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_Done
BRepFill_ThruSectionErrorStatus_NotDone = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_NotDone
BRepFill_ThruSectionErrorStatus_NotSameTopology = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_NotSameTopology
BRepFill_ThruSectionErrorStatus_ProfilesInconsistent = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_ProfilesInconsistent
BRepFill_ThruSectionErrorStatus_WrongUsage = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_WrongUsage
BRepFill_ThruSectionErrorStatus_Null3DCurve = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_Null3DCurve
BRepFill_ThruSectionErrorStatus_Failed = BRepFill_ThruSectionErrorStatus.BRepFill_ThruSectionErrorStatus_Failed

class BRepFill_TransitionStyle(IntEnum):
	BRepFill_Modified = 0
	BRepFill_Right = 1
	BRepFill_Round = 2
BRepFill_Modified = BRepFill_TransitionStyle.BRepFill_Modified
BRepFill_Right = BRepFill_TransitionStyle.BRepFill_Right
BRepFill_Round = BRepFill_TransitionStyle.BRepFill_Round

class BRepFill_TypeOfContact(IntEnum):
	BRepFill_NoContact = 0
	BRepFill_Contact = 1
	BRepFill_ContactOnBorder = 2
BRepFill_NoContact = BRepFill_TypeOfContact.BRepFill_NoContact
BRepFill_Contact = BRepFill_TypeOfContact.BRepFill_Contact
BRepFill_ContactOnBorder = BRepFill_TypeOfContact.BRepFill_ContactOnBorder
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepFill_CurveConstraint)
%wrap_handle(BRepFill_LocationLaw)
%wrap_handle(BRepFill_PipeShell)
%wrap_handle(BRepFill_SectionLaw)
%wrap_handle(BRepFill_ACRLaw)
%wrap_handle(BRepFill_Edge3DLaw)
%wrap_handle(BRepFill_EdgeOnSurfLaw)
%wrap_handle(BRepFill_NSections)
%wrap_handle(BRepFill_ShapeLaw)
%wrap_handle(BRepFill_DraftLaw)
/* end handles declaration */

/* templates */
%template(BRepFill_DataMapOfNodeDataMapOfShapeShape) NCollection_DataMap<opencascade::handle<MAT_Node>,TopTools_DataMapOfShapeShape>;
%template(BRepFill_DataMapOfNodeShape) NCollection_DataMap<opencascade::handle<MAT_Node>,TopoDS_Shape>;
%template(BRepFill_DataMapOfOrientedShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape>;
%template(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_DataMapOfShapeListOfShape,TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfShapeHArray2OfShape) NCollection_DataMap<TopoDS_Shape,opencascade::handle<TopTools_HArray2OfShape>,TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfShapeSequenceOfPnt) NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt,TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfShapeSequenceOfReal) NCollection_DataMap<TopoDS_Shape,TColStd_SequenceOfReal,TopTools_ShapeMapHasher>;
%template(BRepFill_IndexedDataMapOfOrientedShapeListOfShape) NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape>;
%template(BRepFill_ListIteratorOfListOfOffsetWire) NCollection_TListIterator<BRepFill_OffsetWire>;
%template(BRepFill_ListOfOffsetWire) NCollection_List<BRepFill_OffsetWire>;

%extend NCollection_List<BRepFill_OffsetWire> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = BRepFill_ListIteratorOfListOfOffsetWire(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(BRepFill_SequenceOfEdgeFaceAndOrder) NCollection_Sequence<BRepFill_EdgeFaceAndOrder>;

%extend NCollection_Sequence<BRepFill_EdgeFaceAndOrder> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BRepFill_SequenceOfFaceAndOrder) NCollection_Sequence<BRepFill_FaceAndOrder>;

%extend NCollection_Sequence<BRepFill_FaceAndOrder> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BRepFill_SequenceOfSection) NCollection_Sequence<BRepFill_Section>;

%extend NCollection_Sequence<BRepFill_Section> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopTools_DataMapOfShapeShape>::Iterator BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopoDS_Shape>::Iterator BRepFill_DataMapIteratorOfDataMapOfNodeShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape>::Iterator BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_DataMapOfShapeListOfShape, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<TopTools_HArray2OfShape>, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_SequenceOfReal, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopTools_DataMapOfShapeShape> BRepFill_DataMapOfNodeDataMapOfShapeShape;
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopoDS_Shape> BRepFill_DataMapOfNodeShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape> BRepFill_DataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_DataMapOfShapeListOfShape, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<TopTools_HArray2OfShape>, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeHArray2OfShape;
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeSequenceOfPnt;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_SequenceOfReal, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeSequenceOfReal;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopTools_ListOfShape> BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
typedef NCollection_List<BRepFill_OffsetWire>::Iterator BRepFill_ListIteratorOfListOfOffsetWire;
typedef NCollection_List<BRepFill_OffsetWire> BRepFill_ListOfOffsetWire;
typedef NCollection_Sequence<BRepFill_EdgeFaceAndOrder> BRepFill_SequenceOfEdgeFaceAndOrder;
typedef NCollection_Sequence<BRepFill_FaceAndOrder> BRepFill_SequenceOfFaceAndOrder;
typedef NCollection_Sequence<BRepFill_Section> BRepFill_SequenceOfSection;
/* end typedefs declaration */

/*****************
* class BRepFill *
*****************/
%rename(brepfill) BRepFill;
class BRepFill {
	public:
		/****** BRepFill::Axe ******/
		/****** md5 signature: 5066bf0a1bf31230a49bcd8154518ee5 ******/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Shape
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Tol: float

Return
-------
ProfOnSpine: bool

Description
-----------
Computes <AxeProf> as Follow. <Location> is the Position of the nearest vertex V of <Profile> to <Spine>.<XDirection> is confused with the tangent to <Spine> at the projected point of V on the Spine. <Direction> is normal to <Spine>. <Spine> is a plane wire or a plane face.
") Axe;
		static void Axe(const TopoDS_Shape & Spine, const TopoDS_Wire & Profile, gp_Ax3 & AxeProf, Standard_Boolean &OutValue, const Standard_Real Tol);

		/****** BRepFill::ComputeACR ******/
		/****** md5 signature: 4db89150ae3d82fd512df64018024851 ******/
		%feature("compactdefaultargs") ComputeACR;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
ACR: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute ACR on a wire.
") ComputeACR;
		static void ComputeACR(const TopoDS_Wire & wire, TColStd_Array1OfReal & ACR);

		/****** BRepFill::Face ******/
		/****** md5 signature: d63ae9062edc6e9968525d33571f93de ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge

Return
-------
TopoDS_Face

Description
-----------
Computes a ruled surface between two edges.
") Face;
		static TopoDS_Face Face(const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2);

		/****** BRepFill::InsertACR ******/
		/****** md5 signature: 0819589e0db11915fe8ccc0f2db00289 ******/
		%feature("compactdefaultargs") InsertACR;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
ACRcuts: TColStd_Array1OfReal
prec: float

Return
-------
TopoDS_Wire

Description
-----------
Insert ACR on a wire.
") InsertACR;
		static TopoDS_Wire InsertACR(const TopoDS_Wire & wire, const TColStd_Array1OfReal & ACRcuts, const Standard_Real prec);

		/****** BRepFill::Shell ******/
		/****** md5 signature: 88d6b874e94f58733b1bc7baa4c7ea78 ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "
Parameters
----------
Wire1: TopoDS_Wire
Wire2: TopoDS_Wire

Return
-------
TopoDS_Shell

Description
-----------
Computes a ruled surface between two wires. The wires must have the same number of edges.
") Shell;
		static TopoDS_Shell Shell(const TopoDS_Wire & Wire1, const TopoDS_Wire & Wire2);

};


%extend BRepFill {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFill_AdvancedEvolved *
*********************************/
class BRepFill_AdvancedEvolved {
	public:
		/****** BRepFill_AdvancedEvolved::BRepFill_AdvancedEvolved ******/
		/****** md5 signature: de66ae3cdf69d9d623f47984cdb95d29 ******/
		%feature("compactdefaultargs") BRepFill_AdvancedEvolved;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BRepFill_AdvancedEvolved;
		 BRepFill_AdvancedEvolved();

		/****** BRepFill_AdvancedEvolved::IsDone ******/
		/****** md5 signature: 04d3ce368655bc93ea2a356898208e17 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "
Parameters
----------
theErrorCode: unsigned int * (optional, default to 0)

Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone(unsigned int * theErrorCode = 0);

		/****** BRepFill_AdvancedEvolved::Perform ******/
		/****** md5 signature: 88613f19a0986c9af1e44552cf871df2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSpine: TopoDS_Wire
theProfile: TopoDS_Wire
theTolerance: float
theSolidReq: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Wire & theSpine, const TopoDS_Wire & theProfile, const Standard_Real theTolerance, const Standard_Boolean theSolidReq = Standard_True);

		/****** BRepFill_AdvancedEvolved::SetParallelMode ******/
		/****** md5 signature: a48577b543b1abcd5b5b83650e3dcd40 ******/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "
Parameters
----------
theVal: bool

Return
-------
None

Description
-----------
Sets/Unsets computation in parallel mode.
") SetParallelMode;
		void SetParallelMode(const Standard_Boolean theVal);

		/****** BRepFill_AdvancedEvolved::SetTemporaryDirectory ******/
		/****** md5 signature: 21483a70923e54cef6dc15c9ef320f8d ******/
		%feature("compactdefaultargs") SetTemporaryDirectory;
		%feature("autodoc", "
Parameters
----------
thePath: str

Return
-------
None

Description
-----------
Sets directory where the debug shapes will be saved.
") SetTemporaryDirectory;
		void SetTemporaryDirectory(Standard_CString thePath);

		/****** BRepFill_AdvancedEvolved::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the resulting shape.
") Shape;
		const TopoDS_Shape Shape();

};


%extend BRepFill_AdvancedEvolved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepFill_ApproxSeewing *
*******************************/
class BRepFill_ApproxSeewing {
	public:
		/****** BRepFill_ApproxSeewing::BRepFill_ApproxSeewing ******/
		/****** md5 signature: b6c908b616aa82002854711d3e47ceff ******/
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing();

		/****** BRepFill_ApproxSeewing::BRepFill_ApproxSeewing ******/
		/****** md5 signature: 4a2e8c7becb8b1caa500e572e0160bf9 ******/
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", "
Parameters
----------
ML: BRepFill_MultiLine

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing(const BRepFill_MultiLine & ML);

		/****** BRepFill_ApproxSeewing::Curve ******/
		/****** md5 signature: 976a03829ec92d091e0b58dd7f58e869 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
returns the approximation of the 3d Curve.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** BRepFill_ApproxSeewing::CurveOnF1 ******/
		/****** md5 signature: 3369c82f423ee0cfc8f0ec4f137a55f4 ******/
		%feature("compactdefaultargs") CurveOnF1;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
returns the approximation of the PCurve on the first face of the MultiLine.
") CurveOnF1;
		const opencascade::handle<Geom2d_Curve> & CurveOnF1();

		/****** BRepFill_ApproxSeewing::CurveOnF2 ******/
		/****** md5 signature: 45c6de84c8d94f080f62b4c4f2add37e ******/
		%feature("compactdefaultargs") CurveOnF2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
returns the approximation of the PCurve on the first face of the MultiLine.
") CurveOnF2;
		const opencascade::handle<Geom2d_Curve> & CurveOnF2();

		/****** BRepFill_ApproxSeewing::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_ApproxSeewing::Perform ******/
		/****** md5 signature: 7dae4f24d8e972b63f7656fd42784a35 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ML: BRepFill_MultiLine

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const BRepFill_MultiLine & ML);

};


%extend BRepFill_ApproxSeewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFill_CompatibleWires *
*********************************/
class BRepFill_CompatibleWires {
	public:
		/****** BRepFill_CompatibleWires::BRepFill_CompatibleWires ******/
		/****** md5 signature: 55c08213e487fac27bfa21c6cd7ea46e ******/
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires();

		/****** BRepFill_CompatibleWires::BRepFill_CompatibleWires ******/
		/****** md5 signature: 4cd5f0fde1f6cd47ff46ea0a75d3d42e ******/
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "
Parameters
----------
Sections: TopTools_SequenceOfShape

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires(const TopTools_SequenceOfShape & Sections);

		/****** BRepFill_CompatibleWires::Generated ******/
		/****** md5 signature: 176507b5ffd0100ab7a88bdc3ba1ff71 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeListOfShape

Description
-----------
No available documentation.
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****** BRepFill_CompatibleWires::GeneratedShapes ******/
		/****** md5 signature: 5dcd274faa3f647473f032e7defdf0c3 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SubSection: TopoDS_Edge

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the shapes created from a subshape <SubSection> of a section.
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Edge & SubSection);

		/****** BRepFill_CompatibleWires::GetStatus ******/
		/****** md5 signature: d01d66bd030c1232d59d2b7253fc3b10 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
BRepFill_ThruSectionErrorStatus

Description
-----------
No available documentation.
") GetStatus;
		BRepFill_ThruSectionErrorStatus GetStatus();

		/****** BRepFill_CompatibleWires::Init ******/
		/****** md5 signature: 217046dd3125fb37abc6e15803e209f1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sections: TopTools_SequenceOfShape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopTools_SequenceOfShape & Sections);

		/****** BRepFill_CompatibleWires::IsDegeneratedFirstSection ******/
		/****** md5 signature: 3a477c0ee0e113cb31ef37b01884007c ******/
		%feature("compactdefaultargs") IsDegeneratedFirstSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegeneratedFirstSection;
		Standard_Boolean IsDegeneratedFirstSection();

		/****** BRepFill_CompatibleWires::IsDegeneratedLastSection ******/
		/****** md5 signature: 3efc39e10dd4ffdc769475ccbdfc0853 ******/
		%feature("compactdefaultargs") IsDegeneratedLastSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegeneratedLastSection;
		Standard_Boolean IsDegeneratedLastSection();

		/****** BRepFill_CompatibleWires::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_CompatibleWires::Perform ******/
		/****** md5 signature: f94f3c6634f53a2788ea3841219abc1e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
WithRotation: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Performs CompatibleWires According to the orientation and the origin of each other.
") Perform;
		void Perform(const Standard_Boolean WithRotation = Standard_True);

		/****** BRepFill_CompatibleWires::SetPercent ******/
		/****** md5 signature: d05be61ce868366e26cb62736833d711 ******/
		%feature("compactdefaultargs") SetPercent;
		%feature("autodoc", "
Parameters
----------
percent: float (optional, default to 0.01)

Return
-------
None

Description
-----------
No available documentation.
") SetPercent;
		void SetPercent(const Standard_Real percent = 0.01);

		/****** BRepFill_CompatibleWires::Shape ******/
		/****** md5 signature: ca3dbe5cb613e6a993649b413b6e3cda ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopTools_SequenceOfShape

Description
-----------
returns the generated sequence.
") Shape;
		const TopTools_SequenceOfShape & Shape();

};


%extend BRepFill_CompatibleWires {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepFill_ComputeCLine *
******************************/
class BRepFill_ComputeCLine {
	public:
		/****** BRepFill_ComputeCLine::BRepFill_ComputeCLine ******/
		/****** md5 signature: b39b808be258e6d42211fb37c89d3426 ******/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "
Parameters
----------
Line: BRepFill_MultiLine
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-5)
Tolerance2d: float (optional, default to 1.0e-5)
cutting: bool (optional, default to Standard_False)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine(const BRepFill_MultiLine & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** BRepFill_ComputeCLine::BRepFill_ComputeCLine ******/
		/****** md5 signature: 522061d3b3840a1c3fe490daa3023387 ******/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: float (optional, default to 1.0e-05)
Tolerance2d: float (optional, default to 1.0e-05)
cutting: bool (optional, default to Standard_False)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** BRepFill_ComputeCLine::Error ******/
		/****** md5 signature: 6a8061230005ba951097d8b73e7dbec6 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: float
tol2d: float

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFill_ComputeCLine::IsAllApproximated ******/
		/****** md5 signature: bf42a9f9ee3a867655d96a0c1fdcd853 ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****** BRepFill_ComputeCLine::IsToleranceReached ******/
		/****** md5 signature: cbd7380250e74c96655b10c8025eb873 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****** BRepFill_ComputeCLine::NbMultiCurves ******/
		/****** md5 signature: 944d4af40d93d46a8a3a888df2d8b388 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****** BRepFill_ComputeCLine::Parameters ******/
		/****** md5 signature: da3dbf6a597566992bf85427f2de867b ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
firstp: float
lastp: float

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFill_ComputeCLine::Perform ******/
		/****** md5 signature: 433c11a1cebf588552fe8d01e07bfc91 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Line: BRepFill_MultiLine

Return
-------
None

Description
-----------
runs the algorithm after having initialized the fields.
") Perform;
		void Perform(const BRepFill_MultiLine & Line);

		/****** BRepFill_ComputeCLine::SetConstraints ******/
		/****** md5 signature: 99b92dc193142adf44568f800cd394dc ******/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "
Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Return
-------
None

Description
-----------
Changes the constraints of the approximation.
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****** BRepFill_ComputeCLine::SetDegrees ******/
		/****** md5 signature: 545fdd7d739fa58cc970e73d0413f8ef ******/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "
Parameters
----------
degreemin: int
degreemax: int

Return
-------
None

Description
-----------
changes the degrees of the approximation.
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****** BRepFill_ComputeCLine::SetHangChecking ******/
		/****** md5 signature: 082382da7c6c3da9061b500893941826 ******/
		%feature("compactdefaultargs") SetHangChecking;
		%feature("autodoc", "
Parameters
----------
theHangChecking: bool

Return
-------
None

Description
-----------
Set value of hang checking flag if this flag = true, possible hang of algorithm is checked and algorithm is forced to stop. By default hang checking is used.
") SetHangChecking;
		void SetHangChecking(const Standard_Boolean theHangChecking);

		/****** BRepFill_ComputeCLine::SetInvOrder ******/
		/****** md5 signature: 50bac5968816111fd573c6f1be407215 ******/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "
Parameters
----------
theInvOrder: bool

Return
-------
None

Description
-----------
Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****** BRepFill_ComputeCLine::SetMaxSegments ******/
		/****** md5 signature: 649dded305ab339e1c7f2a819b32eedd ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
theMaxSegments: int

Return
-------
None

Description
-----------
Changes the max number of segments, which is allowed for cutting.
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****** BRepFill_ComputeCLine::SetTolerances ******/
		/****** md5 signature: ce7879738ace848f7a3a27c56467be10 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: float
Tolerance2d: float

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****** BRepFill_ComputeCLine::Value ******/
		/****** md5 signature: 89790f3ff3d6d18a45f409a34e79bd67 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int (optional, default to 1)

Return
-------
AppParCurves_MultiCurve

Description
-----------
returns the approximation MultiCurve of range <Index>.
") Value;
		AppParCurves_MultiCurve Value(const Standard_Integer Index = 1);

};


%extend BRepFill_ComputeCLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFill_CurveConstraint *
*********************************/
class BRepFill_CurveConstraint : public GeomPlate_CurveConstraint {
	public:
		/****** BRepFill_CurveConstraint::BRepFill_CurveConstraint ******/
		/****** md5 signature: a983adec650994ee74e57f6aa9893167 ******/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "
Parameters
----------
Boundary: Adaptor3d_CurveOnSurface
Order: int
NPt: int (optional, default to 10)
TolDist: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion.
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint(const opencascade::handle<Adaptor3d_CurveOnSurface> & Boundary, const Standard_Integer Order, const Standard_Integer NPt = 10, const Standard_Real TolDist = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****** BRepFill_CurveConstraint::BRepFill_CurveConstraint ******/
		/****** md5 signature: ccfa90de10a25cb726928f2c424e790e ******/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "
Parameters
----------
Boundary: Adaptor3d_Curve
Tang: int
NPt: int (optional, default to 10)
TolDist: float (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint(const opencascade::handle<Adaptor3d_Curve> & Boundary, const Standard_Integer Tang, const Standard_Integer NPt = 10, const Standard_Real TolDist = 0.0001);

};


%make_alias(BRepFill_CurveConstraint)

%extend BRepFill_CurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepFill_Draft *
***********************/
class BRepFill_Draft {
	public:
		/****** BRepFill_Draft::BRepFill_Draft ******/
		/****** md5 signature: 1dff2e6160b5e1259db446ee33a99fad ******/
		%feature("compactdefaultargs") BRepFill_Draft;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Dir: gp_Dir
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Draft;
		 BRepFill_Draft(const TopoDS_Shape & Shape, const gp_Dir & Dir, const Standard_Real Angle);

		/****** BRepFill_Draft::Generated ******/
		/****** md5 signature: 20432e4d7ffc2a154be36ff0a467a19b ******/
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
Returns the list of shapes generated from the shape <S>.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepFill_Draft::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_Draft::Perform ******/
		/****** md5 signature: b03f32ebc120d00e3e8e32d44b202b9d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
LengthMax: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real LengthMax);

		/****** BRepFill_Draft::Perform ******/
		/****** md5 signature: 3a80e47101026da2c90ae735de0ac1b9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
KeepInsideSurface: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & Surface, const Standard_Boolean KeepInsideSurface = Standard_True);

		/****** BRepFill_Draft::Perform ******/
		/****** md5 signature: c18fafced10e4c987e315cfc1b3d96ad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
StopShape: TopoDS_Shape
KeepOutSide: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & StopShape, const Standard_Boolean KeepOutSide = Standard_True);

		/****** BRepFill_Draft::SetDraft ******/
		/****** md5 signature: 6a0b2e71733b262480aa38daaecff626 ******/
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "
Parameters
----------
IsInternal: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") SetDraft;
		void SetDraft(const Standard_Boolean IsInternal = Standard_False);

		/****** BRepFill_Draft::SetOptions ******/
		/****** md5 signature: b9e013957f2b0d7c10b9daa53473ce0e ******/
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "
Parameters
----------
Style: BRepFill_TransitionStyle (optional, default to BRepFill_Right)
AngleMin: float (optional, default to 0.01)
AngleMax: float (optional, default to 3.0)

Return
-------
None

Description
-----------
No available documentation.
") SetOptions;
		void SetOptions(const BRepFill_TransitionStyle Style = BRepFill_Right, const Standard_Real AngleMin = 0.01, const Standard_Real AngleMax = 3.0);

		/****** BRepFill_Draft::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		TopoDS_Shape Shape();

		/****** BRepFill_Draft::Shell ******/
		/****** md5 signature: 3ea4686086a18491532865f1cfbce9ad ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
Returns the draft surface To have the complete shape you have to use the Shape() methode.
") Shell;
		TopoDS_Shell Shell();

};


%extend BRepFill_Draft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepFill_EdgeFaceAndOrder *
**********************************/
class BRepFill_EdgeFaceAndOrder {
	public:
		/****** BRepFill_EdgeFaceAndOrder::BRepFill_EdgeFaceAndOrder ******/
		/****** md5 signature: 4801ef1e3c96c769b7cb65e3b4086a41 ******/
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder();

		/****** BRepFill_EdgeFaceAndOrder::BRepFill_EdgeFaceAndOrder ******/
		/****** md5 signature: b398464044b418659cdb92b47eda209d ******/
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge
aFace: TopoDS_Face
anOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder(const TopoDS_Edge & anEdge, const TopoDS_Face & aFace, const GeomAbs_Shape anOrder);

};


%extend BRepFill_EdgeFaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepFill_Evolved *
*************************/
class BRepFill_Evolved {
	public:
		/****** BRepFill_Evolved::BRepFill_Evolved ******/
		/****** md5 signature: d55c0989fa279c86b92f8b57ff833c4f ******/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Evolved;
		 BRepFill_Evolved();

		/****** BRepFill_Evolved::BRepFill_Evolved ******/
		/****** md5 signature: 3423c2bb910fe32370733bab3d7e6f67 ******/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates an evolved shape by sweeping the <Profile> along the <Spine>. <AxeProf> is used to set the position of <Profile> along <Spine> as follows: <AxeProf> slides on the profile with direction colinear to the normal to <Spine>, and its <XDirection> mixed with the tangent to <Spine>.
") BRepFill_Evolved;
		 BRepFill_Evolved(const TopoDS_Wire & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****** BRepFill_Evolved::BRepFill_Evolved ******/
		/****** md5 signature: 4ff0b71c6cc1f4f1017df44971096b6c ******/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Creates an evolved shape by sweeping the <Profile> along the <Spine>.
") BRepFill_Evolved;
		 BRepFill_Evolved(const TopoDS_Face & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****** BRepFill_Evolved::Bottom ******/
		/****** md5 signature: 25476ceb1dec30bd7775d9279e3f641c ******/
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return the face Bottom if <Solid> is True in the constructor.
") Bottom;
		const TopoDS_Shape Bottom();

		/****** BRepFill_Evolved::GeneratedShapes ******/
		/****** md5 signature: d6b410f91bd0b638e68b4f66ed161f82 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SpineShape: TopoDS_Shape
ProfShape: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the shapes created from a subshape <SpineShape> of the spine and a subshape <ProfShape> on the profile.
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SpineShape, const TopoDS_Shape & ProfShape);

		/****** BRepFill_Evolved::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_Evolved::JoinType ******/
		/****** md5 signature: 1a18175bc2a418f62c345ce7a665ff81 ******/
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", "Return
-------
GeomAbs_JoinType

Description
-----------
No available documentation.
") JoinType;
		GeomAbs_JoinType JoinType();

		/****** BRepFill_Evolved::Perform ******/
		/****** md5 signature: 9498522e18f2ee8ea44a5bacbb465d61 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Performs an evolved shape by sweeping the <Profile> along the <Spine>.
") Perform;
		void Perform(const TopoDS_Wire & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****** BRepFill_Evolved::Perform ******/
		/****** md5 signature: a60cbc089260fa0f56118a4e524358ca ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Performs an evolved shape by sweeping the <Profile> along the <Spine>.
") Perform;
		void Perform(const TopoDS_Face & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****** BRepFill_Evolved::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the generated shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** BRepFill_Evolved::Top ******/
		/****** md5 signature: c5b73d85ae980e083fd62982344b1f23 ******/
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return the face Top if <Solid> is True in the constructor.
") Top;
		const TopoDS_Shape Top();

};


%extend BRepFill_Evolved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepFill_FaceAndOrder *
******************************/
class BRepFill_FaceAndOrder {
	public:
		/****** BRepFill_FaceAndOrder::BRepFill_FaceAndOrder ******/
		/****** md5 signature: 09a53beaf7e2b88f8d947af49991e84a ******/
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder();

		/****** BRepFill_FaceAndOrder::BRepFill_FaceAndOrder ******/
		/****** md5 signature: 7b2e42a21051c0758c9fa3f433a3df99 ******/
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
anOrder: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder(const TopoDS_Face & aFace, const GeomAbs_Shape anOrder);

};


%extend BRepFill_FaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepFill_Filling *
*************************/
class BRepFill_Filling {
	public:
		/****** BRepFill_Filling::BRepFill_Filling ******/
		/****** md5 signature: b04c4da5ebf0b864f8a0d57205167633 ******/
		%feature("compactdefaultargs") BRepFill_Filling;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 15)
NbIter: int (optional, default to 2)
Anisotropie: bool (optional, default to Standard_False)
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)
MaxDeg: int (optional, default to 8)
MaxSegments: int (optional, default to 9)

Return
-------
None

Description
-----------
Constructor.
") BRepFill_Filling;
		 BRepFill_Filling(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 15, const Standard_Integer NbIter = 2, const Standard_Boolean Anisotropie = Standard_False, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: 274b86a603c7b5783321bcabeea10c24 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge
Order: GeomAbs_Shape
IsBound: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0: the surface has to pass by 3D representation of the edge GeomAbs_G1: the surface has to pass by 3D representation of the edge and to respect tangency with the first face of the edge GeomAbs_G2: the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the first face of the edge.
") Add;
		Standard_Integer Add(const TopoDS_Edge & anEdge, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: d07ded4a872eca32995c157ab48cd16d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge
Support: TopoDS_Face
Order: GeomAbs_Shape
IsBound: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0: the surface has to pass by 3D representation of the edge GeomAbs_G1: the surface has to pass by 3D representation of the edge and to respect tangency with the given face GeomAbs_G2: the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the given face.
") Add;
		Standard_Integer Add(const TopoDS_Edge & anEdge, const TopoDS_Face & Support, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: c110c3c507d8423f3ffde002d65004bf ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Support: TopoDS_Face
Order: GeomAbs_Shape

Return
-------
int

Description
-----------
Adds a free constraint on a face. The corresponding edge has to be automatically recomputed. It is always a bound.
") Add;
		Standard_Integer Add(const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: 1323f2a6b2ca8774ee472101d9518362 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt

Return
-------
int

Description
-----------
Adds a punctual constraint.
") Add;
		Standard_Integer Add(const gp_Pnt & Point);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: 66afaf29b06657fd99d38717aeeeb9f6 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Support: TopoDS_Face
Order: GeomAbs_Shape

Return
-------
int

Description
-----------
Adds a punctual constraint.
") Add;
		Standard_Integer Add(const Standard_Real U, const Standard_Real V, const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****** BRepFill_Filling::Build ******/
		/****** md5 signature: 634d88e5c99c5ce236c07b337243d591 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds the resulting faces.
") Build;
		void Build();

		/****** BRepFill_Filling::Face ******/
		/****** md5 signature: 64c75db1e9c1285068e9dd474618f74f ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		TopoDS_Face Face();

		/****** BRepFill_Filling::G0Error ******/
		/****** md5 signature: ba177a9a7bac2d394577a179fd8040ef ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G0Error;
		Standard_Real G0Error();

		/****** BRepFill_Filling::G0Error ******/
		/****** md5 signature: f99dce5527bffb3ecaa2d1093b4a3635 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") G0Error;
		Standard_Real G0Error(const Standard_Integer Index);

		/****** BRepFill_Filling::G1Error ******/
		/****** md5 signature: 0a0e55267bc5572a38177b75a97dfedc ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G1Error;
		Standard_Real G1Error();

		/****** BRepFill_Filling::G1Error ******/
		/****** md5 signature: 0d786918d533628c34e845fd87da5a9b ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") G1Error;
		Standard_Real G1Error(const Standard_Integer Index);

		/****** BRepFill_Filling::G2Error ******/
		/****** md5 signature: 0eac129a84e8ae945532a18ff833414e ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") G2Error;
		Standard_Real G2Error();

		/****** BRepFill_Filling::G2Error ******/
		/****** md5 signature: 02032765271044476a9ce38570208342 ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") G2Error;
		Standard_Real G2Error(const Standard_Integer Index);

		/****** BRepFill_Filling::Generated ******/
		/****** md5 signature: 20432e4d7ffc2a154be36ff0a467a19b ******/
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
Returns the list of shapes generated from the shape <S>.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****** BRepFill_Filling::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_Filling::LoadInitSurface ******/
		/****** md5 signature: 221c3bb0e79c1359b8a80544c093b5bd ******/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face

Return
-------
None

Description
-----------
Loads the initial Surface The initial surface must have orthogonal local coordinates, i.e. partial derivatives dS/du and dS/dv must be orthogonal at each point of surface. If this condition breaks, distortions of resulting surface are possible.
") LoadInitSurface;
		void LoadInitSurface(const TopoDS_Face & aFace);

		/****** BRepFill_Filling::SetApproxParam ******/
		/****** md5 signature: 24678d9cf0187a1e2d5fe74dfef72b0d ******/
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "
Parameters
----------
MaxDeg: int (optional, default to 8)
MaxSegments: int (optional, default to 9)

Return
-------
None

Description
-----------
Sets the parameters used for approximation of the surface.
") SetApproxParam;
		void SetApproxParam(const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****** BRepFill_Filling::SetConstrParam ******/
		/****** md5 signature: 2d967f76f30735b0413b7afac7004fa6 ******/
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "
Parameters
----------
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Sets the values of Tolerances used to control the constraint. Tol2d: Tol3d: it is the maximum distance allowed between the support surface and the constraints TolAng: it is the maximum angle allowed between the normal of the surface and the constraints TolCurv: it is the maximum difference of curvature allowed between the surface and the constraint.
") SetConstrParam;
		void SetConstrParam(const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****** BRepFill_Filling::SetResolParam ******/
		/****** md5 signature: 96cad4665171fb74735ecc8d46155136 ******/
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 15)
NbIter: int (optional, default to 2)
Anisotropie: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the parameters used for resolution. The default values of these parameters have been chosen for a good ratio quality/performance. Degree: it is the order of energy criterion to minimize for computing the deformation of the surface. The default value is 3 The recommended value is i+2 where i is the maximum order of the constraints. NbPtsOnCur: it is the average number of points for discretisation of the edges. NbIter: it is the maximum number of iterations of the process. For each iteration the number of discretisation points is increased. Anisotropie:.
") SetResolParam;
		void SetResolParam(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 15, const Standard_Integer NbIter = 2, const Standard_Boolean Anisotropie = Standard_False);

};


%extend BRepFill_Filling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFill_Generator *
***************************/
class BRepFill_Generator {
	public:
		/****** BRepFill_Generator::BRepFill_Generator ******/
		/****** md5 signature: 333126d142103b8ff5f800463f2efb21 ******/
		%feature("compactdefaultargs") BRepFill_Generator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Generator;
		 BRepFill_Generator();

		/****** BRepFill_Generator::AddWire ******/
		/****** md5 signature: 91c116931995adc0c5abeaf5746c9601 ******/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "
Parameters
----------
Wire: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") AddWire;
		void AddWire(const TopoDS_Wire & Wire);

		/****** BRepFill_Generator::Generated ******/
		/****** md5 signature: 176507b5ffd0100ab7a88bdc3ba1ff71 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeListOfShape

Description
-----------
Returns all the shapes created.
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****** BRepFill_Generator::GeneratedShapes ******/
		/****** md5 signature: a02662a3450a824732d8c073e350d988 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SSection: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the shapes created from a subshape <SSection> of a section.
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SSection);

		/****** BRepFill_Generator::GetStatus ******/
		/****** md5 signature: d01d66bd030c1232d59d2b7253fc3b10 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
BRepFill_ThruSectionErrorStatus

Description
-----------
Returns status of the operation.
") GetStatus;
		BRepFill_ThruSectionErrorStatus GetStatus();

		/****** BRepFill_Generator::IsMutableInput ******/
		/****** md5 signature: 2df16e5a957577cfce65832aa2d90512 ******/
		%feature("compactdefaultargs") IsMutableInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the current mutable input state.
") IsMutableInput;
		Standard_Boolean IsMutableInput();

		/****** BRepFill_Generator::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute the shell.
") Perform;
		void Perform();

		/****** BRepFill_Generator::ResultShape ******/
		/****** md5 signature: 01e3ecee0f6c4e9a7725c78d5680438b ******/
		%feature("compactdefaultargs") ResultShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns a modified shape in the constructed shell, If shape is not changed (replaced) during operation => returns the same shape.
") ResultShape;
		TopoDS_Shape ResultShape(const TopoDS_Shape & theShape);

		/****** BRepFill_Generator::SetMutableInput ******/
		/****** md5 signature: a0db619cccd4a2c2b443a5ab39c10ef8 ******/
		%feature("compactdefaultargs") SetMutableInput;
		%feature("autodoc", "
Parameters
----------
theIsMutableInput: bool

Return
-------
None

Description
-----------
Sets the mutable input state If true then the input profile can be modified inside the operation. Default value is true.
") SetMutableInput;
		void SetMutableInput(const Standard_Boolean theIsMutableInput);

		/****** BRepFill_Generator::Shell ******/
		/****** md5 signature: c581862d26a0a34b15cf9dd6d442e65d ******/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Return
-------
TopoDS_Shell

Description
-----------
No available documentation.
") Shell;
		const TopoDS_Shell Shell();

};


%extend BRepFill_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepFill_LocationLaw *
*****************************/
class BRepFill_LocationLaw : public Standard_Transient {
	public:
		/****** BRepFill_LocationLaw::Abscissa ******/
		/****** md5 signature: 4b4fb4867c503aba18d7bb9cbbce08f5 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
float

Description
-----------
Return the curvilinear abscissa corresponding to a point of the path, defined by <Index> of Edge and a parameter on the edge.
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer Index, const Standard_Real Param);

		/****** BRepFill_LocationLaw::CurvilinearBounds ******/
		/****** md5 signature: 1faa1030205d7a994159546f7df86e7b ******/
		%feature("compactdefaultargs") CurvilinearBounds;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
First: float
Last: float

Description
-----------
Return the Curvilinear Bounds of the <Index> Law.
") CurvilinearBounds;
		void CurvilinearBounds(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFill_LocationLaw::D0 ******/
		/****** md5 signature: 52c2d023fe81655193d586ee297b1241 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Abscissa: float
Section: TopoDS_Shape

Return
-------
None

Description
-----------
Apply the Law to a shape, for a given Curvilinear abscissa.
") D0;
		void D0(const Standard_Real Abscissa, TopoDS_Shape & Section);

		/****** BRepFill_LocationLaw::DeleteTransform ******/
		/****** md5 signature: ade97ef75466e592c0f10b061f700538 ******/
		%feature("compactdefaultargs") DeleteTransform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DeleteTransform;
		void DeleteTransform();

		/****** BRepFill_LocationLaw::Edge ******/
		/****** md5 signature: 8a7ac08a45b8dcdac4d9e0339f1c1d47 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Edge

Description
-----------
Return the Edge of rank <Index> in the path <Index> have to be in [1, NbLaw()].
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer Index);

		/****** BRepFill_LocationLaw::GetStatus ******/
		/****** md5 signature: ee71a82e4f5af8e3c4016af8fa6d8de6 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Return a error status, if the status is not PipeOk then it exist a parameter tlike the law is not valuable for t.
") GetStatus;
		GeomFill_PipeError GetStatus();

		/****** BRepFill_LocationLaw::Holes ******/
		/****** md5 signature: f3c74f7ef5d3c6aac517333d1f033de9 ******/
		%feature("compactdefaultargs") Holes;
		%feature("autodoc", "
Parameters
----------
Interval: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Holes;
		void Holes(TColStd_Array1OfInteger & Interval);

		/****** BRepFill_LocationLaw::IsClosed ******/
		/****** md5 signature: 29709d02fadc9fcb79a766bc9679271b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** BRepFill_LocationLaw::IsG1 ******/
		/****** md5 signature: 9963a7e0ee81d49de56ba09e373c171d ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "
Parameters
----------
Index: int
SpatialTolerance: float (optional, default to 1.0e-7)
AngularTolerance: float (optional, default to 1.0e-4)

Return
-------
int

Description
-----------
Compute the Law's continuity between 2 edges of the path The result can be: -1: Case Not connex 0: It is connex (G0) 1: It is tangent (G1).
") IsG1;
		Standard_Integer IsG1(const Standard_Integer Index, const Standard_Real SpatialTolerance = 1.0e-7, const Standard_Real AngularTolerance = 1.0e-4);

		/****** BRepFill_LocationLaw::Law ******/
		/****** md5 signature: 7442ea1d3577272be34ddbfb4ba782c8 ******/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
Return the elementary Law of rank <Index> <Index> have to be in [1, NbLaw()].
") Law;
		const opencascade::handle<GeomFill_LocationLaw> & Law(const Standard_Integer Index);

		/****** BRepFill_LocationLaw::NbHoles ******/
		/****** md5 signature: c25781684f83efc292c167e0cf2d2147 ******/
		%feature("compactdefaultargs") NbHoles;
		%feature("autodoc", "
Parameters
----------
Tol: float (optional, default to 1.0e-7)

Return
-------
int

Description
-----------
No available documentation.
") NbHoles;
		Standard_Integer NbHoles(const Standard_Real Tol = 1.0e-7);

		/****** BRepFill_LocationLaw::NbLaw ******/
		/****** md5 signature: 37098ff16cd9e076b3a2132752025ea0 ******/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of elementary Law.
") NbLaw;
		Standard_Integer NbLaw();

		/****** BRepFill_LocationLaw::Parameter ******/
		/****** md5 signature: fd5a6bab737a1d219166f125eb34b581 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Abscissa: float

Return
-------
Index: int
Param: float

Description
-----------
Find the index Law and the parameter, for a given Curvilinear abscissa.
") Parameter;
		void Parameter(const Standard_Real Abscissa, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BRepFill_LocationLaw::PerformVertex ******/
		/****** md5 signature: d38d6af521b96eeaf83da9ed396db4e5 ******/
		%feature("compactdefaultargs") PerformVertex;
		%feature("autodoc", "
Parameters
----------
Index: int
InputVertex: TopoDS_Vertex
TolMin: float
OutputVertex: TopoDS_Vertex
Location: int (optional, default to 0)

Return
-------
None

Description
-----------
Compute <OutputVertex> like a transformation of <InputVertex> the transformation is given by evaluation of the location law in the vertex of rank <Index>. <Location> is used to manage discontinuities: - -1: The law before the vertex is used. - 1: The law after the vertex is used. - 0: Average of the both laws is used.
") PerformVertex;
		void PerformVertex(const Standard_Integer Index, const TopoDS_Vertex & InputVertex, const Standard_Real TolMin, TopoDS_Vertex & OutputVertex, const Standard_Integer Location = 0);

		/****** BRepFill_LocationLaw::TransformInCompatibleLaw ******/
		/****** md5 signature: bedbf82281f40dd30d010eaee98401d4 ******/
		%feature("compactdefaultargs") TransformInCompatibleLaw;
		%feature("autodoc", "
Parameters
----------
AngularTolerance: float

Return
-------
None

Description
-----------
Apply a linear transformation on each law, to reduce the dicontinuities of law at one rotation.
") TransformInCompatibleLaw;
		virtual void TransformInCompatibleLaw(const Standard_Real AngularTolerance);

		/****** BRepFill_LocationLaw::TransformInG0Law ******/
		/****** md5 signature: 5f05797761b737e39ec06f0e5f8a1a0d ******/
		%feature("compactdefaultargs") TransformInG0Law;
		%feature("autodoc", "Return
-------
None

Description
-----------
Apply a linear transformation on each law, to have continuity of the global law between the edges.
") TransformInG0Law;
		virtual void TransformInG0Law();

		/****** BRepFill_LocationLaw::Vertex ******/
		/****** md5 signature: 20f24a7fa6e81f1f7fda1d9570c8d322 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Vertex

Description
-----------
Return the vertex of rank <Index> in the path <Index> have to be in [0, NbLaw()].
") Vertex;
		TopoDS_Vertex Vertex(const Standard_Integer Index);

		/****** BRepFill_LocationLaw::Wire ******/
		/****** md5 signature: 066765b94f5225dad05ab95ae3f8b503 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
return the path.
") Wire;
		const TopoDS_Wire Wire();

};


%make_alias(BRepFill_LocationLaw)

%extend BRepFill_LocationLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFill_MultiLine *
***************************/
class BRepFill_MultiLine : public AppCont_Function {
	public:
		/****** BRepFill_MultiLine::BRepFill_MultiLine ******/
		/****** md5 signature: 25bf6bcb7c15a3e8d5c3a8cc26761d67 ******/
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_MultiLine;
		 BRepFill_MultiLine();

		/****** BRepFill_MultiLine::BRepFill_MultiLine ******/
		/****** md5 signature: 843a5cba5c9ac5751e20a22ad435342c ******/
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", "
Parameters
----------
Face1: TopoDS_Face
Face2: TopoDS_Face
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Inv1: bool
Inv2: bool
Bissec: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_MultiLine;
		 BRepFill_MultiLine(const TopoDS_Face & Face1, const TopoDS_Face & Face2, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Boolean Inv1, const Standard_Boolean Inv2, const opencascade::handle<Geom2d_Curve> & Bissec);

		/****** BRepFill_MultiLine::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity between the two faces seShape from GeomAbsparated by myBis.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BRepFill_MultiLine::Curves ******/
		/****** md5 signature: e4017f1b73a93eef0b7382da99e2ab6b ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve
PCurve1: Geom2d_Curve
PCurve2: Geom2d_Curve

Return
-------
None

Description
-----------
raises if IsParticularCase is <False>.
") Curves;
		void Curves(opencascade::handle<Geom_Curve> & Curve, opencascade::handle<Geom2d_Curve> & PCurve1, opencascade::handle<Geom2d_Curve> & PCurve2);

		/****** BRepFill_MultiLine::D1 ******/
		/****** md5 signature: 7da7dab2c94bda12158221a2fefd05b7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: float
theVec2d: NCollection_Array1<gp_Vec2d>
theVec: NCollection_Array1<gp_Vec>

Return
-------
bool

Description
-----------
Returns the derivative at parameter <theU>.
") D1;
		virtual Standard_Boolean D1(const Standard_Real theU, NCollection_Array1<gp_Vec2d> & theVec2d, NCollection_Array1<gp_Vec> & theVec);

		/****** BRepFill_MultiLine::FirstParameter ******/
		/****** md5 signature: adaac52a0f2d3263c19caadcbea394a2 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the first parameter of the Bissectrice.
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****** BRepFill_MultiLine::IsParticularCase ******/
		/****** md5 signature: f043f128572074fde7a8be916fda3a7e ******/
		%feature("compactdefaultargs") IsParticularCase;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Search if the Projection of the Bissectrice on the faces needs an approximation or not. Returns true if the approximation is not needed.
") IsParticularCase;
		Standard_Boolean IsParticularCase();

		/****** BRepFill_MultiLine::LastParameter ******/
		/****** md5 signature: 38a37eecbdff8d3a1b5ffdd6b12bf4d9 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the last parameter of the Bissectrice.
") LastParameter;
		virtual Standard_Real LastParameter();

		/****** BRepFill_MultiLine::Value ******/
		/****** md5 signature: 183286476627e1c9a629476db3ac9809 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Returns the current point on the 3d curve.
") Value;
		gp_Pnt Value(const Standard_Real U);

		/****** BRepFill_MultiLine::Value ******/
		/****** md5 signature: 3ddc35b87661681f1ab1debe5928718b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theU: float
thePnt2d: NCollection_Array1<gp_Pnt2d>
thePnt: NCollection_Array1<gp_Pnt>

Return
-------
bool

Description
-----------
Returns the point at parameter <theU>.
") Value;
		virtual Standard_Boolean Value(const Standard_Real theU, NCollection_Array1<gp_Pnt2d> & thePnt2d, NCollection_Array1<gp_Pnt> & thePnt);

		/****** BRepFill_MultiLine::Value3dOnF1OnF2 ******/
		/****** md5 signature: 6b10dab8f99aeffab9dfaa452a3cc12d ******/
		%feature("compactdefaultargs") Value3dOnF1OnF2;
		%feature("autodoc", "
Parameters
----------
U: float
P3d: gp_Pnt
PF1: gp_Pnt2d
PF2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Value3dOnF1OnF2;
		void Value3dOnF1OnF2(const Standard_Real U, gp_Pnt & P3d, gp_Pnt2d & PF1, gp_Pnt2d & PF2);

		/****** BRepFill_MultiLine::ValueOnF1 ******/
		/****** md5 signature: 94e8f2cf111e1bc1504f69d1acd17218 ******/
		%feature("compactdefaultargs") ValueOnF1;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt2d

Description
-----------
returns the current point on the PCurve of the first face.
") ValueOnF1;
		gp_Pnt2d ValueOnF1(const Standard_Real U);

		/****** BRepFill_MultiLine::ValueOnF2 ******/
		/****** md5 signature: abfe30c9890723c8b8d211aa7edad92f ******/
		%feature("compactdefaultargs") ValueOnF2;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt2d

Description
-----------
returns the current point on the PCurve of the first face.
") ValueOnF2;
		gp_Pnt2d ValueOnF2(const Standard_Real U);

};


%extend BRepFill_MultiLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFill_OffsetAncestors *
*********************************/
class BRepFill_OffsetAncestors {
	public:
		/****** BRepFill_OffsetAncestors::BRepFill_OffsetAncestors ******/
		/****** md5 signature: dd74fe61982bbb189811677c8772e318 ******/
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors();

		/****** BRepFill_OffsetAncestors::BRepFill_OffsetAncestors ******/
		/****** md5 signature: 8e55cb04d940faef2828c07f9b38bf7c ******/
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", "
Parameters
----------
Paral: BRepFill_OffsetWire

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors(BRepFill_OffsetWire & Paral);

		/****** BRepFill_OffsetAncestors::Ancestor ******/
		/****** md5 signature: e1d080ff68475d2673d3e6a73f9780af ******/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Edge

Return
-------
TopoDS_Shape

Description
-----------
may return a Null Shape if S1 is not a subShape of <Paral>; if Perform is not done.
") Ancestor;
		const TopoDS_Shape Ancestor(const TopoDS_Edge & S1);

		/****** BRepFill_OffsetAncestors::HasAncestor ******/
		/****** md5 signature: 0feb5b98ca7c43b931dfb0b8e785d3af ******/
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") HasAncestor;
		Standard_Boolean HasAncestor(const TopoDS_Edge & S1);

		/****** BRepFill_OffsetAncestors::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_OffsetAncestors::Perform ******/
		/****** md5 signature: 4cce247d083b33caabb23034a8b43a3f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Paral: BRepFill_OffsetWire

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(BRepFill_OffsetWire & Paral);

};


%extend BRepFill_OffsetAncestors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepFill_OffsetWire *
****************************/
class BRepFill_OffsetWire {
	public:
		/****** BRepFill_OffsetWire::BRepFill_OffsetWire ******/
		/****** md5 signature: b32d6f7af2cab2a9e7e1abf97815f03e ******/
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire();

		/****** BRepFill_OffsetWire::BRepFill_OffsetWire ******/
		/****** md5 signature: 609e791215220f5c55699eced8efc843 ******/
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****** BRepFill_OffsetWire::GeneratedShapes ******/
		/****** md5 signature: 896d6eaf9318d01625ba0402363806d1 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SpineShape: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the shapes created from a subshape <SpineShape> of the spine. Returns the last computed Offset.
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SpineShape);

		/****** BRepFill_OffsetWire::Init ******/
		/****** md5 signature: 04028fd0677eb2fad3b6134f24c0b959 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initialize the evaluation of Offsetting.
") Init;
		void Init(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****** BRepFill_OffsetWire::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_OffsetWire::JoinType ******/
		/****** md5 signature: 1a18175bc2a418f62c345ce7a665ff81 ******/
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", "Return
-------
GeomAbs_JoinType

Description
-----------
No available documentation.
") JoinType;
		GeomAbs_JoinType JoinType();

		/****** BRepFill_OffsetWire::Perform ******/
		/****** md5 signature: 50205eaf73b49f4d2b44f0537bf87989 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Offset: float
Alt: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Performs an OffsetWire at an altitude <Alt> from the face ( According to the orientation of the face).
") Perform;
		void Perform(const Standard_Real Offset, const Standard_Real Alt = 0.0);

		/****** BRepFill_OffsetWire::PerformWithBiLo ******/
		/****** md5 signature: f64d08fade6abb7b2f5c414cd33010f3 ******/
		%feature("compactdefaultargs") PerformWithBiLo;
		%feature("autodoc", "
Parameters
----------
WSP: TopoDS_Face
Offset: float
Locus: BRepMAT2d_BisectingLocus
Link: BRepMAT2d_LinkTopoBilo
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Alt: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Performs an OffsetWire.
") PerformWithBiLo;
		void PerformWithBiLo(const TopoDS_Face & WSP, const Standard_Real Offset, const BRepMAT2d_BisectingLocus & Locus, BRepMAT2d_LinkTopoBilo & Link, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Real Alt = 0.0);

		/****** BRepFill_OffsetWire::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the generated shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** BRepFill_OffsetWire::Spine ******/
		/****** md5 signature: 6b2533d80a8cd359deec995337b4fd80 ******/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Spine;
		const TopoDS_Face Spine();

};


%extend BRepFill_OffsetWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepFill_Pipe *
**********************/
class BRepFill_Pipe {
	public:
		/****** BRepFill_Pipe::BRepFill_Pipe ******/
		/****** md5 signature: d4df9a3a9985ba8285655a16cb12baf4 ******/
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Pipe;
		 BRepFill_Pipe();

		/****** BRepFill_Pipe::BRepFill_Pipe ******/
		/****** md5 signature: cdec67dc11c949e0a43c5aa06c2c6e8d ******/
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
aMode: GeomFill_Trihedron (optional, default to GeomFill_IsCorrectedFrenet)
ForceApproxC1: bool (optional, default to Standard_False)
GeneratePartCase: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Pipe;
		 BRepFill_Pipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const GeomFill_Trihedron aMode = GeomFill_IsCorrectedFrenet, const Standard_Boolean ForceApproxC1 = Standard_False, const Standard_Boolean GeneratePartCase = Standard_False);

		/****** BRepFill_Pipe::Edge ******/
		/****** md5 signature: 9e0365124d39be3310792b9b1e3ba65b ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
ESpine: TopoDS_Edge
VProfile: TopoDS_Vertex

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge created from an edge of the spine and a vertex of the profile. if the edge or the vertex are not in the spine or the profile.
") Edge;
		TopoDS_Edge Edge(const TopoDS_Edge & ESpine, const TopoDS_Vertex & VProfile);

		/****** BRepFill_Pipe::ErrorOnSurface ******/
		/****** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****** BRepFill_Pipe::Face ******/
		/****** md5 signature: 0964bb8f678cdc86b67b3897964c1af0 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
ESpine: TopoDS_Edge
EProfile: TopoDS_Edge

Return
-------
TopoDS_Face

Description
-----------
Returns the face created from an edge of the spine and an edge of the profile. if the edges are not in the spine or the profile.
") Face;
		TopoDS_Face Face(const TopoDS_Edge & ESpine, const TopoDS_Edge & EProfile);

		/****** BRepFill_Pipe::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** BRepFill_Pipe::Generated ******/
		/****** md5 signature: 768067f46b5a2be6984659c6467cd78f ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		void Generated(const TopoDS_Shape & S, TopTools_ListOfShape & L);

		/****** BRepFill_Pipe::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** BRepFill_Pipe::Perform ******/
		/****** md5 signature: e7b638b85235be08cf45ea179e29ec5e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
GeneratePartCase: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const Standard_Boolean GeneratePartCase = Standard_False);

		/****** BRepFill_Pipe::PipeLine ******/
		/****** md5 signature: 55f8b2c61022d6779b48bfc461e428ec ******/
		%feature("compactdefaultargs") PipeLine;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt

Return
-------
TopoDS_Wire

Description
-----------
Create a Wire by sweeping the Point along the <spine> if the <Spine> is undefined.
") PipeLine;
		TopoDS_Wire PipeLine(const gp_Pnt & Point);

		/****** BRepFill_Pipe::Profile ******/
		/****** md5 signature: 79a7d86b74870c796d2c753c300c851a ******/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Profile;
		const TopoDS_Shape Profile();

		/****** BRepFill_Pipe::Section ******/
		/****** md5 signature: 21dfb1d466136117d36878bbae686eaa ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
VSpine: TopoDS_Vertex

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape created from the profile at the position of the vertex VSpine. if the vertex is not in the Spine.
") Section;
		TopoDS_Shape Section(const TopoDS_Vertex & VSpine);

		/****** BRepFill_Pipe::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** BRepFill_Pipe::Spine ******/
		/****** md5 signature: f6ea6e7c5910a000caa86ed2eb47e3d7 ******/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Spine;
		const TopoDS_Shape Spine();

};


%extend BRepFill_Pipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFill_PipeShell *
***************************/
class BRepFill_PipeShell : public Standard_Transient {
	public:
		/****** BRepFill_PipeShell::BRepFill_PipeShell ******/
		/****** md5 signature: f13911b618ee59949258d0ea58994931 ******/
		%feature("compactdefaultargs") BRepFill_PipeShell;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire

Return
-------
None

Description
-----------
Set an sweep's mode If no mode are set, the mode used in MakePipe is used.
") BRepFill_PipeShell;
		 BRepFill_PipeShell(const TopoDS_Wire & Spine);

		/****** BRepFill_PipeShell::Add ******/
		/****** md5 signature: 4646415ed2583fb1eb7c020fef17efa7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Set an section. The correspondence with the spine, will be automatically performed.
") Add;
		void Add(const TopoDS_Shape & Profile, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepFill_PipeShell::Add ******/
		/****** md5 signature: ea9d6839d1fe733dcb8684defcce8b79 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
Location: TopoDS_Vertex
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Set an section. The correspondence with the spine, is given by Location.
") Add;
		void Add(const TopoDS_Shape & Profile, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepFill_PipeShell::Build ******/
		/****** md5 signature: fb4f2d7aa4d9a33eacf2c039bec37b85 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		Standard_Boolean Build();

		/****** BRepFill_PipeShell::DeleteProfile ******/
		/****** md5 signature: 7299322f6ee9ec68b7478e344329d88d ******/
		%feature("compactdefaultargs") DeleteProfile;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape

Return
-------
None

Description
-----------
Delete an section.
") DeleteProfile;
		void DeleteProfile(const TopoDS_Shape & Profile);

		/****** BRepFill_PipeShell::ErrorOnSurface ******/
		/****** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****** BRepFill_PipeShell::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the bottom of the sweep.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** BRepFill_PipeShell::Generated ******/
		/****** md5 signature: 768067f46b5a2be6984659c6467cd78f ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		void Generated(const TopoDS_Shape & S, TopTools_ListOfShape & L);

		/****** BRepFill_PipeShell::GetStatus ******/
		/****** md5 signature: ee71a82e4f5af8e3c4016af8fa6d8de6 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Get a status, when Simulate or Build failed.
") GetStatus;
		GeomFill_PipeError GetStatus();

		/****** BRepFill_PipeShell::IsReady ******/
		/****** md5 signature: 68a96b040fc0b59848125a1a3ef33dcb ******/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if <self> is ready to build the shape return False if <self> do not have section definition.
") IsReady;
		Standard_Boolean IsReady();

		/****** BRepFill_PipeShell::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the TopoDS Shape of the top of the sweep.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** BRepFill_PipeShell::MakeSolid ******/
		/****** md5 signature: cac327adfb21fa10211d68dabc53974b ******/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Transform the sweeping Shell in Solid. If the section are not closed returns False.
") MakeSolid;
		Standard_Boolean MakeSolid();

		/****** BRepFill_PipeShell::Profiles ******/
		/****** md5 signature: 1b2b499d210731d9c45ae6c16e16db56 ******/
		%feature("compactdefaultargs") Profiles;
		%feature("autodoc", "
Parameters
----------
theProfiles: TopTools_ListOfShape

Return
-------
None

Description
-----------
Returns the list of original profiles.
") Profiles;
		void Profiles(TopTools_ListOfShape & theProfiles);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: ad296238ba7b296ddd67e2c77e041854 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Frenet: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Set an Frenet or an CorrectedFrenet trihedron to perform the sweeping.
") Set;
		void Set(const Standard_Boolean Frenet = Standard_False);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: 90e8940ed907efcf8c6e35257766922f ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Axe: gp_Ax2

Return
-------
None

Description
-----------
Set an fixed trihedron to perform the sweeping all sections will be parallel.
") Set;
		void Set(const gp_Ax2 & Axe);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: 4fe5fd878126c7abf66461ac49a9d95d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
BiNormal: gp_Dir

Return
-------
None

Description
-----------
Set an fixed BiNormal direction to perform the sweeping.
") Set;
		void Set(const gp_Dir & BiNormal);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: 3a5512d0c00b3142b199e2c762d5e552 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
SpineSupport: TopoDS_Shape

Return
-------
bool

Description
-----------
Set support to the spine to define the BiNormal at the spine, like the normal the surfaces. Warning: To be effective, Each edge of the <spine> must have an representation on one face of<SpineSupport>.
") Set;
		Standard_Boolean Set(const TopoDS_Shape & SpineSupport);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: 66377d62887bf90a45e3b528b4a485aa ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
AuxiliarySpine: TopoDS_Wire
CurvilinearEquivalence: bool (optional, default to Standard_True)
KeepContact: BRepFill_TypeOfContact (optional, default to BRepFill_NoContact)

Return
-------
None

Description
-----------
Set an auxiliary spine to define the Normal For each Point of the Spine P, an Point Q is evalued on <AuxiliarySpine> If <CurvilinearEquivalence> Q split <AuxiliarySpine> with the same length ratio than P split <Spline>. Else the plan define by P and the tangent to the <Spine> intersect <AuxiliarySpine> in Q. If <KeepContact> equals BRepFill_NoContact: The Normal is defined by the vector PQ. If <KeepContact> equals BRepFill_Contact: The Normal is defined to achieve that the sweeped section is in contact to the auxiliarySpine. The width of section is constant all along the path. In other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. However, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path.
") Set;
		void Set(const TopoDS_Wire & AuxiliarySpine, const Standard_Boolean CurvilinearEquivalence = Standard_True, const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);

		/****** BRepFill_PipeShell::SetDiscrete ******/
		/****** md5 signature: c354292a3d373003c260a3146997c775 ******/
		%feature("compactdefaultargs") SetDiscrete;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set a Discrete trihedron to perform the sweeping.
") SetDiscrete;
		void SetDiscrete();

		/****** BRepFill_PipeShell::SetForceApproxC1 ******/
		/****** md5 signature: ef99bf0713e14fbe9531aef549b5c75b ******/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "
Parameters
----------
ForceApproxC1: bool

Return
-------
None

Description
-----------
Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0. Give section to sweep. Possibilities are: - Give one or several profile - Give one profile and an homotetic law. - Automatic compute of correspondence between profile, and section on the sweeped shape - correspondence between profile, and section on the sweeped shape defined by a vertex of the spine.
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****** BRepFill_PipeShell::SetLaw ******/
		/****** md5 signature: af186f09c05a666850d65baf0970c9c2 ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Set an section and an homotetic law. The homotetie's centers is given by point on the <Spine>.
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepFill_PipeShell::SetLaw ******/
		/****** md5 signature: d67cbe53520bea57d641b9a7a96a4fae ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
Location: TopoDS_Vertex
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Set an section and an homotetic law. The homotetie center is given by point on the <Spine>.
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepFill_PipeShell::SetMaxDegree ******/
		/****** md5 signature: 2a3ad6060a0d872631abe8d437d6229f ******/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "
Parameters
----------
NewMaxDegree: int

Return
-------
None

Description
-----------
Define the maximum V degree of resulting surface.
") SetMaxDegree;
		void SetMaxDegree(const Standard_Integer NewMaxDegree);

		/****** BRepFill_PipeShell::SetMaxSegments ******/
		/****** md5 signature: 7215f32d76e44b535e90a1a1c2957613 ******/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "
Parameters
----------
NewMaxSegments: int

Return
-------
None

Description
-----------
Define the maximum number of spans in V-direction on resulting surface.
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer NewMaxSegments);

		/****** BRepFill_PipeShell::SetTolerance ******/
		/****** md5 signature: 7a6605305c5a1448579b26f09880877f ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float (optional, default to 1.0e-4)
BoundTol: float (optional, default to 1.0e-4)
TolAngular: float (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d = 1.0e-4, const Standard_Real BoundTol = 1.0e-4, const Standard_Real TolAngular = 1.0e-2);

		/****** BRepFill_PipeShell::SetTransition ******/
		/****** md5 signature: e4bfbc283a87ba6421fedfbb4b43700d ******/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "
Parameters
----------
Mode: BRepFill_TransitionStyle (optional, default to BRepFill_Modified)
Angmin: float (optional, default to 1.0e-2)
Angmax: float (optional, default to 6.0)

Return
-------
None

Description
-----------
Set the Transition Mode to manage discontinuities on the sweep.
") SetTransition;
		void SetTransition(const BRepFill_TransitionStyle Mode = BRepFill_Modified, const Standard_Real Angmin = 1.0e-2, const Standard_Real Angmax = 6.0);

		/****** BRepFill_PipeShell::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the result Shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** BRepFill_PipeShell::Simulate ******/
		/****** md5 signature: 78b0624fde27ce53b740001cf13ef69f ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "
Parameters
----------
NumberOfSection: int
Sections: TopTools_ListOfShape

Return
-------
None

Description
-----------
Perform simulation of the sweep: Some Section are returned.
") Simulate;
		void Simulate(const Standard_Integer NumberOfSection, TopTools_ListOfShape & Sections);

		/****** BRepFill_PipeShell::Spine ******/
		/****** md5 signature: 6331688635fc3e41ab0cf89de46bd269 ******/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the spine.
") Spine;
		const TopoDS_Wire Spine();

};


%make_alias(BRepFill_PipeShell)

%extend BRepFill_PipeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepFill_Section *
*************************/
class BRepFill_Section {
	public:
		/****** BRepFill_Section::BRepFill_Section ******/
		/****** md5 signature: e61ac8f8fadf0c18f22e16153b6f3080 ******/
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Section;
		 BRepFill_Section();

		/****** BRepFill_Section::BRepFill_Section ******/
		/****** md5 signature: c0d5bd713dddab12913a129679ad38d3 ******/
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
V: TopoDS_Vertex
WithContact: bool
WithCorrection: bool

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Section;
		 BRepFill_Section(const TopoDS_Shape & Profile, const TopoDS_Vertex & V, const Standard_Boolean WithContact, const Standard_Boolean WithCorrection);

		/****** BRepFill_Section::IsLaw ******/
		/****** md5 signature: 627cfa98ccbc7b8171e188b44fb3fb68 ******/
		%feature("compactdefaultargs") IsLaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLaw;
		Standard_Boolean IsLaw();

		/****** BRepFill_Section::IsPunctual ******/
		/****** md5 signature: 34d460c36b2defadbac70729c5fa4e71 ******/
		%feature("compactdefaultargs") IsPunctual;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPunctual;
		Standard_Boolean IsPunctual();

		/****** BRepFill_Section::ModifiedShape ******/
		/****** md5 signature: e234547dbb5d90ba2a5ae58c4d9ebd62 ******/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ModifiedShape;
		TopoDS_Shape ModifiedShape(const TopoDS_Shape & theShape);

		/****** BRepFill_Section::OriginalShape ******/
		/****** md5 signature: 37aa687b33206d2183ad29c927b910b3 ******/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OriginalShape;
		const TopoDS_Shape OriginalShape();

		/****** BRepFill_Section::Set ******/
		/****** md5 signature: bf8d56136803d99502545d893d044863 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
IsLaw: bool

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean IsLaw);

		/****** BRepFill_Section::Vertex ******/
		/****** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex();

		/****** BRepFill_Section::Wire ******/
		/****** md5 signature: 066765b94f5225dad05ab95ae3f8b503 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
No available documentation.
") Wire;
		const TopoDS_Wire Wire();

		/****** BRepFill_Section::WithContact ******/
		/****** md5 signature: 8c52eb3488d5e864eb4494366981008b ******/
		%feature("compactdefaultargs") WithContact;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithContact;
		Standard_Boolean WithContact();

		/****** BRepFill_Section::WithCorrection ******/
		/****** md5 signature: d8c8bc674f5d5b3fb56e5f5b44b37170 ******/
		%feature("compactdefaultargs") WithCorrection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithCorrection;
		Standard_Boolean WithCorrection();

};


%extend BRepFill_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepFill_SectionLaw *
****************************/
%nodefaultctor BRepFill_SectionLaw;
class BRepFill_SectionLaw : public Standard_Transient {
	public:
		/****** BRepFill_SectionLaw::ConcatenedLaw ******/
		/****** md5 signature: a11a20466a33081fa6be7c7d399ac6f0 ******/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_SectionLaw>

Description
-----------
No available documentation.
") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****** BRepFill_SectionLaw::Continuity ******/
		/****** md5 signature: d2ca4ce96ca24c38a7e6d5cd32d00816 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
Index: int
TolAngular: float

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity(const Standard_Integer Index, const Standard_Real TolAngular);

		/****** BRepFill_SectionLaw::CurrentEdge ******/
		/****** md5 signature: 2193a21094be95b48640757db8202bfa ******/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") CurrentEdge;
		TopoDS_Edge CurrentEdge();

		/****** BRepFill_SectionLaw::D0 ******/
		/****** md5 signature: 4f469a957aae07c7edf28ee118badab3 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") D0;
		virtual void D0(const Standard_Real U, TopoDS_Shape & S);

		/****** BRepFill_SectionLaw::IndexOfEdge ******/
		/****** md5 signature: 907ba1dff8adec2cf8c8b22bf8d3bc50 ******/
		%feature("compactdefaultargs") IndexOfEdge;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") IndexOfEdge;
		Standard_Integer IndexOfEdge(const TopoDS_Shape & anEdge);

		/****** BRepFill_SectionLaw::Init ******/
		/****** md5 signature: 1b008bb762428c969d10a2c51ed2db58 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Wire & W);

		/****** BRepFill_SectionLaw::IsConstant ******/
		/****** md5 signature: 337c4e46b4ff32f057b2cee90a9a9b55 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** BRepFill_SectionLaw::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_SectionLaw::IsUClosed ******/
		/****** md5 signature: 17d29145e29e54adf880f81b138cfeb5 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** BRepFill_SectionLaw::IsVClosed ******/
		/****** md5 signature: 270ac1341783e48f1a0f14434f1599d3 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** BRepFill_SectionLaw::IsVertex ******/
		/****** md5 signature: 302402c7a4a48b3d6f9b09f532742fc8 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the input shape is a vertex.
") IsVertex;
		virtual Standard_Boolean IsVertex();

		/****** BRepFill_SectionLaw::Law ******/
		/****** md5 signature: 2f654c531c53f8e84f5761bf7e8bf354 ******/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<GeomFill_SectionLaw>

Description
-----------
No available documentation.
") Law;
		const opencascade::handle<GeomFill_SectionLaw> & Law(const Standard_Integer Index);

		/****** BRepFill_SectionLaw::NbLaw ******/
		/****** md5 signature: 37098ff16cd9e076b3a2132752025ea0 ******/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLaw;
		Standard_Integer NbLaw();

		/****** BRepFill_SectionLaw::Vertex ******/
		/****** md5 signature: e585460981726e88b1fbe195471a8be2 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		virtual TopoDS_Vertex Vertex(const Standard_Integer Index, const Standard_Real Param);

		/****** BRepFill_SectionLaw::VertexTol ******/
		/****** md5 signature: 1c0bff8ea482aa3b86222cc8cb5f84f5 ******/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
float

Description
-----------
No available documentation.
") VertexTol;
		virtual Standard_Real VertexTol(const Standard_Integer Index, const Standard_Real Param);

};


%make_alias(BRepFill_SectionLaw)

%extend BRepFill_SectionLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepFill_SectionPlacement *
**********************************/
class BRepFill_SectionPlacement {
	public:
		/****** BRepFill_SectionPlacement::BRepFill_SectionPlacement ******/
		/****** md5 signature: 210cac6a0902d4f5c3388f3f5f93ddf8 ******/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "
Parameters
----------
Law: BRepFill_LocationLaw
Section: TopoDS_Shape
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Automatic placement.
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement(const opencascade::handle<BRepFill_LocationLaw> & Law, const TopoDS_Shape & Section, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepFill_SectionPlacement::BRepFill_SectionPlacement ******/
		/****** md5 signature: 22b469e71ce31627b4ac02814f5e6e35 ******/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "
Parameters
----------
Law: BRepFill_LocationLaw
Section: TopoDS_Shape
Vertex: TopoDS_Shape
WithContact: bool (optional, default to Standard_False)
WithCorrection: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Placement on vertex.
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement(const opencascade::handle<BRepFill_LocationLaw> & Law, const TopoDS_Shape & Section, const TopoDS_Shape & Vertex, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****** BRepFill_SectionPlacement::AbscissaOnPath ******/
		/****** md5 signature: e1594bccbdf3136bf5cf1f500cf4c013 ******/
		%feature("compactdefaultargs") AbscissaOnPath;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") AbscissaOnPath;
		Standard_Real AbscissaOnPath();

		/****** BRepFill_SectionPlacement::Transformation ******/
		/****** md5 signature: 567e6ee373139970f4679dbb49e28e7c ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Transformation;
		const gp_Trsf Transformation();

};


%extend BRepFill_SectionPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepFill_Sweep *
***********************/
class BRepFill_Sweep {
	public:
		/****** BRepFill_Sweep::BRepFill_Sweep ******/
		/****** md5 signature: 4bd773fce0e9972dd0b0e7000d37e1c6 ******/
		%feature("compactdefaultargs") BRepFill_Sweep;
		%feature("autodoc", "
Parameters
----------
Section: BRepFill_SectionLaw
Location: BRepFill_LocationLaw
WithKPart: bool

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Sweep;
		 BRepFill_Sweep(const opencascade::handle<BRepFill_SectionLaw> & Section, const opencascade::handle<BRepFill_LocationLaw> & Location, const Standard_Boolean WithKPart);

		/****** BRepFill_Sweep::Build ******/
		/****** md5 signature: 8948957dd26d744dcb6a952ff83fd290 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
ReversedEdges: TopTools_MapOfShape
Tapes: BRepFill_DataMapOfShapeHArray2OfShape
Rails: BRepFill_DataMapOfShapeHArray2OfShape
Transition: BRepFill_TransitionStyle (optional, default to BRepFill_Modified)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Approx: GeomFill_ApproxStyle (optional, default to GeomFill_Location)
Degmax: int (optional, default to 11)
Segmax: int (optional, default to 30)

Return
-------
None

Description
-----------
Build the Sweep Surface Transition define Transition strategy Approx define Approximation Strategy - GeomFill_Section: The composed Function Location X Section is directly approximated. - GeomFill_Location: The location law is approximated, and the SweepSurface builds an algebraic composition of approximated location law and section law This option is Ok, if Section.Surface() methode is effective. Continuity: The continuity in v waiting on the surface Degmax: The maximum degree in v required on the surface Segmax: The maximum number of span in v required on the surface.
") Build;
		void Build(TopTools_MapOfShape & ReversedEdges, BRepFill_DataMapOfShapeHArray2OfShape & Tapes, BRepFill_DataMapOfShapeHArray2OfShape & Rails, const BRepFill_TransitionStyle Transition = BRepFill_Modified, const GeomAbs_Shape Continuity = GeomAbs_C2, const GeomFill_ApproxStyle Approx = GeomFill_Location, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 30);

		/****** BRepFill_Sweep::ErrorOnSurface ******/
		/****** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get the Approximation error.
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****** BRepFill_Sweep::InterFaces ******/
		/****** md5 signature: 2722003ae5ed02eb76b0dc1ff08ee8a4 ******/
		%feature("compactdefaultargs") InterFaces;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HArray2OfShape>

Description
-----------
No available documentation.
") InterFaces;
		opencascade::handle<TopTools_HArray2OfShape> InterFaces();

		/****** BRepFill_Sweep::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the Shape is Build.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_Sweep::Sections ******/
		/****** md5 signature: 88662b898322dac55a408cb35a139d61 ******/
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HArray2OfShape>

Description
-----------
No available documentation.
") Sections;
		opencascade::handle<TopTools_HArray2OfShape> Sections();

		/****** BRepFill_Sweep::SetAngularControl ******/
		/****** md5 signature: 9a75655ab5588301953b3e117b7b1018 ******/
		%feature("compactdefaultargs") SetAngularControl;
		%feature("autodoc", "
Parameters
----------
AngleMin: float (optional, default to 0.01)
AngleMax: float (optional, default to 6.0)

Return
-------
None

Description
-----------
Tolerance To controle Corner management. //! If the discontinuity is lesser than <AngleMin> in radian The Transition Performed will be always 'Modified'.
") SetAngularControl;
		void SetAngularControl(const Standard_Real AngleMin = 0.01, const Standard_Real AngleMax = 6.0);

		/****** BRepFill_Sweep::SetBounds ******/
		/****** md5 signature: bc59efbec6dfc54217c2b23ecafc6827 ******/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "
Parameters
----------
FirstShape: TopoDS_Wire
LastShape: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") SetBounds;
		void SetBounds(const TopoDS_Wire & FirstShape, const TopoDS_Wire & LastShape);

		/****** BRepFill_Sweep::SetForceApproxC1 ******/
		/****** md5 signature: ef99bf0713e14fbe9531aef549b5c75b ******/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "
Parameters
----------
ForceApproxC1: bool

Return
-------
None

Description
-----------
Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****** BRepFill_Sweep::SetTolerance ******/
		/****** md5 signature: 0c0c29e014b1ba349cc5155f8793397a ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
BoundTol: float (optional, default to 1.0)
Tol2d: float (optional, default to 1.0e-5)
TolAngular: float (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
Set Approximation Tolerance Tol3d: Tolerance to surface approximation Tol2d: Tolerance used to perform curve approximation Normally the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular: Tolerance (in radian) to control the angle between tangents on the section law and tangent of iso-v on approximated surface.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d, const Standard_Real BoundTol = 1.0, const Standard_Real Tol2d = 1.0e-5, const Standard_Real TolAngular = 1.0e-2);

		/****** BRepFill_Sweep::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the Sweeping Shape.
") Shape;
		TopoDS_Shape Shape();

		/****** BRepFill_Sweep::SubShape ******/
		/****** md5 signature: e4bb1fadebe41ca5dc04b13c83f173aa ******/
		%feature("compactdefaultargs") SubShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HArray2OfShape>

Description
-----------
No available documentation.
") SubShape;
		opencascade::handle<TopTools_HArray2OfShape> SubShape();

		/****** BRepFill_Sweep::Tape ******/
		/****** md5 signature: b18f2a38c1dd8f654316d3591197c164 ******/
		%feature("compactdefaultargs") Tape;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
returns the Tape corresponding to Index-th edge of section.
") Tape;
		TopoDS_Shape Tape(const Standard_Integer Index);

};


%extend BRepFill_Sweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepFill_TrimEdgeTool *
******************************/
class BRepFill_TrimEdgeTool {
	public:
		/****** BRepFill_TrimEdgeTool::BRepFill_TrimEdgeTool ******/
		/****** md5 signature: df16e3d74c293c3858dcd8b7873d0dc0 ******/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool();

		/****** BRepFill_TrimEdgeTool::BRepFill_TrimEdgeTool ******/
		/****** md5 signature: be4ef61946c69fac7539e57ce14a0f9d ******/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "
Parameters
----------
Bisec: Bisector_Bisec
S1: Geom2d_Geometry
S2: Geom2d_Geometry
Offset: float

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool(const Bisector_Bisec & Bisec, const opencascade::handle<Geom2d_Geometry> & S1, const opencascade::handle<Geom2d_Geometry> & S2, const Standard_Real Offset);

		/****** BRepFill_TrimEdgeTool::AddOrConfuse ******/
		/****** md5 signature: 297868f74217946610c526fee579a8ca ******/
		%feature("compactdefaultargs") AddOrConfuse;
		%feature("autodoc", "
Parameters
----------
Start: bool
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Params: TColgp_SequenceOfPnt

Return
-------
None

Description
-----------
No available documentation.
") AddOrConfuse;
		void AddOrConfuse(const Standard_Boolean Start, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, TColgp_SequenceOfPnt & Params);

		/****** BRepFill_TrimEdgeTool::IntersectWith ******/
		/****** md5 signature: 4185ea6e9b4d8cc6dd841196012f73af ******/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "
Parameters
----------
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
InitShape1: TopoDS_Shape
InitShape2: TopoDS_Shape
End1: TopoDS_Vertex
End2: TopoDS_Vertex
theJoinType: GeomAbs_JoinType
IsOpenResult: bool
Params: TColgp_SequenceOfPnt

Return
-------
None

Description
-----------
No available documentation.
") IntersectWith;
		void IntersectWith(const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const TopoDS_Shape & InitShape1, const TopoDS_Shape & InitShape2, const TopoDS_Vertex & End1, const TopoDS_Vertex & End2, const GeomAbs_JoinType theJoinType, const Standard_Boolean IsOpenResult, TColgp_SequenceOfPnt & Params);

		/****** BRepFill_TrimEdgeTool::IsInside ******/
		/****** md5 signature: 9be77a568a0605cae4e2b82729d80744 ******/
		%feature("compactdefaultargs") IsInside;
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
") IsInside;
		Standard_Boolean IsInside(const gp_Pnt2d & P);

};


%extend BRepFill_TrimEdgeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFill_TrimShellCorner *
*********************************/
class BRepFill_TrimShellCorner {
	public:
		/****** BRepFill_TrimShellCorner::BRepFill_TrimShellCorner ******/
		/****** md5 signature: 2bb20b7a9d4f9625d8bd98b1e30b2acd ******/
		%feature("compactdefaultargs") BRepFill_TrimShellCorner;
		%feature("autodoc", "
Parameters
----------
theFaces: TopTools_HArray2OfShape
theTransition: BRepFill_TransitionStyle
theAxeOfBisPlane: gp_Ax2
theIntPointCrossDir: gp_Vec

Return
-------
None

Description
-----------
Constructor: takes faces to intersect, type of transition (it can be RightCorner or RoundCorner) and axis of bisector plane theIntersectPointCrossDirection: prev path direction at the origin point of theAxeOfBisPlane cross next path direction at the origin point of theAxeOfBisPlane. used when EE has more than one vertices.
") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner(const opencascade::handle<TopTools_HArray2OfShape> & theFaces, const BRepFill_TransitionStyle theTransition, const gp_Ax2 & theAxeOfBisPlane, const gp_Vec & theIntPointCrossDir);

		/****** BRepFill_TrimShellCorner::AddBounds ******/
		/****** md5 signature: 70621cde2e2ea8a90994c6feb97fbd2c ******/
		%feature("compactdefaultargs") AddBounds;
		%feature("autodoc", "
Parameters
----------
Bounds: TopTools_HArray2OfShape

Return
-------
None

Description
-----------
No available documentation.
") AddBounds;
		void AddBounds(const opencascade::handle<TopTools_HArray2OfShape> & Bounds);

		/****** BRepFill_TrimShellCorner::AddUEdges ******/
		/****** md5 signature: 019276b5dde572686ddaf24b92531b81 ******/
		%feature("compactdefaultargs") AddUEdges;
		%feature("autodoc", "
Parameters
----------
theUEdges: TopTools_HArray2OfShape

Return
-------
None

Description
-----------
No available documentation.
") AddUEdges;
		void AddUEdges(const opencascade::handle<TopTools_HArray2OfShape> & theUEdges);

		/****** BRepFill_TrimShellCorner::AddVEdges ******/
		/****** md5 signature: 338ed3b1e2ba98094e3835a4935c4864 ******/
		%feature("compactdefaultargs") AddVEdges;
		%feature("autodoc", "
Parameters
----------
theVEdges: TopTools_HArray2OfShape
theIndex: int

Return
-------
None

Description
-----------
No available documentation.
") AddVEdges;
		void AddVEdges(const opencascade::handle<TopTools_HArray2OfShape> & theVEdges, const Standard_Integer theIndex);

		/****** BRepFill_TrimShellCorner::HasSection ******/
		/****** md5 signature: 98a762424c2b8b56d60a7042e1613224 ******/
		%feature("compactdefaultargs") HasSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSection;
		Standard_Boolean HasSection();

		/****** BRepFill_TrimShellCorner::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BRepFill_TrimShellCorner::Modified ******/
		/****** md5 signature: f81cf8201833ba1619b2e9297e442305 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
theModified: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") Modified;
		void Modified(const TopoDS_Shape & S, TopTools_ListOfShape & theModified);

		/****** BRepFill_TrimShellCorner::Perform ******/
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

};


%extend BRepFill_TrimShellCorner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFill_TrimSurfaceTool *
*********************************/
class BRepFill_TrimSurfaceTool {
	public:
		/****** BRepFill_TrimSurfaceTool::BRepFill_TrimSurfaceTool ******/
		/****** md5 signature: 687ffb167ac8420b3538447d155a9c2e ******/
		%feature("compactdefaultargs") BRepFill_TrimSurfaceTool;
		%feature("autodoc", "
Parameters
----------
Bis: Geom2d_Curve
Face1: TopoDS_Face
Face2: TopoDS_Face
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Inv1: bool
Inv2: bool

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_TrimSurfaceTool;
		 BRepFill_TrimSurfaceTool(const opencascade::handle<Geom2d_Curve> & Bis, const TopoDS_Face & Face1, const TopoDS_Face & Face2, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Boolean Inv1, const Standard_Boolean Inv2);

		/****** BRepFill_TrimSurfaceTool::IntersectWith ******/
		/****** md5 signature: dfce88de574620a98400827e2dbf9c14 ******/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "
Parameters
----------
EdgeOnF1: TopoDS_Edge
EdgeOnF2: TopoDS_Edge
Points: TColgp_SequenceOfPnt

Return
-------
None

Description
-----------
Intersect <Bis> with the projection of the edges <EdgeOnFi> and returns the intersecting parameters on Bis and on the edges P.X(): Parameter on Bis P.Y(): Parameter on EdgeOnF1 P.Z(): Parameter on EdgeOnF2 raises if <Edge> is not a edge of Face1 or Face2.
") IntersectWith;
		void IntersectWith(const TopoDS_Edge & EdgeOnF1, const TopoDS_Edge & EdgeOnF2, TColgp_SequenceOfPnt & Points);

		/****** BRepFill_TrimSurfaceTool::IsOnFace ******/
		/****** md5 signature: d6a8f88d8d2b38d19fbe3df805bac5b8 ******/
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d

Return
-------
bool

Description
-----------
returns True if the Line (P, DZ) intersect the Faces.
") IsOnFace;
		Standard_Boolean IsOnFace(const gp_Pnt2d & Point);

		/****** BRepFill_TrimSurfaceTool::ProjOn ******/
		/****** md5 signature: ac17addb66304c3bd74131762028e6e1 ******/
		%feature("compactdefaultargs") ProjOn;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Edge: TopoDS_Edge

Return
-------
float

Description
-----------
returns the parameter of the point <Point> on the Edge <Edge>, assuming that the point is on the edge.
") ProjOn;
		Standard_Real ProjOn(const gp_Pnt2d & Point, const TopoDS_Edge & Edge);

		/****** BRepFill_TrimSurfaceTool::Project ******/
		/****** md5 signature: 729c9c8c03dd73c9392eb2dbe88f9049 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
U1: float
U2: float
Curve: Geom_Curve
PCurve1: Geom2d_Curve
PCurve2: Geom2d_Curve

Return
-------
myCont: GeomAbs_Shape

Description
-----------
No available documentation.
") Project;
		void Project(const Standard_Real U1, const Standard_Real U2, opencascade::handle<Geom_Curve> & Curve, opencascade::handle<Geom2d_Curve> & PCurve1, opencascade::handle<Geom2d_Curve> & PCurve2, GeomAbs_Shape &OutValue);

};


%extend BRepFill_TrimSurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepFill_ACRLaw *
************************/
class BRepFill_ACRLaw : public BRepFill_LocationLaw {
	public:
		/****** BRepFill_ACRLaw::BRepFill_ACRLaw ******/
		/****** md5 signature: 5bd642d9de88bc8646f8a34711618e0d ******/
		%feature("compactdefaultargs") BRepFill_ACRLaw;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Wire
Law: GeomFill_LocationGuide

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_ACRLaw;
		 BRepFill_ACRLaw(const TopoDS_Wire & Path, const opencascade::handle<GeomFill_LocationGuide> & Law);

};


%make_alias(BRepFill_ACRLaw)

%extend BRepFill_ACRLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFill_Edge3DLaw *
***************************/
class BRepFill_Edge3DLaw : public BRepFill_LocationLaw {
	public:
		/****** BRepFill_Edge3DLaw::BRepFill_Edge3DLaw ******/
		/****** md5 signature: 089e9516c0b066432399a72644b58029 ******/
		%feature("compactdefaultargs") BRepFill_Edge3DLaw;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Wire
Law: GeomFill_LocationLaw

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Edge3DLaw;
		 BRepFill_Edge3DLaw(const TopoDS_Wire & Path, const opencascade::handle<GeomFill_LocationLaw> & Law);

};


%make_alias(BRepFill_Edge3DLaw)

%extend BRepFill_Edge3DLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepFill_EdgeOnSurfLaw *
*******************************/
class BRepFill_EdgeOnSurfLaw : public BRepFill_LocationLaw {
	public:
		/****** BRepFill_EdgeOnSurfLaw::BRepFill_EdgeOnSurfLaw ******/
		/****** md5 signature: 13919471c170841dd3a9c1a117b35fde ******/
		%feature("compactdefaultargs") BRepFill_EdgeOnSurfLaw;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Wire
Surf: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_EdgeOnSurfLaw;
		 BRepFill_EdgeOnSurfLaw(const TopoDS_Wire & Path, const TopoDS_Shape & Surf);

		/****** BRepFill_EdgeOnSurfLaw::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns <False> if one Edge of <Path> do not have representation on <Surf>. In this case it is impossible to use this object.
") HasResult;
		Standard_Boolean HasResult();

};


%make_alias(BRepFill_EdgeOnSurfLaw)

%extend BRepFill_EdgeOnSurfLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepFill_NSections *
***************************/
class BRepFill_NSections : public BRepFill_SectionLaw {
	public:
		/****** BRepFill_NSections::BRepFill_NSections ******/
		/****** md5 signature: 3b127eaf407cfcc5930986d01296f429 ******/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "
Parameters
----------
S: TopTools_SequenceOfShape
Build: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Construct.
") BRepFill_NSections;
		 BRepFill_NSections(const TopTools_SequenceOfShape & S, const Standard_Boolean Build = Standard_True);

		/****** BRepFill_NSections::BRepFill_NSections ******/
		/****** md5 signature: 43eecd6730511becf0529de67a23dc5f ******/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "
Parameters
----------
S: TopTools_SequenceOfShape
Trsfs: GeomFill_SequenceOfTrsf
P: TColStd_SequenceOfReal
VF: float
VL: float
Build: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Construct.
") BRepFill_NSections;
		 BRepFill_NSections(const TopTools_SequenceOfShape & S, const GeomFill_SequenceOfTrsf & Trsfs, const TColStd_SequenceOfReal & P, const Standard_Real VF, const Standard_Real VL, const Standard_Boolean Build = Standard_True);

		/****** BRepFill_NSections::ConcatenedLaw ******/
		/****** md5 signature: 4495106cbf0901c13e169216aea3ff82 ******/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_SectionLaw>

Description
-----------
Give the law build on a concatenated section.
") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****** BRepFill_NSections::Continuity ******/
		/****** md5 signature: a0e903623d8c6b4c441db63330dfde38 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
Index: int
TolAngular: float

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity(const Standard_Integer Index, const Standard_Real TolAngular);

		/****** BRepFill_NSections::D0 ******/
		/****** md5 signature: de496c8c897345c41ec4327b5afb7dea ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") D0;
		virtual void D0(const Standard_Real Param, TopoDS_Shape & S);

		/****** BRepFill_NSections::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the Law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** BRepFill_NSections::IsVertex ******/
		/****** md5 signature: 9153c2b3b3fc32dd6aea02d7fc3fe588 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the input shape is a vertex.
") IsVertex;
		virtual Standard_Boolean IsVertex();

		/****** BRepFill_NSections::Vertex ******/
		/****** md5 signature: 50d7f598881fad0d7b254edf83197d3e ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		virtual TopoDS_Vertex Vertex(const Standard_Integer Index, const Standard_Real Param);

		/****** BRepFill_NSections::VertexTol ******/
		/****** md5 signature: b5ecc9a4e833886cbbedfc54fe0fbfe1 ******/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
float

Description
-----------
No available documentation.
") VertexTol;
		virtual Standard_Real VertexTol(const Standard_Integer Index, const Standard_Real Param);

};


%make_alias(BRepFill_NSections)

%extend BRepFill_NSections {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepFill_ShapeLaw *
**************************/
class BRepFill_ShapeLaw : public BRepFill_SectionLaw {
	public:
		/****** BRepFill_ShapeLaw::BRepFill_ShapeLaw ******/
		/****** md5 signature: 804d5b8a2aaf6f667f9324c438ea4a53 ******/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Build: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Construct an constant Law.
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Vertex & V, const Standard_Boolean Build = Standard_True);

		/****** BRepFill_ShapeLaw::BRepFill_ShapeLaw ******/
		/****** md5 signature: ee190a317b630a8646b4a6469c6f1c8d ******/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
Build: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Construct an constant Law.
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Wire & W, const Standard_Boolean Build = Standard_True);

		/****** BRepFill_ShapeLaw::BRepFill_ShapeLaw ******/
		/****** md5 signature: fa6043e626b799fda28670fe3f6b4517 ******/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
L: Law_Function
Build: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Construct an evolutive Law.
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Wire & W, const opencascade::handle<Law_Function> & L, const Standard_Boolean Build = Standard_True);

		/****** BRepFill_ShapeLaw::ConcatenedLaw ******/
		/****** md5 signature: 4495106cbf0901c13e169216aea3ff82 ******/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_SectionLaw>

Description
-----------
Give the law build on a concatenated section.
") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****** BRepFill_ShapeLaw::Continuity ******/
		/****** md5 signature: a0e903623d8c6b4c441db63330dfde38 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
Index: int
TolAngular: float

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity(const Standard_Integer Index, const Standard_Real TolAngular);

		/****** BRepFill_ShapeLaw::D0 ******/
		/****** md5 signature: de496c8c897345c41ec4327b5afb7dea ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") D0;
		virtual void D0(const Standard_Real Param, TopoDS_Shape & S);

		/****** BRepFill_ShapeLaw::Edge ******/
		/****** md5 signature: 8a7ac08a45b8dcdac4d9e0339f1c1d47 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer Index);

		/****** BRepFill_ShapeLaw::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the Law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** BRepFill_ShapeLaw::IsVertex ******/
		/****** md5 signature: 9153c2b3b3fc32dd6aea02d7fc3fe588 ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the input shape is a vertex.
") IsVertex;
		virtual Standard_Boolean IsVertex();

		/****** BRepFill_ShapeLaw::Vertex ******/
		/****** md5 signature: 50d7f598881fad0d7b254edf83197d3e ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		virtual TopoDS_Vertex Vertex(const Standard_Integer Index, const Standard_Real Param);

		/****** BRepFill_ShapeLaw::VertexTol ******/
		/****** md5 signature: b5ecc9a4e833886cbbedfc54fe0fbfe1 ******/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: float

Return
-------
float

Description
-----------
No available documentation.
") VertexTol;
		virtual Standard_Real VertexTol(const Standard_Integer Index, const Standard_Real Param);

};


%make_alias(BRepFill_ShapeLaw)

%extend BRepFill_ShapeLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepFill_DraftLaw *
**************************/
class BRepFill_DraftLaw : public BRepFill_Edge3DLaw {
	public:
		/****** BRepFill_DraftLaw::BRepFill_DraftLaw ******/
		/****** md5 signature: 336aea22a96a446dbf1fdad6e645325b ******/
		%feature("compactdefaultargs") BRepFill_DraftLaw;
		%feature("autodoc", "
Parameters
----------
Path: TopoDS_Wire
Law: GeomFill_LocationDraft

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_DraftLaw;
		 BRepFill_DraftLaw(const TopoDS_Wire & Path, const opencascade::handle<GeomFill_LocationDraft> & Law);

		/****** BRepFill_DraftLaw::CleanLaw ******/
		/****** md5 signature: 2b27d5bd295509401a1b6283d637cfa3 ******/
		%feature("compactdefaultargs") CleanLaw;
		%feature("autodoc", "
Parameters
----------
TolAngular: float

Return
-------
None

Description
-----------
To clean the little discontinuities.
") CleanLaw;
		void CleanLaw(const Standard_Real TolAngular);

};


%make_alias(BRepFill_DraftLaw)

%extend BRepFill_DraftLaw {
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
def brepfill_Axe(*args):
	return brepfill.Axe(*args)

@deprecated
def brepfill_ComputeACR(*args):
	return brepfill.ComputeACR(*args)

@deprecated
def brepfill_Face(*args):
	return brepfill.Face(*args)

@deprecated
def brepfill_InsertACR(*args):
	return brepfill.InsertACR(*args)

@deprecated
def brepfill_Shell(*args):
	return brepfill.Shell(*args)

}
