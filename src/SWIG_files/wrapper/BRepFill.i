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
%ignore NCollection_DataMap<opencascade::handle<MAT_Node>,TopTools_DataMapOfShapeShape>::Items;
%ignore NCollection_DataMap<opencascade::handle<MAT_Node>,TopTools_DataMapOfShapeShape>::KeyValues;
%template(BRepFill_DataMapOfNodeDataMapOfShapeShape) NCollection_DataMap<opencascade::handle<MAT_Node>,TopTools_DataMapOfShapeShape>;
%ignore NCollection_DataMap<opencascade::handle<MAT_Node>,TopoDS_Shape>::Items;
%ignore NCollection_DataMap<opencascade::handle<MAT_Node>,TopoDS_Shape>::KeyValues;
%template(BRepFill_DataMapOfNodeShape) NCollection_DataMap<opencascade::handle<MAT_Node>,TopoDS_Shape>;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape>::KeyValues;
%template(BRepFill_DataMapOfOrientedShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape>;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_DataMapOfShapeListOfShape,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopTools_DataMapOfShapeListOfShape,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_DataMapOfShapeListOfShape,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<TopTools_HArray2OfShape>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<TopTools_HArray2OfShape>,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepFill_DataMapOfShapeHArray2OfShape) NCollection_DataMap<TopoDS_Shape,opencascade::handle<TopTools_HArray2OfShape>,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepFill_DataMapOfShapeSequenceOfPnt) NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TColStd_SequenceOfReal,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TColStd_SequenceOfReal,TopTools_ShapeMapHasher>::KeyValues;
%template(BRepFill_DataMapOfShapeSequenceOfReal) NCollection_DataMap<TopoDS_Shape,TColStd_SequenceOfReal,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape>::Contained;
%template(BRepFill_IndexedDataMapOfOrientedShapeListOfShape) NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape>;
%template(BRepFill_ListIteratorOfListOfOffsetWire) NCollection_TListIterator<BRepFill_OffsetWire>;
%template(BRepFill_ListOfOffsetWire) NCollection_List<BRepFill_OffsetWire>;

%extend NCollection_List<BRepFill_OffsetWire> {
    %pythoncode {
    def __len__(self):
        return self.Size()
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
		/****** md5 signature: 2e2ea45fc2aef8e51f3eec311eb211ea ******/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Shape
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Tol: double

Return
-------
ProfOnSpine: bool

Description
-----------
Computes <AxeProf> as Follow. <Location> is the Position of the nearest vertex V of <Profile> to <Spine>.<XDirection> is confused with the tangent to <Spine> at the projected point of V on the Spine. <Direction> is normal to <Spine>. <Spine> is a plane wire or a plane face.
") Axe;
		static void Axe(const TopoDS_Shape & Spine, const TopoDS_Wire & Profile, gp_Ax3 & AxeProf, Standard_Boolean &OutValue, const double Tol);

		/****** BRepFill::ComputeACR ******/
		/****** md5 signature: fab1bf8b602d534d2972b81fa34e7c38 ******/
		%feature("compactdefaultargs") ComputeACR;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
ACR: NCollection_Array1<double>

Return
-------
None

Description
-----------
Compute ACR on a wire.
") ComputeACR;
		static void ComputeACR(const TopoDS_Wire & wire, NCollection_Array1<double> & ACR);

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
		/****** md5 signature: 8975094450b52e17c6423d8fad88d8ad ******/
		%feature("compactdefaultargs") InsertACR;
		%feature("autodoc", "
Parameters
----------
wire: TopoDS_Wire
ACRcuts: NCollection_Array1<double>
prec: double

Return
-------
TopoDS_Wire

Description
-----------
Insert ACR on a wire.
") InsertACR;
		static TopoDS_Wire InsertACR(const TopoDS_Wire & wire, const NCollection_Array1<double> & ACRcuts, const double prec);

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
		/****** md5 signature: 98408c4191435b7f65b0d9180c0edd5b ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "
Parameters
----------
theErrorCode: unsigned int * (optional, default to nullptr)

Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone(unsigned int * theErrorCode = nullptr);

		/****** BRepFill_AdvancedEvolved::Perform ******/
		/****** md5 signature: a2139919ba6d8eba1461fae00087f23e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSpine: TopoDS_Wire
theProfile: TopoDS_Wire
theTolerance: double
theSolidReq: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Wire & theSpine, const TopoDS_Wire & theProfile, const double theTolerance, const bool theSolidReq = true);

		/****** BRepFill_AdvancedEvolved::SetParallelMode ******/
		/****** md5 signature: dde960e539eecf4a5b12f4348a3f9ada ******/
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
		void SetParallelMode(const bool theVal);

		/****** BRepFill_AdvancedEvolved::SetTemporaryDirectory ******/
		/****** md5 signature: ee930e20b3d6870bc0855b6b1d31f7a0 ******/
		%feature("compactdefaultargs") SetTemporaryDirectory;
		%feature("autodoc", "
Parameters
----------
thePath: char *

Return
-------
None

Description
-----------
Sets directory where the debug shapes will be saved.
") SetTemporaryDirectory;
		void SetTemporaryDirectory(const char * const thePath);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: f934f00cf468b31635a32427c0430d44 ******/
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "
Parameters
----------
Sections: NCollection_Sequence<TopoDS_Shape>

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires(const NCollection_Sequence<TopoDS_Shape> & Sections);

		/****** BRepFill_CompatibleWires::Generated ******/
		/****** md5 signature: 87cd0ad47838d627e7014b5b7da796f5 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") Generated;
		const NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> Generated();

		/****** BRepFill_CompatibleWires::GeneratedShapes ******/
		/****** md5 signature: f9873580f955f2d90bec3ded127c8041 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SubSection: TopoDS_Edge

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the shapes created from a subshape <SubSection> of a section.
") GeneratedShapes;
		const NCollection_List<TopoDS_Shape> GeneratedShapes(const TopoDS_Edge & SubSection);

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
		/****** md5 signature: b7bc6828c815c4764efbde9a0c490eff ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sections: NCollection_Sequence<TopoDS_Shape>

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const NCollection_Sequence<TopoDS_Shape> & Sections);

		/****** BRepFill_CompatibleWires::IsDegeneratedFirstSection ******/
		/****** md5 signature: 799951ede21bdb58355bbd8da2c2272c ******/
		%feature("compactdefaultargs") IsDegeneratedFirstSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegeneratedFirstSection;
		bool IsDegeneratedFirstSection();

		/****** BRepFill_CompatibleWires::IsDegeneratedLastSection ******/
		/****** md5 signature: 1cb494d1a57719aa614dc55932554f30 ******/
		%feature("compactdefaultargs") IsDegeneratedLastSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegeneratedLastSection;
		bool IsDegeneratedLastSection();

		/****** BRepFill_CompatibleWires::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepFill_CompatibleWires::Perform ******/
		/****** md5 signature: 890b02da115906a09738dd9711811e52 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
WithRotation: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs CompatibleWires According to the orientation and the origin of each other.
") Perform;
		void Perform(const bool WithRotation = true);

		/****** BRepFill_CompatibleWires::SetPercent ******/
		/****** md5 signature: ed7e33927b8411a28c699ef7331ed48e ******/
		%feature("compactdefaultargs") SetPercent;
		%feature("autodoc", "
Parameters
----------
percent: double (optional, default to 0.01)

Return
-------
None

Description
-----------
No available documentation.
") SetPercent;
		void SetPercent(const double percent = 0.01);

		/****** BRepFill_CompatibleWires::Shape ******/
		/****** md5 signature: a3171706debefe3cfa76eb1712baddb4 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
NCollection_Sequence<TopoDS_Shape>

Description
-----------
returns the generated sequence.
") Shape;
		const NCollection_Sequence<TopoDS_Shape> Shape();

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
		/****** md5 signature: 2c56a912c4f6ef424eea0a75105a27a8 ******/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "
Parameters
----------
Line: BRepFill_MultiLine
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-5)
Tolerance2d: double (optional, default to 1.0e-5)
cutting: bool (optional, default to false)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine(const BRepFill_MultiLine & Line, const int degreemin = 3, const int degreemax = 8, const double Tolerance3d = 1.0e-5, const double Tolerance2d = 1.0e-5, const bool cutting = false, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** BRepFill_ComputeCLine::BRepFill_ComputeCLine ******/
		/****** md5 signature: 42c87e8ba16521c362698527ffbdf96f ******/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "
Parameters
----------
degreemin: int (optional, default to 3)
degreemax: int (optional, default to 8)
Tolerance3d: double (optional, default to 1.0e-05)
Tolerance2d: double (optional, default to 1.0e-05)
cutting: bool (optional, default to false)
FirstC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)
LastC: AppParCurves_Constraint (optional, default to AppParCurves_TangencyPoint)

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine(const int degreemin = 3, const int degreemax = 8, const double Tolerance3d = 1.0e-05, const double Tolerance2d = 1.0e-05, const bool cutting = false, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****** BRepFill_ComputeCLine::Error ******/
		/****** md5 signature: 16248cd92a25264d4b1676fa28492d15 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
tol3d: double
tol2d: double

Description
-----------
returns the tolerances 2d and 3d of the <Index> MultiCurve.
") Error;
		void Error(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFill_ComputeCLine::IsAllApproximated ******/
		/****** md5 signature: 097042183394c222ee066430113409dd ******/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
") IsAllApproximated;
		bool IsAllApproximated();

		/****** BRepFill_ComputeCLine::IsToleranceReached ******/
		/****** md5 signature: e68ff79913f1e1cb017e363f76fc9fc2 ******/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns False if the status NoPointsAdded has been sent.
") IsToleranceReached;
		bool IsToleranceReached();

		/****** BRepFill_ComputeCLine::NbMultiCurves ******/
		/****** md5 signature: eed274d77446bf2416a954e7f34c2bf0 ******/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of MultiCurve doing the approximation of the MultiLine.
") NbMultiCurves;
		int NbMultiCurves();

		/****** BRepFill_ComputeCLine::Parameters ******/
		/****** md5 signature: 43d943f0a53a0d94942b221259fd1edc ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
firstp: double
lastp: double

Description
-----------
No available documentation.
") Parameters;
		void Parameters(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 83fc53ce842bc5ef5957903d76f43a4a ******/
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
		void SetDegrees(const int degreemin, const int degreemax);

		/****** BRepFill_ComputeCLine::SetHangChecking ******/
		/****** md5 signature: f50d24a25d7b523abdff4b1afcfa90d4 ******/
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
		void SetHangChecking(const bool theHangChecking);

		/****** BRepFill_ComputeCLine::SetInvOrder ******/
		/****** md5 signature: bf1dbc61ceb30498f4595cd16c45fbc7 ******/
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
		void SetInvOrder(const bool theInvOrder);

		/****** BRepFill_ComputeCLine::SetMaxSegments ******/
		/****** md5 signature: 5ffbce2bcee67b68e45c80186cc138d9 ******/
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
		void SetMaxSegments(const int theMaxSegments);

		/****** BRepFill_ComputeCLine::SetTolerances ******/
		/****** md5 signature: 26249a86974aa99769435e28e43c6d33 ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
Tolerance3d: double
Tolerance2d: double

Return
-------
None

Description
-----------
Changes the tolerances of the approximation.
") SetTolerances;
		void SetTolerances(const double Tolerance3d, const double Tolerance2d);

		/****** BRepFill_ComputeCLine::Value ******/
		/****** md5 signature: fd525ff9710e442c8013f9a14a9e5944 ******/
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
		AppParCurves_MultiCurve Value(const int Index = 1);

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
		/****** md5 signature: b2132165161ac0617c61639b69ad78d0 ******/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "
Parameters
----------
Boundary: Adaptor3d_CurveOnSurface
Order: int
NPt: int (optional, default to 10)
TolDist: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion.
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint(const opencascade::handle<Adaptor3d_CurveOnSurface> & Boundary, const int Order, const int NPt = 10, const double TolDist = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1);

		/****** BRepFill_CurveConstraint::BRepFill_CurveConstraint ******/
		/****** md5 signature: 33e794367be9f34b6ad0e82fb746d7b5 ******/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "
Parameters
----------
Boundary: Adaptor3d_Curve
Tang: int
NPt: int (optional, default to 10)
TolDist: double (optional, default to 0.0001)

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint(const opencascade::handle<Adaptor3d_Curve> & Boundary, const int Tang, const int NPt = 10, const double TolDist = 0.0001);

};


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
		/****** md5 signature: 5bae1a381bb57089a2fc5705da7589e1 ******/
		%feature("compactdefaultargs") BRepFill_Draft;
		%feature("autodoc", "
Parameters
----------
Shape: TopoDS_Shape
Dir: gp_Dir
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Draft;
		 BRepFill_Draft(const TopoDS_Shape & Shape, const gp_Dir & Dir, const double Angle);

		/****** BRepFill_Draft::Generated ******/
		/****** md5 signature: 27cd51cd947cf33bd793ebb871476400 ******/
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
Returns the list of shapes generated from the shape <S>.
") Generated;
		const NCollection_List<TopoDS_Shape> Generated(const TopoDS_Shape & S);

		/****** BRepFill_Draft::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepFill_Draft::Perform ******/
		/****** md5 signature: 9d9ab6613b03c320d8f9e5fc88ef5b38 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
LengthMax: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double LengthMax);

		/****** BRepFill_Draft::Perform ******/
		/****** md5 signature: f8aca8670b538031116d9f133df0d09e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surface: Geom_Surface
KeepInsideSurface: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & Surface, const bool KeepInsideSurface = true);

		/****** BRepFill_Draft::Perform ******/
		/****** md5 signature: 14b760b2f4918915dec319a41029e675 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
StopShape: TopoDS_Shape
KeepOutSide: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & StopShape, const bool KeepOutSide = true);

		/****** BRepFill_Draft::SetDraft ******/
		/****** md5 signature: 868e0921628ae7ed5d98d4bc0b4c43a4 ******/
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "
Parameters
----------
IsInternal: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") SetDraft;
		void SetDraft(const bool IsInternal = false);

		/****** BRepFill_Draft::SetOptions ******/
		/****** md5 signature: 0ff2abc1c986c80b7ede1f251ca5b94f ******/
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "
Parameters
----------
Style: BRepFill_TransitionStyle (optional, default to BRepFill_Right)
AngleMin: double (optional, default to 0.01)
AngleMax: double (optional, default to 3.0)

Return
-------
None

Description
-----------
No available documentation.
") SetOptions;
		void SetOptions(const BRepFill_TransitionStyle Style = BRepFill_Right, const double AngleMin = 0.01, const double AngleMax = 3.0);

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
		/****** md5 signature: 67fa6575c4ba313115a8d75eceb55c72 ******/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an evolved shape by sweeping the <Profile> along the <Spine>. <AxeProf> is used to set the position of <Profile> along <Spine> as follows: <AxeProf> slides on the profile with direction colinear to the normal to <Spine>, and its <XDirection> mixed with the tangent to <Spine>.
") BRepFill_Evolved;
		 BRepFill_Evolved(const TopoDS_Wire & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool Solid = false);

		/****** BRepFill_Evolved::BRepFill_Evolved ******/
		/****** md5 signature: cb1980d2bc07b38717b3b223b58b9c87 ******/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an evolved shape by sweeping the <Profile> along the <Spine>.
") BRepFill_Evolved;
		 BRepFill_Evolved(const TopoDS_Face & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool Solid = false);

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
		/****** md5 signature: 7e5aec1b811d413bca252b1fc93ab87c ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SpineShape: TopoDS_Shape
ProfShape: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the shapes created from a subshape <SpineShape> of the spine and a subshape <ProfShape> on the profile.
") GeneratedShapes;
		const NCollection_List<TopoDS_Shape> GeneratedShapes(const TopoDS_Shape & SpineShape, const TopoDS_Shape & ProfShape);

		/****** BRepFill_Evolved::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 7661464694eb58147923bba7f82e55a0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to false)

Return
-------
None

Description
-----------
Performs an evolved shape by sweeping the <Profile> along the <Spine>.
") Perform;
		void Perform(const TopoDS_Wire & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool Solid = false);

		/****** BRepFill_Evolved::Perform ******/
		/****** md5 signature: 2e7ab0f8f238ece7d72e7cdb07ac6cc5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Solid: bool (optional, default to false)

Return
-------
None

Description
-----------
Performs an evolved shape by sweeping the <Profile> along the <Spine>.
") Perform;
		void Perform(const TopoDS_Face & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool Solid = false);

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
		/****** md5 signature: bd1c6fcbb451b219aa2758d75844c1c2 ******/
		%feature("compactdefaultargs") BRepFill_Filling;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 15)
NbIter: int (optional, default to 2)
Anisotropie: bool (optional, default to false)
Tol2d: double (optional, default to 0.00001)
Tol3d: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)
MaxDeg: int (optional, default to 8)
MaxSegments: int (optional, default to 9)

Return
-------
None

Description
-----------
Constructor.
") BRepFill_Filling;
		 BRepFill_Filling(const int Degree = 3, const int NbPtsOnCur = 15, const int NbIter = 2, const bool Anisotropie = false, const double Tol2d = 0.00001, const double Tol3d = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1, const int MaxDeg = 8, const int MaxSegments = 9);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: 660ab5240646d3ba9f3c6f162acafe34 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge
Order: GeomAbs_Shape
IsBound: bool (optional, default to true)

Return
-------
int

Description
-----------
Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0: the surface has to pass by 3D representation of the edge GeomAbs_G1: the surface has to pass by 3D representation of the edge and to respect tangency with the first face of the edge GeomAbs_G2: the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the first face of the edge.
") Add;
		int Add(const TopoDS_Edge & anEdge, const GeomAbs_Shape Order, const bool IsBound = true);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: b74a9d2d33b2d33f3483496bcbcfee88 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
anEdge: TopoDS_Edge
Support: TopoDS_Face
Order: GeomAbs_Shape
IsBound: bool (optional, default to true)

Return
-------
int

Description
-----------
Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0: the surface has to pass by 3D representation of the edge GeomAbs_G1: the surface has to pass by 3D representation of the edge and to respect tangency with the given face GeomAbs_G2: the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the given face.
") Add;
		int Add(const TopoDS_Edge & anEdge, const TopoDS_Face & Support, const GeomAbs_Shape Order, const bool IsBound = true);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: a1ca9d60ec095747924109cd4c012c9d ******/
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
		int Add(const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: 542f2f6e12b281d8a04b02d4c431425e ******/
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
		int Add(const gp_Pnt & Point);

		/****** BRepFill_Filling::Add ******/
		/****** md5 signature: 32062246047b72c9d9ad13c015c24b6a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
Support: TopoDS_Face
Order: GeomAbs_Shape

Return
-------
int

Description
-----------
Adds a punctual constraint.
") Add;
		int Add(const double U, const double V, const TopoDS_Face & Support, const GeomAbs_Shape Order);

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
		/****** md5 signature: 26eb7ac7e7e086c9d50aef459fbfc494 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G0Error;
		double G0Error();

		/****** BRepFill_Filling::G0Error ******/
		/****** md5 signature: ea82fba658102289e47be6340460e251 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") G0Error;
		double G0Error(const int Index);

		/****** BRepFill_Filling::G1Error ******/
		/****** md5 signature: 08f961c041db3fae562606499fdd288a ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G1Error;
		double G1Error();

		/****** BRepFill_Filling::G1Error ******/
		/****** md5 signature: 103532f19d83aceac2beb425fa280c25 ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") G1Error;
		double G1Error(const int Index);

		/****** BRepFill_Filling::G2Error ******/
		/****** md5 signature: eb154307507c3c72e5cef135c1e59efe ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") G2Error;
		double G2Error();

		/****** BRepFill_Filling::G2Error ******/
		/****** md5 signature: 3059ba7eb7ff114be17a14733c4b41dc ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") G2Error;
		double G2Error(const int Index);

		/****** BRepFill_Filling::Generated ******/
		/****** md5 signature: 27cd51cd947cf33bd793ebb871476400 ******/
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
Returns the list of shapes generated from the shape <S>.
") Generated;
		const NCollection_List<TopoDS_Shape> Generated(const TopoDS_Shape & S);

		/****** BRepFill_Filling::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: e3e1471a8eee64ca6afb7e25537ada8a ******/
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
		void SetApproxParam(const int MaxDeg = 8, const int MaxSegments = 9);

		/****** BRepFill_Filling::SetConstrParam ******/
		/****** md5 signature: 7f84103dbc0392ac3d2244ef330c3133 ******/
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "
Parameters
----------
Tol2d: double (optional, default to 0.00001)
Tol3d: double (optional, default to 0.0001)
TolAng: double (optional, default to 0.01)
TolCurv: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Sets the values of Tolerances used to control the constraint. Tol2d: Tol3d: it is the maximum distance allowed between the support surface and the constraints TolAng: it is the maximum angle allowed between the normal of the surface and the constraints TolCurv: it is the maximum difference of curvature allowed between the surface and the constraint.
") SetConstrParam;
		void SetConstrParam(const double Tol2d = 0.00001, const double Tol3d = 0.0001, const double TolAng = 0.01, const double TolCurv = 0.1);

		/****** BRepFill_Filling::SetResolParam ******/
		/****** md5 signature: 5cdda1fab4b90a67ebdfb08d31967631 ******/
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 15)
NbIter: int (optional, default to 2)
Anisotropie: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets the parameters used for resolution. The default values of these parameters have been chosen for a good ratio quality/performance. Degree: it is the order of energy criterion to minimize for computing the deformation of the surface. The default value is 3 The recommended value is i+2 where i is the maximum order of the constraints. NbPtsOnCur: it is the average number of points for discretisation of the edges. NbIter: it is the maximum number of iterations of the process. For each iteration the number of discretisation points is increased. Anisotropie:.
") SetResolParam;
		void SetResolParam(const int Degree = 3, const int NbPtsOnCur = 15, const int NbIter = 2, const bool Anisotropie = false);

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
		/****** md5 signature: 87cd0ad47838d627e7014b5b7da796f5 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Description
-----------
Returns all the shapes created.
") Generated;
		const NCollection_DataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> Generated();

		/****** BRepFill_Generator::GeneratedShapes ******/
		/****** md5 signature: 3f65f2b0742c196a65daa7ca44522117 ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SSection: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the shapes created from a subshape <SSection> of a section.
") GeneratedShapes;
		const NCollection_List<TopoDS_Shape> GeneratedShapes(const TopoDS_Shape & SSection);

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
		/****** md5 signature: ad3b03c729fefbfdc12b6e6c3ea060ab ******/
		%feature("compactdefaultargs") IsMutableInput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the current mutable input state.
") IsMutableInput;
		bool IsMutableInput();

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
		/****** md5 signature: f6ab0bc4a8d438ee3b64d47724347c79 ******/
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
		void SetMutableInput(const bool theIsMutableInput);

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
		/****** md5 signature: 5c76cb4888b4b1a112f1ce8458c8ebd3 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
double

Description
-----------
Return the curvilinear abscissa corresponding to a point of the path, defined by <Index> of Edge and a parameter on the edge.
") Abscissa;
		double Abscissa(const int Index, const double Param);

		/****** BRepFill_LocationLaw::CurvilinearBounds ******/
		/****** md5 signature: 4c5ec6298e1d79e827c2a26bdb03716d ******/
		%feature("compactdefaultargs") CurvilinearBounds;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
First: double
Last: double

Description
-----------
Return the Curvilinear Bounds of the <Index> Law.
") CurvilinearBounds;
		void CurvilinearBounds(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFill_LocationLaw::D0 ******/
		/****** md5 signature: 06f79ee90b55e2ef82845844e4a89201 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Abscissa: double
Section: TopoDS_Shape

Return
-------
None

Description
-----------
Apply the Law to a shape, for a given Curvilinear abscissa.
") D0;
		void D0(const double Abscissa, TopoDS_Shape & Section);

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
		/****** md5 signature: 0537f1530f8fecb22bbe3382906c69f1 ******/
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
		const TopoDS_Edge Edge(const int Index);

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
		/****** md5 signature: e06c3d559d6b5d11ec07e1891d664365 ******/
		%feature("compactdefaultargs") Holes;
		%feature("autodoc", "
Parameters
----------
Interval: NCollection_Array1<int>

Return
-------
None

Description
-----------
No available documentation.
") Holes;
		void Holes(NCollection_Array1<int> & Interval);

		/****** BRepFill_LocationLaw::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** BRepFill_LocationLaw::IsG1 ******/
		/****** md5 signature: ed74325ff9e4b14584eb5ad576f3c1fa ******/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "
Parameters
----------
Index: int
SpatialTolerance: double (optional, default to 1.0e-7)
AngularTolerance: double (optional, default to 1.0e-4)

Return
-------
int

Description
-----------
Compute the Law's continuity between 2 edges of the path The result can be: -1: Case Not connex 0: It is connex (G0) 1: It is tangent (G1).
") IsG1;
		int IsG1(const int Index, const double SpatialTolerance = 1.0e-7, const double AngularTolerance = 1.0e-4);

		/****** BRepFill_LocationLaw::Law ******/
		/****** md5 signature: 3314af028deb97334b5438c6d486b25e ******/
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
		const opencascade::handle<GeomFill_LocationLaw> & Law(const int Index);

		/****** BRepFill_LocationLaw::NbHoles ******/
		/****** md5 signature: b51630bada044a323bddf653c0c0c6b9 ******/
		%feature("compactdefaultargs") NbHoles;
		%feature("autodoc", "
Parameters
----------
Tol: double (optional, default to 1.0e-7)

Return
-------
int

Description
-----------
No available documentation.
") NbHoles;
		int NbHoles(const double Tol = 1.0e-7);

		/****** BRepFill_LocationLaw::NbLaw ******/
		/****** md5 signature: d2eea3fd35fbdc768dc6d6017761bbd6 ******/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of elementary Law.
") NbLaw;
		int NbLaw();

		/****** BRepFill_LocationLaw::Parameter ******/
		/****** md5 signature: e2a8b6f0a90dcbdb26476aeaaea78678 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Abscissa: double

Return
-------
Index: int
Param: double

Description
-----------
Find the index Law and the parameter, for a given Curvilinear abscissa.
") Parameter;
		void Parameter(const double Abscissa, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BRepFill_LocationLaw::PerformVertex ******/
		/****** md5 signature: a010331e39b536cae7736698fd7df081 ******/
		%feature("compactdefaultargs") PerformVertex;
		%feature("autodoc", "
Parameters
----------
Index: int
InputVertex: TopoDS_Vertex
TolMin: double
OutputVertex: TopoDS_Vertex
Location: int (optional, default to 0)

Return
-------
None

Description
-----------
Compute <OutputVertex> like a transformation of <InputVertex> the transformation is given by evaluation of the location law in the vertex of rank <Index>. <Location> is used to manage discontinuities: - -1: The law before the vertex is used. - 1: The law after the vertex is used. - 0: Average of the both laws is used.
") PerformVertex;
		void PerformVertex(const int Index, const TopoDS_Vertex & InputVertex, const double TolMin, TopoDS_Vertex & OutputVertex, const int Location = 0);

		/****** BRepFill_LocationLaw::TransformInCompatibleLaw ******/
		/****** md5 signature: 441484a3f99df8de85f796d525627885 ******/
		%feature("compactdefaultargs") TransformInCompatibleLaw;
		%feature("autodoc", "
Parameters
----------
AngularTolerance: double

Return
-------
None

Description
-----------
Apply a linear transformation on each law, to reduce the dicontinuities of law at one rotation.
") TransformInCompatibleLaw;
		virtual void TransformInCompatibleLaw(const double AngularTolerance);

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
		/****** md5 signature: fc39cf01c35d745f016d661469e374e5 ******/
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
		TopoDS_Vertex Vertex(const int Index);

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
		/****** md5 signature: 1218f8fcaa6029bb478f7e1c49adf70f ******/
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
		 BRepFill_MultiLine(const TopoDS_Face & Face1, const TopoDS_Face & Face2, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const bool Inv1, const bool Inv2, const opencascade::handle<Geom2d_Curve> & Bissec);

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
		/****** md5 signature: 2d1a18eeb6b49bbe710e082a43168b80 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: double
theVec2d: NCollection_Array1<gp_Vec2d>
theVec: NCollection_Array1<gp_Vec>

Return
-------
bool

Description
-----------
Returns the derivative at parameter <theU>.
") D1;
		bool D1(const double theU, NCollection_Array1<gp_Vec2d> & theVec2d, NCollection_Array1<gp_Vec> & theVec);

		/****** BRepFill_MultiLine::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the first parameter of the Bissectrice.
") FirstParameter;
		double FirstParameter();

		/****** BRepFill_MultiLine::IsParticularCase ******/
		/****** md5 signature: 46cf4f60d50fa5f4309e1505869c4d88 ******/
		%feature("compactdefaultargs") IsParticularCase;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Search if the Projection of the Bissectrice on the faces needs an approximation or not. Returns true if the approximation is not needed.
") IsParticularCase;
		bool IsParticularCase();

		/****** BRepFill_MultiLine::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the last parameter of the Bissectrice.
") LastParameter;
		double LastParameter();

		/****** BRepFill_MultiLine::Value ******/
		/****** md5 signature: d4f1705cdf9f20be61c161956c95c032 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Returns the current point on the 3d curve.
") Value;
		gp_Pnt Value(const double U);

		/****** BRepFill_MultiLine::Value ******/
		/****** md5 signature: af8a5f24939698665b518b0ceadf3fc5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theU: double
thePnt2d: NCollection_Array1<gp_Pnt2d>
thePnt: NCollection_Array1<gp_Pnt>

Return
-------
bool

Description
-----------
Returns the point at parameter <theU>.
") Value;
		bool Value(const double theU, NCollection_Array1<gp_Pnt2d> & thePnt2d, NCollection_Array1<gp_Pnt> & thePnt);

		/****** BRepFill_MultiLine::Value3dOnF1OnF2 ******/
		/****** md5 signature: f05e20fec1d2c7fbc525191b8e8800a3 ******/
		%feature("compactdefaultargs") Value3dOnF1OnF2;
		%feature("autodoc", "
Parameters
----------
U: double
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
		void Value3dOnF1OnF2(const double U, gp_Pnt & P3d, gp_Pnt2d & PF1, gp_Pnt2d & PF2);

		/****** BRepFill_MultiLine::ValueOnF1 ******/
		/****** md5 signature: 8dd1a878f7155142a8ef2d7ccb481ecd ******/
		%feature("compactdefaultargs") ValueOnF1;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
returns the current point on the PCurve of the first face.
") ValueOnF1;
		gp_Pnt2d ValueOnF1(const double U);

		/****** BRepFill_MultiLine::ValueOnF2 ******/
		/****** md5 signature: e6b55c01d05c5ac9bb21eb0436210dca ******/
		%feature("compactdefaultargs") ValueOnF2;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
returns the current point on the PCurve of the first face.
") ValueOnF2;
		gp_Pnt2d ValueOnF2(const double U);

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
		/****** md5 signature: 0f54f040d3b73f98a7830a7949fa2461 ******/
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
		bool HasAncestor(const TopoDS_Edge & S1);

		/****** BRepFill_OffsetAncestors::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: 673206816c76578ebf3af3bda2409842 ******/
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool IsOpenResult = false);

		/****** BRepFill_OffsetWire::GeneratedShapes ******/
		/****** md5 signature: 4c2f38470b65bf769881e771f87afcdc ******/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "
Parameters
----------
SpineShape: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the shapes created from a subshape <SpineShape> of the spine. Returns the last computed Offset.
") GeneratedShapes;
		const NCollection_List<TopoDS_Shape> GeneratedShapes(const TopoDS_Shape & SpineShape);

		/****** BRepFill_OffsetWire::Init ******/
		/****** md5 signature: 20cdbc88c6b16cae965fca7361033325 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
IsOpenResult: bool (optional, default to false)

Return
-------
None

Description
-----------
Initialize the evaluation of Offsetting.
") Init;
		void Init(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const bool IsOpenResult = false);

		/****** BRepFill_OffsetWire::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

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
		/****** md5 signature: e364fb2052ec52ed44b84fa9ec16dc39 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Offset: double
Alt: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Performs an OffsetWire at an altitude <Alt> from the face (According to the orientation of the face).
") Perform;
		void Perform(const double Offset, const double Alt = 0.0);

		/****** BRepFill_OffsetWire::PerformWithBiLo ******/
		/****** md5 signature: 650c5f30a1cb60d8566ea9960d0f62fe ******/
		%feature("compactdefaultargs") PerformWithBiLo;
		%feature("autodoc", "
Parameters
----------
WSP: TopoDS_Face
Offset: double
Locus: BRepMAT2d_BisectingLocus
Link: BRepMAT2d_LinkTopoBilo
Join: GeomAbs_JoinType (optional, default to GeomAbs_Arc)
Alt: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Performs an OffsetWire.
") PerformWithBiLo;
		void PerformWithBiLo(const TopoDS_Face & WSP, const double Offset, const BRepMAT2d_BisectingLocus & Locus, BRepMAT2d_LinkTopoBilo & Link, const GeomAbs_JoinType Join = GeomAbs_Arc, const double Alt = 0.0);

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
		/****** md5 signature: 8d72a0be5599d6ed2473bfea6ffb82b1 ******/
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
aMode: GeomFill_Trihedron (optional, default to GeomFill_IsCorrectedFrenet)
ForceApproxC1: bool (optional, default to false)
GeneratePartCase: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_Pipe;
		 BRepFill_Pipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const GeomFill_Trihedron aMode = GeomFill_IsCorrectedFrenet, const bool ForceApproxC1 = false, const bool GeneratePartCase = false);

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
		/****** md5 signature: 0ab673c2dfbd4ce8e0d165ef9c450b15 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ErrorOnSurface;
		double ErrorOnSurface();

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
		/****** md5 signature: 5b5aeb91d9c57cb4e2ed7b6f0575e1a9 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		void Generated(const TopoDS_Shape & S, NCollection_List<TopoDS_Shape> & L);

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
		/****** md5 signature: 0d06ea924421b613b35ff5f8083f1e55 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
GeneratePartCase: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const bool GeneratePartCase = false);

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
		/****** md5 signature: ebeaf5a784d72ee73388729f34113ba3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
WithContact: bool (optional, default to false)
WithCorrection: bool (optional, default to false)

Return
-------
None

Description
-----------
Set an section. The correspondence with the spine, will be automatically performed.
") Add;
		void Add(const TopoDS_Shape & Profile, const bool WithContact = false, const bool WithCorrection = false);

		/****** BRepFill_PipeShell::Add ******/
		/****** md5 signature: 3b3780e526244ae49e78ea55be54fdb5 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
Location: TopoDS_Vertex
WithContact: bool (optional, default to false)
WithCorrection: bool (optional, default to false)

Return
-------
None

Description
-----------
Set an section. The correspondence with the spine, is given by Location.
") Add;
		void Add(const TopoDS_Shape & Profile, const TopoDS_Vertex & Location, const bool WithContact = false, const bool WithCorrection = false);

		/****** BRepFill_PipeShell::Build ******/
		/****** md5 signature: 9f4e76d7f8a9780afca64e9a625afd6e ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Builds the resulting shape (redefined from MakeShape).
") Build;
		bool Build();

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
		/****** md5 signature: 0ab673c2dfbd4ce8e0d165ef9c450b15 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ErrorOnSurface;
		double ErrorOnSurface();

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
		/****** md5 signature: 5b5aeb91d9c57cb4e2ed7b6f0575e1a9 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
L: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Returns the list of shapes generated from the shape <S>.
") Generated;
		void Generated(const TopoDS_Shape & S, NCollection_List<TopoDS_Shape> & L);

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

		/****** BRepFill_PipeShell::IsBuildHistory ******/
		/****** md5 signature: e037101729cd4b8425182c01491bd79a ******/
		%feature("compactdefaultargs") IsBuildHistory;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the build history flag. If True, the pipe shell stores the history of the sections and the spine.
") IsBuildHistory;
		bool IsBuildHistory();

		/****** BRepFill_PipeShell::IsReady ******/
		/****** md5 signature: c55402f1e031fb2faa07c9375fee061b ******/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if <self> is ready to build the shape return False if <self> do not have section definition.
") IsReady;
		bool IsReady();

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
		/****** md5 signature: f542d79ff68cacfdbd4ad6dd6a6e1a75 ******/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Transform the sweeping Shell in Solid. If the section are not closed returns False.
") MakeSolid;
		bool MakeSolid();

		/****** BRepFill_PipeShell::Profiles ******/
		/****** md5 signature: c0b5197044432a85b44466e78e6c652f ******/
		%feature("compactdefaultargs") Profiles;
		%feature("autodoc", "
Parameters
----------
theProfiles: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Returns the list of original profiles.
") Profiles;
		void Profiles(NCollection_List<TopoDS_Shape> & theProfiles);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: 36f3ff9d49162e12568c38812d1553eb ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Frenet: bool (optional, default to false)

Return
-------
None

Description
-----------
Set an Frenet or an CorrectedFrenet trihedron to perform the sweeping.
") Set;
		void Set(const bool Frenet = false);

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
		/****** md5 signature: f05f6dd9f465ac0227825f7f68d0df9f ******/
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
		bool Set(const TopoDS_Shape & SpineSupport);

		/****** BRepFill_PipeShell::Set ******/
		/****** md5 signature: 9ff805ca36e481c341a24995adc7469d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
AuxiliarySpine: TopoDS_Wire
CurvilinearEquivalence: bool (optional, default to true)
KeepContact: BRepFill_TypeOfContact (optional, default to BRepFill_NoContact)

Return
-------
None

Description
-----------
Set an auxiliary spine to define the Normal For each Point of the Spine P, an Point Q is evaluated on <AuxiliarySpine> If <CurvilinearEquivalence> Q split <AuxiliarySpine> with the same length ratio than P split <Spline>. Else the plan define by P and the tangent to the <Spine> intersect <AuxiliarySpine> in Q. If <KeepContact> equals BRepFill_NoContact: The Normal is defined by the vector PQ. If <KeepContact> equals BRepFill_Contact: The Normal is defined to achieve that the sweeped section is in contact to the auxiliarySpine. The width of section is constant all along the path. In other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. However, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path.
") Set;
		void Set(const TopoDS_Wire & AuxiliarySpine, const bool CurvilinearEquivalence = true, const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);

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
		/****** md5 signature: bb5360547d7f38f9dcab06086e0e5e80 ******/
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
		void SetForceApproxC1(const bool ForceApproxC1);

		/****** BRepFill_PipeShell::SetIsBuildHistory ******/
		/****** md5 signature: 59d4b20de394440b9048f3b688f47d3e ******/
		%feature("compactdefaultargs") SetIsBuildHistory;
		%feature("autodoc", "
Parameters
----------
theIsBuildHistory: bool

Return
-------
None

Description
-----------
Sets the build history flag. If set to True, the pipe shell will store the history of the sections and the spine, which can be used for further modifications or analysis.
") SetIsBuildHistory;
		void SetIsBuildHistory(const bool theIsBuildHistory);

		/****** BRepFill_PipeShell::SetLaw ******/
		/****** md5 signature: ad55e889e4489f1f2f917103e6de6866 ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
WithContact: bool (optional, default to false)
WithCorrection: bool (optional, default to false)

Return
-------
None

Description
-----------
Set an section and an homotetic law. The homotetie's centers is given by point on the <Spine>.
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const bool WithContact = false, const bool WithCorrection = false);

		/****** BRepFill_PipeShell::SetLaw ******/
		/****** md5 signature: a7ee853d6e539d1bfa17e54e99c6d516 ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
Location: TopoDS_Vertex
WithContact: bool (optional, default to false)
WithCorrection: bool (optional, default to false)

Return
-------
None

Description
-----------
Set an section and an homotetic law. The homotetie center is given by point on the <Spine>.
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const TopoDS_Vertex & Location, const bool WithContact = false, const bool WithCorrection = false);

		/****** BRepFill_PipeShell::SetMaxDegree ******/
		/****** md5 signature: 8ea78f4bab380860d163b0979dcc546c ******/
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
		void SetMaxDegree(const int NewMaxDegree);

		/****** BRepFill_PipeShell::SetMaxSegments ******/
		/****** md5 signature: 92fc41847e6e0e81f326122eba938b4b ******/
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
		void SetMaxSegments(const int NewMaxSegments);

		/****** BRepFill_PipeShell::SetTolerance ******/
		/****** md5 signature: b4b54ea5593d784ccb4f5a6aea41e9f3 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double (optional, default to 1.0e-4)
BoundTol: double (optional, default to 1.0e-4)
TolAngular: double (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const double Tol3d = 1.0e-4, const double BoundTol = 1.0e-4, const double TolAngular = 1.0e-2);

		/****** BRepFill_PipeShell::SetTransition ******/
		/****** md5 signature: b8823cb1bec211031d828ef935a0eedb ******/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "
Parameters
----------
Mode: BRepFill_TransitionStyle (optional, default to BRepFill_Modified)
Angmin: double (optional, default to 1.0e-2)
Angmax: double (optional, default to 6.0)

Return
-------
None

Description
-----------
Set the Transition Mode to manage discontinuities on the sweep.
") SetTransition;
		void SetTransition(const BRepFill_TransitionStyle Mode = BRepFill_Modified, const double Angmin = 1.0e-2, const double Angmax = 6.0);

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
		/****** md5 signature: 7ae4a8e33524877e37db950c1956bd35 ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "
Parameters
----------
NumberOfSection: int
Sections: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
Perform simulation of the sweep: Some Section are returned.
") Simulate;
		void Simulate(const int NumberOfSection, NCollection_List<TopoDS_Shape> & Sections);

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
		/****** md5 signature: 70a9e707f1cf6fdba4edb43812625485 ******/
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
		 BRepFill_Section(const TopoDS_Shape & Profile, const TopoDS_Vertex & V, const bool WithContact, const bool WithCorrection);

		/****** BRepFill_Section::IsLaw ******/
		/****** md5 signature: e5f5ed891be97d4ee0a55153ab53c7c6 ******/
		%feature("compactdefaultargs") IsLaw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsLaw;
		bool IsLaw();

		/****** BRepFill_Section::IsPunctual ******/
		/****** md5 signature: f1680edb3cf645eee3d29de42381cd3c ******/
		%feature("compactdefaultargs") IsPunctual;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPunctual;
		bool IsPunctual();

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
		/****** md5 signature: 8459c7e21abe999bd6679fab1739909d ******/
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
		void Set(const bool IsLaw);

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
		/****** md5 signature: 640771abbf69b6c878ef67f7af01996c ******/
		%feature("compactdefaultargs") WithContact;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithContact;
		bool WithContact();

		/****** BRepFill_Section::WithCorrection ******/
		/****** md5 signature: ff7068cbfea784fccf70916311dae370 ******/
		%feature("compactdefaultargs") WithCorrection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithCorrection;
		bool WithCorrection();

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
		/****** md5 signature: a00aa8fb9e51ca35ef07478f46fee2c7 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
Index: int
TolAngular: double

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity(const int Index, const double TolAngular);

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
		/****** md5 signature: fc34b5c1dd05a307f3477dad41731af9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") D0;
		virtual void D0(const double U, TopoDS_Shape & S);

		/****** BRepFill_SectionLaw::IndexOfEdge ******/
		/****** md5 signature: f5a44b4fa77f088d4557e4d8531fb8b8 ******/
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
		int IndexOfEdge(const TopoDS_Shape & anEdge);

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
		/****** md5 signature: 6bce7d72d2956b5446da944468bead27 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsConstant;
		virtual bool IsConstant();

		/****** BRepFill_SectionLaw::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepFill_SectionLaw::IsUClosed ******/
		/****** md5 signature: 8476da1145d5b82a4387ce07d552956f ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		bool IsUClosed();

		/****** BRepFill_SectionLaw::IsVClosed ******/
		/****** md5 signature: ed8014a9b216f1136f53d34a83e896af ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		bool IsVClosed();

		/****** BRepFill_SectionLaw::IsVertex ******/
		/****** md5 signature: 0b82cedb793b09fd5c9e64dc686532de ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the input shape is a vertex.
") IsVertex;
		virtual bool IsVertex();

		/****** BRepFill_SectionLaw::Law ******/
		/****** md5 signature: b276775bd7deb69ff28c664d0df1dfa5 ******/
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
		const opencascade::handle<GeomFill_SectionLaw> & Law(const int Index);

		/****** BRepFill_SectionLaw::NbLaw ******/
		/****** md5 signature: d2eea3fd35fbdc768dc6d6017761bbd6 ******/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLaw;
		int NbLaw();

		/****** BRepFill_SectionLaw::Vertex ******/
		/****** md5 signature: b46e628cb53d27f3da4dcadbf1e86d72 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		virtual TopoDS_Vertex Vertex(const int Index, const double Param);

		/****** BRepFill_SectionLaw::VertexTol ******/
		/****** md5 signature: 804e6051892c869c1e4237f24780596d ******/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
double

Description
-----------
No available documentation.
") VertexTol;
		virtual double VertexTol(const int Index, const double Param);

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
		/****** md5 signature: 3b1e890f21a1c30cdcee95274835d75a ******/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "
Parameters
----------
Law: BRepFill_LocationLaw
Section: TopoDS_Shape
WithContact: bool (optional, default to false)
WithCorrection: bool (optional, default to false)

Return
-------
None

Description
-----------
Automatic placement.
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement(const opencascade::handle<BRepFill_LocationLaw> & Law, const TopoDS_Shape & Section, const bool WithContact = false, const bool WithCorrection = false);

		/****** BRepFill_SectionPlacement::BRepFill_SectionPlacement ******/
		/****** md5 signature: 6b3f363388fc88ae7723b5cead6b32c8 ******/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "
Parameters
----------
Law: BRepFill_LocationLaw
Section: TopoDS_Shape
Vertex: TopoDS_Shape
WithContact: bool (optional, default to false)
WithCorrection: bool (optional, default to false)

Return
-------
None

Description
-----------
Placement on vertex.
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement(const opencascade::handle<BRepFill_LocationLaw> & Law, const TopoDS_Shape & Section, const TopoDS_Shape & Vertex, const bool WithContact = false, const bool WithCorrection = false);

		/****** BRepFill_SectionPlacement::AbscissaOnPath ******/
		/****** md5 signature: 0947e05fe45607fea2beb17a32d0d440 ******/
		%feature("compactdefaultargs") AbscissaOnPath;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") AbscissaOnPath;
		double AbscissaOnPath();

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
		/****** md5 signature: 69b4c997724353dcff18f416f13ae149 ******/
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
		 BRepFill_Sweep(const opencascade::handle<BRepFill_SectionLaw> & Section, const opencascade::handle<BRepFill_LocationLaw> & Location, const bool WithKPart);

		/****** BRepFill_Sweep::Build ******/
		/****** md5 signature: f67459e8c570a98c9760f865d9debd0c ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
ReversedEdges: NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher>
Tapes: NCollection_HArray2<TopoDS_Shape
Rails: NCollection_HArray2<TopoDS_Shape
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
		void Build(NCollection_Map<TopoDS_Shape, TopTools_ShapeMapHasher> & ReversedEdges, NCollection_DataMap<TopoDS_Shape, opencascade::handle<NCollection_HArray2<TopoDS_Shape> >, TopTools_ShapeMapHasher> & Tapes, NCollection_DataMap<TopoDS_Shape, opencascade::handle<NCollection_HArray2<TopoDS_Shape> >, TopTools_ShapeMapHasher> & Rails, const BRepFill_TransitionStyle Transition = BRepFill_Modified, const GeomAbs_Shape Continuity = GeomAbs_C2, const GeomFill_ApproxStyle Approx = GeomFill_Location, const int Degmax = 11, const int Segmax = 30);

		/****** BRepFill_Sweep::ErrorOnSurface ******/
		/****** md5 signature: 0ab673c2dfbd4ce8e0d165ef9c450b15 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the Approximation error.
") ErrorOnSurface;
		double ErrorOnSurface();

		/****** BRepFill_Sweep::InterFaces ******/
		/****** md5 signature: 9869ca1ea753c228c37b484c2d0ff3a3 ******/
		%feature("compactdefaultargs") InterFaces;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<TopoDS_Shape>>

Description
-----------
No available documentation.
") InterFaces;
		opencascade::handle<NCollection_HArray2<TopoDS_Shape>> InterFaces();

		/****** BRepFill_Sweep::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the Shape is Build.
") IsDone;
		bool IsDone();

		/****** BRepFill_Sweep::Sections ******/
		/****** md5 signature: 5fb911ced2bf76ec44b6c4e75ff4a721 ******/
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<TopoDS_Shape>>

Description
-----------
No available documentation.
") Sections;
		opencascade::handle<NCollection_HArray2<TopoDS_Shape>> Sections();

		/****** BRepFill_Sweep::SetAngularControl ******/
		/****** md5 signature: 73c0b3495fb19b085b32a8ab06bc099d ******/
		%feature("compactdefaultargs") SetAngularControl;
		%feature("autodoc", "
Parameters
----------
AngleMin: double (optional, default to 0.01)
AngleMax: double (optional, default to 6.0)

Return
-------
None

Description
-----------
Tolerance To controle Corner management. //! If the discontinuity is lesser than <AngleMin> in radian The Transition Performed will be always 'Modified'.
") SetAngularControl;
		void SetAngularControl(const double AngleMin = 0.01, const double AngleMax = 6.0);

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
		/****** md5 signature: bb5360547d7f38f9dcab06086e0e5e80 ******/
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
		void SetForceApproxC1(const bool ForceApproxC1);

		/****** BRepFill_Sweep::SetTolerance ******/
		/****** md5 signature: 7cdc621eb3afdcfba163305538409077 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
BoundTol: double (optional, default to 1.0)
Tol2d: double (optional, default to 1.0e-5)
TolAngular: double (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
Set Approximation Tolerance Tol3d: Tolerance to surface approximation Tol2d: Tolerance used to perform curve approximation Normally the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular: Tolerance (in radian) to control the angle between tangents on the section law and tangent of iso-v on approximated surface.
") SetTolerance;
		void SetTolerance(const double Tol3d, const double BoundTol = 1.0, const double Tol2d = 1.0e-5, const double TolAngular = 1.0e-2);

		/****** BRepFill_Sweep::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the Sweeping Shape.
") Shape;
		TopoDS_Shape Shape();

		/****** BRepFill_Sweep::SubShape ******/
		/****** md5 signature: fd53de1cb18ce12143865dbbbd5ba4cd ******/
		%feature("compactdefaultargs") SubShape;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<TopoDS_Shape>>

Description
-----------
No available documentation.
") SubShape;
		opencascade::handle<NCollection_HArray2<TopoDS_Shape>> SubShape();

		/****** BRepFill_Sweep::Tape ******/
		/****** md5 signature: 065554f796bd0d622183b5a017c4a443 ******/
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
Returns the Tape corresponding to Index-th edge of section.
") Tape;
		TopoDS_Shape Tape(const int Index);

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
		/****** md5 signature: 32f54ca7a7abfe6f05ef02dc35b8cfb0 ******/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "
Parameters
----------
Bisec: Bisector_Bisec
S1: Geom2d_Geometry
S2: Geom2d_Geometry
Offset: double

Return
-------
None

Description
-----------
No available documentation.
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool(const Bisector_Bisec & Bisec, const opencascade::handle<Geom2d_Geometry> & S1, const opencascade::handle<Geom2d_Geometry> & S2, const double Offset);

		/****** BRepFill_TrimEdgeTool::AddOrConfuse ******/
		/****** md5 signature: 232867ec22b0bdacc65241dfa0efb31b ******/
		%feature("compactdefaultargs") AddOrConfuse;
		%feature("autodoc", "
Parameters
----------
Start: bool
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Params: NCollection_Sequence<gp_Pnt>

Return
-------
None

Description
-----------
No available documentation.
") AddOrConfuse;
		void AddOrConfuse(const bool Start, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, NCollection_Sequence<gp_Pnt> & Params);

		/****** BRepFill_TrimEdgeTool::IntersectWith ******/
		/****** md5 signature: acf078dbbf36baa548712d85b25ec66f ******/
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
Params: NCollection_Sequence<gp_Pnt>

Return
-------
None

Description
-----------
No available documentation.
") IntersectWith;
		void IntersectWith(const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const TopoDS_Shape & InitShape1, const TopoDS_Shape & InitShape2, const TopoDS_Vertex & End1, const TopoDS_Vertex & End2, const GeomAbs_JoinType theJoinType, const bool IsOpenResult, NCollection_Sequence<gp_Pnt> & Params);

		/****** BRepFill_TrimEdgeTool::IsInside ******/
		/****** md5 signature: 3583837dccf3c0c4b99d1a2cfb21a344 ******/
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
		bool IsInside(const gp_Pnt2d & P);

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
		/****** md5 signature: 6390b0f25cf9a1b674944593518aa99a ******/
		%feature("compactdefaultargs") BRepFill_TrimShellCorner;
		%feature("autodoc", "
Parameters
----------
theFaces: NCollection_HArray2<TopoDS_Shape
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
		 BRepFill_TrimShellCorner(const opencascade::handle<NCollection_HArray2<TopoDS_Shape> > & theFaces, const BRepFill_TransitionStyle theTransition, const gp_Ax2 & theAxeOfBisPlane, const gp_Vec & theIntPointCrossDir);

		/****** BRepFill_TrimShellCorner::AddBounds ******/
		/****** md5 signature: 0c6f0cc1fa17e085de1f61a2c1d7758e ******/
		%feature("compactdefaultargs") AddBounds;
		%feature("autodoc", "
Parameters
----------
Bounds: NCollection_HArray2<TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddBounds;
		void AddBounds(const opencascade::handle<NCollection_HArray2<TopoDS_Shape> > & Bounds);

		/****** BRepFill_TrimShellCorner::AddUEdges ******/
		/****** md5 signature: 044c846620965ffbc25a387c77cf3973 ******/
		%feature("compactdefaultargs") AddUEdges;
		%feature("autodoc", "
Parameters
----------
theUEdges: NCollection_HArray2<TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddUEdges;
		void AddUEdges(const opencascade::handle<NCollection_HArray2<TopoDS_Shape> > & theUEdges);

		/****** BRepFill_TrimShellCorner::AddVEdges ******/
		/****** md5 signature: 30e52edf4f5d2dae3c7681b0bf7829f0 ******/
		%feature("compactdefaultargs") AddVEdges;
		%feature("autodoc", "
Parameters
----------
theVEdges: NCollection_HArray2<TopoDS_Shape
theIndex: int

Return
-------
None

Description
-----------
No available documentation.
") AddVEdges;
		void AddVEdges(const opencascade::handle<NCollection_HArray2<TopoDS_Shape> > & theVEdges, const int theIndex);

		/****** BRepFill_TrimShellCorner::HasSection ******/
		/****** md5 signature: 1a10ee43794f46ad601dc55b48eb30d5 ******/
		%feature("compactdefaultargs") HasSection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasSection;
		bool HasSection();

		/****** BRepFill_TrimShellCorner::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BRepFill_TrimShellCorner::Modified ******/
		/****** md5 signature: f6790e8b9356ad666a32b8eee4e4346c ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
theModified: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
No available documentation.
") Modified;
		void Modified(const TopoDS_Shape & S, NCollection_List<TopoDS_Shape> & theModified);

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
		/****** md5 signature: 6995a1e2f248e2e3ef76f64e114e0f37 ******/
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
		 BRepFill_TrimSurfaceTool(const opencascade::handle<Geom2d_Curve> & Bis, const TopoDS_Face & Face1, const TopoDS_Face & Face2, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const bool Inv1, const bool Inv2);

		/****** BRepFill_TrimSurfaceTool::IntersectWith ******/
		/****** md5 signature: 7b6113896e6b8098e17bd30726057513 ******/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "
Parameters
----------
EdgeOnF1: TopoDS_Edge
EdgeOnF2: TopoDS_Edge
Points: NCollection_Sequence<gp_Pnt>

Return
-------
None

Description
-----------
Intersect <Bis> with the projection of the edges <EdgeOnFi> and returns the intersecting parameters on Bis and on the edges P.X(): Parameter on Bis P.Y(): Parameter on EdgeOnF1 P.Z(): Parameter on EdgeOnF2 raises if <Edge> is not a edge of Face1 or Face2.
") IntersectWith;
		void IntersectWith(const TopoDS_Edge & EdgeOnF1, const TopoDS_Edge & EdgeOnF2, NCollection_Sequence<gp_Pnt> & Points);

		/****** BRepFill_TrimSurfaceTool::IsOnFace ******/
		/****** md5 signature: 589c42e2795942ba98cdbff82f1489ec ******/
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
		bool IsOnFace(const gp_Pnt2d & Point);

		/****** BRepFill_TrimSurfaceTool::ProjOn ******/
		/****** md5 signature: 4858eceb0a24b1ef33e31b6b1c95a168 ******/
		%feature("compactdefaultargs") ProjOn;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt2d
Edge: TopoDS_Edge

Return
-------
double

Description
-----------
returns the parameter of the point <Point> on the Edge <Edge>, assuming that the point is on the edge.
") ProjOn;
		double ProjOn(const gp_Pnt2d & Point, const TopoDS_Edge & Edge);

		/****** BRepFill_TrimSurfaceTool::Project ******/
		/****** md5 signature: b30b79fe99de4712fbc362fcf9036c81 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
U1: double
U2: double
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
		void Project(const double U1, const double U2, opencascade::handle<Geom_Curve> & Curve, opencascade::handle<Geom2d_Curve> & PCurve1, opencascade::handle<Geom2d_Curve> & PCurve2, GeomAbs_Shape &OutValue);

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
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns <False> if one Edge of <Path> do not have representation on <Surf>. In this case it is impossible to use this object.
") HasResult;
		bool HasResult();

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
		/****** md5 signature: 0ac404b3399ba0cac1c8b578994d345a ******/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "
Parameters
----------
S: NCollection_Sequence<TopoDS_Shape>
Build: bool (optional, default to true)

Return
-------
None

Description
-----------
Construct.
") BRepFill_NSections;
		 BRepFill_NSections(const NCollection_Sequence<TopoDS_Shape> & S, const bool Build = true);

		/****** BRepFill_NSections::BRepFill_NSections ******/
		/****** md5 signature: ce3a0683ff5cef18284dd45cb1ed9698 ******/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "
Parameters
----------
S: NCollection_Sequence<TopoDS_Shape>
Trsfs: NCollection_Sequence<gp_Trsf>
P: NCollection_Sequence<double>
VF: double
VL: double
Build: bool (optional, default to true)

Return
-------
None

Description
-----------
Construct.
") BRepFill_NSections;
		 BRepFill_NSections(const NCollection_Sequence<TopoDS_Shape> & S, const NCollection_Sequence<gp_Trsf> & Trsfs, const NCollection_Sequence<double> & P, const double VF, const double VL, const bool Build = true);

		/****** BRepFill_NSections::ConcatenedLaw ******/
		/****** md5 signature: 51a6e8f5492494ca773beae28ebb4ae8 ******/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_SectionLaw>

Description
-----------
Give the law build on a concatenated section.
") ConcatenedLaw;
		opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****** BRepFill_NSections::Continuity ******/
		/****** md5 signature: e7882e5c6934520ec214822f99eb0f37 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
Index: int
TolAngular: double

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity(const int Index, const double TolAngular);

		/****** BRepFill_NSections::D0 ******/
		/****** md5 signature: ca66f6b8594a1208b809d12097f689d9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const double Param, TopoDS_Shape & S);

		/****** BRepFill_NSections::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the Law is Constant.
") IsConstant;
		bool IsConstant();

		/****** BRepFill_NSections::IsVertex ******/
		/****** md5 signature: 88eea0b9b44a947715617396a56798bb ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the input shape is a vertex.
") IsVertex;
		bool IsVertex();

		/****** BRepFill_NSections::Vertex ******/
		/****** md5 signature: f7cd54c4ee715bbc879cabd946f2b3e2 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		TopoDS_Vertex Vertex(const int Index, const double Param);

		/****** BRepFill_NSections::VertexTol ******/
		/****** md5 signature: a7ff584fbcaac3ae7669d3cc3e0749c0 ******/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
double

Description
-----------
No available documentation.
") VertexTol;
		double VertexTol(const int Index, const double Param);

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
		/****** md5 signature: 45a2480c3a27149ed204718d3a9605b3 ******/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Build: bool (optional, default to true)

Return
-------
None

Description
-----------
Construct an constant Law.
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Vertex & V, const bool Build = true);

		/****** BRepFill_ShapeLaw::BRepFill_ShapeLaw ******/
		/****** md5 signature: 1dd275506de3fc39d9d843667aab48f5 ******/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
Build: bool (optional, default to true)

Return
-------
None

Description
-----------
Construct an constant Law.
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Wire & W, const bool Build = true);

		/****** BRepFill_ShapeLaw::BRepFill_ShapeLaw ******/
		/****** md5 signature: 72f86b533f6fe2b5f2db20f9ae13d02f ******/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
L: Law_Function
Build: bool (optional, default to true)

Return
-------
None

Description
-----------
Construct an evolutive Law.
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Wire & W, const opencascade::handle<Law_Function> & L, const bool Build = true);

		/****** BRepFill_ShapeLaw::ConcatenedLaw ******/
		/****** md5 signature: 51a6e8f5492494ca773beae28ebb4ae8 ******/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_SectionLaw>

Description
-----------
Give the law build on a concatenated section.
") ConcatenedLaw;
		opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****** BRepFill_ShapeLaw::Continuity ******/
		/****** md5 signature: e7882e5c6934520ec214822f99eb0f37 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
Index: int
TolAngular: double

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity(const int Index, const double TolAngular);

		/****** BRepFill_ShapeLaw::D0 ******/
		/****** md5 signature: ca66f6b8594a1208b809d12097f689d9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const double Param, TopoDS_Shape & S);

		/****** BRepFill_ShapeLaw::Edge ******/
		/****** md5 signature: 0537f1530f8fecb22bbe3382906c69f1 ******/
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
		const TopoDS_Edge Edge(const int Index);

		/****** BRepFill_ShapeLaw::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the Law is Constant.
") IsConstant;
		bool IsConstant();

		/****** BRepFill_ShapeLaw::IsVertex ******/
		/****** md5 signature: 88eea0b9b44a947715617396a56798bb ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the input shape is a vertex.
") IsVertex;
		bool IsVertex();

		/****** BRepFill_ShapeLaw::Vertex ******/
		/****** md5 signature: f7cd54c4ee715bbc879cabd946f2b3e2 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		TopoDS_Vertex Vertex(const int Index, const double Param);

		/****** BRepFill_ShapeLaw::VertexTol ******/
		/****** md5 signature: a7ff584fbcaac3ae7669d3cc3e0749c0 ******/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "
Parameters
----------
Index: int
Param: double

Return
-------
double

Description
-----------
No available documentation.
") VertexTol;
		double VertexTol(const int Index, const double Param);

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
		/****** md5 signature: f898a7fe5baafcaac9c744c624c87545 ******/
		%feature("compactdefaultargs") CleanLaw;
		%feature("autodoc", "
Parameters
----------
TolAngular: double

Return
-------
None

Description
-----------
To clean the little discontinuities.
") CleanLaw;
		void CleanLaw(const double TolAngular);

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
