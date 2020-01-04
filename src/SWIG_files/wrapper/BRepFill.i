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
#include<TColgp_module.hxx>
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
%import TColgp.i
%import Bisector.i
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
%template(BRepFill_IndexedDataMapOfOrientedShapeListOfShape) NCollection_IndexedDataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_OrientedShapeMapHasher>;
%template(BRepFill_DataMapOfShapeHArray2OfShape) NCollection_DataMap <TopoDS_Shape , opencascade::handle <TopTools_HArray2OfShape>, TopTools_ShapeMapHasher>;
%template(BRepFill_ListOfOffsetWire) NCollection_List <BRepFill_OffsetWire>;
%template(BRepFill_ListIteratorOfListOfOffsetWire) NCollection_TListIterator<BRepFill_OffsetWire>;
%template(BRepFill_DataMapOfShapeSequenceOfPnt) NCollection_DataMap <TopoDS_Shape , TColgp_SequenceOfPnt , TopTools_ShapeMapHasher>;
%template(BRepFill_DataMapOfNodeDataMapOfShapeShape) NCollection_DataMap <opencascade::handle <MAT_Node>, TopTools_DataMapOfShapeShape , TColStd_MapTransientHasher>;
%template(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape) NCollection_DataMap <TopoDS_Shape , TopTools_DataMapOfShapeListOfShape , TopTools_ShapeMapHasher>;
%template(BRepFill_SequenceOfSection) NCollection_Sequence <BRepFill_Section>;
%template(BRepFill_DataMapOfOrientedShapeListOfShape) NCollection_DataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_OrientedShapeMapHasher>;
%template(BRepFill_DataMapOfNodeShape) NCollection_DataMap <opencascade::handle <MAT_Node>, TopoDS_Shape , TColStd_MapTransientHasher>;
%template(BRepFill_SequenceOfFaceAndOrder) NCollection_Sequence <BRepFill_FaceAndOrder>;
%template(BRepFill_DataMapOfShapeSequenceOfReal) NCollection_DataMap <TopoDS_Shape , TColStd_SequenceOfReal , TopTools_ShapeMapHasher>;
%template(BRepFill_SequenceOfEdgeFaceAndOrder) NCollection_Sequence <BRepFill_EdgeFaceAndOrder>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_OrientedShapeMapHasher> BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <TopTools_HArray2OfShape>, TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeHArray2OfShape;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <TopTools_HArray2OfShape>, TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
typedef NCollection_List <BRepFill_OffsetWire> BRepFill_ListOfOffsetWire;
typedef NCollection_List <BRepFill_OffsetWire>::Iterator BRepFill_ListIteratorOfListOfOffsetWire;
typedef NCollection_DataMap <TopoDS_Shape , TColgp_SequenceOfPnt , TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeSequenceOfPnt;
typedef NCollection_DataMap <TopoDS_Shape , TColgp_SequenceOfPnt , TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
typedef NCollection_DataMap <opencascade::handle <MAT_Node>, TopTools_DataMapOfShapeShape , TColStd_MapTransientHasher> BRepFill_DataMapOfNodeDataMapOfShapeShape;
typedef NCollection_DataMap <opencascade::handle <MAT_Node>, TopTools_DataMapOfShapeShape , TColStd_MapTransientHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_DataMapOfShapeListOfShape , TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_DataMapOfShapeListOfShape , TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
typedef NCollection_Sequence <BRepFill_Section> BRepFill_SequenceOfSection;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_OrientedShapeMapHasher> BRepFill_DataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TopTools_ListOfShape , TopTools_OrientedShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
typedef NCollection_DataMap <opencascade::handle <MAT_Node>, TopoDS_Shape , TColStd_MapTransientHasher> BRepFill_DataMapOfNodeShape;
typedef NCollection_DataMap <opencascade::handle <MAT_Node>, TopoDS_Shape , TColStd_MapTransientHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfNodeShape;
typedef NCollection_Sequence <BRepFill_FaceAndOrder> BRepFill_SequenceOfFaceAndOrder;
typedef NCollection_DataMap <TopoDS_Shape , TColStd_SequenceOfReal , TopTools_ShapeMapHasher> BRepFill_DataMapOfShapeSequenceOfReal;
typedef NCollection_DataMap <TopoDS_Shape , TColStd_SequenceOfReal , TopTools_ShapeMapHasher>::Iterator BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
typedef NCollection_Sequence <BRepFill_EdgeFaceAndOrder> BRepFill_SequenceOfEdgeFaceAndOrder;
/* end typedefs declaration */

/*****************
* class BRepFill *
*****************/
%rename(brepfill) BRepFill;
class BRepFill {
	public:
		/****************** Axe ******************/
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "* Computes <AxeProf> as Follow. <Location> is the Position of the nearest vertex V of <Profile> to <Spine>.<XDirection> is confused with the tangent to <Spine> at the projected point of V on the Spine. <Direction> is normal to <Spine>. <Spine> is a plane wire or a plane face.
	:param Spine:
	:type Spine: TopoDS_Shape
	:param Profile:
	:type Profile: TopoDS_Wire
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param ProfOnSpine:
	:type ProfOnSpine: bool
	:param Tol:
	:type Tol: float
	:rtype: void") Axe;
		static void Axe (const TopoDS_Shape & Spine,const TopoDS_Wire & Profile,gp_Ax3 & AxeProf,Standard_Boolean &OutValue,const Standard_Real Tol);

		/****************** ComputeACR ******************/
		%feature("compactdefaultargs") ComputeACR;
		%feature("autodoc", "* Compute ACR on a wire
	:param wire:
	:type wire: TopoDS_Wire
	:param ACR:
	:type ACR: TColStd_Array1OfReal
	:rtype: void") ComputeACR;
		static void ComputeACR (const TopoDS_Wire & wire,TColStd_Array1OfReal & ACR);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Computes a ruled surface between two edges.
	:param Edge1:
	:type Edge1: TopoDS_Edge
	:param Edge2:
	:type Edge2: TopoDS_Edge
	:rtype: TopoDS_Face") Face;
		static TopoDS_Face Face (const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2);

		/****************** InsertACR ******************/
		%feature("compactdefaultargs") InsertACR;
		%feature("autodoc", "* Insert ACR on a wire
	:param wire:
	:type wire: TopoDS_Wire
	:param ACRcuts:
	:type ACRcuts: TColStd_Array1OfReal
	:param prec:
	:type prec: float
	:rtype: TopoDS_Wire") InsertACR;
		static TopoDS_Wire InsertACR (const TopoDS_Wire & wire,const TColStd_Array1OfReal & ACRcuts,const Standard_Real prec);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "* Computes a ruled surface between two wires. The wires must have the same number of edges.
	:param Wire1:
	:type Wire1: TopoDS_Wire
	:param Wire2:
	:type Wire2: TopoDS_Wire
	:rtype: TopoDS_Shell") Shell;
		static TopoDS_Shell Shell (const TopoDS_Wire & Wire1,const TopoDS_Wire & Wire2);

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
		DEFINE_STANDARD_ALLOC ;
		/****************** BRepFill_AdvancedEvolved ******************/
		%feature("compactdefaultargs") BRepFill_AdvancedEvolved;
		%feature("autodoc", "* Constructor
	:rtype: None") BRepFill_AdvancedEvolved;
		 BRepFill_AdvancedEvolved ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":param theErrorCode: default value is 0
	:type theErrorCode: unsigned int *
	:rtype: bool") IsDone;
		Standard_Boolean IsDone (unsigned int * theErrorCode = 0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param theSpine:
	:type theSpine: TopoDS_Wire
	:param theProfile:
	:type theProfile: TopoDS_Wire
	:param theTolerance:
	:type theTolerance: float
	:param theSolidReq: default value is Standard_True
	:type theSolidReq: bool
	:rtype: None") Perform;
		void Perform (const TopoDS_Wire & theSpine,const TopoDS_Wire & theProfile,const Standard_Real theTolerance,const Standard_Boolean theSolidReq = Standard_True);

		/****************** SetParallelMode ******************/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "* Sets/Unsets computation in parallel mode
	:param theVal:
	:type theVal: bool
	:rtype: None") SetParallelMode;
		void SetParallelMode (const Standard_Boolean theVal);

		/****************** SetTemporaryDirectory ******************/
		%feature("compactdefaultargs") SetTemporaryDirectory;
		%feature("autodoc", "* Sets directory where the debug shapes will be saved
	:param thePath:
	:type thePath: char *
	:rtype: None") SetTemporaryDirectory;
		void SetTemporaryDirectory (const char * & thePath);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the resulting shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

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
		%feature("autodoc", ":rtype: None") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing ();

		/****************** BRepFill_ApproxSeewing ******************/
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", ":param ML:
	:type ML: BRepFill_MultiLine
	:rtype: None") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing (const BRepFill_MultiLine & ML);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* returns the approximation of the 3d Curve
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		const opencascade::handle<Geom_Curve> & Curve ();

		/****************** CurveOnF1 ******************/
		%feature("compactdefaultargs") CurveOnF1;
		%feature("autodoc", "* returns the approximation of the PCurve on the first face of the MultiLine
	:rtype: opencascade::handle<Geom2d_Curve>") CurveOnF1;
		const opencascade::handle<Geom2d_Curve> & CurveOnF1 ();

		/****************** CurveOnF2 ******************/
		%feature("compactdefaultargs") CurveOnF2;
		%feature("autodoc", "* returns the approximation of the PCurve on the first face of the MultiLine
	:rtype: opencascade::handle<Geom2d_Curve>") CurveOnF2;
		const opencascade::handle<Geom2d_Curve> & CurveOnF2 ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param ML:
	:type ML: BRepFill_MultiLine
	:rtype: None") Perform;
		void Perform (const BRepFill_MultiLine & ML);

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
		%feature("autodoc", ":rtype: None") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires ();

		/****************** BRepFill_CompatibleWires ******************/
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", ":param Sections:
	:type Sections: TopTools_SequenceOfShape
	:rtype: None") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires (const TopTools_SequenceOfShape & Sections);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", ":rtype: TopTools_DataMapOfShapeListOfShape") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "* Returns the shapes created from a subshape <SubSection> of a section.
	:param SubSection:
	:type SubSection: TopoDS_Edge
	:rtype: TopTools_ListOfShape") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Edge & SubSection);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Sections:
	:type Sections: TopTools_SequenceOfShape
	:rtype: None") Init;
		void Init (const TopTools_SequenceOfShape & Sections);

		/****************** IsDegeneratedFirstSection ******************/
		%feature("compactdefaultargs") IsDegeneratedFirstSection;
		%feature("autodoc", ":rtype: bool") IsDegeneratedFirstSection;
		Standard_Boolean IsDegeneratedFirstSection ();

		/****************** IsDegeneratedLastSection ******************/
		%feature("compactdefaultargs") IsDegeneratedLastSection;
		%feature("autodoc", ":rtype: bool") IsDegeneratedLastSection;
		Standard_Boolean IsDegeneratedLastSection ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs CompatibleWires According to the orientation and the origin of each other
	:param WithRotation: default value is Standard_True
	:type WithRotation: bool
	:rtype: None") Perform;
		void Perform (const Standard_Boolean WithRotation = Standard_True);

		/****************** SetPercent ******************/
		%feature("compactdefaultargs") SetPercent;
		%feature("autodoc", ":param percent: default value is 0.01
	:type percent: float
	:rtype: None") SetPercent;
		void SetPercent (const Standard_Real percent = 0.01);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the generated sequence.
	:rtype: TopTools_SequenceOfShape") Shape;
		const TopTools_SequenceOfShape & Shape ();

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
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
	:param Line:
	:type Line: BRepFill_MultiLine
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-5
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-5
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine (const BRepFill_MultiLine & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** BRepFill_ComputeCLine ******************/
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "* Initializes the fields of the algorithm.
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-05
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-05
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the tolerances 2d and 3d of the <Index> MultiCurve.
	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
	:rtype: bool") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "* returns False if the status NoPointsAdded has been sent.
	:rtype: bool") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "* Returns the number of MultiCurve doing the approximation of the MultiLine.
	:rtype: int") NbMultiCurves;
		Standard_Integer NbMultiCurves ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param firstp:
	:type firstp: float
	:param lastp:
	:type lastp: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* runs the algorithm after having initialized the fields.
	:param Line:
	:type Line: BRepFill_MultiLine
	:rtype: None") Perform;
		void Perform (const BRepFill_MultiLine & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "* Changes the constraints of the approximation.
	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "* changes the degrees of the approximation.
	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "* Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
	:param theInvOrder:
	:type theInvOrder: bool
	:rtype: None") SetInvOrder;
		void SetInvOrder (const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Changes the max number of segments, which is allowed for cutting.
	:param theMaxSegments:
	:type theMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "* Changes the tolerances of the approximation.
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the approximation MultiCurve of range <Index>.
	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);

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
		%feature("autodoc", "* Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion.
	:param Boundary:
	:type Boundary: Adaptor3d_HCurveOnSurface
	:param Order:
	:type Order: int
	:param NPt: default value is 10
	:type NPt: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:rtype: None") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint (const opencascade::handle<Adaptor3d_HCurveOnSurface> & Boundary,const Standard_Integer Order,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);

		/****************** BRepFill_CurveConstraint ******************/
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", ":param Boundary:
	:type Boundary: Adaptor3d_HCurve
	:param Tang:
	:type Tang: int
	:param NPt: default value is 10
	:type NPt: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:rtype: None") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint (const opencascade::handle<Adaptor3d_HCurve> & Boundary,const Standard_Integer Tang,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001);

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
		%feature("autodoc", ":param Shape:
	:type Shape: TopoDS_Shape
	:param Dir:
	:type Dir: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None") BRepFill_Draft;
		 BRepFill_Draft (const TopoDS_Shape & Shape,const gp_Dir & Dir,const Standard_Real Angle);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param LengthMax:
	:type LengthMax: float
	:rtype: None") Perform;
		void Perform (const Standard_Real LengthMax);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Surface:
	:type Surface: Geom_Surface
	:param KeepInsideSurface: default value is Standard_True
	:type KeepInsideSurface: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Geom_Surface> & Surface,const Standard_Boolean KeepInsideSurface = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param StopShape:
	:type StopShape: TopoDS_Shape
	:param KeepOutSide: default value is Standard_True
	:type KeepOutSide: bool
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & StopShape,const Standard_Boolean KeepOutSide = Standard_True);

		/****************** SetDraft ******************/
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", ":param IsInternal: default value is Standard_False
	:type IsInternal: bool
	:rtype: None") SetDraft;
		void SetDraft (const Standard_Boolean IsInternal = Standard_False);

		/****************** SetOptions ******************/
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", ":param Style: default value is BRepFill_Right
	:type Style: BRepFill_TransitionStyle
	:param AngleMin: default value is 0.01
	:type AngleMin: float
	:param AngleMax: default value is 3.0
	:type AngleMax: float
	:rtype: None") SetOptions;
		void SetOptions (const BRepFill_TransitionStyle Style = BRepFill_Right,const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 3.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "* Returns the draft surface To have the complete shape you have to use the Shape() methode.
	:rtype: TopoDS_Shell") Shell;
		TopoDS_Shell Shell ();

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
		%feature("autodoc", ":rtype: None") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder ();

		/****************** BRepFill_EdgeFaceAndOrder ******************/
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", ":param anEdge:
	:type anEdge: TopoDS_Edge
	:param aFace:
	:type aFace: TopoDS_Face
	:param anOrder:
	:type anOrder: GeomAbs_Shape
	:rtype: None") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder (const TopoDS_Edge & anEdge,const TopoDS_Face & aFace,const GeomAbs_Shape anOrder);

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
		%feature("autodoc", ":rtype: None") BRepFill_Evolved;
		 BRepFill_Evolved ();

		/****************** BRepFill_Evolved ******************/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "* Creates an evolved shape by sweeping the <Profile> along the <Spine>. <AxeProf> is used to set the position of <Profile> along <Spine> as follows: <AxeProf> slides on the profile with direction colinear to the normal to <Spine>, and its <XDirection> mixed with the tangent to <Spine>.
	:param Spine:
	:type Spine: TopoDS_Wire
	:param Profile:
	:type Profile: TopoDS_Wire
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None") BRepFill_Evolved;
		 BRepFill_Evolved (const TopoDS_Wire & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);

		/****************** BRepFill_Evolved ******************/
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "* Creates an evolved shape by sweeping the <Profile> along the <Spine>
	:param Spine:
	:type Spine: TopoDS_Face
	:param Profile:
	:type Profile: TopoDS_Wire
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None") BRepFill_Evolved;
		 BRepFill_Evolved (const TopoDS_Face & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);

		/****************** Bottom ******************/
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "* Return the face Bottom if <Solid> is True in the constructor.
	:rtype: TopoDS_Shape") Bottom;
		const TopoDS_Shape  Bottom ();

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "* Returns the shapes created from a subshape <SpineShape> of the spine and a subshape <ProfShape> on the profile.
	:param SpineShape:
	:type SpineShape: TopoDS_Shape
	:param ProfShape:
	:type ProfShape: TopoDS_Shape
	:rtype: TopTools_ListOfShape") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape,const TopoDS_Shape & ProfShape);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** JoinType ******************/
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", ":rtype: GeomAbs_JoinType") JoinType;
		GeomAbs_JoinType JoinType ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs an evolved shape by sweeping the <Profile> along the <Spine>
	:param Spine:
	:type Spine: TopoDS_Wire
	:param Profile:
	:type Profile: TopoDS_Wire
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None") Perform;
		void Perform (const TopoDS_Wire & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs an evolved shape by sweeping the <Profile> along the <Spine>
	:param Spine:
	:type Spine: TopoDS_Face
	:param Profile:
	:type Profile: TopoDS_Wire
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None") Perform;
		void Perform (const TopoDS_Face & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the generated shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Top ******************/
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "* Return the face Top if <Solid> is True in the constructor.
	:rtype: TopoDS_Shape") Top;
		const TopoDS_Shape  Top ();

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
		%feature("autodoc", ":rtype: None") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder ();

		/****************** BRepFill_FaceAndOrder ******************/
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", ":param aFace:
	:type aFace: TopoDS_Face
	:param anOrder:
	:type anOrder: GeomAbs_Shape
	:rtype: None") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder (const TopoDS_Face & aFace,const GeomAbs_Shape anOrder);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0 : the surface has to pass by 3D representation of the edge GeomAbs_G1 : the surface has to pass by 3D representation of the edge and to respect tangency with the first face of the edge GeomAbs_G2 : the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the first face of the edge.
	:param anEdge:
	:type anEdge: TopoDS_Edge
	:param Order:
	:type Order: GeomAbs_Shape
	:param IsBound: default value is Standard_True
	:type IsBound: bool
	:rtype: int") Add;
		Standard_Integer Add (const TopoDS_Edge & anEdge,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0 : the surface has to pass by 3D representation of the edge GeomAbs_G1 : the surface has to pass by 3D representation of the edge and to respect tangency with the given face GeomAbs_G2 : the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the given face.
	:param anEdge:
	:type anEdge: TopoDS_Edge
	:param Support:
	:type Support: TopoDS_Face
	:param Order:
	:type Order: GeomAbs_Shape
	:param IsBound: default value is Standard_True
	:type IsBound: bool
	:rtype: int") Add;
		Standard_Integer Add (const TopoDS_Edge & anEdge,const TopoDS_Face & Support,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a free constraint on a face. The corresponding edge has to be automatically recomputed. It is always a bound.
	:param Support:
	:type Support: TopoDS_Face
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: int") Add;
		Standard_Integer Add (const TopoDS_Face & Support,const GeomAbs_Shape Order);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a punctual constraint
	:param Point:
	:type Point: gp_Pnt
	:rtype: int") Add;
		Standard_Integer Add (const gp_Pnt & Point);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a punctual constraint.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Support:
	:type Support: TopoDS_Face
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: int") Add;
		Standard_Integer Add (const Standard_Real U,const Standard_Real V,const TopoDS_Face & Support,const GeomAbs_Shape Order);

		/****************** BRepFill_Filling ******************/
		%feature("compactdefaultargs") BRepFill_Filling;
		%feature("autodoc", "* Constructor
	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 15
	:type NbPtsOnCur: int
	:param NbIter: default value is 2
	:type NbIter: int
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:param MaxDeg: default value is 8
	:type MaxDeg: int
	:param MaxSegments: default value is 9
	:type MaxSegments: int
	:rtype: None") BRepFill_Filling;
		 BRepFill_Filling (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the resulting faces
	:rtype: None") Build;
		void Build ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		TopoDS_Face Face ();

		/****************** G0Error ******************/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", ":rtype: float") G0Error;
		Standard_Real G0Error ();

		/****************** G0Error ******************/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: float") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);

		/****************** G1Error ******************/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", ":rtype: float") G1Error;
		Standard_Real G1Error ();

		/****************** G1Error ******************/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: float") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);

		/****************** G2Error ******************/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", ":rtype: float") G2Error;
		Standard_Real G2Error ();

		/****************** G2Error ******************/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: float") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LoadInitSurface ******************/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "* Loads the initial Surface The initial surface must have orthogonal local coordinates, i.e. partial derivatives dS/du and dS/dv must be orthogonal at each point of surface. If this condition breaks, distortions of resulting surface are possible.
	:param aFace:
	:type aFace: TopoDS_Face
	:rtype: None") LoadInitSurface;
		void LoadInitSurface (const TopoDS_Face & aFace);

		/****************** SetApproxParam ******************/
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "* Sets the parameters used for approximation of the surface
	:param MaxDeg: default value is 8
	:type MaxDeg: int
	:param MaxSegments: default value is 9
	:type MaxSegments: int
	:rtype: None") SetApproxParam;
		void SetApproxParam (const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);

		/****************** SetConstrParam ******************/
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "* Sets the values of Tolerances used to control the constraint. Tol2d: Tol3d: it is the maximum distance allowed between the support surface and the constraints TolAng: it is the maximum angle allowed between the normal of the surface and the constraints TolCurv: it is the maximum difference of curvature allowed between the surface and the constraint
	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:rtype: None") SetConstrParam;
		void SetConstrParam (const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);

		/****************** SetResolParam ******************/
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "* Sets the parameters used for resolution. The default values of these parameters have been chosen for a good ratio quality/performance. Degree: it is the order of energy criterion to minimize for computing the deformation of the surface. The default value is 3 The recommanded value is i+2 where i is the maximum order of the constraints. NbPtsOnCur: it is the average number of points for discretisation of the edges. NbIter: it is the maximum number of iterations of the process. For each iteration the number of discretisation points is increased. Anisotropie:
	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 15
	:type NbPtsOnCur: int
	:param NbIter: default value is 2
	:type NbIter: int
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:rtype: None") SetResolParam;
		void SetResolParam (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False);

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
		/****************** AddWire ******************/
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", ":param Wire:
	:type Wire: TopoDS_Wire
	:rtype: None") AddWire;
		void AddWire (const TopoDS_Wire & Wire);

		/****************** BRepFill_Generator ******************/
		%feature("compactdefaultargs") BRepFill_Generator;
		%feature("autodoc", ":rtype: None") BRepFill_Generator;
		 BRepFill_Generator ();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns all the shapes created
	:rtype: TopTools_DataMapOfShapeListOfShape") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "* Returns the shapes created from a subshape <SSection> of a section.
	:param SSection:
	:type SSection: TopoDS_Shape
	:rtype: TopTools_ListOfShape") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SSection);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the shell.
	:rtype: None") Perform;
		void Perform ();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", ":rtype: TopoDS_Shell") Shell;
		const TopoDS_Shell  Shell ();

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
		%feature("autodoc", "* Return the curvilinear abscissa corresponding to a point of the path, defined by <Index> of Edge and a parameter on the edge.
	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float") Abscissa;
		Standard_Real Abscissa (const Standard_Integer Index,const Standard_Real Param);

		/****************** CurvilinearBounds ******************/
		%feature("compactdefaultargs") CurvilinearBounds;
		%feature("autodoc", "* Return the Curvilinear Bounds of the <Index> Law
	:param Index:
	:type Index: int
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") CurvilinearBounds;
		void CurvilinearBounds (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Apply the Law to a shape, for a given Curnilinear abscissa
	:param Abscissa:
	:type Abscissa: float
	:param Section:
	:type Section: TopoDS_Shape
	:rtype: None") D0;
		void D0 (const Standard_Real Abscissa,TopoDS_Shape & Section);

		/****************** DeleteTransform ******************/
		%feature("compactdefaultargs") DeleteTransform;
		%feature("autodoc", ":rtype: None") DeleteTransform;
		void DeleteTransform ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Return the Edge of rank <Index> in the path <Index> have to be in [1, NbLaw()]
	:param Index:
	:type Index: int
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer Index);

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "* Return a error status, if the status is not PipeOk then it exist a parameter tlike the law is not valuable for t.
	:rtype: GeomFill_PipeError") GetStatus;
		GeomFill_PipeError GetStatus ();

		/****************** Holes ******************/
		%feature("compactdefaultargs") Holes;
		%feature("autodoc", ":param Interval:
	:type Interval: TColStd_Array1OfInteger
	:rtype: None") Holes;
		void Holes (TColStd_Array1OfInteger & Interval);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsG1 ******************/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "* Compute the Law's continuity beetween 2 edges of the path The result can be : -1 : Case Not connex 0 : It is connex (G0) 1 : It is tangent (G1)
	:param Index:
	:type Index: int
	:param SpatialTolerance: default value is 1.0e-7
	:type SpatialTolerance: float
	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: int") IsG1;
		Standard_Integer IsG1 (const Standard_Integer Index,const Standard_Real SpatialTolerance = 1.0e-7,const Standard_Real AngularTolerance = 1.0e-4);

		/****************** Law ******************/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "* Return the elementary Law of rank <Index> <Index> have to be in [1, NbLaw()]
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<GeomFill_LocationLaw>") Law;
		const opencascade::handle<GeomFill_LocationLaw> & Law (const Standard_Integer Index);

		/****************** NbHoles ******************/
		%feature("compactdefaultargs") NbHoles;
		%feature("autodoc", ":param Tol: default value is 1.0e-7
	:type Tol: float
	:rtype: int") NbHoles;
		Standard_Integer NbHoles (const Standard_Real Tol = 1.0e-7);

		/****************** NbLaw ******************/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "* Return the number of elementary Law
	:rtype: int") NbLaw;
		Standard_Integer NbLaw ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Find the index Law and the parmaeter, for a given Curnilinear abscissa
	:param Abscissa:
	:type Abscissa: float
	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Real Abscissa,Standard_Integer &OutValue,Standard_Real &OutValue);

		/****************** PerformVertex ******************/
		%feature("compactdefaultargs") PerformVertex;
		%feature("autodoc", "* Compute <OutputVertex> like a transformation of <InputVertex> the transformation is given by evaluation of the location law in the vertex of rank <Index>. <Location> is used to manage discontinuities : - -1 : The law before the vertex is used. - 1 : The law after the vertex is used. - 0 : Average of the both laws is used.
	:param Index:
	:type Index: int
	:param InputVertex:
	:type InputVertex: TopoDS_Vertex
	:param TolMin:
	:type TolMin: float
	:param OutputVertex:
	:type OutputVertex: TopoDS_Vertex
	:param Location: default value is 0
	:type Location: int
	:rtype: None") PerformVertex;
		void PerformVertex (const Standard_Integer Index,const TopoDS_Vertex & InputVertex,const Standard_Real TolMin,TopoDS_Vertex & OutputVertex,const Standard_Integer Location = 0);

		/****************** TransformInCompatibleLaw ******************/
		%feature("compactdefaultargs") TransformInCompatibleLaw;
		%feature("autodoc", "* Apply a linear transformation on each law, to reduce the dicontinuities of law at one rotation.
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: void") TransformInCompatibleLaw;
		virtual void TransformInCompatibleLaw (const Standard_Real AngularTolerance);

		/****************** TransformInG0Law ******************/
		%feature("compactdefaultargs") TransformInG0Law;
		%feature("autodoc", "* Apply a linear transformation on each law, to have continuity of the global law beetween the edges.
	:rtype: void") TransformInG0Law;
		virtual void TransformInG0Law ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Return the vertex of rank <Index> in the path <Index> have to be in [0, NbLaw()]
	:param Index:
	:type Index: int
	:rtype: TopoDS_Vertex") Vertex;
		TopoDS_Vertex Vertex (const Standard_Integer Index);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* return the path
	:rtype: TopoDS_Wire") Wire;
		const TopoDS_Wire  Wire ();

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
		%feature("autodoc", ":rtype: None") BRepFill_MultiLine;
		 BRepFill_MultiLine ();

		/****************** BRepFill_MultiLine ******************/
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", ":param Face1:
	:type Face1: TopoDS_Face
	:param Face2:
	:type Face2: TopoDS_Face
	:param Edge1:
	:type Edge1: TopoDS_Edge
	:param Edge2:
	:type Edge2: TopoDS_Edge
	:param Inv1:
	:type Inv1: bool
	:param Inv2:
	:type Inv2: bool
	:param Bissec:
	:type Bissec: Geom2d_Curve
	:rtype: None") BRepFill_MultiLine;
		 BRepFill_MultiLine (const TopoDS_Face & Face1,const TopoDS_Face & Face2,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Boolean Inv1,const Standard_Boolean Inv2,const opencascade::handle<Geom2d_Curve> & Bissec);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity betwwen the two faces seShape from GeomAbsparated by myBis.
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "* raises if IsParticularCase is <False>.
	:param Curve:
	:type Curve: Geom_Curve
	:param PCurve1:
	:type PCurve1: Geom2d_Curve
	:param PCurve2:
	:type PCurve2: Geom2d_Curve
	:rtype: None") Curves;
		void Curves (opencascade::handle<Geom_Curve> & Curve,opencascade::handle<Geom2d_Curve> & PCurve1,opencascade::handle<Geom2d_Curve> & PCurve2);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Returns the derivative at parameter <theU>.
	:param theU:
	:type theU: float
	:param theVec2d:
	:type theVec2d: NCollection_Array1<gp_Vec2d>
	:param theVec:
	:type theVec: NCollection_Array1<gp_Vec>
	:rtype: bool") D1;
		virtual Standard_Boolean D1 (const Standard_Real theU,NCollection_Array1<gp_Vec2d> & theVec2d,NCollection_Array1<gp_Vec> & theVec);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* returns the first parameter of the Bissectrice.
	:rtype: float") FirstParameter;
		virtual Standard_Real FirstParameter ();

		/****************** IsParticularCase ******************/
		%feature("compactdefaultargs") IsParticularCase;
		%feature("autodoc", "* Search if the Projection of the Bissectrice on the faces needs an approximation or not. Returns true if the approximation is not needed.
	:rtype: bool") IsParticularCase;
		Standard_Boolean IsParticularCase ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* returns the last parameter of the Bissectrice.
	:rtype: float") LastParameter;
		virtual Standard_Real LastParameter ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current point on the 3d curve
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point at parameter <theU>.
	:param theU:
	:type theU: float
	:param thePnt2d:
	:type thePnt2d: NCollection_Array1<gp_Pnt2d>
	:param thePnt:
	:type thePnt: NCollection_Array1<gp_Pnt>
	:rtype: bool") Value;
		virtual Standard_Boolean Value (const Standard_Real theU,NCollection_Array1<gp_Pnt2d> & thePnt2d,NCollection_Array1<gp_Pnt> & thePnt);

		/****************** Value3dOnF1OnF2 ******************/
		%feature("compactdefaultargs") Value3dOnF1OnF2;
		%feature("autodoc", ":param U:
	:type U: float
	:param P3d:
	:type P3d: gp_Pnt
	:param PF1:
	:type PF1: gp_Pnt2d
	:param PF2:
	:type PF2: gp_Pnt2d
	:rtype: None") Value3dOnF1OnF2;
		void Value3dOnF1OnF2 (const Standard_Real U,gp_Pnt & P3d,gp_Pnt2d & PF1,gp_Pnt2d & PF2);

		/****************** ValueOnF1 ******************/
		%feature("compactdefaultargs") ValueOnF1;
		%feature("autodoc", "* returns the current point on the PCurve of the first face
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") ValueOnF1;
		gp_Pnt2d ValueOnF1 (const Standard_Real U);

		/****************** ValueOnF2 ******************/
		%feature("compactdefaultargs") ValueOnF2;
		%feature("autodoc", "* returns the current point on the PCurve of the first face
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") ValueOnF2;
		gp_Pnt2d ValueOnF2 (const Standard_Real U);

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
		/****************** Ancestor ******************/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "* may return a Null Shape if S1 is not a subShape of <Paral>; if Perform is not done.
	:param S1:
	:type S1: TopoDS_Edge
	:rtype: TopoDS_Shape") Ancestor;
		const TopoDS_Shape  Ancestor (const TopoDS_Edge & S1);

		/****************** BRepFill_OffsetAncestors ******************/
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", ":rtype: None") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors ();

		/****************** BRepFill_OffsetAncestors ******************/
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", ":param Paral:
	:type Paral: BRepFill_OffsetWire
	:rtype: None") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors (BRepFill_OffsetWire & Paral);

		/****************** HasAncestor ******************/
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Edge
	:rtype: bool") HasAncestor;
		Standard_Boolean HasAncestor (const TopoDS_Edge & S1);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Paral:
	:type Paral: BRepFill_OffsetWire
	:rtype: None") Perform;
		void Perform (BRepFill_OffsetWire & Paral);

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
		%feature("autodoc", ":rtype: None") BRepFill_OffsetWire;
		 BRepFill_OffsetWire ();

		/****************** BRepFill_OffsetWire ******************/
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", ":param Spine:
	:type Spine: TopoDS_Face
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None") BRepFill_OffsetWire;
		 BRepFill_OffsetWire (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);

		/****************** GeneratedShapes ******************/
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "* Returns the shapes created from a subshape <SpineShape> of the spine. Returns the last computed Offset.
	:param SpineShape:
	:type SpineShape: TopoDS_Shape
	:rtype: TopTools_ListOfShape") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize the evaluation of Offseting.
	:param Spine:
	:type Spine: TopoDS_Face
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None") Init;
		void Init (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** JoinType ******************/
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", ":rtype: GeomAbs_JoinType") JoinType;
		GeomAbs_JoinType JoinType ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs an OffsetWire at an altitude <Alt> from the face ( According to the orientation of the face)
	:param Offset:
	:type Offset: float
	:param Alt: default value is 0.0
	:type Alt: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Offset,const Standard_Real Alt = 0.0);

		/****************** PerformWithBiLo ******************/
		%feature("compactdefaultargs") PerformWithBiLo;
		%feature("autodoc", "* Performs an OffsetWire
	:param WSP:
	:type WSP: TopoDS_Face
	:param Offset:
	:type Offset: float
	:param Locus:
	:type Locus: BRepMAT2d_BisectingLocus
	:param Link:
	:type Link: BRepMAT2d_LinkTopoBilo
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Alt: default value is 0.0
	:type Alt: float
	:rtype: None") PerformWithBiLo;
		void PerformWithBiLo (const TopoDS_Face & WSP,const Standard_Real Offset,const BRepMAT2d_BisectingLocus & Locus,BRepMAT2d_LinkTopoBilo & Link,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Real Alt = 0.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the generated shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", ":rtype: TopoDS_Face") Spine;
		const TopoDS_Face  Spine ();

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
		%feature("autodoc", ":rtype: None") BRepFill_Pipe;
		 BRepFill_Pipe ();

		/****************** BRepFill_Pipe ******************/
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", ":param Spine:
	:type Spine: TopoDS_Wire
	:param Profile:
	:type Profile: TopoDS_Shape
	:param aMode: default value is GeomFill_IsCorrectedFrenet
	:type aMode: GeomFill_Trihedron
	:param ForceApproxC1: default value is Standard_False
	:type ForceApproxC1: bool
	:param GeneratePartCase: default value is Standard_False
	:type GeneratePartCase: bool
	:rtype: None") BRepFill_Pipe;
		 BRepFill_Pipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const GeomFill_Trihedron aMode = GeomFill_IsCorrectedFrenet,const Standard_Boolean ForceApproxC1 = Standard_False,const Standard_Boolean GeneratePartCase = Standard_False);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the edge created from an edge of the spine and a vertex of the profile. if the edge or the vertex are not in the spine or the profile.
	:param ESpine:
	:type ESpine: TopoDS_Edge
	:param VProfile:
	:type VProfile: TopoDS_Vertex
	:rtype: TopoDS_Edge") Edge;
		TopoDS_Edge Edge (const TopoDS_Edge & ESpine,const TopoDS_Vertex & VProfile);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", ":rtype: float") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the face created from an edge of the spine and an edge of the profile. if the edges are not in the spine or the profile
	:param ESpine:
	:type ESpine: TopoDS_Edge
	:param EProfile:
	:type EProfile: TopoDS_Edge
	:rtype: TopoDS_Face") Face;
		TopoDS_Face Face (const TopoDS_Edge & ESpine,const TopoDS_Edge & EProfile);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") FirstShape;
		const TopoDS_Shape  FirstShape ();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") Generated;
		void Generated (const TopoDS_Shape & S,TopTools_ListOfShape & L);

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") LastShape;
		const TopoDS_Shape  LastShape ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Spine:
	:type Spine: TopoDS_Wire
	:param Profile:
	:type Profile: TopoDS_Shape
	:param GeneratePartCase: default value is Standard_False
	:type GeneratePartCase: bool
	:rtype: None") Perform;
		void Perform (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const Standard_Boolean GeneratePartCase = Standard_False);

		/****************** PipeLine ******************/
		%feature("compactdefaultargs") PipeLine;
		%feature("autodoc", "* Create a Wire by sweeping the Point along the <spine> if the <Spine> is undefined
	:param Point:
	:type Point: gp_Pnt
	:rtype: TopoDS_Wire") PipeLine;
		TopoDS_Wire PipeLine (const gp_Pnt & Point);

		/****************** Profile ******************/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", ":rtype: TopoDS_Shape") Profile;
		const TopoDS_Shape  Profile ();

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "* Returns the shape created from the profile at the position of the vertex VSpine. if the vertex is not in the Spine
	:param VSpine:
	:type VSpine: TopoDS_Vertex
	:rtype: TopoDS_Shape") Section;
		TopoDS_Shape Section (const TopoDS_Vertex & VSpine);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", ":rtype: TopoDS_Shape") Spine;
		const TopoDS_Shape  Spine ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Set an section. The corespondance with the spine, will be automaticaly performed.
	:param Profile:
	:type Profile: TopoDS_Shape
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None") Add;
		void Add (const TopoDS_Shape & Profile,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Set an section. The corespondance with the spine, is given by <Location>
	:param Profile:
	:type Profile: TopoDS_Shape
	:param Location:
	:type Location: TopoDS_Vertex
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None") Add;
		void Add (const TopoDS_Shape & Profile,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);

		/****************** BRepFill_PipeShell ******************/
		%feature("compactdefaultargs") BRepFill_PipeShell;
		%feature("autodoc", "* Set an sweep's mode If no mode are setted, the mode use in MakePipe is used
	:param Spine:
	:type Spine: TopoDS_Wire
	:rtype: None") BRepFill_PipeShell;
		 BRepFill_PipeShell (const TopoDS_Wire & Spine);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the resulting shape (redefined from MakeShape).
	:rtype: bool") Build;
		Standard_Boolean Build ();

		/****************** DeleteProfile ******************/
		%feature("compactdefaultargs") DeleteProfile;
		%feature("autodoc", "* Delete an section.
	:param Profile:
	:type Profile: TopoDS_Shape
	:rtype: None") DeleteProfile;
		void DeleteProfile (const TopoDS_Shape & Profile);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", ":rtype: float") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the bottom of the sweep.
	:rtype: TopoDS_Shape") FirstShape;
		const TopoDS_Shape  FirstShape ();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") Generated;
		void Generated (const TopoDS_Shape & S,TopTools_ListOfShape & L);

		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "* Get a status, when Simulate or Build failed.
	:rtype: GeomFill_PipeError") GetStatus;
		GeomFill_PipeError GetStatus ();

		/****************** IsReady ******************/
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "* Say if <self> is ready to build the shape return False if <self> do not have section definition
	:rtype: bool") IsReady;
		Standard_Boolean IsReady ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "* Returns the TopoDS Shape of the top of the sweep.
	:rtype: TopoDS_Shape") LastShape;
		const TopoDS_Shape  LastShape ();

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "* Transform the sweeping Shell in Solid. If the section are not closed returns False
	:rtype: bool") MakeSolid;
		Standard_Boolean MakeSolid ();

		/****************** Profiles ******************/
		%feature("compactdefaultargs") Profiles;
		%feature("autodoc", "* Returns the list of original profiles
	:param theProfiles:
	:type theProfiles: TopTools_ListOfShape
	:rtype: None") Profiles;
		void Profiles (TopTools_ListOfShape & theProfiles);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Set an Frenet or an CorrectedFrenet trihedron to perform the sweeping
	:param Frenet: default value is Standard_False
	:type Frenet: bool
	:rtype: None") Set;
		void Set (const Standard_Boolean Frenet = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Set an fixed trihedron to perform the sweeping all sections will be parallel.
	:param Axe:
	:type Axe: gp_Ax2
	:rtype: None") Set;
		void Set (const gp_Ax2 & Axe);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Set an fixed BiNormal direction to perform the sweeping
	:param BiNormal:
	:type BiNormal: gp_Dir
	:rtype: None") Set;
		void Set (const gp_Dir & BiNormal);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Set support to the spine to define the BiNormal at the spine, like the normal the surfaces. Warning: To be effective, Each edge of the <spine> must have an representaion on one face of<SpineSupport>
	:param SpineSupport:
	:type SpineSupport: TopoDS_Shape
	:rtype: bool") Set;
		Standard_Boolean Set (const TopoDS_Shape & SpineSupport);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Set an auxiliary spine to define the Normal For each Point of the Spine P, an Point Q is evalued on <AuxiliarySpine> If <CurvilinearEquivalence> Q split <AuxiliarySpine> with the same length ratio than P split <Spline>. Else the plan define by P and the tangent to the <Spine> intersect <AuxiliarySpine> in Q. If <KeepContact> equals BRepFill_NoContact: The Normal is defined by the vector PQ. If <KeepContact> equals BRepFill_Contact: The Normal is defined to achieve that the sweeped section is in contact to the auxiliarySpine. The width of section is constant all along the path. In other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. However, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path.
	:param AuxiliarySpine:
	:type AuxiliarySpine: TopoDS_Wire
	:param CurvilinearEquivalence: default value is Standard_True
	:type CurvilinearEquivalence: bool
	:param KeepContact: default value is BRepFill_NoContact
	:type KeepContact: BRepFill_TypeOfContact
	:rtype: None") Set;
		void Set (const TopoDS_Wire & AuxiliarySpine,const Standard_Boolean CurvilinearEquivalence = Standard_True,const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);

		/****************** SetDiscrete ******************/
		%feature("compactdefaultargs") SetDiscrete;
		%feature("autodoc", "* Set a Discrete trihedron to perform the sweeping
	:rtype: None") SetDiscrete;
		void SetDiscrete ();

		/****************** SetForceApproxC1 ******************/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "* Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0. Give section to sweep. Possibilities are : - Give one or sevral profile - Give one profile and an homotetic law. - Automatic compute of correspondance beetween profile, and section on the sweeped shape - correspondance beetween profile, and section on the sweeped shape defined by a vertex of the spine
	:param ForceApproxC1:
	:type ForceApproxC1: bool
	:rtype: None") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "* Set an section and an homotetic law. The homotetie's centers is given by point on the <Spine>.
	:param Profile:
	:type Profile: TopoDS_Shape
	:param L:
	:type L: Law_Function
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const opencascade::handle<Law_Function> & L,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "* Set an section and an homotetic law. The homotetie center is given by point on the <Spine>
	:param Profile:
	:type Profile: TopoDS_Shape
	:param L:
	:type L: Law_Function
	:param Location:
	:type Location: TopoDS_Vertex
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const opencascade::handle<Law_Function> & L,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);

		/****************** SetMaxDegree ******************/
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "* Define the maximum V degree of resulting surface
	:param NewMaxDegree:
	:type NewMaxDegree: int
	:rtype: None") SetMaxDegree;
		void SetMaxDegree (const Standard_Integer NewMaxDegree);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Define the maximum number of spans in V-direction on resulting surface
	:param NewMaxSegments:
	:type NewMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer NewMaxSegments);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", ":param Tol3d: default value is 1.0e-4
	:type Tol3d: float
	:param BoundTol: default value is 1.0e-4
	:type BoundTol: float
	:param TolAngular: default value is 1.0e-2
	:type TolAngular: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d = 1.0e-4,const Standard_Real BoundTol = 1.0e-4,const Standard_Real TolAngular = 1.0e-2);

		/****************** SetTransition ******************/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "* Set the Transition Mode to manage discontinuities on the sweep.
	:param Mode: default value is BRepFill_Modified
	:type Mode: BRepFill_TransitionStyle
	:param Angmin: default value is 1.0e-2
	:type Angmin: float
	:param Angmax: default value is 6.0
	:type Angmax: float
	:rtype: None") SetTransition;
		void SetTransition (const BRepFill_TransitionStyle Mode = BRepFill_Modified,const Standard_Real Angmin = 1.0e-2,const Standard_Real Angmax = 6.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the result Shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "* Perform simulation of the sweep : Somes Section are returned.
	:param NumberOfSection:
	:type NumberOfSection: int
	:param Sections:
	:type Sections: TopTools_ListOfShape
	:rtype: None") Simulate;
		void Simulate (const Standard_Integer NumberOfSection,TopTools_ListOfShape & Sections);

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "* Returns the spine
	:rtype: TopoDS_Wire") Spine;
		const TopoDS_Wire  Spine ();

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
		%feature("autodoc", ":rtype: None") BRepFill_Section;
		 BRepFill_Section ();

		/****************** BRepFill_Section ******************/
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", ":param Profile:
	:type Profile: TopoDS_Shape
	:param V:
	:type V: TopoDS_Vertex
	:param WithContact:
	:type WithContact: bool
	:param WithCorrection:
	:type WithCorrection: bool
	:rtype: None") BRepFill_Section;
		 BRepFill_Section (const TopoDS_Shape & Profile,const TopoDS_Vertex & V,const Standard_Boolean WithContact,const Standard_Boolean WithCorrection);

		/****************** IsLaw ******************/
		%feature("compactdefaultargs") IsLaw;
		%feature("autodoc", ":rtype: bool") IsLaw;
		Standard_Boolean IsLaw ();

		/****************** IsPunctual ******************/
		%feature("compactdefaultargs") IsPunctual;
		%feature("autodoc", ":rtype: bool") IsPunctual;
		Standard_Boolean IsPunctual ();

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:rtype: TopoDS_Shape") ModifiedShape;
		TopoDS_Shape ModifiedShape (const TopoDS_Shape & theShape);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") OriginalShape;
		const TopoDS_Shape  OriginalShape ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param IsLaw:
	:type IsLaw: bool
	:rtype: None") Set;
		void Set (const Standard_Boolean IsLaw);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") Vertex;
		const TopoDS_Vertex  Vertex ();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", ":rtype: TopoDS_Wire") Wire;
		const TopoDS_Wire  Wire ();

		/****************** WithContact ******************/
		%feature("compactdefaultargs") WithContact;
		%feature("autodoc", ":rtype: bool") WithContact;
		Standard_Boolean WithContact ();

		/****************** WithCorrection ******************/
		%feature("compactdefaultargs") WithCorrection;
		%feature("autodoc", ":rtype: bool") WithCorrection;
		Standard_Boolean WithCorrection ();

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
		%feature("autodoc", ":rtype: opencascade::handle<GeomFill_SectionLaw>") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param TolAngular:
	:type TolAngular: float
	:rtype: GeomAbs_Shape") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", ":rtype: TopoDS_Edge") CurrentEdge;
		TopoDS_Edge CurrentEdge ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") D0;
		virtual void D0 (const Standard_Real U,TopoDS_Shape & S);

		/****************** IndexOfEdge ******************/
		%feature("compactdefaultargs") IndexOfEdge;
		%feature("autodoc", ":param anEdge:
	:type anEdge: TopoDS_Shape
	:rtype: int") IndexOfEdge;
		Standard_Integer IndexOfEdge (const TopoDS_Shape & anEdge);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:rtype: None") Init;
		void Init (const TopoDS_Wire & W);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", ":rtype: bool") IsConstant;
		virtual Standard_Boolean IsConstant ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Say if the input shape is a vertex.
	:rtype: bool") IsVertex;
		virtual Standard_Boolean IsVertex ();

		/****************** Law ******************/
		%feature("compactdefaultargs") Law;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: opencascade::handle<GeomFill_SectionLaw>") Law;
		const opencascade::handle<GeomFill_SectionLaw> & Law (const Standard_Integer Index);

		/****************** NbLaw ******************/
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", ":rtype: int") NbLaw;
		Standard_Integer NbLaw ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: TopoDS_Vertex") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);

		/****************** VertexTol ******************/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);

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
		/****************** AbscissaOnPath ******************/
		%feature("compactdefaultargs") AbscissaOnPath;
		%feature("autodoc", ":rtype: float") AbscissaOnPath;
		Standard_Real AbscissaOnPath ();

		/****************** BRepFill_SectionPlacement ******************/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "* Automatic placement
	:param Law:
	:type Law: BRepFill_LocationLaw
	:param Section:
	:type Section: TopoDS_Shape
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement (const opencascade::handle<BRepFill_LocationLaw> & Law,const TopoDS_Shape & Section,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);

		/****************** BRepFill_SectionPlacement ******************/
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "* Placement on vertex
	:param Law:
	:type Law: BRepFill_LocationLaw
	:param Section:
	:type Section: TopoDS_Shape
	:param Vertex:
	:type Vertex: TopoDS_Shape
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement (const opencascade::handle<BRepFill_LocationLaw> & Law,const TopoDS_Shape & Section,const TopoDS_Shape & Vertex,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", ":rtype: gp_Trsf") Transformation;
		const gp_Trsf  Transformation ();

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
		%feature("autodoc", ":param Section:
	:type Section: BRepFill_SectionLaw
	:param Location:
	:type Location: BRepFill_LocationLaw
	:param WithKPart:
	:type WithKPart: bool
	:rtype: None") BRepFill_Sweep;
		 BRepFill_Sweep (const opencascade::handle<BRepFill_SectionLaw> & Section,const opencascade::handle<BRepFill_LocationLaw> & Location,const Standard_Boolean WithKPart);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Build the Sweep Surface Transition define Transition strategy Approx define Approximation Strategy - GeomFill_Section : The composed Function Location X Section is directly approximed. - GeomFill_Location : The location law is approximed, and the SweepSurface is bulid algebric composition of approximed location law and section law This option is Ok, if Section.Surface() methode is effective. Continuity : The continuity in v waiting on the surface Degmax : The maximum degree in v requiered on the surface Segmax : The maximum number of span in v requiered on the surface.
	:param ReversedEdges:
	:type ReversedEdges: TopTools_MapOfShape
	:param Tapes:
	:type Tapes: BRepFill_DataMapOfShapeHArray2OfShape
	:param Rails:
	:type Rails: BRepFill_DataMapOfShapeHArray2OfShape
	:param Transition: default value is BRepFill_Modified
	:type Transition: BRepFill_TransitionStyle
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Approx: default value is GeomFill_Location
	:type Approx: GeomFill_ApproxStyle
	:param Degmax: default value is 11
	:type Degmax: int
	:param Segmax: default value is 30
	:type Segmax: int
	:rtype: None") Build;
		void Build (TopTools_MapOfShape & ReversedEdges,BRepFill_DataMapOfShapeHArray2OfShape & Tapes,BRepFill_DataMapOfShapeHArray2OfShape & Rails,const BRepFill_TransitionStyle Transition = BRepFill_Modified,const GeomAbs_Shape Continuity = GeomAbs_C2,const GeomFill_ApproxStyle Approx = GeomFill_Location,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 30);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "* Get the Approximation error.
	:rtype: float") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();

		/****************** InterFaces ******************/
		%feature("compactdefaultargs") InterFaces;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HArray2OfShape>") InterFaces;
		opencascade::handle<TopTools_HArray2OfShape> InterFaces ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Say if the Shape is Build.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Sections ******************/
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HArray2OfShape>") Sections;
		opencascade::handle<TopTools_HArray2OfShape> Sections ();

		/****************** SetAngularControl ******************/
		%feature("compactdefaultargs") SetAngularControl;
		%feature("autodoc", "* Tolerance To controle Corner management. //! If the discontinuity is lesser than <AngleMin> in radian The Transition Performed will be alway 'Modified'
	:param AngleMin: default value is 0.01
	:type AngleMin: float
	:param AngleMax: default value is 6.0
	:type AngleMax: float
	:rtype: None") SetAngularControl;
		void SetAngularControl (const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 6.0);

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", ":param FirstShape:
	:type FirstShape: TopoDS_Wire
	:param LastShape:
	:type LastShape: TopoDS_Wire
	:rtype: None") SetBounds;
		void SetBounds (const TopoDS_Wire & FirstShape,const TopoDS_Wire & LastShape);

		/****************** SetForceApproxC1 ******************/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "* Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.
	:param ForceApproxC1:
	:type ForceApproxC1: bool
	:rtype: None") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Set Approximation Tolerance Tol3d : Tolerance to surface approximation Tol2d : Tolerance used to perform curve approximation Normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular : Tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface
	:param Tol3d:
	:type Tol3d: float
	:param BoundTol: default value is 1.0
	:type BoundTol: float
	:param Tol2d: default value is 1.0e-5
	:type Tol2d: float
	:param TolAngular: default value is 1.0e-2
	:type TolAngular: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d,const Standard_Real BoundTol = 1.0,const Standard_Real Tol2d = 1.0e-5,const Standard_Real TolAngular = 1.0e-2);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the Sweeping Shape
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** SubShape ******************/
		%feature("compactdefaultargs") SubShape;
		%feature("autodoc", ":rtype: opencascade::handle<TopTools_HArray2OfShape>") SubShape;
		opencascade::handle<TopTools_HArray2OfShape> SubShape ();

		/****************** Tape ******************/
		%feature("compactdefaultargs") Tape;
		%feature("autodoc", "* returns the Tape corresponding to Index-th edge of section
	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape") Tape;
		TopoDS_Shape Tape (const Standard_Integer Index);

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
		/****************** AddOrConfuse ******************/
		%feature("compactdefaultargs") AddOrConfuse;
		%feature("autodoc", ":param Start:
	:type Start: bool
	:param Edge1:
	:type Edge1: TopoDS_Edge
	:param Edge2:
	:type Edge2: TopoDS_Edge
	:param Params:
	:type Params: TColgp_SequenceOfPnt
	:rtype: None") AddOrConfuse;
		void AddOrConfuse (const Standard_Boolean Start,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,TColgp_SequenceOfPnt & Params);

		/****************** BRepFill_TrimEdgeTool ******************/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", ":rtype: None") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool ();

		/****************** BRepFill_TrimEdgeTool ******************/
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", ":param Bisec:
	:type Bisec: Bisector_Bisec
	:param S1:
	:type S1: Geom2d_Geometry
	:param S2:
	:type S2: Geom2d_Geometry
	:param Offset:
	:type Offset: float
	:rtype: None") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool (const Bisector_Bisec & Bisec,const opencascade::handle<Geom2d_Geometry> & S1,const opencascade::handle<Geom2d_Geometry> & S2,const Standard_Real Offset);

		/****************** IntersectWith ******************/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", ":param Edge1:
	:type Edge1: TopoDS_Edge
	:param Edge2:
	:type Edge2: TopoDS_Edge
	:param InitShape1:
	:type InitShape1: TopoDS_Shape
	:param InitShape2:
	:type InitShape2: TopoDS_Shape
	:param End1:
	:type End1: TopoDS_Vertex
	:param End2:
	:type End2: TopoDS_Vertex
	:param theJoinType:
	:type theJoinType: GeomAbs_JoinType
	:param IsOpenResult:
	:type IsOpenResult: bool
	:param Params:
	:type Params: TColgp_SequenceOfPnt
	:rtype: None") IntersectWith;
		void IntersectWith (const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const TopoDS_Shape & InitShape1,const TopoDS_Shape & InitShape2,const TopoDS_Vertex & End1,const TopoDS_Vertex & End2,const GeomAbs_JoinType theJoinType,const Standard_Boolean IsOpenResult,TColgp_SequenceOfPnt & Params);

		/****************** IsInside ******************/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:rtype: bool") IsInside;
		Standard_Boolean IsInside (const gp_Pnt2d & P);

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
		/****************** AddBounds ******************/
		%feature("compactdefaultargs") AddBounds;
		%feature("autodoc", ":param Bounds:
	:type Bounds: TopTools_HArray2OfShape
	:rtype: None") AddBounds;
		void AddBounds (const opencascade::handle<TopTools_HArray2OfShape> & Bounds);

		/****************** AddUEdges ******************/
		%feature("compactdefaultargs") AddUEdges;
		%feature("autodoc", ":param theUEdges:
	:type theUEdges: TopTools_HArray2OfShape
	:rtype: None") AddUEdges;
		void AddUEdges (const opencascade::handle<TopTools_HArray2OfShape> & theUEdges);

		/****************** AddVEdges ******************/
		%feature("compactdefaultargs") AddVEdges;
		%feature("autodoc", ":param theVEdges:
	:type theVEdges: TopTools_HArray2OfShape
	:param theIndex:
	:type theIndex: int
	:rtype: None") AddVEdges;
		void AddVEdges (const opencascade::handle<TopTools_HArray2OfShape> & theVEdges,const Standard_Integer theIndex);

		/****************** BRepFill_TrimShellCorner ******************/
		%feature("compactdefaultargs") BRepFill_TrimShellCorner;
		%feature("autodoc", "* Constructor: takes faces to intersect, type of transition (it can be RightCorner or RoundCorner) and axis of bisector plane
	:param theFaces:
	:type theFaces: TopTools_HArray2OfShape
	:param theTransition:
	:type theTransition: BRepFill_TransitionStyle
	:param theAxeOfBisPlane:
	:type theAxeOfBisPlane: gp_Ax2
	:rtype: None") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner (const opencascade::handle<TopTools_HArray2OfShape> & theFaces,const BRepFill_TransitionStyle theTransition,const gp_Ax2 & theAxeOfBisPlane);

		/****************** HasSection ******************/
		%feature("compactdefaultargs") HasSection;
		%feature("autodoc", ":rtype: bool") HasSection;
		Standard_Boolean HasSection ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param theModified:
	:type theModified: TopTools_ListOfShape
	:rtype: None") Modified;
		void Modified (const TopoDS_Shape & S,TopTools_ListOfShape & theModified);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

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
		%feature("autodoc", ":param Bis:
	:type Bis: Geom2d_Curve
	:param Face1:
	:type Face1: TopoDS_Face
	:param Face2:
	:type Face2: TopoDS_Face
	:param Edge1:
	:type Edge1: TopoDS_Edge
	:param Edge2:
	:type Edge2: TopoDS_Edge
	:param Inv1:
	:type Inv1: bool
	:param Inv2:
	:type Inv2: bool
	:rtype: None") BRepFill_TrimSurfaceTool;
		 BRepFill_TrimSurfaceTool (const opencascade::handle<Geom2d_Curve> & Bis,const TopoDS_Face & Face1,const TopoDS_Face & Face2,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Boolean Inv1,const Standard_Boolean Inv2);

		/****************** IntersectWith ******************/
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "* Intersect <Bis> with the projection of the edges <EdgeOnFi> and returns the intersecting parameters on Bis and on the edges P.X() : Parameter on Bis P.Y() : Parameter on EdgeOnF1 P.Z() : Parameter on EdgeOnF2 raises if <Edge> is not a edge of Face1 or Face2.
	:param EdgeOnF1:
	:type EdgeOnF1: TopoDS_Edge
	:param EdgeOnF2:
	:type EdgeOnF2: TopoDS_Edge
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:rtype: None") IntersectWith;
		void IntersectWith (const TopoDS_Edge & EdgeOnF1,const TopoDS_Edge & EdgeOnF2,TColgp_SequenceOfPnt & Points);

		/****************** IsOnFace ******************/
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "* returns True if the Line (P, DZ) intersect the Faces
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: bool") IsOnFace;
		Standard_Boolean IsOnFace (const gp_Pnt2d & Point);

		/****************** ProjOn ******************/
		%feature("compactdefaultargs") ProjOn;
		%feature("autodoc", "* returns the parameter of the point <Point> on the Edge <Edge>, assuming that the point is on the edge.
	:param Point:
	:type Point: gp_Pnt2d
	:param Edge:
	:type Edge: TopoDS_Edge
	:rtype: float") ProjOn;
		Standard_Real ProjOn (const gp_Pnt2d & Point,const TopoDS_Edge & Edge);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", ":param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Curve:
	:type Curve: Geom_Curve
	:param PCurve1:
	:type PCurve1: Geom2d_Curve
	:param PCurve2:
	:type PCurve2: Geom2d_Curve
	:param myCont:
	:type myCont: GeomAbs_Shape
	:rtype: None") Project;
		void Project (const Standard_Real U1,const Standard_Real U2,opencascade::handle<Geom_Curve> & Curve,opencascade::handle<Geom2d_Curve> & PCurve1,opencascade::handle<Geom2d_Curve> & PCurve2,GeomAbs_Shape & myCont);

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
		%feature("autodoc", ":param Path:
	:type Path: TopoDS_Wire
	:param Law:
	:type Law: GeomFill_LocationGuide
	:rtype: None") BRepFill_ACRLaw;
		 BRepFill_ACRLaw (const TopoDS_Wire & Path,const opencascade::handle<GeomFill_LocationGuide> & Law);

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
		%feature("autodoc", ":param Path:
	:type Path: TopoDS_Wire
	:param Law:
	:type Law: GeomFill_LocationLaw
	:rtype: None") BRepFill_Edge3DLaw;
		 BRepFill_Edge3DLaw (const TopoDS_Wire & Path,const opencascade::handle<GeomFill_LocationLaw> & Law);

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
		%feature("autodoc", ":param Path:
	:type Path: TopoDS_Wire
	:param Surf:
	:type Surf: TopoDS_Shape
	:rtype: None") BRepFill_EdgeOnSurfLaw;
		 BRepFill_EdgeOnSurfLaw (const TopoDS_Wire & Path,const TopoDS_Shape & Surf);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* returns <False> if one Edge of <Path> do not have representation on <Surf>. In this case it is impossible to use this object.
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

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
		%feature("autodoc", "* Construct
	:param S:
	:type S: TopTools_SequenceOfShape
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None") BRepFill_NSections;
		 BRepFill_NSections (const TopTools_SequenceOfShape & S,const Standard_Boolean Build = Standard_True);

		/****************** BRepFill_NSections ******************/
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "* Construct
	:param S:
	:type S: TopTools_SequenceOfShape
	:param Trsfs:
	:type Trsfs: GeomFill_SequenceOfTrsf
	:param P:
	:type P: TColStd_SequenceOfReal
	:param VF:
	:type VF: float
	:param VL:
	:type VL: float
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None") BRepFill_NSections;
		 BRepFill_NSections (const TopTools_SequenceOfShape & S,const GeomFill_SequenceOfTrsf & Trsfs,const TColStd_SequenceOfReal & P,const Standard_Real VF,const Standard_Real VL,const Standard_Boolean Build = Standard_True);

		/****************** ConcatenedLaw ******************/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "* Give the law build on a concatened section
	:rtype: opencascade::handle<GeomFill_SectionLaw>") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param TolAngular:
	:type TolAngular: float
	:rtype: GeomAbs_Shape") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param Param:
	:type Param: float
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") D0;
		virtual void D0 (const Standard_Real Param,TopoDS_Shape & S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Say if the Law is Constant.
	:rtype: bool") IsConstant;
		virtual Standard_Boolean IsConstant ();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Say if the input shape is a vertex.
	:rtype: bool") IsVertex;
		virtual Standard_Boolean IsVertex ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: TopoDS_Vertex") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);

		/****************** VertexTol ******************/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);

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
		%feature("autodoc", "* Construct an constant Law
	:param V:
	:type V: TopoDS_Vertex
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Vertex & V,const Standard_Boolean Build = Standard_True);

		/****************** BRepFill_ShapeLaw ******************/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "* Construct an constant Law
	:param W:
	:type W: TopoDS_Wire
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Wire & W,const Standard_Boolean Build = Standard_True);

		/****************** BRepFill_ShapeLaw ******************/
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "* Construct an evolutive Law
	:param W:
	:type W: TopoDS_Wire
	:param L:
	:type L: Law_Function
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Wire & W,const opencascade::handle<Law_Function> & L,const Standard_Boolean Build = Standard_True);

		/****************** ConcatenedLaw ******************/
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "* Give the law build on a concaneted section
	:rtype: opencascade::handle<GeomFill_SectionLaw>") ConcatenedLaw;
		virtual opencascade::handle<GeomFill_SectionLaw> ConcatenedLaw ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param TolAngular:
	:type TolAngular: float
	:rtype: GeomAbs_Shape") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param Param:
	:type Param: float
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") D0;
		virtual void D0 (const Standard_Real Param,TopoDS_Shape & S);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer Index);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Say if the Law is Constant.
	:rtype: bool") IsConstant;
		virtual Standard_Boolean IsConstant ();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Say if the input shape is a vertex.
	:rtype: bool") IsVertex;
		virtual Standard_Boolean IsVertex ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: TopoDS_Vertex") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);

		/****************** VertexTol ******************/
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);

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
		%feature("autodoc", ":param Path:
	:type Path: TopoDS_Wire
	:param Law:
	:type Law: GeomFill_LocationDraft
	:rtype: None") BRepFill_DraftLaw;
		 BRepFill_DraftLaw (const TopoDS_Wire & Path,const opencascade::handle<GeomFill_LocationDraft> & Law);

		/****************** CleanLaw ******************/
		%feature("compactdefaultargs") CleanLaw;
		%feature("autodoc", "* To clean the little discontinuities.
	:param TolAngular:
	:type TolAngular: float
	:rtype: None") CleanLaw;
		void CleanLaw (const Standard_Real TolAngular);

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
