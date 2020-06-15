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
%define BREPFILLDOCSTRING
"BRepFill module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepfill.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepFill_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopTools_module.hxx>
#include<MAT_module.hxx>
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
%import TopTools.i
%import MAT.i
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
enum BRepFill_TypeOfContact {
	BRepFill_NoContact = 0,
	BRepFill_Contact = 1,
	BRepFill_ContactOnBorder = 2,
};

enum BRepFill_TransitionStyle {
	BRepFill_Modified = 0,
	BRepFill_Right = 1,
	BRepFill_Round = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BRepFill_TypeOfContact(IntEnum):
	BRepFill_NoContact = 0
	BRepFill_Contact = 1
	BRepFill_ContactOnBorder = 2
BRepFill_NoContact = BRepFill_TypeOfContact.BRepFill_NoContact
BRepFill_Contact = BRepFill_TypeOfContact.BRepFill_Contact
BRepFill_ContactOnBorder = BRepFill_TypeOfContact.BRepFill_ContactOnBorder

class BRepFill_TransitionStyle(IntEnum):
	BRepFill_Modified = 0
	BRepFill_Right = 1
	BRepFill_Round = 2
BRepFill_Modified = BRepFill_TransitionStyle.BRepFill_Modified
BRepFill_Right = BRepFill_TransitionStyle.BRepFill_Right
BRepFill_Round = BRepFill_TransitionStyle.BRepFill_Round
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
%template(BRepFill_DataMapOfNodeDataMapOfShapeShape) NCollection_DataMap<opencascade::handle<MAT_Node>,TopTools_DataMapOfShapeShape,TColStd_MapTransientHasher>;
%template(BRepFill_DataMapOfNodeShape) NCollection_DataMap<opencascade::handle<MAT_Node>,TopoDS_Shape,TColStd_MapTransientHasher>;
%template(BRepFill_DataMapOfOrientedShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_OrientedShapeMapHasher>;
%template(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape) NCollection_DataMap<TopoDS_Shape,TopTools_DataMapOfShapeListOfShape,TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfShapeHArray2OfShape) NCollection_DataMap<TopoDS_Shape,opencascade::handle<TopTools_HArray2OfShape>,TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfShapeSequenceOfPnt) NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt,TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfShapeSequenceOfReal) NCollection_DataMap<TopoDS_Shape,TColStd_SequenceOfReal,TopTools_ShapeMapHasher>;
%template(BRepFill_IndexedDataMapOfOrientedShapeListOfShape) NCollection_IndexedDataMap<TopoDS_Shape,TopTools_ListOfShape,TopTools_OrientedShapeMapHasher>;
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
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopTools_DataMapOfShapeShape, TColStd_MapTransientHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopoDS_Shape, TColStd_MapTransientHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfNodeShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_OrientedShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_DataMapOfShapeListOfShape, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<TopTools_HArray2OfShape>, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_SequenceOfReal, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopTools_DataMapOfShapeShape, TColStd_MapTransientHasher> BRepFill_DataMapOfNodeDataMapOfShapeShape;
typedef NCollection_DataMap<opencascade::handle<MAT_Node>, TopoDS_Shape, TColStd_MapTransientHasher> BRepFill_DataMapOfNodeShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_OrientedShapeMapHasher> BRepFill_DataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TopTools_DataMapOfShapeListOfShape, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<TopTools_HArray2OfShape>, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeHArray2OfShape;
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeSequenceOfPnt;
typedef NCollection_DataMap<TopoDS_Shape, TColStd_SequenceOfReal, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeSequenceOfReal;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopTools_ListOfShape, TopTools_OrientedShapeMapHasher> BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
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
		/****************** Axe ******************/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "Computes <axeprof> as follow. <location> is the position of the nearest vertex v of <profile> to <spine>.<xdirection> is confused with the tangent to <spine> at the projected point of v on the spine. <direction> is normal to <spine>. <spine> is a plane wire or a plane face.

Parameters
----------
Spine: TopoDS_Shape
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Tol: float

Returns
-------
ProfOnSpine: bool
") Axe;
		static void Axe(const TopoDS_Shape & Spine, const TopoDS_Wire & Profile, gp_Ax3 & AxeProf, Standard_Boolean &OutValue, const Standard_Real Tol);

		/****************** ComputeACR ******************/
		%feature("compactdefaultargs") ComputeACR;
		%feature("autodoc", "Compute acr on a wire.

Parameters
----------
wire: TopoDS_Wire
ACR: TColStd_Array1OfReal

Returns
-------
None
") ComputeACR;
		static void ComputeACR(const TopoDS_Wire & wire, TColStd_Array1OfReal & ACR);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Computes a ruled surface between two edges.

Parameters
----------
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge

Returns
-------
TopoDS_Face
") Face;
		static TopoDS_Face Face(const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2);

		/****************** InsertACR ******************/
		%feature("compactdefaultargs") InsertACR;
		%feature("autodoc", "Insert acr on a wire.

Parameters
----------
wire: TopoDS_Wire
ACRcuts: TColStd_Array1OfReal
prec: float

Returns
-------
TopoDS_Wire
") InsertACR;
		static TopoDS_Wire InsertACR(const TopoDS_Wire & wire, const TColStd_Array1OfReal & ACRcuts, const Standard_Real prec);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Computes a ruled surface between two wires. the wires must have the same number of edges.

Parameters
----------
Wire1: TopoDS_Wire
Wire2: TopoDS_Wire

Returns
-------
TopoDS_Shell
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
		/****************** BRepFill_AdvancedEvolved ******************/
		%feature("compactdefaultargs") BRepFill_AdvancedEvolved;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BRepFill_AdvancedEvolved;
		 BRepFill_AdvancedEvolved();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Parameters
----------
theErrorCode: unsigned int *,optional
	default value is 0

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone(unsigned int * theErrorCode = 0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSpine: TopoDS_Wire
theProfile: TopoDS_Wire
theTolerance: float
theSolidReq: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Wire & theSpine, const TopoDS_Wire & theProfile, const Standard_Real theTolerance, const Standard_Boolean theSolidReq = Standard_True);

		/****************** SetParallelMode ******************/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "Sets/unsets computation in parallel mode.

Parameters
----------
theVal: bool

Returns
-------
None
") SetParallelMode;
		void SetParallelMode(const Standard_Boolean theVal);

		/****************** SetTemporaryDirectory ******************/
		%feature("compactdefaultargs") SetTemporaryDirectory;
		%feature("autodoc", "Sets directory where the debug shapes will be saved.

Parameters
----------
thePath: char *

Returns
-------
None
") SetTemporaryDirectory;
		void SetTemporaryDirectory(const char * & thePath);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the resulting shape.

Returns
-------
TopoDS_Shape
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
		/****************** BRepFill_ApproxSeewing ******************/
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing();

		/****************** BRepFill_ApproxSeewing ******************/
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", "No available documentation.

Parameters
----------
ML: BRepFill_MultiLine

Returns
-------
None
") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing(const BRepFill_MultiLine & ML);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the approximation of the 3d curve.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** CurveOnF1 ******************/
		%feature("compactdefaultargs") CurveOnF1;
		%feature("autodoc", "Returns the approximation of the pcurve on the first face of the multiline.

Returns
-------
opencascade::handle<Geom2d_Curve>
") CurveOnF1;
		const opencascade::handle<Geom2d_Curve> & CurveOnF1();

		/****************** CurveOnF2 ******************/
		%feature("compactdefaultargs") CurveOnF2;
		%feature("autodoc", "Returns the approximation of the pcurve on the first face of the multiline.

Returns
-------
opencascade::handle<Geom2d_Curve>
") CurveOnF2;
		const opencascade::handle<Geom2d_Curve> & CurveOnF2();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
ML: BRepFill_MultiLine

Returns
-------
None
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
		/****************** BRepFill_CompatibleWires ******************/
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires();

		/****************** BRepFill_CompatibleWires ******************/
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sections: TopTools_SequenceOfShape

Returns
-------
None
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires(const TopTools_SequenceOfShape & Sections);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "Returns the shapes created from a subshape <subsection> of a section.

Parameters
----------
SubSection: TopoDS_Edge

Returns
-------
TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Edge & SubSection);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sections: TopTools_SequenceOfShape

Returns
-------
None
") Init;
		void Init(const TopTools_SequenceOfShape & Sections);

		/****************** IsDegeneratedFirstSection ******************/
		%feature("compactdefaultargs") IsDegeneratedFirstSection;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegeneratedFirstSection;
		Standard_Boolean IsDegeneratedFirstSection();

		/****************** IsDegeneratedLastSection ******************/
		%feature("compactdefaultargs") IsDegeneratedLastSection;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegeneratedLastSection;
		Standard_Boolean IsDegeneratedLastSection();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs compatiblewires according to the orientation and the origin of each other.

Parameters
----------
WithRotation: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean WithRotation = Standard_True);

		/****************** SetPercent ******************/
		%feature("compactdefaultargs") SetPercent;
		%feature("autodoc", "No available documentation.

Parameters
----------
percent: float,optional
	default value is 0.01

Returns
-------
None
") SetPercent;
		void SetPercent(const Standard_Real percent = 0.01);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the generated sequence.

Returns
-------
TopTools_SequenceOfShape
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
		/****************** BRepFill_ComputeCLine ******************/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "The multiline <line> will be approximated until tolerances will be reached. the approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is true.

Parameters
----------
Line: BRepFill_MultiLine
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-5
Tolerance2d: float,optional
	default value is 1.0e-5
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine(const BRepFill_MultiLine & Line, const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-5, const Standard_Real Tolerance2d = 1.0e-5, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** BRepFill_ComputeCLine ******************/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "Initializes the fields of the algorithm.

Parameters
----------
degreemin: int,optional
	default value is 3
degreemax: int,optional
	default value is 8
Tolerance3d: float,optional
	default value is 1.0e-05
Tolerance2d: float,optional
	default value is 1.0e-05
cutting: bool,optional
	default value is Standard_False
FirstC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint
LastC: AppParCurves_Constraint,optional
	default value is AppParCurves_TangencyPoint

Returns
-------
None
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine(const Standard_Integer degreemin = 3, const Standard_Integer degreemax = 8, const Standard_Real Tolerance3d = 1.0e-05, const Standard_Real Tolerance2d = 1.0e-05, const Standard_Boolean cutting = Standard_False, const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint, const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the tolerances 2d and 3d of the <index> multicurve.

Parameters
----------
Index: int

Returns
-------
tol3d: float
tol2d: float
") Error;
		void Error(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "Returns false if at a moment of the approximation, the status noapproximation has been sent by the user when more points were needed.

Returns
-------
bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "Returns false if the status nopointsadded has been sent.

Returns
-------
bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "Returns the number of multicurve doing the approximation of the multiline.

Returns
-------
int
") NbMultiCurves;
		Standard_Integer NbMultiCurves();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
firstp: float
lastp: float
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Runs the algorithm after having initialized the fields.

Parameters
----------
Line: BRepFill_MultiLine

Returns
-------
None
") Perform;
		void Perform(const BRepFill_MultiLine & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "Changes the constraints of the approximation.

Parameters
----------
FirstC: AppParCurves_Constraint
LastC: AppParCurves_Constraint

Returns
-------
None
") SetConstraints;
		void SetConstraints(const AppParCurves_Constraint FirstC, const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "Changes the degrees of the approximation.

Parameters
----------
degreemin: int
degreemax: int

Returns
-------
None
") SetDegrees;
		void SetDegrees(const Standard_Integer degreemin, const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "Set inverse order of degree selection: if theinvordr = true, current degree is chosen by inverse order - from maxdegree to mindegree. by default inverse order is used.

Parameters
----------
theInvOrder: bool

Returns
-------
None
") SetInvOrder;
		void SetInvOrder(const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Changes the max number of segments, which is allowed for cutting.

Parameters
----------
theMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Changes the tolerances of the approximation.

Parameters
----------
Tolerance3d: float
Tolerance2d: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real Tolerance3d, const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the approximation multicurve of range <index>.

Parameters
----------
Index: int,optional
	default value is 1

Returns
-------
AppParCurves_MultiCurve
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
		/****************** BRepFill_CurveConstraint ******************/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "Create a constraint order is the order of the constraint. the possible values for order are -1,0,1,2. order i means constraints gi npt is the number of points associated with the constraint. toldist is the maximum error to satisfy for g0 constraints tolang is the maximum error to satisfy for g1 constraints tolcurv is the maximum error to satisfy for g2 constraints these errors can be replaced by laws of criterion.

Parameters
----------
Boundary: Adaptor3d_HCurveOnSurface
Order: int
NPt: int,optional
	default value is 10
TolDist: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1

Returns
-------
None
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint(const opencascade::handle<Adaptor3d_HCurveOnSurface> & Boundary, const Standard_Integer Order, const Standard_Integer NPt = 10, const Standard_Real TolDist = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****************** BRepFill_CurveConstraint ******************/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Boundary: Adaptor3d_HCurve
Tang: int
NPt: int,optional
	default value is 10
TolDist: float,optional
	default value is 0.0001

Returns
-------
None
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint(const opencascade::handle<Adaptor3d_HCurve> & Boundary, const Standard_Integer Tang, const Standard_Integer NPt = 10, const Standard_Real TolDist = 0.0001);

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
		/****************** BRepFill_Draft ******************/
		%feature("compactdefaultargs") BRepFill_Draft;
		%feature("autodoc", "No available documentation.

Parameters
----------
Shape: TopoDS_Shape
Dir: gp_Dir
Angle: float

Returns
-------
None
") BRepFill_Draft;
		 BRepFill_Draft(const TopoDS_Shape & Shape, const gp_Dir & Dir, const Standard_Real Angle);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
LengthMax: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real LengthMax);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Geom_Surface
KeepInsideSurface: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & Surface, const Standard_Boolean KeepInsideSurface = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
StopShape: TopoDS_Shape
KeepOutSide: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & StopShape, const Standard_Boolean KeepOutSide = Standard_True);

		/****************** SetDraft ******************/
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsInternal: bool,optional
	default value is Standard_False

Returns
-------
None
") SetDraft;
		void SetDraft(const Standard_Boolean IsInternal = Standard_False);

		/****************** SetOptions ******************/
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "No available documentation.

Parameters
----------
Style: BRepFill_TransitionStyle,optional
	default value is BRepFill_Right
AngleMin: float,optional
	default value is 0.01
AngleMax: float,optional
	default value is 3.0

Returns
-------
None
") SetOptions;
		void SetOptions(const BRepFill_TransitionStyle Style = BRepFill_Right, const Standard_Real AngleMin = 0.01, const Standard_Real AngleMax = 3.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the draft surface to have the complete shape you have to use the shape() methode.

Returns
-------
TopoDS_Shell
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
		/****************** BRepFill_EdgeFaceAndOrder ******************/
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder();

		/****************** BRepFill_EdgeFaceAndOrder ******************/
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdge: TopoDS_Edge
aFace: TopoDS_Face
anOrder: GeomAbs_Shape

Returns
-------
None
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
		/****************** BRepFill_Evolved ******************/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_Evolved;
		 BRepFill_Evolved();

		/****************** BRepFill_Evolved ******************/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "Creates an evolved shape by sweeping the <profile> along the <spine>. <axeprof> is used to set the position of <profile> along <spine> as follows: <axeprof> slides on the profile with direction colinear to the normal to <spine>, and its <xdirection> mixed with the tangent to <spine>.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Solid: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepFill_Evolved;
		 BRepFill_Evolved(const TopoDS_Wire & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****************** BRepFill_Evolved ******************/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "Creates an evolved shape by sweeping the <profile> along the <spine>.

Parameters
----------
Spine: TopoDS_Face
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Solid: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepFill_Evolved;
		 BRepFill_Evolved(const TopoDS_Face & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****************** Bottom ******************/
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "Return the face bottom if <solid> is true in the constructor.

Returns
-------
TopoDS_Shape
") Bottom;
		const TopoDS_Shape Bottom();

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "Returns the shapes created from a subshape <spineshape> of the spine and a subshape <profshape> on the profile.

Parameters
----------
SpineShape: TopoDS_Shape
ProfShape: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SpineShape, const TopoDS_Shape & ProfShape);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** JoinType ******************/
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_JoinType
") JoinType;
		GeomAbs_JoinType JoinType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs an evolved shape by sweeping the <profile> along the <spine>.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Solid: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Wire & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs an evolved shape by sweeping the <profile> along the <spine>.

Parameters
----------
Spine: TopoDS_Face
Profile: TopoDS_Wire
AxeProf: gp_Ax3
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Solid: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Face & Spine, const TopoDS_Wire & Profile, const gp_Ax3 & AxeProf, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean Solid = Standard_False);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the generated shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Top ******************/
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "Return the face top if <solid> is true in the constructor.

Returns
-------
TopoDS_Shape
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
		/****************** BRepFill_FaceAndOrder ******************/
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder();

		/****************** BRepFill_FaceAndOrder ******************/
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
anOrder: GeomAbs_Shape

Returns
-------
None
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
		/****************** BRepFill_Filling ******************/
		%feature("compactdefaultargs") BRepFill_Filling;
		%feature("autodoc", "Constructor.

Parameters
----------
Degree: int,optional
	default value is 3
NbPtsOnCur: int,optional
	default value is 15
NbIter: int,optional
	default value is 2
Anisotropie: bool,optional
	default value is Standard_False
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1
MaxDeg: int,optional
	default value is 8
MaxSegments: int,optional
	default value is 9

Returns
-------
None
") BRepFill_Filling;
		 BRepFill_Filling(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 15, const Standard_Integer NbIter = 2, const Standard_Boolean Anisotropie = Standard_False, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a new constraint which also defines an edge of the wire of the face order: order of the constraint: geomabs_c0 : the surface has to pass by 3d representation of the edge geomabs_g1 : the surface has to pass by 3d representation of the edge and to respect tangency with the first face of the edge geomabs_g2 : the surface has to pass by 3d representation of the edge and to respect tangency and curvature with the first face of the edge.

Parameters
----------
anEdge: TopoDS_Edge
Order: GeomAbs_Shape
IsBound: bool,optional
	default value is Standard_True

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Edge & anEdge, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a new constraint which also defines an edge of the wire of the face order: order of the constraint: geomabs_c0 : the surface has to pass by 3d representation of the edge geomabs_g1 : the surface has to pass by 3d representation of the edge and to respect tangency with the given face geomabs_g2 : the surface has to pass by 3d representation of the edge and to respect tangency and curvature with the given face.

Parameters
----------
anEdge: TopoDS_Edge
Support: TopoDS_Face
Order: GeomAbs_Shape
IsBound: bool,optional
	default value is Standard_True

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Edge & anEdge, const TopoDS_Face & Support, const GeomAbs_Shape Order, const Standard_Boolean IsBound = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a free constraint on a face. the corresponding edge has to be automatically recomputed. it is always a bound.

Parameters
----------
Support: TopoDS_Face
Order: GeomAbs_Shape

Returns
-------
int
") Add;
		Standard_Integer Add(const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a punctual constraint.

Parameters
----------
Point: gp_Pnt

Returns
-------
int
") Add;
		Standard_Integer Add(const gp_Pnt & Point);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a punctual constraint.

Parameters
----------
U: float
V: float
Support: TopoDS_Face
Order: GeomAbs_Shape

Returns
-------
int
") Add;
		Standard_Integer Add(const Standard_Real U, const Standard_Real V, const TopoDS_Face & Support, const GeomAbs_Shape Order);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting faces.

Returns
-------
None
") Build;
		void Build();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** G0Error ******************/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G0Error;
		Standard_Real G0Error();

		/****************** G0Error ******************/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") G0Error;
		Standard_Real G0Error(const Standard_Integer Index);

		/****************** G1Error ******************/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G1Error;
		Standard_Real G1Error();

		/****************** G1Error ******************/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") G1Error;
		Standard_Real G1Error(const Standard_Integer Index);

		/****************** G2Error ******************/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") G2Error;
		Standard_Real G2Error();

		/****************** G2Error ******************/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") G2Error;
		Standard_Real G2Error(const Standard_Integer Index);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadInitSurface ******************/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "Loads the initial surface the initial surface must have orthogonal local coordinates, i.e. partial derivatives ds/du and ds/dv must be orthogonal at each point of surface. if this condition breaks, distortions of resulting surface are possible.

Parameters
----------
aFace: TopoDS_Face

Returns
-------
None
") LoadInitSurface;
		void LoadInitSurface(const TopoDS_Face & aFace);

		/****************** SetApproxParam ******************/
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "Sets the parameters used for approximation of the surface.

Parameters
----------
MaxDeg: int,optional
	default value is 8
MaxSegments: int,optional
	default value is 9

Returns
-------
None
") SetApproxParam;
		void SetApproxParam(const Standard_Integer MaxDeg = 8, const Standard_Integer MaxSegments = 9);

		/****************** SetConstrParam ******************/
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "Sets the values of tolerances used to control the constraint. tol2d: tol3d: it is the maximum distance allowed between the support surface and the constraints tolang: it is the maximum angle allowed between the normal of the surface and the constraints tolcurv: it is the maximum difference of curvature allowed between the surface and the constraint.

Parameters
----------
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1

Returns
-------
None
") SetConstrParam;
		void SetConstrParam(const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****************** SetResolParam ******************/
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "Sets the parameters used for resolution. the default values of these parameters have been chosen for a good ratio quality/performance. degree: it is the order of energy criterion to minimize for computing the deformation of the surface. the default value is 3 the recommanded value is i+2 where i is the maximum order of the constraints. nbptsoncur: it is the average number of points for discretisation of the edges. nbiter: it is the maximum number of iterations of the process. for each iteration the number of discretisation points is increased. anisotropie:.

Parameters
----------
Degree: int,optional
	default value is 3
NbPtsOnCur: int,optional
	default value is 15
NbIter: int,optional
	default value is 2
Anisotropie: bool,optional
	default value is Standard_False

Returns
-------
None
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
		/****************** BRepFill_Generator ******************/
		%feature("compactdefaultargs") BRepFill_Generator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_Generator;
		 BRepFill_Generator();

		/****************** AddWire ******************/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
Wire: TopoDS_Wire

Returns
-------
None
") AddWire;
		void AddWire(const TopoDS_Wire & Wire);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns all the shapes created.

Returns
-------
TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "Returns the shapes created from a subshape <ssection> of a section.

Parameters
----------
SSection: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SSection);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the shell.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shell
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
		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Return the curvilinear abscissa corresponding to a point of the path, defined by <index> of edge and a parameter on the edge.

Parameters
----------
Index: int
Param: float

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer Index, const Standard_Real Param);

		/****************** CurvilinearBounds ******************/
		%feature("compactdefaultargs") CurvilinearBounds;
		%feature("autodoc", "Return the curvilinear bounds of the <index> law.

Parameters
----------
Index: int

Returns
-------
First: float
Last: float
") CurvilinearBounds;
		void CurvilinearBounds(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Apply the law to a shape, for a given curnilinear abscissa.

Parameters
----------
Abscissa: float
Section: TopoDS_Shape

Returns
-------
None
") D0;
		void D0(const Standard_Real Abscissa, TopoDS_Shape & Section);

		/****************** DeleteTransform ******************/
		%feature("compactdefaultargs") DeleteTransform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") DeleteTransform;
		void DeleteTransform();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return the edge of rank <index> in the path <index> have to be in [1, nblaw()].

Parameters
----------
Index: int

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer Index);

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return a error status, if the status is not pipeok then it exist a parameter tlike the law is not valuable for t.

Returns
-------
GeomFill_PipeError
") GetStatus;
		GeomFill_PipeError GetStatus();

		/****************** Holes ******************/
		%feature("compactdefaultargs") Holes;
		%feature("autodoc", "No available documentation.

Parameters
----------
Interval: TColStd_Array1OfInteger

Returns
-------
None
") Holes;
		void Holes(TColStd_Array1OfInteger & Interval);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsG1 ******************/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Compute the law's continuity beetween 2 edges of the path the result can be : -1 : case not connex 0 : it is connex (g0) 1 : it is tangent (g1).

Parameters
----------
Index: int
SpatialTolerance: float,optional
	default value is 1.0e-7
AngularTolerance: float,optional
	default value is 1.0e-4

Returns
-------
int
") IsG1;
		Standard_Integer IsG1(const Standard_Integer Index, const Standard_Real SpatialTolerance = 1.0e-7, const Standard_Real AngularTolerance = 1.0e-4);

		/****************** Law ******************/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "Return the elementary law of rank <index> <index> have to be in [1, nblaw()].

Parameters
----------
Index: int

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Law;
		const opencascade::handle<GeomFill_LocationLaw> & Law(const Standard_Integer Index);

		/****************** NbHoles ******************/
		%feature("compactdefaultargs") NbHoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float,optional
	default value is 1.0e-7

Returns
-------
int
") NbHoles;
		Standard_Integer NbHoles(const Standard_Real Tol = 1.0e-7);

		/****************** NbLaw ******************/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "Return the number of elementary law.

Returns
-------
int
") NbLaw;
		Standard_Integer NbLaw();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Find the index law and the parmaeter, for a given curnilinear abscissa.

Parameters
----------
Abscissa: float

Returns
-------
Index: int
Param: float
") Parameter;
		void Parameter(const Standard_Real Abscissa, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** PerformVertex ******************/
		%feature("compactdefaultargs") PerformVertex;
		%feature("autodoc", "Compute <outputvertex> like a transformation of <inputvertex> the transformation is given by evaluation of the location law in the vertex of rank <index>. <location> is used to manage discontinuities : - -1 : the law before the vertex is used. - 1 : the law after the vertex is used. - 0 : average of the both laws is used.

Parameters
----------
Index: int
InputVertex: TopoDS_Vertex
TolMin: float
OutputVertex: TopoDS_Vertex
Location: int,optional
	default value is 0

Returns
-------
None
") PerformVertex;
		void PerformVertex(const Standard_Integer Index, const TopoDS_Vertex & InputVertex, const Standard_Real TolMin, TopoDS_Vertex & OutputVertex, const Standard_Integer Location = 0);

		/****************** TransformInCompatibleLaw ******************/
		%feature("compactdefaultargs") TransformInCompatibleLaw;
		%feature("autodoc", "Apply a linear transformation on each law, to reduce the dicontinuities of law at one rotation.

Parameters
----------
AngularTolerance: float

Returns
-------
None
") TransformInCompatibleLaw;
		virtual void TransformInCompatibleLaw(const Standard_Real AngularTolerance);

		/****************** TransformInG0Law ******************/
		%feature("compactdefaultargs") TransformInG0Law;
		%feature("autodoc", "Apply a linear transformation on each law, to have continuity of the global law beetween the edges.

Returns
-------
None
") TransformInG0Law;
		virtual void TransformInG0Law();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return the vertex of rank <index> in the path <index> have to be in [0, nblaw()].

Parameters
----------
Index: int

Returns
-------
TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex(const Standard_Integer Index);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return the path.

Returns
-------
TopoDS_Wire
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
		/****************** BRepFill_MultiLine ******************/
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_MultiLine;
		 BRepFill_MultiLine();

		/****************** BRepFill_MultiLine ******************/
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Face1: TopoDS_Face
Face2: TopoDS_Face
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Inv1: bool
Inv2: bool
Bissec: Geom2d_Curve

Returns
-------
None
") BRepFill_MultiLine;
		 BRepFill_MultiLine(const TopoDS_Face & Face1, const TopoDS_Face & Face2, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Boolean Inv1, const Standard_Boolean Inv2, const opencascade::handle<Geom2d_Curve> & Bissec);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity betwwen the two faces seshape from geomabsparated by mybis.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Raises if isparticularcase is <false>.

Parameters
----------
Curve: Geom_Curve
PCurve1: Geom2d_Curve
PCurve2: Geom2d_Curve

Returns
-------
None
") Curves;
		void Curves(opencascade::handle<Geom_Curve> & Curve, opencascade::handle<Geom2d_Curve> & PCurve1, opencascade::handle<Geom2d_Curve> & PCurve2);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the derivative at parameter <theu>.

Parameters
----------
theU: float
theVec2d: NCollection_Array1<gp_Vec2d>
theVec: NCollection_Array1<gp_Vec>

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real theU, NCollection_Array1<gp_Vec2d> & theVec2d, NCollection_Array1<gp_Vec> & theVec);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter of the bissectrice.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** IsParticularCase ******************/
		%feature("compactdefaultargs") IsParticularCase;
		%feature("autodoc", "Search if the projection of the bissectrice on the faces needs an approximation or not. returns true if the approximation is not needed.

Returns
-------
bool
") IsParticularCase;
		Standard_Boolean IsParticularCase();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter of the bissectrice.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current point on the 3d curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point at parameter <theu>.

Parameters
----------
theU: float
thePnt2d: NCollection_Array1<gp_Pnt2d>
thePnt: NCollection_Array1<gp_Pnt>

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const Standard_Real theU, NCollection_Array1<gp_Pnt2d> & thePnt2d, NCollection_Array1<gp_Pnt> & thePnt);

		/****************** Value3dOnF1OnF2 ******************/
		%feature("compactdefaultargs") Value3dOnF1OnF2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P3d: gp_Pnt
PF1: gp_Pnt2d
PF2: gp_Pnt2d

Returns
-------
None
") Value3dOnF1OnF2;
		void Value3dOnF1OnF2(const Standard_Real U, gp_Pnt & P3d, gp_Pnt2d & PF1, gp_Pnt2d & PF2);

		/****************** ValueOnF1 ******************/
		%feature("compactdefaultargs") ValueOnF1;
		%feature("autodoc", "Returns the current point on the pcurve of the first face.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") ValueOnF1;
		gp_Pnt2d ValueOnF1(const Standard_Real U);

		/****************** ValueOnF2 ******************/
		%feature("compactdefaultargs") ValueOnF2;
		%feature("autodoc", "Returns the current point on the pcurve of the first face.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
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
		/****************** BRepFill_OffsetAncestors ******************/
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors();

		/****************** BRepFill_OffsetAncestors ******************/
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", "No available documentation.

Parameters
----------
Paral: BRepFill_OffsetWire

Returns
-------
None
") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors(BRepFill_OffsetWire & Paral);

		/****************** Ancestor ******************/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "May return a null shape if s1 is not a subshape of <paral>; if perform is not done.

Parameters
----------
S1: TopoDS_Edge

Returns
-------
TopoDS_Shape
") Ancestor;
		const TopoDS_Shape Ancestor(const TopoDS_Edge & S1);

		/****************** HasAncestor ******************/
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Edge

Returns
-------
bool
") HasAncestor;
		Standard_Boolean HasAncestor(const TopoDS_Edge & S1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Paral: BRepFill_OffsetWire

Returns
-------
None
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
		/****************** BRepFill_OffsetWire ******************/
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire();

		/****************** BRepFill_OffsetWire ******************/
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "Returns the shapes created from a subshape <spineshape> of the spine. returns the last computed offset.

Parameters
----------
SpineShape: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes(const TopoDS_Shape & SpineShape);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the evaluation of offseting.

Parameters
----------
Spine: TopoDS_Face
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
IsOpenResult: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & Spine, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Boolean IsOpenResult = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** JoinType ******************/
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_JoinType
") JoinType;
		GeomAbs_JoinType JoinType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs an offsetwire at an altitude <alt> from the face ( according to the orientation of the face).

Parameters
----------
Offset: float
Alt: float,optional
	default value is 0.0

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Offset, const Standard_Real Alt = 0.0);

		/****************** PerformWithBiLo ******************/
		%feature("compactdefaultargs") PerformWithBiLo;
		%feature("autodoc", "Performs an offsetwire.

Parameters
----------
WSP: TopoDS_Face
Offset: float
Locus: BRepMAT2d_BisectingLocus
Link: BRepMAT2d_LinkTopoBilo
Join: GeomAbs_JoinType,optional
	default value is GeomAbs_Arc
Alt: float,optional
	default value is 0.0

Returns
-------
None
") PerformWithBiLo;
		void PerformWithBiLo(const TopoDS_Face & WSP, const Standard_Real Offset, const BRepMAT2d_BisectingLocus & Locus, BRepMAT2d_LinkTopoBilo & Link, const GeomAbs_JoinType Join = GeomAbs_Arc, const Standard_Real Alt = 0.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the generated shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
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
		/****************** BRepFill_Pipe ******************/
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_Pipe;
		 BRepFill_Pipe();

		/****************** BRepFill_Pipe ******************/
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
aMode: GeomFill_Trihedron,optional
	default value is GeomFill_IsCorrectedFrenet
ForceApproxC1: bool,optional
	default value is Standard_False
GeneratePartCase: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepFill_Pipe;
		 BRepFill_Pipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const GeomFill_Trihedron aMode = GeomFill_IsCorrectedFrenet, const Standard_Boolean ForceApproxC1 = Standard_False, const Standard_Boolean GeneratePartCase = Standard_False);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge created from an edge of the spine and a vertex of the profile. if the edge or the vertex are not in the spine or the profile.

Parameters
----------
ESpine: TopoDS_Edge
VProfile: TopoDS_Vertex

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge(const TopoDS_Edge & ESpine, const TopoDS_Vertex & VProfile);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face created from an edge of the spine and an edge of the profile. if the edges are not in the spine or the profile.

Parameters
----------
ESpine: TopoDS_Edge
EProfile: TopoDS_Edge

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face(const TopoDS_Edge & ESpine, const TopoDS_Edge & EProfile);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
None
") Generated;
		void Generated(const TopoDS_Shape & S, TopTools_ListOfShape & L);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape
GeneratePartCase: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile, const Standard_Boolean GeneratePartCase = Standard_False);

		/****************** PipeLine ******************/
		%feature("compactdefaultargs") PipeLine;
		%feature("autodoc", "Create a wire by sweeping the point along the <spine> if the <spine> is undefined.

Parameters
----------
Point: gp_Pnt

Returns
-------
TopoDS_Wire
") PipeLine;
		TopoDS_Wire PipeLine(const gp_Pnt & Point);

		/****************** Profile ******************/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Profile;
		const TopoDS_Shape Profile();

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Returns the shape created from the profile at the position of the vertex vspine. if the vertex is not in the spine.

Parameters
----------
VSpine: TopoDS_Vertex

Returns
-------
TopoDS_Shape
") Section;
		TopoDS_Shape Section(const TopoDS_Vertex & VSpine);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** BRepFill_PipeShell ******************/
		%feature("compactdefaultargs") BRepFill_PipeShell;
		%feature("autodoc", "Set an sweep's mode if no mode are setted, the mode use in makepipe is used.

Parameters
----------
Spine: TopoDS_Wire

Returns
-------
None
") BRepFill_PipeShell;
		 BRepFill_PipeShell(const TopoDS_Wire & Spine);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Set an section. the corespondance with the spine, will be automaticaly performed.

Parameters
----------
Profile: TopoDS_Shape
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & Profile, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Set an section. the corespondance with the spine, is given by <location>.

Parameters
----------
Profile: TopoDS_Shape
Location: TopoDS_Vertex
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & Profile, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the resulting shape (redefined from makeshape).

Returns
-------
bool
") Build;
		Standard_Boolean Build();

		/****************** DeleteProfile ******************/
		%feature("compactdefaultargs") DeleteProfile;
		%feature("autodoc", "Delete an section.

Parameters
----------
Profile: TopoDS_Shape

Returns
-------
None
") DeleteProfile;
		void DeleteProfile(const TopoDS_Shape & Profile);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Returns the topods shape of the bottom of the sweep.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

Parameters
----------
S: TopoDS_Shape
L: TopTools_ListOfShape

Returns
-------
None
") Generated;
		void Generated(const TopoDS_Shape & S, TopTools_ListOfShape & L);

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Get a status, when simulate or build failed.

Returns
-------
GeomFill_PipeError
") GetStatus;
		GeomFill_PipeError GetStatus();

		/****************** IsReady ******************/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "Say if <self> is ready to build the shape return false if <self> do not have section definition.

Returns
-------
bool
") IsReady;
		Standard_Boolean IsReady();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Returns the topods shape of the top of the sweep.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Transform the sweeping shell in solid. if the section are not closed returns false.

Returns
-------
bool
") MakeSolid;
		Standard_Boolean MakeSolid();

		/****************** Profiles ******************/
		%feature("compactdefaultargs") Profiles;
		%feature("autodoc", "Returns the list of original profiles.

Parameters
----------
theProfiles: TopTools_ListOfShape

Returns
-------
None
") Profiles;
		void Profiles(TopTools_ListOfShape & theProfiles);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set an frenet or an correctedfrenet trihedron to perform the sweeping.

Parameters
----------
Frenet: bool,optional
	default value is Standard_False

Returns
-------
None
") Set;
		void Set(const Standard_Boolean Frenet = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set an fixed trihedron to perform the sweeping all sections will be parallel.

Parameters
----------
Axe: gp_Ax2

Returns
-------
None
") Set;
		void Set(const gp_Ax2 & Axe);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set an fixed binormal direction to perform the sweeping.

Parameters
----------
BiNormal: gp_Dir

Returns
-------
None
") Set;
		void Set(const gp_Dir & BiNormal);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set support to the spine to define the binormal at the spine, like the normal the surfaces. warning: to be effective, each edge of the <spine> must have an representaion on one face of<spinesupport>.

Parameters
----------
SpineSupport: TopoDS_Shape

Returns
-------
bool
") Set;
		Standard_Boolean Set(const TopoDS_Shape & SpineSupport);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set an auxiliary spine to define the normal for each point of the spine p, an point q is evalued on <auxiliaryspine> if <curvilinearequivalence> q split <auxiliaryspine> with the same length ratio than p split <spline>. else the plan define by p and the tangent to the <spine> intersect <auxiliaryspine> in q. if <keepcontact> equals brepfill_nocontact: the normal is defined by the vector pq. if <keepcontact> equals brepfill_contact: the normal is defined to achieve that the sweeped section is in contact to the auxiliaryspine. the width of section is constant all along the path. in other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. however, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. if <keepcontact> equals brepfill_contactonborder: the auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path.

Parameters
----------
AuxiliarySpine: TopoDS_Wire
CurvilinearEquivalence: bool,optional
	default value is Standard_True
KeepContact: BRepFill_TypeOfContact,optional
	default value is BRepFill_NoContact

Returns
-------
None
") Set;
		void Set(const TopoDS_Wire & AuxiliarySpine, const Standard_Boolean CurvilinearEquivalence = Standard_True, const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);

		/****************** SetDiscrete ******************/
		%feature("compactdefaultargs") SetDiscrete;
		%feature("autodoc", "Set a discrete trihedron to perform the sweeping.

Returns
-------
None
") SetDiscrete;
		void SetDiscrete();

		/****************** SetForceApproxC1 ******************/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "Set the flag that indicates attempt to approximate a c1-continuous surface if a swept surface proved to be c0. give section to sweep. possibilities are : - give one or sevral profile - give one profile and an homotetic law. - automatic compute of correspondance beetween profile, and section on the sweeped shape - correspondance beetween profile, and section on the sweeped shape defined by a vertex of the spine.

Parameters
----------
ForceApproxC1: bool

Returns
-------
None
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "Set an section and an homotetic law. the homotetie's centers is given by point on the <spine>.

Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "Set an section and an homotetic law. the homotetie center is given by point on the <spine>.

Parameters
----------
Profile: TopoDS_Shape
L: Law_Function
Location: TopoDS_Vertex
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") SetLaw;
		void SetLaw(const TopoDS_Shape & Profile, const opencascade::handle<Law_Function> & L, const TopoDS_Vertex & Location, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** SetMaxDegree ******************/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "Define the maximum v degree of resulting surface.

Parameters
----------
NewMaxDegree: int

Returns
-------
None
") SetMaxDegree;
		void SetMaxDegree(const Standard_Integer NewMaxDegree);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "Define the maximum number of spans in v-direction on resulting surface.

Parameters
----------
NewMaxSegments: int

Returns
-------
None
") SetMaxSegments;
		void SetMaxSegments(const Standard_Integer NewMaxSegments);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol3d: float,optional
	default value is 1.0e-4
BoundTol: float,optional
	default value is 1.0e-4
TolAngular: float,optional
	default value is 1.0e-2

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d = 1.0e-4, const Standard_Real BoundTol = 1.0e-4, const Standard_Real TolAngular = 1.0e-2);

		/****************** SetTransition ******************/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "Set the transition mode to manage discontinuities on the sweep.

Parameters
----------
Mode: BRepFill_TransitionStyle,optional
	default value is BRepFill_Modified
Angmin: float,optional
	default value is 1.0e-2
Angmax: float,optional
	default value is 6.0

Returns
-------
None
") SetTransition;
		void SetTransition(const BRepFill_TransitionStyle Mode = BRepFill_Modified, const Standard_Real Angmin = 1.0e-2, const Standard_Real Angmax = 6.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the result shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "Perform simulation of the sweep : somes section are returned.

Parameters
----------
NumberOfSection: int
Sections: TopTools_ListOfShape

Returns
-------
None
") Simulate;
		void Simulate(const Standard_Integer NumberOfSection, TopTools_ListOfShape & Sections);

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Returns the spine.

Returns
-------
TopoDS_Wire
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
		/****************** BRepFill_Section ******************/
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_Section;
		 BRepFill_Section();

		/****************** BRepFill_Section ******************/
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
Profile: TopoDS_Shape
V: TopoDS_Vertex
WithContact: bool
WithCorrection: bool

Returns
-------
None
") BRepFill_Section;
		 BRepFill_Section(const TopoDS_Shape & Profile, const TopoDS_Vertex & V, const Standard_Boolean WithContact, const Standard_Boolean WithCorrection);

		/****************** IsLaw ******************/
		%feature("compactdefaultargs") IsLaw;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsLaw;
		Standard_Boolean IsLaw();

		/****************** IsPunctual ******************/
		%feature("compactdefaultargs") IsPunctual;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPunctual;
		Standard_Boolean IsPunctual();

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ModifiedShape;
		TopoDS_Shape ModifiedShape(const TopoDS_Shape & theShape);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OriginalShape;
		const TopoDS_Shape OriginalShape();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsLaw: bool

Returns
-------
None
") Set;
		void Set(const Standard_Boolean IsLaw);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

		/****************** WithContact ******************/
		%feature("compactdefaultargs") WithContact;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") WithContact;
		Standard_Boolean WithContact();

		/****************** WithCorrection ******************/
		%feature("compactdefaultargs") WithCorrection;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		/****************** ConcatenedLaw ******************/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_SectionLaw>
") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TolAngular: float

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity(const Standard_Integer Index, const Standard_Real TolAngular);

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") CurrentEdge;
		TopoDS_Edge CurrentEdge();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
S: TopoDS_Shape

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, TopoDS_Shape & S);

		/****************** IndexOfEdge ******************/
		%feature("compactdefaultargs") IndexOfEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
anEdge: TopoDS_Shape

Returns
-------
int
") IndexOfEdge;
		Standard_Integer IndexOfEdge(const TopoDS_Shape & anEdge);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") Init;
		void Init(const TopoDS_Wire & W);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Say if the input shape is a vertex.

Returns
-------
bool
") IsVertex;
		virtual Standard_Boolean IsVertex();

		/****************** Law ******************/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<GeomFill_SectionLaw>
") Law;
		const opencascade::handle<GeomFill_SectionLaw> & Law(const Standard_Integer Index);

		/****************** NbLaw ******************/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLaw;
		Standard_Integer NbLaw();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Param: float

Returns
-------
TopoDS_Vertex
") Vertex;
		virtual TopoDS_Vertex Vertex(const Standard_Integer Index, const Standard_Real Param);

		/****************** VertexTol ******************/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Param: float

Returns
-------
float
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
		/****************** BRepFill_SectionPlacement ******************/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "Automatic placement.

Parameters
----------
Law: BRepFill_LocationLaw
Section: TopoDS_Shape
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement(const opencascade::handle<BRepFill_LocationLaw> & Law, const TopoDS_Shape & Section, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** BRepFill_SectionPlacement ******************/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "Placement on vertex.

Parameters
----------
Law: BRepFill_LocationLaw
Section: TopoDS_Shape
Vertex: TopoDS_Shape
WithContact: bool,optional
	default value is Standard_False
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement(const opencascade::handle<BRepFill_LocationLaw> & Law, const TopoDS_Shape & Section, const TopoDS_Shape & Vertex, const Standard_Boolean WithContact = Standard_False, const Standard_Boolean WithCorrection = Standard_False);

		/****************** AbscissaOnPath ******************/
		%feature("compactdefaultargs") AbscissaOnPath;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") AbscissaOnPath;
		Standard_Real AbscissaOnPath();

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Trsf
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
		/****************** BRepFill_Sweep ******************/
		%feature("compactdefaultargs") BRepFill_Sweep;
		%feature("autodoc", "No available documentation.

Parameters
----------
Section: BRepFill_SectionLaw
Location: BRepFill_LocationLaw
WithKPart: bool

Returns
-------
None
") BRepFill_Sweep;
		 BRepFill_Sweep(const opencascade::handle<BRepFill_SectionLaw> & Section, const opencascade::handle<BRepFill_LocationLaw> & Location, const Standard_Boolean WithKPart);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Build the sweep surface transition define transition strategy approx define approximation strategy - geomfill_section : the composed function location x section is directly approximed. - geomfill_location : the location law is approximed, and the sweepsurface is bulid algebric composition of approximed location law and section law this option is ok, if section.surface() methode is effective. continuity : the continuity in v waiting on the surface degmax : the maximum degree in v requiered on the surface segmax : the maximum number of span in v requiered on the surface.

Parameters
----------
ReversedEdges: TopTools_MapOfShape
Tapes: BRepFill_DataMapOfShapeHArray2OfShape
Rails: BRepFill_DataMapOfShapeHArray2OfShape
Transition: BRepFill_TransitionStyle,optional
	default value is BRepFill_Modified
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Approx: GeomFill_ApproxStyle,optional
	default value is GeomFill_Location
Degmax: int,optional
	default value is 11
Segmax: int,optional
	default value is 30

Returns
-------
None
") Build;
		void Build(TopTools_MapOfShape & ReversedEdges, BRepFill_DataMapOfShapeHArray2OfShape & Tapes, BRepFill_DataMapOfShapeHArray2OfShape & Rails, const BRepFill_TransitionStyle Transition = BRepFill_Modified, const GeomAbs_Shape Continuity = GeomAbs_C2, const GeomFill_ApproxStyle Approx = GeomFill_Location, const Standard_Integer Degmax = 11, const Standard_Integer Segmax = 30);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Get the approximation error.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** InterFaces ******************/
		%feature("compactdefaultargs") InterFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HArray2OfShape>
") InterFaces;
		opencascade::handle<TopTools_HArray2OfShape> InterFaces();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Say if the shape is build.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Sections ******************/
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HArray2OfShape>
") Sections;
		opencascade::handle<TopTools_HArray2OfShape> Sections();

		/****************** SetAngularControl ******************/
		%feature("compactdefaultargs") SetAngularControl;
		%feature("autodoc", "Tolerance to controle corner management. //! if the discontinuity is lesser than <anglemin> in radian the transition performed will be alway 'modified'.

Parameters
----------
AngleMin: float,optional
	default value is 0.01
AngleMax: float,optional
	default value is 6.0

Returns
-------
None
") SetAngularControl;
		void SetAngularControl(const Standard_Real AngleMin = 0.01, const Standard_Real AngleMax = 6.0);

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstShape: TopoDS_Wire
LastShape: TopoDS_Wire

Returns
-------
None
") SetBounds;
		void SetBounds(const TopoDS_Wire & FirstShape, const TopoDS_Wire & LastShape);

		/****************** SetForceApproxC1 ******************/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "Set the flag that indicates attempt to approximate a c1-continuous surface if a swept surface proved to be c0.

Parameters
----------
ForceApproxC1: bool

Returns
-------
None
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Set approximation tolerance tol3d : tolerance to surface approximation tol2d : tolerance used to perform curve approximation normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large tol2d is used. tolangular : tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface.

Parameters
----------
Tol3d: float
BoundTol: float,optional
	default value is 1.0
Tol2d: float,optional
	default value is 1.0e-5
TolAngular: float,optional
	default value is 1.0e-2

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d, const Standard_Real BoundTol = 1.0, const Standard_Real Tol2d = 1.0e-5, const Standard_Real TolAngular = 1.0e-2);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the sweeping shape.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** SubShape ******************/
		%feature("compactdefaultargs") SubShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HArray2OfShape>
") SubShape;
		opencascade::handle<TopTools_HArray2OfShape> SubShape();

		/****************** Tape ******************/
		%feature("compactdefaultargs") Tape;
		%feature("autodoc", "Returns the tape corresponding to index-th edge of section.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
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
		/****************** BRepFill_TrimEdgeTool ******************/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool();

		/****************** BRepFill_TrimEdgeTool ******************/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bisec: Bisector_Bisec
S1: Geom2d_Geometry
S2: Geom2d_Geometry
Offset: float

Returns
-------
None
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool(const Bisector_Bisec & Bisec, const opencascade::handle<Geom2d_Geometry> & S1, const opencascade::handle<Geom2d_Geometry> & S2, const Standard_Real Offset);

		/****************** AddOrConfuse ******************/
		%feature("compactdefaultargs") AddOrConfuse;
		%feature("autodoc", "No available documentation.

Parameters
----------
Start: bool
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Params: TColgp_SequenceOfPnt

Returns
-------
None
") AddOrConfuse;
		void AddOrConfuse(const Standard_Boolean Start, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, TColgp_SequenceOfPnt & Params);

		/****************** IntersectWith ******************/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") IntersectWith;
		void IntersectWith(const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const TopoDS_Shape & InitShape1, const TopoDS_Shape & InitShape2, const TopoDS_Vertex & End1, const TopoDS_Vertex & End2, const GeomAbs_JoinType theJoinType, const Standard_Boolean IsOpenResult, TColgp_SequenceOfPnt & Params);

		/****************** IsInside ******************/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d

Returns
-------
bool
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
		/****************** BRepFill_TrimShellCorner ******************/
		%feature("compactdefaultargs") BRepFill_TrimShellCorner;
		%feature("autodoc", "Constructor: takes faces to intersect, type of transition (it can be rightcorner or roundcorner) and axis of bisector plane.

Parameters
----------
theFaces: TopTools_HArray2OfShape
theTransition: BRepFill_TransitionStyle
theAxeOfBisPlane: gp_Ax2

Returns
-------
None
") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner(const opencascade::handle<TopTools_HArray2OfShape> & theFaces, const BRepFill_TransitionStyle theTransition, const gp_Ax2 & theAxeOfBisPlane);

		/****************** AddBounds ******************/
		%feature("compactdefaultargs") AddBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bounds: TopTools_HArray2OfShape

Returns
-------
None
") AddBounds;
		void AddBounds(const opencascade::handle<TopTools_HArray2OfShape> & Bounds);

		/****************** AddUEdges ******************/
		%feature("compactdefaultargs") AddUEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUEdges: TopTools_HArray2OfShape

Returns
-------
None
") AddUEdges;
		void AddUEdges(const opencascade::handle<TopTools_HArray2OfShape> & theUEdges);

		/****************** AddVEdges ******************/
		%feature("compactdefaultargs") AddVEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
theVEdges: TopTools_HArray2OfShape
theIndex: int

Returns
-------
None
") AddVEdges;
		void AddVEdges(const opencascade::handle<TopTools_HArray2OfShape> & theVEdges, const Standard_Integer theIndex);

		/****************** HasSection ******************/
		%feature("compactdefaultargs") HasSection;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasSection;
		Standard_Boolean HasSection();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
theModified: TopTools_ListOfShape

Returns
-------
None
") Modified;
		void Modified(const TopoDS_Shape & S, TopTools_ListOfShape & theModified);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** BRepFill_TrimSurfaceTool ******************/
		%feature("compactdefaultargs") BRepFill_TrimSurfaceTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
Bis: Geom2d_Curve
Face1: TopoDS_Face
Face2: TopoDS_Face
Edge1: TopoDS_Edge
Edge2: TopoDS_Edge
Inv1: bool
Inv2: bool

Returns
-------
None
") BRepFill_TrimSurfaceTool;
		 BRepFill_TrimSurfaceTool(const opencascade::handle<Geom2d_Curve> & Bis, const TopoDS_Face & Face1, const TopoDS_Face & Face2, const TopoDS_Edge & Edge1, const TopoDS_Edge & Edge2, const Standard_Boolean Inv1, const Standard_Boolean Inv2);

		/****************** IntersectWith ******************/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "Intersect <bis> with the projection of the edges <edgeonfi> and returns the intersecting parameters on bis and on the edges p.x() : parameter on bis p.y() : parameter on edgeonf1 p.z() : parameter on edgeonf2 raises if <edge> is not a edge of face1 or face2.

Parameters
----------
EdgeOnF1: TopoDS_Edge
EdgeOnF2: TopoDS_Edge
Points: TColgp_SequenceOfPnt

Returns
-------
None
") IntersectWith;
		void IntersectWith(const TopoDS_Edge & EdgeOnF1, const TopoDS_Edge & EdgeOnF2, TColgp_SequenceOfPnt & Points);

		/****************** IsOnFace ******************/
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "Returns true if the line (p, dz) intersect the faces.

Parameters
----------
Point: gp_Pnt2d

Returns
-------
bool
") IsOnFace;
		Standard_Boolean IsOnFace(const gp_Pnt2d & Point);

		/****************** ProjOn ******************/
		%feature("compactdefaultargs") ProjOn;
		%feature("autodoc", "Returns the parameter of the point <point> on the edge <edge>, assuming that the point is on the edge.

Parameters
----------
Point: gp_Pnt2d
Edge: TopoDS_Edge

Returns
-------
float
") ProjOn;
		Standard_Real ProjOn(const gp_Pnt2d & Point, const TopoDS_Edge & Edge);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "No available documentation.

Parameters
----------
U1: float
U2: float
Curve: Geom_Curve
PCurve1: Geom2d_Curve
PCurve2: Geom2d_Curve
myCont: GeomAbs_Shape

Returns
-------
None
") Project;
		void Project(const Standard_Real U1, const Standard_Real U2, opencascade::handle<Geom_Curve> & Curve, opencascade::handle<Geom2d_Curve> & PCurve1, opencascade::handle<Geom2d_Curve> & PCurve2, GeomAbs_Shape & myCont);

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
		/****************** BRepFill_ACRLaw ******************/
		%feature("compactdefaultargs") BRepFill_ACRLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Wire
Law: GeomFill_LocationGuide

Returns
-------
None
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
		/****************** BRepFill_Edge3DLaw ******************/
		%feature("compactdefaultargs") BRepFill_Edge3DLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Wire
Law: GeomFill_LocationLaw

Returns
-------
None
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
		/****************** BRepFill_EdgeOnSurfLaw ******************/
		%feature("compactdefaultargs") BRepFill_EdgeOnSurfLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Wire
Surf: TopoDS_Shape

Returns
-------
None
") BRepFill_EdgeOnSurfLaw;
		 BRepFill_EdgeOnSurfLaw(const TopoDS_Wire & Path, const TopoDS_Shape & Surf);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns <false> if one edge of <path> do not have representation on <surf>. in this case it is impossible to use this object.

Returns
-------
bool
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
		/****************** BRepFill_NSections ******************/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "Construct.

Parameters
----------
S: TopTools_SequenceOfShape
Build: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepFill_NSections;
		 BRepFill_NSections(const TopTools_SequenceOfShape & S, const Standard_Boolean Build = Standard_True);

		/****************** BRepFill_NSections ******************/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "Construct.

Parameters
----------
S: TopTools_SequenceOfShape
Trsfs: GeomFill_SequenceOfTrsf
P: TColStd_SequenceOfReal
VF: float
VL: float
Build: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepFill_NSections;
		 BRepFill_NSections(const TopTools_SequenceOfShape & S, const GeomFill_SequenceOfTrsf & Trsfs, const TColStd_SequenceOfReal & P, const Standard_Real VF, const Standard_Real VL, const Standard_Boolean Build = Standard_True);

		/****************** ConcatenedLaw ******************/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Give the law build on a concatened section.

Returns
-------
opencascade::handle<GeomFill_SectionLaw>
") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TolAngular: float

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity(const Standard_Integer Index, const Standard_Real TolAngular);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
S: TopoDS_Shape

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real Param, TopoDS_Shape & S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Say if the input shape is a vertex.

Returns
-------
bool
") IsVertex;
		virtual Standard_Boolean IsVertex();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Param: float

Returns
-------
TopoDS_Vertex
") Vertex;
		virtual TopoDS_Vertex Vertex(const Standard_Integer Index, const Standard_Real Param);

		/****************** VertexTol ******************/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Param: float

Returns
-------
float
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
		/****************** BRepFill_ShapeLaw ******************/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "Construct an constant law.

Parameters
----------
V: TopoDS_Vertex
Build: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Vertex & V, const Standard_Boolean Build = Standard_True);

		/****************** BRepFill_ShapeLaw ******************/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "Construct an constant law.

Parameters
----------
W: TopoDS_Wire
Build: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Wire & W, const Standard_Boolean Build = Standard_True);

		/****************** BRepFill_ShapeLaw ******************/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "Construct an evolutive law.

Parameters
----------
W: TopoDS_Wire
L: Law_Function
Build: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw(const TopoDS_Wire & W, const opencascade::handle<Law_Function> & L, const Standard_Boolean Build = Standard_True);

		/****************** ConcatenedLaw ******************/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "Give the law build on a concaneted section.

Returns
-------
opencascade::handle<GeomFill_SectionLaw>
") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TolAngular: float

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity(const Standard_Integer Index, const Standard_Real TolAngular);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
S: TopoDS_Shape

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real Param, TopoDS_Shape & S);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer Index);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Say if the input shape is a vertex.

Returns
-------
bool
") IsVertex;
		virtual Standard_Boolean IsVertex();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Param: float

Returns
-------
TopoDS_Vertex
") Vertex;
		virtual TopoDS_Vertex Vertex(const Standard_Integer Index, const Standard_Real Param);

		/****************** VertexTol ******************/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
Param: float

Returns
-------
float
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
		/****************** BRepFill_DraftLaw ******************/
		%feature("compactdefaultargs") BRepFill_DraftLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: TopoDS_Wire
Law: GeomFill_LocationDraft

Returns
-------
None
") BRepFill_DraftLaw;
		 BRepFill_DraftLaw(const TopoDS_Wire & Path, const opencascade::handle<GeomFill_LocationDraft> & Law);

		/****************** CleanLaw ******************/
		%feature("compactdefaultargs") CleanLaw;
		%feature("autodoc", "To clean the little discontinuities.

Parameters
----------
TolAngular: float

Returns
-------
None
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
