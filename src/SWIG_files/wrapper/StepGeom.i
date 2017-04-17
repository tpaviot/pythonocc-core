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
%module (package="OCC") StepGeom

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


%include StepGeom_headers.i


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
enum StepGeom_BSplineCurveForm {
	StepGeom_bscfPolylineForm = 0,
	StepGeom_bscfCircularArc = 1,
	StepGeom_bscfEllipticArc = 2,
	StepGeom_bscfParabolicArc = 3,
	StepGeom_bscfHyperbolicArc = 4,
	StepGeom_bscfUnspecified = 5,
};

enum StepGeom_BSplineSurfaceForm {
	StepGeom_bssfPlaneSurf = 0,
	StepGeom_bssfCylindricalSurf = 1,
	StepGeom_bssfConicalSurf = 2,
	StepGeom_bssfSphericalSurf = 3,
	StepGeom_bssfToroidalSurf = 4,
	StepGeom_bssfSurfOfRevolution = 5,
	StepGeom_bssfRuledSurf = 6,
	StepGeom_bssfGeneralisedCone = 7,
	StepGeom_bssfQuadricSurf = 8,
	StepGeom_bssfSurfOfLinearExtrusion = 9,
	StepGeom_bssfUnspecified = 10,
};

enum StepGeom_KnotType {
	StepGeom_ktUniformKnots = 0,
	StepGeom_ktUnspecified = 1,
	StepGeom_ktQuasiUniformKnots = 2,
	StepGeom_ktPiecewiseBezierKnots = 3,
};

enum StepGeom_PreferredSurfaceCurveRepresentation {
	StepGeom_pscrCurve3d = 0,
	StepGeom_pscrPcurveS1 = 1,
	StepGeom_pscrPcurveS2 = 2,
};

enum StepGeom_TransitionCode {
	StepGeom_tcDiscontinuous = 0,
	StepGeom_tcContinuous = 1,
	StepGeom_tcContSameGradient = 2,
	StepGeom_tcContSameGradientSameCurvature = 3,
};

enum StepGeom_TrimmingPreference {
	StepGeom_tpCartesian = 0,
	StepGeom_tpParameter = 1,
	StepGeom_tpUnspecified = 2,
};

/* end public enums declaration */

%nodefaultctor StepGeom_Array1OfBoundaryCurve;
class StepGeom_Array1OfBoundaryCurve {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfBoundaryCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfBoundaryCurve;
		 StepGeom_Array1OfBoundaryCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfBoundaryCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepGeom_BoundaryCurve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfBoundaryCurve;
		 StepGeom_Array1OfBoundaryCurve (const Handle_StepGeom_BoundaryCurve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_BoundaryCurve &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_BoundaryCurve & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfBoundaryCurve &
	:rtype: StepGeom_Array1OfBoundaryCurve
") Assign;
		const StepGeom_Array1OfBoundaryCurve & Assign (const StepGeom_Array1OfBoundaryCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfBoundaryCurve &
	:rtype: StepGeom_Array1OfBoundaryCurve
") operator =;
		const StepGeom_Array1OfBoundaryCurve & operator = (const StepGeom_Array1OfBoundaryCurve & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_BoundaryCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_BoundaryCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_BoundaryCurve
") Value;
		Handle_StepGeom_BoundaryCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_BoundaryCurve
") ChangeValue;
		Handle_StepGeom_BoundaryCurve ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array1OfCartesianPoint;
class StepGeom_Array1OfCartesianPoint {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfCartesianPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfCartesianPoint;
		 StepGeom_Array1OfCartesianPoint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfCartesianPoint;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepGeom_CartesianPoint &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfCartesianPoint;
		 StepGeom_Array1OfCartesianPoint (const Handle_StepGeom_CartesianPoint & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_CartesianPoint &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_CartesianPoint & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfCartesianPoint &
	:rtype: StepGeom_Array1OfCartesianPoint
") Assign;
		const StepGeom_Array1OfCartesianPoint & Assign (const StepGeom_Array1OfCartesianPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfCartesianPoint &
	:rtype: StepGeom_Array1OfCartesianPoint
") operator =;
		const StepGeom_Array1OfCartesianPoint & operator = (const StepGeom_Array1OfCartesianPoint & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_CartesianPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CartesianPoint
") Value;
		Handle_StepGeom_CartesianPoint Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CartesianPoint
") ChangeValue;
		Handle_StepGeom_CartesianPoint ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array1OfCompositeCurveSegment;
class StepGeom_Array1OfCompositeCurveSegment {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfCompositeCurveSegment;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfCompositeCurveSegment;
		 StepGeom_Array1OfCompositeCurveSegment (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfCompositeCurveSegment;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepGeom_CompositeCurveSegment &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfCompositeCurveSegment;
		 StepGeom_Array1OfCompositeCurveSegment (const Handle_StepGeom_CompositeCurveSegment & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_CompositeCurveSegment &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_CompositeCurveSegment & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfCompositeCurveSegment &
	:rtype: StepGeom_Array1OfCompositeCurveSegment
") Assign;
		const StepGeom_Array1OfCompositeCurveSegment & Assign (const StepGeom_Array1OfCompositeCurveSegment & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfCompositeCurveSegment &
	:rtype: StepGeom_Array1OfCompositeCurveSegment
") operator =;
		const StepGeom_Array1OfCompositeCurveSegment & operator = (const StepGeom_Array1OfCompositeCurveSegment & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_CompositeCurveSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_CompositeCurveSegment & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CompositeCurveSegment
") Value;
		Handle_StepGeom_CompositeCurveSegment Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CompositeCurveSegment
") ChangeValue;
		Handle_StepGeom_CompositeCurveSegment ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array1OfCurve;
class StepGeom_Array1OfCurve {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfCurve;
		 StepGeom_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfCurve;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepGeom_Curve &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfCurve;
		 StepGeom_Array1OfCurve (const Handle_StepGeom_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_Curve & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfCurve &
	:rtype: StepGeom_Array1OfCurve
") Assign;
		const StepGeom_Array1OfCurve & Assign (const StepGeom_Array1OfCurve & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfCurve &
	:rtype: StepGeom_Array1OfCurve
") operator =;
		const StepGeom_Array1OfCurve & operator = (const StepGeom_Array1OfCurve & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_Curve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_Curve
") Value;
		Handle_StepGeom_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_Curve
") ChangeValue;
		Handle_StepGeom_Curve ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array1OfPcurveOrSurface;
class StepGeom_Array1OfPcurveOrSurface {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfPcurveOrSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfPcurveOrSurface;
		 StepGeom_Array1OfPcurveOrSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfPcurveOrSurface;
		%feature("autodoc", "	:param Item:
	:type Item: StepGeom_PcurveOrSurface &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfPcurveOrSurface;
		 StepGeom_Array1OfPcurveOrSurface (const StepGeom_PcurveOrSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepGeom_PcurveOrSurface &
	:rtype: None
") Init;
		void Init (const StepGeom_PcurveOrSurface & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfPcurveOrSurface &
	:rtype: StepGeom_Array1OfPcurveOrSurface
") Assign;
		const StepGeom_Array1OfPcurveOrSurface & Assign (const StepGeom_Array1OfPcurveOrSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfPcurveOrSurface &
	:rtype: StepGeom_Array1OfPcurveOrSurface
") operator =;
		const StepGeom_Array1OfPcurveOrSurface & operator = (const StepGeom_Array1OfPcurveOrSurface & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepGeom_PcurveOrSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepGeom_PcurveOrSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_PcurveOrSurface
") Value;
		const StepGeom_PcurveOrSurface & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_PcurveOrSurface
") ChangeValue;
		StepGeom_PcurveOrSurface & ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfPcurveOrSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array1OfSurfaceBoundary;
class StepGeom_Array1OfSurfaceBoundary {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfSurfaceBoundary;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfSurfaceBoundary;
		 StepGeom_Array1OfSurfaceBoundary (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfSurfaceBoundary;
		%feature("autodoc", "	:param Item:
	:type Item: StepGeom_SurfaceBoundary &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfSurfaceBoundary;
		 StepGeom_Array1OfSurfaceBoundary (const StepGeom_SurfaceBoundary & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepGeom_SurfaceBoundary &
	:rtype: None
") Init;
		void Init (const StepGeom_SurfaceBoundary & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfSurfaceBoundary &
	:rtype: StepGeom_Array1OfSurfaceBoundary
") Assign;
		const StepGeom_Array1OfSurfaceBoundary & Assign (const StepGeom_Array1OfSurfaceBoundary & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfSurfaceBoundary &
	:rtype: StepGeom_Array1OfSurfaceBoundary
") operator =;
		const StepGeom_Array1OfSurfaceBoundary & operator = (const StepGeom_Array1OfSurfaceBoundary & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepGeom_SurfaceBoundary &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepGeom_SurfaceBoundary & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_SurfaceBoundary
") Value;
		const StepGeom_SurfaceBoundary & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_SurfaceBoundary
") ChangeValue;
		StepGeom_SurfaceBoundary & ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfSurfaceBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array1OfTrimmingSelect;
class StepGeom_Array1OfTrimmingSelect {
	public:
		%feature("compactdefaultargs") StepGeom_Array1OfTrimmingSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfTrimmingSelect;
		 StepGeom_Array1OfTrimmingSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_Array1OfTrimmingSelect;
		%feature("autodoc", "	:param Item:
	:type Item: StepGeom_TrimmingSelect &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_Array1OfTrimmingSelect;
		 StepGeom_Array1OfTrimmingSelect (const StepGeom_TrimmingSelect & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepGeom_TrimmingSelect &
	:rtype: None
") Init;
		void Init (const StepGeom_TrimmingSelect & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfTrimmingSelect &
	:rtype: StepGeom_Array1OfTrimmingSelect
") Assign;
		const StepGeom_Array1OfTrimmingSelect & Assign (const StepGeom_Array1OfTrimmingSelect & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array1OfTrimmingSelect &
	:rtype: StepGeom_Array1OfTrimmingSelect
") operator =;
		const StepGeom_Array1OfTrimmingSelect & operator = (const StepGeom_Array1OfTrimmingSelect & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepGeom_TrimmingSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepGeom_TrimmingSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_TrimmingSelect
") Value;
		const StepGeom_TrimmingSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_TrimmingSelect
") ChangeValue;
		StepGeom_TrimmingSelect & ChangeValue (const Standard_Integer Index);
};


%extend StepGeom_Array1OfTrimmingSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array2OfCartesianPoint;
class StepGeom_Array2OfCartesianPoint {
	public:
		%feature("compactdefaultargs") StepGeom_Array2OfCartesianPoint;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepGeom_Array2OfCartesianPoint;
		 StepGeom_Array2OfCartesianPoint (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepGeom_Array2OfCartesianPoint;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepGeom_CartesianPoint &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepGeom_Array2OfCartesianPoint;
		 StepGeom_Array2OfCartesianPoint (const Handle_StepGeom_CartesianPoint & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_CartesianPoint &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_CartesianPoint & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array2OfCartesianPoint &
	:rtype: StepGeom_Array2OfCartesianPoint
") Assign;
		const StepGeom_Array2OfCartesianPoint & Assign (const StepGeom_Array2OfCartesianPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array2OfCartesianPoint &
	:rtype: StepGeom_Array2OfCartesianPoint
") operator =;
		const StepGeom_Array2OfCartesianPoint & operator = (const StepGeom_Array2OfCartesianPoint & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepGeom_CartesianPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_CartesianPoint
") Value;
		Handle_StepGeom_CartesianPoint Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_CartesianPoint
") ChangeValue;
		Handle_StepGeom_CartesianPoint ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend StepGeom_Array2OfCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Array2OfSurfacePatch;
class StepGeom_Array2OfSurfacePatch {
	public:
		%feature("compactdefaultargs") StepGeom_Array2OfSurfacePatch;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepGeom_Array2OfSurfacePatch;
		 StepGeom_Array2OfSurfacePatch (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepGeom_Array2OfSurfacePatch;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepGeom_SurfacePatch &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepGeom_Array2OfSurfacePatch;
		 StepGeom_Array2OfSurfacePatch (const Handle_StepGeom_SurfacePatch & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_SurfacePatch &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_SurfacePatch & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array2OfSurfacePatch &
	:rtype: StepGeom_Array2OfSurfacePatch
") Assign;
		const StepGeom_Array2OfSurfacePatch & Assign (const StepGeom_Array2OfSurfacePatch & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepGeom_Array2OfSurfacePatch &
	:rtype: StepGeom_Array2OfSurfacePatch
") operator =;
		const StepGeom_Array2OfSurfacePatch & operator = (const StepGeom_Array2OfSurfacePatch & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepGeom_SurfacePatch &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepGeom_SurfacePatch & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_SurfacePatch
") Value;
		Handle_StepGeom_SurfacePatch Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_SurfacePatch
") ChangeValue;
		Handle_StepGeom_SurfacePatch ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend StepGeom_Array2OfSurfacePatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Axis2Placement;
class StepGeom_Axis2Placement : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepGeom_Axis2Placement;
		%feature("autodoc", "	* Returns a Axis2Placement SelectType

	:rtype: None
") StepGeom_Axis2Placement;
		 StepGeom_Axis2Placement ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a Axis2Placement Kind Entity that is : 1 -> Axis2Placement2d 2 -> Axis2Placement3d 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Axis2Placement2d;
		%feature("autodoc", "	* returns Value as a Axis2Placement2d (Null if another type)

	:rtype: Handle_StepGeom_Axis2Placement2d
") Axis2Placement2d;
		Handle_StepGeom_Axis2Placement2d Axis2Placement2d ();
		%feature("compactdefaultargs") Axis2Placement3d;
		%feature("autodoc", "	* returns Value as a Axis2Placement3d (Null if another type)

	:rtype: Handle_StepGeom_Axis2Placement3d
") Axis2Placement3d;
		Handle_StepGeom_Axis2Placement3d Axis2Placement3d ();
};


%extend StepGeom_Axis2Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CompositeCurveSegment;
class StepGeom_CompositeCurveSegment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_CompositeCurveSegment;
		%feature("autodoc", "	* Returns a CompositeCurveSegment

	:rtype: None
") StepGeom_CompositeCurveSegment;
		 StepGeom_CompositeCurveSegment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aTransition:
	:type aTransition: StepGeom_TransitionCode
	:param aSameSense:
	:type aSameSense: bool
	:param aParentCurve:
	:type aParentCurve: Handle_StepGeom_Curve &
	:rtype: void
") Init;
		virtual void Init (const StepGeom_TransitionCode aTransition,const Standard_Boolean aSameSense,const Handle_StepGeom_Curve & aParentCurve);
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "	:param aTransition:
	:type aTransition: StepGeom_TransitionCode
	:rtype: None
") SetTransition;
		void SetTransition (const StepGeom_TransitionCode aTransition);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	:rtype: StepGeom_TransitionCode
") Transition;
		StepGeom_TransitionCode Transition ();
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", "	:param aSameSense:
	:type aSameSense: bool
	:rtype: None
") SetSameSense;
		void SetSameSense (const Standard_Boolean aSameSense);
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "	:rtype: bool
") SameSense;
		Standard_Boolean SameSense ();
		%feature("compactdefaultargs") SetParentCurve;
		%feature("autodoc", "	:param aParentCurve:
	:type aParentCurve: Handle_StepGeom_Curve &
	:rtype: None
") SetParentCurve;
		void SetParentCurve (const Handle_StepGeom_Curve & aParentCurve);
		%feature("compactdefaultargs") ParentCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") ParentCurve;
		Handle_StepGeom_Curve ParentCurve ();
};


%extend StepGeom_CompositeCurveSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CompositeCurveSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CompositeCurveSegment::Handle_StepGeom_CompositeCurveSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CompositeCurveSegment;
class Handle_StepGeom_CompositeCurveSegment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_CompositeCurveSegment();
        Handle_StepGeom_CompositeCurveSegment(const Handle_StepGeom_CompositeCurveSegment &aHandle);
        Handle_StepGeom_CompositeCurveSegment(const StepGeom_CompositeCurveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CompositeCurveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CompositeCurveSegment {
    StepGeom_CompositeCurveSegment* _get_reference() {
    return (StepGeom_CompositeCurveSegment*)$self->Access();
    }
};

%extend Handle_StepGeom_CompositeCurveSegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CurveOnSurface;
class StepGeom_CurveOnSurface : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepGeom_CurveOnSurface;
		%feature("autodoc", "	* Returns a CurveOnSurface SelectType

	:rtype: None
") StepGeom_CurveOnSurface;
		 StepGeom_CurveOnSurface ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a CurveOnSurface Kind Entity that is : 1 -> Pcurve 2 -> SurfaceCurve 3 -> CompositeCurveOnSurface 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Pcurve;
		%feature("autodoc", "	* returns Value as a Pcurve (Null if another type)

	:rtype: Handle_StepGeom_Pcurve
") Pcurve;
		Handle_StepGeom_Pcurve Pcurve ();
		%feature("compactdefaultargs") SurfaceCurve;
		%feature("autodoc", "	* returns Value as a SurfaceCurve (Null if another type)

	:rtype: Handle_StepGeom_SurfaceCurve
") SurfaceCurve;
		Handle_StepGeom_SurfaceCurve SurfaceCurve ();
		%feature("compactdefaultargs") CompositeCurveOnSurface;
		%feature("autodoc", "	* returns Value as a CompositeCurveOnSurface (Null if another type)

	:rtype: Handle_StepGeom_CompositeCurveOnSurface
") CompositeCurveOnSurface;
		Handle_StepGeom_CompositeCurveOnSurface CompositeCurveOnSurface ();
};


%extend StepGeom_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
class StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		%feature("autodoc", "	:rtype: None
") StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		 StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aGeometricRepresentationCtx:
	:type aGeometricRepresentationCtx: Handle_StepGeom_GeometricRepresentationContext &
	:param aGlobalUnitAssignedCtx:
	:type aGlobalUnitAssignedCtx: Handle_StepRepr_GlobalUnitAssignedContext &
	:param aGlobalUncertaintyAssignedCtx:
	:type aGlobalUncertaintyAssignedCtx: Handle_StepRepr_GlobalUncertaintyAssignedContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Handle_StepGeom_GeometricRepresentationContext & aGeometricRepresentationCtx,const Handle_StepRepr_GlobalUnitAssignedContext & aGlobalUnitAssignedCtx,const Handle_StepRepr_GlobalUncertaintyAssignedContext & aGlobalUncertaintyAssignedCtx);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:param aUnits:
	:type aUnits: Handle_StepBasic_HArray1OfNamedUnit &
	:param anUncertainty:
	:type anUncertainty: Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Standard_Integer aCoordinateSpaceDimension,const Handle_StepBasic_HArray1OfNamedUnit & aUnits,const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit & anUncertainty);
		%feature("compactdefaultargs") SetGeometricRepresentationContext;
		%feature("autodoc", "	:param aGeometricRepresentationContext:
	:type aGeometricRepresentationContext: Handle_StepGeom_GeometricRepresentationContext &
	:rtype: None
") SetGeometricRepresentationContext;
		void SetGeometricRepresentationContext (const Handle_StepGeom_GeometricRepresentationContext & aGeometricRepresentationContext);
		%feature("compactdefaultargs") GeometricRepresentationContext;
		%feature("autodoc", "	:rtype: Handle_StepGeom_GeometricRepresentationContext
") GeometricRepresentationContext;
		Handle_StepGeom_GeometricRepresentationContext GeometricRepresentationContext ();
		%feature("compactdefaultargs") SetGlobalUnitAssignedContext;
		%feature("autodoc", "	:param aGlobalUnitAssignedContext:
	:type aGlobalUnitAssignedContext: Handle_StepRepr_GlobalUnitAssignedContext &
	:rtype: None
") SetGlobalUnitAssignedContext;
		void SetGlobalUnitAssignedContext (const Handle_StepRepr_GlobalUnitAssignedContext & aGlobalUnitAssignedContext);
		%feature("compactdefaultargs") GlobalUnitAssignedContext;
		%feature("autodoc", "	:rtype: Handle_StepRepr_GlobalUnitAssignedContext
") GlobalUnitAssignedContext;
		Handle_StepRepr_GlobalUnitAssignedContext GlobalUnitAssignedContext ();
		%feature("compactdefaultargs") SetGlobalUncertaintyAssignedContext;
		%feature("autodoc", "	:param aGlobalUncertaintyAssignedCtx:
	:type aGlobalUncertaintyAssignedCtx: Handle_StepRepr_GlobalUncertaintyAssignedContext &
	:rtype: None
") SetGlobalUncertaintyAssignedContext;
		void SetGlobalUncertaintyAssignedContext (const Handle_StepRepr_GlobalUncertaintyAssignedContext & aGlobalUncertaintyAssignedCtx);
		%feature("compactdefaultargs") GlobalUncertaintyAssignedContext;
		%feature("autodoc", "	:rtype: Handle_StepRepr_GlobalUncertaintyAssignedContext
") GlobalUncertaintyAssignedContext;
		Handle_StepRepr_GlobalUncertaintyAssignedContext GlobalUncertaintyAssignedContext ();
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:rtype: None
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension (const Standard_Integer aCoordinateSpaceDimension);
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "	:rtype: int
") CoordinateSpaceDimension;
		Standard_Integer CoordinateSpaceDimension ();
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "	:param aUnits:
	:type aUnits: Handle_StepBasic_HArray1OfNamedUnit &
	:rtype: None
") SetUnits;
		void SetUnits (const Handle_StepBasic_HArray1OfNamedUnit & aUnits);
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfNamedUnit
") Units;
		Handle_StepBasic_HArray1OfNamedUnit Units ();
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_NamedUnit
") UnitsValue;
		Handle_StepBasic_NamedUnit UnitsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "	:rtype: int
") NbUnits;
		Standard_Integer NbUnits ();
		%feature("compactdefaultargs") SetUncertainty;
		%feature("autodoc", "	:param aUncertainty:
	:type aUncertainty: Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit &
	:rtype: None
") SetUncertainty;
		void SetUncertainty (const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit & aUncertainty);
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit
") Uncertainty;
		Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit Uncertainty ();
		%feature("compactdefaultargs") UncertaintyValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_UncertaintyMeasureWithUnit
") UncertaintyValue;
		Handle_StepBasic_UncertaintyMeasureWithUnit UncertaintyValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUncertainty;
		%feature("autodoc", "	:rtype: int
") NbUncertainty;
		Standard_Integer NbUncertainty ();
};


%extend StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
class Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx : public Handle_StepRepr_RepresentationContext {

    public:
        // constructors
        Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx();
        Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx(const Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx &aHandle);
        Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx(const StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
    StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx* _get_reference() {
    return (StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx*)$self->Access();
    }
};

%extend Handle_StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_GeometricRepresentationContext;
class StepGeom_GeometricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationContext;
		%feature("autodoc", "	* Returns a GeometricRepresentationContext

	:rtype: None
") StepGeom_GeometricRepresentationContext;
		 StepGeom_GeometricRepresentationContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Standard_Integer aCoordinateSpaceDimension);
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:rtype: None
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension (const Standard_Integer aCoordinateSpaceDimension);
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "	:rtype: int
") CoordinateSpaceDimension;
		Standard_Integer CoordinateSpaceDimension ();
};


%extend StepGeom_GeometricRepresentationContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_GeometricRepresentationContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_GeometricRepresentationContext::Handle_StepGeom_GeometricRepresentationContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_GeometricRepresentationContext;
class Handle_StepGeom_GeometricRepresentationContext : public Handle_StepRepr_RepresentationContext {

    public:
        // constructors
        Handle_StepGeom_GeometricRepresentationContext();
        Handle_StepGeom_GeometricRepresentationContext(const Handle_StepGeom_GeometricRepresentationContext &aHandle);
        Handle_StepGeom_GeometricRepresentationContext(const StepGeom_GeometricRepresentationContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_GeometricRepresentationContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_GeometricRepresentationContext {
    StepGeom_GeometricRepresentationContext* _get_reference() {
    return (StepGeom_GeometricRepresentationContext*)$self->Access();
    }
};

%extend Handle_StepGeom_GeometricRepresentationContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_GeometricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext;
class StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext;
		%feature("autodoc", "	* Returns a GeometricRepresentationContextAndGlobalUnitAssignedContext

	:rtype: None
") StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext;
		 StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aGeometricRepresentationContext:
	:type aGeometricRepresentationContext: Handle_StepGeom_GeometricRepresentationContext &
	:param aGlobalUnitAssignedContext:
	:type aGlobalUnitAssignedContext: Handle_StepRepr_GlobalUnitAssignedContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Handle_StepGeom_GeometricRepresentationContext & aGeometricRepresentationContext,const Handle_StepRepr_GlobalUnitAssignedContext & aGlobalUnitAssignedContext);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:param aUnits:
	:type aUnits: Handle_StepBasic_HArray1OfNamedUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Standard_Integer aCoordinateSpaceDimension,const Handle_StepBasic_HArray1OfNamedUnit & aUnits);
		%feature("compactdefaultargs") SetGeometricRepresentationContext;
		%feature("autodoc", "	:param aGeometricRepresentationContext:
	:type aGeometricRepresentationContext: Handle_StepGeom_GeometricRepresentationContext &
	:rtype: None
") SetGeometricRepresentationContext;
		void SetGeometricRepresentationContext (const Handle_StepGeom_GeometricRepresentationContext & aGeometricRepresentationContext);
		%feature("compactdefaultargs") GeometricRepresentationContext;
		%feature("autodoc", "	:rtype: Handle_StepGeom_GeometricRepresentationContext
") GeometricRepresentationContext;
		Handle_StepGeom_GeometricRepresentationContext GeometricRepresentationContext ();
		%feature("compactdefaultargs") SetGlobalUnitAssignedContext;
		%feature("autodoc", "	:param aGlobalUnitAssignedContext:
	:type aGlobalUnitAssignedContext: Handle_StepRepr_GlobalUnitAssignedContext &
	:rtype: None
") SetGlobalUnitAssignedContext;
		void SetGlobalUnitAssignedContext (const Handle_StepRepr_GlobalUnitAssignedContext & aGlobalUnitAssignedContext);
		%feature("compactdefaultargs") GlobalUnitAssignedContext;
		%feature("autodoc", "	:rtype: Handle_StepRepr_GlobalUnitAssignedContext
") GlobalUnitAssignedContext;
		Handle_StepRepr_GlobalUnitAssignedContext GlobalUnitAssignedContext ();
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:rtype: None
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension (const Standard_Integer aCoordinateSpaceDimension);
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "	:rtype: int
") CoordinateSpaceDimension;
		Standard_Integer CoordinateSpaceDimension ();
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "	:param aUnits:
	:type aUnits: Handle_StepBasic_HArray1OfNamedUnit &
	:rtype: None
") SetUnits;
		void SetUnits (const Handle_StepBasic_HArray1OfNamedUnit & aUnits);
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfNamedUnit
") Units;
		Handle_StepBasic_HArray1OfNamedUnit Units ();
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_NamedUnit
") UnitsValue;
		Handle_StepBasic_NamedUnit UnitsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "	:rtype: int
") NbUnits;
		Standard_Integer NbUnits ();
};


%extend StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext;
class Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext : public Handle_StepRepr_RepresentationContext {

    public:
        // constructors
        Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext();
        Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext(const Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext &aHandle);
        Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext(const StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext {
    StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext* _get_reference() {
    return (StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext*)$self->Access();
    }
};

%extend Handle_StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_GeometricRepresentationContextAndParametricRepresentationContext;
class StepGeom_GeometricRepresentationContextAndParametricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationContextAndParametricRepresentationContext;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") StepGeom_GeometricRepresentationContextAndParametricRepresentationContext;
		 StepGeom_GeometricRepresentationContextAndParametricRepresentationContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aGeometricRepresentationContext:
	:type aGeometricRepresentationContext: Handle_StepGeom_GeometricRepresentationContext &
	:param aParametricRepresentationContext:
	:type aParametricRepresentationContext: Handle_StepRepr_ParametricRepresentationContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Handle_StepGeom_GeometricRepresentationContext & aGeometricRepresentationContext,const Handle_StepRepr_ParametricRepresentationContext & aParametricRepresentationContext);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Standard_Integer aCoordinateSpaceDimension);
		%feature("compactdefaultargs") SetGeometricRepresentationContext;
		%feature("autodoc", "	:param aGeometricRepresentationContext:
	:type aGeometricRepresentationContext: Handle_StepGeom_GeometricRepresentationContext &
	:rtype: None
") SetGeometricRepresentationContext;
		void SetGeometricRepresentationContext (const Handle_StepGeom_GeometricRepresentationContext & aGeometricRepresentationContext);
		%feature("compactdefaultargs") GeometricRepresentationContext;
		%feature("autodoc", "	:rtype: Handle_StepGeom_GeometricRepresentationContext
") GeometricRepresentationContext;
		Handle_StepGeom_GeometricRepresentationContext GeometricRepresentationContext ();
		%feature("compactdefaultargs") SetParametricRepresentationContext;
		%feature("autodoc", "	:param aParametricRepresentationContext:
	:type aParametricRepresentationContext: Handle_StepRepr_ParametricRepresentationContext &
	:rtype: None
") SetParametricRepresentationContext;
		void SetParametricRepresentationContext (const Handle_StepRepr_ParametricRepresentationContext & aParametricRepresentationContext);
		%feature("compactdefaultargs") ParametricRepresentationContext;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ParametricRepresentationContext
") ParametricRepresentationContext;
		Handle_StepRepr_ParametricRepresentationContext ParametricRepresentationContext ();
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "	:param aCoordinateSpaceDimension:
	:type aCoordinateSpaceDimension: int
	:rtype: None
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension (const Standard_Integer aCoordinateSpaceDimension);
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "	:rtype: int
") CoordinateSpaceDimension;
		Standard_Integer CoordinateSpaceDimension ();
};


%extend StepGeom_GeometricRepresentationContextAndParametricRepresentationContext {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext;
class Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext : public Handle_StepRepr_RepresentationContext {

    public:
        // constructors
        Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext();
        Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext(const Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext &aHandle);
        Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext(const StepGeom_GeometricRepresentationContextAndParametricRepresentationContext *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext {
    StepGeom_GeometricRepresentationContextAndParametricRepresentationContext* _get_reference() {
    return (StepGeom_GeometricRepresentationContextAndParametricRepresentationContext*)$self->Access();
    }
};

%extend Handle_StepGeom_GeometricRepresentationContextAndParametricRepresentationContext {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_GeometricRepresentationContextAndParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_GeometricRepresentationItem;
class StepGeom_GeometricRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationItem;
		%feature("autodoc", "	* Returns a GeometricRepresentationItem

	:rtype: None
") StepGeom_GeometricRepresentationItem;
		 StepGeom_GeometricRepresentationItem ();
};


%extend StepGeom_GeometricRepresentationItem {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_GeometricRepresentationItem(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_GeometricRepresentationItem::Handle_StepGeom_GeometricRepresentationItem %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_GeometricRepresentationItem;
class Handle_StepGeom_GeometricRepresentationItem : public Handle_StepRepr_RepresentationItem {

    public:
        // constructors
        Handle_StepGeom_GeometricRepresentationItem();
        Handle_StepGeom_GeometricRepresentationItem(const Handle_StepGeom_GeometricRepresentationItem &aHandle);
        Handle_StepGeom_GeometricRepresentationItem(const StepGeom_GeometricRepresentationItem *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_GeometricRepresentationItem DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_GeometricRepresentationItem {
    StepGeom_GeometricRepresentationItem* _get_reference() {
    return (StepGeom_GeometricRepresentationItem*)$self->Access();
    }
};

%extend Handle_StepGeom_GeometricRepresentationItem {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_GeometricRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfBoundaryCurve;
class StepGeom_HArray1OfBoundaryCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfBoundaryCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfBoundaryCurve;
		 StepGeom_HArray1OfBoundaryCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfBoundaryCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepGeom_BoundaryCurve &
	:rtype: None
") StepGeom_HArray1OfBoundaryCurve;
		 StepGeom_HArray1OfBoundaryCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepGeom_BoundaryCurve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_BoundaryCurve &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_BoundaryCurve & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_BoundaryCurve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_BoundaryCurve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_BoundaryCurve
") Value;
		Handle_StepGeom_BoundaryCurve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_BoundaryCurve
") ChangeValue;
		Handle_StepGeom_BoundaryCurve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfBoundaryCurve
") Array1;
		const StepGeom_Array1OfBoundaryCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfBoundaryCurve
") ChangeArray1;
		StepGeom_Array1OfBoundaryCurve & ChangeArray1 ();
};


%extend StepGeom_HArray1OfBoundaryCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfBoundaryCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfBoundaryCurve::Handle_StepGeom_HArray1OfBoundaryCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfBoundaryCurve;
class Handle_StepGeom_HArray1OfBoundaryCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfBoundaryCurve();
        Handle_StepGeom_HArray1OfBoundaryCurve(const Handle_StepGeom_HArray1OfBoundaryCurve &aHandle);
        Handle_StepGeom_HArray1OfBoundaryCurve(const StepGeom_HArray1OfBoundaryCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfBoundaryCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfBoundaryCurve {
    StepGeom_HArray1OfBoundaryCurve* _get_reference() {
    return (StepGeom_HArray1OfBoundaryCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfBoundaryCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfCartesianPoint;
class StepGeom_HArray1OfCartesianPoint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfCartesianPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfCartesianPoint;
		 StepGeom_HArray1OfCartesianPoint (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfCartesianPoint;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepGeom_CartesianPoint &
	:rtype: None
") StepGeom_HArray1OfCartesianPoint;
		 StepGeom_HArray1OfCartesianPoint (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepGeom_CartesianPoint & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_CartesianPoint &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_CartesianPoint & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_CartesianPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CartesianPoint
") Value;
		Handle_StepGeom_CartesianPoint Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CartesianPoint
") ChangeValue;
		Handle_StepGeom_CartesianPoint ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfCartesianPoint
") Array1;
		const StepGeom_Array1OfCartesianPoint & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfCartesianPoint
") ChangeArray1;
		StepGeom_Array1OfCartesianPoint & ChangeArray1 ();
};


%extend StepGeom_HArray1OfCartesianPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfCartesianPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfCartesianPoint::Handle_StepGeom_HArray1OfCartesianPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfCartesianPoint;
class Handle_StepGeom_HArray1OfCartesianPoint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfCartesianPoint();
        Handle_StepGeom_HArray1OfCartesianPoint(const Handle_StepGeom_HArray1OfCartesianPoint &aHandle);
        Handle_StepGeom_HArray1OfCartesianPoint(const StepGeom_HArray1OfCartesianPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfCartesianPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfCartesianPoint {
    StepGeom_HArray1OfCartesianPoint* _get_reference() {
    return (StepGeom_HArray1OfCartesianPoint*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfCartesianPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfCompositeCurveSegment;
class StepGeom_HArray1OfCompositeCurveSegment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfCompositeCurveSegment;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfCompositeCurveSegment;
		 StepGeom_HArray1OfCompositeCurveSegment (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfCompositeCurveSegment;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepGeom_CompositeCurveSegment &
	:rtype: None
") StepGeom_HArray1OfCompositeCurveSegment;
		 StepGeom_HArray1OfCompositeCurveSegment (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepGeom_CompositeCurveSegment & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_CompositeCurveSegment &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_CompositeCurveSegment & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_CompositeCurveSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_CompositeCurveSegment & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CompositeCurveSegment
") Value;
		Handle_StepGeom_CompositeCurveSegment Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_CompositeCurveSegment
") ChangeValue;
		Handle_StepGeom_CompositeCurveSegment ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfCompositeCurveSegment
") Array1;
		const StepGeom_Array1OfCompositeCurveSegment & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfCompositeCurveSegment
") ChangeArray1;
		StepGeom_Array1OfCompositeCurveSegment & ChangeArray1 ();
};


%extend StepGeom_HArray1OfCompositeCurveSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfCompositeCurveSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfCompositeCurveSegment::Handle_StepGeom_HArray1OfCompositeCurveSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfCompositeCurveSegment;
class Handle_StepGeom_HArray1OfCompositeCurveSegment : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfCompositeCurveSegment();
        Handle_StepGeom_HArray1OfCompositeCurveSegment(const Handle_StepGeom_HArray1OfCompositeCurveSegment &aHandle);
        Handle_StepGeom_HArray1OfCompositeCurveSegment(const StepGeom_HArray1OfCompositeCurveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfCompositeCurveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfCompositeCurveSegment {
    StepGeom_HArray1OfCompositeCurveSegment* _get_reference() {
    return (StepGeom_HArray1OfCompositeCurveSegment*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfCompositeCurveSegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfCurve;
class StepGeom_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfCurve;
		 StepGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfCurve;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepGeom_Curve &
	:rtype: None
") StepGeom_HArray1OfCurve;
		 StepGeom_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepGeom_Curve & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_Curve & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepGeom_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepGeom_Curve & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_Curve
") Value;
		Handle_StepGeom_Curve Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepGeom_Curve
") ChangeValue;
		Handle_StepGeom_Curve ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfCurve
") Array1;
		const StepGeom_Array1OfCurve & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfCurve
") ChangeArray1;
		StepGeom_Array1OfCurve & ChangeArray1 ();
};


%extend StepGeom_HArray1OfCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfCurve::Handle_StepGeom_HArray1OfCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfCurve;
class Handle_StepGeom_HArray1OfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfCurve();
        Handle_StepGeom_HArray1OfCurve(const Handle_StepGeom_HArray1OfCurve &aHandle);
        Handle_StepGeom_HArray1OfCurve(const StepGeom_HArray1OfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfCurve {
    StepGeom_HArray1OfCurve* _get_reference() {
    return (StepGeom_HArray1OfCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfPcurveOrSurface;
class StepGeom_HArray1OfPcurveOrSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfPcurveOrSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfPcurveOrSurface;
		 StepGeom_HArray1OfPcurveOrSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfPcurveOrSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepGeom_PcurveOrSurface &
	:rtype: None
") StepGeom_HArray1OfPcurveOrSurface;
		 StepGeom_HArray1OfPcurveOrSurface (const Standard_Integer Low,const Standard_Integer Up,const StepGeom_PcurveOrSurface & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepGeom_PcurveOrSurface &
	:rtype: None
") Init;
		void Init (const StepGeom_PcurveOrSurface & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepGeom_PcurveOrSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepGeom_PcurveOrSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_PcurveOrSurface
") Value;
		const StepGeom_PcurveOrSurface & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_PcurveOrSurface
") ChangeValue;
		StepGeom_PcurveOrSurface & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfPcurveOrSurface
") Array1;
		const StepGeom_Array1OfPcurveOrSurface & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfPcurveOrSurface
") ChangeArray1;
		StepGeom_Array1OfPcurveOrSurface & ChangeArray1 ();
};


%extend StepGeom_HArray1OfPcurveOrSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfPcurveOrSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfPcurveOrSurface::Handle_StepGeom_HArray1OfPcurveOrSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfPcurveOrSurface;
class Handle_StepGeom_HArray1OfPcurveOrSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfPcurveOrSurface();
        Handle_StepGeom_HArray1OfPcurveOrSurface(const Handle_StepGeom_HArray1OfPcurveOrSurface &aHandle);
        Handle_StepGeom_HArray1OfPcurveOrSurface(const StepGeom_HArray1OfPcurveOrSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfPcurveOrSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfPcurveOrSurface {
    StepGeom_HArray1OfPcurveOrSurface* _get_reference() {
    return (StepGeom_HArray1OfPcurveOrSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfPcurveOrSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfPcurveOrSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfSurfaceBoundary;
class StepGeom_HArray1OfSurfaceBoundary : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfSurfaceBoundary;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfSurfaceBoundary;
		 StepGeom_HArray1OfSurfaceBoundary (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfSurfaceBoundary;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepGeom_SurfaceBoundary &
	:rtype: None
") StepGeom_HArray1OfSurfaceBoundary;
		 StepGeom_HArray1OfSurfaceBoundary (const Standard_Integer Low,const Standard_Integer Up,const StepGeom_SurfaceBoundary & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepGeom_SurfaceBoundary &
	:rtype: None
") Init;
		void Init (const StepGeom_SurfaceBoundary & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepGeom_SurfaceBoundary &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepGeom_SurfaceBoundary & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_SurfaceBoundary
") Value;
		const StepGeom_SurfaceBoundary & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_SurfaceBoundary
") ChangeValue;
		StepGeom_SurfaceBoundary & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfSurfaceBoundary
") Array1;
		const StepGeom_Array1OfSurfaceBoundary & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfSurfaceBoundary
") ChangeArray1;
		StepGeom_Array1OfSurfaceBoundary & ChangeArray1 ();
};


%extend StepGeom_HArray1OfSurfaceBoundary {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfSurfaceBoundary(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfSurfaceBoundary::Handle_StepGeom_HArray1OfSurfaceBoundary %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfSurfaceBoundary;
class Handle_StepGeom_HArray1OfSurfaceBoundary : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfSurfaceBoundary();
        Handle_StepGeom_HArray1OfSurfaceBoundary(const Handle_StepGeom_HArray1OfSurfaceBoundary &aHandle);
        Handle_StepGeom_HArray1OfSurfaceBoundary(const StepGeom_HArray1OfSurfaceBoundary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfSurfaceBoundary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfSurfaceBoundary {
    StepGeom_HArray1OfSurfaceBoundary* _get_reference() {
    return (StepGeom_HArray1OfSurfaceBoundary*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfSurfaceBoundary {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfSurfaceBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray1OfTrimmingSelect;
class StepGeom_HArray1OfTrimmingSelect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray1OfTrimmingSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepGeom_HArray1OfTrimmingSelect;
		 StepGeom_HArray1OfTrimmingSelect (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepGeom_HArray1OfTrimmingSelect;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: StepGeom_TrimmingSelect &
	:rtype: None
") StepGeom_HArray1OfTrimmingSelect;
		 StepGeom_HArray1OfTrimmingSelect (const Standard_Integer Low,const Standard_Integer Up,const StepGeom_TrimmingSelect & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: StepGeom_TrimmingSelect &
	:rtype: None
") Init;
		void Init (const StepGeom_TrimmingSelect & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: StepGeom_TrimmingSelect &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const StepGeom_TrimmingSelect & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_TrimmingSelect
") Value;
		const StepGeom_TrimmingSelect & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: StepGeom_TrimmingSelect
") ChangeValue;
		StepGeom_TrimmingSelect & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfTrimmingSelect
") Array1;
		const StepGeom_Array1OfTrimmingSelect & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepGeom_Array1OfTrimmingSelect
") ChangeArray1;
		StepGeom_Array1OfTrimmingSelect & ChangeArray1 ();
};


%extend StepGeom_HArray1OfTrimmingSelect {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray1OfTrimmingSelect(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray1OfTrimmingSelect::Handle_StepGeom_HArray1OfTrimmingSelect %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray1OfTrimmingSelect;
class Handle_StepGeom_HArray1OfTrimmingSelect : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray1OfTrimmingSelect();
        Handle_StepGeom_HArray1OfTrimmingSelect(const Handle_StepGeom_HArray1OfTrimmingSelect &aHandle);
        Handle_StepGeom_HArray1OfTrimmingSelect(const StepGeom_HArray1OfTrimmingSelect *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray1OfTrimmingSelect DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray1OfTrimmingSelect {
    StepGeom_HArray1OfTrimmingSelect* _get_reference() {
    return (StepGeom_HArray1OfTrimmingSelect*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray1OfTrimmingSelect {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray1OfTrimmingSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray2OfCartesianPoint;
class StepGeom_HArray2OfCartesianPoint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray2OfCartesianPoint;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepGeom_HArray2OfCartesianPoint;
		 StepGeom_HArray2OfCartesianPoint (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepGeom_HArray2OfCartesianPoint;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Handle_StepGeom_CartesianPoint &
	:rtype: None
") StepGeom_HArray2OfCartesianPoint;
		 StepGeom_HArray2OfCartesianPoint (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_StepGeom_CartesianPoint & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_CartesianPoint &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_CartesianPoint & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepGeom_CartesianPoint & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_CartesianPoint
") Value;
		Handle_StepGeom_CartesianPoint Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_CartesianPoint
") ChangeValue;
		Handle_StepGeom_CartesianPoint ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: StepGeom_Array2OfCartesianPoint
") Array2;
		const StepGeom_Array2OfCartesianPoint & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: StepGeom_Array2OfCartesianPoint
") ChangeArray2;
		StepGeom_Array2OfCartesianPoint & ChangeArray2 ();
};


%extend StepGeom_HArray2OfCartesianPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray2OfCartesianPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray2OfCartesianPoint::Handle_StepGeom_HArray2OfCartesianPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray2OfCartesianPoint;
class Handle_StepGeom_HArray2OfCartesianPoint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray2OfCartesianPoint();
        Handle_StepGeom_HArray2OfCartesianPoint(const Handle_StepGeom_HArray2OfCartesianPoint &aHandle);
        Handle_StepGeom_HArray2OfCartesianPoint(const StepGeom_HArray2OfCartesianPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray2OfCartesianPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray2OfCartesianPoint {
    StepGeom_HArray2OfCartesianPoint* _get_reference() {
    return (StepGeom_HArray2OfCartesianPoint*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray2OfCartesianPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray2OfCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_HArray2OfSurfacePatch;
class StepGeom_HArray2OfSurfacePatch : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_HArray2OfSurfacePatch;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") StepGeom_HArray2OfSurfacePatch;
		 StepGeom_HArray2OfSurfacePatch (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") StepGeom_HArray2OfSurfacePatch;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:param V:
	:type V: Handle_StepGeom_SurfacePatch &
	:rtype: None
") StepGeom_HArray2OfSurfacePatch;
		 StepGeom_HArray2OfSurfacePatch (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2,const Handle_StepGeom_SurfacePatch & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepGeom_SurfacePatch &
	:rtype: None
") Init;
		void Init (const Handle_StepGeom_SurfacePatch & V);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Handle_StepGeom_SurfacePatch &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Handle_StepGeom_SurfacePatch & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_SurfacePatch
") Value;
		Handle_StepGeom_SurfacePatch Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Handle_StepGeom_SurfacePatch
") ChangeValue;
		Handle_StepGeom_SurfacePatch ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") Array2;
		%feature("autodoc", "	:rtype: StepGeom_Array2OfSurfacePatch
") Array2;
		const StepGeom_Array2OfSurfacePatch & Array2 ();
		%feature("compactdefaultargs") ChangeArray2;
		%feature("autodoc", "	:rtype: StepGeom_Array2OfSurfacePatch
") ChangeArray2;
		StepGeom_Array2OfSurfacePatch & ChangeArray2 ();
};


%extend StepGeom_HArray2OfSurfacePatch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_HArray2OfSurfacePatch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_HArray2OfSurfacePatch::Handle_StepGeom_HArray2OfSurfacePatch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_HArray2OfSurfacePatch;
class Handle_StepGeom_HArray2OfSurfacePatch : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_HArray2OfSurfacePatch();
        Handle_StepGeom_HArray2OfSurfacePatch(const Handle_StepGeom_HArray2OfSurfacePatch &aHandle);
        Handle_StepGeom_HArray2OfSurfacePatch(const StepGeom_HArray2OfSurfacePatch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_HArray2OfSurfacePatch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_HArray2OfSurfacePatch {
    StepGeom_HArray2OfSurfacePatch* _get_reference() {
    return (StepGeom_HArray2OfSurfacePatch*)$self->Access();
    }
};

%extend Handle_StepGeom_HArray2OfSurfacePatch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_HArray2OfSurfacePatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_PcurveOrSurface;
class StepGeom_PcurveOrSurface : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepGeom_PcurveOrSurface;
		%feature("autodoc", "	* Returns a PcurveOrSurface SelectType

	:rtype: None
") StepGeom_PcurveOrSurface;
		 StepGeom_PcurveOrSurface ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a PcurveOrSurface Kind Entity that is : 1 -> Pcurve 2 -> Surface 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Pcurve;
		%feature("autodoc", "	* returns Value as a Pcurve (Null if another type)

	:rtype: Handle_StepGeom_Pcurve
") Pcurve;
		Handle_StepGeom_Pcurve Pcurve ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns Value as a Surface (Null if another type)

	:rtype: Handle_StepGeom_Surface
") Surface;
		Handle_StepGeom_Surface Surface ();
};


%extend StepGeom_PcurveOrSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfaceBoundary;
class StepGeom_SurfaceBoundary : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepGeom_SurfaceBoundary;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepGeom_SurfaceBoundary;
		 StepGeom_SurfaceBoundary ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of SurfaceBoundary select type 1 -> BoundaryCurve from StepGeom 2 -> DegeneratePcurve from StepGeom 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") BoundaryCurve;
		%feature("autodoc", "	* Returns Value as BoundaryCurve (or Null if another type)

	:rtype: Handle_StepGeom_BoundaryCurve
") BoundaryCurve;
		Handle_StepGeom_BoundaryCurve BoundaryCurve ();
		%feature("compactdefaultargs") DegeneratePcurve;
		%feature("autodoc", "	* Returns Value as DegeneratePcurve (or Null if another type)

	:rtype: Handle_StepGeom_DegeneratePcurve
") DegeneratePcurve;
		Handle_StepGeom_DegeneratePcurve DegeneratePcurve ();
};


%extend StepGeom_SurfaceBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfacePatch;
class StepGeom_SurfacePatch : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepGeom_SurfacePatch;
		%feature("autodoc", "	* Returns a SurfacePatch

	:rtype: None
") StepGeom_SurfacePatch;
		 StepGeom_SurfacePatch ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aParentSurface:
	:type aParentSurface: Handle_StepGeom_BoundedSurface &
	:param aUTransition:
	:type aUTransition: StepGeom_TransitionCode
	:param aVTransition:
	:type aVTransition: StepGeom_TransitionCode
	:param aUSense:
	:type aUSense: bool
	:param aVSense:
	:type aVSense: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_StepGeom_BoundedSurface & aParentSurface,const StepGeom_TransitionCode aUTransition,const StepGeom_TransitionCode aVTransition,const Standard_Boolean aUSense,const Standard_Boolean aVSense);
		%feature("compactdefaultargs") SetParentSurface;
		%feature("autodoc", "	:param aParentSurface:
	:type aParentSurface: Handle_StepGeom_BoundedSurface &
	:rtype: None
") SetParentSurface;
		void SetParentSurface (const Handle_StepGeom_BoundedSurface & aParentSurface);
		%feature("compactdefaultargs") ParentSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BoundedSurface
") ParentSurface;
		Handle_StepGeom_BoundedSurface ParentSurface ();
		%feature("compactdefaultargs") SetUTransition;
		%feature("autodoc", "	:param aUTransition:
	:type aUTransition: StepGeom_TransitionCode
	:rtype: None
") SetUTransition;
		void SetUTransition (const StepGeom_TransitionCode aUTransition);
		%feature("compactdefaultargs") UTransition;
		%feature("autodoc", "	:rtype: StepGeom_TransitionCode
") UTransition;
		StepGeom_TransitionCode UTransition ();
		%feature("compactdefaultargs") SetVTransition;
		%feature("autodoc", "	:param aVTransition:
	:type aVTransition: StepGeom_TransitionCode
	:rtype: None
") SetVTransition;
		void SetVTransition (const StepGeom_TransitionCode aVTransition);
		%feature("compactdefaultargs") VTransition;
		%feature("autodoc", "	:rtype: StepGeom_TransitionCode
") VTransition;
		StepGeom_TransitionCode VTransition ();
		%feature("compactdefaultargs") SetUSense;
		%feature("autodoc", "	:param aUSense:
	:type aUSense: bool
	:rtype: None
") SetUSense;
		void SetUSense (const Standard_Boolean aUSense);
		%feature("compactdefaultargs") USense;
		%feature("autodoc", "	:rtype: bool
") USense;
		Standard_Boolean USense ();
		%feature("compactdefaultargs") SetVSense;
		%feature("autodoc", "	:param aVSense:
	:type aVSense: bool
	:rtype: None
") SetVSense;
		void SetVSense (const Standard_Boolean aVSense);
		%feature("compactdefaultargs") VSense;
		%feature("autodoc", "	:rtype: bool
") VSense;
		Standard_Boolean VSense ();
};


%extend StepGeom_SurfacePatch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SurfacePatch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SurfacePatch::Handle_StepGeom_SurfacePatch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SurfacePatch;
class Handle_StepGeom_SurfacePatch : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StepGeom_SurfacePatch();
        Handle_StepGeom_SurfacePatch(const Handle_StepGeom_SurfacePatch &aHandle);
        Handle_StepGeom_SurfacePatch(const StepGeom_SurfacePatch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SurfacePatch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SurfacePatch {
    StepGeom_SurfacePatch* _get_reference() {
    return (StepGeom_SurfacePatch*)$self->Access();
    }
};

%extend Handle_StepGeom_SurfacePatch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SurfacePatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_TrimmingMember;
class StepGeom_TrimmingMember : public StepData_SelectReal {
	public:
		%feature("compactdefaultargs") StepGeom_TrimmingMember;
		%feature("autodoc", "	:rtype: None
") StepGeom_TrimmingMember;
		 StepGeom_TrimmingMember ();
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	:rtype: bool
") HasName;
		virtual Standard_Boolean HasName ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: bool
") SetName;
		virtual Standard_Boolean SetName (const char * name);
};


%extend StepGeom_TrimmingMember {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_TrimmingMember(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_TrimmingMember::Handle_StepGeom_TrimmingMember %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_TrimmingMember;
class Handle_StepGeom_TrimmingMember : public Handle_StepData_SelectReal {

    public:
        // constructors
        Handle_StepGeom_TrimmingMember();
        Handle_StepGeom_TrimmingMember(const Handle_StepGeom_TrimmingMember &aHandle);
        Handle_StepGeom_TrimmingMember(const StepGeom_TrimmingMember *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_TrimmingMember DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_TrimmingMember {
    StepGeom_TrimmingMember* _get_reference() {
    return (StepGeom_TrimmingMember*)$self->Access();
    }
};

%extend Handle_StepGeom_TrimmingMember {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_TrimmingMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_TrimmingSelect;
class StepGeom_TrimmingSelect : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepGeom_TrimmingSelect;
		%feature("autodoc", "	* Returns a TrimmingSelect SelectType

	:rtype: None
") StepGeom_TrimmingSelect;
		 StepGeom_TrimmingSelect ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a TrimmingSelect Kind Entity that is : 1 -> CartesianPoint 0 else (i.e. Real)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "	* Returns a TrimmingMember (for PARAMETER_VALUE) as preferred

	:rtype: Handle_StepData_SelectMember
") NewMember;
		virtual Handle_StepData_SelectMember NewMember ();
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "	* Recognizes a SelectMember as Real, named as PARAMETER_VALUE 1 -> ParameterValue i.e. Real 0 else (i.e. Entity)

	:param ent:
	:type ent: Handle_StepData_SelectMember &
	:rtype: int
") CaseMem;
		virtual Standard_Integer CaseMem (const Handle_StepData_SelectMember & ent);
		%feature("compactdefaultargs") CartesianPoint;
		%feature("autodoc", "	* returns Value as a CartesianPoint (Null if another type)

	:rtype: Handle_StepGeom_CartesianPoint
") CartesianPoint;
		Handle_StepGeom_CartesianPoint CartesianPoint ();
		%feature("compactdefaultargs") SetParameterValue;
		%feature("autodoc", "	* sets the ParameterValue as Real

	:param aParameterValue:
	:type aParameterValue: float
	:rtype: None
") SetParameterValue;
		void SetParameterValue (const Standard_Real aParameterValue);
		%feature("compactdefaultargs") ParameterValue;
		%feature("autodoc", "	* returns Value as a Real (0.0 if not a Real)

	:rtype: float
") ParameterValue;
		Standard_Real ParameterValue ();
};


%extend StepGeom_TrimmingSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_VectorOrDirection;
class StepGeom_VectorOrDirection : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepGeom_VectorOrDirection;
		%feature("autodoc", "	* Returns a VectorOrDirection SelectType

	:rtype: None
") StepGeom_VectorOrDirection;
		 StepGeom_VectorOrDirection ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a VectorOrDirection Kind Entity that is : 1 -> Vector 2 -> Direction 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "	* returns Value as a Vector (Null if another type)

	:rtype: Handle_StepGeom_Vector
") Vector;
		Handle_StepGeom_Vector Vector ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* returns Value as a Direction (Null if another type)

	:rtype: Handle_StepGeom_Direction
") Direction;
		Handle_StepGeom_Direction Direction ();
};


%extend StepGeom_VectorOrDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CartesianTransformationOperator;
class StepGeom_CartesianTransformationOperator : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_CartesianTransformationOperator;
		%feature("autodoc", "	* Returns a CartesianTransformationOperator

	:rtype: None
") StepGeom_CartesianTransformationOperator;
		 StepGeom_CartesianTransformationOperator ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasAaxis1:
	:type hasAaxis1: bool
	:param aAxis1:
	:type aAxis1: Handle_StepGeom_Direction &
	:param hasAaxis2:
	:type hasAaxis2: bool
	:param aAxis2:
	:type aAxis2: Handle_StepGeom_Direction &
	:param aLocalOrigin:
	:type aLocalOrigin: Handle_StepGeom_CartesianPoint &
	:param hasAscale:
	:type hasAscale: bool
	:param aScale:
	:type aScale: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasAaxis1,const Handle_StepGeom_Direction & aAxis1,const Standard_Boolean hasAaxis2,const Handle_StepGeom_Direction & aAxis2,const Handle_StepGeom_CartesianPoint & aLocalOrigin,const Standard_Boolean hasAscale,const Standard_Real aScale);
		%feature("compactdefaultargs") SetAxis1;
		%feature("autodoc", "	:param aAxis1:
	:type aAxis1: Handle_StepGeom_Direction &
	:rtype: None
") SetAxis1;
		void SetAxis1 (const Handle_StepGeom_Direction & aAxis1);
		%feature("compactdefaultargs") UnSetAxis1;
		%feature("autodoc", "	:rtype: None
") UnSetAxis1;
		void UnSetAxis1 ();
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Axis1;
		Handle_StepGeom_Direction Axis1 ();
		%feature("compactdefaultargs") HasAxis1;
		%feature("autodoc", "	:rtype: bool
") HasAxis1;
		Standard_Boolean HasAxis1 ();
		%feature("compactdefaultargs") SetAxis2;
		%feature("autodoc", "	:param aAxis2:
	:type aAxis2: Handle_StepGeom_Direction &
	:rtype: None
") SetAxis2;
		void SetAxis2 (const Handle_StepGeom_Direction & aAxis2);
		%feature("compactdefaultargs") UnSetAxis2;
		%feature("autodoc", "	:rtype: None
") UnSetAxis2;
		void UnSetAxis2 ();
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Axis2;
		Handle_StepGeom_Direction Axis2 ();
		%feature("compactdefaultargs") HasAxis2;
		%feature("autodoc", "	:rtype: bool
") HasAxis2;
		Standard_Boolean HasAxis2 ();
		%feature("compactdefaultargs") SetLocalOrigin;
		%feature("autodoc", "	:param aLocalOrigin:
	:type aLocalOrigin: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetLocalOrigin;
		void SetLocalOrigin (const Handle_StepGeom_CartesianPoint & aLocalOrigin);
		%feature("compactdefaultargs") LocalOrigin;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") LocalOrigin;
		Handle_StepGeom_CartesianPoint LocalOrigin ();
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	:param aScale:
	:type aScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real aScale);
		%feature("compactdefaultargs") UnSetScale;
		%feature("autodoc", "	:rtype: None
") UnSetScale;
		void UnSetScale ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:rtype: float
") Scale;
		Standard_Real Scale ();
		%feature("compactdefaultargs") HasScale;
		%feature("autodoc", "	:rtype: bool
") HasScale;
		Standard_Boolean HasScale ();
};


%extend StepGeom_CartesianTransformationOperator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CartesianTransformationOperator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CartesianTransformationOperator::Handle_StepGeom_CartesianTransformationOperator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CartesianTransformationOperator;
class Handle_StepGeom_CartesianTransformationOperator : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_CartesianTransformationOperator();
        Handle_StepGeom_CartesianTransformationOperator(const Handle_StepGeom_CartesianTransformationOperator &aHandle);
        Handle_StepGeom_CartesianTransformationOperator(const StepGeom_CartesianTransformationOperator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CartesianTransformationOperator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CartesianTransformationOperator {
    StepGeom_CartesianTransformationOperator* _get_reference() {
    return (StepGeom_CartesianTransformationOperator*)$self->Access();
    }
};

%extend Handle_StepGeom_CartesianTransformationOperator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CartesianTransformationOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Curve;
class StepGeom_Curve : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_Curve;
		%feature("autodoc", "	* Returns a Curve

	:rtype: None
") StepGeom_Curve;
		 StepGeom_Curve ();
};


%extend StepGeom_Curve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Curve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Curve::Handle_StepGeom_Curve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Curve;
class Handle_StepGeom_Curve : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_Curve();
        Handle_StepGeom_Curve(const Handle_StepGeom_Curve &aHandle);
        Handle_StepGeom_Curve(const StepGeom_Curve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Curve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Curve {
    StepGeom_Curve* _get_reference() {
    return (StepGeom_Curve*)$self->Access();
    }
};

%extend Handle_StepGeom_Curve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Direction;
class StepGeom_Direction : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_Direction;
		%feature("autodoc", "	* Returns a Direction

	:rtype: None
") StepGeom_Direction;
		 StepGeom_Direction ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDirectionRatios:
	:type aDirectionRatios: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TColStd_HArray1OfReal & aDirectionRatios);
		%feature("compactdefaultargs") SetDirectionRatios;
		%feature("autodoc", "	:param aDirectionRatios:
	:type aDirectionRatios: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetDirectionRatios;
		void SetDirectionRatios (const Handle_TColStd_HArray1OfReal & aDirectionRatios);
		%feature("compactdefaultargs") DirectionRatios;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") DirectionRatios;
		Handle_TColStd_HArray1OfReal DirectionRatios ();
		%feature("compactdefaultargs") DirectionRatiosValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") DirectionRatiosValue;
		Standard_Real DirectionRatiosValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbDirectionRatios;
		%feature("autodoc", "	:rtype: int
") NbDirectionRatios;
		Standard_Integer NbDirectionRatios ();
};


%extend StepGeom_Direction {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Direction(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Direction::Handle_StepGeom_Direction %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Direction;
class Handle_StepGeom_Direction : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_Direction();
        Handle_StepGeom_Direction(const Handle_StepGeom_Direction &aHandle);
        Handle_StepGeom_Direction(const StepGeom_Direction *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Direction DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Direction {
    StepGeom_Direction* _get_reference() {
    return (StepGeom_Direction*)$self->Access();
    }
};

%extend Handle_StepGeom_Direction {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Direction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Placement;
class StepGeom_Placement : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_Placement;
		%feature("autodoc", "	* Returns a Placement

	:rtype: None
") StepGeom_Placement;
		 StepGeom_Placement ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetLocation;
		void SetLocation (const Handle_StepGeom_CartesianPoint & aLocation);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") Location;
		Handle_StepGeom_CartesianPoint Location ();
};


%extend StepGeom_Placement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Placement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Placement::Handle_StepGeom_Placement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Placement;
class Handle_StepGeom_Placement : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_Placement();
        Handle_StepGeom_Placement(const Handle_StepGeom_Placement &aHandle);
        Handle_StepGeom_Placement(const StepGeom_Placement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Placement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Placement {
    StepGeom_Placement* _get_reference() {
    return (StepGeom_Placement*)$self->Access();
    }
};

%extend Handle_StepGeom_Placement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Point;
class StepGeom_Point : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_Point;
		%feature("autodoc", "	* Returns a Point

	:rtype: None
") StepGeom_Point;
		 StepGeom_Point ();
};


%extend StepGeom_Point {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Point(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Point::Handle_StepGeom_Point %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Point;
class Handle_StepGeom_Point : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_Point();
        Handle_StepGeom_Point(const Handle_StepGeom_Point &aHandle);
        Handle_StepGeom_Point(const StepGeom_Point *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Point DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Point {
    StepGeom_Point* _get_reference() {
    return (StepGeom_Point*)$self->Access();
    }
};

%extend Handle_StepGeom_Point {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_ReparametrisedCompositeCurveSegment;
class StepGeom_ReparametrisedCompositeCurveSegment : public StepGeom_CompositeCurveSegment {
	public:
		%feature("compactdefaultargs") StepGeom_ReparametrisedCompositeCurveSegment;
		%feature("autodoc", "	* Returns a ReparametrisedCompositeCurveSegment

	:rtype: None
") StepGeom_ReparametrisedCompositeCurveSegment;
		 StepGeom_ReparametrisedCompositeCurveSegment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aTransition:
	:type aTransition: StepGeom_TransitionCode
	:param aSameSense:
	:type aSameSense: bool
	:param aParentCurve:
	:type aParentCurve: Handle_StepGeom_Curve &
	:rtype: void
") Init;
		virtual void Init (const StepGeom_TransitionCode aTransition,const Standard_Boolean aSameSense,const Handle_StepGeom_Curve & aParentCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aTransition:
	:type aTransition: StepGeom_TransitionCode
	:param aSameSense:
	:type aSameSense: bool
	:param aParentCurve:
	:type aParentCurve: Handle_StepGeom_Curve &
	:param aParamLength:
	:type aParamLength: float
	:rtype: void
") Init;
		virtual void Init (const StepGeom_TransitionCode aTransition,const Standard_Boolean aSameSense,const Handle_StepGeom_Curve & aParentCurve,const Standard_Real aParamLength);
		%feature("compactdefaultargs") SetParamLength;
		%feature("autodoc", "	:param aParamLength:
	:type aParamLength: float
	:rtype: None
") SetParamLength;
		void SetParamLength (const Standard_Real aParamLength);
		%feature("compactdefaultargs") ParamLength;
		%feature("autodoc", "	:rtype: float
") ParamLength;
		Standard_Real ParamLength ();
};


%extend StepGeom_ReparametrisedCompositeCurveSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_ReparametrisedCompositeCurveSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_ReparametrisedCompositeCurveSegment::Handle_StepGeom_ReparametrisedCompositeCurveSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_ReparametrisedCompositeCurveSegment;
class Handle_StepGeom_ReparametrisedCompositeCurveSegment : public Handle_StepGeom_CompositeCurveSegment {

    public:
        // constructors
        Handle_StepGeom_ReparametrisedCompositeCurveSegment();
        Handle_StepGeom_ReparametrisedCompositeCurveSegment(const Handle_StepGeom_ReparametrisedCompositeCurveSegment &aHandle);
        Handle_StepGeom_ReparametrisedCompositeCurveSegment(const StepGeom_ReparametrisedCompositeCurveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_ReparametrisedCompositeCurveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_ReparametrisedCompositeCurveSegment {
    StepGeom_ReparametrisedCompositeCurveSegment* _get_reference() {
    return (StepGeom_ReparametrisedCompositeCurveSegment*)$self->Access();
    }
};

%extend Handle_StepGeom_ReparametrisedCompositeCurveSegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_ReparametrisedCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Surface;
class StepGeom_Surface : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_Surface;
		%feature("autodoc", "	* Returns a Surface

	:rtype: None
") StepGeom_Surface;
		 StepGeom_Surface ();
};


%extend StepGeom_Surface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Surface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Surface::Handle_StepGeom_Surface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Surface;
class Handle_StepGeom_Surface : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_Surface();
        Handle_StepGeom_Surface(const Handle_StepGeom_Surface &aHandle);
        Handle_StepGeom_Surface(const StepGeom_Surface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Surface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Surface {
    StepGeom_Surface* _get_reference() {
    return (StepGeom_Surface*)$self->Access();
    }
};

%extend Handle_StepGeom_Surface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Vector;
class StepGeom_Vector : public StepGeom_GeometricRepresentationItem {
	public:
		%feature("compactdefaultargs") StepGeom_Vector;
		%feature("autodoc", "	* Returns a Vector

	:rtype: None
") StepGeom_Vector;
		 StepGeom_Vector ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOrientation:
	:type aOrientation: Handle_StepGeom_Direction &
	:param aMagnitude:
	:type aMagnitude: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Direction & aOrientation,const Standard_Real aMagnitude);
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	:param aOrientation:
	:type aOrientation: Handle_StepGeom_Direction &
	:rtype: None
") SetOrientation;
		void SetOrientation (const Handle_StepGeom_Direction & aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Orientation;
		Handle_StepGeom_Direction Orientation ();
		%feature("compactdefaultargs") SetMagnitude;
		%feature("autodoc", "	:param aMagnitude:
	:type aMagnitude: float
	:rtype: None
") SetMagnitude;
		void SetMagnitude (const Standard_Real aMagnitude);
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "	:rtype: float
") Magnitude;
		Standard_Real Magnitude ();
};


%extend StepGeom_Vector {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Vector(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Vector::Handle_StepGeom_Vector %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Vector;
class Handle_StepGeom_Vector : public Handle_StepGeom_GeometricRepresentationItem {

    public:
        // constructors
        Handle_StepGeom_Vector();
        Handle_StepGeom_Vector(const Handle_StepGeom_Vector &aHandle);
        Handle_StepGeom_Vector(const StepGeom_Vector *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Vector DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Vector {
    StepGeom_Vector* _get_reference() {
    return (StepGeom_Vector*)$self->Access();
    }
};

%extend Handle_StepGeom_Vector {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Axis1Placement;
class StepGeom_Axis1Placement : public StepGeom_Placement {
	public:
		%feature("compactdefaultargs") StepGeom_Axis1Placement;
		%feature("autodoc", "	* Returns a Axis1Placement

	:rtype: None
") StepGeom_Axis1Placement;
		 StepGeom_Axis1Placement ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:param hasAaxis:
	:type hasAaxis: bool
	:param aAxis:
	:type aAxis: Handle_StepGeom_Direction &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation,const Standard_Boolean hasAaxis,const Handle_StepGeom_Direction & aAxis);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	:param aAxis:
	:type aAxis: Handle_StepGeom_Direction &
	:rtype: None
") SetAxis;
		void SetAxis (const Handle_StepGeom_Direction & aAxis);
		%feature("compactdefaultargs") UnSetAxis;
		%feature("autodoc", "	:rtype: None
") UnSetAxis;
		void UnSetAxis ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Axis;
		Handle_StepGeom_Direction Axis ();
		%feature("compactdefaultargs") HasAxis;
		%feature("autodoc", "	:rtype: bool
") HasAxis;
		Standard_Boolean HasAxis ();
};


%extend StepGeom_Axis1Placement {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Axis1Placement(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Axis1Placement::Handle_StepGeom_Axis1Placement %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Axis1Placement;
class Handle_StepGeom_Axis1Placement : public Handle_StepGeom_Placement {

    public:
        // constructors
        Handle_StepGeom_Axis1Placement();
        Handle_StepGeom_Axis1Placement(const Handle_StepGeom_Axis1Placement &aHandle);
        Handle_StepGeom_Axis1Placement(const StepGeom_Axis1Placement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Axis1Placement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Axis1Placement {
    StepGeom_Axis1Placement* _get_reference() {
    return (StepGeom_Axis1Placement*)$self->Access();
    }
};

%extend Handle_StepGeom_Axis1Placement {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Axis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Axis2Placement2d;
class StepGeom_Axis2Placement2d : public StepGeom_Placement {
	public:
		%feature("compactdefaultargs") StepGeom_Axis2Placement2d;
		%feature("autodoc", "	* Returns a Axis2Placement2d

	:rtype: None
") StepGeom_Axis2Placement2d;
		 StepGeom_Axis2Placement2d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:param hasArefDirection:
	:type hasArefDirection: bool
	:param aRefDirection:
	:type aRefDirection: Handle_StepGeom_Direction &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation,const Standard_Boolean hasArefDirection,const Handle_StepGeom_Direction & aRefDirection);
		%feature("compactdefaultargs") SetRefDirection;
		%feature("autodoc", "	:param aRefDirection:
	:type aRefDirection: Handle_StepGeom_Direction &
	:rtype: None
") SetRefDirection;
		void SetRefDirection (const Handle_StepGeom_Direction & aRefDirection);
		%feature("compactdefaultargs") UnSetRefDirection;
		%feature("autodoc", "	:rtype: None
") UnSetRefDirection;
		void UnSetRefDirection ();
		%feature("compactdefaultargs") RefDirection;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") RefDirection;
		Handle_StepGeom_Direction RefDirection ();
		%feature("compactdefaultargs") HasRefDirection;
		%feature("autodoc", "	:rtype: bool
") HasRefDirection;
		Standard_Boolean HasRefDirection ();
};


%extend StepGeom_Axis2Placement2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Axis2Placement2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Axis2Placement2d::Handle_StepGeom_Axis2Placement2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Axis2Placement2d;
class Handle_StepGeom_Axis2Placement2d : public Handle_StepGeom_Placement {

    public:
        // constructors
        Handle_StepGeom_Axis2Placement2d();
        Handle_StepGeom_Axis2Placement2d(const Handle_StepGeom_Axis2Placement2d &aHandle);
        Handle_StepGeom_Axis2Placement2d(const StepGeom_Axis2Placement2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Axis2Placement2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Axis2Placement2d {
    StepGeom_Axis2Placement2d* _get_reference() {
    return (StepGeom_Axis2Placement2d*)$self->Access();
    }
};

%extend Handle_StepGeom_Axis2Placement2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Axis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Axis2Placement3d;
class StepGeom_Axis2Placement3d : public StepGeom_Placement {
	public:
		%feature("compactdefaultargs") StepGeom_Axis2Placement3d;
		%feature("autodoc", "	* Returns a Axis2Placement3d

	:rtype: None
") StepGeom_Axis2Placement3d;
		 StepGeom_Axis2Placement3d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aLocation:
	:type aLocation: Handle_StepGeom_CartesianPoint &
	:param hasAaxis:
	:type hasAaxis: bool
	:param aAxis:
	:type aAxis: Handle_StepGeom_Direction &
	:param hasArefDirection:
	:type hasArefDirection: bool
	:param aRefDirection:
	:type aRefDirection: Handle_StepGeom_Direction &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aLocation,const Standard_Boolean hasAaxis,const Handle_StepGeom_Direction & aAxis,const Standard_Boolean hasArefDirection,const Handle_StepGeom_Direction & aRefDirection);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	:param aAxis:
	:type aAxis: Handle_StepGeom_Direction &
	:rtype: None
") SetAxis;
		void SetAxis (const Handle_StepGeom_Direction & aAxis);
		%feature("compactdefaultargs") UnSetAxis;
		%feature("autodoc", "	:rtype: None
") UnSetAxis;
		void UnSetAxis ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Axis;
		Handle_StepGeom_Direction Axis ();
		%feature("compactdefaultargs") HasAxis;
		%feature("autodoc", "	:rtype: bool
") HasAxis;
		Standard_Boolean HasAxis ();
		%feature("compactdefaultargs") SetRefDirection;
		%feature("autodoc", "	:param aRefDirection:
	:type aRefDirection: Handle_StepGeom_Direction &
	:rtype: None
") SetRefDirection;
		void SetRefDirection (const Handle_StepGeom_Direction & aRefDirection);
		%feature("compactdefaultargs") UnSetRefDirection;
		%feature("autodoc", "	:rtype: None
") UnSetRefDirection;
		void UnSetRefDirection ();
		%feature("compactdefaultargs") RefDirection;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") RefDirection;
		Handle_StepGeom_Direction RefDirection ();
		%feature("compactdefaultargs") HasRefDirection;
		%feature("autodoc", "	:rtype: bool
") HasRefDirection;
		Standard_Boolean HasRefDirection ();
};


%extend StepGeom_Axis2Placement3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Axis2Placement3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Axis2Placement3d::Handle_StepGeom_Axis2Placement3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Axis2Placement3d;
class Handle_StepGeom_Axis2Placement3d : public Handle_StepGeom_Placement {

    public:
        // constructors
        Handle_StepGeom_Axis2Placement3d();
        Handle_StepGeom_Axis2Placement3d(const Handle_StepGeom_Axis2Placement3d &aHandle);
        Handle_StepGeom_Axis2Placement3d(const StepGeom_Axis2Placement3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Axis2Placement3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Axis2Placement3d {
    StepGeom_Axis2Placement3d* _get_reference() {
    return (StepGeom_Axis2Placement3d*)$self->Access();
    }
};

%extend Handle_StepGeom_Axis2Placement3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Axis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BoundedCurve;
class StepGeom_BoundedCurve : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_BoundedCurve;
		%feature("autodoc", "	* Returns a BoundedCurve

	:rtype: None
") StepGeom_BoundedCurve;
		 StepGeom_BoundedCurve ();
};


%extend StepGeom_BoundedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BoundedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BoundedCurve::Handle_StepGeom_BoundedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BoundedCurve;
class Handle_StepGeom_BoundedCurve : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_BoundedCurve();
        Handle_StepGeom_BoundedCurve(const Handle_StepGeom_BoundedCurve &aHandle);
        Handle_StepGeom_BoundedCurve(const StepGeom_BoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BoundedCurve {
    StepGeom_BoundedCurve* _get_reference() {
    return (StepGeom_BoundedCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_BoundedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BoundedSurface;
class StepGeom_BoundedSurface : public StepGeom_Surface {
	public:
		%feature("compactdefaultargs") StepGeom_BoundedSurface;
		%feature("autodoc", "	* Returns a BoundedSurface

	:rtype: None
") StepGeom_BoundedSurface;
		 StepGeom_BoundedSurface ();
};


%extend StepGeom_BoundedSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BoundedSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BoundedSurface::Handle_StepGeom_BoundedSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BoundedSurface;
class Handle_StepGeom_BoundedSurface : public Handle_StepGeom_Surface {

    public:
        // constructors
        Handle_StepGeom_BoundedSurface();
        Handle_StepGeom_BoundedSurface(const Handle_StepGeom_BoundedSurface &aHandle);
        Handle_StepGeom_BoundedSurface(const StepGeom_BoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BoundedSurface {
    StepGeom_BoundedSurface* _get_reference() {
    return (StepGeom_BoundedSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_BoundedSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CartesianPoint;
class StepGeom_CartesianPoint : public StepGeom_Point {
	public:
		%feature("compactdefaultargs") StepGeom_CartesianPoint;
		%feature("autodoc", "	* Returns a CartesianPoint

	:rtype: None
") StepGeom_CartesianPoint;
		 StepGeom_CartesianPoint ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCoordinates:
	:type aCoordinates: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TColStd_HArray1OfReal & aCoordinates);
		%feature("compactdefaultargs") Init2D;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Init2D;
		void Init2D (const Handle_TCollection_HAsciiString & aName,const Standard_Real X,const Standard_Real Y);
		%feature("compactdefaultargs") Init3D;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") Init3D;
		void Init3D (const Handle_TCollection_HAsciiString & aName,const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "	:param aCoordinates:
	:type aCoordinates: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetCoordinates;
		void SetCoordinates (const Handle_TColStd_HArray1OfReal & aCoordinates);
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Coordinates;
		Handle_TColStd_HArray1OfReal Coordinates ();
		%feature("compactdefaultargs") CoordinatesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") CoordinatesValue;
		Standard_Real CoordinatesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbCoordinates;
		%feature("autodoc", "	:rtype: int
") NbCoordinates;
		Standard_Integer NbCoordinates ();
};


%extend StepGeom_CartesianPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CartesianPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CartesianPoint::Handle_StepGeom_CartesianPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CartesianPoint;
class Handle_StepGeom_CartesianPoint : public Handle_StepGeom_Point {

    public:
        // constructors
        Handle_StepGeom_CartesianPoint();
        Handle_StepGeom_CartesianPoint(const Handle_StepGeom_CartesianPoint &aHandle);
        Handle_StepGeom_CartesianPoint(const StepGeom_CartesianPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CartesianPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CartesianPoint {
    StepGeom_CartesianPoint* _get_reference() {
    return (StepGeom_CartesianPoint*)$self->Access();
    }
};

%extend Handle_StepGeom_CartesianPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CartesianTransformationOperator2d;
class StepGeom_CartesianTransformationOperator2d : public StepGeom_CartesianTransformationOperator {
	public:
		%feature("compactdefaultargs") StepGeom_CartesianTransformationOperator2d;
		%feature("autodoc", "	:rtype: None
") StepGeom_CartesianTransformationOperator2d;
		 StepGeom_CartesianTransformationOperator2d ();
};


%extend StepGeom_CartesianTransformationOperator2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CartesianTransformationOperator2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CartesianTransformationOperator2d::Handle_StepGeom_CartesianTransformationOperator2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CartesianTransformationOperator2d;
class Handle_StepGeom_CartesianTransformationOperator2d : public Handle_StepGeom_CartesianTransformationOperator {

    public:
        // constructors
        Handle_StepGeom_CartesianTransformationOperator2d();
        Handle_StepGeom_CartesianTransformationOperator2d(const Handle_StepGeom_CartesianTransformationOperator2d &aHandle);
        Handle_StepGeom_CartesianTransformationOperator2d(const StepGeom_CartesianTransformationOperator2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CartesianTransformationOperator2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CartesianTransformationOperator2d {
    StepGeom_CartesianTransformationOperator2d* _get_reference() {
    return (StepGeom_CartesianTransformationOperator2d*)$self->Access();
    }
};

%extend Handle_StepGeom_CartesianTransformationOperator2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CartesianTransformationOperator2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CartesianTransformationOperator3d;
class StepGeom_CartesianTransformationOperator3d : public StepGeom_CartesianTransformationOperator {
	public:
		%feature("compactdefaultargs") StepGeom_CartesianTransformationOperator3d;
		%feature("autodoc", "	* Returns a CartesianTransformationOperator3d

	:rtype: None
") StepGeom_CartesianTransformationOperator3d;
		 StepGeom_CartesianTransformationOperator3d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasAaxis1:
	:type hasAaxis1: bool
	:param aAxis1:
	:type aAxis1: Handle_StepGeom_Direction &
	:param hasAaxis2:
	:type hasAaxis2: bool
	:param aAxis2:
	:type aAxis2: Handle_StepGeom_Direction &
	:param aLocalOrigin:
	:type aLocalOrigin: Handle_StepGeom_CartesianPoint &
	:param hasAscale:
	:type hasAscale: bool
	:param aScale:
	:type aScale: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasAaxis1,const Handle_StepGeom_Direction & aAxis1,const Standard_Boolean hasAaxis2,const Handle_StepGeom_Direction & aAxis2,const Handle_StepGeom_CartesianPoint & aLocalOrigin,const Standard_Boolean hasAscale,const Standard_Real aScale);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasAaxis1:
	:type hasAaxis1: bool
	:param aAxis1:
	:type aAxis1: Handle_StepGeom_Direction &
	:param hasAaxis2:
	:type hasAaxis2: bool
	:param aAxis2:
	:type aAxis2: Handle_StepGeom_Direction &
	:param aLocalOrigin:
	:type aLocalOrigin: Handle_StepGeom_CartesianPoint &
	:param hasAscale:
	:type hasAscale: bool
	:param aScale:
	:type aScale: float
	:param hasAaxis3:
	:type hasAaxis3: bool
	:param aAxis3:
	:type aAxis3: Handle_StepGeom_Direction &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasAaxis1,const Handle_StepGeom_Direction & aAxis1,const Standard_Boolean hasAaxis2,const Handle_StepGeom_Direction & aAxis2,const Handle_StepGeom_CartesianPoint & aLocalOrigin,const Standard_Boolean hasAscale,const Standard_Real aScale,const Standard_Boolean hasAaxis3,const Handle_StepGeom_Direction & aAxis3);
		%feature("compactdefaultargs") SetAxis3;
		%feature("autodoc", "	:param aAxis3:
	:type aAxis3: Handle_StepGeom_Direction &
	:rtype: None
") SetAxis3;
		void SetAxis3 (const Handle_StepGeom_Direction & aAxis3);
		%feature("compactdefaultargs") UnSetAxis3;
		%feature("autodoc", "	:rtype: None
") UnSetAxis3;
		void UnSetAxis3 ();
		%feature("compactdefaultargs") Axis3;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Axis3;
		Handle_StepGeom_Direction Axis3 ();
		%feature("compactdefaultargs") HasAxis3;
		%feature("autodoc", "	:rtype: bool
") HasAxis3;
		Standard_Boolean HasAxis3 ();
};


%extend StepGeom_CartesianTransformationOperator3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CartesianTransformationOperator3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CartesianTransformationOperator3d::Handle_StepGeom_CartesianTransformationOperator3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CartesianTransformationOperator3d;
class Handle_StepGeom_CartesianTransformationOperator3d : public Handle_StepGeom_CartesianTransformationOperator {

    public:
        // constructors
        Handle_StepGeom_CartesianTransformationOperator3d();
        Handle_StepGeom_CartesianTransformationOperator3d(const Handle_StepGeom_CartesianTransformationOperator3d &aHandle);
        Handle_StepGeom_CartesianTransformationOperator3d(const StepGeom_CartesianTransformationOperator3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CartesianTransformationOperator3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CartesianTransformationOperator3d {
    StepGeom_CartesianTransformationOperator3d* _get_reference() {
    return (StepGeom_CartesianTransformationOperator3d*)$self->Access();
    }
};

%extend Handle_StepGeom_CartesianTransformationOperator3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CartesianTransformationOperator3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Conic;
class StepGeom_Conic : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_Conic;
		%feature("autodoc", "	* Returns a Conic

	:rtype: None
") StepGeom_Conic;
		 StepGeom_Conic ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:rtype: None
") SetPosition;
		void SetPosition (const StepGeom_Axis2Placement & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: StepGeom_Axis2Placement
") Position;
		StepGeom_Axis2Placement Position ();
};


%extend StepGeom_Conic {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Conic(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Conic::Handle_StepGeom_Conic %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Conic;
class Handle_StepGeom_Conic : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_Conic();
        Handle_StepGeom_Conic(const Handle_StepGeom_Conic &aHandle);
        Handle_StepGeom_Conic(const StepGeom_Conic *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Conic DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Conic {
    StepGeom_Conic* _get_reference() {
    return (StepGeom_Conic*)$self->Access();
    }
};

%extend Handle_StepGeom_Conic {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CurveReplica;
class StepGeom_CurveReplica : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_CurveReplica;
		%feature("autodoc", "	* Returns a CurveReplica

	:rtype: None
") StepGeom_CurveReplica;
		 StepGeom_CurveReplica ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aParentCurve:
	:type aParentCurve: Handle_StepGeom_Curve &
	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aParentCurve,const Handle_StepGeom_CartesianTransformationOperator & aTransformation);
		%feature("compactdefaultargs") SetParentCurve;
		%feature("autodoc", "	:param aParentCurve:
	:type aParentCurve: Handle_StepGeom_Curve &
	:rtype: None
") SetParentCurve;
		void SetParentCurve (const Handle_StepGeom_Curve & aParentCurve);
		%feature("compactdefaultargs") ParentCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") ParentCurve;
		Handle_StepGeom_Curve ParentCurve ();
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator &
	:rtype: None
") SetTransformation;
		void SetTransformation (const Handle_StepGeom_CartesianTransformationOperator & aTransformation);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianTransformationOperator
") Transformation;
		Handle_StepGeom_CartesianTransformationOperator Transformation ();
};


%extend StepGeom_CurveReplica {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CurveReplica(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CurveReplica::Handle_StepGeom_CurveReplica %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CurveReplica;
class Handle_StepGeom_CurveReplica : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_CurveReplica();
        Handle_StepGeom_CurveReplica(const Handle_StepGeom_CurveReplica &aHandle);
        Handle_StepGeom_CurveReplica(const StepGeom_CurveReplica *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CurveReplica DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CurveReplica {
    StepGeom_CurveReplica* _get_reference() {
    return (StepGeom_CurveReplica*)$self->Access();
    }
};

%extend Handle_StepGeom_CurveReplica {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CurveReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_DegeneratePcurve;
class StepGeom_DegeneratePcurve : public StepGeom_Point {
	public:
		%feature("compactdefaultargs") StepGeom_DegeneratePcurve;
		%feature("autodoc", "	* Returns a DegeneratePcurve

	:rtype: None
") StepGeom_DegeneratePcurve;
		 StepGeom_DegeneratePcurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aReferenceToCurve:
	:type aReferenceToCurve: Handle_StepRepr_DefinitionalRepresentation &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Handle_StepRepr_DefinitionalRepresentation & aReferenceToCurve);
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBasisSurface;
		void SetBasisSurface (const Handle_StepGeom_Surface & aBasisSurface);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") BasisSurface;
		Handle_StepGeom_Surface BasisSurface ();
		%feature("compactdefaultargs") SetReferenceToCurve;
		%feature("autodoc", "	:param aReferenceToCurve:
	:type aReferenceToCurve: Handle_StepRepr_DefinitionalRepresentation &
	:rtype: None
") SetReferenceToCurve;
		void SetReferenceToCurve (const Handle_StepRepr_DefinitionalRepresentation & aReferenceToCurve);
		%feature("compactdefaultargs") ReferenceToCurve;
		%feature("autodoc", "	:rtype: Handle_StepRepr_DefinitionalRepresentation
") ReferenceToCurve;
		Handle_StepRepr_DefinitionalRepresentation ReferenceToCurve ();
};


%extend StepGeom_DegeneratePcurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_DegeneratePcurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_DegeneratePcurve::Handle_StepGeom_DegeneratePcurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_DegeneratePcurve;
class Handle_StepGeom_DegeneratePcurve : public Handle_StepGeom_Point {

    public:
        // constructors
        Handle_StepGeom_DegeneratePcurve();
        Handle_StepGeom_DegeneratePcurve(const Handle_StepGeom_DegeneratePcurve &aHandle);
        Handle_StepGeom_DegeneratePcurve(const StepGeom_DegeneratePcurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_DegeneratePcurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_DegeneratePcurve {
    StepGeom_DegeneratePcurve* _get_reference() {
    return (StepGeom_DegeneratePcurve*)$self->Access();
    }
};

%extend Handle_StepGeom_DegeneratePcurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_DegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_ElementarySurface;
class StepGeom_ElementarySurface : public StepGeom_Surface {
	public:
		%feature("compactdefaultargs") StepGeom_ElementarySurface;
		%feature("autodoc", "	* Returns a ElementarySurface

	:rtype: None
") StepGeom_ElementarySurface;
		 StepGeom_ElementarySurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: None
") SetPosition;
		void SetPosition (const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis2Placement3d
") Position;
		Handle_StepGeom_Axis2Placement3d Position ();
};


%extend StepGeom_ElementarySurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_ElementarySurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_ElementarySurface::Handle_StepGeom_ElementarySurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_ElementarySurface;
class Handle_StepGeom_ElementarySurface : public Handle_StepGeom_Surface {

    public:
        // constructors
        Handle_StepGeom_ElementarySurface();
        Handle_StepGeom_ElementarySurface(const Handle_StepGeom_ElementarySurface &aHandle);
        Handle_StepGeom_ElementarySurface(const StepGeom_ElementarySurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_ElementarySurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_ElementarySurface {
    StepGeom_ElementarySurface* _get_reference() {
    return (StepGeom_ElementarySurface*)$self->Access();
    }
};

%extend Handle_StepGeom_ElementarySurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_ElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Line;
class StepGeom_Line : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_Line;
		%feature("autodoc", "	* Returns a Line

	:rtype: None
") StepGeom_Line;
		 StepGeom_Line ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPnt:
	:type aPnt: Handle_StepGeom_CartesianPoint &
	:param aDir:
	:type aDir: Handle_StepGeom_Vector &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_CartesianPoint & aPnt,const Handle_StepGeom_Vector & aDir);
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	:param aPnt:
	:type aPnt: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetPnt;
		void SetPnt (const Handle_StepGeom_CartesianPoint & aPnt);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") Pnt;
		Handle_StepGeom_CartesianPoint Pnt ();
		%feature("compactdefaultargs") SetDir;
		%feature("autodoc", "	:param aDir:
	:type aDir: Handle_StepGeom_Vector &
	:rtype: None
") SetDir;
		void SetDir (const Handle_StepGeom_Vector & aDir);
		%feature("compactdefaultargs") Dir;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Vector
") Dir;
		Handle_StepGeom_Vector Dir ();
};


%extend StepGeom_Line {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Line(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Line::Handle_StepGeom_Line %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Line;
class Handle_StepGeom_Line : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_Line();
        Handle_StepGeom_Line(const Handle_StepGeom_Line &aHandle);
        Handle_StepGeom_Line(const StepGeom_Line *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Line DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Line {
    StepGeom_Line* _get_reference() {
    return (StepGeom_Line*)$self->Access();
    }
};

%extend Handle_StepGeom_Line {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_OffsetCurve3d;
class StepGeom_OffsetCurve3d : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_OffsetCurve3d;
		%feature("autodoc", "	* Returns a OffsetCurve3d

	:rtype: None
") StepGeom_OffsetCurve3d;
		 StepGeom_OffsetCurve3d ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisCurve:
	:type aBasisCurve: Handle_StepGeom_Curve &
	:param aDistance:
	:type aDistance: float
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aRefDirection:
	:type aRefDirection: Handle_StepGeom_Direction &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aBasisCurve,const Standard_Real aDistance,const StepData_Logical aSelfIntersect,const Handle_StepGeom_Direction & aRefDirection);
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "	:param aBasisCurve:
	:type aBasisCurve: Handle_StepGeom_Curve &
	:rtype: None
") SetBasisCurve;
		void SetBasisCurve (const Handle_StepGeom_Curve & aBasisCurve);
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") BasisCurve;
		Handle_StepGeom_Curve BasisCurve ();
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "	:param aDistance:
	:type aDistance: float
	:rtype: None
") SetDistance;
		void SetDistance (const Standard_Real aDistance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: None
") SetSelfIntersect;
		void SetSelfIntersect (const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "	:rtype: StepData_Logical
") SelfIntersect;
		StepData_Logical SelfIntersect ();
		%feature("compactdefaultargs") SetRefDirection;
		%feature("autodoc", "	:param aRefDirection:
	:type aRefDirection: Handle_StepGeom_Direction &
	:rtype: None
") SetRefDirection;
		void SetRefDirection (const Handle_StepGeom_Direction & aRefDirection);
		%feature("compactdefaultargs") RefDirection;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") RefDirection;
		Handle_StepGeom_Direction RefDirection ();
};


%extend StepGeom_OffsetCurve3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_OffsetCurve3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_OffsetCurve3d::Handle_StepGeom_OffsetCurve3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_OffsetCurve3d;
class Handle_StepGeom_OffsetCurve3d : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_OffsetCurve3d();
        Handle_StepGeom_OffsetCurve3d(const Handle_StepGeom_OffsetCurve3d &aHandle);
        Handle_StepGeom_OffsetCurve3d(const StepGeom_OffsetCurve3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_OffsetCurve3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_OffsetCurve3d {
    StepGeom_OffsetCurve3d* _get_reference() {
    return (StepGeom_OffsetCurve3d*)$self->Access();
    }
};

%extend Handle_StepGeom_OffsetCurve3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_OffsetCurve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_OffsetSurface;
class StepGeom_OffsetSurface : public StepGeom_Surface {
	public:
		%feature("compactdefaultargs") StepGeom_OffsetSurface;
		%feature("autodoc", "	* Returns a OffsetSurface

	:rtype: None
") StepGeom_OffsetSurface;
		 StepGeom_OffsetSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aDistance:
	:type aDistance: float
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Standard_Real aDistance,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBasisSurface;
		void SetBasisSurface (const Handle_StepGeom_Surface & aBasisSurface);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") BasisSurface;
		Handle_StepGeom_Surface BasisSurface ();
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "	:param aDistance:
	:type aDistance: float
	:rtype: None
") SetDistance;
		void SetDistance (const Standard_Real aDistance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: None
") SetSelfIntersect;
		void SetSelfIntersect (const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "	:rtype: StepData_Logical
") SelfIntersect;
		StepData_Logical SelfIntersect ();
};


%extend StepGeom_OffsetSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_OffsetSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_OffsetSurface::Handle_StepGeom_OffsetSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_OffsetSurface;
class Handle_StepGeom_OffsetSurface : public Handle_StepGeom_Surface {

    public:
        // constructors
        Handle_StepGeom_OffsetSurface();
        Handle_StepGeom_OffsetSurface(const Handle_StepGeom_OffsetSurface &aHandle);
        Handle_StepGeom_OffsetSurface(const StepGeom_OffsetSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_OffsetSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_OffsetSurface {
    StepGeom_OffsetSurface* _get_reference() {
    return (StepGeom_OffsetSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_OffsetSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_OrientedSurface;
class StepGeom_OrientedSurface : public StepGeom_Surface {
	public:
		%feature("compactdefaultargs") StepGeom_OrientedSurface;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepGeom_OrientedSurface;
		 StepGeom_OrientedSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aOrientation:
	:type aOrientation: bool
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Standard_Boolean aOrientation);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns field Orientation

	:rtype: bool
") Orientation;
		Standard_Boolean Orientation ();
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "	* Set field Orientation

	:param Orientation:
	:type Orientation: bool
	:rtype: None
") SetOrientation;
		void SetOrientation (const Standard_Boolean Orientation);
};


%extend StepGeom_OrientedSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_OrientedSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_OrientedSurface::Handle_StepGeom_OrientedSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_OrientedSurface;
class Handle_StepGeom_OrientedSurface : public Handle_StepGeom_Surface {

    public:
        // constructors
        Handle_StepGeom_OrientedSurface();
        Handle_StepGeom_OrientedSurface(const Handle_StepGeom_OrientedSurface &aHandle);
        Handle_StepGeom_OrientedSurface(const StepGeom_OrientedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_OrientedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_OrientedSurface {
    StepGeom_OrientedSurface* _get_reference() {
    return (StepGeom_OrientedSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_OrientedSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_OrientedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Pcurve;
class StepGeom_Pcurve : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_Pcurve;
		%feature("autodoc", "	* Returns a Pcurve

	:rtype: None
") StepGeom_Pcurve;
		 StepGeom_Pcurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aReferenceToCurve:
	:type aReferenceToCurve: Handle_StepRepr_DefinitionalRepresentation &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Handle_StepRepr_DefinitionalRepresentation & aReferenceToCurve);
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBasisSurface;
		void SetBasisSurface (const Handle_StepGeom_Surface & aBasisSurface);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") BasisSurface;
		Handle_StepGeom_Surface BasisSurface ();
		%feature("compactdefaultargs") SetReferenceToCurve;
		%feature("autodoc", "	:param aReferenceToCurve:
	:type aReferenceToCurve: Handle_StepRepr_DefinitionalRepresentation &
	:rtype: None
") SetReferenceToCurve;
		void SetReferenceToCurve (const Handle_StepRepr_DefinitionalRepresentation & aReferenceToCurve);
		%feature("compactdefaultargs") ReferenceToCurve;
		%feature("autodoc", "	:rtype: Handle_StepRepr_DefinitionalRepresentation
") ReferenceToCurve;
		Handle_StepRepr_DefinitionalRepresentation ReferenceToCurve ();
};


%extend StepGeom_Pcurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Pcurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Pcurve::Handle_StepGeom_Pcurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Pcurve;
class Handle_StepGeom_Pcurve : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_Pcurve();
        Handle_StepGeom_Pcurve(const Handle_StepGeom_Pcurve &aHandle);
        Handle_StepGeom_Pcurve(const StepGeom_Pcurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Pcurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Pcurve {
    StepGeom_Pcurve* _get_reference() {
    return (StepGeom_Pcurve*)$self->Access();
    }
};

%extend Handle_StepGeom_Pcurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Pcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_PointOnCurve;
class StepGeom_PointOnCurve : public StepGeom_Point {
	public:
		%feature("compactdefaultargs") StepGeom_PointOnCurve;
		%feature("autodoc", "	* Returns a PointOnCurve

	:rtype: None
") StepGeom_PointOnCurve;
		 StepGeom_PointOnCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisCurve:
	:type aBasisCurve: Handle_StepGeom_Curve &
	:param aPointParameter:
	:type aPointParameter: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aBasisCurve,const Standard_Real aPointParameter);
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "	:param aBasisCurve:
	:type aBasisCurve: Handle_StepGeom_Curve &
	:rtype: None
") SetBasisCurve;
		void SetBasisCurve (const Handle_StepGeom_Curve & aBasisCurve);
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") BasisCurve;
		Handle_StepGeom_Curve BasisCurve ();
		%feature("compactdefaultargs") SetPointParameter;
		%feature("autodoc", "	:param aPointParameter:
	:type aPointParameter: float
	:rtype: None
") SetPointParameter;
		void SetPointParameter (const Standard_Real aPointParameter);
		%feature("compactdefaultargs") PointParameter;
		%feature("autodoc", "	:rtype: float
") PointParameter;
		Standard_Real PointParameter ();
};


%extend StepGeom_PointOnCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_PointOnCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_PointOnCurve::Handle_StepGeom_PointOnCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_PointOnCurve;
class Handle_StepGeom_PointOnCurve : public Handle_StepGeom_Point {

    public:
        // constructors
        Handle_StepGeom_PointOnCurve();
        Handle_StepGeom_PointOnCurve(const Handle_StepGeom_PointOnCurve &aHandle);
        Handle_StepGeom_PointOnCurve(const StepGeom_PointOnCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_PointOnCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_PointOnCurve {
    StepGeom_PointOnCurve* _get_reference() {
    return (StepGeom_PointOnCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_PointOnCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_PointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_PointOnSurface;
class StepGeom_PointOnSurface : public StepGeom_Point {
	public:
		%feature("compactdefaultargs") StepGeom_PointOnSurface;
		%feature("autodoc", "	* Returns a PointOnSurface

	:rtype: None
") StepGeom_PointOnSurface;
		 StepGeom_PointOnSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aPointParameterU:
	:type aPointParameterU: float
	:param aPointParameterV:
	:type aPointParameterV: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Standard_Real aPointParameterU,const Standard_Real aPointParameterV);
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBasisSurface;
		void SetBasisSurface (const Handle_StepGeom_Surface & aBasisSurface);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") BasisSurface;
		Handle_StepGeom_Surface BasisSurface ();
		%feature("compactdefaultargs") SetPointParameterU;
		%feature("autodoc", "	:param aPointParameterU:
	:type aPointParameterU: float
	:rtype: None
") SetPointParameterU;
		void SetPointParameterU (const Standard_Real aPointParameterU);
		%feature("compactdefaultargs") PointParameterU;
		%feature("autodoc", "	:rtype: float
") PointParameterU;
		Standard_Real PointParameterU ();
		%feature("compactdefaultargs") SetPointParameterV;
		%feature("autodoc", "	:param aPointParameterV:
	:type aPointParameterV: float
	:rtype: None
") SetPointParameterV;
		void SetPointParameterV (const Standard_Real aPointParameterV);
		%feature("compactdefaultargs") PointParameterV;
		%feature("autodoc", "	:rtype: float
") PointParameterV;
		Standard_Real PointParameterV ();
};


%extend StepGeom_PointOnSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_PointOnSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_PointOnSurface::Handle_StepGeom_PointOnSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_PointOnSurface;
class Handle_StepGeom_PointOnSurface : public Handle_StepGeom_Point {

    public:
        // constructors
        Handle_StepGeom_PointOnSurface();
        Handle_StepGeom_PointOnSurface(const Handle_StepGeom_PointOnSurface &aHandle);
        Handle_StepGeom_PointOnSurface(const StepGeom_PointOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_PointOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_PointOnSurface {
    StepGeom_PointOnSurface* _get_reference() {
    return (StepGeom_PointOnSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_PointOnSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_PointOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_PointReplica;
class StepGeom_PointReplica : public StepGeom_Point {
	public:
		%feature("compactdefaultargs") StepGeom_PointReplica;
		%feature("autodoc", "	* Returns a PointReplica

	:rtype: None
") StepGeom_PointReplica;
		 StepGeom_PointReplica ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aParentPt:
	:type aParentPt: Handle_StepGeom_Point &
	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Point & aParentPt,const Handle_StepGeom_CartesianTransformationOperator & aTransformation);
		%feature("compactdefaultargs") SetParentPt;
		%feature("autodoc", "	:param aParentPt:
	:type aParentPt: Handle_StepGeom_Point &
	:rtype: None
") SetParentPt;
		void SetParentPt (const Handle_StepGeom_Point & aParentPt);
		%feature("compactdefaultargs") ParentPt;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Point
") ParentPt;
		Handle_StepGeom_Point ParentPt ();
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator &
	:rtype: None
") SetTransformation;
		void SetTransformation (const Handle_StepGeom_CartesianTransformationOperator & aTransformation);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianTransformationOperator
") Transformation;
		Handle_StepGeom_CartesianTransformationOperator Transformation ();
};


%extend StepGeom_PointReplica {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_PointReplica(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_PointReplica::Handle_StepGeom_PointReplica %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_PointReplica;
class Handle_StepGeom_PointReplica : public Handle_StepGeom_Point {

    public:
        // constructors
        Handle_StepGeom_PointReplica();
        Handle_StepGeom_PointReplica(const Handle_StepGeom_PointReplica &aHandle);
        Handle_StepGeom_PointReplica(const StepGeom_PointReplica *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_PointReplica DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_PointReplica {
    StepGeom_PointReplica* _get_reference() {
    return (StepGeom_PointReplica*)$self->Access();
    }
};

%extend Handle_StepGeom_PointReplica {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_PointReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfaceCurve;
class StepGeom_SurfaceCurve : public StepGeom_Curve {
	public:
		%feature("compactdefaultargs") StepGeom_SurfaceCurve;
		%feature("autodoc", "	* Returns a SurfaceCurve

	:rtype: None
") StepGeom_SurfaceCurve;
		 StepGeom_SurfaceCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aCurve3d:
	:type aCurve3d: Handle_StepGeom_Curve &
	:param aAssociatedGeometry:
	:type aAssociatedGeometry: Handle_StepGeom_HArray1OfPcurveOrSurface &
	:param aMasterRepresentation:
	:type aMasterRepresentation: StepGeom_PreferredSurfaceCurveRepresentation
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aCurve3d,const Handle_StepGeom_HArray1OfPcurveOrSurface & aAssociatedGeometry,const StepGeom_PreferredSurfaceCurveRepresentation aMasterRepresentation);
		%feature("compactdefaultargs") SetCurve3d;
		%feature("autodoc", "	:param aCurve3d:
	:type aCurve3d: Handle_StepGeom_Curve &
	:rtype: None
") SetCurve3d;
		void SetCurve3d (const Handle_StepGeom_Curve & aCurve3d);
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") Curve3d;
		Handle_StepGeom_Curve Curve3d ();
		%feature("compactdefaultargs") SetAssociatedGeometry;
		%feature("autodoc", "	:param aAssociatedGeometry:
	:type aAssociatedGeometry: Handle_StepGeom_HArray1OfPcurveOrSurface &
	:rtype: None
") SetAssociatedGeometry;
		void SetAssociatedGeometry (const Handle_StepGeom_HArray1OfPcurveOrSurface & aAssociatedGeometry);
		%feature("compactdefaultargs") AssociatedGeometry;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfPcurveOrSurface
") AssociatedGeometry;
		Handle_StepGeom_HArray1OfPcurveOrSurface AssociatedGeometry ();
		%feature("compactdefaultargs") AssociatedGeometryValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepGeom_PcurveOrSurface
") AssociatedGeometryValue;
		StepGeom_PcurveOrSurface AssociatedGeometryValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbAssociatedGeometry;
		%feature("autodoc", "	:rtype: int
") NbAssociatedGeometry;
		Standard_Integer NbAssociatedGeometry ();
		%feature("compactdefaultargs") SetMasterRepresentation;
		%feature("autodoc", "	:param aMasterRepresentation:
	:type aMasterRepresentation: StepGeom_PreferredSurfaceCurveRepresentation
	:rtype: None
") SetMasterRepresentation;
		void SetMasterRepresentation (const StepGeom_PreferredSurfaceCurveRepresentation aMasterRepresentation);
		%feature("compactdefaultargs") MasterRepresentation;
		%feature("autodoc", "	:rtype: StepGeom_PreferredSurfaceCurveRepresentation
") MasterRepresentation;
		StepGeom_PreferredSurfaceCurveRepresentation MasterRepresentation ();
};


%extend StepGeom_SurfaceCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SurfaceCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SurfaceCurve::Handle_StepGeom_SurfaceCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SurfaceCurve;
class Handle_StepGeom_SurfaceCurve : public Handle_StepGeom_Curve {

    public:
        // constructors
        Handle_StepGeom_SurfaceCurve();
        Handle_StepGeom_SurfaceCurve(const Handle_StepGeom_SurfaceCurve &aHandle);
        Handle_StepGeom_SurfaceCurve(const StepGeom_SurfaceCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SurfaceCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SurfaceCurve {
    StepGeom_SurfaceCurve* _get_reference() {
    return (StepGeom_SurfaceCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_SurfaceCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SurfaceCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfaceReplica;
class StepGeom_SurfaceReplica : public StepGeom_Surface {
	public:
		%feature("compactdefaultargs") StepGeom_SurfaceReplica;
		%feature("autodoc", "	* Returns a SurfaceReplica

	:rtype: None
") StepGeom_SurfaceReplica;
		 StepGeom_SurfaceReplica ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aParentSurface:
	:type aParentSurface: Handle_StepGeom_Surface &
	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aParentSurface,const Handle_StepGeom_CartesianTransformationOperator3d & aTransformation);
		%feature("compactdefaultargs") SetParentSurface;
		%feature("autodoc", "	:param aParentSurface:
	:type aParentSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetParentSurface;
		void SetParentSurface (const Handle_StepGeom_Surface & aParentSurface);
		%feature("compactdefaultargs") ParentSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") ParentSurface;
		Handle_StepGeom_Surface ParentSurface ();
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	:param aTransformation:
	:type aTransformation: Handle_StepGeom_CartesianTransformationOperator3d &
	:rtype: None
") SetTransformation;
		void SetTransformation (const Handle_StepGeom_CartesianTransformationOperator3d & aTransformation);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianTransformationOperator3d
") Transformation;
		Handle_StepGeom_CartesianTransformationOperator3d Transformation ();
};


%extend StepGeom_SurfaceReplica {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SurfaceReplica(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SurfaceReplica::Handle_StepGeom_SurfaceReplica %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SurfaceReplica;
class Handle_StepGeom_SurfaceReplica : public Handle_StepGeom_Surface {

    public:
        // constructors
        Handle_StepGeom_SurfaceReplica();
        Handle_StepGeom_SurfaceReplica(const Handle_StepGeom_SurfaceReplica &aHandle);
        Handle_StepGeom_SurfaceReplica(const StepGeom_SurfaceReplica *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SurfaceReplica DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SurfaceReplica {
    StepGeom_SurfaceReplica* _get_reference() {
    return (StepGeom_SurfaceReplica*)$self->Access();
    }
};

%extend Handle_StepGeom_SurfaceReplica {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SurfaceReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SweptSurface;
class StepGeom_SweptSurface : public StepGeom_Surface {
	public:
		%feature("compactdefaultargs") StepGeom_SweptSurface;
		%feature("autodoc", "	* Returns a SweptSurface

	:rtype: None
") StepGeom_SweptSurface;
		 StepGeom_SweptSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptCurve:
	:type aSweptCurve: Handle_StepGeom_Curve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aSweptCurve);
		%feature("compactdefaultargs") SetSweptCurve;
		%feature("autodoc", "	:param aSweptCurve:
	:type aSweptCurve: Handle_StepGeom_Curve &
	:rtype: None
") SetSweptCurve;
		void SetSweptCurve (const Handle_StepGeom_Curve & aSweptCurve);
		%feature("compactdefaultargs") SweptCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") SweptCurve;
		Handle_StepGeom_Curve SweptCurve ();
};


%extend StepGeom_SweptSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SweptSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SweptSurface::Handle_StepGeom_SweptSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SweptSurface;
class Handle_StepGeom_SweptSurface : public Handle_StepGeom_Surface {

    public:
        // constructors
        Handle_StepGeom_SweptSurface();
        Handle_StepGeom_SweptSurface(const Handle_StepGeom_SweptSurface &aHandle);
        Handle_StepGeom_SweptSurface(const StepGeom_SweptSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SweptSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SweptSurface {
    StepGeom_SweptSurface* _get_reference() {
    return (StepGeom_SweptSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_SweptSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BSplineCurve;
class StepGeom_BSplineCurve : public StepGeom_BoundedCurve {
	public:
		%feature("compactdefaultargs") StepGeom_BSplineCurve;
		%feature("autodoc", "	* Returns a BSplineCurve

	:rtype: None
") StepGeom_BSplineCurve;
		 StepGeom_BSplineCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "	:param aDegree:
	:type aDegree: int
	:rtype: None
") SetDegree;
		void SetDegree (const Standard_Integer aDegree);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") SetControlPointsList;
		%feature("autodoc", "	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:rtype: None
") SetControlPointsList;
		void SetControlPointsList (const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList);
		%feature("compactdefaultargs") ControlPointsList;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfCartesianPoint
") ControlPointsList;
		Handle_StepGeom_HArray1OfCartesianPoint ControlPointsList ();
		%feature("compactdefaultargs") ControlPointsListValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepGeom_CartesianPoint
") ControlPointsListValue;
		Handle_StepGeom_CartesianPoint ControlPointsListValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbControlPointsList;
		%feature("autodoc", "	:rtype: int
") NbControlPointsList;
		Standard_Integer NbControlPointsList ();
		%feature("compactdefaultargs") SetCurveForm;
		%feature("autodoc", "	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:rtype: None
") SetCurveForm;
		void SetCurveForm (const StepGeom_BSplineCurveForm aCurveForm);
		%feature("compactdefaultargs") CurveForm;
		%feature("autodoc", "	:rtype: StepGeom_BSplineCurveForm
") CurveForm;
		StepGeom_BSplineCurveForm CurveForm ();
		%feature("compactdefaultargs") SetClosedCurve;
		%feature("autodoc", "	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:rtype: None
") SetClosedCurve;
		void SetClosedCurve (const StepData_Logical aClosedCurve);
		%feature("compactdefaultargs") ClosedCurve;
		%feature("autodoc", "	:rtype: StepData_Logical
") ClosedCurve;
		StepData_Logical ClosedCurve ();
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: None
") SetSelfIntersect;
		void SetSelfIntersect (const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "	:rtype: StepData_Logical
") SelfIntersect;
		StepData_Logical SelfIntersect ();
};


%extend StepGeom_BSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BSplineCurve::Handle_StepGeom_BSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BSplineCurve;
class Handle_StepGeom_BSplineCurve : public Handle_StepGeom_BoundedCurve {

    public:
        // constructors
        Handle_StepGeom_BSplineCurve();
        Handle_StepGeom_BSplineCurve(const Handle_StepGeom_BSplineCurve &aHandle);
        Handle_StepGeom_BSplineCurve(const StepGeom_BSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BSplineCurve {
    StepGeom_BSplineCurve* _get_reference() {
    return (StepGeom_BSplineCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_BSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BSplineSurface;
class StepGeom_BSplineSurface : public StepGeom_BoundedSurface {
	public:
		%feature("compactdefaultargs") StepGeom_BSplineSurface;
		%feature("autodoc", "	* Returns a BSplineSurface

	:rtype: None
") StepGeom_BSplineSurface;
		 StepGeom_BSplineSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SetUDegree;
		%feature("autodoc", "	:param aUDegree:
	:type aUDegree: int
	:rtype: None
") SetUDegree;
		void SetUDegree (const Standard_Integer aUDegree);
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") SetVDegree;
		%feature("autodoc", "	:param aVDegree:
	:type aVDegree: int
	:rtype: None
") SetVDegree;
		void SetVDegree (const Standard_Integer aVDegree);
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") SetControlPointsList;
		%feature("autodoc", "	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:rtype: None
") SetControlPointsList;
		void SetControlPointsList (const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList);
		%feature("compactdefaultargs") ControlPointsList;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray2OfCartesianPoint
") ControlPointsList;
		Handle_StepGeom_HArray2OfCartesianPoint ControlPointsList ();
		%feature("compactdefaultargs") ControlPointsListValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: Handle_StepGeom_CartesianPoint
") ControlPointsListValue;
		Handle_StepGeom_CartesianPoint ControlPointsListValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbControlPointsListI;
		%feature("autodoc", "	:rtype: int
") NbControlPointsListI;
		Standard_Integer NbControlPointsListI ();
		%feature("compactdefaultargs") NbControlPointsListJ;
		%feature("autodoc", "	:rtype: int
") NbControlPointsListJ;
		Standard_Integer NbControlPointsListJ ();
		%feature("compactdefaultargs") SetSurfaceForm;
		%feature("autodoc", "	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:rtype: None
") SetSurfaceForm;
		void SetSurfaceForm (const StepGeom_BSplineSurfaceForm aSurfaceForm);
		%feature("compactdefaultargs") SurfaceForm;
		%feature("autodoc", "	:rtype: StepGeom_BSplineSurfaceForm
") SurfaceForm;
		StepGeom_BSplineSurfaceForm SurfaceForm ();
		%feature("compactdefaultargs") SetUClosed;
		%feature("autodoc", "	:param aUClosed:
	:type aUClosed: StepData_Logical
	:rtype: None
") SetUClosed;
		void SetUClosed (const StepData_Logical aUClosed);
		%feature("compactdefaultargs") UClosed;
		%feature("autodoc", "	:rtype: StepData_Logical
") UClosed;
		StepData_Logical UClosed ();
		%feature("compactdefaultargs") SetVClosed;
		%feature("autodoc", "	:param aVClosed:
	:type aVClosed: StepData_Logical
	:rtype: None
") SetVClosed;
		void SetVClosed (const StepData_Logical aVClosed);
		%feature("compactdefaultargs") VClosed;
		%feature("autodoc", "	:rtype: StepData_Logical
") VClosed;
		StepData_Logical VClosed ();
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: None
") SetSelfIntersect;
		void SetSelfIntersect (const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "	:rtype: StepData_Logical
") SelfIntersect;
		StepData_Logical SelfIntersect ();
};


%extend StepGeom_BSplineSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BSplineSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BSplineSurface::Handle_StepGeom_BSplineSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BSplineSurface;
class Handle_StepGeom_BSplineSurface : public Handle_StepGeom_BoundedSurface {

    public:
        // constructors
        Handle_StepGeom_BSplineSurface();
        Handle_StepGeom_BSplineSurface(const Handle_StepGeom_BSplineSurface &aHandle);
        Handle_StepGeom_BSplineSurface(const StepGeom_BSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BSplineSurface {
    StepGeom_BSplineSurface* _get_reference() {
    return (StepGeom_BSplineSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_BSplineSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Circle;
class StepGeom_Circle : public StepGeom_Conic {
	public:
		%feature("compactdefaultargs") StepGeom_Circle;
		%feature("autodoc", "	* Returns a Circle

	:rtype: None
") StepGeom_Circle;
		 StepGeom_Circle ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:param aRadius:
	:type aRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition,const Standard_Real aRadius);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
};


%extend StepGeom_Circle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Circle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Circle::Handle_StepGeom_Circle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Circle;
class Handle_StepGeom_Circle : public Handle_StepGeom_Conic {

    public:
        // constructors
        Handle_StepGeom_Circle();
        Handle_StepGeom_Circle(const Handle_StepGeom_Circle &aHandle);
        Handle_StepGeom_Circle(const StepGeom_Circle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Circle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Circle {
    StepGeom_Circle* _get_reference() {
    return (StepGeom_Circle*)$self->Access();
    }
};

%extend Handle_StepGeom_Circle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CompositeCurve;
class StepGeom_CompositeCurve : public StepGeom_BoundedCurve {
	public:
		%feature("compactdefaultargs") StepGeom_CompositeCurve;
		%feature("autodoc", "	* Returns a CompositeCurve

	:rtype: None
") StepGeom_CompositeCurve;
		 StepGeom_CompositeCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSegments:
	:type aSegments: Handle_StepGeom_HArray1OfCompositeCurveSegment &
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_HArray1OfCompositeCurveSegment & aSegments,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SetSegments;
		%feature("autodoc", "	:param aSegments:
	:type aSegments: Handle_StepGeom_HArray1OfCompositeCurveSegment &
	:rtype: None
") SetSegments;
		void SetSegments (const Handle_StepGeom_HArray1OfCompositeCurveSegment & aSegments);
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfCompositeCurveSegment
") Segments;
		Handle_StepGeom_HArray1OfCompositeCurveSegment Segments ();
		%feature("compactdefaultargs") SegmentsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepGeom_CompositeCurveSegment
") SegmentsValue;
		Handle_StepGeom_CompositeCurveSegment SegmentsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: None
") SetSelfIntersect;
		void SetSelfIntersect (const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "	:rtype: StepData_Logical
") SelfIntersect;
		StepData_Logical SelfIntersect ();
};


%extend StepGeom_CompositeCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CompositeCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CompositeCurve::Handle_StepGeom_CompositeCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CompositeCurve;
class Handle_StepGeom_CompositeCurve : public Handle_StepGeom_BoundedCurve {

    public:
        // constructors
        Handle_StepGeom_CompositeCurve();
        Handle_StepGeom_CompositeCurve(const Handle_StepGeom_CompositeCurve &aHandle);
        Handle_StepGeom_CompositeCurve(const StepGeom_CompositeCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CompositeCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CompositeCurve {
    StepGeom_CompositeCurve* _get_reference() {
    return (StepGeom_CompositeCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_CompositeCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_ConicalSurface;
class StepGeom_ConicalSurface : public StepGeom_ElementarySurface {
	public:
		%feature("compactdefaultargs") StepGeom_ConicalSurface;
		%feature("autodoc", "	* Returns a ConicalSurface

	:rtype: None
") StepGeom_ConicalSurface;
		 StepGeom_ConicalSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aRadius:
	:type aRadius: float
	:param aSemiAngle:
	:type aSemiAngle: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aRadius,const Standard_Real aSemiAngle);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "	:param aSemiAngle:
	:type aSemiAngle: float
	:rtype: None
") SetSemiAngle;
		void SetSemiAngle (const Standard_Real aSemiAngle);
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "	:rtype: float
") SemiAngle;
		Standard_Real SemiAngle ();
};


%extend StepGeom_ConicalSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_ConicalSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_ConicalSurface::Handle_StepGeom_ConicalSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_ConicalSurface;
class Handle_StepGeom_ConicalSurface : public Handle_StepGeom_ElementarySurface {

    public:
        // constructors
        Handle_StepGeom_ConicalSurface();
        Handle_StepGeom_ConicalSurface(const Handle_StepGeom_ConicalSurface &aHandle);
        Handle_StepGeom_ConicalSurface(const StepGeom_ConicalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_ConicalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_ConicalSurface {
    StepGeom_ConicalSurface* _get_reference() {
    return (StepGeom_ConicalSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_ConicalSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_ConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CurveBoundedSurface;
class StepGeom_CurveBoundedSurface : public StepGeom_BoundedSurface {
	public:
		%feature("compactdefaultargs") StepGeom_CurveBoundedSurface;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepGeom_CurveBoundedSurface;
		 StepGeom_CurveBoundedSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aRepresentationItem_Name:
	:type aRepresentationItem_Name: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aBoundaries:
	:type aBoundaries: Handle_StepGeom_HArray1OfSurfaceBoundary &
	:param aImplicitOuter:
	:type aImplicitOuter: bool
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aRepresentationItem_Name,const Handle_StepGeom_Surface & aBasisSurface,const Handle_StepGeom_HArray1OfSurfaceBoundary & aBoundaries,const Standard_Boolean aImplicitOuter);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	* Returns field BasisSurface

	:rtype: Handle_StepGeom_Surface
") BasisSurface;
		Handle_StepGeom_Surface BasisSurface ();
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "	* Set field BasisSurface

	:param BasisSurface:
	:type BasisSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBasisSurface;
		void SetBasisSurface (const Handle_StepGeom_Surface & BasisSurface);
		%feature("compactdefaultargs") Boundaries;
		%feature("autodoc", "	* Returns field Boundaries

	:rtype: Handle_StepGeom_HArray1OfSurfaceBoundary
") Boundaries;
		Handle_StepGeom_HArray1OfSurfaceBoundary Boundaries ();
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "	* Set field Boundaries

	:param Boundaries:
	:type Boundaries: Handle_StepGeom_HArray1OfSurfaceBoundary &
	:rtype: None
") SetBoundaries;
		void SetBoundaries (const Handle_StepGeom_HArray1OfSurfaceBoundary & Boundaries);
		%feature("compactdefaultargs") ImplicitOuter;
		%feature("autodoc", "	* Returns field ImplicitOuter

	:rtype: bool
") ImplicitOuter;
		Standard_Boolean ImplicitOuter ();
		%feature("compactdefaultargs") SetImplicitOuter;
		%feature("autodoc", "	* Set field ImplicitOuter

	:param ImplicitOuter:
	:type ImplicitOuter: bool
	:rtype: None
") SetImplicitOuter;
		void SetImplicitOuter (const Standard_Boolean ImplicitOuter);
};


%extend StepGeom_CurveBoundedSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CurveBoundedSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CurveBoundedSurface::Handle_StepGeom_CurveBoundedSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CurveBoundedSurface;
class Handle_StepGeom_CurveBoundedSurface : public Handle_StepGeom_BoundedSurface {

    public:
        // constructors
        Handle_StepGeom_CurveBoundedSurface();
        Handle_StepGeom_CurveBoundedSurface(const Handle_StepGeom_CurveBoundedSurface &aHandle);
        Handle_StepGeom_CurveBoundedSurface(const StepGeom_CurveBoundedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CurveBoundedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CurveBoundedSurface {
    StepGeom_CurveBoundedSurface* _get_reference() {
    return (StepGeom_CurveBoundedSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_CurveBoundedSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CurveBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CylindricalSurface;
class StepGeom_CylindricalSurface : public StepGeom_ElementarySurface {
	public:
		%feature("compactdefaultargs") StepGeom_CylindricalSurface;
		%feature("autodoc", "	* Returns a CylindricalSurface

	:rtype: None
") StepGeom_CylindricalSurface;
		 StepGeom_CylindricalSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aRadius:
	:type aRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aRadius);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
};


%extend StepGeom_CylindricalSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CylindricalSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CylindricalSurface::Handle_StepGeom_CylindricalSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CylindricalSurface;
class Handle_StepGeom_CylindricalSurface : public Handle_StepGeom_ElementarySurface {

    public:
        // constructors
        Handle_StepGeom_CylindricalSurface();
        Handle_StepGeom_CylindricalSurface(const Handle_StepGeom_CylindricalSurface &aHandle);
        Handle_StepGeom_CylindricalSurface(const StepGeom_CylindricalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CylindricalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CylindricalSurface {
    StepGeom_CylindricalSurface* _get_reference() {
    return (StepGeom_CylindricalSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_CylindricalSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Ellipse;
class StepGeom_Ellipse : public StepGeom_Conic {
	public:
		%feature("compactdefaultargs") StepGeom_Ellipse;
		%feature("autodoc", "	* Returns a Ellipse

	:rtype: None
") StepGeom_Ellipse;
		 StepGeom_Ellipse ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:param aSemiAxis1:
	:type aSemiAxis1: float
	:param aSemiAxis2:
	:type aSemiAxis2: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition,const Standard_Real aSemiAxis1,const Standard_Real aSemiAxis2);
		%feature("compactdefaultargs") SetSemiAxis1;
		%feature("autodoc", "	:param aSemiAxis1:
	:type aSemiAxis1: float
	:rtype: None
") SetSemiAxis1;
		void SetSemiAxis1 (const Standard_Real aSemiAxis1);
		%feature("compactdefaultargs") SemiAxis1;
		%feature("autodoc", "	:rtype: float
") SemiAxis1;
		Standard_Real SemiAxis1 ();
		%feature("compactdefaultargs") SetSemiAxis2;
		%feature("autodoc", "	:param aSemiAxis2:
	:type aSemiAxis2: float
	:rtype: None
") SetSemiAxis2;
		void SetSemiAxis2 (const Standard_Real aSemiAxis2);
		%feature("compactdefaultargs") SemiAxis2;
		%feature("autodoc", "	:rtype: float
") SemiAxis2;
		Standard_Real SemiAxis2 ();
};


%extend StepGeom_Ellipse {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Ellipse(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Ellipse::Handle_StepGeom_Ellipse %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Ellipse;
class Handle_StepGeom_Ellipse : public Handle_StepGeom_Conic {

    public:
        // constructors
        Handle_StepGeom_Ellipse();
        Handle_StepGeom_Ellipse(const Handle_StepGeom_Ellipse &aHandle);
        Handle_StepGeom_Ellipse(const StepGeom_Ellipse *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Ellipse DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Ellipse {
    StepGeom_Ellipse* _get_reference() {
    return (StepGeom_Ellipse*)$self->Access();
    }
};

%extend Handle_StepGeom_Ellipse {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_EvaluatedDegeneratePcurve;
class StepGeom_EvaluatedDegeneratePcurve : public StepGeom_DegeneratePcurve {
	public:
		%feature("compactdefaultargs") StepGeom_EvaluatedDegeneratePcurve;
		%feature("autodoc", "	* Returns a EvaluatedDegeneratePcurve

	:rtype: None
") StepGeom_EvaluatedDegeneratePcurve;
		 StepGeom_EvaluatedDegeneratePcurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aReferenceToCurve:
	:type aReferenceToCurve: Handle_StepRepr_DefinitionalRepresentation &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Handle_StepRepr_DefinitionalRepresentation & aReferenceToCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aReferenceToCurve:
	:type aReferenceToCurve: Handle_StepRepr_DefinitionalRepresentation &
	:param aEquivalentPoint:
	:type aEquivalentPoint: Handle_StepGeom_CartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Handle_StepRepr_DefinitionalRepresentation & aReferenceToCurve,const Handle_StepGeom_CartesianPoint & aEquivalentPoint);
		%feature("compactdefaultargs") SetEquivalentPoint;
		%feature("autodoc", "	:param aEquivalentPoint:
	:type aEquivalentPoint: Handle_StepGeom_CartesianPoint &
	:rtype: None
") SetEquivalentPoint;
		void SetEquivalentPoint (const Handle_StepGeom_CartesianPoint & aEquivalentPoint);
		%feature("compactdefaultargs") EquivalentPoint;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") EquivalentPoint;
		Handle_StepGeom_CartesianPoint EquivalentPoint ();
};


%extend StepGeom_EvaluatedDegeneratePcurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_EvaluatedDegeneratePcurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_EvaluatedDegeneratePcurve::Handle_StepGeom_EvaluatedDegeneratePcurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_EvaluatedDegeneratePcurve;
class Handle_StepGeom_EvaluatedDegeneratePcurve : public Handle_StepGeom_DegeneratePcurve {

    public:
        // constructors
        Handle_StepGeom_EvaluatedDegeneratePcurve();
        Handle_StepGeom_EvaluatedDegeneratePcurve(const Handle_StepGeom_EvaluatedDegeneratePcurve &aHandle);
        Handle_StepGeom_EvaluatedDegeneratePcurve(const StepGeom_EvaluatedDegeneratePcurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_EvaluatedDegeneratePcurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_EvaluatedDegeneratePcurve {
    StepGeom_EvaluatedDegeneratePcurve* _get_reference() {
    return (StepGeom_EvaluatedDegeneratePcurve*)$self->Access();
    }
};

%extend Handle_StepGeom_EvaluatedDegeneratePcurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_EvaluatedDegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Hyperbola;
class StepGeom_Hyperbola : public StepGeom_Conic {
	public:
		%feature("compactdefaultargs") StepGeom_Hyperbola;
		%feature("autodoc", "	* Returns a Hyperbola

	:rtype: None
") StepGeom_Hyperbola;
		 StepGeom_Hyperbola ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:param aSemiAxis:
	:type aSemiAxis: float
	:param aSemiImagAxis:
	:type aSemiImagAxis: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition,const Standard_Real aSemiAxis,const Standard_Real aSemiImagAxis);
		%feature("compactdefaultargs") SetSemiAxis;
		%feature("autodoc", "	:param aSemiAxis:
	:type aSemiAxis: float
	:rtype: None
") SetSemiAxis;
		void SetSemiAxis (const Standard_Real aSemiAxis);
		%feature("compactdefaultargs") SemiAxis;
		%feature("autodoc", "	:rtype: float
") SemiAxis;
		Standard_Real SemiAxis ();
		%feature("compactdefaultargs") SetSemiImagAxis;
		%feature("autodoc", "	:param aSemiImagAxis:
	:type aSemiImagAxis: float
	:rtype: None
") SetSemiImagAxis;
		void SetSemiImagAxis (const Standard_Real aSemiImagAxis);
		%feature("compactdefaultargs") SemiImagAxis;
		%feature("autodoc", "	:rtype: float
") SemiImagAxis;
		Standard_Real SemiImagAxis ();
};


%extend StepGeom_Hyperbola {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Hyperbola(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Hyperbola::Handle_StepGeom_Hyperbola %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Hyperbola;
class Handle_StepGeom_Hyperbola : public Handle_StepGeom_Conic {

    public:
        // constructors
        Handle_StepGeom_Hyperbola();
        Handle_StepGeom_Hyperbola(const Handle_StepGeom_Hyperbola &aHandle);
        Handle_StepGeom_Hyperbola(const StepGeom_Hyperbola *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Hyperbola DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Hyperbola {
    StepGeom_Hyperbola* _get_reference() {
    return (StepGeom_Hyperbola*)$self->Access();
    }
};

%extend Handle_StepGeom_Hyperbola {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_IntersectionCurve;
class StepGeom_IntersectionCurve : public StepGeom_SurfaceCurve {
	public:
		%feature("compactdefaultargs") StepGeom_IntersectionCurve;
		%feature("autodoc", "	* Returns a IntersectionCurve

	:rtype: None
") StepGeom_IntersectionCurve;
		 StepGeom_IntersectionCurve ();
};


%extend StepGeom_IntersectionCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_IntersectionCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_IntersectionCurve::Handle_StepGeom_IntersectionCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_IntersectionCurve;
class Handle_StepGeom_IntersectionCurve : public Handle_StepGeom_SurfaceCurve {

    public:
        // constructors
        Handle_StepGeom_IntersectionCurve();
        Handle_StepGeom_IntersectionCurve(const Handle_StepGeom_IntersectionCurve &aHandle);
        Handle_StepGeom_IntersectionCurve(const StepGeom_IntersectionCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_IntersectionCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_IntersectionCurve {
    StepGeom_IntersectionCurve* _get_reference() {
    return (StepGeom_IntersectionCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_IntersectionCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_IntersectionCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Parabola;
class StepGeom_Parabola : public StepGeom_Conic {
	public:
		%feature("compactdefaultargs") StepGeom_Parabola;
		%feature("autodoc", "	* Returns a Parabola

	:rtype: None
") StepGeom_Parabola;
		 StepGeom_Parabola ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: StepGeom_Axis2Placement &
	:param aFocalDist:
	:type aFocalDist: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const StepGeom_Axis2Placement & aPosition,const Standard_Real aFocalDist);
		%feature("compactdefaultargs") SetFocalDist;
		%feature("autodoc", "	:param aFocalDist:
	:type aFocalDist: float
	:rtype: None
") SetFocalDist;
		void SetFocalDist (const Standard_Real aFocalDist);
		%feature("compactdefaultargs") FocalDist;
		%feature("autodoc", "	:rtype: float
") FocalDist;
		Standard_Real FocalDist ();
};


%extend StepGeom_Parabola {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Parabola(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Parabola::Handle_StepGeom_Parabola %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Parabola;
class Handle_StepGeom_Parabola : public Handle_StepGeom_Conic {

    public:
        // constructors
        Handle_StepGeom_Parabola();
        Handle_StepGeom_Parabola(const Handle_StepGeom_Parabola &aHandle);
        Handle_StepGeom_Parabola(const StepGeom_Parabola *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Parabola DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Parabola {
    StepGeom_Parabola* _get_reference() {
    return (StepGeom_Parabola*)$self->Access();
    }
};

%extend Handle_StepGeom_Parabola {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Plane;
class StepGeom_Plane : public StepGeom_ElementarySurface {
	public:
		%feature("compactdefaultargs") StepGeom_Plane;
		%feature("autodoc", "	* Returns a Plane

	:rtype: None
") StepGeom_Plane;
		 StepGeom_Plane ();
};


%extend StepGeom_Plane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Plane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Plane::Handle_StepGeom_Plane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Plane;
class Handle_StepGeom_Plane : public Handle_StepGeom_ElementarySurface {

    public:
        // constructors
        Handle_StepGeom_Plane();
        Handle_StepGeom_Plane(const Handle_StepGeom_Plane &aHandle);
        Handle_StepGeom_Plane(const StepGeom_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Plane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Plane {
    StepGeom_Plane* _get_reference() {
    return (StepGeom_Plane*)$self->Access();
    }
};

%extend Handle_StepGeom_Plane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_Polyline;
class StepGeom_Polyline : public StepGeom_BoundedCurve {
	public:
		%feature("compactdefaultargs") StepGeom_Polyline;
		%feature("autodoc", "	* Returns a Polyline

	:rtype: None
") StepGeom_Polyline;
		 StepGeom_Polyline ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPoints:
	:type aPoints: Handle_StepGeom_HArray1OfCartesianPoint &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_HArray1OfCartesianPoint & aPoints);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	:param aPoints:
	:type aPoints: Handle_StepGeom_HArray1OfCartesianPoint &
	:rtype: None
") SetPoints;
		void SetPoints (const Handle_StepGeom_HArray1OfCartesianPoint & aPoints);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfCartesianPoint
") Points;
		Handle_StepGeom_HArray1OfCartesianPoint Points ();
		%feature("compactdefaultargs") PointsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepGeom_CartesianPoint
") PointsValue;
		Handle_StepGeom_CartesianPoint PointsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
};


%extend StepGeom_Polyline {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_Polyline(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_Polyline::Handle_StepGeom_Polyline %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_Polyline;
class Handle_StepGeom_Polyline : public Handle_StepGeom_BoundedCurve {

    public:
        // constructors
        Handle_StepGeom_Polyline();
        Handle_StepGeom_Polyline(const Handle_StepGeom_Polyline &aHandle);
        Handle_StepGeom_Polyline(const StepGeom_Polyline *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_Polyline DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_Polyline {
    StepGeom_Polyline* _get_reference() {
    return (StepGeom_Polyline*)$self->Access();
    }
};

%extend Handle_StepGeom_Polyline {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_Polyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_RectangularCompositeSurface;
class StepGeom_RectangularCompositeSurface : public StepGeom_BoundedSurface {
	public:
		%feature("compactdefaultargs") StepGeom_RectangularCompositeSurface;
		%feature("autodoc", "	* Returns a RectangularCompositeSurface

	:rtype: None
") StepGeom_RectangularCompositeSurface;
		 StepGeom_RectangularCompositeSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSegments:
	:type aSegments: Handle_StepGeom_HArray2OfSurfacePatch &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_HArray2OfSurfacePatch & aSegments);
		%feature("compactdefaultargs") SetSegments;
		%feature("autodoc", "	:param aSegments:
	:type aSegments: Handle_StepGeom_HArray2OfSurfacePatch &
	:rtype: None
") SetSegments;
		void SetSegments (const Handle_StepGeom_HArray2OfSurfacePatch & aSegments);
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray2OfSurfacePatch
") Segments;
		Handle_StepGeom_HArray2OfSurfacePatch Segments ();
		%feature("compactdefaultargs") SegmentsValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: Handle_StepGeom_SurfacePatch
") SegmentsValue;
		Handle_StepGeom_SurfacePatch SegmentsValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbSegmentsI;
		%feature("autodoc", "	:rtype: int
") NbSegmentsI;
		Standard_Integer NbSegmentsI ();
		%feature("compactdefaultargs") NbSegmentsJ;
		%feature("autodoc", "	:rtype: int
") NbSegmentsJ;
		Standard_Integer NbSegmentsJ ();
};


%extend StepGeom_RectangularCompositeSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_RectangularCompositeSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_RectangularCompositeSurface::Handle_StepGeom_RectangularCompositeSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_RectangularCompositeSurface;
class Handle_StepGeom_RectangularCompositeSurface : public Handle_StepGeom_BoundedSurface {

    public:
        // constructors
        Handle_StepGeom_RectangularCompositeSurface();
        Handle_StepGeom_RectangularCompositeSurface(const Handle_StepGeom_RectangularCompositeSurface &aHandle);
        Handle_StepGeom_RectangularCompositeSurface(const StepGeom_RectangularCompositeSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_RectangularCompositeSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_RectangularCompositeSurface {
    StepGeom_RectangularCompositeSurface* _get_reference() {
    return (StepGeom_RectangularCompositeSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_RectangularCompositeSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_RectangularCompositeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_RectangularTrimmedSurface;
class StepGeom_RectangularTrimmedSurface : public StepGeom_BoundedSurface {
	public:
		%feature("compactdefaultargs") StepGeom_RectangularTrimmedSurface;
		%feature("autodoc", "	* Returns a RectangularTrimmedSurface

	:rtype: None
") StepGeom_RectangularTrimmedSurface;
		 StepGeom_RectangularTrimmedSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:param aU1:
	:type aU1: float
	:param aU2:
	:type aU2: float
	:param aV1:
	:type aV1: float
	:param aV2:
	:type aV2: float
	:param aUsense:
	:type aUsense: bool
	:param aVsense:
	:type aVsense: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Surface & aBasisSurface,const Standard_Real aU1,const Standard_Real aU2,const Standard_Real aV1,const Standard_Real aV2,const Standard_Boolean aUsense,const Standard_Boolean aVsense);
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "	:param aBasisSurface:
	:type aBasisSurface: Handle_StepGeom_Surface &
	:rtype: None
") SetBasisSurface;
		void SetBasisSurface (const Handle_StepGeom_Surface & aBasisSurface);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") BasisSurface;
		Handle_StepGeom_Surface BasisSurface ();
		%feature("compactdefaultargs") SetU1;
		%feature("autodoc", "	:param aU1:
	:type aU1: float
	:rtype: None
") SetU1;
		void SetU1 (const Standard_Real aU1);
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "	:rtype: float
") U1;
		Standard_Real U1 ();
		%feature("compactdefaultargs") SetU2;
		%feature("autodoc", "	:param aU2:
	:type aU2: float
	:rtype: None
") SetU2;
		void SetU2 (const Standard_Real aU2);
		%feature("compactdefaultargs") U2;
		%feature("autodoc", "	:rtype: float
") U2;
		Standard_Real U2 ();
		%feature("compactdefaultargs") SetV1;
		%feature("autodoc", "	:param aV1:
	:type aV1: float
	:rtype: None
") SetV1;
		void SetV1 (const Standard_Real aV1);
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "	:rtype: float
") V1;
		Standard_Real V1 ();
		%feature("compactdefaultargs") SetV2;
		%feature("autodoc", "	:param aV2:
	:type aV2: float
	:rtype: None
") SetV2;
		void SetV2 (const Standard_Real aV2);
		%feature("compactdefaultargs") V2;
		%feature("autodoc", "	:rtype: float
") V2;
		Standard_Real V2 ();
		%feature("compactdefaultargs") SetUsense;
		%feature("autodoc", "	:param aUsense:
	:type aUsense: bool
	:rtype: None
") SetUsense;
		void SetUsense (const Standard_Boolean aUsense);
		%feature("compactdefaultargs") Usense;
		%feature("autodoc", "	:rtype: bool
") Usense;
		Standard_Boolean Usense ();
		%feature("compactdefaultargs") SetVsense;
		%feature("autodoc", "	:param aVsense:
	:type aVsense: bool
	:rtype: None
") SetVsense;
		void SetVsense (const Standard_Boolean aVsense);
		%feature("compactdefaultargs") Vsense;
		%feature("autodoc", "	:rtype: bool
") Vsense;
		Standard_Boolean Vsense ();
};


%extend StepGeom_RectangularTrimmedSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_RectangularTrimmedSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_RectangularTrimmedSurface::Handle_StepGeom_RectangularTrimmedSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_RectangularTrimmedSurface;
class Handle_StepGeom_RectangularTrimmedSurface : public Handle_StepGeom_BoundedSurface {

    public:
        // constructors
        Handle_StepGeom_RectangularTrimmedSurface();
        Handle_StepGeom_RectangularTrimmedSurface(const Handle_StepGeom_RectangularTrimmedSurface &aHandle);
        Handle_StepGeom_RectangularTrimmedSurface(const StepGeom_RectangularTrimmedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_RectangularTrimmedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_RectangularTrimmedSurface {
    StepGeom_RectangularTrimmedSurface* _get_reference() {
    return (StepGeom_RectangularTrimmedSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_RectangularTrimmedSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_RectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SeamCurve;
class StepGeom_SeamCurve : public StepGeom_SurfaceCurve {
	public:
		%feature("compactdefaultargs") StepGeom_SeamCurve;
		%feature("autodoc", "	* Returns a SeamCurve

	:rtype: None
") StepGeom_SeamCurve;
		 StepGeom_SeamCurve ();
};


%extend StepGeom_SeamCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SeamCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SeamCurve::Handle_StepGeom_SeamCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SeamCurve;
class Handle_StepGeom_SeamCurve : public Handle_StepGeom_SurfaceCurve {

    public:
        // constructors
        Handle_StepGeom_SeamCurve();
        Handle_StepGeom_SeamCurve(const Handle_StepGeom_SeamCurve &aHandle);
        Handle_StepGeom_SeamCurve(const StepGeom_SeamCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SeamCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SeamCurve {
    StepGeom_SeamCurve* _get_reference() {
    return (StepGeom_SeamCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_SeamCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SeamCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SphericalSurface;
class StepGeom_SphericalSurface : public StepGeom_ElementarySurface {
	public:
		%feature("compactdefaultargs") StepGeom_SphericalSurface;
		%feature("autodoc", "	* Returns a SphericalSurface

	:rtype: None
") StepGeom_SphericalSurface;
		 StepGeom_SphericalSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aRadius:
	:type aRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aRadius);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param aRadius:
	:type aRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real aRadius);
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	:rtype: float
") Radius;
		Standard_Real Radius ();
};


%extend StepGeom_SphericalSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SphericalSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SphericalSurface::Handle_StepGeom_SphericalSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SphericalSurface;
class Handle_StepGeom_SphericalSurface : public Handle_StepGeom_ElementarySurface {

    public:
        // constructors
        Handle_StepGeom_SphericalSurface();
        Handle_StepGeom_SphericalSurface(const Handle_StepGeom_SphericalSurface &aHandle);
        Handle_StepGeom_SphericalSurface(const StepGeom_SphericalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SphericalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SphericalSurface {
    StepGeom_SphericalSurface* _get_reference() {
    return (StepGeom_SphericalSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_SphericalSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfaceCurveAndBoundedCurve;
class StepGeom_SurfaceCurveAndBoundedCurve : public StepGeom_SurfaceCurve {
	public:
		%feature("compactdefaultargs") StepGeom_SurfaceCurveAndBoundedCurve;
		%feature("autodoc", "	* creates empty object

	:rtype: None
") StepGeom_SurfaceCurveAndBoundedCurve;
		 StepGeom_SurfaceCurveAndBoundedCurve ();
		%feature("compactdefaultargs") BoundedCurve;
		%feature("autodoc", "	* returns field BoundedCurve

	:rtype: Handle_StepGeom_BoundedCurve
") BoundedCurve;
		Handle_StepGeom_BoundedCurve BoundedCurve ();
};


%extend StepGeom_SurfaceCurveAndBoundedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SurfaceCurveAndBoundedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SurfaceCurveAndBoundedCurve::Handle_StepGeom_SurfaceCurveAndBoundedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SurfaceCurveAndBoundedCurve;
class Handle_StepGeom_SurfaceCurveAndBoundedCurve : public Handle_StepGeom_SurfaceCurve {

    public:
        // constructors
        Handle_StepGeom_SurfaceCurveAndBoundedCurve();
        Handle_StepGeom_SurfaceCurveAndBoundedCurve(const Handle_StepGeom_SurfaceCurveAndBoundedCurve &aHandle);
        Handle_StepGeom_SurfaceCurveAndBoundedCurve(const StepGeom_SurfaceCurveAndBoundedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SurfaceCurveAndBoundedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SurfaceCurveAndBoundedCurve {
    StepGeom_SurfaceCurveAndBoundedCurve* _get_reference() {
    return (StepGeom_SurfaceCurveAndBoundedCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_SurfaceCurveAndBoundedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SurfaceCurveAndBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfaceOfLinearExtrusion;
class StepGeom_SurfaceOfLinearExtrusion : public StepGeom_SweptSurface {
	public:
		%feature("compactdefaultargs") StepGeom_SurfaceOfLinearExtrusion;
		%feature("autodoc", "	* Returns a SurfaceOfLinearExtrusion

	:rtype: None
") StepGeom_SurfaceOfLinearExtrusion;
		 StepGeom_SurfaceOfLinearExtrusion ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptCurve:
	:type aSweptCurve: Handle_StepGeom_Curve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aSweptCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptCurve:
	:type aSweptCurve: Handle_StepGeom_Curve &
	:param aExtrusionAxis:
	:type aExtrusionAxis: Handle_StepGeom_Vector &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aSweptCurve,const Handle_StepGeom_Vector & aExtrusionAxis);
		%feature("compactdefaultargs") SetExtrusionAxis;
		%feature("autodoc", "	:param aExtrusionAxis:
	:type aExtrusionAxis: Handle_StepGeom_Vector &
	:rtype: None
") SetExtrusionAxis;
		void SetExtrusionAxis (const Handle_StepGeom_Vector & aExtrusionAxis);
		%feature("compactdefaultargs") ExtrusionAxis;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Vector
") ExtrusionAxis;
		Handle_StepGeom_Vector ExtrusionAxis ();
};


%extend StepGeom_SurfaceOfLinearExtrusion {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SurfaceOfLinearExtrusion(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SurfaceOfLinearExtrusion::Handle_StepGeom_SurfaceOfLinearExtrusion %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SurfaceOfLinearExtrusion;
class Handle_StepGeom_SurfaceOfLinearExtrusion : public Handle_StepGeom_SweptSurface {

    public:
        // constructors
        Handle_StepGeom_SurfaceOfLinearExtrusion();
        Handle_StepGeom_SurfaceOfLinearExtrusion(const Handle_StepGeom_SurfaceOfLinearExtrusion &aHandle);
        Handle_StepGeom_SurfaceOfLinearExtrusion(const StepGeom_SurfaceOfLinearExtrusion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SurfaceOfLinearExtrusion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SurfaceOfLinearExtrusion {
    StepGeom_SurfaceOfLinearExtrusion* _get_reference() {
    return (StepGeom_SurfaceOfLinearExtrusion*)$self->Access();
    }
};

%extend Handle_StepGeom_SurfaceOfLinearExtrusion {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_SurfaceOfRevolution;
class StepGeom_SurfaceOfRevolution : public StepGeom_SweptSurface {
	public:
		%feature("compactdefaultargs") StepGeom_SurfaceOfRevolution;
		%feature("autodoc", "	* Returns a SurfaceOfRevolution

	:rtype: None
") StepGeom_SurfaceOfRevolution;
		 StepGeom_SurfaceOfRevolution ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptCurve:
	:type aSweptCurve: Handle_StepGeom_Curve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aSweptCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aSweptCurve:
	:type aSweptCurve: Handle_StepGeom_Curve &
	:param aAxisPosition:
	:type aAxisPosition: Handle_StepGeom_Axis1Placement &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aSweptCurve,const Handle_StepGeom_Axis1Placement & aAxisPosition);
		%feature("compactdefaultargs") SetAxisPosition;
		%feature("autodoc", "	:param aAxisPosition:
	:type aAxisPosition: Handle_StepGeom_Axis1Placement &
	:rtype: None
") SetAxisPosition;
		void SetAxisPosition (const Handle_StepGeom_Axis1Placement & aAxisPosition);
		%feature("compactdefaultargs") AxisPosition;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") AxisPosition;
		Handle_StepGeom_Axis1Placement AxisPosition ();
};


%extend StepGeom_SurfaceOfRevolution {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_SurfaceOfRevolution(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_SurfaceOfRevolution::Handle_StepGeom_SurfaceOfRevolution %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_SurfaceOfRevolution;
class Handle_StepGeom_SurfaceOfRevolution : public Handle_StepGeom_SweptSurface {

    public:
        // constructors
        Handle_StepGeom_SurfaceOfRevolution();
        Handle_StepGeom_SurfaceOfRevolution(const Handle_StepGeom_SurfaceOfRevolution &aHandle);
        Handle_StepGeom_SurfaceOfRevolution(const StepGeom_SurfaceOfRevolution *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_SurfaceOfRevolution DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_SurfaceOfRevolution {
    StepGeom_SurfaceOfRevolution* _get_reference() {
    return (StepGeom_SurfaceOfRevolution*)$self->Access();
    }
};

%extend Handle_StepGeom_SurfaceOfRevolution {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_ToroidalSurface;
class StepGeom_ToroidalSurface : public StepGeom_ElementarySurface {
	public:
		%feature("compactdefaultargs") StepGeom_ToroidalSurface;
		%feature("autodoc", "	* Returns a ToroidalSurface

	:rtype: None
") StepGeom_ToroidalSurface;
		 StepGeom_ToroidalSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aMajorRadius:
	:type aMajorRadius: float
	:param aMinorRadius:
	:type aMinorRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aMajorRadius,const Standard_Real aMinorRadius);
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "	:param aMajorRadius:
	:type aMajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius (const Standard_Real aMajorRadius);
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius ();
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "	:param aMinorRadius:
	:type aMinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius (const Standard_Real aMinorRadius);
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius ();
};


%extend StepGeom_ToroidalSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_ToroidalSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_ToroidalSurface::Handle_StepGeom_ToroidalSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_ToroidalSurface;
class Handle_StepGeom_ToroidalSurface : public Handle_StepGeom_ElementarySurface {

    public:
        // constructors
        Handle_StepGeom_ToroidalSurface();
        Handle_StepGeom_ToroidalSurface(const Handle_StepGeom_ToroidalSurface &aHandle);
        Handle_StepGeom_ToroidalSurface(const StepGeom_ToroidalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_ToroidalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_ToroidalSurface {
    StepGeom_ToroidalSurface* _get_reference() {
    return (StepGeom_ToroidalSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_ToroidalSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_ToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_TrimmedCurve;
class StepGeom_TrimmedCurve : public StepGeom_BoundedCurve {
	public:
		%feature("compactdefaultargs") StepGeom_TrimmedCurve;
		%feature("autodoc", "	* Returns a TrimmedCurve

	:rtype: None
") StepGeom_TrimmedCurve;
		 StepGeom_TrimmedCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aBasisCurve:
	:type aBasisCurve: Handle_StepGeom_Curve &
	:param aTrim1:
	:type aTrim1: Handle_StepGeom_HArray1OfTrimmingSelect &
	:param aTrim2:
	:type aTrim2: Handle_StepGeom_HArray1OfTrimmingSelect &
	:param aSenseAgreement:
	:type aSenseAgreement: bool
	:param aMasterRepresentation:
	:type aMasterRepresentation: StepGeom_TrimmingPreference
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Curve & aBasisCurve,const Handle_StepGeom_HArray1OfTrimmingSelect & aTrim1,const Handle_StepGeom_HArray1OfTrimmingSelect & aTrim2,const Standard_Boolean aSenseAgreement,const StepGeom_TrimmingPreference aMasterRepresentation);
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "	:param aBasisCurve:
	:type aBasisCurve: Handle_StepGeom_Curve &
	:rtype: None
") SetBasisCurve;
		void SetBasisCurve (const Handle_StepGeom_Curve & aBasisCurve);
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") BasisCurve;
		Handle_StepGeom_Curve BasisCurve ();
		%feature("compactdefaultargs") SetTrim1;
		%feature("autodoc", "	:param aTrim1:
	:type aTrim1: Handle_StepGeom_HArray1OfTrimmingSelect &
	:rtype: None
") SetTrim1;
		void SetTrim1 (const Handle_StepGeom_HArray1OfTrimmingSelect & aTrim1);
		%feature("compactdefaultargs") Trim1;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfTrimmingSelect
") Trim1;
		Handle_StepGeom_HArray1OfTrimmingSelect Trim1 ();
		%feature("compactdefaultargs") Trim1Value;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepGeom_TrimmingSelect
") Trim1Value;
		StepGeom_TrimmingSelect Trim1Value (const Standard_Integer num);
		%feature("compactdefaultargs") NbTrim1;
		%feature("autodoc", "	:rtype: int
") NbTrim1;
		Standard_Integer NbTrim1 ();
		%feature("compactdefaultargs") SetTrim2;
		%feature("autodoc", "	:param aTrim2:
	:type aTrim2: Handle_StepGeom_HArray1OfTrimmingSelect &
	:rtype: None
") SetTrim2;
		void SetTrim2 (const Handle_StepGeom_HArray1OfTrimmingSelect & aTrim2);
		%feature("compactdefaultargs") Trim2;
		%feature("autodoc", "	:rtype: Handle_StepGeom_HArray1OfTrimmingSelect
") Trim2;
		Handle_StepGeom_HArray1OfTrimmingSelect Trim2 ();
		%feature("compactdefaultargs") Trim2Value;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: StepGeom_TrimmingSelect
") Trim2Value;
		StepGeom_TrimmingSelect Trim2Value (const Standard_Integer num);
		%feature("compactdefaultargs") NbTrim2;
		%feature("autodoc", "	:rtype: int
") NbTrim2;
		Standard_Integer NbTrim2 ();
		%feature("compactdefaultargs") SetSenseAgreement;
		%feature("autodoc", "	:param aSenseAgreement:
	:type aSenseAgreement: bool
	:rtype: None
") SetSenseAgreement;
		void SetSenseAgreement (const Standard_Boolean aSenseAgreement);
		%feature("compactdefaultargs") SenseAgreement;
		%feature("autodoc", "	:rtype: bool
") SenseAgreement;
		Standard_Boolean SenseAgreement ();
		%feature("compactdefaultargs") SetMasterRepresentation;
		%feature("autodoc", "	:param aMasterRepresentation:
	:type aMasterRepresentation: StepGeom_TrimmingPreference
	:rtype: None
") SetMasterRepresentation;
		void SetMasterRepresentation (const StepGeom_TrimmingPreference aMasterRepresentation);
		%feature("compactdefaultargs") MasterRepresentation;
		%feature("autodoc", "	:rtype: StepGeom_TrimmingPreference
") MasterRepresentation;
		StepGeom_TrimmingPreference MasterRepresentation ();
};


%extend StepGeom_TrimmedCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_TrimmedCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_TrimmedCurve::Handle_StepGeom_TrimmedCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_TrimmedCurve;
class Handle_StepGeom_TrimmedCurve : public Handle_StepGeom_BoundedCurve {

    public:
        // constructors
        Handle_StepGeom_TrimmedCurve();
        Handle_StepGeom_TrimmedCurve(const Handle_StepGeom_TrimmedCurve &aHandle);
        Handle_StepGeom_TrimmedCurve(const StepGeom_TrimmedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_TrimmedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_TrimmedCurve {
    StepGeom_TrimmedCurve* _get_reference() {
    return (StepGeom_TrimmedCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_TrimmedCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_TrimmedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BSplineCurveWithKnots;
class StepGeom_BSplineCurveWithKnots : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_BSplineCurveWithKnots;
		%feature("autodoc", "	* Returns a BSplineCurveWithKnots

	:rtype: None
") StepGeom_BSplineCurveWithKnots;
		 StepGeom_BSplineCurveWithKnots ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aKnotMultiplicities:
	:type aKnotMultiplicities: Handle_TColStd_HArray1OfInteger &
	:param aKnots:
	:type aKnots: Handle_TColStd_HArray1OfReal &
	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfInteger & aKnotMultiplicities,const Handle_TColStd_HArray1OfReal & aKnots,const StepGeom_KnotType aKnotSpec);
		%feature("compactdefaultargs") SetKnotMultiplicities;
		%feature("autodoc", "	:param aKnotMultiplicities:
	:type aKnotMultiplicities: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetKnotMultiplicities;
		void SetKnotMultiplicities (const Handle_TColStd_HArray1OfInteger & aKnotMultiplicities);
		%feature("compactdefaultargs") KnotMultiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") KnotMultiplicities;
		Handle_TColStd_HArray1OfInteger KnotMultiplicities ();
		%feature("compactdefaultargs") KnotMultiplicitiesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: int
") KnotMultiplicitiesValue;
		Standard_Integer KnotMultiplicitiesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbKnotMultiplicities;
		%feature("autodoc", "	:rtype: int
") NbKnotMultiplicities;
		Standard_Integer NbKnotMultiplicities ();
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "	:param aKnots:
	:type aKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetKnots;
		void SetKnots (const Handle_TColStd_HArray1OfReal & aKnots);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Knots;
		Handle_TColStd_HArray1OfReal Knots ();
		%feature("compactdefaultargs") KnotsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") KnotsValue;
		Standard_Real KnotsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:rtype: None
") SetKnotSpec;
		void SetKnotSpec (const StepGeom_KnotType aKnotSpec);
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "	:rtype: StepGeom_KnotType
") KnotSpec;
		StepGeom_KnotType KnotSpec ();
};


%extend StepGeom_BSplineCurveWithKnots {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BSplineCurveWithKnots(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BSplineCurveWithKnots::Handle_StepGeom_BSplineCurveWithKnots %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BSplineCurveWithKnots;
class Handle_StepGeom_BSplineCurveWithKnots : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_BSplineCurveWithKnots();
        Handle_StepGeom_BSplineCurveWithKnots(const Handle_StepGeom_BSplineCurveWithKnots &aHandle);
        Handle_StepGeom_BSplineCurveWithKnots(const StepGeom_BSplineCurveWithKnots *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BSplineCurveWithKnots DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BSplineCurveWithKnots {
    StepGeom_BSplineCurveWithKnots* _get_reference() {
    return (StepGeom_BSplineCurveWithKnots*)$self->Access();
    }
};

%extend Handle_StepGeom_BSplineCurveWithKnots {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve;
class StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "	* Returns a BSplineCurveWithKnotsAndRationalBSplineCurve

	:rtype: None
") StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve;
		 StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aBSplineCurveWithKnots:
	:type aBSplineCurveWithKnots: Handle_StepGeom_BSplineCurveWithKnots &
	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_StepGeom_BSplineCurveWithKnots & aBSplineCurveWithKnots,const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aKnotMultiplicities:
	:type aKnotMultiplicities: Handle_TColStd_HArray1OfInteger &
	:param aKnots:
	:type aKnots: Handle_TColStd_HArray1OfReal &
	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfInteger & aKnotMultiplicities,const Handle_TColStd_HArray1OfReal & aKnots,const StepGeom_KnotType aKnotSpec,const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") SetBSplineCurveWithKnots;
		%feature("autodoc", "	:param aBSplineCurveWithKnots:
	:type aBSplineCurveWithKnots: Handle_StepGeom_BSplineCurveWithKnots &
	:rtype: None
") SetBSplineCurveWithKnots;
		void SetBSplineCurveWithKnots (const Handle_StepGeom_BSplineCurveWithKnots & aBSplineCurveWithKnots);
		%feature("compactdefaultargs") BSplineCurveWithKnots;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BSplineCurveWithKnots
") BSplineCurveWithKnots;
		Handle_StepGeom_BSplineCurveWithKnots BSplineCurveWithKnots ();
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: None
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve (const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineCurve
") RationalBSplineCurve;
		Handle_StepGeom_RationalBSplineCurve RationalBSplineCurve ();
		%feature("compactdefaultargs") SetKnotMultiplicities;
		%feature("autodoc", "	:param aKnotMultiplicities:
	:type aKnotMultiplicities: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetKnotMultiplicities;
		void SetKnotMultiplicities (const Handle_TColStd_HArray1OfInteger & aKnotMultiplicities);
		%feature("compactdefaultargs") KnotMultiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") KnotMultiplicities;
		Handle_TColStd_HArray1OfInteger KnotMultiplicities ();
		%feature("compactdefaultargs") KnotMultiplicitiesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: int
") KnotMultiplicitiesValue;
		Standard_Integer KnotMultiplicitiesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbKnotMultiplicities;
		%feature("autodoc", "	:rtype: int
") NbKnotMultiplicities;
		Standard_Integer NbKnotMultiplicities ();
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "	:param aKnots:
	:type aKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetKnots;
		void SetKnots (const Handle_TColStd_HArray1OfReal & aKnots);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") Knots;
		Handle_TColStd_HArray1OfReal Knots ();
		%feature("compactdefaultargs") KnotsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") KnotsValue;
		Standard_Real KnotsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:rtype: None
") SetKnotSpec;
		void SetKnotSpec (const StepGeom_KnotType aKnotSpec);
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "	:rtype: StepGeom_KnotType
") KnotSpec;
		StepGeom_KnotType KnotSpec ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") WeightsData;
		Handle_TColStd_HArray1OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "	:rtype: int
") NbWeightsData;
		Standard_Integer NbWeightsData ();
};


%extend StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve;
class Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve();
        Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve(const Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve &aHandle);
        Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve(const StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve {
    StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve* _get_reference() {
    return (StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BSplineSurfaceWithKnots;
class StepGeom_BSplineSurfaceWithKnots : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_BSplineSurfaceWithKnots;
		%feature("autodoc", "	* Returns a BSplineSurfaceWithKnots

	:rtype: None
") StepGeom_BSplineSurfaceWithKnots;
		 StepGeom_BSplineSurfaceWithKnots ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aUMultiplicities:
	:type aUMultiplicities: Handle_TColStd_HArray1OfInteger &
	:param aVMultiplicities:
	:type aVMultiplicities: Handle_TColStd_HArray1OfInteger &
	:param aUKnots:
	:type aUKnots: Handle_TColStd_HArray1OfReal &
	:param aVKnots:
	:type aVKnots: Handle_TColStd_HArray1OfReal &
	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfInteger & aUMultiplicities,const Handle_TColStd_HArray1OfInteger & aVMultiplicities,const Handle_TColStd_HArray1OfReal & aUKnots,const Handle_TColStd_HArray1OfReal & aVKnots,const StepGeom_KnotType aKnotSpec);
		%feature("compactdefaultargs") SetUMultiplicities;
		%feature("autodoc", "	:param aUMultiplicities:
	:type aUMultiplicities: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetUMultiplicities;
		void SetUMultiplicities (const Handle_TColStd_HArray1OfInteger & aUMultiplicities);
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") UMultiplicities;
		Handle_TColStd_HArray1OfInteger UMultiplicities ();
		%feature("compactdefaultargs") UMultiplicitiesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: int
") UMultiplicitiesValue;
		Standard_Integer UMultiplicitiesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUMultiplicities;
		%feature("autodoc", "	:rtype: int
") NbUMultiplicities;
		Standard_Integer NbUMultiplicities ();
		%feature("compactdefaultargs") SetVMultiplicities;
		%feature("autodoc", "	:param aVMultiplicities:
	:type aVMultiplicities: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetVMultiplicities;
		void SetVMultiplicities (const Handle_TColStd_HArray1OfInteger & aVMultiplicities);
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") VMultiplicities;
		Handle_TColStd_HArray1OfInteger VMultiplicities ();
		%feature("compactdefaultargs") VMultiplicitiesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: int
") VMultiplicitiesValue;
		Standard_Integer VMultiplicitiesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbVMultiplicities;
		%feature("autodoc", "	:rtype: int
") NbVMultiplicities;
		Standard_Integer NbVMultiplicities ();
		%feature("compactdefaultargs") SetUKnots;
		%feature("autodoc", "	:param aUKnots:
	:type aUKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetUKnots;
		void SetUKnots (const Handle_TColStd_HArray1OfReal & aUKnots);
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") UKnots;
		Handle_TColStd_HArray1OfReal UKnots ();
		%feature("compactdefaultargs") UKnotsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") UKnotsValue;
		Standard_Real UKnotsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") SetVKnots;
		%feature("autodoc", "	:param aVKnots:
	:type aVKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetVKnots;
		void SetVKnots (const Handle_TColStd_HArray1OfReal & aVKnots);
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") VKnots;
		Handle_TColStd_HArray1OfReal VKnots ();
		%feature("compactdefaultargs") VKnotsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") VKnotsValue;
		Standard_Real VKnotsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:rtype: None
") SetKnotSpec;
		void SetKnotSpec (const StepGeom_KnotType aKnotSpec);
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "	:rtype: StepGeom_KnotType
") KnotSpec;
		StepGeom_KnotType KnotSpec ();
};


%extend StepGeom_BSplineSurfaceWithKnots {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BSplineSurfaceWithKnots(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BSplineSurfaceWithKnots::Handle_StepGeom_BSplineSurfaceWithKnots %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BSplineSurfaceWithKnots;
class Handle_StepGeom_BSplineSurfaceWithKnots : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_BSplineSurfaceWithKnots();
        Handle_StepGeom_BSplineSurfaceWithKnots(const Handle_StepGeom_BSplineSurfaceWithKnots &aHandle);
        Handle_StepGeom_BSplineSurfaceWithKnots(const StepGeom_BSplineSurfaceWithKnots *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BSplineSurfaceWithKnots DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BSplineSurfaceWithKnots {
    StepGeom_BSplineSurfaceWithKnots* _get_reference() {
    return (StepGeom_BSplineSurfaceWithKnots*)$self->Access();
    }
};

%extend Handle_StepGeom_BSplineSurfaceWithKnots {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface;
class StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "	* Returns a BSplineSurfaceWithKnotsAndRationalBSplineSurface

	:rtype: None
") StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aBSplineSurfaceWithKnots:
	:type aBSplineSurfaceWithKnots: Handle_StepGeom_BSplineSurfaceWithKnots &
	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_StepGeom_BSplineSurfaceWithKnots & aBSplineSurfaceWithKnots,const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aUMultiplicities:
	:type aUMultiplicities: Handle_TColStd_HArray1OfInteger &
	:param aVMultiplicities:
	:type aVMultiplicities: Handle_TColStd_HArray1OfInteger &
	:param aUKnots:
	:type aUKnots: Handle_TColStd_HArray1OfReal &
	:param aVKnots:
	:type aVKnots: Handle_TColStd_HArray1OfReal &
	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfInteger & aUMultiplicities,const Handle_TColStd_HArray1OfInteger & aVMultiplicities,const Handle_TColStd_HArray1OfReal & aUKnots,const Handle_TColStd_HArray1OfReal & aVKnots,const StepGeom_KnotType aKnotSpec,const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") SetBSplineSurfaceWithKnots;
		%feature("autodoc", "	:param aBSplineSurfaceWithKnots:
	:type aBSplineSurfaceWithKnots: Handle_StepGeom_BSplineSurfaceWithKnots &
	:rtype: None
") SetBSplineSurfaceWithKnots;
		void SetBSplineSurfaceWithKnots (const Handle_StepGeom_BSplineSurfaceWithKnots & aBSplineSurfaceWithKnots);
		%feature("compactdefaultargs") BSplineSurfaceWithKnots;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BSplineSurfaceWithKnots
") BSplineSurfaceWithKnots;
		Handle_StepGeom_BSplineSurfaceWithKnots BSplineSurfaceWithKnots ();
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: None
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface (const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineSurface
") RationalBSplineSurface;
		Handle_StepGeom_RationalBSplineSurface RationalBSplineSurface ();
		%feature("compactdefaultargs") SetUMultiplicities;
		%feature("autodoc", "	:param aUMultiplicities:
	:type aUMultiplicities: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetUMultiplicities;
		void SetUMultiplicities (const Handle_TColStd_HArray1OfInteger & aUMultiplicities);
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") UMultiplicities;
		Handle_TColStd_HArray1OfInteger UMultiplicities ();
		%feature("compactdefaultargs") UMultiplicitiesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: int
") UMultiplicitiesValue;
		Standard_Integer UMultiplicitiesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUMultiplicities;
		%feature("autodoc", "	:rtype: int
") NbUMultiplicities;
		Standard_Integer NbUMultiplicities ();
		%feature("compactdefaultargs") SetVMultiplicities;
		%feature("autodoc", "	:param aVMultiplicities:
	:type aVMultiplicities: Handle_TColStd_HArray1OfInteger &
	:rtype: None
") SetVMultiplicities;
		void SetVMultiplicities (const Handle_TColStd_HArray1OfInteger & aVMultiplicities);
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfInteger
") VMultiplicities;
		Handle_TColStd_HArray1OfInteger VMultiplicities ();
		%feature("compactdefaultargs") VMultiplicitiesValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: int
") VMultiplicitiesValue;
		Standard_Integer VMultiplicitiesValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbVMultiplicities;
		%feature("autodoc", "	:rtype: int
") NbVMultiplicities;
		Standard_Integer NbVMultiplicities ();
		%feature("compactdefaultargs") SetUKnots;
		%feature("autodoc", "	:param aUKnots:
	:type aUKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetUKnots;
		void SetUKnots (const Handle_TColStd_HArray1OfReal & aUKnots);
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") UKnots;
		Handle_TColStd_HArray1OfReal UKnots ();
		%feature("compactdefaultargs") UKnotsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") UKnotsValue;
		Standard_Real UKnotsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") SetVKnots;
		%feature("autodoc", "	:param aVKnots:
	:type aVKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetVKnots;
		void SetVKnots (const Handle_TColStd_HArray1OfReal & aVKnots);
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") VKnots;
		Handle_TColStd_HArray1OfReal VKnots ();
		%feature("compactdefaultargs") VKnotsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") VKnotsValue;
		Standard_Real VKnotsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "	:param aKnotSpec:
	:type aKnotSpec: StepGeom_KnotType
	:rtype: None
") SetKnotSpec;
		void SetKnotSpec (const StepGeom_KnotType aKnotSpec);
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "	:rtype: StepGeom_KnotType
") KnotSpec;
		StepGeom_KnotType KnotSpec ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") WeightsData;
		Handle_TColStd_HArray2OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataI;
		Standard_Integer NbWeightsDataI ();
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataJ;
		Standard_Integer NbWeightsDataJ ();
};


%extend StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface;
class Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface();
        Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface(const Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface &aHandle);
        Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface(const StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface {
    StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface* _get_reference() {
    return (StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BezierCurve;
class StepGeom_BezierCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_BezierCurve;
		%feature("autodoc", "	* Returns a BezierCurve

	:rtype: None
") StepGeom_BezierCurve;
		 StepGeom_BezierCurve ();
};


%extend StepGeom_BezierCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BezierCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BezierCurve::Handle_StepGeom_BezierCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BezierCurve;
class Handle_StepGeom_BezierCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_BezierCurve();
        Handle_StepGeom_BezierCurve(const Handle_StepGeom_BezierCurve &aHandle);
        Handle_StepGeom_BezierCurve(const StepGeom_BezierCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BezierCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BezierCurve {
    StepGeom_BezierCurve* _get_reference() {
    return (StepGeom_BezierCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_BezierCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BezierCurveAndRationalBSplineCurve;
class StepGeom_BezierCurveAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_BezierCurveAndRationalBSplineCurve;
		%feature("autodoc", "	* Returns a BezierCurveAndRationalBSplineCurve

	:rtype: None
") StepGeom_BezierCurveAndRationalBSplineCurve;
		 StepGeom_BezierCurveAndRationalBSplineCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aBezierCurve:
	:type aBezierCurve: Handle_StepGeom_BezierCurve &
	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_StepGeom_BezierCurve & aBezierCurve,const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") SetBezierCurve;
		%feature("autodoc", "	:param aBezierCurve:
	:type aBezierCurve: Handle_StepGeom_BezierCurve &
	:rtype: None
") SetBezierCurve;
		void SetBezierCurve (const Handle_StepGeom_BezierCurve & aBezierCurve);
		%feature("compactdefaultargs") BezierCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BezierCurve
") BezierCurve;
		Handle_StepGeom_BezierCurve BezierCurve ();
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: None
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve (const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineCurve
") RationalBSplineCurve;
		Handle_StepGeom_RationalBSplineCurve RationalBSplineCurve ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") WeightsData;
		Handle_TColStd_HArray1OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "	:rtype: int
") NbWeightsData;
		Standard_Integer NbWeightsData ();
};


%extend StepGeom_BezierCurveAndRationalBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BezierCurveAndRationalBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BezierCurveAndRationalBSplineCurve::Handle_StepGeom_BezierCurveAndRationalBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BezierCurveAndRationalBSplineCurve;
class Handle_StepGeom_BezierCurveAndRationalBSplineCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_BezierCurveAndRationalBSplineCurve();
        Handle_StepGeom_BezierCurveAndRationalBSplineCurve(const Handle_StepGeom_BezierCurveAndRationalBSplineCurve &aHandle);
        Handle_StepGeom_BezierCurveAndRationalBSplineCurve(const StepGeom_BezierCurveAndRationalBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BezierCurveAndRationalBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BezierCurveAndRationalBSplineCurve {
    StepGeom_BezierCurveAndRationalBSplineCurve* _get_reference() {
    return (StepGeom_BezierCurveAndRationalBSplineCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_BezierCurveAndRationalBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BezierCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BezierSurface;
class StepGeom_BezierSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_BezierSurface;
		%feature("autodoc", "	* Returns a BezierSurface

	:rtype: None
") StepGeom_BezierSurface;
		 StepGeom_BezierSurface ();
};


%extend StepGeom_BezierSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BezierSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BezierSurface::Handle_StepGeom_BezierSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BezierSurface;
class Handle_StepGeom_BezierSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_BezierSurface();
        Handle_StepGeom_BezierSurface(const Handle_StepGeom_BezierSurface &aHandle);
        Handle_StepGeom_BezierSurface(const StepGeom_BezierSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BezierSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BezierSurface {
    StepGeom_BezierSurface* _get_reference() {
    return (StepGeom_BezierSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_BezierSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BezierSurfaceAndRationalBSplineSurface;
class StepGeom_BezierSurfaceAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_BezierSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "	* Returns a BezierSurfaceAndRationalBSplineSurface

	:rtype: None
") StepGeom_BezierSurfaceAndRationalBSplineSurface;
		 StepGeom_BezierSurfaceAndRationalBSplineSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aBezierSurface:
	:type aBezierSurface: Handle_StepGeom_BezierSurface &
	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_StepGeom_BezierSurface & aBezierSurface,const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") SetBezierSurface;
		%feature("autodoc", "	:param aBezierSurface:
	:type aBezierSurface: Handle_StepGeom_BezierSurface &
	:rtype: None
") SetBezierSurface;
		void SetBezierSurface (const Handle_StepGeom_BezierSurface & aBezierSurface);
		%feature("compactdefaultargs") BezierSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BezierSurface
") BezierSurface;
		Handle_StepGeom_BezierSurface BezierSurface ();
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: None
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface (const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineSurface
") RationalBSplineSurface;
		Handle_StepGeom_RationalBSplineSurface RationalBSplineSurface ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") WeightsData;
		Handle_TColStd_HArray2OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataI;
		Standard_Integer NbWeightsDataI ();
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataJ;
		Standard_Integer NbWeightsDataJ ();
};


%extend StepGeom_BezierSurfaceAndRationalBSplineSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface::Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface;
class Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface();
        Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface(const Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface &aHandle);
        Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface(const StepGeom_BezierSurfaceAndRationalBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface {
    StepGeom_BezierSurfaceAndRationalBSplineSurface* _get_reference() {
    return (StepGeom_BezierSurfaceAndRationalBSplineSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_BezierSurfaceAndRationalBSplineSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BezierSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_CompositeCurveOnSurface;
class StepGeom_CompositeCurveOnSurface : public StepGeom_CompositeCurve {
	public:
		%feature("compactdefaultargs") StepGeom_CompositeCurveOnSurface;
		%feature("autodoc", "	* Returns a CompositeCurveOnSurface

	:rtype: None
") StepGeom_CompositeCurveOnSurface;
		 StepGeom_CompositeCurveOnSurface ();
};


%extend StepGeom_CompositeCurveOnSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_CompositeCurveOnSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_CompositeCurveOnSurface::Handle_StepGeom_CompositeCurveOnSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_CompositeCurveOnSurface;
class Handle_StepGeom_CompositeCurveOnSurface : public Handle_StepGeom_CompositeCurve {

    public:
        // constructors
        Handle_StepGeom_CompositeCurveOnSurface();
        Handle_StepGeom_CompositeCurveOnSurface(const Handle_StepGeom_CompositeCurveOnSurface &aHandle);
        Handle_StepGeom_CompositeCurveOnSurface(const StepGeom_CompositeCurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_CompositeCurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_CompositeCurveOnSurface {
    StepGeom_CompositeCurveOnSurface* _get_reference() {
    return (StepGeom_CompositeCurveOnSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_CompositeCurveOnSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_CompositeCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_DegenerateToroidalSurface;
class StepGeom_DegenerateToroidalSurface : public StepGeom_ToroidalSurface {
	public:
		%feature("compactdefaultargs") StepGeom_DegenerateToroidalSurface;
		%feature("autodoc", "	* Returns a DegenerateToroidalSurface

	:rtype: None
") StepGeom_DegenerateToroidalSurface;
		 StepGeom_DegenerateToroidalSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aMajorRadius:
	:type aMajorRadius: float
	:param aMinorRadius:
	:type aMinorRadius: float
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aMajorRadius,const Standard_Real aMinorRadius);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aPosition:
	:type aPosition: Handle_StepGeom_Axis2Placement3d &
	:param aMajorRadius:
	:type aMajorRadius: float
	:param aMinorRadius:
	:type aMinorRadius: float
	:param aSelectOuter:
	:type aSelectOuter: bool
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepGeom_Axis2Placement3d & aPosition,const Standard_Real aMajorRadius,const Standard_Real aMinorRadius,const Standard_Boolean aSelectOuter);
		%feature("compactdefaultargs") SetSelectOuter;
		%feature("autodoc", "	:param aSelectOuter:
	:type aSelectOuter: bool
	:rtype: None
") SetSelectOuter;
		void SetSelectOuter (const Standard_Boolean aSelectOuter);
		%feature("compactdefaultargs") SelectOuter;
		%feature("autodoc", "	:rtype: bool
") SelectOuter;
		Standard_Boolean SelectOuter ();
};


%extend StepGeom_DegenerateToroidalSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_DegenerateToroidalSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_DegenerateToroidalSurface::Handle_StepGeom_DegenerateToroidalSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_DegenerateToroidalSurface;
class Handle_StepGeom_DegenerateToroidalSurface : public Handle_StepGeom_ToroidalSurface {

    public:
        // constructors
        Handle_StepGeom_DegenerateToroidalSurface();
        Handle_StepGeom_DegenerateToroidalSurface(const Handle_StepGeom_DegenerateToroidalSurface &aHandle);
        Handle_StepGeom_DegenerateToroidalSurface(const StepGeom_DegenerateToroidalSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_DegenerateToroidalSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_DegenerateToroidalSurface {
    StepGeom_DegenerateToroidalSurface* _get_reference() {
    return (StepGeom_DegenerateToroidalSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_DegenerateToroidalSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_DegenerateToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_QuasiUniformCurve;
class StepGeom_QuasiUniformCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_QuasiUniformCurve;
		%feature("autodoc", "	* Returns a QuasiUniformCurve

	:rtype: None
") StepGeom_QuasiUniformCurve;
		 StepGeom_QuasiUniformCurve ();
};


%extend StepGeom_QuasiUniformCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_QuasiUniformCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_QuasiUniformCurve::Handle_StepGeom_QuasiUniformCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_QuasiUniformCurve;
class Handle_StepGeom_QuasiUniformCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_QuasiUniformCurve();
        Handle_StepGeom_QuasiUniformCurve(const Handle_StepGeom_QuasiUniformCurve &aHandle);
        Handle_StepGeom_QuasiUniformCurve(const StepGeom_QuasiUniformCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_QuasiUniformCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_QuasiUniformCurve {
    StepGeom_QuasiUniformCurve* _get_reference() {
    return (StepGeom_QuasiUniformCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_QuasiUniformCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_QuasiUniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_QuasiUniformCurveAndRationalBSplineCurve;
class StepGeom_QuasiUniformCurveAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_QuasiUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "	* Returns a QuasiUniformCurveAndRationalBSplineCurve

	:rtype: None
") StepGeom_QuasiUniformCurveAndRationalBSplineCurve;
		 StepGeom_QuasiUniformCurveAndRationalBSplineCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aQuasiUniformCurve:
	:type aQuasiUniformCurve: Handle_StepGeom_QuasiUniformCurve &
	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_StepGeom_QuasiUniformCurve & aQuasiUniformCurve,const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") SetQuasiUniformCurve;
		%feature("autodoc", "	:param aQuasiUniformCurve:
	:type aQuasiUniformCurve: Handle_StepGeom_QuasiUniformCurve &
	:rtype: None
") SetQuasiUniformCurve;
		void SetQuasiUniformCurve (const Handle_StepGeom_QuasiUniformCurve & aQuasiUniformCurve);
		%feature("compactdefaultargs") QuasiUniformCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_QuasiUniformCurve
") QuasiUniformCurve;
		Handle_StepGeom_QuasiUniformCurve QuasiUniformCurve ();
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: None
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve (const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineCurve
") RationalBSplineCurve;
		Handle_StepGeom_RationalBSplineCurve RationalBSplineCurve ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") WeightsData;
		Handle_TColStd_HArray1OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "	:rtype: int
") NbWeightsData;
		Standard_Integer NbWeightsData ();
};


%extend StepGeom_QuasiUniformCurveAndRationalBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve::Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve;
class Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve();
        Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve(const Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve &aHandle);
        Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve(const StepGeom_QuasiUniformCurveAndRationalBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve {
    StepGeom_QuasiUniformCurveAndRationalBSplineCurve* _get_reference() {
    return (StepGeom_QuasiUniformCurveAndRationalBSplineCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_QuasiUniformCurveAndRationalBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_QuasiUniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_QuasiUniformSurface;
class StepGeom_QuasiUniformSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_QuasiUniformSurface;
		%feature("autodoc", "	* Returns a QuasiUniformSurface

	:rtype: None
") StepGeom_QuasiUniformSurface;
		 StepGeom_QuasiUniformSurface ();
};


%extend StepGeom_QuasiUniformSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_QuasiUniformSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_QuasiUniformSurface::Handle_StepGeom_QuasiUniformSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_QuasiUniformSurface;
class Handle_StepGeom_QuasiUniformSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_QuasiUniformSurface();
        Handle_StepGeom_QuasiUniformSurface(const Handle_StepGeom_QuasiUniformSurface &aHandle);
        Handle_StepGeom_QuasiUniformSurface(const StepGeom_QuasiUniformSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_QuasiUniformSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_QuasiUniformSurface {
    StepGeom_QuasiUniformSurface* _get_reference() {
    return (StepGeom_QuasiUniformSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_QuasiUniformSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_QuasiUniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface;
class StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "	* Returns a QuasiUniformSurfaceAndRationalBSplineSurface

	:rtype: None
") StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface;
		 StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aQuasiUniformSurface:
	:type aQuasiUniformSurface: Handle_StepGeom_QuasiUniformSurface &
	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_StepGeom_QuasiUniformSurface & aQuasiUniformSurface,const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") SetQuasiUniformSurface;
		%feature("autodoc", "	:param aQuasiUniformSurface:
	:type aQuasiUniformSurface: Handle_StepGeom_QuasiUniformSurface &
	:rtype: None
") SetQuasiUniformSurface;
		void SetQuasiUniformSurface (const Handle_StepGeom_QuasiUniformSurface & aQuasiUniformSurface);
		%feature("compactdefaultargs") QuasiUniformSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_QuasiUniformSurface
") QuasiUniformSurface;
		Handle_StepGeom_QuasiUniformSurface QuasiUniformSurface ();
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: None
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface (const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineSurface
") RationalBSplineSurface;
		Handle_StepGeom_RationalBSplineSurface RationalBSplineSurface ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") WeightsData;
		Handle_TColStd_HArray2OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataI;
		Standard_Integer NbWeightsDataI ();
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataJ;
		Standard_Integer NbWeightsDataJ ();
};


%extend StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface;
class Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface();
        Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface(const Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface &aHandle);
        Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface(const StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface {
    StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface* _get_reference() {
    return (StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_RationalBSplineCurve;
class StepGeom_RationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_RationalBSplineCurve;
		%feature("autodoc", "	* Returns a RationalBSplineCurve

	:rtype: None
") StepGeom_RationalBSplineCurve;
		 StepGeom_RationalBSplineCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") WeightsData;
		Handle_TColStd_HArray1OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "	:rtype: int
") NbWeightsData;
		Standard_Integer NbWeightsData ();
};


%extend StepGeom_RationalBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_RationalBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_RationalBSplineCurve::Handle_StepGeom_RationalBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_RationalBSplineCurve;
class Handle_StepGeom_RationalBSplineCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_RationalBSplineCurve();
        Handle_StepGeom_RationalBSplineCurve(const Handle_StepGeom_RationalBSplineCurve &aHandle);
        Handle_StepGeom_RationalBSplineCurve(const StepGeom_RationalBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_RationalBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_RationalBSplineCurve {
    StepGeom_RationalBSplineCurve* _get_reference() {
    return (StepGeom_RationalBSplineCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_RationalBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_RationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_RationalBSplineSurface;
class StepGeom_RationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_RationalBSplineSurface;
		%feature("autodoc", "	* Returns a RationalBSplineSurface

	:rtype: None
") StepGeom_RationalBSplineSurface;
		 StepGeom_RationalBSplineSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") WeightsData;
		Handle_TColStd_HArray2OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataI;
		Standard_Integer NbWeightsDataI ();
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataJ;
		Standard_Integer NbWeightsDataJ ();
};


%extend StepGeom_RationalBSplineSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_RationalBSplineSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_RationalBSplineSurface::Handle_StepGeom_RationalBSplineSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_RationalBSplineSurface;
class Handle_StepGeom_RationalBSplineSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_RationalBSplineSurface();
        Handle_StepGeom_RationalBSplineSurface(const Handle_StepGeom_RationalBSplineSurface &aHandle);
        Handle_StepGeom_RationalBSplineSurface(const StepGeom_RationalBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_RationalBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_RationalBSplineSurface {
    StepGeom_RationalBSplineSurface* _get_reference() {
    return (StepGeom_RationalBSplineSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_RationalBSplineSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_RationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_UniformCurve;
class StepGeom_UniformCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_UniformCurve;
		%feature("autodoc", "	* Returns a UniformCurve

	:rtype: None
") StepGeom_UniformCurve;
		 StepGeom_UniformCurve ();
};


%extend StepGeom_UniformCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_UniformCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_UniformCurve::Handle_StepGeom_UniformCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_UniformCurve;
class Handle_StepGeom_UniformCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_UniformCurve();
        Handle_StepGeom_UniformCurve(const Handle_StepGeom_UniformCurve &aHandle);
        Handle_StepGeom_UniformCurve(const StepGeom_UniformCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_UniformCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_UniformCurve {
    StepGeom_UniformCurve* _get_reference() {
    return (StepGeom_UniformCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_UniformCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_UniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_UniformCurveAndRationalBSplineCurve;
class StepGeom_UniformCurveAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		%feature("compactdefaultargs") StepGeom_UniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "	* Returns a UniformCurveAndRationalBSplineCurve

	:rtype: None
") StepGeom_UniformCurveAndRationalBSplineCurve;
		 StepGeom_UniformCurveAndRationalBSplineCurve ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aUniformCurve:
	:type aUniformCurve: Handle_StepGeom_UniformCurve &
	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_StepGeom_UniformCurve & aUniformCurve,const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDegree:
	:type aDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray1OfCartesianPoint &
	:param aCurveForm:
	:type aCurveForm: StepGeom_BSplineCurveForm
	:param aClosedCurve:
	:type aClosedCurve: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aDegree,const Handle_StepGeom_HArray1OfCartesianPoint & aControlPointsList,const StepGeom_BSplineCurveForm aCurveForm,const StepData_Logical aClosedCurve,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") SetUniformCurve;
		%feature("autodoc", "	:param aUniformCurve:
	:type aUniformCurve: Handle_StepGeom_UniformCurve &
	:rtype: None
") SetUniformCurve;
		void SetUniformCurve (const Handle_StepGeom_UniformCurve & aUniformCurve);
		%feature("compactdefaultargs") UniformCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_UniformCurve
") UniformCurve;
		Handle_StepGeom_UniformCurve UniformCurve ();
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "	:param aRationalBSplineCurve:
	:type aRationalBSplineCurve: Handle_StepGeom_RationalBSplineCurve &
	:rtype: None
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve (const Handle_StepGeom_RationalBSplineCurve & aRationalBSplineCurve);
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineCurve
") RationalBSplineCurve;
		Handle_StepGeom_RationalBSplineCurve RationalBSplineCurve ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray1OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray1OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray1OfReal
") WeightsData;
		Handle_TColStd_HArray1OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "	:rtype: int
") NbWeightsData;
		Standard_Integer NbWeightsData ();
};


%extend StepGeom_UniformCurveAndRationalBSplineCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_UniformCurveAndRationalBSplineCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_UniformCurveAndRationalBSplineCurve::Handle_StepGeom_UniformCurveAndRationalBSplineCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_UniformCurveAndRationalBSplineCurve;
class Handle_StepGeom_UniformCurveAndRationalBSplineCurve : public Handle_StepGeom_BSplineCurve {

    public:
        // constructors
        Handle_StepGeom_UniformCurveAndRationalBSplineCurve();
        Handle_StepGeom_UniformCurveAndRationalBSplineCurve(const Handle_StepGeom_UniformCurveAndRationalBSplineCurve &aHandle);
        Handle_StepGeom_UniformCurveAndRationalBSplineCurve(const StepGeom_UniformCurveAndRationalBSplineCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_UniformCurveAndRationalBSplineCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_UniformCurveAndRationalBSplineCurve {
    StepGeom_UniformCurveAndRationalBSplineCurve* _get_reference() {
    return (StepGeom_UniformCurveAndRationalBSplineCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_UniformCurveAndRationalBSplineCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_UniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_UniformSurface;
class StepGeom_UniformSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_UniformSurface;
		%feature("autodoc", "	* Returns a UniformSurface

	:rtype: None
") StepGeom_UniformSurface;
		 StepGeom_UniformSurface ();
};


%extend StepGeom_UniformSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_UniformSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_UniformSurface::Handle_StepGeom_UniformSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_UniformSurface;
class Handle_StepGeom_UniformSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_UniformSurface();
        Handle_StepGeom_UniformSurface(const Handle_StepGeom_UniformSurface &aHandle);
        Handle_StepGeom_UniformSurface(const StepGeom_UniformSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_UniformSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_UniformSurface {
    StepGeom_UniformSurface* _get_reference() {
    return (StepGeom_UniformSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_UniformSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_UniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_UniformSurfaceAndRationalBSplineSurface;
class StepGeom_UniformSurfaceAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		%feature("compactdefaultargs") StepGeom_UniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "	* Returns a UniformSurfaceAndRationalBSplineSurface

	:rtype: None
") StepGeom_UniformSurfaceAndRationalBSplineSurface;
		 StepGeom_UniformSurfaceAndRationalBSplineSurface ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aUniformSurface:
	:type aUniformSurface: Handle_StepGeom_UniformSurface &
	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_StepGeom_UniformSurface & aUniformSurface,const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aUDegree:
	:type aUDegree: int
	:param aVDegree:
	:type aVDegree: int
	:param aControlPointsList:
	:type aControlPointsList: Handle_StepGeom_HArray2OfCartesianPoint &
	:param aSurfaceForm:
	:type aSurfaceForm: StepGeom_BSplineSurfaceForm
	:param aUClosed:
	:type aUClosed: StepData_Logical
	:param aVClosed:
	:type aVClosed: StepData_Logical
	:param aSelfIntersect:
	:type aSelfIntersect: StepData_Logical
	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Integer aUDegree,const Standard_Integer aVDegree,const Handle_StepGeom_HArray2OfCartesianPoint & aControlPointsList,const StepGeom_BSplineSurfaceForm aSurfaceForm,const StepData_Logical aUClosed,const StepData_Logical aVClosed,const StepData_Logical aSelfIntersect,const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") SetUniformSurface;
		%feature("autodoc", "	:param aUniformSurface:
	:type aUniformSurface: Handle_StepGeom_UniformSurface &
	:rtype: None
") SetUniformSurface;
		void SetUniformSurface (const Handle_StepGeom_UniformSurface & aUniformSurface);
		%feature("compactdefaultargs") UniformSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_UniformSurface
") UniformSurface;
		Handle_StepGeom_UniformSurface UniformSurface ();
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "	:param aRationalBSplineSurface:
	:type aRationalBSplineSurface: Handle_StepGeom_RationalBSplineSurface &
	:rtype: None
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface (const Handle_StepGeom_RationalBSplineSurface & aRationalBSplineSurface);
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RationalBSplineSurface
") RationalBSplineSurface;
		Handle_StepGeom_RationalBSplineSurface RationalBSplineSurface ();
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "	:param aWeightsData:
	:type aWeightsData: Handle_TColStd_HArray2OfReal &
	:rtype: None
") SetWeightsData;
		void SetWeightsData (const Handle_TColStd_HArray2OfReal & aWeightsData);
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "	:rtype: Handle_TColStd_HArray2OfReal
") WeightsData;
		Handle_TColStd_HArray2OfReal WeightsData ();
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "	:param num1:
	:type num1: int
	:param num2:
	:type num2: int
	:rtype: float
") WeightsDataValue;
		Standard_Real WeightsDataValue (const Standard_Integer num1,const Standard_Integer num2);
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataI;
		Standard_Integer NbWeightsDataI ();
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "	:rtype: int
") NbWeightsDataJ;
		Standard_Integer NbWeightsDataJ ();
};


%extend StepGeom_UniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface::Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface;
class Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface : public Handle_StepGeom_BSplineSurface {

    public:
        // constructors
        Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface();
        Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface(const Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface &aHandle);
        Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface(const StepGeom_UniformSurfaceAndRationalBSplineSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface {
    StepGeom_UniformSurfaceAndRationalBSplineSurface* _get_reference() {
    return (StepGeom_UniformSurfaceAndRationalBSplineSurface*)$self->Access();
    }
};

%extend Handle_StepGeom_UniformSurfaceAndRationalBSplineSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_UniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_BoundaryCurve;
class StepGeom_BoundaryCurve : public StepGeom_CompositeCurveOnSurface {
	public:
		%feature("compactdefaultargs") StepGeom_BoundaryCurve;
		%feature("autodoc", "	* Returns a BoundaryCurve

	:rtype: None
") StepGeom_BoundaryCurve;
		 StepGeom_BoundaryCurve ();
};


%extend StepGeom_BoundaryCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_BoundaryCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_BoundaryCurve::Handle_StepGeom_BoundaryCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_BoundaryCurve;
class Handle_StepGeom_BoundaryCurve : public Handle_StepGeom_CompositeCurveOnSurface {

    public:
        // constructors
        Handle_StepGeom_BoundaryCurve();
        Handle_StepGeom_BoundaryCurve(const Handle_StepGeom_BoundaryCurve &aHandle);
        Handle_StepGeom_BoundaryCurve(const StepGeom_BoundaryCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_BoundaryCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_BoundaryCurve {
    StepGeom_BoundaryCurve* _get_reference() {
    return (StepGeom_BoundaryCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_BoundaryCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_BoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepGeom_OuterBoundaryCurve;
class StepGeom_OuterBoundaryCurve : public StepGeom_BoundaryCurve {
	public:
		%feature("compactdefaultargs") StepGeom_OuterBoundaryCurve;
		%feature("autodoc", "	* Returns a OuterBoundaryCurve

	:rtype: None
") StepGeom_OuterBoundaryCurve;
		 StepGeom_OuterBoundaryCurve ();
};


%extend StepGeom_OuterBoundaryCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StepGeom_OuterBoundaryCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StepGeom_OuterBoundaryCurve::Handle_StepGeom_OuterBoundaryCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_StepGeom_OuterBoundaryCurve;
class Handle_StepGeom_OuterBoundaryCurve : public Handle_StepGeom_BoundaryCurve {

    public:
        // constructors
        Handle_StepGeom_OuterBoundaryCurve();
        Handle_StepGeom_OuterBoundaryCurve(const Handle_StepGeom_OuterBoundaryCurve &aHandle);
        Handle_StepGeom_OuterBoundaryCurve(const StepGeom_OuterBoundaryCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StepGeom_OuterBoundaryCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepGeom_OuterBoundaryCurve {
    StepGeom_OuterBoundaryCurve* _get_reference() {
    return (StepGeom_OuterBoundaryCurve*)$self->Access();
    }
};

%extend Handle_StepGeom_OuterBoundaryCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StepGeom_OuterBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
