/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BRepFill

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BRepFill_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
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

%rename(brepfill) BRepFill;
class BRepFill {
	public:
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Computes a ruled surface between two edges.

	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:rtype: TopoDS_Face
") Face;
		static TopoDS_Face Face (const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Computes a ruled surface between two wires. The wires must have the same number of edges.

	:param Wire1:
	:type Wire1: TopoDS_Wire &
	:param Wire2:
	:type Wire2: TopoDS_Wire &
	:rtype: TopoDS_Shell
") Shell;
		static TopoDS_Shell Shell (const TopoDS_Wire & Wire1,const TopoDS_Wire & Wire2);
		%feature("compactdefaultargs") Axe;
		%feature("autodoc", "	* Computes <AxeProf> as Follow. <Location> is the Position of the nearest vertex V of <Profile> to <Spine>.<XDirection> is confused with the tangent to <Spine> at the projected point of V on the Spine. <Direction> is normal to <Spine>. <Spine> is a plane wire or a plane face.

	:param Spine:
	:type Spine: TopoDS_Shape &
	:param Profile:
	:type Profile: TopoDS_Wire &
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param ProfOnSpine:
	:type ProfOnSpine: bool
	:param Tol:
	:type Tol: float
	:rtype: void
") Axe;
		static void Axe (const TopoDS_Shape & Spine,const TopoDS_Wire & Profile,gp_Ax3 & AxeProf,Standard_Boolean &OutValue,const Standard_Real Tol);
		%feature("compactdefaultargs") ComputeACR;
		%feature("autodoc", "	* Compute ACR on a wire

	:param wire:
	:type wire: TopoDS_Wire &
	:param ACR:
	:type ACR: TColStd_Array1OfReal &
	:rtype: void
") ComputeACR;
		static void ComputeACR (const TopoDS_Wire & wire,TColStd_Array1OfReal & ACR);
		%feature("compactdefaultargs") InsertACR;
		%feature("autodoc", "	* Insert ACR on a wire

	:param wire:
	:type wire: TopoDS_Wire &
	:param ACRcuts:
	:type ACRcuts: TColStd_Array1OfReal &
	:param prec:
	:type prec: float
	:rtype: TopoDS_Wire
") InsertACR;
		static TopoDS_Wire InsertACR (const TopoDS_Wire & wire,const TColStd_Array1OfReal & ACRcuts,const Standard_Real prec);
};


%extend BRepFill {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ApproxSeewing;
class BRepFill_ApproxSeewing {
	public:
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", "	:rtype: None
") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing ();
		%feature("compactdefaultargs") BRepFill_ApproxSeewing;
		%feature("autodoc", "	:param ML:
	:type ML: BRepFill_MultiLine &
	:rtype: None
") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing (const BRepFill_MultiLine & ML);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param ML:
	:type ML: BRepFill_MultiLine &
	:rtype: None
") Perform;
		void Perform (const BRepFill_MultiLine & ML);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* returns the approximation of the 3d Curve

	:rtype: Handle_Geom_Curve
") Curve;
		Handle_Geom_Curve Curve ();
		%feature("compactdefaultargs") CurveOnF1;
		%feature("autodoc", "	* returns the approximation of the PCurve on the first face of the MultiLine

	:rtype: Handle_Geom2d_Curve
") CurveOnF1;
		Handle_Geom2d_Curve CurveOnF1 ();
		%feature("compactdefaultargs") CurveOnF2;
		%feature("autodoc", "	* returns the approximation of the PCurve on the first face of the MultiLine

	:rtype: Handle_Geom2d_Curve
") CurveOnF2;
		Handle_Geom2d_Curve CurveOnF2 ();
};


%extend BRepFill_ApproxSeewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_CompatibleWires;
class BRepFill_CompatibleWires {
	public:
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "	:rtype: None
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires ();
		%feature("compactdefaultargs") BRepFill_CompatibleWires;
		%feature("autodoc", "	:param Sections:
	:type Sections: TopTools_SequenceOfShape &
	:rtype: None
") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires (const TopTools_SequenceOfShape & Sections);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Sections:
	:type Sections: TopTools_SequenceOfShape &
	:rtype: None
") Init;
		void Init (const TopTools_SequenceOfShape & Sections);
		%feature("compactdefaultargs") SetPercent;
		%feature("autodoc", "	:param percent: default value is 0.01
	:type percent: float
	:rtype: None
") SetPercent;
		void SetPercent (const Standard_Real percent = 0.01);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs CompatibleWires According to the orientation and the origin of each other

	:param WithRotation: default value is Standard_True
	:type WithRotation: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean WithRotation = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the generated sequence.

	:rtype: TopTools_SequenceOfShape
") Shape;
		const TopTools_SequenceOfShape & Shape ();
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "	* Returns the shapes created from a subshape <SubSection> of a section.

	:param SubSection:
	:type SubSection: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Edge & SubSection);
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();
};


%extend BRepFill_CompatibleWires {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ComputeCLine;
class BRepFill_ComputeCLine {
	public:
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "	:param Line:
	:type Line: BRepFill_MultiLine &
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
	:rtype: None
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine (const BRepFill_MultiLine & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("compactdefaultargs") BRepFill_ComputeCLine;
		%feature("autodoc", "	:param degreemin: default value is 3
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
	:rtype: None
") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Line:
	:type Line: BRepFill_MultiLine &
	:rtype: None
") Perform;
		void Perform (const BRepFill_MultiLine & Line);
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None
") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None
") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "	:rtype: bool
") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "	:rtype: bool
") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float &
	:param tol2d:
	:type tol2d: float &
	:rtype: None
") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "	:rtype: int
") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve
") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param firstp:
	:type firstp: float &
	:param lastp:
	:type lastp: float &
	:rtype: None
") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend BRepFill_ComputeCLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_CurveConstraint;
class BRepFill_CurveConstraint : public GeomPlate_CurveConstraint {
	public:
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "	* Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion.

	:param Boundary:
	:type Boundary: Handle_Adaptor3d_HCurveOnSurface &
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
	:rtype: None
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint (const Handle_Adaptor3d_HCurveOnSurface & Boundary,const Standard_Integer Order,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("compactdefaultargs") BRepFill_CurveConstraint;
		%feature("autodoc", "	:param Boundary:
	:type Boundary: Handle_Adaptor3d_HCurve &
	:param Tang:
	:type Tang: int
	:param NPt: default value is 10
	:type NPt: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:rtype: None
") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint (const Handle_Adaptor3d_HCurve & Boundary,const Standard_Integer Tang,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001);
};


%extend BRepFill_CurveConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_CurveConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_CurveConstraint::Handle_BRepFill_CurveConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_CurveConstraint;
class Handle_BRepFill_CurveConstraint : public Handle_GeomPlate_CurveConstraint {

    public:
        // constructors
        Handle_BRepFill_CurveConstraint();
        Handle_BRepFill_CurveConstraint(const Handle_BRepFill_CurveConstraint &aHandle);
        Handle_BRepFill_CurveConstraint(const BRepFill_CurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_CurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_CurveConstraint {
    BRepFill_CurveConstraint* _get_reference() {
    return (BRepFill_CurveConstraint*)$self->Access();
    }
};

%extend Handle_BRepFill_CurveConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_CurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
class BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfNodeDataMapOfShapeShape &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape (const BRepFill_DataMapOfNodeDataMapOfShapeShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfNodeDataMapOfShapeShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfNodeDataMapOfShapeShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_MAT_Node
") Key;
		Handle_MAT_Node Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeShape
") Value;
		const TopTools_DataMapOfShapeShape & Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfNodeShape;
class BRepFill_DataMapIteratorOfDataMapOfNodeShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfNodeShape;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfNodeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeShape ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfNodeShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfNodeShape &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfNodeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeShape (const BRepFill_DataMapOfNodeShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfNodeShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfNodeShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_MAT_Node
") Key;
		Handle_MAT_Node Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfNodeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
class BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfOrientedShapeListOfShape &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape (const BRepFill_DataMapOfOrientedShapeListOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfOrientedShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfOrientedShapeListOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		const TopTools_ListOfShape & Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
class BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeDataMapOfShapeListOfShape &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeDataMapOfShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Value;
		const TopTools_DataMapOfShapeListOfShape & Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
class BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeHArray2OfShape &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape (const BRepFill_DataMapOfShapeHArray2OfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeHArray2OfShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeHArray2OfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopTools_HArray2OfShape
") Value;
		Handle_TopTools_HArray2OfShape Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
class BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeSequenceOfPnt &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt (const BRepFill_DataMapOfShapeSequenceOfPnt & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeSequenceOfPnt &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeSequenceOfPnt & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt
") Value;
		const TColgp_SequenceOfPnt & Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
class BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
		%feature("autodoc", "	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal ();
		%feature("compactdefaultargs") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeSequenceOfReal &
	:rtype: None
") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal (const BRepFill_DataMapOfShapeSequenceOfReal & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepFill_DataMapOfShapeSequenceOfReal &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeSequenceOfReal & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") Value;
		const TColStd_SequenceOfReal & Value ();
};


%extend BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape;
class BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:param I:
	:type I: TopTools_DataMapOfShapeShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape (const Handle_MAT_Node & K,const TopTools_DataMapOfShapeShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_MAT_Node
") Key;
		Handle_MAT_Node Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeShape
") Value;
		TopTools_DataMapOfShapeShape & Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape::Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape;
class Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape();
        Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape(const Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape(const BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
    BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfNodeShape;
class BRepFill_DataMapNodeOfDataMapOfNodeShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfNodeShape;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfNodeShape;
		 BRepFill_DataMapNodeOfDataMapOfNodeShape (const Handle_MAT_Node & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_MAT_Node
") Key;
		Handle_MAT_Node Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfNodeShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape::Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape;
class Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape();
        Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape(const Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape(const BRepFill_DataMapNodeOfDataMapOfNodeShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape {
    BRepFill_DataMapNodeOfDataMapOfNodeShape* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfNodeShape*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfNodeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape;
class BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape (const TopoDS_Shape & K,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		TopTools_ListOfShape & Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape::Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape;
class Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape();
        Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape(const Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape(const BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
    BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape;
class BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_DataMapOfShapeListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape (const TopoDS_Shape & K,const TopTools_DataMapOfShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Value;
		TopTools_DataMapOfShapeListOfShape & Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape::Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape;
class Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape();
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape(const Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape(const BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
    BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape;
class BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_TopTools_HArray2OfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape (const TopoDS_Shape & K,const Handle_TopTools_HArray2OfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TopTools_HArray2OfShape
") Value;
		Handle_TopTools_HArray2OfShape Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape::Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape;
class Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape();
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape(const Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape(const BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
    BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt;
class BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColgp_SequenceOfPnt
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt (const TopoDS_Shape & K,const TColgp_SequenceOfPnt & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt
") Value;
		TColgp_SequenceOfPnt & Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt::Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt;
class Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt();
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt(const Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt(const BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
    BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal;
class BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColStd_SequenceOfReal &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal (const TopoDS_Shape & K,const TColStd_SequenceOfReal & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TColStd_SequenceOfReal
") Value;
		TColStd_SequenceOfReal & Value ();
};


%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal::Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal;
class Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal();
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal(const Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal &aHandle);
        Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal(const BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
    BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal* _get_reference() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal*)$self->Access();
    }
};

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfNodeDataMapOfShapeShape;
class BRepFill_DataMapOfNodeDataMapOfShapeShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfNodeDataMapOfShapeShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapOfNodeDataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfNodeDataMapOfShapeShape &
	:rtype: BRepFill_DataMapOfNodeDataMapOfShapeShape
") Assign;
		BRepFill_DataMapOfNodeDataMapOfShapeShape & Assign (const BRepFill_DataMapOfNodeDataMapOfShapeShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfNodeDataMapOfShapeShape &
	:rtype: BRepFill_DataMapOfNodeDataMapOfShapeShape
") operator =;
		BRepFill_DataMapOfNodeDataMapOfShapeShape & operator = (const BRepFill_DataMapOfNodeDataMapOfShapeShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:param I:
	:type I: TopTools_DataMapOfShapeShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_MAT_Node & K,const TopTools_DataMapOfShapeShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: TopTools_DataMapOfShapeShape
") Find;
		const TopTools_DataMapOfShapeShape & Find (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: TopTools_DataMapOfShapeShape
") ChangeFind;
		TopTools_DataMapOfShapeShape & ChangeFind (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_MAT_Node & K);
};


%extend BRepFill_DataMapOfNodeDataMapOfShapeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfNodeShape;
class BRepFill_DataMapOfNodeShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfNodeShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfNodeShape;
		 BRepFill_DataMapOfNodeShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfNodeShape &
	:rtype: BRepFill_DataMapOfNodeShape
") Assign;
		BRepFill_DataMapOfNodeShape & Assign (const BRepFill_DataMapOfNodeShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfNodeShape &
	:rtype: BRepFill_DataMapOfNodeShape
") operator =;
		BRepFill_DataMapOfNodeShape & operator = (const BRepFill_DataMapOfNodeShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:param I:
	:type I: TopoDS_Shape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_MAT_Node & K,const TopoDS_Shape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: TopoDS_Shape
") ChangeFind;
		TopoDS_Shape  ChangeFind (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_MAT_Node & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_MAT_Node &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_MAT_Node & K);
};


%extend BRepFill_DataMapOfNodeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfOrientedShapeListOfShape;
class BRepFill_DataMapOfOrientedShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfOrientedShapeListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapOfOrientedShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfOrientedShapeListOfShape &
	:rtype: BRepFill_DataMapOfOrientedShapeListOfShape
") Assign;
		BRepFill_DataMapOfOrientedShapeListOfShape & Assign (const BRepFill_DataMapOfOrientedShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfOrientedShapeListOfShape &
	:rtype: BRepFill_DataMapOfOrientedShapeListOfShape
") operator =;
		BRepFill_DataMapOfOrientedShapeListOfShape & operator = (const BRepFill_DataMapOfOrientedShapeListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Find;
		const TopTools_ListOfShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeFind;
		TopTools_ListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepFill_DataMapOfOrientedShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
class BRepFill_DataMapOfShapeDataMapOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapOfShapeDataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeDataMapOfShapeListOfShape &
	:rtype: BRepFill_DataMapOfShapeDataMapOfShapeListOfShape
") Assign;
		BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & Assign (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeDataMapOfShapeListOfShape &
	:rtype: BRepFill_DataMapOfShapeDataMapOfShapeListOfShape
") operator =;
		BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & operator = (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_DataMapOfShapeListOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_DataMapOfShapeListOfShape
") Find;
		const TopTools_DataMapOfShapeListOfShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_DataMapOfShapeListOfShape
") ChangeFind;
		TopTools_DataMapOfShapeListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepFill_DataMapOfShapeDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfShapeHArray2OfShape;
class BRepFill_DataMapOfShapeHArray2OfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfShapeHArray2OfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapOfShapeHArray2OfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeHArray2OfShape &
	:rtype: BRepFill_DataMapOfShapeHArray2OfShape
") Assign;
		BRepFill_DataMapOfShapeHArray2OfShape & Assign (const BRepFill_DataMapOfShapeHArray2OfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeHArray2OfShape &
	:rtype: BRepFill_DataMapOfShapeHArray2OfShape
") operator =;
		BRepFill_DataMapOfShapeHArray2OfShape & operator = (const BRepFill_DataMapOfShapeHArray2OfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Handle_TopTools_HArray2OfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_TopTools_HArray2OfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_TopTools_HArray2OfShape
") Find;
		Handle_TopTools_HArray2OfShape Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Handle_TopTools_HArray2OfShape
") ChangeFind;
		Handle_TopTools_HArray2OfShape ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepFill_DataMapOfShapeHArray2OfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfShapeSequenceOfPnt;
class BRepFill_DataMapOfShapeSequenceOfPnt : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfShapeSequenceOfPnt;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapOfShapeSequenceOfPnt (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeSequenceOfPnt &
	:rtype: BRepFill_DataMapOfShapeSequenceOfPnt
") Assign;
		BRepFill_DataMapOfShapeSequenceOfPnt & Assign (const BRepFill_DataMapOfShapeSequenceOfPnt & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeSequenceOfPnt &
	:rtype: BRepFill_DataMapOfShapeSequenceOfPnt
") operator =;
		BRepFill_DataMapOfShapeSequenceOfPnt & operator = (const BRepFill_DataMapOfShapeSequenceOfPnt & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColgp_SequenceOfPnt
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColgp_SequenceOfPnt & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColgp_SequenceOfPnt
") Find;
		const TColgp_SequenceOfPnt & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColgp_SequenceOfPnt
") ChangeFind;
		TColgp_SequenceOfPnt & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepFill_DataMapOfShapeSequenceOfPnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DataMapOfShapeSequenceOfReal;
class BRepFill_DataMapOfShapeSequenceOfReal : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_DataMapOfShapeSequenceOfReal;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_DataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapOfShapeSequenceOfReal (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeSequenceOfReal &
	:rtype: BRepFill_DataMapOfShapeSequenceOfReal
") Assign;
		BRepFill_DataMapOfShapeSequenceOfReal & Assign (const BRepFill_DataMapOfShapeSequenceOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_DataMapOfShapeSequenceOfReal &
	:rtype: BRepFill_DataMapOfShapeSequenceOfReal
") operator =;
		BRepFill_DataMapOfShapeSequenceOfReal & operator = (const BRepFill_DataMapOfShapeSequenceOfReal & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColStd_SequenceOfReal &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColStd_SequenceOfReal & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColStd_SequenceOfReal
") Find;
		const TColStd_SequenceOfReal & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColStd_SequenceOfReal
") ChangeFind;
		TColStd_SequenceOfReal & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepFill_DataMapOfShapeSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Draft;
class BRepFill_Draft {
	public:
		%feature("compactdefaultargs") BRepFill_Draft;
		%feature("autodoc", "	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Dir:
	:type Dir: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") BRepFill_Draft;
		 BRepFill_Draft (const TopoDS_Shape & Shape,const gp_Dir & Dir,const Standard_Real Angle);
		%feature("compactdefaultargs") SetOptions;
		%feature("autodoc", "	:param Style: default value is BRepFill_Right
	:type Style: BRepFill_TransitionStyle
	:param AngleMin: default value is 0.01
	:type AngleMin: float
	:param AngleMax: default value is 3.0
	:type AngleMax: float
	:rtype: None
") SetOptions;
		void SetOptions (const BRepFill_TransitionStyle Style = BRepFill_Right,const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 3.0);
		%feature("compactdefaultargs") SetDraft;
		%feature("autodoc", "	:param IsInternal: default value is Standard_False
	:type IsInternal: bool
	:rtype: None
") SetDraft;
		void SetDraft (const Standard_Boolean IsInternal = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param LengthMax:
	:type LengthMax: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real LengthMax);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param KeepInsideSurface: default value is Standard_True
	:type KeepInsideSurface: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom_Surface & Surface,const Standard_Boolean KeepInsideSurface = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param StopShape:
	:type StopShape: TopoDS_Shape &
	:param KeepOutSide: default value is Standard_True
	:type KeepOutSide: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & StopShape,const Standard_Boolean KeepOutSide = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Returns the draft surface To have the complete shape you have to use the Shape() methode.

	:rtype: TopoDS_Shell
") Shell;
		TopoDS_Shell Shell ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
};


%extend BRepFill_Draft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_EdgeFaceAndOrder;
class BRepFill_EdgeFaceAndOrder {
	public:
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", "	:rtype: None
") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder ();
		%feature("compactdefaultargs") BRepFill_EdgeFaceAndOrder;
		%feature("autodoc", "	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param aFace:
	:type aFace: TopoDS_Face &
	:param anOrder:
	:type anOrder: GeomAbs_Shape
	:rtype: None
") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder (const TopoDS_Edge & anEdge,const TopoDS_Face & aFace,const GeomAbs_Shape anOrder);
};


%extend BRepFill_EdgeFaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Evolved;
class BRepFill_Evolved {
	public:
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "	:rtype: None
") BRepFill_Evolved;
		 BRepFill_Evolved ();
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "	* Creates an evolved shape by sweeping the <Profile> along the <Spine>. <AxeProf> is used to set the position of <Profile> along <Spine> as follows: <AxeProf> slides on the profile with direction colinear to the normal to <Spine>, and its <XDirection> mixed with the tangent to <Spine>.

	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Wire &
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None
") BRepFill_Evolved;
		 BRepFill_Evolved (const TopoDS_Wire & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("compactdefaultargs") BRepFill_Evolved;
		%feature("autodoc", "	* Creates an evolved shape by sweeping the <Profile> along the <Spine>

	:param Spine:
	:type Spine: TopoDS_Face &
	:param Profile:
	:type Profile: TopoDS_Wire &
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None
") BRepFill_Evolved;
		 BRepFill_Evolved (const TopoDS_Face & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs an evolved shape by sweeping the <Profile> along the <Spine>

	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Wire &
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Wire & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs an evolved shape by sweeping the <Profile> along the <Spine>

	:param Spine:
	:type Spine: TopoDS_Face &
	:param Profile:
	:type Profile: TopoDS_Wire &
	:param AxeProf:
	:type AxeProf: gp_Ax3
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Solid: default value is Standard_False
	:type Solid: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Face & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the generated shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "	* Returns the shapes created from a subshape <SpineShape> of the spine and a subshape <ProfShape> on the profile.

	:param SpineShape:
	:type SpineShape: TopoDS_Shape &
	:param ProfShape:
	:type ProfShape: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape,const TopoDS_Shape & ProfShape);
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", "	:rtype: GeomAbs_JoinType
") JoinType;
		GeomAbs_JoinType JoinType ();
		%feature("compactdefaultargs") Top;
		%feature("autodoc", "	* Return the face Top if <Solid> is True in the constructor.

	:rtype: TopoDS_Shape
") Top;
		const TopoDS_Shape  Top ();
		%feature("compactdefaultargs") Bottom;
		%feature("autodoc", "	* Return the face Bottom if <Solid> is True in the constructor.

	:rtype: TopoDS_Shape
") Bottom;
		const TopoDS_Shape  Bottom ();
};


%extend BRepFill_Evolved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_FaceAndOrder;
class BRepFill_FaceAndOrder {
	public:
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", "	:rtype: None
") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder ();
		%feature("compactdefaultargs") BRepFill_FaceAndOrder;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param anOrder:
	:type anOrder: GeomAbs_Shape
	:rtype: None
") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder (const TopoDS_Face & aFace,const GeomAbs_Shape anOrder);
};


%extend BRepFill_FaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Filling;
class BRepFill_Filling {
	public:
		%feature("compactdefaultargs") BRepFill_Filling;
		%feature("autodoc", "	* Constructor

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
	:rtype: None
") BRepFill_Filling;
		 BRepFill_Filling (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("compactdefaultargs") SetConstrParam;
		%feature("autodoc", "	* Sets the values of Tolerances used to control the constraint. Tol2d: Tol3d: it is the maximum distance allowed between the support surface and the constraints TolAng: it is the maximum angle allowed between the normal of the surface and the constraints TolCurv: it is the maximum difference of curvature allowed between the surface and the constraint

	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:rtype: None
") SetConstrParam;
		void SetConstrParam (const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("compactdefaultargs") SetResolParam;
		%feature("autodoc", "	* Sets the parameters used for resolution. The default values of these parameters have been chosen for a good ratio quality/performance. Degree: it is the order of energy criterion to minimize for computing the deformation of the surface. The default value is 3 The recommanded value is i+2 where i is the maximum order of the constraints. NbPtsOnCur: it is the average number of points for discretisation of the edges. NbIter: it is the maximum number of iterations of the process. For each iteration the number of discretisation points is increased. Anisotropie:

	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 15
	:type NbPtsOnCur: int
	:param NbIter: default value is 2
	:type NbIter: int
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:rtype: None
") SetResolParam;
		void SetResolParam (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False);
		%feature("compactdefaultargs") SetApproxParam;
		%feature("autodoc", "	* Sets the parameters used for approximation of the surface

	:param MaxDeg: default value is 8
	:type MaxDeg: int
	:param MaxSegments: default value is 9
	:type MaxSegments: int
	:rtype: None
") SetApproxParam;
		void SetApproxParam (const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "	* Loads the initial Surface The initial surface must have orthogonal local coordinates, i.e. partial derivatives dS/du and dS/dv must be orthogonal at each point of surface. If this condition breaks, distortions of resulting surface are possible.

	:param aFace:
	:type aFace: TopoDS_Face &
	:rtype: None
") LoadInitSurface;
		void LoadInitSurface (const TopoDS_Face & aFace);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0 : the surface has to pass by 3D representation of the edge GeomAbs_G1 : the surface has to pass by 3D representation of the edge and to respect tangency with the first face of the edge GeomAbs_G2 : the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the first face of the edge.

	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param Order:
	:type Order: GeomAbs_Shape
	:param IsBound: default value is Standard_True
	:type IsBound: bool
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Edge & anEdge,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a new constraint which also defines an edge of the wire of the face Order: Order of the constraint: GeomAbs_C0 : the surface has to pass by 3D representation of the edge GeomAbs_G1 : the surface has to pass by 3D representation of the edge and to respect tangency with the given face GeomAbs_G2 : the surface has to pass by 3D representation of the edge and to respect tangency and curvature with the given face.

	:param anEdge:
	:type anEdge: TopoDS_Edge &
	:param Support:
	:type Support: TopoDS_Face &
	:param Order:
	:type Order: GeomAbs_Shape
	:param IsBound: default value is Standard_True
	:type IsBound: bool
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Edge & anEdge,const TopoDS_Face & Support,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a free constraint on a face. The corresponding edge has to be automatically recomputed. It is always a bound.

	:param Support:
	:type Support: TopoDS_Face &
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a punctual constraint

	:param Point:
	:type Point: gp_Pnt
	:rtype: int
") Add;
		Standard_Integer Add (const gp_Pnt & Point);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a punctual constraint.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Support:
	:type Support: TopoDS_Face &
	:param Order:
	:type Order: GeomAbs_Shape
	:rtype: int
") Add;
		Standard_Integer Add (const Standard_Real U,const Standard_Real V,const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting faces

	:rtype: None
") Build;
		void Build ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		TopoDS_Face Face ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "	:rtype: float
") G0Error;
		Standard_Real G0Error ();
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "	:rtype: float
") G1Error;
		Standard_Real G1Error ();
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "	:rtype: float
") G2Error;
		Standard_Real G2Error ();
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);
};


%extend BRepFill_Filling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Generator;
class BRepFill_Generator {
	public:
		%feature("compactdefaultargs") BRepFill_Generator;
		%feature("autodoc", "	:rtype: None
") BRepFill_Generator;
		 BRepFill_Generator ();
		%feature("compactdefaultargs") AddWire;
		%feature("autodoc", "	:param Wire:
	:type Wire: TopoDS_Wire &
	:rtype: None
") AddWire;
		void AddWire (const TopoDS_Wire & Wire);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the shell.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell  Shell ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns all the shapes created

	:rtype: TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "	* Returns the shapes created from a subshape <SSection> of a section.

	:param SSection:
	:type SSection: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SSection);
};


%extend BRepFill_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape;
class BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape;
		%feature("autodoc", "	:param K1:
	:type K1: TopoDS_Shape &
	:param K2:
	:type K2: int
	:param I:
	:type I: TopTools_ListOfShape &
	:param n1:
	:type n1: TCollection_MapNodePtr &
	:param n2:
	:type n2: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape;
		 BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("compactdefaultargs") Key1;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key1;
		TopoDS_Shape  Key1 ();

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetKey2() {
                return (Standard_Integer) $self->Key2();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetKey2(Standard_Integer value ) {
                $self->Key2()=value;
                }
            };
            		%feature("compactdefaultargs") Next2;
		%feature("autodoc", "	:rtype: TCollection_MapNodePtr
") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") Value;
		TopTools_ListOfShape & Value ();
};


%extend BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape::Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape;
class Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape();
        Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape(const Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape &aHandle);
        Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape(const BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
    BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape* _get_reference() {
    return (BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape*)$self->Access();
    }
};

%extend Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
class BRepFill_IndexedDataMapOfOrientedShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
		 BRepFill_IndexedDataMapOfOrientedShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_IndexedDataMapOfOrientedShapeListOfShape &
	:rtype: BRepFill_IndexedDataMapOfOrientedShapeListOfShape
") Assign;
		BRepFill_IndexedDataMapOfOrientedShapeListOfShape & Assign (const BRepFill_IndexedDataMapOfOrientedShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_IndexedDataMapOfOrientedShapeListOfShape &
	:rtype: BRepFill_IndexedDataMapOfOrientedShapeListOfShape
") operator =;
		BRepFill_IndexedDataMapOfOrientedShapeListOfShape & operator = (const BRepFill_IndexedDataMapOfOrientedShapeListOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_ListOfShape &
	:rtype: int
") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:param I:
	:type I: int
	:param K:
	:type K: TopoDS_Shape &
	:param T:
	:type T: TopTools_ListOfShape &
	:rtype: None
") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopTools_ListOfShape & T);
		%feature("compactdefaultargs") RemoveLast;
		%feature("autodoc", "	:rtype: None
") RemoveLast;
		void RemoveLast ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindKey;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopoDS_Shape
") FindKey;
		const TopoDS_Shape  FindKey (const Standard_Integer I);
		%feature("compactdefaultargs") FindFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") ChangeFromIndex;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") ChangeFromIndex;
		TopTools_ListOfShape & ChangeFromIndex (const Standard_Integer I);
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: int
") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") ChangeFromKey;
		TopTools_ListOfShape & ChangeFromKey (const TopoDS_Shape & K);
		%feature("compactdefaultargs") FindFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFromKey1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%extend BRepFill_IndexedDataMapOfOrientedShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ListIteratorOfListOfOffsetWire;
class BRepFill_ListIteratorOfListOfOffsetWire {
	public:
		%feature("compactdefaultargs") BRepFill_ListIteratorOfListOfOffsetWire;
		%feature("autodoc", "	:rtype: None
") BRepFill_ListIteratorOfListOfOffsetWire;
		 BRepFill_ListIteratorOfListOfOffsetWire ();
		%feature("compactdefaultargs") BRepFill_ListIteratorOfListOfOffsetWire;
		%feature("autodoc", "	:param L:
	:type L: BRepFill_ListOfOffsetWire &
	:rtype: None
") BRepFill_ListIteratorOfListOfOffsetWire;
		 BRepFill_ListIteratorOfListOfOffsetWire (const BRepFill_ListOfOffsetWire & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: BRepFill_ListOfOffsetWire &
	:rtype: None
") Initialize;
		void Initialize (const BRepFill_ListOfOffsetWire & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepFill_OffsetWire
") Value;
		BRepFill_OffsetWire & Value ();
};


%extend BRepFill_ListIteratorOfListOfOffsetWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ListNodeOfListOfOffsetWire;
class BRepFill_ListNodeOfListOfOffsetWire : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepFill_ListNodeOfListOfOffsetWire;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepFill_ListNodeOfListOfOffsetWire;
		 BRepFill_ListNodeOfListOfOffsetWire (const BRepFill_OffsetWire & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepFill_OffsetWire
") Value;
		BRepFill_OffsetWire & Value ();
};


%extend BRepFill_ListNodeOfListOfOffsetWire {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_ListNodeOfListOfOffsetWire(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_ListNodeOfListOfOffsetWire::Handle_BRepFill_ListNodeOfListOfOffsetWire %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_ListNodeOfListOfOffsetWire;
class Handle_BRepFill_ListNodeOfListOfOffsetWire : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepFill_ListNodeOfListOfOffsetWire();
        Handle_BRepFill_ListNodeOfListOfOffsetWire(const Handle_BRepFill_ListNodeOfListOfOffsetWire &aHandle);
        Handle_BRepFill_ListNodeOfListOfOffsetWire(const BRepFill_ListNodeOfListOfOffsetWire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_ListNodeOfListOfOffsetWire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_ListNodeOfListOfOffsetWire {
    BRepFill_ListNodeOfListOfOffsetWire* _get_reference() {
    return (BRepFill_ListNodeOfListOfOffsetWire*)$self->Access();
    }
};

%extend Handle_BRepFill_ListNodeOfListOfOffsetWire {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_ListNodeOfListOfOffsetWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ListOfOffsetWire;
class BRepFill_ListOfOffsetWire {
	public:
		%feature("compactdefaultargs") BRepFill_ListOfOffsetWire;
		%feature("autodoc", "	:rtype: None
") BRepFill_ListOfOffsetWire;
		 BRepFill_ListOfOffsetWire ();
		%feature("compactdefaultargs") BRepFill_ListOfOffsetWire;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:rtype: None
") BRepFill_ListOfOffsetWire;
		 BRepFill_ListOfOffsetWire (const BRepFill_ListOfOffsetWire & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:rtype: None
") Assign;
		void Assign (const BRepFill_ListOfOffsetWire & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:rtype: None
") operator =;
		void operator = (const BRepFill_ListOfOffsetWire & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:rtype: None
") Prepend;
		void Prepend (const BRepFill_OffsetWire & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:param theIt:
	:type theIt: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") Prepend;
		void Prepend (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:rtype: None
") Prepend;
		void Prepend (BRepFill_ListOfOffsetWire & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:rtype: None
") Append;
		void Append (const BRepFill_OffsetWire & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:param theIt:
	:type theIt: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") Append;
		void Append (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:rtype: None
") Append;
		void Append (BRepFill_ListOfOffsetWire & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepFill_OffsetWire
") First;
		BRepFill_OffsetWire & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepFill_OffsetWire
") Last;
		BRepFill_OffsetWire & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") Remove;
		void Remove (BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:param It:
	:type It: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") InsertBefore;
		void InsertBefore (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:param It:
	:type It: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") InsertBefore;
		void InsertBefore (BRepFill_ListOfOffsetWire & Other,BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_OffsetWire &
	:param It:
	:type It: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") InsertAfter;
		void InsertAfter (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_ListOfOffsetWire &
	:param It:
	:type It: BRepFill_ListIteratorOfListOfOffsetWire &
	:rtype: None
") InsertAfter;
		void InsertAfter (BRepFill_ListOfOffsetWire & Other,BRepFill_ListIteratorOfListOfOffsetWire & It);
};


%extend BRepFill_ListOfOffsetWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_LocationLaw;
class BRepFill_LocationLaw : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* Return a error status, if the status is not PipeOk then it exist a parameter tlike the law is not valuable for t.

	:rtype: GeomFill_PipeError
") GetStatus;
		GeomFill_PipeError GetStatus ();
		%feature("compactdefaultargs") TransformInG0Law;
		%feature("autodoc", "	* Apply a linear transformation on each law, to have continuity of the global law beetween the edges.

	:rtype: void
") TransformInG0Law;
		virtual void TransformInG0Law ();
		%feature("compactdefaultargs") TransformInCompatibleLaw;
		%feature("autodoc", "	* Apply a linear transformation on each law, to reduce the dicontinuities of law at one rotation.

	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: void
") TransformInCompatibleLaw;
		virtual void TransformInCompatibleLaw (const Standard_Real AngularTolerance);
		%feature("compactdefaultargs") DeleteTransform;
		%feature("autodoc", "	:rtype: None
") DeleteTransform;
		void DeleteTransform ();
		%feature("compactdefaultargs") NbHoles;
		%feature("autodoc", "	:param Tol: default value is 1.0e-7
	:type Tol: float
	:rtype: int
") NbHoles;
		Standard_Integer NbHoles (const Standard_Real Tol = 1.0e-7);
		%feature("compactdefaultargs") Holes;
		%feature("autodoc", "	:param Interval:
	:type Interval: TColStd_Array1OfInteger &
	:rtype: None
") Holes;
		void Holes (TColStd_Array1OfInteger & Interval);
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "	* Return the number of elementary Law

	:rtype: int
") NbLaw;
		Standard_Integer NbLaw ();
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "	* Return the elementary Law of rank <Index> <Index> have to be in [1, NbLaw()]

	:param Index:
	:type Index: int
	:rtype: Handle_GeomFill_LocationLaw
") Law;
		Handle_GeomFill_LocationLaw Law (const Standard_Integer Index);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* return the path

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Return the Edge of rank <Index> in the path <Index> have to be in [1, NbLaw()]

	:param Index:
	:type Index: int
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer Index);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Return the vertex of rank <Index> in the path <Index> have to be in [0, NbLaw()]

	:param Index:
	:type Index: int
	:rtype: TopoDS_Vertex
") Vertex;
		TopoDS_Vertex Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") PerformVertex;
		%feature("autodoc", "	* Compute <OutputVertex> like a transformation of <InputVertex> the transformation is given by evaluation of the location law in the vertex of rank <Index>. <Location> is used to manage discontinuities : - -1 : The law before the vertex is used. - 1 : The law after the vertex is used. - 0 : Average of the both laws is used.

	:param Index:
	:type Index: int
	:param InputVertex:
	:type InputVertex: TopoDS_Vertex &
	:param TolMin:
	:type TolMin: float
	:param OutputVertex:
	:type OutputVertex: TopoDS_Vertex &
	:param Location: default value is 0
	:type Location: int
	:rtype: None
") PerformVertex;
		void PerformVertex (const Standard_Integer Index,const TopoDS_Vertex & InputVertex,const Standard_Real TolMin,TopoDS_Vertex & OutputVertex,const Standard_Integer Location = 0);
		%feature("compactdefaultargs") CurvilinearBounds;
		%feature("autodoc", "	* Return the Curvilinear Bounds of the <Index> Law

	:param Index:
	:type Index: int
	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: None
") CurvilinearBounds;
		void CurvilinearBounds (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "	* Compute the Law's continuity beetween 2 edges of the path The result can be : -1 : Case Not connex 0 : It is connex (G0) 1 : It is tangent (G1)

	:param Index:
	:type Index: int
	:param SpatialTolerance: default value is 1.0e-7
	:type SpatialTolerance: float
	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: int
") IsG1;
		Standard_Integer IsG1 (const Standard_Integer Index,const Standard_Real SpatialTolerance = 1.0e-7,const Standard_Real AngularTolerance = 1.0e-4);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Apply the Law to a shape, for a given Curnilinear abscissa

	:param Abscissa:
	:type Abscissa: float
	:param Section:
	:type Section: TopoDS_Shape &
	:rtype: None
") D0;
		void D0 (const Standard_Real Abscissa,TopoDS_Shape & Section);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Find the index Law and the parmaeter, for a given Curnilinear abscissa

	:param Abscissa:
	:type Abscissa: float
	:param Index:
	:type Index: int &
	:param Param:
	:type Param: float &
	:rtype: None
") Parameter;
		void Parameter (const Standard_Real Abscissa,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "	* Return the curvilinear abscissa corresponding to a point of the path, defined by <Index> of Edge and a parameter on the edge.

	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float
") Abscissa;
		Standard_Real Abscissa (const Standard_Integer Index,const Standard_Real Param);
};


%extend BRepFill_LocationLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_LocationLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_LocationLaw::Handle_BRepFill_LocationLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_LocationLaw;
class Handle_BRepFill_LocationLaw : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepFill_LocationLaw();
        Handle_BRepFill_LocationLaw(const Handle_BRepFill_LocationLaw &aHandle);
        Handle_BRepFill_LocationLaw(const BRepFill_LocationLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_LocationLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_LocationLaw {
    BRepFill_LocationLaw* _get_reference() {
    return (BRepFill_LocationLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_LocationLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_LocationLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_MultiLine;
class BRepFill_MultiLine : public AppCont_Function {
	public:
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", "	:rtype: None
") BRepFill_MultiLine;
		 BRepFill_MultiLine ();
		%feature("compactdefaultargs") BRepFill_MultiLine;
		%feature("autodoc", "	:param Face1:
	:type Face1: TopoDS_Face &
	:param Face2:
	:type Face2: TopoDS_Face &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Inv1:
	:type Inv1: bool
	:param Inv2:
	:type Inv2: bool
	:param Bissec:
	:type Bissec: Handle_Geom2d_Curve &
	:rtype: None
") BRepFill_MultiLine;
		 BRepFill_MultiLine (const TopoDS_Face & Face1,const TopoDS_Face & Face2,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Boolean Inv1,const Standard_Boolean Inv2,const Handle_Geom2d_Curve & Bissec);
		%feature("compactdefaultargs") IsParticularCase;
		%feature("autodoc", "	* Search if the Projection of the Bissectrice on the faces needs an approximation or not. Returns true if the approximation is not needed.

	:rtype: bool
") IsParticularCase;
		Standard_Boolean IsParticularCase ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Returns the continuity betwwen the two faces seShape from GeomAbsparated by myBis.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "	* raises if IsParticularCase is <False>.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param PCurve1:
	:type PCurve1: Handle_Geom2d_Curve &
	:param PCurve2:
	:type PCurve2: Handle_Geom2d_Curve &
	:rtype: None
") Curves;
		void Curves (Handle_Geom_Curve & Curve,Handle_Geom2d_Curve & PCurve1,Handle_Geom2d_Curve & PCurve2);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* returns the first parameter of the Bissectrice.

	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* returns the last parameter of the Bissectrice.

	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current point on the 3d curve

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") ValueOnF1;
		%feature("autodoc", "	* returns the current point on the PCurve of the first face

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") ValueOnF1;
		gp_Pnt2d ValueOnF1 (const Standard_Real U);
		%feature("compactdefaultargs") ValueOnF2;
		%feature("autodoc", "	* returns the current point on the PCurve of the first face

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") ValueOnF2;
		gp_Pnt2d ValueOnF2 (const Standard_Real U);
		%feature("compactdefaultargs") Value3dOnF1OnF2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P3d:
	:type P3d: gp_Pnt
	:param PF1:
	:type PF1: gp_Pnt2d
	:param PF2:
	:type PF2: gp_Pnt2d
	:rtype: None
") Value3dOnF1OnF2;
		void Value3dOnF1OnF2 (const Standard_Real U,gp_Pnt & P3d,gp_Pnt2d & PF1,gp_Pnt2d & PF2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point at parameter <theU>.

	:param theU:
	:type theU: float
	:param thePnt2d:
	:type thePnt2d: NCollection_Array1<gp_Pnt2d>
	:param thePnt:
	:type thePnt: NCollection_Array1<gp_Pnt>
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real theU,NCollection_Array1<gp_Pnt2d> & thePnt2d,NCollection_Array1<gp_Pnt> & thePnt);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Returns the derivative at parameter <theU>.

	:param theU:
	:type theU: float
	:param theVec2d:
	:type theVec2d: NCollection_Array1<gp_Vec2d>
	:param theVec:
	:type theVec: NCollection_Array1<gp_Vec>
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real theU,NCollection_Array1<gp_Vec2d> & theVec2d,NCollection_Array1<gp_Vec> & theVec);
};


%extend BRepFill_MultiLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_OffsetAncestors;
class BRepFill_OffsetAncestors {
	public:
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", "	:rtype: None
") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors ();
		%feature("compactdefaultargs") BRepFill_OffsetAncestors;
		%feature("autodoc", "	:param Paral:
	:type Paral: BRepFill_OffsetWire &
	:rtype: None
") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors (BRepFill_OffsetWire & Paral);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Paral:
	:type Paral: BRepFill_OffsetWire &
	:rtype: None
") Perform;
		void Perform (BRepFill_OffsetWire & Paral);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Edge &
	:rtype: bool
") HasAncestor;
		Standard_Boolean HasAncestor (const TopoDS_Edge & S1);
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "	* may return a Null Shape if S1 is not a subShape of <Paral>; if Perform is not done.

	:param S1:
	:type S1: TopoDS_Edge &
	:rtype: TopoDS_Shape
") Ancestor;
		const TopoDS_Shape  Ancestor (const TopoDS_Edge & S1);
};


%extend BRepFill_OffsetAncestors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_OffsetWire;
class BRepFill_OffsetWire {
	public:
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "	:rtype: None
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire ();
		%feature("compactdefaultargs") BRepFill_OffsetWire;
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Face &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None
") BRepFill_OffsetWire;
		 BRepFill_OffsetWire (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the evaluation of Offseting.

	:param Spine:
	:type Spine: TopoDS_Face &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param IsOpenResult: default value is Standard_False
	:type IsOpenResult: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean IsOpenResult = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs an OffsetWire at an altitude <Alt> from the face ( According to the orientation of the face)

	:param Offset:
	:type Offset: float
	:param Alt: default value is 0.0
	:type Alt: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Offset,const Standard_Real Alt = 0.0);
		%feature("compactdefaultargs") PerformWithBiLo;
		%feature("autodoc", "	* Performs an OffsetWire

	:param WSP:
	:type WSP: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param Locus:
	:type Locus: BRepMAT2d_BisectingLocus &
	:param Link:
	:type Link: BRepMAT2d_LinkTopoBilo &
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Alt: default value is 0.0
	:type Alt: float
	:rtype: None
") PerformWithBiLo;
		void PerformWithBiLo (const TopoDS_Face & WSP,const Standard_Real Offset,const BRepMAT2d_BisectingLocus & Locus,BRepMAT2d_LinkTopoBilo & Link,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Real Alt = 0.0);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Spine;
		const TopoDS_Face  Spine ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the generated shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") GeneratedShapes;
		%feature("autodoc", "	* Returns the shapes created from a subshape <SpineShape> of the spine. Returns the last computed Offset.

	:param SpineShape:
	:type SpineShape: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape);
		%feature("compactdefaultargs") JoinType;
		%feature("autodoc", "	:rtype: GeomAbs_JoinType
") JoinType;
		GeomAbs_JoinType JoinType ();
};


%extend BRepFill_OffsetWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Pipe;
class BRepFill_Pipe {
	public:
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "	:rtype: None
") BRepFill_Pipe;
		 BRepFill_Pipe ();
		%feature("compactdefaultargs") BRepFill_Pipe;
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Shape &
	:param aMode: default value is GeomFill_IsCorrectedFrenet
	:type aMode: GeomFill_Trihedron
	:param ForceApproxC1: default value is Standard_False
	:type ForceApproxC1: bool
	:param GeneratePartCase: default value is Standard_False
	:type GeneratePartCase: bool
	:rtype: None
") BRepFill_Pipe;
		 BRepFill_Pipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const GeomFill_Trihedron aMode = GeomFill_IsCorrectedFrenet,const Standard_Boolean ForceApproxC1 = Standard_False,const Standard_Boolean GeneratePartCase = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Spine:
	:type Spine: TopoDS_Wire &
	:param Profile:
	:type Profile: TopoDS_Shape &
	:param GeneratePartCase: default value is Standard_False
	:type GeneratePartCase: bool
	:rtype: None
") Perform;
		void Perform (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const Standard_Boolean GeneratePartCase = Standard_False);
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Spine;
		const TopoDS_Shape  Spine ();
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Profile;
		const TopoDS_Shape  Profile ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "	:rtype: float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the face created from an edge of the spine and an edge of the profile. if the edges are not in the spine or the profile

	:param ESpine:
	:type ESpine: TopoDS_Edge &
	:param EProfile:
	:type EProfile: TopoDS_Edge &
	:rtype: TopoDS_Face
") Face;
		TopoDS_Face Face (const TopoDS_Edge & ESpine,const TopoDS_Edge & EProfile);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the edge created from an edge of the spine and a vertex of the profile. if the edge or the vertex are not in the spine or the profile.

	:param ESpine:
	:type ESpine: TopoDS_Edge &
	:param VProfile:
	:type VProfile: TopoDS_Vertex &
	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge Edge (const TopoDS_Edge & ESpine,const TopoDS_Vertex & VProfile);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Returns the shape created from the profile at the position of the vertex VSpine. if the vertex is not in the Spine

	:param VSpine:
	:type VSpine: TopoDS_Vertex &
	:rtype: TopoDS_Shape
") Section;
		TopoDS_Shape Section (const TopoDS_Vertex & VSpine);
		%feature("compactdefaultargs") PipeLine;
		%feature("autodoc", "	* Create a Wire by sweeping the Point along the <spine> if the <Spine> is undefined

	:param Point:
	:type Point: gp_Pnt
	:rtype: TopoDS_Wire
") PipeLine;
		TopoDS_Wire PipeLine (const gp_Pnt & Point);
};


%extend BRepFill_Pipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_PipeShell;
class BRepFill_PipeShell : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BRepFill_PipeShell;
		%feature("autodoc", "	* Set an sweep's mode If no mode are setted, the mode use in MakePipe is used

	:param Spine:
	:type Spine: TopoDS_Wire &
	:rtype: None
") BRepFill_PipeShell;
		 BRepFill_PipeShell (const TopoDS_Wire & Spine);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set an Frenet or an CorrectedFrenet trihedron to perform the sweeping

	:param Frenet: default value is Standard_False
	:type Frenet: bool
	:rtype: None
") Set;
		void Set (const Standard_Boolean Frenet = Standard_False);
		%feature("compactdefaultargs") SetDiscrete;
		%feature("autodoc", "	* Set a Discrete trihedron to perform the sweeping

	:rtype: None
") SetDiscrete;
		void SetDiscrete ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set an fixed trihedron to perform the sweeping all sections will be parallel.

	:param Axe:
	:type Axe: gp_Ax2
	:rtype: None
") Set;
		void Set (const gp_Ax2 & Axe);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set an fixed BiNormal direction to perform the sweeping

	:param BiNormal:
	:type BiNormal: gp_Dir
	:rtype: None
") Set;
		void Set (const gp_Dir & BiNormal);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set support to the spine to define the BiNormal at the spine, like the normal the surfaces. Warning: To be effective, Each edge of the <spine> must have an representaion on one face of<SpineSupport>

	:param SpineSupport:
	:type SpineSupport: TopoDS_Shape &
	:rtype: bool
") Set;
		Standard_Boolean Set (const TopoDS_Shape & SpineSupport);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Set an auxiliary spine to define the Normal For each Point of the Spine P, an Point Q is evalued on <AuxiliarySpine> If <CurvilinearEquivalence> Q split <AuxiliarySpine> with the same length ratio than P split <Spline>. Else the plan define by P and the tangent to the <Spine> intersect <AuxiliarySpine> in Q. If <KeepContact> equals BRepFill_NoContact: The Normal is defined by the vector PQ. If <KeepContact> equals BRepFill_Contact: The Normal is defined to achieve that the sweeped section is in contact to the auxiliarySpine. The width of section is constant all along the path. In other words, the auxiliary spine lies on the swept surface, but not necessarily is a boundary of this surface. However, the auxiliary spine has to be close enough to the main spine to provide intersection with any section all along the path. If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine becomes a boundary of the swept surface and the width of section varies along the path.

	:param AuxiliarySpine:
	:type AuxiliarySpine: TopoDS_Wire &
	:param CurvilinearEquivalence: default value is Standard_True
	:type CurvilinearEquivalence: bool
	:param KeepContact: default value is BRepFill_NoContact
	:type KeepContact: BRepFill_TypeOfContact
	:rtype: None
") Set;
		void Set (const TopoDS_Wire & AuxiliarySpine,const Standard_Boolean CurvilinearEquivalence = Standard_True,const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);
		%feature("compactdefaultargs") SetMaxDegree;
		%feature("autodoc", "	* Define the maximum V degree of resulting surface

	:param NewMaxDegree:
	:type NewMaxDegree: int
	:rtype: None
") SetMaxDegree;
		void SetMaxDegree (const Standard_Integer NewMaxDegree);
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "	* Define the maximum number of spans in V-direction on resulting surface

	:param NewMaxSegments:
	:type NewMaxSegments: int
	:rtype: None
") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer NewMaxSegments);
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "	* Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0. Give section to sweep. Possibilities are : - Give one or sevral profile - Give one profile and an homotetic law. - Automatic compute of correspondance beetween profile, and section on the sweeped shape - correspondance beetween profile, and section on the sweeped shape defined by a vertex of the spine

	:param ForceApproxC1:
	:type ForceApproxC1: bool
	:rtype: None
") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Set an section. The corespondance with the spine, will be automaticaly performed.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & Profile,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Set an section. The corespondance with the spine, is given by <Location>

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param Location:
	:type Location: TopoDS_Vertex &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & Profile,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "	* Set an section and an homotetic law. The homotetie's centers is given by point on the <Spine>.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param L:
	:type L: Handle_Law_Function &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "	* Set an section and an homotetic law. The homotetie center is given by point on the <Spine>

	:param Profile:
	:type Profile: TopoDS_Shape &
	:param L:
	:type L: Handle_Law_Function &
	:param Location:
	:type Location: TopoDS_Vertex &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Delete an section.

	:param Profile:
	:type Profile: TopoDS_Shape &
	:rtype: None
") Delete;
		void Delete (const TopoDS_Shape & Profile);
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "	* Say if <self> is ready to build the shape return False if <self> do not have section definition

	:rtype: bool
") IsReady;
		Standard_Boolean IsReady ();
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "	* Get a status, when Simulate or Build failed.

	:rtype: GeomFill_PipeError
") GetStatus;
		GeomFill_PipeError GetStatus ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol3d: default value is 1.0e-4
	:type Tol3d: float
	:param BoundTol: default value is 1.0e-4
	:type BoundTol: float
	:param TolAngular: default value is 1.0e-2
	:type TolAngular: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d = 1.0e-4,const Standard_Real BoundTol = 1.0e-4,const Standard_Real TolAngular = 1.0e-2);
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "	* Set the Transition Mode to manage discontinuities on the sweep.

	:param Mode: default value is BRepFill_Modified
	:type Mode: BRepFill_TransitionStyle
	:param Angmin: default value is 1.0e-2
	:type Angmin: float
	:param Angmax: default value is 6.0
	:type Angmax: float
	:rtype: None
") SetTransition;
		void SetTransition (const BRepFill_TransitionStyle Mode = BRepFill_Modified,const Standard_Real Angmin = 1.0e-2,const Standard_Real Angmax = 6.0);
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "	* Perform simulation of the sweep : Somes Section are returned.

	:param NumberOfSection:
	:type NumberOfSection: int
	:param Sections:
	:type Sections: TopTools_ListOfShape &
	:rtype: None
") Simulate;
		void Simulate (const Standard_Integer NumberOfSection,TopTools_ListOfShape & Sections);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds the resulting shape (redefined from MakeShape).

	:rtype: bool
") Build;
		Standard_Boolean Build ();
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "	* Transform the sweeping Shell in Solid. If the section are not closed returns False

	:rtype: bool
") MakeSolid;
		Standard_Boolean MakeSolid ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the result Shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "	:rtype: float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the bottom of the sweep.

	:rtype: TopoDS_Shape
") FirstShape;
		const TopoDS_Shape  FirstShape ();
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "	* Returns the TopoDS Shape of the top of the sweep.

	:rtype: TopoDS_Shape
") LastShape;
		const TopoDS_Shape  LastShape ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Generated;
		void Generated (const TopoDS_Shape & S,TopTools_ListOfShape & L);
};


%extend BRepFill_PipeShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_PipeShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_PipeShell::Handle_BRepFill_PipeShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_PipeShell;
class Handle_BRepFill_PipeShell : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepFill_PipeShell();
        Handle_BRepFill_PipeShell(const Handle_BRepFill_PipeShell &aHandle);
        Handle_BRepFill_PipeShell(const BRepFill_PipeShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_PipeShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_PipeShell {
    BRepFill_PipeShell* _get_reference() {
    return (BRepFill_PipeShell*)$self->Access();
    }
};

%extend Handle_BRepFill_PipeShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_PipeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Section;
class BRepFill_Section {
	public:
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", "	:rtype: None
") BRepFill_Section;
		 BRepFill_Section ();
		%feature("compactdefaultargs") BRepFill_Section;
		%feature("autodoc", "	:param Profile:
	:type Profile: TopoDS_Shape &
	:param V:
	:type V: TopoDS_Vertex &
	:param WithContact:
	:type WithContact: bool
	:param WithCorrection:
	:type WithCorrection: bool
	:rtype: None
") BRepFill_Section;
		 BRepFill_Section (const TopoDS_Shape & Profile,const TopoDS_Vertex & V,const Standard_Boolean WithContact,const Standard_Boolean WithCorrection);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param IsLaw:
	:type IsLaw: bool
	:rtype: None
") Set;
		void Set (const Standard_Boolean IsLaw);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("compactdefaultargs") IsLaw;
		%feature("autodoc", "	:rtype: bool
") IsLaw;
		Standard_Boolean IsLaw ();
		%feature("compactdefaultargs") WithContact;
		%feature("autodoc", "	:rtype: bool
") WithContact;
		Standard_Boolean WithContact ();
		%feature("compactdefaultargs") WithCorrection;
		%feature("autodoc", "	:rtype: bool
") WithCorrection;
		Standard_Boolean WithCorrection ();
};


%extend BRepFill_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SectionLaw;
class BRepFill_SectionLaw : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") NbLaw;
		%feature("autodoc", "	:rtype: int
") NbLaw;
		Standard_Integer NbLaw ();
		%feature("compactdefaultargs") Law;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_GeomFill_SectionLaw
") Law;
		Handle_GeomFill_SectionLaw Law (const Standard_Integer Index);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Say if the input sahpe is a vertex.

	:rtype: bool
") IsVertex;
		virtual Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "	:rtype: Handle_GeomFill_SectionLaw
") ConcatenedLaw;
		virtual Handle_GeomFill_SectionLaw ConcatenedLaw ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TolAngular:
	:type TolAngular: float
	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float
") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: TopoDS_Vertex
") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,TopoDS_Shape & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & W);
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") CurrentEdge;
		TopoDS_Edge CurrentEdge ();
};


%extend BRepFill_SectionLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_SectionLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_SectionLaw::Handle_BRepFill_SectionLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_SectionLaw;
class Handle_BRepFill_SectionLaw : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepFill_SectionLaw();
        Handle_BRepFill_SectionLaw(const Handle_BRepFill_SectionLaw &aHandle);
        Handle_BRepFill_SectionLaw(const BRepFill_SectionLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_SectionLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_SectionLaw {
    BRepFill_SectionLaw* _get_reference() {
    return (BRepFill_SectionLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_SectionLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_SectionLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SectionPlacement;
class BRepFill_SectionPlacement {
	public:
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "	* Automatic placement

	:param Law:
	:type Law: Handle_BRepFill_LocationLaw &
	:param Section:
	:type Section: TopoDS_Shape &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement (const Handle_BRepFill_LocationLaw & Law,const TopoDS_Shape & Section,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") BRepFill_SectionPlacement;
		%feature("autodoc", "	* Placement on vertex

	:param Law:
	:type Law: Handle_BRepFill_LocationLaw &
	:param Section:
	:type Section: TopoDS_Shape &
	:param Vertex:
	:type Vertex: TopoDS_Shape &
	:param WithContact: default value is Standard_False
	:type WithContact: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: None
") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement (const Handle_BRepFill_LocationLaw & Law,const TopoDS_Shape & Section,const TopoDS_Shape & Vertex,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();
		%feature("compactdefaultargs") AbscissaOnPath;
		%feature("autodoc", "	:rtype: float
") AbscissaOnPath;
		Standard_Real AbscissaOnPath ();
};


%extend BRepFill_SectionPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder;
class BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_EdgeFaceAndOrder &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder;
		 BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder (const BRepFill_EdgeFaceAndOrder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepFill_EdgeFaceAndOrder
") Value;
		BRepFill_EdgeFaceAndOrder & Value ();
};


%extend BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder::Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder;
class Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder();
        Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder(const Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder &aHandle);
        Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder(const BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
    BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder* _get_reference() {
    return (BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder*)$self->Access();
    }
};

%extend Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SequenceNodeOfSequenceOfFaceAndOrder;
class BRepFill_SequenceNodeOfSequenceOfFaceAndOrder : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepFill_SequenceNodeOfSequenceOfFaceAndOrder;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_FaceAndOrder &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepFill_SequenceNodeOfSequenceOfFaceAndOrder;
		 BRepFill_SequenceNodeOfSequenceOfFaceAndOrder (const BRepFill_FaceAndOrder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepFill_FaceAndOrder
") Value;
		BRepFill_FaceAndOrder & Value ();
};


%extend BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder::Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder;
class Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder();
        Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder(const Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder &aHandle);
        Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder(const BRepFill_SequenceNodeOfSequenceOfFaceAndOrder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
    BRepFill_SequenceNodeOfSequenceOfFaceAndOrder* _get_reference() {
    return (BRepFill_SequenceNodeOfSequenceOfFaceAndOrder*)$self->Access();
    }
};

%extend Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SequenceNodeOfSequenceOfSection;
class BRepFill_SequenceNodeOfSequenceOfSection : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") BRepFill_SequenceNodeOfSequenceOfSection;
		%feature("autodoc", "	:param I:
	:type I: BRepFill_Section &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") BRepFill_SequenceNodeOfSequenceOfSection;
		 BRepFill_SequenceNodeOfSequenceOfSection (const BRepFill_Section & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepFill_Section
") Value;
		BRepFill_Section & Value ();
};


%extend BRepFill_SequenceNodeOfSequenceOfSection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_SequenceNodeOfSequenceOfSection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_SequenceNodeOfSequenceOfSection::Handle_BRepFill_SequenceNodeOfSequenceOfSection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_SequenceNodeOfSequenceOfSection;
class Handle_BRepFill_SequenceNodeOfSequenceOfSection : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_BRepFill_SequenceNodeOfSequenceOfSection();
        Handle_BRepFill_SequenceNodeOfSequenceOfSection(const Handle_BRepFill_SequenceNodeOfSequenceOfSection &aHandle);
        Handle_BRepFill_SequenceNodeOfSequenceOfSection(const BRepFill_SequenceNodeOfSequenceOfSection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_SequenceNodeOfSequenceOfSection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_SequenceNodeOfSequenceOfSection {
    BRepFill_SequenceNodeOfSequenceOfSection* _get_reference() {
    return (BRepFill_SequenceNodeOfSequenceOfSection*)$self->Access();
    }
};

%extend Handle_BRepFill_SequenceNodeOfSequenceOfSection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_SequenceNodeOfSequenceOfSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SequenceOfEdgeFaceAndOrder;
class BRepFill_SequenceOfEdgeFaceAndOrder : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepFill_SequenceOfEdgeFaceAndOrder;
		%feature("autodoc", "	:rtype: None
") BRepFill_SequenceOfEdgeFaceAndOrder;
		 BRepFill_SequenceOfEdgeFaceAndOrder ();
		%feature("compactdefaultargs") BRepFill_SequenceOfEdgeFaceAndOrder;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: None
") BRepFill_SequenceOfEdgeFaceAndOrder;
		 BRepFill_SequenceOfEdgeFaceAndOrder (const BRepFill_SequenceOfEdgeFaceAndOrder & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: BRepFill_SequenceOfEdgeFaceAndOrder
") Assign;
		const BRepFill_SequenceOfEdgeFaceAndOrder & Assign (const BRepFill_SequenceOfEdgeFaceAndOrder & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: BRepFill_SequenceOfEdgeFaceAndOrder
") operator =;
		const BRepFill_SequenceOfEdgeFaceAndOrder & operator = (const BRepFill_SequenceOfEdgeFaceAndOrder & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: BRepFill_EdgeFaceAndOrder &
	:rtype: None
") Append;
		void Append (const BRepFill_EdgeFaceAndOrder & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: None
") Append;
		void Append (BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: BRepFill_EdgeFaceAndOrder &
	:rtype: None
") Prepend;
		void Prepend (const BRepFill_EdgeFaceAndOrder & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: None
") Prepend;
		void Prepend (BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepFill_EdgeFaceAndOrder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepFill_EdgeFaceAndOrder & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepFill_EdgeFaceAndOrder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepFill_EdgeFaceAndOrder & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepFill_EdgeFaceAndOrder
") First;
		const BRepFill_EdgeFaceAndOrder & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepFill_EdgeFaceAndOrder
") Last;
		const BRepFill_EdgeFaceAndOrder & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepFill_SequenceOfEdgeFaceAndOrder &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepFill_SequenceOfEdgeFaceAndOrder & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepFill_EdgeFaceAndOrder
") Value;
		const BRepFill_EdgeFaceAndOrder & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: BRepFill_EdgeFaceAndOrder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepFill_EdgeFaceAndOrder & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepFill_EdgeFaceAndOrder
") ChangeValue;
		BRepFill_EdgeFaceAndOrder & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepFill_SequenceOfEdgeFaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SequenceOfFaceAndOrder;
class BRepFill_SequenceOfFaceAndOrder : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepFill_SequenceOfFaceAndOrder;
		%feature("autodoc", "	:rtype: None
") BRepFill_SequenceOfFaceAndOrder;
		 BRepFill_SequenceOfFaceAndOrder ();
		%feature("compactdefaultargs") BRepFill_SequenceOfFaceAndOrder;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfFaceAndOrder &
	:rtype: None
") BRepFill_SequenceOfFaceAndOrder;
		 BRepFill_SequenceOfFaceAndOrder (const BRepFill_SequenceOfFaceAndOrder & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfFaceAndOrder &
	:rtype: BRepFill_SequenceOfFaceAndOrder
") Assign;
		const BRepFill_SequenceOfFaceAndOrder & Assign (const BRepFill_SequenceOfFaceAndOrder & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfFaceAndOrder &
	:rtype: BRepFill_SequenceOfFaceAndOrder
") operator =;
		const BRepFill_SequenceOfFaceAndOrder & operator = (const BRepFill_SequenceOfFaceAndOrder & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: BRepFill_FaceAndOrder &
	:rtype: None
") Append;
		void Append (const BRepFill_FaceAndOrder & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepFill_SequenceOfFaceAndOrder &
	:rtype: None
") Append;
		void Append (BRepFill_SequenceOfFaceAndOrder & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: BRepFill_FaceAndOrder &
	:rtype: None
") Prepend;
		void Prepend (const BRepFill_FaceAndOrder & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepFill_SequenceOfFaceAndOrder &
	:rtype: None
") Prepend;
		void Prepend (BRepFill_SequenceOfFaceAndOrder & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepFill_FaceAndOrder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepFill_FaceAndOrder & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepFill_SequenceOfFaceAndOrder &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepFill_SequenceOfFaceAndOrder & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepFill_FaceAndOrder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepFill_FaceAndOrder & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepFill_SequenceOfFaceAndOrder &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepFill_SequenceOfFaceAndOrder & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepFill_FaceAndOrder
") First;
		const BRepFill_FaceAndOrder & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepFill_FaceAndOrder
") Last;
		const BRepFill_FaceAndOrder & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepFill_SequenceOfFaceAndOrder &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepFill_SequenceOfFaceAndOrder & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepFill_FaceAndOrder
") Value;
		const BRepFill_FaceAndOrder & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: BRepFill_FaceAndOrder &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepFill_FaceAndOrder & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepFill_FaceAndOrder
") ChangeValue;
		BRepFill_FaceAndOrder & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepFill_SequenceOfFaceAndOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_SequenceOfSection;
class BRepFill_SequenceOfSection : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") BRepFill_SequenceOfSection;
		%feature("autodoc", "	:rtype: None
") BRepFill_SequenceOfSection;
		 BRepFill_SequenceOfSection ();
		%feature("compactdefaultargs") BRepFill_SequenceOfSection;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfSection &
	:rtype: None
") BRepFill_SequenceOfSection;
		 BRepFill_SequenceOfSection (const BRepFill_SequenceOfSection & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfSection &
	:rtype: BRepFill_SequenceOfSection
") Assign;
		const BRepFill_SequenceOfSection & Assign (const BRepFill_SequenceOfSection & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepFill_SequenceOfSection &
	:rtype: BRepFill_SequenceOfSection
") operator =;
		const BRepFill_SequenceOfSection & operator = (const BRepFill_SequenceOfSection & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: BRepFill_Section &
	:rtype: None
") Append;
		void Append (const BRepFill_Section & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: BRepFill_SequenceOfSection &
	:rtype: None
") Append;
		void Append (BRepFill_SequenceOfSection & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: BRepFill_Section &
	:rtype: None
") Prepend;
		void Prepend (const BRepFill_Section & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: BRepFill_SequenceOfSection &
	:rtype: None
") Prepend;
		void Prepend (BRepFill_SequenceOfSection & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepFill_Section &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepFill_Section & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepFill_SequenceOfSection &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepFill_SequenceOfSection & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: BRepFill_Section &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepFill_Section & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: BRepFill_SequenceOfSection &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepFill_SequenceOfSection & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepFill_Section
") First;
		const BRepFill_Section & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepFill_Section
") Last;
		const BRepFill_Section & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: BRepFill_SequenceOfSection &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,BRepFill_SequenceOfSection & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepFill_Section
") Value;
		const BRepFill_Section & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: BRepFill_Section &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepFill_Section & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: BRepFill_Section
") ChangeValue;
		BRepFill_Section & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend BRepFill_SequenceOfSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Sweep;
class BRepFill_Sweep {
	public:
		%feature("compactdefaultargs") BRepFill_Sweep;
		%feature("autodoc", "	:param Section:
	:type Section: Handle_BRepFill_SectionLaw &
	:param Location:
	:type Location: Handle_BRepFill_LocationLaw &
	:param WithKPart:
	:type WithKPart: bool
	:rtype: None
") BRepFill_Sweep;
		 BRepFill_Sweep (const Handle_BRepFill_SectionLaw & Section,const Handle_BRepFill_LocationLaw & Location,const Standard_Boolean WithKPart);
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "	:param FirstShape:
	:type FirstShape: TopoDS_Wire &
	:param LastShape:
	:type LastShape: TopoDS_Wire &
	:rtype: None
") SetBounds;
		void SetBounds (const TopoDS_Wire & FirstShape,const TopoDS_Wire & LastShape);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Set Approximation Tolerance Tol3d : Tolerance to surface approximation Tol2d : Tolerance used to perform curve approximation Normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular : Tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface

	:param Tol3d:
	:type Tol3d: float
	:param BoundTol: default value is 1.0
	:type BoundTol: float
	:param Tol2d: default value is 1.0e-5
	:type Tol2d: float
	:param TolAngular: default value is 1.0e-2
	:type TolAngular: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d,const Standard_Real BoundTol = 1.0,const Standard_Real Tol2d = 1.0e-5,const Standard_Real TolAngular = 1.0e-2);
		%feature("compactdefaultargs") SetAngularControl;
		%feature("autodoc", "	* Tolerance To controle Corner management. //! If the discontinuity is lesser than <AngleMin> in radian The Transition Performed will be alway 'Modified'

	:param AngleMin: default value is 0.01
	:type AngleMin: float
	:param AngleMax: default value is 6.0
	:type AngleMax: float
	:rtype: None
") SetAngularControl;
		void SetAngularControl (const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 6.0);
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "	* Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.

	:param ForceApproxC1:
	:type ForceApproxC1: bool
	:rtype: None
") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Build the Sweeep Surface Transition define Transition strategy Approx define Approximation Strategy - GeomFill_Section : The composed Function Location X Section is directly approximed. - GeomFill_Location : The location law is approximed, and the SweepSurface is bulid algebric composition of approximed location law and section law This option is Ok, if Section.Surface() methode is effective. Continuity : The continuity in v waiting on the surface Degmax : The maximum degree in v requiered on the surface Segmax : The maximum number of span in v requiered on the surface.

	:param ReversedEdges:
	:type ReversedEdges: TopTools_MapOfShape &
	:param Tapes:
	:type Tapes: BRepFill_DataMapOfShapeHArray2OfShape &
	:param Rails:
	:type Rails: BRepFill_DataMapOfShapeHArray2OfShape &
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
	:rtype: None
") Build;
		void Build (TopTools_MapOfShape & ReversedEdges,BRepFill_DataMapOfShapeHArray2OfShape & Tapes,BRepFill_DataMapOfShapeHArray2OfShape & Rails,const BRepFill_TransitionStyle Transition = BRepFill_Modified,const GeomAbs_Shape Continuity = GeomAbs_C2,const GeomFill_ApproxStyle Approx = GeomFill_Location,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 30);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Say if the Shape is Build.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the Sweeping Shape

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "	* Get the Approximation error.

	:rtype: float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
		%feature("compactdefaultargs") SubShape;
		%feature("autodoc", "	:rtype: Handle_TopTools_HArray2OfShape
") SubShape;
		Handle_TopTools_HArray2OfShape SubShape ();
		%feature("compactdefaultargs") InterFaces;
		%feature("autodoc", "	:rtype: Handle_TopTools_HArray2OfShape
") InterFaces;
		Handle_TopTools_HArray2OfShape InterFaces ();
		%feature("compactdefaultargs") Sections;
		%feature("autodoc", "	:rtype: Handle_TopTools_HArray2OfShape
") Sections;
		Handle_TopTools_HArray2OfShape Sections ();
};


%extend BRepFill_Sweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_TrimEdgeTool;
class BRepFill_TrimEdgeTool {
	public:
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "	:rtype: None
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool ();
		%feature("compactdefaultargs") BRepFill_TrimEdgeTool;
		%feature("autodoc", "	:param Bisec:
	:type Bisec: Bisector_Bisec &
	:param S1:
	:type S1: Handle_Geom2d_Geometry &
	:param S2:
	:type S2: Handle_Geom2d_Geometry &
	:param Offset:
	:type Offset: float
	:rtype: None
") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool (const Bisector_Bisec & Bisec,const Handle_Geom2d_Geometry & S1,const Handle_Geom2d_Geometry & S2,const Standard_Real Offset);
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param theJoinType:
	:type theJoinType: GeomAbs_JoinType
	:param Params:
	:type Params: TColgp_SequenceOfPnt
	:rtype: None
") IntersectWith;
		void IntersectWith (const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const GeomAbs_JoinType theJoinType,TColgp_SequenceOfPnt & Params);
		%feature("compactdefaultargs") AddOrConfuse;
		%feature("autodoc", "	:param Start:
	:type Start: bool
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Params:
	:type Params: TColgp_SequenceOfPnt
	:rtype: None
") AddOrConfuse;
		void AddOrConfuse (const Standard_Boolean Start,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,TColgp_SequenceOfPnt & Params);
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: bool
") IsInside;
		Standard_Boolean IsInside (const gp_Pnt2d & P);
};


%extend BRepFill_TrimEdgeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_TrimShellCorner;
class BRepFill_TrimShellCorner {
	public:
		%feature("compactdefaultargs") BRepFill_TrimShellCorner;
		%feature("autodoc", "	:param theFaces:
	:type theFaces: Handle_TopTools_HArray2OfShape &
	:param theAxeOfBisPlane:
	:type theAxeOfBisPlane: gp_Ax2
	:param theSecPlane:
	:type theSecPlane: TopoDS_Face &
	:rtype: None
") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner (const Handle_TopTools_HArray2OfShape & theFaces,const gp_Ax2 & theAxeOfBisPlane,const TopoDS_Face & theSecPlane);
		%feature("compactdefaultargs") BRepFill_TrimShellCorner;
		%feature("autodoc", "	:param theFaces:
	:type theFaces: Handle_TopTools_HArray2OfShape &
	:param theAxeOfBisPlane:
	:type theAxeOfBisPlane: gp_Ax2
	:param theSpine:
	:type theSpine: TopoDS_Wire &
	:param theSecPlane:
	:type theSecPlane: TopoDS_Face &
	:rtype: None
") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner (const Handle_TopTools_HArray2OfShape & theFaces,const gp_Ax2 & theAxeOfBisPlane,const TopoDS_Wire & theSpine,const TopoDS_Face & theSecPlane);
		%feature("compactdefaultargs") SetSpine;
		%feature("autodoc", "	:param theSpine:
	:type theSpine: TopoDS_Wire &
	:rtype: None
") SetSpine;
		void SetSpine (const TopoDS_Wire & theSpine);
		%feature("compactdefaultargs") AddBounds;
		%feature("autodoc", "	:param Bounds:
	:type Bounds: Handle_TopTools_HArray2OfShape &
	:rtype: None
") AddBounds;
		void AddBounds (const Handle_TopTools_HArray2OfShape & Bounds);
		%feature("compactdefaultargs") AddUEdges;
		%feature("autodoc", "	:param theUEdges:
	:type theUEdges: Handle_TopTools_HArray2OfShape &
	:rtype: None
") AddUEdges;
		void AddUEdges (const Handle_TopTools_HArray2OfShape & theUEdges);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasSection;
		%feature("autodoc", "	:rtype: bool
") HasSection;
		Standard_Boolean HasSection ();
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param theModified:
	:type theModified: TopTools_ListOfShape &
	:rtype: None
") Modified;
		void Modified (const TopoDS_Shape & S,TopTools_ListOfShape & theModified);
};


%extend BRepFill_TrimShellCorner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_TrimSurfaceTool;
class BRepFill_TrimSurfaceTool {
	public:
		%feature("compactdefaultargs") BRepFill_TrimSurfaceTool;
		%feature("autodoc", "	:param Bis:
	:type Bis: Handle_Geom2d_Curve &
	:param Face1:
	:type Face1: TopoDS_Face &
	:param Face2:
	:type Face2: TopoDS_Face &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Inv1:
	:type Inv1: bool
	:param Inv2:
	:type Inv2: bool
	:rtype: None
") BRepFill_TrimSurfaceTool;
		 BRepFill_TrimSurfaceTool (const Handle_Geom2d_Curve & Bis,const TopoDS_Face & Face1,const TopoDS_Face & Face2,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Boolean Inv1,const Standard_Boolean Inv2);
		%feature("compactdefaultargs") IntersectWith;
		%feature("autodoc", "	* Intersect <Bis> with the projection of the edges <EdgeOnFi> and returns the intersecting parameters on Bis and on the edges P.X() : Parameter on Bis P.Y() : Parameter on EdgeOnF1 P.Z() : Parameter on EdgeOnF2 raises if <Edge> is not a edge of Face1 or Face2.

	:param EdgeOnF1:
	:type EdgeOnF1: TopoDS_Edge &
	:param EdgeOnF2:
	:type EdgeOnF2: TopoDS_Edge &
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:rtype: None
") IntersectWith;
		void IntersectWith (const TopoDS_Edge & EdgeOnF1,const TopoDS_Edge & EdgeOnF2,TColgp_SequenceOfPnt & Points);
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "	* returns True if the Line (P, DZ) intersect the Faces

	:param Point:
	:type Point: gp_Pnt2d
	:rtype: bool
") IsOnFace;
		Standard_Boolean IsOnFace (const gp_Pnt2d & Point);
		%feature("compactdefaultargs") ProjOn;
		%feature("autodoc", "	* returns the parameter of the point <Point> on the Edge <Edge>, assuming that the point is on the edge.

	:param Point:
	:type Point: gp_Pnt2d
	:param Edge:
	:type Edge: TopoDS_Edge &
	:rtype: float
") ProjOn;
		Standard_Real ProjOn (const gp_Pnt2d & Point,const TopoDS_Edge & Edge);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param PCurve1:
	:type PCurve1: Handle_Geom2d_Curve &
	:param PCurve2:
	:type PCurve2: Handle_Geom2d_Curve &
	:param myCont:
	:type myCont: GeomAbs_Shape &
	:rtype: None
") Project;
		void Project (const Standard_Real U1,const Standard_Real U2,Handle_Geom_Curve & Curve,Handle_Geom2d_Curve & PCurve1,Handle_Geom2d_Curve & PCurve2,GeomAbs_Shape & myCont);
};


%extend BRepFill_TrimSurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ACRLaw;
class BRepFill_ACRLaw : public BRepFill_LocationLaw {
	public:
		%feature("compactdefaultargs") BRepFill_ACRLaw;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Wire &
	:param Law:
	:type Law: Handle_GeomFill_LocationGuide &
	:rtype: None
") BRepFill_ACRLaw;
		 BRepFill_ACRLaw (const TopoDS_Wire & Path,const Handle_GeomFill_LocationGuide & Law);
};


%extend BRepFill_ACRLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_ACRLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_ACRLaw::Handle_BRepFill_ACRLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_ACRLaw;
class Handle_BRepFill_ACRLaw : public Handle_BRepFill_LocationLaw {

    public:
        // constructors
        Handle_BRepFill_ACRLaw();
        Handle_BRepFill_ACRLaw(const Handle_BRepFill_ACRLaw &aHandle);
        Handle_BRepFill_ACRLaw(const BRepFill_ACRLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_ACRLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_ACRLaw {
    BRepFill_ACRLaw* _get_reference() {
    return (BRepFill_ACRLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_ACRLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_ACRLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_Edge3DLaw;
class BRepFill_Edge3DLaw : public BRepFill_LocationLaw {
	public:
		%feature("compactdefaultargs") BRepFill_Edge3DLaw;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Wire &
	:param Law:
	:type Law: Handle_GeomFill_LocationLaw &
	:rtype: None
") BRepFill_Edge3DLaw;
		 BRepFill_Edge3DLaw (const TopoDS_Wire & Path,const Handle_GeomFill_LocationLaw & Law);
};


%extend BRepFill_Edge3DLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_Edge3DLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_Edge3DLaw::Handle_BRepFill_Edge3DLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_Edge3DLaw;
class Handle_BRepFill_Edge3DLaw : public Handle_BRepFill_LocationLaw {

    public:
        // constructors
        Handle_BRepFill_Edge3DLaw();
        Handle_BRepFill_Edge3DLaw(const Handle_BRepFill_Edge3DLaw &aHandle);
        Handle_BRepFill_Edge3DLaw(const BRepFill_Edge3DLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_Edge3DLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_Edge3DLaw {
    BRepFill_Edge3DLaw* _get_reference() {
    return (BRepFill_Edge3DLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_Edge3DLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_Edge3DLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_EdgeOnSurfLaw;
class BRepFill_EdgeOnSurfLaw : public BRepFill_LocationLaw {
	public:
		%feature("compactdefaultargs") BRepFill_EdgeOnSurfLaw;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Wire &
	:param Surf:
	:type Surf: TopoDS_Shape &
	:rtype: None
") BRepFill_EdgeOnSurfLaw;
		 BRepFill_EdgeOnSurfLaw (const TopoDS_Wire & Path,const TopoDS_Shape & Surf);
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* returns <False> if one Edge of <Path> do not have representation on <Surf>. In this case it is impossible to use this object.

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult ();
};


%extend BRepFill_EdgeOnSurfLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_EdgeOnSurfLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_EdgeOnSurfLaw::Handle_BRepFill_EdgeOnSurfLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_EdgeOnSurfLaw;
class Handle_BRepFill_EdgeOnSurfLaw : public Handle_BRepFill_LocationLaw {

    public:
        // constructors
        Handle_BRepFill_EdgeOnSurfLaw();
        Handle_BRepFill_EdgeOnSurfLaw(const Handle_BRepFill_EdgeOnSurfLaw &aHandle);
        Handle_BRepFill_EdgeOnSurfLaw(const BRepFill_EdgeOnSurfLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_EdgeOnSurfLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_EdgeOnSurfLaw {
    BRepFill_EdgeOnSurfLaw* _get_reference() {
    return (BRepFill_EdgeOnSurfLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_EdgeOnSurfLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_EdgeOnSurfLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_NSections;
class BRepFill_NSections : public BRepFill_SectionLaw {
	public:
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "	* Construct

	:param S:
	:type S: TopTools_SequenceOfShape &
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None
") BRepFill_NSections;
		 BRepFill_NSections (const TopTools_SequenceOfShape & S,const Standard_Boolean Build = Standard_True);
		%feature("compactdefaultargs") BRepFill_NSections;
		%feature("autodoc", "	* Construct

	:param S:
	:type S: TopTools_SequenceOfShape &
	:param Trsfs:
	:type Trsfs: GeomFill_SequenceOfTrsf &
	:param P:
	:type P: TColStd_SequenceOfReal &
	:param VF:
	:type VF: float
	:param VL:
	:type VL: float
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None
") BRepFill_NSections;
		 BRepFill_NSections (const TopTools_SequenceOfShape & S,const GeomFill_SequenceOfTrsf & Trsfs,const TColStd_SequenceOfReal & P,const Standard_Real VF,const Standard_Real VL,const Standard_Boolean Build = Standard_True);
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Say if the input shape is a vertex.

	:rtype: bool
") IsVertex;
		virtual Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the Law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "	* Give the law build on a concatened section

	:rtype: Handle_GeomFill_SectionLaw
") ConcatenedLaw;
		virtual Handle_GeomFill_SectionLaw ConcatenedLaw ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TolAngular:
	:type TolAngular: float
	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float
") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: TopoDS_Vertex
") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real Param,TopoDS_Shape & S);
};


%extend BRepFill_NSections {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_NSections(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_NSections::Handle_BRepFill_NSections %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_NSections;
class Handle_BRepFill_NSections : public Handle_BRepFill_SectionLaw {

    public:
        // constructors
        Handle_BRepFill_NSections();
        Handle_BRepFill_NSections(const Handle_BRepFill_NSections &aHandle);
        Handle_BRepFill_NSections(const BRepFill_NSections *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_NSections DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_NSections {
    BRepFill_NSections* _get_reference() {
    return (BRepFill_NSections*)$self->Access();
    }
};

%extend Handle_BRepFill_NSections {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_NSections {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_ShapeLaw;
class BRepFill_ShapeLaw : public BRepFill_SectionLaw {
	public:
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "	* Construct an constant Law

	:param V:
	:type V: TopoDS_Vertex &
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Vertex & V,const Standard_Boolean Build = Standard_True);
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "	* Construct an constant Law

	:param W:
	:type W: TopoDS_Wire &
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Wire & W,const Standard_Boolean Build = Standard_True);
		%feature("compactdefaultargs") BRepFill_ShapeLaw;
		%feature("autodoc", "	* Construct an evolutive Law

	:param W:
	:type W: TopoDS_Wire &
	:param L:
	:type L: Handle_Law_Function &
	:param Build: default value is Standard_True
	:type Build: bool
	:rtype: None
") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Wire & W,const Handle_Law_Function & L,const Standard_Boolean Build = Standard_True);
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Say if the input shape is a vertex.

	:rtype: bool
") IsVertex;
		virtual Standard_Boolean IsVertex ();
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the Law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") ConcatenedLaw;
		%feature("autodoc", "	* Give the law build on a concaneted section

	:rtype: Handle_GeomFill_SectionLaw
") ConcatenedLaw;
		virtual Handle_GeomFill_SectionLaw ConcatenedLaw ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TolAngular:
	:type TolAngular: float
	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);
		%feature("compactdefaultargs") VertexTol;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: float
") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Param:
	:type Param: float
	:rtype: TopoDS_Vertex
") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real Param,TopoDS_Shape & S);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer Index);
};


%extend BRepFill_ShapeLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_ShapeLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_ShapeLaw::Handle_BRepFill_ShapeLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_ShapeLaw;
class Handle_BRepFill_ShapeLaw : public Handle_BRepFill_SectionLaw {

    public:
        // constructors
        Handle_BRepFill_ShapeLaw();
        Handle_BRepFill_ShapeLaw(const Handle_BRepFill_ShapeLaw &aHandle);
        Handle_BRepFill_ShapeLaw(const BRepFill_ShapeLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_ShapeLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_ShapeLaw {
    BRepFill_ShapeLaw* _get_reference() {
    return (BRepFill_ShapeLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_ShapeLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_ShapeLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepFill_DraftLaw;
class BRepFill_DraftLaw : public BRepFill_Edge3DLaw {
	public:
		%feature("compactdefaultargs") BRepFill_DraftLaw;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Wire &
	:param Law:
	:type Law: Handle_GeomFill_LocationDraft &
	:rtype: None
") BRepFill_DraftLaw;
		 BRepFill_DraftLaw (const TopoDS_Wire & Path,const Handle_GeomFill_LocationDraft & Law);
		%feature("compactdefaultargs") CleanLaw;
		%feature("autodoc", "	* To clean the little discontinuities.

	:param TolAngular:
	:type TolAngular: float
	:rtype: None
") CleanLaw;
		void CleanLaw (const Standard_Real TolAngular);
};


%extend BRepFill_DraftLaw {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepFill_DraftLaw(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepFill_DraftLaw::Handle_BRepFill_DraftLaw %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepFill_DraftLaw;
class Handle_BRepFill_DraftLaw : public Handle_BRepFill_Edge3DLaw {

    public:
        // constructors
        Handle_BRepFill_DraftLaw();
        Handle_BRepFill_DraftLaw(const Handle_BRepFill_DraftLaw &aHandle);
        Handle_BRepFill_DraftLaw(const BRepFill_DraftLaw *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepFill_DraftLaw DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepFill_DraftLaw {
    BRepFill_DraftLaw* _get_reference() {
    return (BRepFill_DraftLaw*)$self->Access();
    }
};

%extend Handle_BRepFill_DraftLaw {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepFill_DraftLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
