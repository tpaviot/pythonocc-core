/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module BRepFill

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepFill_required_python_modules.i
%include BRepFill_headers.i

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
%nodefaultctor BRepFill;
class BRepFill {
	public:
		%feature("autodoc", "Args:
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)

Returns:
	static TopoDS_Face

Computes a ruled surface between two edges.") Face;
		static TopoDS_Face Face (const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2);
		%feature("autodoc", "Args:
	Wire1(TopoDS_Wire)
	Wire2(TopoDS_Wire)

Returns:
	static TopoDS_Shell

Computes a ruled surface between two wires.  
         The wires must have the same number of edges.") Shell;
		static TopoDS_Shell Shell (const TopoDS_Wire & Wire1,const TopoDS_Wire & Wire2);
		%feature("autodoc", "Args:
	Spine(TopoDS_Shape)
	Profile(TopoDS_Wire)
	AxeProf(gp_Ax3)
	ProfOnSpine(Standard_Boolean)
	Tol(Standard_Real)

Returns:
	static void

Computes  <AxeProf>  as Follow. <Location> is  
         the Position of the nearest vertex V  of <Profile>  
         to <Spine>.<XDirection> is confused with the tangent  
         to <Spine> at the projected point of V on the Spine.  
         <Direction> is normal to <Spine>.  
         <Spine> is a plane wire or a plane face.") Axe;
		static void Axe (const TopoDS_Shape & Spine,const TopoDS_Wire & Profile,gp_Ax3 & AxeProf,Standard_Boolean & ProfOnSpine,const Standard_Real Tol);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	ACR(TColStd_Array1OfReal)

Returns:
	static void

Compute ACR on a  wire") ComputeACR;
		static void ComputeACR (const TopoDS_Wire & wire,TColStd_Array1OfReal & ACR);
		%feature("autodoc", "Args:
	wire(TopoDS_Wire)
	ACRcuts(TColStd_Array1OfReal)
	prec(Standard_Real)

Returns:
	static TopoDS_Wire

Insert ACR on a  wire") InsertACR;
		static TopoDS_Wire InsertACR (const TopoDS_Wire & wire,const TColStd_Array1OfReal & ACRcuts,const Standard_Real prec);
};


%feature("shadow") BRepFill::~BRepFill %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_ApproxSeewing;
class BRepFill_ApproxSeewing {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing ();
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)

Returns:
	None

No detailed docstring for this function.") BRepFill_ApproxSeewing;
		 BRepFill_ApproxSeewing (const BRepFill_MultiLine & ML);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepFill_MultiLine & ML);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

returns the approximation of the 3d Curve") Curve;
		const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

returns the  approximation  of the  PCurve  on the  
         first face of the MultiLine") CurveOnF1;
		const Handle_Geom2d_Curve & CurveOnF1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

returns the  approximation  of the  PCurve  on the  
         first face of the MultiLine") CurveOnF2;
		const Handle_Geom2d_Curve & CurveOnF2 ();
};


%feature("shadow") BRepFill_ApproxSeewing::~BRepFill_ApproxSeewing %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ApproxSeewing {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_CompatibleWires;
class BRepFill_CompatibleWires {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires ();
		%feature("autodoc", "Args:
	Sections(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") BRepFill_CompatibleWires;
		 BRepFill_CompatibleWires (const TopTools_SequenceOfShape & Sections);
		%feature("autodoc", "Args:
	Sections(TopTools_SequenceOfShape)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopTools_SequenceOfShape & Sections);
		%feature("autodoc", "Args:
	percent(Standard_Real)=0.01

Returns:
	None

No detailed docstring for this function.") SetPercent;
		void SetPercent (const Standard_Real percent = 0.01);
		%feature("autodoc", "Args:
	WithRotation(Standard_Boolean)=Standard_True

Returns:
	None

Performs  CompatibleWires According  to  the orientation  
         and the origin of  each other") Perform;
		void Perform (const Standard_Boolean WithRotation = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_SequenceOfShape

returns the generated sequence.") Shape;
		const TopTools_SequenceOfShape & Shape ();
		%feature("autodoc", "Args:
	SubSection(TopoDS_Edge)

Returns:
	TopTools_ListOfShape

Returns   the  shapes  created  from   a  subshape  
         <SubSection> of a section.") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Edge & SubSection);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();
};


%feature("shadow") BRepFill_CompatibleWires::~BRepFill_CompatibleWires %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_CompatibleWires {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_ComputeCLine;
class BRepFill_ComputeCLine {
	public:
		%feature("autodoc", "Args:
	Line(BRepFill_MultiLine)
	degreemin(Standard_Integer)=3
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-5
	Tolerance2d(Standard_Real)=1.0e-5
	cutting(Standard_Boolean)=Standard_False
	FirstC(AppParCurves_Constraint)=AppParCurves_TangencyPoint
	LastC(AppParCurves_Constraint)=AppParCurves_TangencyPoint

Returns:
	None

No detailed docstring for this function.") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine (const BRepFill_MultiLine & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)=3
	degreemax(Standard_Integer)=8
	Tolerance3d(Standard_Real)=1.0e-05
	Tolerance2d(Standard_Real)=1.0e-05
	cutting(Standard_Boolean)=Standard_False
	FirstC(AppParCurves_Constraint)=AppParCurves_TangencyPoint
	LastC(AppParCurves_Constraint)=AppParCurves_TangencyPoint

Returns:
	None

No detailed docstring for this function.") BRepFill_ComputeCLine;
		 BRepFill_ComputeCLine (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);
		%feature("autodoc", "Args:
	Line(BRepFill_MultiLine)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepFill_MultiLine & Line);
		%feature("autodoc", "Args:
	degreemin(Standard_Integer)
	degreemax(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);
		%feature("autodoc", "Args:
	Tolerance3d(Standard_Real)
	Tolerance2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);
		%feature("autodoc", "Args:
	FirstC(AppParCurves_Constraint)
	LastC(AppParCurves_Constraint)

Returns:
	None

No detailed docstring for this function.") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	tol3d(Standard_Real)
	tol2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbMultiCurves;
		Standard_Integer NbMultiCurves ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)=1

Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	firstp(Standard_Real)
	lastp(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepFill_ComputeCLine::~BRepFill_ComputeCLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ComputeCLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_CurveConstraint;
class BRepFill_CurveConstraint : public GeomPlate_CurveConstraint {
	public:
		%feature("autodoc", "Args:
	Boundary(Handle_Adaptor3d_HCurveOnSurface)
	Order(Standard_Integer)
	NPt(Standard_Integer)=10
	TolDist(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1

Returns:
	None

Create a constraint  
 Order is the order of the constraint. The possible values for order are -1,0,1,2.  
 Order i means constraints Gi  
 Npt is the number of points associated with the constraint.  
 TolDist is the maximum error to satisfy for G0 constraints  
 TolAng is the maximum error to satisfy for G1 constraints  
 TolCurv is the maximum error to satisfy for G2 constraints  
 These errors can be replaced by laws of criterion.") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint (const Handle_Adaptor3d_HCurveOnSurface & Boundary,const Standard_Integer Order,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("autodoc", "Args:
	Boundary(Handle_Adaptor3d_HCurve)
	Tang(Standard_Integer)
	NPt(Standard_Integer)=10
	TolDist(Standard_Real)=0.0001

Returns:
	None

No detailed docstring for this function.") BRepFill_CurveConstraint;
		 BRepFill_CurveConstraint (const Handle_Adaptor3d_HCurve & Boundary,const Standard_Integer Tang,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001);
};


%feature("shadow") BRepFill_CurveConstraint::~BRepFill_CurveConstraint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_CurveConstraint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_CurveConstraint {
	Handle_BRepFill_CurveConstraint GetHandle() {
	return *(Handle_BRepFill_CurveConstraint*) &$self;
	}
};

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
    BRepFill_CurveConstraint* GetObject() {
    return (BRepFill_CurveConstraint*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_CurveConstraint::~Handle_BRepFill_CurveConstraint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_CurveConstraint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
class BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfNodeDataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape (const BRepFill_DataMapOfNodeDataMapOfShapeShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfNodeDataMapOfShapeShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfNodeDataMapOfShapeShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Key;
		const Handle_MAT_Node & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeShape

No detailed docstring for this function.") Value;
		const TopTools_DataMapOfShapeShape & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape::~BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfNodeDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfNodeShape;
class BRepFill_DataMapIteratorOfDataMapOfNodeShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfNodeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeShape ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfNodeShape)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfNodeShape;
		 BRepFill_DataMapIteratorOfDataMapOfNodeShape (const BRepFill_DataMapOfNodeShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfNodeShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfNodeShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Key;
		const Handle_MAT_Node & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfNodeShape::~BRepFill_DataMapIteratorOfDataMapOfNodeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfNodeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
class BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfOrientedShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape (const BRepFill_DataMapOfOrientedShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfOrientedShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfOrientedShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		const TopTools_ListOfShape & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape::~BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfOrientedShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
class BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Value;
		const TopTools_DataMapOfShapeListOfShape & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape::~BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfShapeDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
class BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeHArray2OfShape)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape (const BRepFill_DataMapOfShapeHArray2OfShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeHArray2OfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeHArray2OfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") Value;
		const Handle_TopTools_HArray2OfShape & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape::~BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfShapeHArray2OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
class BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt (const BRepFill_DataMapOfShapeSequenceOfPnt & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeSequenceOfPnt & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_SequenceOfPnt

No detailed docstring for this function.") Value;
		const TColgp_SequenceOfPnt & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt::~BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
class BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal ();
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal (const BRepFill_DataMapOfShapeSequenceOfReal & aMap);
		%feature("autodoc", "Args:
	aMap(BRepFill_DataMapOfShapeSequenceOfReal)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_DataMapOfShapeSequenceOfReal & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Value;
		const TColStd_SequenceOfReal & Value ();
};


%feature("shadow") BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal::~BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapIteratorOfDataMapOfShapeSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape;
class BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)
	I(TopTools_DataMapOfShapeShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape (const Handle_MAT_Node & K,const TopTools_DataMapOfShapeShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Key;
		Handle_MAT_Node & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeShape

No detailed docstring for this function.") Value;
		TopTools_DataMapOfShapeShape & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape::~BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
	Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape::~Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfNodeDataMapOfShapeShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapNodeOfDataMapOfNodeShape;
class BRepFill_DataMapNodeOfDataMapOfNodeShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfNodeShape;
		 BRepFill_DataMapNodeOfDataMapOfNodeShape (const Handle_MAT_Node & K,const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MAT_Node

No detailed docstring for this function.") Key;
		Handle_MAT_Node & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfNodeShape::~BRepFill_DataMapNodeOfDataMapOfNodeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfNodeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfNodeShape {
	Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfNodeShape* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfNodeShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape::~Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfNodeShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape;
class BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_ListOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape (const TopoDS_Shape & K,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		TopTools_ListOfShape & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape::~BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
	Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape::~Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfOrientedShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape;
class BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_DataMapOfShapeListOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape (const TopoDS_Shape & K,const TopTools_DataMapOfShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Value;
		TopTools_DataMapOfShapeListOfShape & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape::~BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
	Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape::~Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeDataMapOfShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape;
class BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_TopTools_HArray2OfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape (const TopoDS_Shape & K,const Handle_TopTools_HArray2OfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") Value;
		Handle_TopTools_HArray2OfShape & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape::~BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
	Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape::~Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeHArray2OfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt;
class BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColgp_SequenceOfPnt)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt (const TopoDS_Shape & K,const TColgp_SequenceOfPnt & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_SequenceOfPnt

No detailed docstring for this function.") Value;
		TColgp_SequenceOfPnt & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt::~BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
	Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt::~Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfPnt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal;
class BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColStd_SequenceOfReal)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal (const TopoDS_Shape & K,const TColStd_SequenceOfReal & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Value;
		TColStd_SequenceOfReal & Value ();
};


%feature("shadow") BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal::~BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
	Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal GetHandle() {
	return *(Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal*) &$self;
	}
};

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
    BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal* GetObject() {
    return (BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal::~Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DataMapNodeOfDataMapOfShapeSequenceOfReal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DataMapOfNodeDataMapOfShapeShape;
class BRepFill_DataMapOfNodeDataMapOfShapeShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfNodeDataMapOfShapeShape;
		 BRepFill_DataMapOfNodeDataMapOfShapeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfNodeDataMapOfShapeShape)

Returns:
	BRepFill_DataMapOfNodeDataMapOfShapeShape

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfNodeDataMapOfShapeShape & Assign (const BRepFill_DataMapOfNodeDataMapOfShapeShape & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfNodeDataMapOfShapeShape)

Returns:
	BRepFill_DataMapOfNodeDataMapOfShapeShape

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfNodeDataMapOfShapeShape & operator = (const BRepFill_DataMapOfNodeDataMapOfShapeShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)
	I(TopTools_DataMapOfShapeShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_MAT_Node & K,const TopTools_DataMapOfShapeShape & I);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	TopTools_DataMapOfShapeShape

No detailed docstring for this function.") Find;
		const TopTools_DataMapOfShapeShape & Find (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	TopTools_DataMapOfShapeShape

No detailed docstring for this function.") ChangeFind;
		TopTools_DataMapOfShapeShape & ChangeFind (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_MAT_Node & K);
};


%feature("shadow") BRepFill_DataMapOfNodeDataMapOfShapeShape::~BRepFill_DataMapOfNodeDataMapOfShapeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfNodeDataMapOfShapeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapOfNodeShape;
class BRepFill_DataMapOfNodeShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfNodeShape;
		 BRepFill_DataMapOfNodeShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfNodeShape)

Returns:
	BRepFill_DataMapOfNodeShape

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfNodeShape & Assign (const BRepFill_DataMapOfNodeShape & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfNodeShape)

Returns:
	BRepFill_DataMapOfNodeShape

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfNodeShape & operator = (const BRepFill_DataMapOfNodeShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)
	I(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const Handle_MAT_Node & K,const TopoDS_Shape & I);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Find;
		const TopoDS_Shape & Find (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ChangeFind;
		TopoDS_Shape & ChangeFind (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const Handle_MAT_Node & K);
		%feature("autodoc", "Args:
	K(Handle_MAT_Node)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_MAT_Node & K);
};


%feature("shadow") BRepFill_DataMapOfNodeShape::~BRepFill_DataMapOfNodeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfNodeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapOfOrientedShapeListOfShape;
class BRepFill_DataMapOfOrientedShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfOrientedShapeListOfShape;
		 BRepFill_DataMapOfOrientedShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfOrientedShapeListOfShape)

Returns:
	BRepFill_DataMapOfOrientedShapeListOfShape

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfOrientedShapeListOfShape & Assign (const BRepFill_DataMapOfOrientedShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfOrientedShapeListOfShape)

Returns:
	BRepFill_DataMapOfOrientedShapeListOfShape

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfOrientedShapeListOfShape & operator = (const BRepFill_DataMapOfOrientedShapeListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_ListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Find;
		const TopTools_ListOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFind;
		TopTools_ListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepFill_DataMapOfOrientedShapeListOfShape::~BRepFill_DataMapOfOrientedShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfOrientedShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
class BRepFill_DataMapOfShapeDataMapOfShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfShapeDataMapOfShapeListOfShape;
		 BRepFill_DataMapOfShapeDataMapOfShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape)

Returns:
	BRepFill_DataMapOfShapeDataMapOfShapeListOfShape

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & Assign (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeDataMapOfShapeListOfShape)

Returns:
	BRepFill_DataMapOfShapeDataMapOfShapeListOfShape

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & operator = (const BRepFill_DataMapOfShapeDataMapOfShapeListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_DataMapOfShapeListOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_DataMapOfShapeListOfShape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") Find;
		const TopTools_DataMapOfShapeListOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_DataMapOfShapeListOfShape

No detailed docstring for this function.") ChangeFind;
		TopTools_DataMapOfShapeListOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepFill_DataMapOfShapeDataMapOfShapeListOfShape::~BRepFill_DataMapOfShapeDataMapOfShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfShapeDataMapOfShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapOfShapeHArray2OfShape;
class BRepFill_DataMapOfShapeHArray2OfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfShapeHArray2OfShape;
		 BRepFill_DataMapOfShapeHArray2OfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeHArray2OfShape)

Returns:
	BRepFill_DataMapOfShapeHArray2OfShape

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfShapeHArray2OfShape & Assign (const BRepFill_DataMapOfShapeHArray2OfShape & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeHArray2OfShape)

Returns:
	BRepFill_DataMapOfShapeHArray2OfShape

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfShapeHArray2OfShape & operator = (const BRepFill_DataMapOfShapeHArray2OfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Handle_TopTools_HArray2OfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Handle_TopTools_HArray2OfShape & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") Find;
		const Handle_TopTools_HArray2OfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") ChangeFind;
		Handle_TopTools_HArray2OfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepFill_DataMapOfShapeHArray2OfShape::~BRepFill_DataMapOfShapeHArray2OfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfShapeHArray2OfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapOfShapeSequenceOfPnt;
class BRepFill_DataMapOfShapeSequenceOfPnt : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfShapeSequenceOfPnt;
		 BRepFill_DataMapOfShapeSequenceOfPnt (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeSequenceOfPnt)

Returns:
	BRepFill_DataMapOfShapeSequenceOfPnt

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfShapeSequenceOfPnt & Assign (const BRepFill_DataMapOfShapeSequenceOfPnt & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeSequenceOfPnt)

Returns:
	BRepFill_DataMapOfShapeSequenceOfPnt

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfShapeSequenceOfPnt & operator = (const BRepFill_DataMapOfShapeSequenceOfPnt & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColgp_SequenceOfPnt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColgp_SequenceOfPnt & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColgp_SequenceOfPnt

No detailed docstring for this function.") Find;
		const TColgp_SequenceOfPnt & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColgp_SequenceOfPnt

No detailed docstring for this function.") ChangeFind;
		TColgp_SequenceOfPnt & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepFill_DataMapOfShapeSequenceOfPnt::~BRepFill_DataMapOfShapeSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfShapeSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_DataMapOfShapeSequenceOfReal;
class BRepFill_DataMapOfShapeSequenceOfReal : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_DataMapOfShapeSequenceOfReal;
		 BRepFill_DataMapOfShapeSequenceOfReal (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeSequenceOfReal)

Returns:
	BRepFill_DataMapOfShapeSequenceOfReal

No detailed docstring for this function.") Assign;
		BRepFill_DataMapOfShapeSequenceOfReal & Assign (const BRepFill_DataMapOfShapeSequenceOfReal & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_DataMapOfShapeSequenceOfReal)

Returns:
	BRepFill_DataMapOfShapeSequenceOfReal

No detailed docstring for this function.") operator=;
		BRepFill_DataMapOfShapeSequenceOfReal & operator = (const BRepFill_DataMapOfShapeSequenceOfReal & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColStd_SequenceOfReal)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColStd_SequenceOfReal & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") Find;
		const TColStd_SequenceOfReal & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColStd_SequenceOfReal

No detailed docstring for this function.") ChangeFind;
		TColStd_SequenceOfReal & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepFill_DataMapOfShapeSequenceOfReal::~BRepFill_DataMapOfShapeSequenceOfReal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DataMapOfShapeSequenceOfReal {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_Draft;
class BRepFill_Draft {
	public:
		%feature("autodoc", "Args:
	Shape(TopoDS_Shape)
	Dir(gp_Dir)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepFill_Draft;
		 BRepFill_Draft (const TopoDS_Shape & Shape,const gp_Dir & Dir,const Standard_Real Angle);
		%feature("autodoc", "Args:
	Style(BRepFill_TransitionStyle)=BRepFill_Right
	AngleMin(Standard_Real)=0.01
	AngleMax(Standard_Real)=3.0

Returns:
	None

No detailed docstring for this function.") SetOptions;
		void SetOptions (const BRepFill_TransitionStyle Style = BRepFill_Right,const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 3.0);
		%feature("autodoc", "Args:
	IsInternal(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") SetDraft;
		void SetDraft (const Standard_Boolean IsInternal = Standard_False);
		%feature("autodoc", "Args:
	LengthMax(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real LengthMax);
		%feature("autodoc", "Args:
	Surface(Handle_Geom_Surface)
	KeepInsideSurface(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Geom_Surface & Surface,const Standard_Boolean KeepInsideSurface = Standard_True);
		%feature("autodoc", "Args:
	StopShape(TopoDS_Shape)
	KeepOutSide(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & StopShape,const Standard_Boolean KeepOutSide = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

Returns the draft surface  
         To have the complete shape  
         you have to use the Shape() methode.") Shell;
		TopoDS_Shell Shell ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the  list   of shapes generated   from the  
         shape <S>.") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape Shape ();
};


%feature("shadow") BRepFill_Draft::~BRepFill_Draft %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Draft {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_EdgeFaceAndOrder;
class BRepFill_EdgeFaceAndOrder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder ();
		%feature("autodoc", "Args:
	anEdge(TopoDS_Edge)
	aFace(TopoDS_Face)
	anOrder(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") BRepFill_EdgeFaceAndOrder;
		 BRepFill_EdgeFaceAndOrder (const TopoDS_Edge & anEdge,const TopoDS_Face & aFace,const GeomAbs_Shape anOrder);
};


%feature("shadow") BRepFill_EdgeFaceAndOrder::~BRepFill_EdgeFaceAndOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_EdgeFaceAndOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_Evolved;
class BRepFill_Evolved {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_Evolved;
		 BRepFill_Evolved ();
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Wire)
	AxeProf(gp_Ax3)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Solid(Standard_Boolean)=Standard_False

Returns:
	None

Creates an evolved shape by sweeping the <Profile>  
         along the  <Spine>.  <AxeProf> is  used to set the  
         position of <Profile> along  <Spine> as  follows:  
         <AxeProf> slides on the profile with direction  
         colinear to the normal to <Spine>, and its  
         <XDirection> mixed with the tangent to <Spine>.") BRepFill_Evolved;
		 BRepFill_Evolved (const TopoDS_Wire & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Profile(TopoDS_Wire)
	AxeProf(gp_Ax3)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Solid(Standard_Boolean)=Standard_False

Returns:
	None

Creates an  evolved shape  by sweeping the <Profile>  
         along the <Spine>") BRepFill_Evolved;
		 BRepFill_Evolved (const TopoDS_Face & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Wire)
	AxeProf(gp_Ax3)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Solid(Standard_Boolean)=Standard_False

Returns:
	None

Performs an  evolved shape  by sweeping the <Profile>  
         along the <Spine>") Perform;
		void Perform (const TopoDS_Wire & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Profile(TopoDS_Wire)
	AxeProf(gp_Ax3)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Solid(Standard_Boolean)=Standard_False

Returns:
	None

Performs an  evolved shape  by sweeping the <Profile>  
         along the <Spine>") Perform;
		void Perform (const TopoDS_Face & Spine,const TopoDS_Wire & Profile,const gp_Ax3 & AxeProf,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Solid = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the generated shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	SpineShape(TopoDS_Shape)
	ProfShape(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns   the  shapes  created  from   a  subshape  
         <SpineShape>  of     the  spine   and   a subshape  
         <ProfShape> on the profile.") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape,const TopoDS_Shape & ProfShape);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_JoinType

No detailed docstring for this function.") JoinType;
		GeomAbs_JoinType JoinType ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Return the face Top if <Solid> is True in the constructor.") Top;
		const TopoDS_Shape & Top ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Return the face Bottom  if <Solid> is True in the constructor.") Bottom;
		const TopoDS_Shape & Bottom ();
};


%feature("shadow") BRepFill_Evolved::~BRepFill_Evolved %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Evolved {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_FaceAndOrder;
class BRepFill_FaceAndOrder {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder ();
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)
	anOrder(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") BRepFill_FaceAndOrder;
		 BRepFill_FaceAndOrder (const TopoDS_Face & aFace,const GeomAbs_Shape anOrder);
};


%feature("shadow") BRepFill_FaceAndOrder::~BRepFill_FaceAndOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_FaceAndOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_Filling;
class BRepFill_Filling {
	public:
		%feature("autodoc", "Args:
	Degree(Standard_Integer)=3
	NbPtsOnCur(Standard_Integer)=15
	NbIter(Standard_Integer)=2
	Anisotropie(Standard_Boolean)=Standard_False
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1
	MaxDeg(Standard_Integer)=8
	MaxSegments(Standard_Integer)=9

Returns:
	None

Constructor") BRepFill_Filling;
		 BRepFill_Filling (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("autodoc", "Args:
	Tol2d(Standard_Real)=0.00001
	Tol3d(Standard_Real)=0.0001
	TolAng(Standard_Real)=0.01
	TolCurv(Standard_Real)=0.1

Returns:
	None

Sets the values of Tolerances used to control the constraint.  
//!	Tol2d:  
//!	Tol3d:   it is the maximum distance allowed between the support surface  
//!	         and the constraints  
//!	TolAng:  it is the maximum angle allowed between the normal of the surface  
//!	         and the constraints  
//!	TolCurv: it is the maximum difference of curvature allowed between  
//!	         the surface and the constraint") SetConstrParam;
		void SetConstrParam (const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("autodoc", "Args:
	Degree(Standard_Integer)=3
	NbPtsOnCur(Standard_Integer)=15
	NbIter(Standard_Integer)=2
	Anisotropie(Standard_Boolean)=Standard_False

Returns:
	None

Sets the parameters used for resolution.  
//!	The default values of these parameters have been chosen for a good  
//!	ratio quality/performance.  
//!	Degree:      it is the order of energy criterion to minimize for computing  
//!	             the deformation of the surface.  
//!	             The default value is 3  
//!	             The recommanded value is i+2 where i is the maximum order of the  
//!	             constraints.  
//!	NbPtsOnCur:  it is the average number of points for discretisation  
//!	             of the edges.  
//!	NbIter:      it is the maximum number of iterations of the process.  
//!	             For each iteration the number of discretisation points is  
//!	             increased.  
//!	Anisotropie:") SetResolParam;
		void SetResolParam (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 15,const Standard_Integer NbIter = 2,const Standard_Boolean Anisotropie = Standard_False);
		%feature("autodoc", "Args:
	MaxDeg(Standard_Integer)=8
	MaxSegments(Standard_Integer)=9

Returns:
	None

Sets the parameters used for approximation of the surface") SetApproxParam;
		void SetApproxParam (const Standard_Integer MaxDeg = 8,const Standard_Integer MaxSegments = 9);
		%feature("autodoc", "Args:
	aFace(TopoDS_Face)

Returns:
	None

Loads the initial Surface") LoadInitSurface;
		void LoadInitSurface (const TopoDS_Face & aFace);
		%feature("autodoc", "Args:
	anEdge(TopoDS_Edge)
	Order(GeomAbs_Shape)
	IsBound(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds a new constraint which also defines an edge of the wire  
//!	        of the face  
//!	Order: Order of the constraint:  
//!	       GeomAbs_C0 : the surface has to pass by 3D representation  
//!	                    of the edge  
//!	       GeomAbs_G1 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency with the first  
//!	                    face of the edge  
//!	       GeomAbs_G2 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency and curvature  
//!	                    with the first face of the edge.") Add;
		Standard_Integer Add (const TopoDS_Edge & anEdge,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("autodoc", "Args:
	anEdge(TopoDS_Edge)
	Support(TopoDS_Face)
	Order(GeomAbs_Shape)
	IsBound(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds a new constraint which also defines an edge of the wire  
//!	        of the face  
//!	Order: Order of the constraint:  
//!	       GeomAbs_C0 : the surface has to pass by 3D representation  
//!	                    of the edge  
//!	       GeomAbs_G1 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency with the  
//!	                    given face  
//!	       GeomAbs_G2 : the surface has to pass by 3D representation  
//!	                    of the edge and to respect tangency and curvature  
//!	                    with the given face.") Add;
		Standard_Integer Add (const TopoDS_Edge & anEdge,const TopoDS_Face & Support,const GeomAbs_Shape Order,const Standard_Boolean IsBound = Standard_True);
		%feature("autodoc", "Args:
	Support(TopoDS_Face)
	Order(GeomAbs_Shape)

Returns:
	Standard_Integer

Adds a free constraint on a face. The corresponding edge has to  
//!	be automatically recomputed.  
//!	It is always a bound.") Add;
		Standard_Integer Add (const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("autodoc", "Args:
	Point(gp_Pnt)

Returns:
	Standard_Integer

Adds a punctual constraint") Add;
		Standard_Integer Add (const gp_Pnt & Point);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Support(TopoDS_Face)
	Order(GeomAbs_Shape)

Returns:
	Standard_Integer

Adds a punctual constraint.") Add;
		Standard_Integer Add (const Standard_Real U,const Standard_Real V,const TopoDS_Face & Support,const GeomAbs_Shape Order);
		%feature("autodoc", "Args:
	None
Returns:
	None

Builds the resulting faces") Build;
		void Build ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		TopoDS_Face Face ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the list of shapes generated from the  
         shape <S>.") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G0Error;
		Standard_Real G0Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G1Error;
		Standard_Real G1Error ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") G2Error;
		Standard_Real G2Error ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);
};


%feature("shadow") BRepFill_Filling::~BRepFill_Filling %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Filling {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_Generator;
class BRepFill_Generator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_Generator;
		 BRepFill_Generator ();
		%feature("autodoc", "Args:
	Wire(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") AddWire;
		void AddWire (const TopoDS_Wire & Wire);
		%feature("autodoc", "Args:
	None
Returns:
	None

Compute the  shell.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shell

No detailed docstring for this function.") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_DataMapOfShapeListOfShape

Returns  all   the shapes created") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated ();
		%feature("autodoc", "Args:
	SSection(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns   the  shapes  created  from   a  subshape  
         <SSection>  of a  section.") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SSection);
};


%feature("shadow") BRepFill_Generator::~BRepFill_Generator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Generator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape;
class BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K1(TopoDS_Shape)
	K2(Standard_Integer)
	I(TopTools_ListOfShape)
	n1(TCollection_MapNodePtr)
	n2(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape;
		 BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape (const TopoDS_Shape & K1,const Standard_Integer K2,const TopTools_ListOfShape & I,const TCollection_MapNodePtr & n1,const TCollection_MapNodePtr & n2);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key1;
		TopoDS_Shape & Key1 ();

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
            		%feature("autodoc", "Args:
	None
Returns:
	TCollection_MapNodePtr

No detailed docstring for this function.") Next2;
		TCollection_MapNodePtr & Next2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Value;
		TopTools_ListOfShape & Value ();
};


%feature("shadow") BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape::~BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
	Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape GetHandle() {
	return *(Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape*) &$self;
	}
};

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
    BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape* GetObject() {
    return (BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape::~Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_IndexedDataMapNodeOfIndexedDataMapOfOrientedShapeListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
class BRepFill_IndexedDataMapOfOrientedShapeListOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepFill_IndexedDataMapOfOrientedShapeListOfShape;
		 BRepFill_IndexedDataMapOfOrientedShapeListOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepFill_IndexedDataMapOfOrientedShapeListOfShape)

Returns:
	BRepFill_IndexedDataMapOfOrientedShapeListOfShape

No detailed docstring for this function.") Assign;
		BRepFill_IndexedDataMapOfOrientedShapeListOfShape & Assign (const BRepFill_IndexedDataMapOfOrientedShapeListOfShape & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_IndexedDataMapOfOrientedShapeListOfShape)

Returns:
	BRepFill_IndexedDataMapOfOrientedShapeListOfShape

No detailed docstring for this function.") operator=;
		BRepFill_IndexedDataMapOfOrientedShapeListOfShape & operator = (const BRepFill_IndexedDataMapOfOrientedShapeListOfShape & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_ListOfShape)

Returns:
	Standard_Integer

No detailed docstring for this function.") Add;
		Standard_Integer Add (const TopoDS_Shape & K,const TopTools_ListOfShape & I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	K(TopoDS_Shape)
	T(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Substitute;
		void Substitute (const Standard_Integer I,const TopoDS_Shape & K,const TopTools_ListOfShape & T);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveLast;
		void RemoveLast ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") FindKey;
		const TopoDS_Shape & FindKey (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FindFromIndex;
		const TopTools_ListOfShape & FindFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFromIndex;
		TopTools_ListOfShape & ChangeFromIndex (const Standard_Integer I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") FindIndex;
		Standard_Integer FindIndex (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FindFromKey;
		const TopTools_ListOfShape & FindFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") ChangeFromKey;
		TopTools_ListOfShape & ChangeFromKey (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") FindFromKey1;
		Standard_Address FindFromKey1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFromKey1;
		Standard_Address ChangeFromKey1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepFill_IndexedDataMapOfOrientedShapeListOfShape::~BRepFill_IndexedDataMapOfOrientedShapeListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_IndexedDataMapOfOrientedShapeListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_ListIteratorOfListOfOffsetWire;
class BRepFill_ListIteratorOfListOfOffsetWire {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_ListIteratorOfListOfOffsetWire;
		 BRepFill_ListIteratorOfListOfOffsetWire ();
		%feature("autodoc", "Args:
	L(BRepFill_ListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") BRepFill_ListIteratorOfListOfOffsetWire;
		 BRepFill_ListIteratorOfListOfOffsetWire (const BRepFill_ListOfOffsetWire & L);
		%feature("autodoc", "Args:
	L(BRepFill_ListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepFill_ListOfOffsetWire & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_OffsetWire

No detailed docstring for this function.") Value;
		BRepFill_OffsetWire & Value ();
};


%feature("shadow") BRepFill_ListIteratorOfListOfOffsetWire::~BRepFill_ListIteratorOfListOfOffsetWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ListIteratorOfListOfOffsetWire {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_ListNodeOfListOfOffsetWire;
class BRepFill_ListNodeOfListOfOffsetWire : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_ListNodeOfListOfOffsetWire;
		 BRepFill_ListNodeOfListOfOffsetWire (const BRepFill_OffsetWire & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_OffsetWire

No detailed docstring for this function.") Value;
		BRepFill_OffsetWire & Value ();
};


%feature("shadow") BRepFill_ListNodeOfListOfOffsetWire::~BRepFill_ListNodeOfListOfOffsetWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ListNodeOfListOfOffsetWire {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_ListNodeOfListOfOffsetWire {
	Handle_BRepFill_ListNodeOfListOfOffsetWire GetHandle() {
	return *(Handle_BRepFill_ListNodeOfListOfOffsetWire*) &$self;
	}
};

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
    BRepFill_ListNodeOfListOfOffsetWire* GetObject() {
    return (BRepFill_ListNodeOfListOfOffsetWire*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_ListNodeOfListOfOffsetWire::~Handle_BRepFill_ListNodeOfListOfOffsetWire %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_ListNodeOfListOfOffsetWire {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_ListOfOffsetWire;
class BRepFill_ListOfOffsetWire {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_ListOfOffsetWire;
		 BRepFill_ListOfOffsetWire ();
		%feature("autodoc", "Args:
	Other(BRepFill_ListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRepFill_ListOfOffsetWire & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_ListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRepFill_ListOfOffsetWire & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepFill_OffsetWire & I);
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)
	theIt(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & theIt);
		%feature("autodoc", "Args:
	Other(BRepFill_ListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepFill_ListOfOffsetWire & Other);
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepFill_OffsetWire & I);
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)
	theIt(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & theIt);
		%feature("autodoc", "Args:
	Other(BRepFill_ListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepFill_ListOfOffsetWire & Other);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_OffsetWire

No detailed docstring for this function.") First;
		BRepFill_OffsetWire & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_OffsetWire

No detailed docstring for this function.") Last;
		BRepFill_OffsetWire & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)
	It(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("autodoc", "Args:
	Other(BRepFill_ListOfOffsetWire)
	It(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRepFill_ListOfOffsetWire & Other,BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("autodoc", "Args:
	I(BRepFill_OffsetWire)
	It(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const BRepFill_OffsetWire & I,BRepFill_ListIteratorOfListOfOffsetWire & It);
		%feature("autodoc", "Args:
	Other(BRepFill_ListOfOffsetWire)
	It(BRepFill_ListIteratorOfListOfOffsetWire)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRepFill_ListOfOffsetWire & Other,BRepFill_ListIteratorOfListOfOffsetWire & It);
};


%feature("shadow") BRepFill_ListOfOffsetWire::~BRepFill_ListOfOffsetWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ListOfOffsetWire {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_LocationLaw;
class BRepFill_LocationLaw : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	GeomFill_PipeError

Return a error status, if the  status is not PipeOk then  
         it exist a parameter tlike the law is not valuable for t.") GetStatus;
		GeomFill_PipeError GetStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Apply a linear   transformation  on each law, to  have  
         continuity of the global law beetween the edges.") TransformInG0Law;
		virtual void TransformInG0Law ();
		%feature("autodoc", "Args:
	AngularTolerance(Standard_Real)

Returns:
	virtual void

Apply a linear transformation on each law, to reduce  
          the   dicontinuities  of law at one  rotation.") TransformInCompatibleLaw;
		virtual void TransformInCompatibleLaw (const Standard_Real AngularTolerance);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DeleteTransform;
		void DeleteTransform ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)=1.0e-7

Returns:
	Standard_Integer

No detailed docstring for this function.") NbHoles;
		Standard_Integer NbHoles (const Standard_Real Tol = 1.0e-7);
		%feature("autodoc", "Args:
	Interval(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Holes;
		void Holes (TColStd_Array1OfInteger & Interval);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Return the number of elementary Law") NbLaw;
		Standard_Integer NbLaw ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GeomFill_LocationLaw

Return the elementary Law of rank <Index>  
         <Index> have to be in [1, NbLaw()]") Law;
		const Handle_GeomFill_LocationLaw & Law (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

return the path") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Edge

Return the Edge of rank <Index> in the path  
         <Index> have to be in [1, NbLaw()]") Edge;
		const TopoDS_Edge & Edge (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Vertex

Return the vertex of rank <Index> in the path  
         <Index> have to be in [0, NbLaw()]") Vertex;
		TopoDS_Vertex Vertex (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	InputVertex(TopoDS_Vertex)
	TolMin(Standard_Real)
	OutputVertex(TopoDS_Vertex)
	Location(Standard_Integer)=0

Returns:
	None

Compute <OutputVertex> like a transformation of  
         <InputVertex>  the  transformation   is given by  
         evaluation of the location law   in the vertex of  
         rank   <Index>.  
         <Location> is used to manage discontinuities :  
  - -1 : The law before the vertex is used.  
  -  1 : The law after the vertex is used.  
  -  0 : Average of the both laws is used.") PerformVertex;
		void PerformVertex (const Standard_Integer Index,const TopoDS_Vertex & InputVertex,const Standard_Real TolMin,TopoDS_Vertex & OutputVertex,const Standard_Integer Location = 0);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

//!Return the Curvilinear Bounds of the <Index> Law") CurvilinearBounds;
		void CurvilinearBounds (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	SpatialTolerance(Standard_Real)=1.0e-7
	AngularTolerance(Standard_Real)=1.0e-4

Returns:
	Standard_Integer

Compute the Law's continuity beetween 2 edges of the path  
The result can be :  
 -1 : Case Not connex  
 0  : It is connex (G0)  
 1  : It is tangent (G1)") IsG1;
		Standard_Integer IsG1 (const Standard_Integer Index,const Standard_Real SpatialTolerance = 1.0e-7,const Standard_Real AngularTolerance = 1.0e-4);
		%feature("autodoc", "Args:
	Abscissa(Standard_Real)
	Section(TopoDS_Shape)

Returns:
	None

Apply the Law to a shape, for a given Curnilinear abscissa") D0;
		void D0 (const Standard_Real Abscissa,TopoDS_Shape & Section);
		%feature("autodoc", "Args:
	Abscissa(Standard_Real)
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	None

Find the  index Law  and the  parmaeter, for  a given  
         Curnilinear abscissa") Parameter;
		void Parameter (const Standard_Real Abscissa,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	Standard_Real

//!Return the curvilinear abscissa  corresponding to a point  
                of  the path, defined by  <Index>  of  Edge and a  
               parameter on the edge.") Abscissa;
		Standard_Real Abscissa (const Standard_Integer Index,const Standard_Real Param);
};


%feature("shadow") BRepFill_LocationLaw::~BRepFill_LocationLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_LocationLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_LocationLaw {
	Handle_BRepFill_LocationLaw GetHandle() {
	return *(Handle_BRepFill_LocationLaw*) &$self;
	}
};

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
    BRepFill_LocationLaw* GetObject() {
    return (BRepFill_LocationLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_LocationLaw::~Handle_BRepFill_LocationLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_LocationLaw {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_MultiLine;
class BRepFill_MultiLine {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_MultiLine;
		 BRepFill_MultiLine ();
		%feature("autodoc", "Args:
	Face1(TopoDS_Face)
	Face2(TopoDS_Face)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Inv1(Standard_Boolean)
	Inv2(Standard_Boolean)
	Bissec(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") BRepFill_MultiLine;
		 BRepFill_MultiLine (const TopoDS_Face & Face1,const TopoDS_Face & Face2,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Boolean Inv1,const Standard_Boolean Inv2,const Handle_Geom2d_Curve & Bissec);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Search if the Projection of the Bissectrice on the  
         faces needs an approximation or not.  
         Returns true if the approximation is not needed.") IsParticularCase;
		Standard_Boolean IsParticularCase ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Returns   the continuity  betwwen  the two  faces  
         seShape         from GeomAbsparated by myBis.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	Curve(Handle_Geom_Curve)
	PCurve1(Handle_Geom2d_Curve)
	PCurve2(Handle_Geom2d_Curve)

Returns:
	None

raises if IsParticularCase is <False>.") Curves;
		void Curves (Handle_Geom_Curve & Curve,Handle_Geom2d_Curve & PCurve1,Handle_Geom2d_Curve & PCurve2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the first parameter of the Bissectrice.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the last parameter of the Bissectrice.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt

Returns the current point on the 3d curve") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt2d

returns the current point on the PCurve of the  
         first face") ValueOnF1;
		gp_Pnt2d ValueOnF1 (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt2d

returns the current point on the PCurve of the  
         first face") ValueOnF2;
		gp_Pnt2d ValueOnF2 (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P3d(gp_Pnt)
	PF1(gp_Pnt2d)
	PF2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Value3dOnF1OnF2;
		void Value3dOnF1OnF2 (const Standard_Real U,gp_Pnt & P3d,gp_Pnt2d & PF1,gp_Pnt2d & PF2);
};


%feature("shadow") BRepFill_MultiLine::~BRepFill_MultiLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_MultiLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_MultiLineTool;
class BRepFill_MultiLineTool {
	public:
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)

Returns:
	static Standard_Real

returns the first parameter of the Line.") FirstParameter;
		static Standard_Real FirstParameter (const BRepFill_MultiLine & ML);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)

Returns:
	static Standard_Real

returns the last parameter of the Line.") LastParameter;
		static Standard_Real LastParameter (const BRepFill_MultiLine & ML);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)

Returns:
	static Standard_Integer

Returns the number of 2d points of a MLine") NbP2d;
		static Standard_Integer NbP2d (const BRepFill_MultiLine & ML);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)

Returns:
	static Standard_Integer

Returns the number of 3d points of a MLine.") NbP3d;
		static Standard_Integer NbP3d (const BRepFill_MultiLine & ML);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)
	U(Standard_Real)
	tabPt(TColgp_Array1OfPnt)

Returns:
	static void

returns the 3d points of the multipoint <MPointIndex>  
         when only 3d points exist.") Value;
		static void Value (const BRepFill_MultiLine & ML,const Standard_Real U,TColgp_Array1OfPnt & tabPt);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)
	U(Standard_Real)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

returns the 2d points of the multipoint <MPointIndex>  
         when only 2d points exist.") Value;
		static void Value (const BRepFill_MultiLine & ML,const Standard_Real U,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)
	U(Standard_Real)
	tabPt(TColgp_Array1OfPnt)
	tabPt2d(TColgp_Array1OfPnt2d)

Returns:
	static void

returns the 3d and 2d points of the multipoint  
         <MPointIndex>.") Value;
		static void Value (const BRepFill_MultiLine & ML,const Standard_Real U,TColgp_Array1OfPnt & tabPt,TColgp_Array1OfPnt2d & tabPt2d);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)
	U(Standard_Real)
	tabV(TColgp_Array1OfVec)

Returns:
	static Standard_Boolean

returns the 3d derivative values of the multipoint  
         <MPointIndex> when only 3d points exist.  
         returns False if the derivative cannot be computed.") D1;
		static Standard_Boolean D1 (const BRepFill_MultiLine & ML,const Standard_Real U,TColgp_Array1OfVec & tabV);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)
	U(Standard_Real)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

returns the 2d derivative values of the multipoint  
         <MPointIndex> only when 2d points exist.  
         returns False if the derivative cannot be computed.") D1;
		static Standard_Boolean D1 (const BRepFill_MultiLine & ML,const Standard_Real U,TColgp_Array1OfVec2d & tabV2d);
		%feature("autodoc", "Args:
	ML(BRepFill_MultiLine)
	U(Standard_Real)
	tabV(TColgp_Array1OfVec)
	tabV2d(TColgp_Array1OfVec2d)

Returns:
	static Standard_Boolean

returns the 3d and 2d derivative values of the  
         multipoint <MPointIndex>.  
         returns False if the derivative cannot be computed.") D1;
		static Standard_Boolean D1 (const BRepFill_MultiLine & ML,const Standard_Real U,TColgp_Array1OfVec & tabV,TColgp_Array1OfVec2d & tabV2d);
};


%feature("shadow") BRepFill_MultiLineTool::~BRepFill_MultiLineTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_MultiLineTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_MyLeastSquareOfComputeCLine;
class BRepFill_MyLeastSquareOfComputeCLine {
	public:
		%feature("autodoc", "Args:
	SSP(BRepFill_MultiLine)
	U0(Standard_Real)
	U1(Standard_Real)
	FirstCons(AppParCurves_Constraint)
	LastCons(AppParCurves_Constraint)
	Deg(Standard_Integer)
	NbPoints(Standard_Integer)=24

Returns:
	None

No detailed docstring for this function.") BRepFill_MyLeastSquareOfComputeCLine;
		 BRepFill_MyLeastSquareOfComputeCLine (const BRepFill_MultiLine & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints = 24);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	AppParCurves_MultiCurve

No detailed docstring for this function.") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("autodoc", "Args:
	F(Standard_Real)
	MaxE3d(Standard_Real)
	MaxE2d(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BRepFill_MyLeastSquareOfComputeCLine::~BRepFill_MyLeastSquareOfComputeCLine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_MyLeastSquareOfComputeCLine {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_OffsetAncestors;
class BRepFill_OffsetAncestors {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors ();
		%feature("autodoc", "Args:
	Paral(BRepFill_OffsetWire)

Returns:
	None

No detailed docstring for this function.") BRepFill_OffsetAncestors;
		 BRepFill_OffsetAncestors (BRepFill_OffsetWire & Paral);
		%feature("autodoc", "Args:
	Paral(BRepFill_OffsetWire)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (BRepFill_OffsetWire & Paral);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	S1(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasAncestor;
		Standard_Boolean HasAncestor (const TopoDS_Edge & S1);
		%feature("autodoc", "Args:
	S1(TopoDS_Edge)

Returns:
	TopoDS_Shape

may return a Null Shape if S1 is not a subShape  
         of <Paral>;  if Perform is not done.") Ancestor;
		const TopoDS_Shape & Ancestor (const TopoDS_Edge & S1);
};


%feature("shadow") BRepFill_OffsetAncestors::~BRepFill_OffsetAncestors %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_OffsetAncestors {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_OffsetWire;
class BRepFill_OffsetWire {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_OffsetWire;
		 BRepFill_OffsetWire ();
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

No detailed docstring for this function.") BRepFill_OffsetWire;
		 BRepFill_OffsetWire (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Spine(TopoDS_Face)
	Join(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

Initialize the evaluation of Offseting.") Init;
		void Init (const TopoDS_Face & Spine,const GeomAbs_JoinType Join = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Offset(Standard_Real)
	Alt(Standard_Real)=0.0

Returns:
	None

Performs  an OffsetWire at  an altitude <Alt> from  
         the  face ( According  to  the orientation of  the  
         face)") Perform;
		void Perform (const Standard_Real Offset,const Standard_Real Alt = 0.0);
		%feature("autodoc", "Args:
	WSP(TopoDS_Face)
	Offset(Standard_Real)
	Locus(BRepMAT2d_BisectingLocus)
	Link(BRepMAT2d_LinkTopoBilo)
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Alt(Standard_Real)=0.0

Returns:
	None

Performs an  OffsetWire") PerformWithBiLo;
		void PerformWithBiLo (const TopoDS_Face & WSP,const Standard_Real Offset,const BRepMAT2d_BisectingLocus & Locus,BRepMAT2d_LinkTopoBilo & Link,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Real Alt = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Spine;
		const TopoDS_Face & Spine ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the generated shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	SpineShape(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns   the  shapes  created  from   a  subshape  
         <SpineShape> of the spine.  
         Returns the last computed Offset.") GeneratedShapes;
		const TopTools_ListOfShape & GeneratedShapes (const TopoDS_Shape & SpineShape);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_JoinType

No detailed docstring for this function.") JoinType;
		GeomAbs_JoinType JoinType ();
};


%feature("shadow") BRepFill_OffsetWire::~BRepFill_OffsetWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_OffsetWire {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_Pipe;
class BRepFill_Pipe {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_Pipe;
		 BRepFill_Pipe ();
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Shape)
	aMode(GeomFill_Trihedron)=GeomFill_IsCorrectedFrenet
	ForceApproxC1(Standard_Boolean)=Standard_False
	GeneratePartCase(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepFill_Pipe;
		 BRepFill_Pipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const GeomFill_Trihedron aMode = GeomFill_IsCorrectedFrenet,const Standard_Boolean ForceApproxC1 = Standard_False,const Standard_Boolean GeneratePartCase = Standard_False);
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)
	Profile(TopoDS_Shape)
	GeneratePartCase(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile,const Standard_Boolean GeneratePartCase = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Spine;
		const TopoDS_Shape & Spine ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Profile;
		const TopoDS_Shape & Profile ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	ESpine(TopoDS_Edge)
	EProfile(TopoDS_Edge)

Returns:
	TopoDS_Face

Returns the face created from an edge of the spine  
         and an edge of the profile.  if the edges are not in the spine or the profile") Face;
		TopoDS_Face Face (const TopoDS_Edge & ESpine,const TopoDS_Edge & EProfile);
		%feature("autodoc", "Args:
	ESpine(TopoDS_Edge)
	VProfile(TopoDS_Vertex)

Returns:
	TopoDS_Edge

Returns the edge created from an edge of the spine  
         and a vertex of the profile.  if the edge or the vertex are not in  the spine or  
         the profile.") Edge;
		TopoDS_Edge Edge (const TopoDS_Edge & ESpine,const TopoDS_Vertex & VProfile);
		%feature("autodoc", "Args:
	VSpine(TopoDS_Vertex)

Returns:
	TopoDS_Shape

Returns  the shape created from the profile at the  
         position of the vertex VSpine.  if the vertex is not in the Spine") Section;
		TopoDS_Shape Section (const TopoDS_Vertex & VSpine);
		%feature("autodoc", "Args:
	Point(gp_Pnt)

Returns:
	TopoDS_Wire

Create a Wire by sweeping the Point along the <spine>  if the <Spine> is undefined") PipeLine;
		TopoDS_Wire PipeLine (const gp_Pnt & Point);
};


%feature("shadow") BRepFill_Pipe::~BRepFill_Pipe %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Pipe {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_PipeShell;
class BRepFill_PipeShell : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Spine(TopoDS_Wire)

Returns:
	None

Set an sweep's mode  
        If no mode are setted, the mode use in MakePipe is used") BRepFill_PipeShell;
		 BRepFill_PipeShell (const TopoDS_Wire & Spine);
		%feature("autodoc", "Args:
	Frenet(Standard_Boolean)=Standard_False

Returns:
	None

Set an Frenet or an CorrectedFrenet trihedron  
         to  perform  the  sweeping") Set;
		void Set (const Standard_Boolean Frenet = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

Set a Discrete trihedron  
         to  perform  the  sweeping") SetDiscrete;
		void SetDiscrete ();
		%feature("autodoc", "Args:
	Axe(gp_Ax2)

Returns:
	None

Set  an  fixed  trihedron  to  perform  the  sweeping  
        all sections will be parallel.") Set;
		void Set (const gp_Ax2 & Axe);
		%feature("autodoc", "Args:
	BiNormal(gp_Dir)

Returns:
	None

Set an fixed  BiNormal  direction to  perform  
 the sweeping") Set;
		void Set (const gp_Dir & BiNormal);
		%feature("autodoc", "Args:
	SpineSupport(TopoDS_Shape)

Returns:
	Standard_Boolean

Set support to the spine to define the BiNormal  
          at   the spine, like    the  normal the surfaces.  
 Warning: To  be  effective,  Each  edge  of  the  <spine>  must  
 have an  representaion  on   one   face  of<SpineSupport>") Set;
		Standard_Boolean Set (const TopoDS_Shape & SpineSupport);
		%feature("autodoc", "Args:
	AuxiliarySpine(TopoDS_Wire)
	CurvilinearEquivalence(Standard_Boolean)=Standard_True
	KeepContact(BRepFill_TypeOfContact)=BRepFill_NoContact

Returns:
	None

Set  an  auxiliary  spine  to  define  the Normal  
 For  each  Point  of  the  Spine  P,  an  Point  Q  is  evalued  
   on  <AuxiliarySpine>  
If <CurvilinearEquivalence>  
  Q split <AuxiliarySpine> with  the  same  length ratio  
  than P split  <Spline>.  
Else  the  plan  define  by  P  and  the  tangent  to  the  <Spine>  
      intersect <AuxiliarySpine> in Q.  
If <KeepContact> equals BRepFill_NoContact: The Normal is defined  
by the vector PQ.  
If <KeepContact> equals BRepFill_Contact: The Normal is defined to  
achieve that the sweeped section is in contact to the  
auxiliarySpine. The width of section is constant all along the path.  
In other words, the auxiliary spine lies on the swept surface,  
but not necessarily is a boundary of this surface. However,  
the auxiliary spine has to be close enough to the main spine  
to provide intersection with any section all along the path.  
If <KeepContact> equals BRepFill_ContactOnBorder: The auxiliary spine  
becomes a boundary of the swept surface and the width of section varies  
along the path.") Set;
		void Set (const TopoDS_Wire & AuxiliarySpine,const Standard_Boolean CurvilinearEquivalence = Standard_True,const BRepFill_TypeOfContact KeepContact = BRepFill_NoContact);
		%feature("autodoc", "Args:
	ForceApproxC1(Standard_Boolean)

Returns:
	None

Set the flag that indicates attempt to approximate  
         a C1-continuous surface if a swept surface proved  
         to be C0.  Give section to sweep.  
Possibilities are :  
//!	- Give one or sevral profile  
    - Give one profile and an homotetic law.  
    - Automatic compute of correspondance beetween profile, and section  
                on the sweeped shape  
    - correspondance beetween profile, and section on the sweeped shape  
      defined by a vertex of the spine") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Set an section. The corespondance with the spine, will  
         be automaticaly performed.") Add;
		void Add (const TopoDS_Shape & Profile,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	Location(TopoDS_Vertex)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Set an section.   The corespondance with the spine, is  
         given by  <Location>") Add;
		void Add (const TopoDS_Shape & Profile,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	L(Handle_Law_Function)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Set  an    section  and  an   homotetic    law.  
The  homotetie's  centers  is  given  by  point  on  the  <Spine>.") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	L(Handle_Law_Function)
	Location(TopoDS_Vertex)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Set  an    section  and  an   homotetic    law.  
  The  homotetie  center  is  given  by  point  on  the  <Spine>") SetLaw;
		void SetLaw (const TopoDS_Shape & Profile,const Handle_Law_Function & L,const TopoDS_Vertex & Location,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)

Returns:
	None

Delete an section.") Delete;
		void Delete (const TopoDS_Shape & Profile);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Say if <self> is ready to build the shape  
         return False if <self> do not have section definition") IsReady;
		Standard_Boolean IsReady ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomFill_PipeError

Get a status, when Simulate or Build failed.") GetStatus;
		GeomFill_PipeError GetStatus ();
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)=1.0e-4
	BoundTol(Standard_Real)=1.0e-4
	TolAngular(Standard_Real)=1.0e-2

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d = 1.0e-4,const Standard_Real BoundTol = 1.0e-4,const Standard_Real TolAngular = 1.0e-2);
		%feature("autodoc", "Args:
	Mode(BRepFill_TransitionStyle)=BRepFill_Modified
	Angmin(Standard_Real)=1.0e-2
	Angmax(Standard_Real)=6.0

Returns:
	None

Set the  Transition Mode to manage discontinuities  
         on the sweep.") SetTransition;
		void SetTransition (const BRepFill_TransitionStyle Mode = BRepFill_Modified,const Standard_Real Angmin = 1.0e-2,const Standard_Real Angmax = 6.0);
		%feature("autodoc", "Args:
	NumberOfSection(Standard_Integer)
	Sections(TopTools_ListOfShape)

Returns:
	None

Perform simulation of the sweep :  
        Somes Section are returned.") Simulate;
		void Simulate (const Standard_Integer NumberOfSection,TopTools_ListOfShape & Sections);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Builds the resulting shape (redefined from MakeShape).") Build;
		Standard_Boolean Build ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Transform the sweeping Shell in Solid.  
         If the section are not closed returns False") MakeSolid;
		Standard_Boolean MakeSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the result Shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the  TopoDS  Shape of the bottom of the sweep.") FirstShape;
		const TopoDS_Shape & FirstShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the TopoDS Shape of the top of the sweep.") LastShape;
		const TopoDS_Shape & LastShape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	L(TopTools_ListOfShape)

Returns:
	None

Returns the  list   of shapes generated   from the  
         shape <S>.") Generated;
		void Generated (const TopoDS_Shape & S,TopTools_ListOfShape & L);
};


%feature("shadow") BRepFill_PipeShell::~BRepFill_PipeShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_PipeShell {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_PipeShell {
	Handle_BRepFill_PipeShell GetHandle() {
	return *(Handle_BRepFill_PipeShell*) &$self;
	}
};

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
    BRepFill_PipeShell* GetObject() {
    return (BRepFill_PipeShell*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_PipeShell::~Handle_BRepFill_PipeShell %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_PipeShell {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_Section;
class BRepFill_Section {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_Section;
		 BRepFill_Section ();
		%feature("autodoc", "Args:
	Profile(TopoDS_Shape)
	V(TopoDS_Vertex)
	WithContact(Standard_Boolean)
	WithCorrection(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") BRepFill_Section;
		 BRepFill_Section (const TopoDS_Shape & Profile,const TopoDS_Vertex & V,const Standard_Boolean WithContact,const Standard_Boolean WithCorrection);
		%feature("autodoc", "Args:
	IsLaw(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Boolean IsLaw);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

No detailed docstring for this function.") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsLaw;
		Standard_Boolean IsLaw ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") WithContact;
		Standard_Boolean WithContact ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") WithCorrection;
		Standard_Boolean WithCorrection ();
};


%feature("shadow") BRepFill_Section::~BRepFill_Section %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Section {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_SectionLaw;
class BRepFill_SectionLaw : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbLaw;
		Standard_Integer NbLaw ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_GeomFill_SectionLaw

No detailed docstring for this function.") Law;
		const Handle_GeomFill_SectionLaw & Law (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Say if the input sahpe is a  vertex.") IsVertex;
		virtual Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_GeomFill_SectionLaw

No detailed docstring for this function.") ConcatenedLaw;
		virtual Handle_GeomFill_SectionLaw ConcatenedLaw ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TolAngular(Standard_Real)

Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	virtual TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);
		%feature("autodoc", "Args:
	U(Standard_Real)
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") D0;
		virtual void D0 (const Standard_Real U,TopoDS_Shape & S);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") CurrentEdge;
		TopoDS_Edge CurrentEdge ();
};


%feature("shadow") BRepFill_SectionLaw::~BRepFill_SectionLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SectionLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_SectionLaw {
	Handle_BRepFill_SectionLaw GetHandle() {
	return *(Handle_BRepFill_SectionLaw*) &$self;
	}
};

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
    BRepFill_SectionLaw* GetObject() {
    return (BRepFill_SectionLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_SectionLaw::~Handle_BRepFill_SectionLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_SectionLaw {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_SectionPlacement;
class BRepFill_SectionPlacement {
	public:
		%feature("autodoc", "Args:
	Law(Handle_BRepFill_LocationLaw)
	Section(TopoDS_Shape)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Automatic placement") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement (const Handle_BRepFill_LocationLaw & Law,const TopoDS_Shape & Section,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	Law(Handle_BRepFill_LocationLaw)
	Section(TopoDS_Shape)
	Vertex(TopoDS_Shape)
	WithContact(Standard_Boolean)=Standard_False
	WithCorrection(Standard_Boolean)=Standard_False

Returns:
	None

Placement on vertex") BRepFill_SectionPlacement;
		 BRepFill_SectionPlacement (const Handle_BRepFill_LocationLaw & Law,const TopoDS_Shape & Section,const TopoDS_Shape & Vertex,const Standard_Boolean WithContact = Standard_False,const Standard_Boolean WithCorrection = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

No detailed docstring for this function.") Transformation;
		const gp_Trsf & Transformation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") AbscissaOnPath;
		Standard_Real AbscissaOnPath ();
};


%feature("shadow") BRepFill_SectionPlacement::~BRepFill_SectionPlacement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SectionPlacement {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder;
class BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(BRepFill_EdgeFaceAndOrder)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder;
		 BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder (const BRepFill_EdgeFaceAndOrder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_EdgeFaceAndOrder

No detailed docstring for this function.") Value;
		BRepFill_EdgeFaceAndOrder & Value ();
};


%feature("shadow") BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder::~BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
	Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder GetHandle() {
	return *(Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder*) &$self;
	}
};

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
    BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder* GetObject() {
    return (BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder::~Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_SequenceNodeOfSequenceOfEdgeFaceAndOrder {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_SequenceNodeOfSequenceOfFaceAndOrder;
class BRepFill_SequenceNodeOfSequenceOfFaceAndOrder : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(BRepFill_FaceAndOrder)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_SequenceNodeOfSequenceOfFaceAndOrder;
		 BRepFill_SequenceNodeOfSequenceOfFaceAndOrder (const BRepFill_FaceAndOrder & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_FaceAndOrder

No detailed docstring for this function.") Value;
		BRepFill_FaceAndOrder & Value ();
};


%feature("shadow") BRepFill_SequenceNodeOfSequenceOfFaceAndOrder::~BRepFill_SequenceNodeOfSequenceOfFaceAndOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
	Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder GetHandle() {
	return *(Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder*) &$self;
	}
};

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
    BRepFill_SequenceNodeOfSequenceOfFaceAndOrder* GetObject() {
    return (BRepFill_SequenceNodeOfSequenceOfFaceAndOrder*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder::~Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_SequenceNodeOfSequenceOfFaceAndOrder {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_SequenceNodeOfSequenceOfSection;
class BRepFill_SequenceNodeOfSequenceOfSection : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(BRepFill_Section)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepFill_SequenceNodeOfSequenceOfSection;
		 BRepFill_SequenceNodeOfSequenceOfSection (const BRepFill_Section & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_Section

No detailed docstring for this function.") Value;
		BRepFill_Section & Value ();
};


%feature("shadow") BRepFill_SequenceNodeOfSequenceOfSection::~BRepFill_SequenceNodeOfSequenceOfSection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SequenceNodeOfSequenceOfSection {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_SequenceNodeOfSequenceOfSection {
	Handle_BRepFill_SequenceNodeOfSequenceOfSection GetHandle() {
	return *(Handle_BRepFill_SequenceNodeOfSequenceOfSection*) &$self;
	}
};

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
    BRepFill_SequenceNodeOfSequenceOfSection* GetObject() {
    return (BRepFill_SequenceNodeOfSequenceOfSection*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_SequenceNodeOfSequenceOfSection::~Handle_BRepFill_SequenceNodeOfSequenceOfSection %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_SequenceNodeOfSequenceOfSection {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_SequenceOfEdgeFaceAndOrder;
class BRepFill_SequenceOfEdgeFaceAndOrder : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_SequenceOfEdgeFaceAndOrder;
		 BRepFill_SequenceOfEdgeFaceAndOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	BRepFill_SequenceOfEdgeFaceAndOrder

No detailed docstring for this function.") Assign;
		const BRepFill_SequenceOfEdgeFaceAndOrder & Assign (const BRepFill_SequenceOfEdgeFaceAndOrder & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	BRepFill_SequenceOfEdgeFaceAndOrder

No detailed docstring for this function.") operator=;
		const BRepFill_SequenceOfEdgeFaceAndOrder & operator = (const BRepFill_SequenceOfEdgeFaceAndOrder & Other);
		%feature("autodoc", "Args:
	T(BRepFill_EdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepFill_EdgeFaceAndOrder & T);
		%feature("autodoc", "Args:
	S(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("autodoc", "Args:
	T(BRepFill_EdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepFill_EdgeFaceAndOrder & T);
		%feature("autodoc", "Args:
	S(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepFill_EdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepFill_EdgeFaceAndOrder & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepFill_EdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepFill_EdgeFaceAndOrder & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepFill_SequenceOfEdgeFaceAndOrder & S);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_EdgeFaceAndOrder

No detailed docstring for this function.") First;
		const BRepFill_EdgeFaceAndOrder & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_EdgeFaceAndOrder

No detailed docstring for this function.") Last;
		const BRepFill_EdgeFaceAndOrder & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepFill_SequenceOfEdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepFill_SequenceOfEdgeFaceAndOrder & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepFill_EdgeFaceAndOrder

No detailed docstring for this function.") Value;
		const BRepFill_EdgeFaceAndOrder & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(BRepFill_EdgeFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepFill_EdgeFaceAndOrder & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepFill_EdgeFaceAndOrder

No detailed docstring for this function.") ChangeValue;
		BRepFill_EdgeFaceAndOrder & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepFill_SequenceOfEdgeFaceAndOrder::~BRepFill_SequenceOfEdgeFaceAndOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SequenceOfEdgeFaceAndOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_SequenceOfFaceAndOrder;
class BRepFill_SequenceOfFaceAndOrder : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_SequenceOfFaceAndOrder;
		 BRepFill_SequenceOfFaceAndOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepFill_SequenceOfFaceAndOrder)

Returns:
	BRepFill_SequenceOfFaceAndOrder

No detailed docstring for this function.") Assign;
		const BRepFill_SequenceOfFaceAndOrder & Assign (const BRepFill_SequenceOfFaceAndOrder & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_SequenceOfFaceAndOrder)

Returns:
	BRepFill_SequenceOfFaceAndOrder

No detailed docstring for this function.") operator=;
		const BRepFill_SequenceOfFaceAndOrder & operator = (const BRepFill_SequenceOfFaceAndOrder & Other);
		%feature("autodoc", "Args:
	T(BRepFill_FaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepFill_FaceAndOrder & T);
		%feature("autodoc", "Args:
	S(BRepFill_SequenceOfFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepFill_SequenceOfFaceAndOrder & S);
		%feature("autodoc", "Args:
	T(BRepFill_FaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepFill_FaceAndOrder & T);
		%feature("autodoc", "Args:
	S(BRepFill_SequenceOfFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepFill_SequenceOfFaceAndOrder & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepFill_FaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepFill_FaceAndOrder & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepFill_SequenceOfFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepFill_SequenceOfFaceAndOrder & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepFill_FaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepFill_FaceAndOrder & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepFill_SequenceOfFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepFill_SequenceOfFaceAndOrder & S);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_FaceAndOrder

No detailed docstring for this function.") First;
		const BRepFill_FaceAndOrder & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_FaceAndOrder

No detailed docstring for this function.") Last;
		const BRepFill_FaceAndOrder & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepFill_SequenceOfFaceAndOrder)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepFill_SequenceOfFaceAndOrder & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepFill_FaceAndOrder

No detailed docstring for this function.") Value;
		const BRepFill_FaceAndOrder & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(BRepFill_FaceAndOrder)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepFill_FaceAndOrder & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepFill_FaceAndOrder

No detailed docstring for this function.") ChangeValue;
		BRepFill_FaceAndOrder & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepFill_SequenceOfFaceAndOrder::~BRepFill_SequenceOfFaceAndOrder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SequenceOfFaceAndOrder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_SequenceOfSection;
class BRepFill_SequenceOfSection : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_SequenceOfSection;
		 BRepFill_SequenceOfSection ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(BRepFill_SequenceOfSection)

Returns:
	BRepFill_SequenceOfSection

No detailed docstring for this function.") Assign;
		const BRepFill_SequenceOfSection & Assign (const BRepFill_SequenceOfSection & Other);
		%feature("autodoc", "Args:
	Other(BRepFill_SequenceOfSection)

Returns:
	BRepFill_SequenceOfSection

No detailed docstring for this function.") operator=;
		const BRepFill_SequenceOfSection & operator = (const BRepFill_SequenceOfSection & Other);
		%feature("autodoc", "Args:
	T(BRepFill_Section)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepFill_Section & T);
		%feature("autodoc", "Args:
	S(BRepFill_SequenceOfSection)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepFill_SequenceOfSection & S);
		%feature("autodoc", "Args:
	T(BRepFill_Section)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepFill_Section & T);
		%feature("autodoc", "Args:
	S(BRepFill_SequenceOfSection)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepFill_SequenceOfSection & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepFill_Section)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const BRepFill_Section & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepFill_SequenceOfSection)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,BRepFill_SequenceOfSection & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(BRepFill_Section)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const BRepFill_Section & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(BRepFill_SequenceOfSection)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,BRepFill_SequenceOfSection & S);
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_Section

No detailed docstring for this function.") First;
		const BRepFill_Section & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepFill_Section

No detailed docstring for this function.") Last;
		const BRepFill_Section & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(BRepFill_SequenceOfSection)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,BRepFill_SequenceOfSection & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepFill_Section

No detailed docstring for this function.") Value;
		const BRepFill_Section & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(BRepFill_Section)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepFill_Section & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepFill_Section

No detailed docstring for this function.") ChangeValue;
		BRepFill_Section & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") BRepFill_SequenceOfSection::~BRepFill_SequenceOfSection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_SequenceOfSection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_Sweep;
class BRepFill_Sweep {
	public:
		%feature("autodoc", "Args:
	Section(Handle_BRepFill_SectionLaw)
	Location(Handle_BRepFill_LocationLaw)
	WithKPart(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") BRepFill_Sweep;
		 BRepFill_Sweep (const Handle_BRepFill_SectionLaw & Section,const Handle_BRepFill_LocationLaw & Location,const Standard_Boolean WithKPart);
		%feature("autodoc", "Args:
	FirstShape(TopoDS_Wire)
	LastShape(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") SetBounds;
		void SetBounds (const TopoDS_Wire & FirstShape,const TopoDS_Wire & LastShape);
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	BoundTol(Standard_Real)=1.0
	Tol2d(Standard_Real)=1.0e-5
	TolAngular(Standard_Real)=1.0e-2

Returns:
	None

Set Approximation Tolerance  
   Tol3d : Tolerance to surface approximation  
   Tol2d : Tolerance used to perform curve approximation  
           Normaly the 2d curve are approximated with a  
           tolerance given by the resolution on support surfaces,  
           but if this tolerance is too large Tol2d is used.  
   TolAngular : Tolerance (in radian) to control the angle  
                beetween tangents on the section law and  
                tangent of iso-v on approximed surface") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d,const Standard_Real BoundTol = 1.0,const Standard_Real Tol2d = 1.0e-5,const Standard_Real TolAngular = 1.0e-2);
		%feature("autodoc", "Args:
	AngleMin(Standard_Real)=0.01
	AngleMax(Standard_Real)=6.0

Returns:
	None

Tolerance  To controle Corner management.  
 
  If the discontinuity is lesser than <AngleMin> in radian The  
  Transition Performed will be alway 'Modified'") SetAngularControl;
		void SetAngularControl (const Standard_Real AngleMin = 0.01,const Standard_Real AngleMax = 6.0);
		%feature("autodoc", "Args:
	ForceApproxC1(Standard_Boolean)

Returns:
	None

Set the flag that indicates attempt to approximate  
         a C1-continuous surface if a swept surface proved  
         to be C0.") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("autodoc", "Args:
	ReversedEdges(TopTools_MapOfShape)
	Tapes(BRepFill_DataMapOfShapeHArray2OfShape)
	Transition(BRepFill_TransitionStyle)=BRepFill_Modified
	Continuity(GeomAbs_Shape)=GeomAbs_C2
	Approx(GeomFill_ApproxStyle)=GeomFill_Location
	Degmax(Standard_Integer)=11
	Segmax(Standard_Integer)=30

Returns:
	None

Build the Sweeep  Surface  
   Transition define Transition strategy  
   Approx define Approximation Strategy  
   - GeomFill_Section : The composed Function Location X Section  
                        is directly approximed.  
   - GeomFill_Location : The location law is approximed, and the  
                         SweepSurface is bulid algebric composition  
                         of approximed location law and section law  
                         This option is Ok, if Section.Surface() methode  
                         is effective.  
   Continuity : The continuity in v waiting on the surface  
   Degmax     : The maximum degree in v requiered on the surface  
   Segmax     : The maximum number of span in v requiered on  
                the surface.") Build;
		void Build (TopTools_MapOfShape & ReversedEdges,BRepFill_DataMapOfShapeHArray2OfShape & Tapes,const BRepFill_TransitionStyle Transition = BRepFill_Modified,const GeomAbs_Shape Continuity = GeomAbs_C2,const GeomFill_ApproxStyle Approx = GeomFill_Location,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 30);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Say if the Shape is Build.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the Sweeping Shape") Shape;
		TopoDS_Shape Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Get the Approximation  error.") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") SubShape;
		Handle_TopTools_HArray2OfShape SubShape ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") InterFaces;
		Handle_TopTools_HArray2OfShape InterFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HArray2OfShape

No detailed docstring for this function.") Sections;
		Handle_TopTools_HArray2OfShape Sections ();
};


%feature("shadow") BRepFill_Sweep::~BRepFill_Sweep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Sweep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_TrimEdgeTool;
class BRepFill_TrimEdgeTool {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool ();
		%feature("autodoc", "Args:
	Bisec(Bisector_Bisec)
	S1(Handle_Geom2d_Geometry)
	S2(Handle_Geom2d_Geometry)
	Offset(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepFill_TrimEdgeTool;
		 BRepFill_TrimEdgeTool (const Bisector_Bisec & Bisec,const Handle_Geom2d_Geometry & S1,const Handle_Geom2d_Geometry & S2,const Standard_Real Offset);
		%feature("autodoc", "Args:
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Params(TColgp_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") IntersectWith;
		void IntersectWith (const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,TColgp_SequenceOfPnt & Params);
		%feature("autodoc", "Args:
	Start(Standard_Boolean)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Params(TColgp_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") AddOrConfuse;
		void AddOrConfuse (const Standard_Boolean Start,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,TColgp_SequenceOfPnt & Params);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInside;
		Standard_Boolean IsInside (const gp_Pnt2d & P);
};


%feature("shadow") BRepFill_TrimEdgeTool::~BRepFill_TrimEdgeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_TrimEdgeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_TrimShellCorner;
class BRepFill_TrimShellCorner {
	public:
		%feature("autodoc", "Args:
	theFaces(Handle_TopTools_HArray2OfShape)
	theAxeOfBisPlane(gp_Ax2)
	theSecPlane(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner (const Handle_TopTools_HArray2OfShape & theFaces,const gp_Ax2 & theAxeOfBisPlane,const TopoDS_Face & theSecPlane);
		%feature("autodoc", "Args:
	theFaces(Handle_TopTools_HArray2OfShape)
	theAxeOfBisPlane(gp_Ax2)
	theSpine(TopoDS_Wire)
	theSecPlane(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") BRepFill_TrimShellCorner;
		 BRepFill_TrimShellCorner (const Handle_TopTools_HArray2OfShape & theFaces,const gp_Ax2 & theAxeOfBisPlane,const TopoDS_Wire & theSpine,const TopoDS_Face & theSecPlane);
		%feature("autodoc", "Args:
	theSpine(TopoDS_Wire)

Returns:
	None

No detailed docstring for this function.") SetSpine;
		void SetSpine (const TopoDS_Wire & theSpine);
		%feature("autodoc", "Args:
	Bounds(Handle_TopTools_HArray2OfShape)

Returns:
	None

No detailed docstring for this function.") AddBounds;
		void AddBounds (const Handle_TopTools_HArray2OfShape & Bounds);
		%feature("autodoc", "Args:
	theUEdges(Handle_TopTools_HArray2OfShape)

Returns:
	None

No detailed docstring for this function.") AddUEdges;
		void AddUEdges (const Handle_TopTools_HArray2OfShape & theUEdges);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasSection;
		Standard_Boolean HasSection ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	theModified(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Modified;
		void Modified (const TopoDS_Shape & S,TopTools_ListOfShape & theModified);
};


%feature("shadow") BRepFill_TrimShellCorner::~BRepFill_TrimShellCorner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_TrimShellCorner {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_TrimSurfaceTool;
class BRepFill_TrimSurfaceTool {
	public:
		%feature("autodoc", "Args:
	Bis(Handle_Geom2d_Curve)
	Face1(TopoDS_Face)
	Face2(TopoDS_Face)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Inv1(Standard_Boolean)
	Inv2(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") BRepFill_TrimSurfaceTool;
		 BRepFill_TrimSurfaceTool (const Handle_Geom2d_Curve & Bis,const TopoDS_Face & Face1,const TopoDS_Face & Face2,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Boolean Inv1,const Standard_Boolean Inv2);
		%feature("autodoc", "Args:
	EdgeOnF1(TopoDS_Edge)
	EdgeOnF2(TopoDS_Edge)
	Points(TColgp_SequenceOfPnt)

Returns:
	None

Intersect <Bis>  with the  projection of the edges  
         <EdgeOnFi> and returns the intersecting parameters  
         on Bis and on the edges  
         P.X() : Parameter on Bis  
         P.Y() : Parameter on EdgeOnF1  
         P.Z() : Parameter on EdgeOnF2  raises if <Edge> is not a edge of Face1 or Face2.") IntersectWith;
		void IntersectWith (const TopoDS_Edge & EdgeOnF1,const TopoDS_Edge & EdgeOnF2,TColgp_SequenceOfPnt & Points);
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)

Returns:
	Standard_Boolean

returns True if the Line (P, DZ) intersect the Faces") IsOnFace;
		Standard_Boolean IsOnFace (const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	Point(gp_Pnt2d)
	Edge(TopoDS_Edge)

Returns:
	Standard_Real

returns the parameter of the  point <Point> on the  
         Edge <Edge>, assuming that the point is on the edge.") ProjOn;
		Standard_Real ProjOn (const gp_Pnt2d & Point,const TopoDS_Edge & Edge);
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Curve(Handle_Geom_Curve)
	PCurve1(Handle_Geom2d_Curve)
	PCurve2(Handle_Geom2d_Curve)
	myCont(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") Project;
		void Project (const Standard_Real U1,const Standard_Real U2,Handle_Geom_Curve & Curve,Handle_Geom2d_Curve & PCurve1,Handle_Geom2d_Curve & PCurve2,GeomAbs_Shape & myCont);
};


%feature("shadow") BRepFill_TrimSurfaceTool::~BRepFill_TrimSurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_TrimSurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepFill_ACRLaw;
class BRepFill_ACRLaw : public BRepFill_LocationLaw {
	public:
		%feature("autodoc", "Args:
	Path(TopoDS_Wire)
	Law(Handle_GeomFill_LocationGuide)

Returns:
	None

No detailed docstring for this function.") BRepFill_ACRLaw;
		 BRepFill_ACRLaw (const TopoDS_Wire & Path,const Handle_GeomFill_LocationGuide & Law);
};


%feature("shadow") BRepFill_ACRLaw::~BRepFill_ACRLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ACRLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_ACRLaw {
	Handle_BRepFill_ACRLaw GetHandle() {
	return *(Handle_BRepFill_ACRLaw*) &$self;
	}
};

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
    BRepFill_ACRLaw* GetObject() {
    return (BRepFill_ACRLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_ACRLaw::~Handle_BRepFill_ACRLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_ACRLaw {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_Edge3DLaw;
class BRepFill_Edge3DLaw : public BRepFill_LocationLaw {
	public:
		%feature("autodoc", "Args:
	Path(TopoDS_Wire)
	Law(Handle_GeomFill_LocationLaw)

Returns:
	None

No detailed docstring for this function.") BRepFill_Edge3DLaw;
		 BRepFill_Edge3DLaw (const TopoDS_Wire & Path,const Handle_GeomFill_LocationLaw & Law);
};


%feature("shadow") BRepFill_Edge3DLaw::~BRepFill_Edge3DLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_Edge3DLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_Edge3DLaw {
	Handle_BRepFill_Edge3DLaw GetHandle() {
	return *(Handle_BRepFill_Edge3DLaw*) &$self;
	}
};

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
    BRepFill_Edge3DLaw* GetObject() {
    return (BRepFill_Edge3DLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_Edge3DLaw::~Handle_BRepFill_Edge3DLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_Edge3DLaw {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_EdgeOnSurfLaw;
class BRepFill_EdgeOnSurfLaw : public BRepFill_LocationLaw {
	public:
		%feature("autodoc", "Args:
	Path(TopoDS_Wire)
	Surf(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") BRepFill_EdgeOnSurfLaw;
		 BRepFill_EdgeOnSurfLaw (const TopoDS_Wire & Path,const TopoDS_Shape & Surf);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns <False> if one  Edge of <Path> do not have  
          representation on  <Surf>.   In this  case  it is  
         impossible to use this object.") HasResult;
		Standard_Boolean HasResult ();
};


%feature("shadow") BRepFill_EdgeOnSurfLaw::~BRepFill_EdgeOnSurfLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_EdgeOnSurfLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_EdgeOnSurfLaw {
	Handle_BRepFill_EdgeOnSurfLaw GetHandle() {
	return *(Handle_BRepFill_EdgeOnSurfLaw*) &$self;
	}
};

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
    BRepFill_EdgeOnSurfLaw* GetObject() {
    return (BRepFill_EdgeOnSurfLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_EdgeOnSurfLaw::~Handle_BRepFill_EdgeOnSurfLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_EdgeOnSurfLaw {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_NSections;
class BRepFill_NSections : public BRepFill_SectionLaw {
	public:
		%feature("autodoc", "Args:
	S(TopTools_SequenceOfShape)
	Build(Standard_Boolean)=Standard_True

Returns:
	None

Construct") BRepFill_NSections;
		 BRepFill_NSections (const TopTools_SequenceOfShape & S,const Standard_Boolean Build = Standard_True);
		%feature("autodoc", "Args:
	S(TopTools_SequenceOfShape)
	Trsfs(GeomFill_SequenceOfTrsf)
	P(TColStd_SequenceOfReal)
	VF(Standard_Real)
	VL(Standard_Real)
	Build(Standard_Boolean)=Standard_True

Returns:
	None

Construct") BRepFill_NSections;
		 BRepFill_NSections (const TopTools_SequenceOfShape & S,const GeomFill_SequenceOfTrsf & Trsfs,const TColStd_SequenceOfReal & P,const Standard_Real VF,const Standard_Real VL,const Standard_Boolean Build = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Say if the input shape is a  vertex.") IsVertex;
		virtual Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Say if the Law is  Constant.") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_GeomFill_SectionLaw

Give the law build on a concatened section") ConcatenedLaw;
		virtual Handle_GeomFill_SectionLaw ConcatenedLaw ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TolAngular(Standard_Real)

Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	virtual TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") D0;
		virtual void D0 (const Standard_Real Param,TopoDS_Shape & S);
};


%feature("shadow") BRepFill_NSections::~BRepFill_NSections %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_NSections {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_NSections {
	Handle_BRepFill_NSections GetHandle() {
	return *(Handle_BRepFill_NSections*) &$self;
	}
};

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
    BRepFill_NSections* GetObject() {
    return (BRepFill_NSections*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_NSections::~Handle_BRepFill_NSections %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_NSections {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_ShapeLaw;
class BRepFill_ShapeLaw : public BRepFill_SectionLaw {
	public:
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	Build(Standard_Boolean)=Standard_True

Returns:
	None

Construct an constant Law") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Vertex & V,const Standard_Boolean Build = Standard_True);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	Build(Standard_Boolean)=Standard_True

Returns:
	None

Construct an constant Law") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Wire & W,const Standard_Boolean Build = Standard_True);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	L(Handle_Law_Function)
	Build(Standard_Boolean)=Standard_True

Returns:
	None

Construct an evolutive Law") BRepFill_ShapeLaw;
		 BRepFill_ShapeLaw (const TopoDS_Wire & W,const Handle_Law_Function & L,const Standard_Boolean Build = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Say if the input shape is a  vertex.") IsVertex;
		virtual Standard_Boolean IsVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Say if the Law is  Constant.") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_GeomFill_SectionLaw

Give the law build on a concaneted section") ConcatenedLaw;
		virtual Handle_GeomFill_SectionLaw ConcatenedLaw ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TolAngular(Standard_Real)

Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual GeomAbs_Shape Continuity (const Standard_Integer Index,const Standard_Real TolAngular);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") VertexTol;
		virtual Standard_Real VertexTol (const Standard_Integer Index,const Standard_Real Param);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Param(Standard_Real)

Returns:
	virtual TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		virtual TopoDS_Vertex Vertex (const Standard_Integer Index,const Standard_Real Param);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") D0;
		virtual void D0 (const Standard_Real Param,TopoDS_Shape & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge (const Standard_Integer Index);
};


%feature("shadow") BRepFill_ShapeLaw::~BRepFill_ShapeLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_ShapeLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_ShapeLaw {
	Handle_BRepFill_ShapeLaw GetHandle() {
	return *(Handle_BRepFill_ShapeLaw*) &$self;
	}
};

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
    BRepFill_ShapeLaw* GetObject() {
    return (BRepFill_ShapeLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_ShapeLaw::~Handle_BRepFill_ShapeLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_ShapeLaw {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepFill_DraftLaw;
class BRepFill_DraftLaw : public BRepFill_Edge3DLaw {
	public:
		%feature("autodoc", "Args:
	Path(TopoDS_Wire)
	Law(Handle_GeomFill_LocationDraft)

Returns:
	None

No detailed docstring for this function.") BRepFill_DraftLaw;
		 BRepFill_DraftLaw (const TopoDS_Wire & Path,const Handle_GeomFill_LocationDraft & Law);
		%feature("autodoc", "Args:
	TolAngular(Standard_Real)

Returns:
	None

To clean the little discontinuities.") CleanLaw;
		void CleanLaw (const Standard_Real TolAngular);
};


%feature("shadow") BRepFill_DraftLaw::~BRepFill_DraftLaw %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepFill_DraftLaw {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepFill_DraftLaw {
	Handle_BRepFill_DraftLaw GetHandle() {
	return *(Handle_BRepFill_DraftLaw*) &$self;
	}
};

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
    BRepFill_DraftLaw* GetObject() {
    return (BRepFill_DraftLaw*)$self->Access();
    }
};
%feature("shadow") Handle_BRepFill_DraftLaw::~Handle_BRepFill_DraftLaw %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepFill_DraftLaw {
    void _kill_pointed() {
        delete $self;
    }
};

