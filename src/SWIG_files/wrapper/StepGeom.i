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
%define STEPGEOMDOCSTRING
"-Purpose : AP214 CC1 , Revision 4 for Geom (Part42, geometric)
Upgrading from Revision 2 to Revision 4 : 26 Mar 1997
"
%enddef
%module (package="OCC.Core", docstring=STEPGEOMDOCSTRING) StepGeom

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
%include ../common/OccHandle.i


%include StepGeom_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum StepGeom_KnotType {
	StepGeom_ktUniformKnots = 0,
	StepGeom_ktUnspecified = 1,
	StepGeom_ktQuasiUniformKnots = 2,
	StepGeom_ktPiecewiseBezierKnots = 3,
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

enum StepGeom_BSplineCurveForm {
	StepGeom_bscfPolylineForm = 0,
	StepGeom_bscfCircularArc = 1,
	StepGeom_bscfEllipticArc = 2,
	StepGeom_bscfParabolicArc = 3,
	StepGeom_bscfHyperbolicArc = 4,
	StepGeom_bscfUnspecified = 5,
};

enum StepGeom_TrimmingPreference {
	StepGeom_tpCartesian = 0,
	StepGeom_tpParameter = 1,
	StepGeom_tpUnspecified = 2,
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

/* end public enums declaration */

%wrap_handle(StepGeom_CompositeCurveSegment)
%wrap_handle(StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx)
%wrap_handle(StepGeom_GeometricRepresentationContext)
%wrap_handle(StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext)
%wrap_handle(StepGeom_GeometricRepresentationContextAndParametricRepresentationContext)
%wrap_handle(StepGeom_GeometricRepresentationItem)
%wrap_handle(StepGeom_HArray1OfBoundaryCurve)
%wrap_handle(StepGeom_HArray1OfCartesianPoint)
%wrap_handle(StepGeom_HArray1OfCompositeCurveSegment)
%wrap_handle(StepGeom_HArray1OfCurve)
%wrap_handle(StepGeom_HArray1OfPcurveOrSurface)
%wrap_handle(StepGeom_HArray1OfSurfaceBoundary)
%wrap_handle(StepGeom_HArray1OfTrimmingSelect)
%wrap_handle(StepGeom_HArray2OfCartesianPoint)
%wrap_handle(StepGeom_HArray2OfSurfacePatch)
%wrap_handle(StepGeom_SurfacePatch)
%wrap_handle(StepGeom_TrimmingMember)
%wrap_handle(StepGeom_CartesianTransformationOperator)
%wrap_handle(StepGeom_Curve)
%wrap_handle(StepGeom_Direction)
%wrap_handle(StepGeom_Placement)
%wrap_handle(StepGeom_Point)
%wrap_handle(StepGeom_ReparametrisedCompositeCurveSegment)
%wrap_handle(StepGeom_Surface)
%wrap_handle(StepGeom_Vector)
%wrap_handle(StepGeom_Axis1Placement)
%wrap_handle(StepGeom_Axis2Placement2d)
%wrap_handle(StepGeom_Axis2Placement3d)
%wrap_handle(StepGeom_BoundedCurve)
%wrap_handle(StepGeom_BoundedSurface)
%wrap_handle(StepGeom_CartesianPoint)
%wrap_handle(StepGeom_CartesianTransformationOperator2d)
%wrap_handle(StepGeom_CartesianTransformationOperator3d)
%wrap_handle(StepGeom_Conic)
%wrap_handle(StepGeom_CurveReplica)
%wrap_handle(StepGeom_DegeneratePcurve)
%wrap_handle(StepGeom_ElementarySurface)
%wrap_handle(StepGeom_Line)
%wrap_handle(StepGeom_OffsetCurve3d)
%wrap_handle(StepGeom_OffsetSurface)
%wrap_handle(StepGeom_OrientedSurface)
%wrap_handle(StepGeom_Pcurve)
%wrap_handle(StepGeom_PointOnCurve)
%wrap_handle(StepGeom_PointOnSurface)
%wrap_handle(StepGeom_PointReplica)
%wrap_handle(StepGeom_SurfaceCurve)
%wrap_handle(StepGeom_SurfaceReplica)
%wrap_handle(StepGeom_SweptSurface)
%wrap_handle(StepGeom_BSplineCurve)
%wrap_handle(StepGeom_BSplineSurface)
%wrap_handle(StepGeom_Circle)
%wrap_handle(StepGeom_CompositeCurve)
%wrap_handle(StepGeom_ConicalSurface)
%wrap_handle(StepGeom_CurveBoundedSurface)
%wrap_handle(StepGeom_CylindricalSurface)
%wrap_handle(StepGeom_Ellipse)
%wrap_handle(StepGeom_EvaluatedDegeneratePcurve)
%wrap_handle(StepGeom_Hyperbola)
%wrap_handle(StepGeom_IntersectionCurve)
%wrap_handle(StepGeom_Parabola)
%wrap_handle(StepGeom_Plane)
%wrap_handle(StepGeom_Polyline)
%wrap_handle(StepGeom_RectangularCompositeSurface)
%wrap_handle(StepGeom_RectangularTrimmedSurface)
%wrap_handle(StepGeom_SeamCurve)
%wrap_handle(StepGeom_SphericalSurface)
%wrap_handle(StepGeom_SurfaceCurveAndBoundedCurve)
%wrap_handle(StepGeom_SurfaceOfLinearExtrusion)
%wrap_handle(StepGeom_SurfaceOfRevolution)
%wrap_handle(StepGeom_ToroidalSurface)
%wrap_handle(StepGeom_TrimmedCurve)
%wrap_handle(StepGeom_BSplineCurveWithKnots)
%wrap_handle(StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve)
%wrap_handle(StepGeom_BSplineSurfaceWithKnots)
%wrap_handle(StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface)
%wrap_handle(StepGeom_BezierCurve)
%wrap_handle(StepGeom_BezierCurveAndRationalBSplineCurve)
%wrap_handle(StepGeom_BezierSurface)
%wrap_handle(StepGeom_BezierSurfaceAndRationalBSplineSurface)
%wrap_handle(StepGeom_CompositeCurveOnSurface)
%wrap_handle(StepGeom_DegenerateToroidalSurface)
%wrap_handle(StepGeom_QuasiUniformCurve)
%wrap_handle(StepGeom_QuasiUniformCurveAndRationalBSplineCurve)
%wrap_handle(StepGeom_QuasiUniformSurface)
%wrap_handle(StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface)
%wrap_handle(StepGeom_RationalBSplineCurve)
%wrap_handle(StepGeom_RationalBSplineSurface)
%wrap_handle(StepGeom_UniformCurve)
%wrap_handle(StepGeom_UniformCurveAndRationalBSplineCurve)
%wrap_handle(StepGeom_UniformSurface)
%wrap_handle(StepGeom_UniformSurfaceAndRationalBSplineSurface)
%wrap_handle(StepGeom_BoundaryCurve)
%wrap_handle(StepGeom_OuterBoundaryCurve)

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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
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


%make_alias(StepGeom_CompositeCurveSegment)

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


%make_alias(StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx)

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


%make_alias(StepGeom_GeometricRepresentationContext)

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


%make_alias(StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext)

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


%make_alias(StepGeom_GeometricRepresentationContextAndParametricRepresentationContext)

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


%make_alias(StepGeom_GeometricRepresentationItem)

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


%make_alias(StepGeom_HArray1OfBoundaryCurve)


%extend StepGeom_HArray1OfBoundaryCurve {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray1OfCartesianPoint)


%extend StepGeom_HArray1OfCartesianPoint {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray1OfCompositeCurveSegment)


%extend StepGeom_HArray1OfCompositeCurveSegment {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray1OfCurve)


%extend StepGeom_HArray1OfCurve {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray1OfPcurveOrSurface)


%extend StepGeom_HArray1OfPcurveOrSurface {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray1OfSurfaceBoundary)


%extend StepGeom_HArray1OfSurfaceBoundary {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray1OfTrimmingSelect)


%extend StepGeom_HArray1OfTrimmingSelect {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current +=1
        return self.Value(self.current)

    __next__ = next

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


%make_alias(StepGeom_HArray2OfCartesianPoint)

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


%make_alias(StepGeom_HArray2OfSurfacePatch)

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


%make_alias(StepGeom_SurfacePatch)

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


%make_alias(StepGeom_TrimmingMember)

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


%make_alias(StepGeom_CartesianTransformationOperator)

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


%make_alias(StepGeom_Curve)

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


%make_alias(StepGeom_Direction)

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


%make_alias(StepGeom_Placement)

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


%make_alias(StepGeom_Point)

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


%make_alias(StepGeom_ReparametrisedCompositeCurveSegment)

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


%make_alias(StepGeom_Surface)

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


%make_alias(StepGeom_Vector)

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


%make_alias(StepGeom_Axis1Placement)

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


%make_alias(StepGeom_Axis2Placement2d)

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


%make_alias(StepGeom_Axis2Placement3d)

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


%make_alias(StepGeom_BoundedCurve)

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


%make_alias(StepGeom_BoundedSurface)

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


%make_alias(StepGeom_CartesianPoint)

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


%make_alias(StepGeom_CartesianTransformationOperator2d)

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


%make_alias(StepGeom_CartesianTransformationOperator3d)

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


%make_alias(StepGeom_Conic)

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


%make_alias(StepGeom_CurveReplica)

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


%make_alias(StepGeom_DegeneratePcurve)

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


%make_alias(StepGeom_ElementarySurface)

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


%make_alias(StepGeom_Line)

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


%make_alias(StepGeom_OffsetCurve3d)

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


%make_alias(StepGeom_OffsetSurface)

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


%make_alias(StepGeom_OrientedSurface)

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


%make_alias(StepGeom_Pcurve)

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


%make_alias(StepGeom_PointOnCurve)

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


%make_alias(StepGeom_PointOnSurface)

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


%make_alias(StepGeom_PointReplica)

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


%make_alias(StepGeom_SurfaceCurve)

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


%make_alias(StepGeom_SurfaceReplica)

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


%make_alias(StepGeom_SweptSurface)

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


%make_alias(StepGeom_BSplineCurve)

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


%make_alias(StepGeom_BSplineSurface)

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


%make_alias(StepGeom_Circle)

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


%make_alias(StepGeom_CompositeCurve)

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


%make_alias(StepGeom_ConicalSurface)

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


%make_alias(StepGeom_CurveBoundedSurface)

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


%make_alias(StepGeom_CylindricalSurface)

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


%make_alias(StepGeom_Ellipse)

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


%make_alias(StepGeom_EvaluatedDegeneratePcurve)

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


%make_alias(StepGeom_Hyperbola)

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


%make_alias(StepGeom_IntersectionCurve)

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


%make_alias(StepGeom_Parabola)

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


%make_alias(StepGeom_Plane)

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


%make_alias(StepGeom_Polyline)

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


%make_alias(StepGeom_RectangularCompositeSurface)

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


%make_alias(StepGeom_RectangularTrimmedSurface)

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


%make_alias(StepGeom_SeamCurve)

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


%make_alias(StepGeom_SphericalSurface)

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


%make_alias(StepGeom_SurfaceCurveAndBoundedCurve)

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


%make_alias(StepGeom_SurfaceOfLinearExtrusion)

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


%make_alias(StepGeom_SurfaceOfRevolution)

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


%make_alias(StepGeom_ToroidalSurface)

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


%make_alias(StepGeom_TrimmedCurve)

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


%make_alias(StepGeom_BSplineCurveWithKnots)

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


%make_alias(StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve)

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


%make_alias(StepGeom_BSplineSurfaceWithKnots)

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


%make_alias(StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface)

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


%make_alias(StepGeom_BezierCurve)

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


%make_alias(StepGeom_BezierCurveAndRationalBSplineCurve)

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


%make_alias(StepGeom_BezierSurface)

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


%make_alias(StepGeom_BezierSurfaceAndRationalBSplineSurface)

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


%make_alias(StepGeom_CompositeCurveOnSurface)

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


%make_alias(StepGeom_DegenerateToroidalSurface)

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


%make_alias(StepGeom_QuasiUniformCurve)

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


%make_alias(StepGeom_QuasiUniformCurveAndRationalBSplineCurve)

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


%make_alias(StepGeom_QuasiUniformSurface)

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


%make_alias(StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface)

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


%make_alias(StepGeom_RationalBSplineCurve)

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


%make_alias(StepGeom_RationalBSplineSurface)

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


%make_alias(StepGeom_UniformCurve)

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


%make_alias(StepGeom_UniformCurveAndRationalBSplineCurve)

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


%make_alias(StepGeom_UniformSurface)

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


%make_alias(StepGeom_UniformSurfaceAndRationalBSplineSurface)

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


%make_alias(StepGeom_BoundaryCurve)

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


%make_alias(StepGeom_OuterBoundaryCurve)

%extend StepGeom_OuterBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
