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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- time : 2019-11-03 11:38:09
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define GEOMFILLDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=GEOMFILLDOCSTRING) GeomFill

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include GeomFill_headers.i

/* public enums */
enum GeomFill_ApproxStyle {
	GeomFill_Section = 0,
	GeomFill_Location = 1,
};

enum GeomFill_Trihedron {
	GeomFill_IsCorrectedFrenet = 0,
	GeomFill_IsFixed = 1,
	GeomFill_IsFrenet = 2,
	GeomFill_IsConstantNormal = 3,
	GeomFill_IsDarboux = 4,
	GeomFill_IsGuideAC = 5,
	GeomFill_IsGuidePlan = 6,
	GeomFill_IsGuideACWithContact = 7,
	GeomFill_IsGuidePlanWithContact = 8,
	GeomFill_IsDiscreteTrihedron = 9,
};

enum GeomFill_FillingStyle {
	GeomFill_StretchStyle = 0,
	GeomFill_CoonsStyle = 1,
	GeomFill_CurvedStyle = 2,
};

enum GeomFill_PipeError {
	GeomFill_PipeOk = 0,
	GeomFill_PipeNotOk = 1,
	GeomFill_PlaneNotIntersectGuide = 2,
	GeomFill_ImpossibleContact = 3,
};

/* end public enums declaration */

/* templates */
%template(GeomFill_SequenceOfTrsf) NCollection_Sequence <gp_Trsf>;
%template(GeomFill_Array1OfLocationLaw) NCollection_Array1 <opencascade::handle <GeomFill_LocationLaw>>;

%extend NCollection_Array1 <opencascade::handle <GeomFill_LocationLaw>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(GeomFill_Array1OfSectionLaw) NCollection_Array1 <opencascade::handle <GeomFill_SectionLaw>>;

%extend NCollection_Array1 <opencascade::handle <GeomFill_SectionLaw>> {
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
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(GeomFill_SequenceOfAx2) NCollection_Sequence <gp_Ax2>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <gp_Trsf> GeomFill_SequenceOfTrsf;
typedef NCollection_Array1 <opencascade::handle <GeomFill_LocationLaw>> GeomFill_Array1OfLocationLaw;
typedef NCollection_Array1 <opencascade::handle <GeomFill_SectionLaw>> GeomFill_Array1OfSectionLaw;
typedef NCollection_Sequence <gp_Ax2> GeomFill_SequenceOfAx2;
/* end typedefs declaration */

/* handles */
%wrap_handle(GeomFill_Boundary)
%wrap_handle(GeomFill_CircularBlendFunc)
%wrap_handle(GeomFill_CoonsAlgPatch)
%wrap_handle(GeomFill_Line)
%wrap_handle(GeomFill_LocationLaw)
%wrap_handle(GeomFill_SectionLaw)
%wrap_handle(GeomFill_SweepFunction)
%wrap_handle(GeomFill_TgtField)
%wrap_handle(GeomFill_TrihedronLaw)
%wrap_handle(GeomFill_BoundWithSurf)
%wrap_handle(GeomFill_ConstantBiNormal)
%wrap_handle(GeomFill_CorrectedFrenet)
%wrap_handle(GeomFill_CurveAndTrihedron)
%wrap_handle(GeomFill_Darboux)
%wrap_handle(GeomFill_DegeneratedBound)
%wrap_handle(GeomFill_DiscreteTrihedron)
%wrap_handle(GeomFill_DraftTrihedron)
%wrap_handle(GeomFill_EvolvedSection)
%wrap_handle(GeomFill_Fixed)
%wrap_handle(GeomFill_Frenet)
%wrap_handle(GeomFill_LocationDraft)
%wrap_handle(GeomFill_LocationGuide)
%wrap_handle(GeomFill_SimpleBound)
%wrap_handle(GeomFill_TgtOnCoons)
%wrap_handle(GeomFill_TrihedronWithGuide)
%wrap_handle(GeomFill_UniformSection)
%wrap_handle(GeomFill_GuideTrihedronAC)
%wrap_handle(GeomFill_GuideTrihedronPlan)
/* end handles declaration */

%rename(geomfill) GeomFill;
class GeomFill {
	public:
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "	:param TConv:
	:type TConv: Convert_ParameterisationType
	:param ns1:
	:type ns1: gp_Vec
	:param ns2:
	:type ns2: gp_Vec
	:param nplan:
	:type nplan: gp_Vec
	:param pt1:
	:type pt1: gp_Pnt
	:param pt2:
	:type pt2: gp_Pnt
	:param Rayon:
	:type Rayon: float
	:param Center:
	:type Center: gp_Pnt
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetCircle;
		static void GetCircle (const Convert_ParameterisationType TConv,const gp_Vec & ns1,const gp_Vec & ns2,const gp_Vec & nplan,const gp_Pnt & pt1,const gp_Pnt & pt2,const Standard_Real Rayon,const gp_Pnt & Center,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "	:param TConv:
	:type TConv: Convert_ParameterisationType
	:param ns1:
	:type ns1: gp_Vec
	:param ns2:
	:type ns2: gp_Vec
	:param dn1w:
	:type dn1w: gp_Vec
	:param dn2w:
	:type dn2w: gp_Vec
	:param nplan:
	:type nplan: gp_Vec
	:param dnplan:
	:type dnplan: gp_Vec
	:param pts1:
	:type pts1: gp_Pnt
	:param pts2:
	:type pts2: gp_Pnt
	:param tang1:
	:type tang1: gp_Vec
	:param tang2:
	:type tang2: gp_Vec
	:param Rayon:
	:type Rayon: float
	:param DRayon:
	:type DRayon: float
	:param Center:
	:type Center: gp_Pnt
	:param DCenter:
	:type DCenter: gp_Vec
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") GetCircle;
		static Standard_Boolean GetCircle (const Convert_ParameterisationType TConv,const gp_Vec & ns1,const gp_Vec & ns2,const gp_Vec & dn1w,const gp_Vec & dn2w,const gp_Vec & nplan,const gp_Vec & dnplan,const gp_Pnt & pts1,const gp_Pnt & pts2,const gp_Vec & tang1,const gp_Vec & tang2,const Standard_Real Rayon,const Standard_Real DRayon,const gp_Pnt & Center,const gp_Vec & DCenter,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "	:param TConv:
	:type TConv: Convert_ParameterisationType
	:param ns1:
	:type ns1: gp_Vec
	:param ns2:
	:type ns2: gp_Vec
	:param dn1w:
	:type dn1w: gp_Vec
	:param dn2w:
	:type dn2w: gp_Vec
	:param d2n1w:
	:type d2n1w: gp_Vec
	:param d2n2w:
	:type d2n2w: gp_Vec
	:param nplan:
	:type nplan: gp_Vec
	:param dnplan:
	:type dnplan: gp_Vec
	:param d2nplan:
	:type d2nplan: gp_Vec
	:param pts1:
	:type pts1: gp_Pnt
	:param pts2:
	:type pts2: gp_Pnt
	:param tang1:
	:type tang1: gp_Vec
	:param tang2:
	:type tang2: gp_Vec
	:param Dtang1:
	:type Dtang1: gp_Vec
	:param Dtang2:
	:type Dtang2: gp_Vec
	:param Rayon:
	:type Rayon: float
	:param DRayon:
	:type DRayon: float
	:param D2Rayon:
	:type D2Rayon: float
	:param Center:
	:type Center: gp_Pnt
	:param DCenter:
	:type DCenter: gp_Vec
	:param D2Center:
	:type D2Center: gp_Vec
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") GetCircle;
		static Standard_Boolean GetCircle (const Convert_ParameterisationType TConv,const gp_Vec & ns1,const gp_Vec & ns2,const gp_Vec & dn1w,const gp_Vec & dn2w,const gp_Vec & d2n1w,const gp_Vec & d2n2w,const gp_Vec & nplan,const gp_Vec & dnplan,const gp_Vec & d2nplan,const gp_Pnt & pts1,const gp_Pnt & pts2,const gp_Vec & tang1,const gp_Vec & tang2,const gp_Vec & Dtang1,const gp_Vec & Dtang2,const Standard_Real Rayon,const Standard_Real DRayon,const Standard_Real D2Rayon,const gp_Pnt & Center,const gp_Vec & DCenter,const gp_Vec & D2Center,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "	:param TConv:
	:type TConv: Convert_ParameterisationType
	:param AngleMin:
	:type AngleMin: float
	:param AngleMax:
	:type AngleMax: float
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeights;
		static void GetMinimalWeights (const Convert_ParameterisationType TConv,const Standard_Real AngleMin,const Standard_Real AngleMax,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param MaxAng:
	:type MaxAng: float
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param TypeConv:
	:type TypeConv: Convert_ParameterisationType &
	:rtype: void
") GetShape;
		static void GetShape (const Standard_Real MaxAng,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Convert_ParameterisationType & TypeConv);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Used by the generical classes to determine Tolerance for approximation

	:param TConv:
	:type TConv: Convert_ParameterisationType
	:param AngleMin:
	:type AngleMin: float
	:param Radius:
	:type Radius: float
	:param AngularTol:
	:type AngularTol: float
	:param SpatialTol:
	:type SpatialTol: float
	:rtype: float
") GetTolerance;
		static Standard_Real GetTolerance (const Convert_ParameterisationType TConv,const Standard_Real AngleMin,const Standard_Real Radius,const Standard_Real AngularTol,const Standard_Real SpatialTol);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TypeConv:
	:type TypeConv: Convert_ParameterisationType
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		static void Knots (const Convert_ParameterisationType TypeConv,TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TypeConv:
	:type TypeConv: Convert_ParameterisationType
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		static void Mults (const Convert_ParameterisationType TypeConv,TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Builds a ruled surface between the two curves, Curve1 and Curve2.

	:param Curve1:
	:type Curve1: opencascade::handle<Geom_Curve> &
	:param Curve2:
	:type Curve2: opencascade::handle<Geom_Curve> &
	:rtype: opencascade::handle<Geom_Surface>
") Surface;
		static opencascade::handle<Geom_Surface> Surface (const opencascade::handle<Geom_Curve> & Curve1,const opencascade::handle<Geom_Curve> & Curve2);
};


%extend GeomFill {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_AppSurf;
class GeomFill_AppSurf : public AppBlend_Approx {
	public:
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* returns the Continuity used in the approximation

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "	* returns the Weights (as percent) associed to the criterium used in the optimization.

	:param W1:
	:type W1: float &
	:param W2:
	:type W2: float &
	:param W3:
	:type W3: float &
	:rtype: None
") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "	:param Degree:
	:type Degree: int &
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "	:rtype: None
") GeomFill_AppSurf;
		 GeomFill_AppSurf ();
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "	:param Degmin:
	:type Degmin: int
	:param Degmax:
	:type Degmax: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: int
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") GeomFill_AppSurf;
		 GeomFill_AppSurf (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Degmin:
	:type Degmin: int
	:param Degmax:
	:type Degmax: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: int
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "	* returns the type of parametrization used in the approximation

	:rtype: Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Lin:
	:type Lin: opencascade::handle<GeomFill_Line> &
	:param SecGen:
	:type SecGen: GeomFill_SectionGenerator &
	:param SpApprox: default value is Standard_False
	:type SpApprox: bool
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<GeomFill_Line> & Lin,GeomFill_SectionGenerator & SecGen,const Standard_Boolean SpApprox = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Lin:
	:type Lin: opencascade::handle<GeomFill_Line> &
	:param SecGen:
	:type SecGen: GeomFill_SectionGenerator &
	:param NbMaxP:
	:type NbMaxP: int
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<GeomFill_Line> & Lin,GeomFill_SectionGenerator & SecGen,const Standard_Integer NbMaxP);
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "	:param Lin:
	:type Lin: opencascade::handle<GeomFill_Line> &
	:param SecGen:
	:type SecGen: GeomFill_SectionGenerator &
	:rtype: None
") PerformSmoothing;
		void PerformSmoothing (const opencascade::handle<GeomFill_Line> & Lin,GeomFill_SectionGenerator & SecGen);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	* Define the Continuity used in the approximation

	:param C:
	:type C: GeomAbs_Shape
	:rtype: None
") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "	* define the Weights associed to the criterium used in the optimization. //! if Wi <= 0

	:param W1:
	:type W1: float
	:param W2:
	:type W2: float
	:param W3:
	:type W3: float
	:rtype: None
") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "	* Define the type of parametrization used in the approximation

	:param ParType:
	:type ParType: Approx_ParametrizationType
	:rtype: None
") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "	:param UDegree:
	:type UDegree: int &
	:param VDegree:
	:type VDegree: int &
	:param NbUPoles:
	:type NbUPoles: int &
	:param NbVPoles:
	:type NbVPoles: int &
	:param NbUKnots:
	:type NbUKnots: int &
	:param NbVKnots:
	:type NbVKnots: int &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal &
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal &
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal &
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger &
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger &
	:rtype: None
") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: None
") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
};


%extend GeomFill_AppSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_AppSweep;
class GeomFill_AppSweep : public AppBlend_Approx {
	public:
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* returns the Continuity used in the approximation

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "	* returns the Weights (as percent) associed to the criterium used in the optimization.

	:param W1:
	:type W1: float &
	:param W2:
	:type W2: float &
	:param W3:
	:type W3: float &
	:rtype: None
") CriteriumWeight;
		void CriteriumWeight (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		Standard_Integer Curves2dDegree ();
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "	:param Degree:
	:type Degree: int &
	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:rtype: None
") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "	:rtype: None
") GeomFill_AppSweep;
		 GeomFill_AppSweep ();
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "	:param Degmin:
	:type Degmin: int
	:param Degmax:
	:type Degmax: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: int
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") GeomFill_AppSweep;
		 GeomFill_AppSweep (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Degmin:
	:type Degmin: int
	:param Degmax:
	:type Degmax: int
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:param NbIt:
	:type NbIt: int
	:param KnownParameters: default value is Standard_False
	:type KnownParameters: bool
	:rtype: None
") Init;
		void Init (const Standard_Integer Degmin,const Standard_Integer Degmax,const Standard_Real Tol3d,const Standard_Real Tol2d,const Standard_Integer NbIt,const Standard_Boolean KnownParameters = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		Standard_Integer NbCurves2d ();
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "	* returns the type of parametrization used in the approximation

	:rtype: Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Lin:
	:type Lin: opencascade::handle<GeomFill_Line> &
	:param SecGen:
	:type SecGen: GeomFill_SweepSectionGenerator &
	:param SpApprox: default value is Standard_False
	:type SpApprox: bool
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<GeomFill_Line> & Lin,GeomFill_SweepSectionGenerator & SecGen,const Standard_Boolean SpApprox = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Lin:
	:type Lin: opencascade::handle<GeomFill_Line> &
	:param SecGen:
	:type SecGen: GeomFill_SweepSectionGenerator &
	:param NbMaxP:
	:type NbMaxP: int
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<GeomFill_Line> & Lin,GeomFill_SweepSectionGenerator & SecGen,const Standard_Integer NbMaxP);
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "	:param Lin:
	:type Lin: opencascade::handle<GeomFill_Line> &
	:param SecGen:
	:type SecGen: GeomFill_SweepSectionGenerator &
	:rtype: None
") PerformSmoothing;
		void PerformSmoothing (const opencascade::handle<GeomFill_Line> & Lin,GeomFill_SweepSectionGenerator & SecGen);
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "	* Define the Continuity used in the approximation

	:param C:
	:type C: GeomAbs_Shape
	:rtype: None
") SetContinuity;
		void SetContinuity (const GeomAbs_Shape C);
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "	* define the Weights associed to the criterium used in the optimization. //! if Wi <= 0

	:param W1:
	:type W1: float
	:param W2:
	:type W2: float
	:param W3:
	:type W3: float
	:rtype: None
") SetCriteriumWeight;
		void SetCriteriumWeight (const Standard_Real W1,const Standard_Real W2,const Standard_Real W3);
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "	* Define the type of parametrization used in the approximation

	:param ParType:
	:type ParType: Approx_ParametrizationType
	:rtype: None
") SetParType;
		void SetParType (const Approx_ParametrizationType ParType);
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "	:param UDegree:
	:type UDegree: int &
	:param VDegree:
	:type VDegree: int &
	:param NbUPoles:
	:type NbUPoles: int &
	:param NbVPoles:
	:type NbVPoles: int &
	:param NbUKnots:
	:type NbUKnots: int &
	:param NbVKnots:
	:type NbVKnots: int &
	:rtype: None
") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal &
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal &
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal &
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger &
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger &
	:rtype: None
") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: None
") TolReached;
		void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
};


%extend GeomFill_AppSweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_BSplineCurves;
class GeomFill_BSplineCurves {
	public:
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "	* Constructs a default BSpline surface framework.

	:rtype: None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves ();
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "	:param C1:
	:type C1: opencascade::handle<Geom_BSplineCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BSplineCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BSplineCurve> &
	:param C4:
	:type C4: opencascade::handle<Geom_BSplineCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves (const opencascade::handle<Geom_BSplineCurve> & C1,const opencascade::handle<Geom_BSplineCurve> & C2,const opencascade::handle<Geom_BSplineCurve> & C3,const opencascade::handle<Geom_BSplineCurve> & C4,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "	:param C1:
	:type C1: opencascade::handle<Geom_BSplineCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BSplineCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BSplineCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves (const opencascade::handle<Geom_BSplineCurve> & C1,const opencascade::handle<Geom_BSplineCurve> & C2,const opencascade::handle<Geom_BSplineCurve> & C3,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "	* Constructs a framework for building a BSpline surface from either - the four contiguous BSpline curves, C1, C2, C3 and C4, or - the three contiguous BSpline curves, C1, C2 and C3, or - the two contiguous BSpline curves, C1 and C2. The type of filling style Type to be used is one of: - GeomFill_Stretch - the style with the flattest patch - GeomFill_Coons - a rounded style of patch with less depth than that of Curved - GeomFill_Curved - the style with the most rounded patch.Constructs a framework for building a BSpline surface common to the two BSpline curves, C1 and C2. Exceptions Standard_ConstructionError if the curves are not contiguous.

	:param C1:
	:type C1: opencascade::handle<Geom_BSplineCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BSplineCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves (const opencascade::handle<Geom_BSplineCurve> & C1,const opencascade::handle<Geom_BSplineCurve> & C2,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* if the curves cannot be joined

	:param C1:
	:type C1: opencascade::handle<Geom_BSplineCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BSplineCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BSplineCurve> &
	:param C4:
	:type C4: opencascade::handle<Geom_BSplineCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_BSplineCurve> & C1,const opencascade::handle<Geom_BSplineCurve> & C2,const opencascade::handle<Geom_BSplineCurve> & C3,const opencascade::handle<Geom_BSplineCurve> & C4,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* if the curves cannot be joined

	:param C1:
	:type C1: opencascade::handle<Geom_BSplineCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BSplineCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BSplineCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_BSplineCurve> & C1,const opencascade::handle<Geom_BSplineCurve> & C2,const opencascade::handle<Geom_BSplineCurve> & C3,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes or reinitializes this algorithm with two, three, or four curves - C1, C2, C3, and C4 - and Type, one of the following filling styles: - GeomFill_Stretch - the style with the flattest patch - GeomFill_Coons - a rounded style of patch with less depth than that of Curved - GeomFill_Curved - the style with the most rounded patch. Exceptions Standard_ConstructionError if the curves are not contiguous.

	:param C1:
	:type C1: opencascade::handle<Geom_BSplineCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BSplineCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_BSplineCurve> & C1,const opencascade::handle<Geom_BSplineCurve> & C2,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the BSpline surface Surface resulting from the computation performed by this algorithm.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface ();
};


%extend GeomFill_BSplineCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_BezierCurves;
class GeomFill_BezierCurves {
	public:
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "	* Constructs an empty framework for building a Bezier surface from contiguous Bezier curves. You use the Init function to define the boundaries of the surface.

	:rtype: None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves ();
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "	* Constructs a framework for building a Bezier surface from the four contiguous Bezier curves, C1, C2, C3 and C4 Raises Standard_ConstructionError if the curves are not contiguous.

	:param C1:
	:type C1: opencascade::handle<Geom_BezierCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BezierCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BezierCurve> &
	:param C4:
	:type C4: opencascade::handle<Geom_BezierCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves (const opencascade::handle<Geom_BezierCurve> & C1,const opencascade::handle<Geom_BezierCurve> & C2,const opencascade::handle<Geom_BezierCurve> & C3,const opencascade::handle<Geom_BezierCurve> & C4,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "	* Constructs a framework for building a Bezier surface from the three contiguous Bezier curves, C1, C2 and C3 Raises Standard_ConstructionError if the curves are not contiguous.

	:param C1:
	:type C1: opencascade::handle<Geom_BezierCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BezierCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BezierCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves (const opencascade::handle<Geom_BezierCurve> & C1,const opencascade::handle<Geom_BezierCurve> & C2,const opencascade::handle<Geom_BezierCurve> & C3,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "	* Constructs a framework for building a Bezier surface from the two contiguous Bezier curves, C1 and C2 Raises Standard_ConstructionError if the curves are not contiguous.

	:param C1:
	:type C1: opencascade::handle<Geom_BezierCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BezierCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves (const opencascade::handle<Geom_BezierCurve> & C1,const opencascade::handle<Geom_BezierCurve> & C2,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* if the curves cannot be joined

	:param C1:
	:type C1: opencascade::handle<Geom_BezierCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BezierCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BezierCurve> &
	:param C4:
	:type C4: opencascade::handle<Geom_BezierCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_BezierCurve> & C1,const opencascade::handle<Geom_BezierCurve> & C2,const opencascade::handle<Geom_BezierCurve> & C3,const opencascade::handle<Geom_BezierCurve> & C4,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* if the curves cannot be joined

	:param C1:
	:type C1: opencascade::handle<Geom_BezierCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BezierCurve> &
	:param C3:
	:type C3: opencascade::handle<Geom_BezierCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_BezierCurve> & C1,const opencascade::handle<Geom_BezierCurve> & C2,const opencascade::handle<Geom_BezierCurve> & C3,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes or reinitializes this algorithm with two, three, or four curves - C1, C2, C3, and C4 - and Type, one of the following filling styles: - GeomFill_Stretch - the style with the flattest patch - GeomFill_Coons - a rounded style of patch with less depth than that of Curved - GeomFill_Curved - the style with the most rounded patch. Exceptions Standard_ConstructionError if the curves are not contiguous.

	:param C1:
	:type C1: opencascade::handle<Geom_BezierCurve> &
	:param C2:
	:type C2: opencascade::handle<Geom_BezierCurve> &
	:param Type:
	:type Type: GeomFill_FillingStyle
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_BezierCurve> & C1,const opencascade::handle<Geom_BezierCurve> & C2,const GeomFill_FillingStyle Type);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the Bezier surface resulting from the computation performed by this algorithm.

	:rtype: opencascade::handle<Geom_BezierSurface>
") Surface;
		const opencascade::handle<Geom_BezierSurface> & Surface ();
};


%extend GeomFill_BezierCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Boundary;
class GeomFill_Boundary : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") Bounds;
		virtual void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: gp_Vec
	:param DN:
	:type DN: gp_Vec
	:rtype: void
") D1Norm;
		virtual void D1Norm (const Standard_Real U,gp_Vec & N,gp_Vec & DN);
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "	:rtype: bool
") HasNormals;
		virtual Standard_Boolean HasNormals ();
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "	:rtype: bool
") IsDegenerated;
		virtual Standard_Boolean IsDegenerated ();
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Vec
") Norm;
		virtual gp_Vec Norm (const Standard_Real U);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:param PFirst:
	:type PFirst: gp_Pnt
	:param PLast:
	:type PLast: gp_Pnt
	:rtype: None
") Points;
		void Points (gp_Pnt & PFirst,gp_Pnt & PLast);
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasDF:
	:type HasDF: bool
	:param HasDL:
	:type HasDL: bool
	:param DF:
	:type DF: float
	:param DL:
	:type DL: float
	:param Rev:
	:type Rev: bool
	:rtype: void
") Reparametrize;
		virtual void Reparametrize (const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasDF,const Standard_Boolean HasDL,const Standard_Real DF,const Standard_Real DL,const Standard_Boolean Rev);
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "	:rtype: float
") Tol3d;
		Standard_Real Tol3d ();
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Tol3d;
		void Tol3d (const Standard_Real Tol);
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "	:rtype: float
") Tolang;
		Standard_Real Tolang ();
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Tolang;
		void Tolang (const Standard_Real Tol);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		virtual gp_Pnt Value (const Standard_Real U);
};


%make_alias(GeomFill_Boundary)

%extend GeomFill_Boundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_CircularBlendFunc;
class GeomFill_CircularBlendFunc : public Approx_SweepFunction {
	public:
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditionned rational approximation.

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GeomFill_CircularBlendFunc;
		%feature("autodoc", "	* Create a Blend with a constant radius with 2 guide-line. <FShape> sets the type of fillet surface. The -- default value is Convert_TgtThetaOver2 (classical -- nurbs -- representation of circles). ChFi3d_QuasiAngular -- corresponds to a nurbs representation of circles -- which parameterisation matches the circle one. -- ChFi3d_Polynomial corresponds to a polynomial -- representation of circles.

	:param Path:
	:type Path: opencascade::handle<Adaptor3d_HCurve> &
	:param Curve1:
	:type Curve1: opencascade::handle<Adaptor3d_HCurve> &
	:param Curve2:
	:type Curve2: opencascade::handle<Adaptor3d_HCurve> &
	:param Radius:
	:type Radius: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:rtype: None
") GeomFill_CircularBlendFunc;
		 GeomFill_CircularBlendFunc (const opencascade::handle<Adaptor3d_HCurve> & Path,const opencascade::handle<Adaptor3d_HCurve> & Curve1,const opencascade::handle<Adaptor3d_HCurve> & Curve2,const Standard_Real Radius,const Standard_Boolean Polynomial = Standard_False);
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections. This information is usefull to perform well conditionned rational approximation.

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the maximum section. This information is usefull to perform well conditionned rational approximation.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "	* get the number of 2d curves to approximate.

	:rtype: int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usfull, if (me) have to be run numerical algorithme to perform D0, D1 or D2

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
};


%make_alias(GeomFill_CircularBlendFunc)

%extend GeomFill_CircularBlendFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_ConstrainedFilling;
class GeomFill_ConstrainedFilling {
	public:
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "	* Returns the bound of index i after sort.

	:param I:
	:type I: int
	:rtype: opencascade::handle<GeomFill_Boundary>
") Boundary;
		opencascade::handle<GeomFill_Boundary> Boundary (const Standard_Integer I);
		%feature("compactdefaultargs") CheckApprox;
		%feature("autodoc", "	* Computes values and normals along the bound I and compare them to the approx result curves (bound and tgte field) , draw the normals and tangents.

	:param I:
	:type I: int
	:rtype: None
") CheckApprox;
		void CheckApprox (const Standard_Integer I);
		%feature("compactdefaultargs") CheckCoonsAlgPatch;
		%feature("autodoc", "	* Computes the fields of tangents on 30 points along the bound I, these are not the constraint tangents but gives an idea of the coonsAlgPatch regularity.

	:param I:
	:type I: int
	:rtype: None
") CheckCoonsAlgPatch;
		void CheckCoonsAlgPatch (const Standard_Integer I);
		%feature("compactdefaultargs") CheckResult;
		%feature("autodoc", "	* Computes values and normals along the bound I on both constraint surface and result surface, draw the normals, and computes the max distance between values and the max angle between normals.

	:param I:
	:type I: int
	:rtype: None
") CheckResult;
		void CheckResult (const Standard_Integer I);
		%feature("compactdefaultargs") CheckTgteField;
		%feature("autodoc", "	* Computes the fields of tangents and normals on 30 points along the bound I, draw them, and computes the max dot product that must be near than 0.

	:param I:
	:type I: int
	:rtype: None
") CheckTgteField;
		void CheckTgteField (const Standard_Integer I);
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "	* Internal use for Advmath approximation call.

	:param W:
	:type W: float
	:param Ord:
	:type Ord: int
	:param Result:
	:type Result: float &
	:rtype: int
") Eval;
		Standard_Integer Eval (const Standard_Real W,const Standard_Integer Ord,Standard_Real &OutValue);
		%feature("compactdefaultargs") GeomFill_ConstrainedFilling;
		%feature("autodoc", "	* Constructs an empty framework for filling a surface from boundaries. The boundaries of the surface will be defined, and the surface will be built by using the function Init. The surface will respect the following constraints: - its degree will not be greater than MaxDeg - the maximum number of segments MaxSeg which BSpline surfaces can have.

	:param MaxDeg:
	:type MaxDeg: int
	:param MaxSeg:
	:type MaxSeg: int
	:rtype: None
") GeomFill_ConstrainedFilling;
		 GeomFill_ConstrainedFilling (const Standard_Integer MaxDeg,const Standard_Integer MaxSeg);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param B1:
	:type B1: opencascade::handle<GeomFill_Boundary> &
	:param B2:
	:type B2: opencascade::handle<GeomFill_Boundary> &
	:param B3:
	:type B3: opencascade::handle<GeomFill_Boundary> &
	:param NoCheck: default value is Standard_False
	:type NoCheck: bool
	:rtype: None
") Init;
		void Init (const opencascade::handle<GeomFill_Boundary> & B1,const opencascade::handle<GeomFill_Boundary> & B2,const opencascade::handle<GeomFill_Boundary> & B3,const Standard_Boolean NoCheck = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Constructs a BSpline surface filled from the series of boundaries B1, B2, B3 and, if need be, B4, which serve: - as path constraints - and optionally, as tangency constraints if they are GeomFill_BoundWithSurf curves. The boundaries may be given in any order: they are classified and if necessary, reversed and reparameterized. The surface will also respect the following constraints: - its degree will not be greater than the maximum degree defined at the time of construction of this framework, and - the maximum number of segments MaxSeg which BSpline surfaces can have

	:param B1:
	:type B1: opencascade::handle<GeomFill_Boundary> &
	:param B2:
	:type B2: opencascade::handle<GeomFill_Boundary> &
	:param B3:
	:type B3: opencascade::handle<GeomFill_Boundary> &
	:param B4:
	:type B4: opencascade::handle<GeomFill_Boundary> &
	:param NoCheck: default value is Standard_False
	:type NoCheck: bool
	:rtype: None
") Init;
		void Init (const opencascade::handle<GeomFill_Boundary> & B1,const opencascade::handle<GeomFill_Boundary> & B2,const opencascade::handle<GeomFill_Boundary> & B3,const opencascade::handle<GeomFill_Boundary> & B4,const Standard_Boolean NoCheck = Standard_False);
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "	* Computes the new poles of the surface using the new blending functions set by several calls to SetDomain.

	:rtype: None
") ReBuild;
		void ReBuild ();
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "	* Allows to modify domain on witch the blending function associated to the constrained boundary B will propag the influence of the field of tangency. Can be usefull to reduce influence of boundaries on whitch the Coons compatibility conditions are not respected. l is a relative value of the parametric range of B. Default value for l is 1 (used in Init). Warning: Must be called after Init with a constrained boundary used in the call to Init.

	:param l:
	:type l: float
	:param B:
	:type B: opencascade::handle<GeomFill_BoundWithSurf> &
	:rtype: None
") SetDomain;
		void SetDomain (const Standard_Real l,const opencascade::handle<GeomFill_BoundWithSurf> & B);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the BSpline surface after computation of the fill by this framework.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface ();
};


%extend GeomFill_ConstrainedFilling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_CoonsAlgPatch;
class GeomFill_CoonsAlgPatch : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: opencascade::handle<GeomFill_Boundary>
") Bound;
		const opencascade::handle<GeomFill_Boundary> & Bound (const Standard_Integer I);
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: gp_Pnt
") Corner;
		const gp_Pnt  Corner (const Standard_Integer I);
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "	* Computes the d/dU partial derivative on the algorithmic patch at parameters U and V.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Vec
") D1U;
		gp_Vec D1U (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "	* Computes the d/dV partial derivative on the algorithmic patch at parameters U and V.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Vec
") D1V;
		gp_Vec D1V (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "	* Computes the d2/dUdV partial derivative on the algorithmic patch made with linear blending functions at parameter U and V.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Vec
") DUV;
		gp_Vec DUV (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") Func;
		%feature("autodoc", "	* Give the blending functions.

	:param f1:
	:type f1: opencascade::handle<Law_Function> &
	:param f2:
	:type f2: opencascade::handle<Law_Function> &
	:rtype: None
") Func;
		void Func (opencascade::handle<Law_Function> & f1,opencascade::handle<Law_Function> & f2);
		%feature("compactdefaultargs") Func;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: opencascade::handle<Law_Function>
") Func;
		const opencascade::handle<Law_Function> & Func (const Standard_Integer I);
		%feature("compactdefaultargs") GeomFill_CoonsAlgPatch;
		%feature("autodoc", "	* Constructs the algorithmic patch. By Default the constructed blending functions are linear. Warning: No control is done on the bounds. B1/B3 and B2/B4 must be same range and well oriented.

	:param B1:
	:type B1: opencascade::handle<GeomFill_Boundary> &
	:param B2:
	:type B2: opencascade::handle<GeomFill_Boundary> &
	:param B3:
	:type B3: opencascade::handle<GeomFill_Boundary> &
	:param B4:
	:type B4: opencascade::handle<GeomFill_Boundary> &
	:rtype: None
") GeomFill_CoonsAlgPatch;
		 GeomFill_CoonsAlgPatch (const opencascade::handle<GeomFill_Boundary> & B1,const opencascade::handle<GeomFill_Boundary> & B2,const opencascade::handle<GeomFill_Boundary> & B3,const opencascade::handle<GeomFill_Boundary> & B4);
		%feature("compactdefaultargs") SetFunc;
		%feature("autodoc", "	* Set the blending functions.

	:param f1:
	:type f1: opencascade::handle<Law_Function> &
	:param f2:
	:type f2: opencascade::handle<Law_Function> &
	:rtype: None
") SetFunc;
		void SetFunc (const opencascade::handle<Law_Function> & f1,const opencascade::handle<Law_Function> & f2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value on the algorithmic patch at parameters U and V.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
};


%make_alias(GeomFill_CoonsAlgPatch)

%extend GeomFill_CoonsAlgPatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_CornerState;
class GeomFill_CornerState {
	public:
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "	:rtype: None
") Constraint;
		void Constraint ();
		%feature("compactdefaultargs") DoKill;
		%feature("autodoc", "	:param Scal:
	:type Scal: float
	:rtype: None
") DoKill;
		void DoKill (const Standard_Real Scal);
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "	:rtype: float
") Gap;
		Standard_Real Gap ();
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "	:param G:
	:type G: float
	:rtype: None
") Gap;
		void Gap (const Standard_Real G);
		%feature("compactdefaultargs") GeomFill_CornerState;
		%feature("autodoc", "	:rtype: None
") GeomFill_CornerState;
		 GeomFill_CornerState ();
		%feature("compactdefaultargs") HasConstraint;
		%feature("autodoc", "	:rtype: bool
") HasConstraint;
		Standard_Boolean HasConstraint ();
		%feature("compactdefaultargs") IsToKill;
		%feature("autodoc", "	:param Scal:
	:type Scal: float &
	:rtype: bool
") IsToKill;
		Standard_Boolean IsToKill (Standard_Real &OutValue);
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "	:rtype: float
") NorAng;
		Standard_Real NorAng ();
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "	:param Ang:
	:type Ang: float
	:rtype: None
") NorAng;
		void NorAng (const Standard_Real Ang);
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "	:rtype: float
") TgtAng;
		Standard_Real TgtAng ();
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "	:param Ang:
	:type Ang: float
	:rtype: None
") TgtAng;
		void TgtAng (const Standard_Real Ang);
};


%extend GeomFill_CornerState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Filling;
class GeomFill_Filling {
	public:
		%feature("compactdefaultargs") GeomFill_Filling;
		%feature("autodoc", "	:rtype: None
") GeomFill_Filling;
		 GeomFill_Filling ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:rtype: None
") Poles;
		void Poles (TColgp_Array2OfPnt & Poles);
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	:param Weights:
	:type Weights: TColStd_Array2OfReal &
	:rtype: None
") Weights;
		void Weights (TColStd_Array2OfReal & Weights);
		%feature("compactdefaultargs") isRational;
		%feature("autodoc", "	:rtype: bool
") isRational;
		Standard_Boolean isRational ();
};


%extend GeomFill_Filling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_FunctionDraft;
class GeomFill_FunctionDraft : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") Deriv2T;
		%feature("autodoc", "	* returns the values <F> of the T2 derivatives for the parameter Param .

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param Param:
	:type Param: float
	:param W:
	:type W: float
	:param d2N:
	:type d2N: gp_Vec
	:param teta:
	:type teta: float
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Deriv2T;
		Standard_Boolean Deriv2T (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real Param,const Standard_Real W,const gp_Vec & d2N,const Standard_Real teta,math_Vector & F);
		%feature("compactdefaultargs") Deriv2X;
		%feature("autodoc", "	* returns the values <T> of the X2 derivatives for the parameter Param .

	:param X:
	:type X: math_Vector &
	:param T:
	:type T: GeomFill_Tensor &
	:rtype: bool
") Deriv2X;
		Standard_Boolean Deriv2X (const math_Vector & X,GeomFill_Tensor & T);
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "	* returns the values <F> of the T derivatives for the parameter Param .

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param Param:
	:type Param: float
	:param W:
	:type W: float
	:param dN:
	:type dN: gp_Vec
	:param teta:
	:type teta: float
	:param F:
	:type F: math_Vector &
	:rtype: bool
") DerivT;
		Standard_Boolean DerivT (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real Param,const Standard_Real W,const gp_Vec & dN,const Standard_Real teta,math_Vector & F);
		%feature("compactdefaultargs") DerivTX;
		%feature("autodoc", "	* returns the values <D> of the TX derivatives for the parameter Param .

	:param dN:
	:type dN: gp_Vec
	:param teta:
	:type teta: float
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") DerivTX;
		Standard_Boolean DerivTX (const gp_Vec & dN,const Standard_Real teta,math_Matrix & D);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") GeomFill_FunctionDraft;
		%feature("autodoc", "	:param S:
	:type S: opencascade::handle<Adaptor3d_HSurface> &
	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") GeomFill_FunctionDraft;
		 GeomFill_FunctionDraft (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%extend GeomFill_FunctionDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_FunctionGuide;
class GeomFill_FunctionGuide : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "	* returns the values <F> of the T derivatives for the parameter Param .

	:param X:
	:type X: math_Vector &
	:param DCentre:
	:type DCentre: gp_XYZ
	:param DDir:
	:type DDir: gp_XYZ
	:param DFDT:
	:type DFDT: math_Vector &
	:rtype: bool
") DerivT;
		Standard_Boolean DerivT (const math_Vector & X,const gp_XYZ & DCentre,const gp_XYZ & DDir,math_Vector & DFDT);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	* returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") GeomFill_FunctionGuide;
		%feature("autodoc", "	:param S:
	:type S: opencascade::handle<GeomFill_SectionLaw> &
	:param Guide:
	:type Guide: opencascade::handle<Adaptor3d_HCurve> &
	:param ParamOnLaw: default value is 0.0
	:type ParamOnLaw: float
	:rtype: None
") GeomFill_FunctionGuide;
		 GeomFill_FunctionGuide (const opencascade::handle<GeomFill_SectionLaw> & S,const opencascade::handle<Adaptor3d_HCurve> & Guide,const Standard_Real ParamOnLaw = 0.0);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	* returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	* returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables ();
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Centre:
	:type Centre: gp_Pnt
	:param Dir:
	:type Dir: gp_XYZ
	:param XDir:
	:type XDir: gp_XYZ
	:rtype: None
") SetParam;
		void SetParam (const Standard_Real Param,const gp_Pnt & Centre,const gp_XYZ & Dir,const gp_XYZ & XDir);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.

	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%extend GeomFill_FunctionGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Line;
class GeomFill_Line : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "	:rtype: None
") GeomFill_Line;
		 GeomFill_Line ();
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "	:param NbPoints:
	:type NbPoints: int
	:rtype: None
") GeomFill_Line;
		 GeomFill_Line (const Standard_Integer NbPoints);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: int
") Point;
		Standard_Integer Point (const Standard_Integer Index);
};


%make_alias(GeomFill_Line)

%extend GeomFill_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_LocFunction;
class GeomFill_LocFunction {
	public:
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool
") D0;
		Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool
") D1;
		Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: bool
") D2;
		Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: float &
	:param Ier:
	:type Ier: int &
	:rtype: None
") DN;
		void DN (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,const Standard_Integer Order,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GeomFill_LocFunction;
		%feature("autodoc", "	:param Law:
	:type Law: opencascade::handle<GeomFill_LocationLaw> &
	:rtype: None
") GeomFill_LocFunction;
		 GeomFill_LocFunction (const opencascade::handle<GeomFill_LocationLaw> & Law);
};


%extend GeomFill_LocFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_LocationLaw;
class GeomFill_LocationLaw : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location and 2d points

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,TColgp_Array1OfPnt2d & Poles2d);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute location 2d points and associated first derivatives. Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute location 2d points and associated first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param D2M:
	:type D2M: gp_Mat
	:param D2V:
	:type D2V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,gp_Mat & D2M,gp_Vec & D2V,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d);
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Give a status to the Law Returns PipeOk (default implementation)

	:rtype: GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus ();
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param AM:
	:type AM: gp_Mat
	:param AV:
	:type AV: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Mat & AM,gp_Vec & AV);
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "	* Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).

	:rtype: float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm ();
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "	* Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation)

	:rtype: bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction ();
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "	* Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation)

	:rtype: bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "	* Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsRotation;
		virtual Standard_Boolean IsRotation (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "	* Say if the Location Law, is an translation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsTranslation;
		virtual Standard_Boolean IsTranslation (Standard_Real &OutValue);
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "	* get the number of 2d curves (Restrictions + Traces) to approximate.

	:rtype: int
") Nb2dCurves;
		Standard_Integer Nb2dCurves ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation.

	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:param Center:
	:type Center: gp_Pnt
	:rtype: void
") Rotation;
		virtual void Rotation (gp_Pnt & Center);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usefull, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "	* Set a transformation Matrix like the law M(t) become Mat * M(t)

	:param Transfo:
	:type Transfo: gp_Mat
	:rtype: void
") SetTrsf;
		virtual void SetTrsf (const gp_Mat & Transfo);
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "	* Give the number of trace (Curves 2d wich are not restriction) Returns 0 (default implementation)

	:rtype: int
") TraceNumber;
		virtual Standard_Integer TraceNumber ();
};


%make_alias(GeomFill_LocationLaw)

%extend GeomFill_LocationLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Pipe;
class GeomFill_Pipe {
	public:
		%feature("compactdefaultargs") ErrorOnSurf;
		%feature("autodoc", "	* Returns the approximation's error. if the Surface is plane, cylinder ... this error can be 0.

	:rtype: float
") ErrorOnSurf;
		Standard_Real ErrorOnSurf ();
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "	* The u parametric direction of the surface constructed by this algorithm usually corresponds to the evolution along the path and the v parametric direction corresponds to the evolution along the section(s). However, this rule is not respected when constructing certain specific Geom surfaces (typically cylindrical surfaces, surfaces of revolution, etc.) for which the parameterization is inversed. The ExchangeUV function checks for this, and returns true in all these specific cases. Warning Do not use this function before the surface is built.

	:rtype: bool
") ExchangeUV;
		Standard_Boolean ExchangeUV ();
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "	* Sets a flag to try to create as many planes, cylinder,... as possible. Default value is <Standard_False>.

	:param B:
	:type B: bool
	:rtype: None
") GenerateParticularCase;
		void GenerateParticularCase (const Standard_Boolean B);
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "	* Returns the flag.

	:rtype: bool
") GenerateParticularCase;
		Standard_Boolean GenerateParticularCase ();
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Constructs an empty algorithm for building pipes. Use the function Init to initialize it.

	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe ();
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param Radius:
	:type Radius: float
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const Standard_Real Radius);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with a constant section (<FirstSection>) and a path (<Path>) Option can be - GeomFill_IsCorrectedFrenet - GeomFill_IsFrenet - GeomFill_IsConstant

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param Option: default value is GeomFill_IsCorrectedFrenet
	:type Option: GeomFill_Trihedron
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & FirstSect,const GeomFill_Trihedron Option = GeomFill_IsCorrectedFrenet);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with a constant section (<FirstSection>) and a path defined by <Path> and <Support>

	:param Path:
	:type Path: opencascade::handle<Geom2d_Curve> &
	:param Support:
	:type Support: opencascade::handle<Geom_Surface> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom2d_Curve> & Path,const opencascade::handle<Geom_Surface> & Support,const opencascade::handle<Geom_Curve> & FirstSect);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with a constant section (<FirstSection>) and a path <Path> and a fixed binormal direction <Dir>

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param Dir:
	:type Dir: gp_Dir
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & FirstSect,const gp_Dir & Dir);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with an evolving section The section evoluate from First to Last Section

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param LastSect:
	:type LastSect: opencascade::handle<Geom_Curve> &
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & FirstSect,const opencascade::handle<Geom_Curve> & LastSect);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with N sections The section evoluate from First to Last Section

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param NSections:
	:type NSections: TColGeom_SequenceOfCurve &
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const TColGeom_SequenceOfCurve & NSections);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with a constant radius with 2 guide-line.

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param Curve1:
	:type Curve1: opencascade::handle<Geom_Curve> &
	:param Curve2:
	:type Curve2: opencascade::handle<Geom_Curve> &
	:param Radius:
	:type Radius: float
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & Curve1,const opencascade::handle<Geom_Curve> & Curve2,const Standard_Real Radius);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with a constant radius with 2 guide-line.

	:param Path:
	:type Path: opencascade::handle<Adaptor3d_HCurve> &
	:param Curve1:
	:type Curve1: opencascade::handle<Adaptor3d_HCurve> &
	:param Curve2:
	:type Curve2: opencascade::handle<Adaptor3d_HCurve> &
	:param Radius:
	:type Radius: float
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Adaptor3d_HCurve> & Path,const opencascade::handle<Adaptor3d_HCurve> & Curve1,const opencascade::handle<Adaptor3d_HCurve> & Curve2,const Standard_Real Radius);
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "	* Create a pipe with a constant section and with 1 guide-line. Use the function Perform to build the surface. All standard specific cases are detected in order to construct, according to the respective geometric nature of Path and the sections, a planar, cylindrical, conical, spherical or toroidal surface, a surface of linear extrusion or a surface of revolution. In the general case, the result is a BSpline surface (NURBS) built by approximation of a series of sections where: - the number of sections N is chosen automatically by the algorithm according to the respective geometries of Path and the sections. N is greater than or equal to 2; - N points Pi (with i in the range [ 1,N ]) are defined at regular intervals along the curve Path from its first point to its end point. At each point Pi, a coordinate system Ti is computed with Pi as origin, and with the tangential and normal vectors to Path defining two of its coordinate axes. In the case of a pipe with a constant circular section, the first section is a circle of radius Radius centered on the origin of Path and whose 'Z Axis' is aligned along the vector tangential to the origin of Path. In the case of a pipe with a constant section, the first section is the curve FirstSect. In these two cases, the ith section (for values of i greater than 1) is obtained by applying to a copy of this first section the geometric transformation which transforms coordinate system T1 into coordinate system Ti. In the case of an evolving section, N-2 intermediate curves Si are first computed (if N is greater than 2, and with i in the range [ 2,N-1 ]) whose geometry evolves regularly from the curve S1=FirstSect to the curve SN=LastSect. The first section is FirstSect, and the ith section (for values of i greater than 1) is obtained by applying to the curve Si the geometric transformation which transforms coordinate system T1 into coordinate system Ti.

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param Guide:
	:type Guide: opencascade::handle<Adaptor3d_HCurve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param ByACR:
	:type ByACR: bool
	:param rotat:
	:type rotat: bool
	:rtype: None
") GeomFill_Pipe;
		 GeomFill_Pipe (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Adaptor3d_HCurve> & Guide,const opencascade::handle<Geom_Curve> & FirstSect,const Standard_Boolean ByACR,const Standard_Boolean rotat);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param Radius:
	:type Radius: float
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_Curve> & Path,const Standard_Real Radius);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param Option: default value is GeomFill_IsCorrectedFrenet
	:type Option: GeomFill_Trihedron
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & FirstSect,const GeomFill_Trihedron Option = GeomFill_IsCorrectedFrenet);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom2d_Curve> &
	:param Support:
	:type Support: opencascade::handle<Geom_Surface> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom2d_Curve> & Path,const opencascade::handle<Geom_Surface> & Support,const opencascade::handle<Geom_Curve> & FirstSect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param Dir:
	:type Dir: gp_Dir
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & FirstSect,const gp_Dir & Dir);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param LastSect:
	:type LastSect: opencascade::handle<Geom_Curve> &
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Geom_Curve> & FirstSect,const opencascade::handle<Geom_Curve> & LastSect);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param NSections:
	:type NSections: TColGeom_SequenceOfCurve &
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_Curve> & Path,const TColGeom_SequenceOfCurve & NSections);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Create a pipe with a constant radius with 2 guide-line.

	:param Path:
	:type Path: opencascade::handle<Adaptor3d_HCurve> &
	:param Curve1:
	:type Curve1: opencascade::handle<Adaptor3d_HCurve> &
	:param Curve2:
	:type Curve2: opencascade::handle<Adaptor3d_HCurve> &
	:param Radius:
	:type Radius: float
	:rtype: None
") Init;
		void Init (const opencascade::handle<Adaptor3d_HCurve> & Path,const opencascade::handle<Adaptor3d_HCurve> & Curve1,const opencascade::handle<Adaptor3d_HCurve> & Curve2,const Standard_Real Radius);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes this pipe algorithm to build the following surface: - a pipe with a constant circular section of radius Radius along the path Path, or - a pipe with constant section FirstSect along the path Path, or - a pipe where the section evolves from FirstSect to LastSect along the path Path. Use the function Perform to build the surface. Note: a description of the resulting surface is given under Constructors.

	:param Path:
	:type Path: opencascade::handle<Geom_Curve> &
	:param Guide:
	:type Guide: opencascade::handle<Adaptor3d_HCurve> &
	:param FirstSect:
	:type FirstSect: opencascade::handle<Geom_Curve> &
	:param ByACR:
	:type ByACR: bool
	:param rotat:
	:type rotat: bool
	:rtype: None
") Init;
		void Init (const opencascade::handle<Geom_Curve> & Path,const opencascade::handle<Adaptor3d_HCurve> & Guide,const opencascade::handle<Geom_Curve> & FirstSect,const Standard_Boolean ByACR,const Standard_Boolean rotat);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns whether approximation was done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Builds the pipe defined at the time of initialization of this algorithm. A description of the resulting surface is given under Constructors. If WithParameters (defaulted to false) is set to true, the approximation algorithm (used only in the general case of construction of a BSpline surface) builds the surface with a u parameter corresponding to the one of the path. Exceptions Standard_ConstructionError if a surface cannot be constructed from the data. Warning: It is the old Perform method, the next methode is recommended.

	:param WithParameters: default value is Standard_False
	:type WithParameters: bool
	:param myPolynomial: default value is Standard_False
	:type myPolynomial: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean WithParameters = Standard_False,const Standard_Boolean myPolynomial = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* detects the particular cases. And compute the surface. if none particular case is detected we make an approximation with respect of the Tolerance <Tol>, the continuty <Conti>, the maximum degree <MaxDegree>, the maximum number of span <NbMaxSegment> and the spine parametrization. If we can't create a surface with the data

	:param Tol:
	:type Tol: float
	:param Polynomial:
	:type Polynomial: bool
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:param MaxDegree: default value is 11
	:type MaxDegree: int
	:param NbMaxSegment: default value is 30
	:type NbMaxSegment: int
	:rtype: None
") Perform;
		void Perform (const Standard_Real Tol,const Standard_Boolean Polynomial,const GeomAbs_Shape Conti = GeomAbs_C1,const Standard_Integer MaxDegree = 11,const Standard_Integer NbMaxSegment = 30);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the surface built by this algorithm. Warning Do not use this function before the surface is built (in this case the function will return a null handle).

	:rtype: opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface ();
};


%extend GeomFill_Pipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_PlanFunc;
class GeomFill_PlanFunc : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D1:
	:type D1: float &
	:param D2:
	:type D2: float &
	:rtype: None
") D2;
		void D2 (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") D2E;
		%feature("autodoc", "	:param X:
	:type X: float
	:param DP:
	:type DP: gp_Vec
	:param D2P:
	:type D2P: gp_Vec
	:param DV:
	:type DV: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param DFDT:
	:type DFDT: float &
	:param D2FDT2:
	:type D2FDT2: float &
	:param D2FDTDX:
	:type D2FDTDX: float &
	:rtype: None
") D2E;
		void D2E (const Standard_Real X,const gp_Vec & DP,const gp_Vec & D2P,const gp_Vec & DV,const gp_Vec & D2V,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DEDT;
		%feature("autodoc", "	:param X:
	:type X: float
	:param DP:
	:type DP: gp_Vec
	:param DV:
	:type DV: gp_Vec
	:param DF:
	:type DF: float &
	:rtype: None
") DEDT;
		void DEDT (const Standard_Real X,const gp_Vec & DP,const gp_Vec & DV,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		virtual Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") GeomFill_PlanFunc;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") GeomFill_PlanFunc;
		 GeomFill_PlanFunc (const gp_Pnt & P,const gp_Vec & V,const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		virtual Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend GeomFill_PlanFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_PolynomialConvertor;
class GeomFill_PolynomialConvertor {
	public:
		%feature("compactdefaultargs") GeomFill_PolynomialConvertor;
		%feature("autodoc", "	:rtype: None
") GeomFill_PolynomialConvertor;
		 GeomFill_PolynomialConvertor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "	* say if <self> is Initialized

	:rtype: bool
") Initialized;
		Standard_Boolean Initialized ();
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param FirstPnt:
	:type FirstPnt: gp_Pnt
	:param Center:
	:type Center: gp_Pnt
	:param Dir:
	:type Dir: gp_Vec
	:param Angle:
	:type Angle: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") Section;
		void Section (const gp_Pnt & FirstPnt,const gp_Pnt & Center,const gp_Vec & Dir,const Standard_Real Angle,TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param FirstPnt:
	:type FirstPnt: gp_Pnt
	:param DFirstPnt:
	:type DFirstPnt: gp_Vec
	:param Center:
	:type Center: gp_Pnt
	:param DCenter:
	:type DCenter: gp_Vec
	:param Dir:
	:type Dir: gp_Vec
	:param DDir:
	:type DDir: gp_Vec
	:param Angle:
	:type Angle: float
	:param DAngle:
	:type DAngle: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:rtype: None
") Section;
		void Section (const gp_Pnt & FirstPnt,const gp_Vec & DFirstPnt,const gp_Pnt & Center,const gp_Vec & DCenter,const gp_Vec & Dir,const gp_Vec & DDir,const Standard_Real Angle,const Standard_Real DAngle,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param FirstPnt:
	:type FirstPnt: gp_Pnt
	:param DFirstPnt:
	:type DFirstPnt: gp_Vec
	:param D2FirstPnt:
	:type D2FirstPnt: gp_Vec
	:param Center:
	:type Center: gp_Pnt
	:param DCenter:
	:type DCenter: gp_Vec
	:param D2Center:
	:type D2Center: gp_Vec
	:param Dir:
	:type Dir: gp_Vec
	:param DDir:
	:type DDir: gp_Vec
	:param D2Dir:
	:type D2Dir: gp_Vec
	:param Angle:
	:type Angle: float
	:param DAngle:
	:type DAngle: float
	:param D2Angle:
	:type D2Angle: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:rtype: None
") Section;
		void Section (const gp_Pnt & FirstPnt,const gp_Vec & DFirstPnt,const gp_Vec & D2FirstPnt,const gp_Pnt & Center,const gp_Vec & DCenter,const gp_Vec & D2Center,const gp_Vec & Dir,const gp_Vec & DDir,const gp_Vec & D2Dir,const Standard_Real Angle,const Standard_Real DAngle,const Standard_Real D2Angle,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles);
};


%extend GeomFill_PolynomialConvertor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Profiler;
class GeomFill_Profiler {
	public:
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "	:param Curve:
	:type Curve: opencascade::handle<Geom_Curve> &
	:rtype: None
") AddCurve;
		void AddCurve (const opencascade::handle<Geom_Curve> & Curve);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve (const Standard_Integer Index);
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	* Raises if not yet perform

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") GeomFill_Profiler;
		%feature("autodoc", "	:rtype: None
") GeomFill_Profiler;
		 GeomFill_Profiler ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "	* Raises if not yet perform Raises if the lengthes of <Knots> and <Mults> are not equal to NbKnots().

	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:param Mults:
	:type Mults: TColStd_Array1OfInteger &
	:rtype: None
") KnotsAndMults;
		void KnotsAndMults (TColStd_Array1OfReal & Knots,TColStd_Array1OfInteger & Mults);
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	* Raises if not yet perform

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	* Raises if not yet perform

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Converts all curves to BSplineCurves. Set them to the common profile. <PTol> is used to compare 2 knots.

	:param PTol:
	:type PTol: float
	:rtype: void
") Perform;
		virtual void Perform (const Standard_Real PTol);
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "	* returns in <Poles> the poles of the BSplineCurve from index <Index> adjusting to the current profile. Raises if not yet perform Raises if <Index> not in the range [1,NbCurves] if the length of <Poles> is not equal to NbPoles().

	:param Index:
	:type Index: int
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") Poles;
		void Poles (const Standard_Integer Index,TColgp_Array1OfPnt & Poles);
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	* returns in <Weights> the weights of the BSplineCurve from index <Index> adjusting to the current profile. Raises if not yet perform Raises if <Index> not in the range [1,NbCurves] or if the length of <Weights> is not equal to NbPoles().

	:param Index:
	:type Index: int
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:rtype: None
") Weights;
		void Weights (const Standard_Integer Index,TColStd_Array1OfReal & Weights);
};


%extend GeomFill_Profiler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_QuasiAngularConvertor;
class GeomFill_QuasiAngularConvertor {
	public:
		%feature("compactdefaultargs") GeomFill_QuasiAngularConvertor;
		%feature("autodoc", "	:rtype: None
") GeomFill_QuasiAngularConvertor;
		 GeomFill_QuasiAngularConvertor ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "	* say if <self> is Initialized

	:rtype: bool
") Initialized;
		Standard_Boolean Initialized ();
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param FirstPnt:
	:type FirstPnt: gp_Pnt
	:param Center:
	:type Center: gp_Pnt
	:param Dir:
	:type Dir: gp_Vec
	:param Angle:
	:type Angle: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const gp_Pnt & FirstPnt,const gp_Pnt & Center,const gp_Vec & Dir,const Standard_Real Angle,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weights);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param FirstPnt:
	:type FirstPnt: gp_Pnt
	:param DFirstPnt:
	:type DFirstPnt: gp_Vec
	:param Center:
	:type Center: gp_Pnt
	:param DCenter:
	:type DCenter: gp_Vec
	:param Dir:
	:type Dir: gp_Vec
	:param DDir:
	:type DDir: gp_Vec
	:param Angle:
	:type Angle: float
	:param DAngle:
	:type DAngle: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:param DWeights:
	:type DWeights: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const gp_Pnt & FirstPnt,const gp_Vec & DFirstPnt,const gp_Pnt & Center,const gp_Vec & DCenter,const gp_Vec & Dir,const gp_Vec & DDir,const Standard_Real Angle,const Standard_Real DAngle,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColStd_Array1OfReal & Weights,TColStd_Array1OfReal & DWeights);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param FirstPnt:
	:type FirstPnt: gp_Pnt
	:param DFirstPnt:
	:type DFirstPnt: gp_Vec
	:param D2FirstPnt:
	:type D2FirstPnt: gp_Vec
	:param Center:
	:type Center: gp_Pnt
	:param DCenter:
	:type DCenter: gp_Vec
	:param D2Center:
	:type D2Center: gp_Vec
	:param Dir:
	:type Dir: gp_Vec
	:param DDir:
	:type DDir: gp_Vec
	:param D2Dir:
	:type D2Dir: gp_Vec
	:param Angle:
	:type Angle: float
	:param DAngle:
	:type DAngle: float
	:param D2Angle:
	:type D2Angle: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Weights:
	:type Weights: TColStd_Array1OfReal &
	:param DWeights:
	:type DWeights: TColStd_Array1OfReal &
	:param D2Weights:
	:type D2Weights: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const gp_Pnt & FirstPnt,const gp_Vec & DFirstPnt,const gp_Vec & D2FirstPnt,const gp_Pnt & Center,const gp_Vec & DCenter,const gp_Vec & D2Center,const gp_Vec & Dir,const gp_Vec & DDir,const gp_Vec & D2Dir,const Standard_Real Angle,const Standard_Real DAngle,const Standard_Real D2Angle,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColStd_Array1OfReal & Weights,TColStd_Array1OfReal & DWeights,TColStd_Array1OfReal & D2Weights);
};


%extend GeomFill_QuasiAngularConvertor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_SectionLaw;
class GeomFill_SectionLaw : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "	* give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. It is the default implementation.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface ();
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditioned rational approximation. Warning: Used only if <self> IsRational

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") CirclSection;
		%feature("autodoc", "	* Return the circle section at parameter <Param>, if <self> a IsConicalLaw

	:param Param:
	:type Param: float
	:rtype: opencascade::handle<Geom_Curve>
") CirclSection;
		virtual opencascade::handle<Geom_Curve> CirclSection (const Standard_Real Param);
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "	* Return a copy of the constant Section, if me IsConstant

	:rtype: opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles in all sections. This information is usefull to control error in rational approximation. Warning: Used only if <self> IsRational

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConicalLaw;
		%feature("autodoc", "	* Returns True if all section are circle, with same plane,same center and linear radius evolution Return False by Default.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsConicalLaw;
		virtual Standard_Boolean IsConicalLaw (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if all sections are equals

	:param Error:
	:type Error: float &
	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the sections are rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	* Returns if the sections are periodic or not

	:rtype: bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	* Returns if law is periodic or not

	:rtype: bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the greater section. This information is usefull to G1's control. Warning: With an little value, approximation can be slower.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usefull, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
};


%make_alias(GeomFill_SectionLaw)

%extend GeomFill_SectionLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_SectionPlacement;
class GeomFill_SectionPlacement {
	public:
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("compactdefaultargs") GeomFill_SectionPlacement;
		%feature("autodoc", "	:param L:
	:type L: opencascade::handle<GeomFill_LocationLaw> &
	:param Section:
	:type Section: opencascade::handle<Geom_Geometry> &
	:rtype: None
") GeomFill_SectionPlacement;
		 GeomFill_SectionPlacement (const opencascade::handle<GeomFill_LocationLaw> & L,const opencascade::handle<Geom_Geometry> & Section);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") ModifiedSection;
		%feature("autodoc", "	* Compute the Section, in the coordinate syteme given by the Location Law. To have the Normal to section equal to the Location Law Normal. If <WithTranslation> contact beetween <Section> and <Path> is forced.

	:param WithTranslation:
	:type WithTranslation: bool
	:rtype: opencascade::handle<Geom_Curve>
") ModifiedSection;
		opencascade::handle<Geom_Curve> ModifiedSection (const Standard_Boolean WithTranslation);
		%feature("compactdefaultargs") ParameterOnPath;
		%feature("autodoc", "	:rtype: float
") ParameterOnPath;
		Standard_Real ParameterOnPath ();
		%feature("compactdefaultargs") ParameterOnSection;
		%feature("autodoc", "	:rtype: float
") ParameterOnSection;
		Standard_Real ParameterOnSection ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Path:
	:type Path: opencascade::handle<Adaptor3d_HCurve> &
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & Path,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param ParamOnPath:
	:type ParamOnPath: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real ParamOnPath,const Standard_Real Tol);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Compute the Section, in the coordinate syteme given by the Location Law. If <WithTranslation> contact beetween <Section> and <Path> is forced.

	:param WithTranslation:
	:type WithTranslation: bool
	:rtype: opencascade::handle<Geom_Curve>
") Section;
		opencascade::handle<Geom_Curve> Section (const Standard_Boolean WithTranslation);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* To change the section Law

	:param L:
	:type L: opencascade::handle<GeomFill_LocationLaw> &
	:rtype: None
") SetLocation;
		void SetLocation (const opencascade::handle<GeomFill_LocationLaw> & L);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	:param WithTranslation:
	:type WithTranslation: bool
	:param WithCorrection: default value is Standard_False
	:type WithCorrection: bool
	:rtype: gp_Trsf
") Transformation;
		gp_Trsf Transformation (const Standard_Boolean WithTranslation,const Standard_Boolean WithCorrection = Standard_False);
};


%extend GeomFill_SectionPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_SnglrFunc;
class GeomFill_SnglrFunc : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") GeomFill_SnglrFunc;
		%feature("autodoc", "	:param HC:
	:type HC: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") GeomFill_SnglrFunc;
		 GeomFill_SnglrFunc (const opencascade::handle<Adaptor3d_HCurve> & HC);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "	:param Ratio:
	:type Ratio: float
	:rtype: None
") SetRatio;
		void SetRatio (const Standard_Real Ratio);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
};


%extend GeomFill_SnglrFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Sweep;
class GeomFill_Sweep {
	public:
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Build the Sweeep Surface ApproxStyle defines Approximation Strategy - GeomFill_Section : The composed Function : Location X Section is directly approximed. - GeomFill_Location : The location law is approximed, and the SweepSurface is build algebric composition of approximed location law and section law This option is Ok, if Section.Surface() methode is effective. Continuity : The continuity in v waiting on the surface Degmax : The maximum degree in v requiered on the surface Segmax : The maximum number of span in v requiered on the surface //! raise If Domain are infinite or Profile not Setted.

	:param Section:
	:type Section: opencascade::handle<GeomFill_SectionLaw> &
	:param Methode: default value is GeomFill_Location
	:type Methode: GeomFill_ApproxStyle
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Degmax: default value is 10
	:type Degmax: int
	:param Segmax: default value is 30
	:type Segmax: int
	:rtype: None
") Build;
		void Build (const opencascade::handle<GeomFill_SectionLaw> & Section,const GeomFill_ApproxStyle Methode = GeomFill_Location,const GeomAbs_Shape Continuity = GeomAbs_C2,const Standard_Integer Degmax = 10,const Standard_Integer Segmax = 30);
		%feature("compactdefaultargs") ErrorOnRestriction;
		%feature("autodoc", "	* Gets the Approximation error.

	:param IsFirst:
	:type IsFirst: bool
	:param UError:
	:type UError: float &
	:param VError:
	:type VError: float &
	:rtype: None
") ErrorOnRestriction;
		void ErrorOnRestriction (const Standard_Boolean IsFirst,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "	* Gets the Approximation error.

	:rtype: float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface ();
		%feature("compactdefaultargs") ErrorOnTrace;
		%feature("autodoc", "	* Gets the Approximation error.

	:param IndexOfTrace:
	:type IndexOfTrace: int
	:param UError:
	:type UError: float &
	:param VError:
	:type VError: float &
	:rtype: None
") ErrorOnTrace;
		void ErrorOnTrace (const Standard_Integer IndexOfTrace,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "	* returns true if sections are U-Iso This can be produce in some cases when <WithKpart> is True.

	:rtype: bool
") ExchangeUV;
		Standard_Boolean ExchangeUV ();
		%feature("compactdefaultargs") GeomFill_Sweep;
		%feature("autodoc", "	:param Location:
	:type Location: opencascade::handle<GeomFill_LocationLaw> &
	:param WithKpart: default value is Standard_True
	:type WithKpart: bool
	:rtype: None
") GeomFill_Sweep;
		 GeomFill_Sweep (const opencascade::handle<GeomFill_LocationLaw> & Location,const Standard_Boolean WithKpart = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Tells if the Surface is Buildt.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NumberOfTrace;
		%feature("autodoc", "	:rtype: int
") NumberOfTrace;
		Standard_Integer NumberOfTrace ();
		%feature("compactdefaultargs") Restriction;
		%feature("autodoc", "	:param IsFirst:
	:type IsFirst: bool
	:rtype: opencascade::handle<Geom2d_Curve>
") Restriction;
		opencascade::handle<Geom2d_Curve> Restriction (const Standard_Boolean IsFirst);
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "	* Set parametric information [<First>, <Last>] Sets the parametric bound of the sweeping surface to build. <SectionFirst>, <SectionLast> gives coresponding bounds parameter on the section law of <First> and <Last> //! V-Iso on Sweeping Surface S(u,v) is defined by Location(v) and Section(w) where w = SectionFirst + (v - First) / (Last-First) * (SectionLast - SectionFirst) //! By default w = v, and First and Last are given by First and Last parameter stored in LocationLaw.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param SectionFirst:
	:type SectionFirst: float
	:param SectionLast:
	:type SectionLast: float
	:rtype: None
") SetDomain;
		void SetDomain (const Standard_Real First,const Standard_Real Last,const Standard_Real SectionFirst,const Standard_Real SectionLast);
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "	* Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.

	:param ForceApproxC1:
	:type ForceApproxC1: bool
	:rtype: None
") SetForceApproxC1;
		void SetForceApproxC1 (const Standard_Boolean ForceApproxC1);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Set Approximation Tolerance Tol3d : Tolerance to surface approximation Tol2d : Tolerance used to perform curve approximation Normaly the 2d curve are approximated with a tolerance given by the resolution method define in <LocationLaw> but if this tolerance is too large Tol2d is used. TolAngular : Tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface

	:param Tol3d:
	:type Tol3d: float
	:param BoundTol: default value is 1.0
	:type BoundTol: float
	:param Tol2d: default value is 1.0e-5
	:type Tol2d: float
	:param TolAngular: default value is 1.0
	:type TolAngular: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol3d,const Standard_Real BoundTol = 1.0,const Standard_Real Tol2d = 1.0e-5,const Standard_Real TolAngular = 1.0);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface ();
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "	:param IndexOfTrace:
	:type IndexOfTrace: int
	:rtype: opencascade::handle<Geom2d_Curve>
") Trace;
		opencascade::handle<Geom2d_Curve> Trace (const Standard_Integer IndexOfTrace);
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "	* returns true if Parametrisation sens in U is inverse of parametrisation sens of section (or of path if ExchangeUV)

	:rtype: bool
") UReversed;
		Standard_Boolean UReversed ();
		%feature("compactdefaultargs") VReversed;
		%feature("autodoc", "	* returns true if Parametrisation sens in V is inverse of parametrisation sens of path (or of section if ExchangeUV)

	:rtype: bool
") VReversed;
		Standard_Boolean VReversed ();
};


%extend GeomFill_Sweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_SweepFunction;
class GeomFill_SweepFunction : public Approx_SweepFunction {
	public:
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditionned rational approximation. Warning: Used only if <self> IsRational

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param

	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GeomFill_SweepFunction;
		%feature("autodoc", "	:param Section:
	:type Section: opencascade::handle<GeomFill_SectionLaw> &
	:param Location:
	:type Location: opencascade::handle<GeomFill_LocationLaw> &
	:param FirstParameter:
	:type FirstParameter: float
	:param FirstParameterOnS:
	:type FirstParameterOnS: float
	:param RatioParameterOnS:
	:type RatioParameterOnS: float
	:rtype: None
") GeomFill_SweepFunction;
		 GeomFill_SweepFunction (const opencascade::handle<GeomFill_SectionLaw> & Section,const opencascade::handle<GeomFill_LocationLaw> & Location,const Standard_Real FirstParameter,const Standard_Real FirstParameterOnS,const Standard_Real RatioParameterOnS);
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles of all sections. This information is usefull to perform well conditionned rational approximation. Warning: Used only if <self> IsRational

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns the tolerance to reach in approximation to respecte BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the section is rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the maximum section. This information is usefull to perform well conditionned rational approximation.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "	* get the number of 2d curves to approximate.

	:rtype: int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0

	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usfull, if (me) have to be run numerical algorithme to perform D0, D1 or D2

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
};


%make_alias(GeomFill_SweepFunction)

%extend GeomFill_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Tensor;
class GeomFill_Tensor {
	public:
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Mat:
	:type Mat: int
	:rtype: float
") ChangeValue;
		Standard_Real & ChangeValue (const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat);
		%feature("compactdefaultargs") GeomFill_Tensor;
		%feature("autodoc", "	:param NbRow:
	:type NbRow: int
	:param NbCol:
	:type NbCol: int
	:param NbMat:
	:type NbMat: int
	:rtype: None
") GeomFill_Tensor;
		 GeomFill_Tensor (const Standard_Integer NbRow,const Standard_Integer NbCol,const Standard_Integer NbMat);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all the elements of a Tensor to InitialValue.

	:param InitialValue:
	:type InitialValue: float
	:rtype: None
") Init;
		void Init (const Standard_Real InitialValue);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	:param Right:
	:type Right: math_Vector &
	:param Product:
	:type Product: math_Matrix &
	:rtype: None
") Multiply;
		void Multiply (const math_Vector & Right,math_Matrix & Product);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Mat:
	:type Mat: int
	:rtype: float
") Value;
		const Standard_Real & Value (const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat);
};


%extend GeomFill_Tensor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_TgtField;
class GeomFill_TgtField : public Standard_Transient {
	public:
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the derivative of the field of tangency at parameter W.

	:param W:
	:type W: float
	:rtype: gp_Vec
") D1;
		virtual gp_Vec D1 (const Standard_Real W);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the value and the derivative of the field of tangency at parameter W.

	:param W:
	:type W: float
	:param V:
	:type V: gp_Vec
	:param DV:
	:type DV: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real W,gp_Vec & V,gp_Vec & DV);
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "	:rtype: bool
") IsScalable;
		virtual Standard_Boolean IsScalable ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	:param Func:
	:type Func: opencascade::handle<Law_BSpline> &
	:rtype: void
") Scale;
		virtual void Scale (const opencascade::handle<Law_BSpline> & Func);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the field of tangency at parameter W.

	:param W:
	:type W: float
	:rtype: gp_Vec
") Value;
		virtual gp_Vec Value (const Standard_Real W);
};


%make_alias(GeomFill_TgtField)

%extend GeomFill_TgtField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_TrihedronLaw;
class GeomFill_TrihedronLaw : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Triedrhon on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Give a status to the Law Returns PipeOk (default implementation)

	:rtype: GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus ();
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: None
") GetInterval;
		void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Say if the law is defined, only by the 3d Geometry of the setted Curve Return False by Default.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
};


%make_alias(GeomFill_TrihedronLaw)

%extend GeomFill_TrihedronLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_BoundWithSurf;
class GeomFill_BoundWithSurf : public GeomFill_Boundary {
	public:
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: gp_Vec
	:param DN:
	:type DN: gp_Vec
	:rtype: void
") D1Norm;
		virtual void D1Norm (const Standard_Real U,gp_Vec & N,gp_Vec & DN);
		%feature("compactdefaultargs") GeomFill_BoundWithSurf;
		%feature("autodoc", "	* Constructs a boundary object defined by the 3d curve CurveOnSurf. The surface to be filled along this boundary will be in the tolerance range defined by Tol3d. What's more, at each point of CurveOnSurf, the angle between the normal to the surface to be filled along this boundary, and the normal to the surface on which CurveOnSurf lies, must not be greater than TolAng. This object is to be used as a boundary for a GeomFill_ConstrainedFilling framework. Warning CurveOnSurf is an adapted curve, that is, an object which is an interface between: - the services provided by a curve lying on a surface from the package Geom - and those required of the curve by the computation algorithm which uses it. The adapted curve is created in the following way: opencascade::handle<Geom_Surface> mySurface = ... ; opencascade::handle<Geom2d_Curve> myParamCurve = ... ; // where myParamCurve is a 2D curve in the parametric space of the surface mySurface opencascade::handle<GeomAdaptor_HSurface> Surface = new GeomAdaptor_HSurface(mySurface); opencascade::handle<Geom2dAdaptor_HCurve> ParamCurve = new Geom2dAdaptor_HCurve(myParamCurve); CurveOnSurf = Adaptor3d_CurveOnSurface(ParamCurve,Surface); The boundary is then constructed with the CurveOnSurf object: Standard_Real Tol = ... ; Standard_Real TolAng = ... ; myBoundary = GeomFill_BoundWithSurf ( CurveOnSurf, Tol, TolAng );

	:param CurveOnSurf:
	:type CurveOnSurf: Adaptor3d_CurveOnSurface &
	:param Tol3d:
	:type Tol3d: float
	:param Tolang:
	:type Tolang: float
	:rtype: None
") GeomFill_BoundWithSurf;
		 GeomFill_BoundWithSurf (const Adaptor3d_CurveOnSurface & CurveOnSurf,const Standard_Real Tol3d,const Standard_Real Tolang);
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "	:rtype: bool
") HasNormals;
		virtual Standard_Boolean HasNormals ();
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "	:rtype: bool
") IsDegenerated;
		Standard_Boolean IsDegenerated ();
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Vec
") Norm;
		virtual gp_Vec Norm (const Standard_Real U);
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasDF:
	:type HasDF: bool
	:param HasDL:
	:type HasDL: bool
	:param DF:
	:type DF: float
	:param DL:
	:type DL: float
	:param Rev:
	:type Rev: bool
	:rtype: None
") Reparametrize;
		void Reparametrize (const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasDF,const Standard_Boolean HasDL,const Standard_Real DF,const Standard_Real DL,const Standard_Boolean Rev);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
};


%make_alias(GeomFill_BoundWithSurf)

%extend GeomFill_BoundWithSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_ConstantBiNormal;
class GeomFill_ConstantBiNormal : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes Triedrhon on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_ConstantBiNormal;
		%feature("autodoc", "	:param BiNormal:
	:type BiNormal: gp_Dir
	:rtype: None
") GeomFill_ConstantBiNormal;
		 GeomFill_ConstantBiNormal (const gp_Dir & BiNormal);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Gets average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Says if the law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Return True.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
};


%make_alias(GeomFill_ConstantBiNormal)

%extend GeomFill_ConstantBiNormal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Coons;
class GeomFill_Coons : public GeomFill_Filling {
	public:
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "	:rtype: None
") GeomFill_Coons;
		 GeomFill_Coons ();
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:rtype: None
") GeomFill_Coons;
		 GeomFill_Coons (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4);
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:param W3:
	:type W3: TColStd_Array1OfReal &
	:param W4:
	:type W4: TColStd_Array1OfReal &
	:rtype: None
") GeomFill_Coons;
		 GeomFill_Coons (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2,const TColStd_Array1OfReal & W3,const TColStd_Array1OfReal & W4);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:param W3:
	:type W3: TColStd_Array1OfReal &
	:param W4:
	:type W4: TColStd_Array1OfReal &
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2,const TColStd_Array1OfReal & W3,const TColStd_Array1OfReal & W4);
};


%extend GeomFill_Coons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_CorrectedFrenet;
class GeomFill_CorrectedFrenet : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Triedrhon on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") EvaluateBestMode;
		%feature("autodoc", "	* Tries to define the best trihedron mode for the curve. It can be: - Frenet - CorrectedFrenet - DiscreteTrihedron Warning: the CorrectedFrenet must be constructed with option ForEvaluation = True, the curve must be set by method SetCurve.

	:rtype: GeomFill_Trihedron
") EvaluateBestMode;
		GeomFill_Trihedron EvaluateBestMode ();
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "	:rtype: None
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet ();
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "	:param ForEvaluation:
	:type ForEvaluation: bool
	:rtype: None
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet (const Standard_Boolean ForEvaluation);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Return True.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
};


%make_alias(GeomFill_CorrectedFrenet)

%extend GeomFill_CorrectedFrenet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_CurveAndTrihedron;
class GeomFill_CurveAndTrihedron : public GeomFill_LocationLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location and 2d points

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location and 2d points

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,TColgp_Array1OfPnt2d & Poles2d);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute location 2d points and associated first derivatives. Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute location 2d points and associated first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param D2M:
	:type D2M: gp_Mat
	:param D2V:
	:type D2V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,gp_Mat & D2M,gp_Vec & D2V,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d);
		%feature("compactdefaultargs") GeomFill_CurveAndTrihedron;
		%feature("autodoc", "	:param Trihedron:
	:type Trihedron: opencascade::handle<GeomFill_TrihedronLaw> &
	:rtype: None
") GeomFill_CurveAndTrihedron;
		 GeomFill_CurveAndTrihedron (const opencascade::handle<GeomFill_TrihedronLaw> & Trihedron);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param AM:
	:type AM: gp_Mat
	:param AV:
	:type AV: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Mat & AM,gp_Vec & AV);
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "	* Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).

	:rtype: float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "	* Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsRotation;
		virtual Standard_Boolean IsRotation (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "	* Say if the Location Law, is an translation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsTranslation;
		virtual Standard_Boolean IsTranslation (Standard_Real &OutValue);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:param Center:
	:type Center: gp_Pnt
	:rtype: void
") Rotation;
		virtual void Rotation (gp_Pnt & Center);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "	* Set a transformation Matrix like the law M(t) become Mat * M(t)

	:param Transfo:
	:type Transfo: gp_Mat
	:rtype: void
") SetTrsf;
		virtual void SetTrsf (const gp_Mat & Transfo);
};


%make_alias(GeomFill_CurveAndTrihedron)

%extend GeomFill_CurveAndTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Curved;
class GeomFill_Curved : public GeomFill_Filling {
	public:
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "	:rtype: None
") GeomFill_Curved;
		 GeomFill_Curved ();
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:rtype: None
") GeomFill_Curved;
		 GeomFill_Curved (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4);
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:param W3:
	:type W3: TColStd_Array1OfReal &
	:param W4:
	:type W4: TColStd_Array1OfReal &
	:rtype: None
") GeomFill_Curved;
		 GeomFill_Curved (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2,const TColStd_Array1OfReal & W3,const TColStd_Array1OfReal & W4);
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:rtype: None
") GeomFill_Curved;
		 GeomFill_Curved (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2);
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:rtype: None
") GeomFill_Curved;
		 GeomFill_Curved (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:param W3:
	:type W3: TColStd_Array1OfReal &
	:param W4:
	:type W4: TColStd_Array1OfReal &
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2,const TColStd_Array1OfReal & W3,const TColStd_Array1OfReal & W4);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2);
};


%extend GeomFill_Curved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Darboux;
class GeomFill_Darboux : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Triedrhon on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_Darboux;
		%feature("autodoc", "	:rtype: None
") GeomFill_Darboux;
		 GeomFill_Darboux ();
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Return False.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
};


%make_alias(GeomFill_Darboux)

%extend GeomFill_Darboux {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_DegeneratedBound;
class GeomFill_DegeneratedBound : public GeomFill_Boundary {
	public:
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") GeomFill_DegeneratedBound;
		%feature("autodoc", "	:param Point:
	:type Point: gp_Pnt
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol3d:
	:type Tol3d: float
	:param Tolang:
	:type Tolang: float
	:rtype: None
") GeomFill_DegeneratedBound;
		 GeomFill_DegeneratedBound (const gp_Pnt & Point,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real Tolang);
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "	:rtype: bool
") IsDegenerated;
		Standard_Boolean IsDegenerated ();
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasDF:
	:type HasDF: bool
	:param HasDL:
	:type HasDL: bool
	:param DF:
	:type DF: float
	:param DL:
	:type DL: float
	:param Rev:
	:type Rev: bool
	:rtype: None
") Reparametrize;
		void Reparametrize (const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasDF,const Standard_Boolean HasDL,const Standard_Real DF,const Standard_Real DL,const Standard_Boolean Rev);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
};


%make_alias(GeomFill_DegeneratedBound)

%extend GeomFill_DegeneratedBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_DiscreteTrihedron;
class GeomFill_DiscreteTrihedron : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Trihedron on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Trihedron and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation For the moment it returns null values for DTangent, DNormal and DBiNormal.

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation For the moment it returns null values for DTangent, DNormal DBiNormal, D2Tangent, D2Normal, D2BiNormal.

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_DiscreteTrihedron;
		%feature("autodoc", "	:rtype: None
") GeomFill_DiscreteTrihedron;
		 GeomFill_DiscreteTrihedron ();
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of Tangent(t) and Normal(t) it is usful to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Return True.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
};


%make_alias(GeomFill_DiscreteTrihedron)

%extend GeomFill_DiscreteTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_DraftTrihedron;
class GeomFill_DraftTrihedron : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_DraftTrihedron;
		%feature("autodoc", "	:param BiNormal:
	:type BiNormal: gp_Vec
	:param Angle:
	:type Angle: float
	:rtype: None
") GeomFill_DraftTrihedron;
		 GeomFill_DraftTrihedron (const gp_Vec & BiNormal,const Standard_Real Angle);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of Tangent(t) and Normal(t) it is usefull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Return True.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param Angle:
	:type Angle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real Angle);
};


%make_alias(GeomFill_DraftTrihedron)

%extend GeomFill_DraftTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_EvolvedSection;
class GeomFill_EvolvedSection : public GeomFill_SectionLaw {
	public:
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "	* give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface ();
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditioned rational approximation. Warning: Used only if <self> IsRational

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "	* Return the constant Section if <self> IsConstant.

	:rtype: opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GeomFill_EvolvedSection;
		%feature("autodoc", "	* Make an SectionLaw with a Curve and a real Law.

	:param C:
	:type C: opencascade::handle<Geom_Curve> &
	:param L:
	:type L: opencascade::handle<Law_Function> &
	:rtype: None
") GeomFill_EvolvedSection;
		 GeomFill_EvolvedSection (const opencascade::handle<Geom_Curve> & C,const opencascade::handle<Law_Function> & L);
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles in all sections. This information is usefull to control error in rational approximation. Warning: Used only if <self> IsRational

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* return True If the Law isConstant

	:param Error:
	:type Error: float &
	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the sections are rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	* Returns if the sections are periodic or not

	:rtype: bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	* Returns if the law isperiodic or not

	:rtype: bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the greater section. This information is usefull to G1's control. Warning: With an little value, approximation can be slower.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
};


%make_alias(GeomFill_EvolvedSection)

%extend GeomFill_EvolvedSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Fixed;
class GeomFill_Fixed : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Triedrhon on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_Fixed;
		%feature("autodoc", "	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:rtype: None
") GeomFill_Fixed;
		 GeomFill_Fixed (const gp_Vec & Tangent,const gp_Vec & Normal);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Return True.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
};


%make_alias(GeomFill_Fixed)

%extend GeomFill_Fixed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Frenet;
class GeomFill_Frenet : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Triedrhon on curve at parameter <Param>

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute Trihedron on curve first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_Frenet;
		%feature("autodoc", "	:rtype: None
") GeomFill_Frenet;
		 GeomFill_Frenet ();
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant.

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Return True.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
};


%make_alias(GeomFill_Frenet)

%extend GeomFill_Frenet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Generator;
class GeomFill_Generator : public GeomFill_Profiler {
	public:
		%feature("compactdefaultargs") GeomFill_Generator;
		%feature("autodoc", "	:rtype: None
") GeomFill_Generator;
		 GeomFill_Generator ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Converts all curves to BSplineCurves. Set them to the common profile. Compute the surface (degv = 1). <PTol> is used to compare 2 knots.

	:param PTol:
	:type PTol: float
	:rtype: void
") Perform;
		virtual void Perform (const Standard_Real PTol);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface ();
};


%extend GeomFill_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_LocationDraft;
class GeomFill_LocationDraft : public GeomFill_LocationLaw {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location and 2d points

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,TColgp_Array1OfPnt2d & Poles2d);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute location 2d points and associated first derivatives. Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute location 2d points and associated first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param D2M:
	:type D2M: gp_Mat
	:param D2V:
	:type D2V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,gp_Mat & D2M,gp_Vec & D2V,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") GeomFill_LocationDraft;
		%feature("autodoc", "	:param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:rtype: None
") GeomFill_LocationDraft;
		 GeomFill_LocationDraft (const gp_Dir & Direction,const Standard_Real Angle);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param AM:
	:type AM: gp_Mat
	:param AV:
	:type AV: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Mat & AM,gp_Vec & AV);
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "	* Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).

	:rtype: float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm ();
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "	* Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation)

	:rtype: bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction ();
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "	* Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation)

	:rtype: bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsIntersec;
		%feature("autodoc", "	* Say if the generatrice interset the surface

	:rtype: bool
") IsIntersec;
		Standard_Boolean IsIntersec ();
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "	* Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsRotation;
		virtual Standard_Boolean IsRotation (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "	* Say if the Location Law, is an translation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsTranslation;
		virtual Standard_Boolean IsTranslation (Standard_Real &OutValue);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0

	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:param Center:
	:type Center: gp_Pnt
	:rtype: void
") Rotation;
		virtual void Rotation (gp_Pnt & Center);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param Angle:
	:type Angle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real Angle);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetStopSurf;
		%feature("autodoc", "	:param Surf:
	:type Surf: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") SetStopSurf;
		void SetStopSurf (const opencascade::handle<Adaptor3d_HSurface> & Surf);
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "	:param Transfo:
	:type Transfo: gp_Mat
	:rtype: void
") SetTrsf;
		virtual void SetTrsf (const gp_Mat & Transfo);
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "	* Give the number of trace (Curves 2d wich are not restriction) Returns 1 (default implementation)

	:rtype: int
") TraceNumber;
		virtual Standard_Integer TraceNumber ();
};


%make_alias(GeomFill_LocationDraft)

%extend GeomFill_LocationDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_LocationGuide;
class GeomFill_LocationGuide : public GeomFill_LocationLaw {
	public:
		%feature("compactdefaultargs") ComputeAutomaticLaw;
		%feature("autodoc", "	:param ParAndRad:
	:type ParAndRad: opencascade::handle<TColgp_HArray1OfPnt2d>
	:rtype: GeomFill_PipeError
") ComputeAutomaticLaw;
		GeomFill_PipeError ComputeAutomaticLaw (opencascade::handle<TColgp_HArray1OfPnt2d> & ParAndRad);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute Location and 2d points

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,TColgp_Array1OfPnt2d & Poles2d);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute location 2d points and associated first derivatives. Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute location 2d points and associated first and seconde derivatives. Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param M:
	:type M: gp_Mat
	:param V:
	:type V: gp_Vec
	:param DM:
	:type DM: gp_Mat
	:param DV:
	:type DV: gp_Vec
	:param D2M:
	:type D2M: gp_Mat
	:param D2V:
	:type D2V: gp_Vec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Mat & M,gp_Vec & V,gp_Mat & DM,gp_Vec & DV,gp_Mat & D2M,gp_Vec & D2V,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d);
		%feature("compactdefaultargs") EraseRotation;
		%feature("autodoc", "	:rtype: None
") EraseRotation;
		void EraseRotation ();
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Give a status to the Law Returns PipeOk (default implementation)

	:rtype: GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus ();
		%feature("compactdefaultargs") GeomFill_LocationGuide;
		%feature("autodoc", "	:param Triedre:
	:type Triedre: opencascade::handle<GeomFill_TrihedronWithGuide> &
	:rtype: None
") GeomFill_LocationGuide;
		 GeomFill_LocationGuide (const opencascade::handle<GeomFill_TrihedronWithGuide> & Triedre);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param AM:
	:type AM: gp_Mat
	:param AV:
	:type AV: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Mat & AM,gp_Vec & AV);
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve ();
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "	* Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).

	:rtype: float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm ();
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") Guide;
		opencascade::handle<Adaptor3d_HCurve> Guide ();
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "	* Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation)

	:rtype: bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction ();
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "	* Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation)

	:rtype: bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "	* Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsRotation;
		virtual Standard_Boolean IsRotation (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "	* Say if the Location Law, is an translation of Location The default implementation is ' returns False '.

	:param Error:
	:type Error: float &
	:rtype: bool
") IsTranslation;
		virtual Standard_Boolean IsTranslation (Standard_Real &OutValue);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0

	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float &
	:param TolV:
	:type TolV: float &
	:rtype: void
") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	:param Center:
	:type Center: gp_Pnt
	:rtype: void
") Rotation;
		virtual void Rotation (gp_Pnt & Center);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Curve>
") Section;
		opencascade::handle<Geom_Curve> Section ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Section:
	:type Section: opencascade::handle<GeomFill_SectionLaw> &
	:param rotat:
	:type rotat: bool
	:param SFirst:
	:type SFirst: float
	:param SLast:
	:type SLast: float
	:param PrecAngle:
	:type PrecAngle: float
	:param LastAngle:
	:type LastAngle: float &
	:rtype: None
") Set;
		void Set (const opencascade::handle<GeomFill_SectionLaw> & Section,const Standard_Boolean rotat,const Standard_Real SFirst,const Standard_Real SLast,const Standard_Real PrecAngle,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
		%feature("compactdefaultargs") SetOrigine;
		%feature("autodoc", "	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:rtype: None
") SetOrigine;
		void SetOrigine (const Standard_Real Param1,const Standard_Real Param2);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Is usefull, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.

	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void
") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "	:param Transfo:
	:type Transfo: gp_Mat
	:rtype: void
") SetTrsf;
		virtual void SetTrsf (const gp_Mat & Transfo);
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "	* Give the number of trace (Curves 2d wich are not restriction) Returns 1 (default implementation)

	:rtype: int
") TraceNumber;
		virtual Standard_Integer TraceNumber ();
};


%make_alias(GeomFill_LocationGuide)

%extend GeomFill_LocationGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_SectionGenerator;
class GeomFill_SectionGenerator : public GeomFill_Profiler {
	public:
		%feature("compactdefaultargs") GeomFill_SectionGenerator;
		%feature("autodoc", "	:rtype: None
") GeomFill_SectionGenerator;
		 GeomFill_SectionGenerator ();
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:param NbPoles2d:
	:type NbPoles2d: int &
	:rtype: None
") GetShape;
		void GetShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: None
") Mults;
		void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of Section<P>, to impose it for the approximation.

	:param P:
	:type P: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer P);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	* Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.

	:param P:
	:type P: int
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") Section;
		Standard_Boolean Section (const Standard_Integer P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "	:param P:
	:type P: int
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: None
") Section;
		void Section (const Standard_Integer P,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "	:param Params:
	:type Params: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: None
") SetParam;
		void SetParam (const opencascade::handle<TColStd_HArray1OfReal> & Params);
};


%extend GeomFill_SectionGenerator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_SimpleBound;
class GeomFill_SimpleBound : public GeomFill_Boundary {
	public:
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") GeomFill_SimpleBound;
		%feature("autodoc", "	* Constructs the boundary object defined by the 3d curve. The surface to be built along this boundary will be in the tolerance range defined by Tol3d. This object is to be used as a boundary for a GeomFill_ConstrainedFilling framework. Dummy is initialized but has no function in this class. Warning Curve is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm which uses it. The adapted curve is created in one of the following ways: - First sequence: opencascade::handle<Geom_Curve> myCurve = ... ; opencascade::handle<GeomAdaptor_HCurve> Curve = new GeomAdaptor_HCurve(myCurve); - Second sequence: // Step 1 opencascade::handle<Geom_Curve> myCurve = ... ; GeomAdaptor_Curve Crv (myCurve); // Step 2 opencascade::handle<GeomAdaptor_HCurve> Curve = new GeomAdaptor_HCurve(Crv); You use the second part of this sequence if you already have the adapted curve Crv. The boundary is then constructed with the Curve object: Standard_Real Tol = ... ; Standard_Real dummy = 0. ; myBoundary = GeomFill_SimpleBound (Curve,Tol,dummy);

	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param Tol3d:
	:type Tol3d: float
	:param Tolang:
	:type Tolang: float
	:rtype: None
") GeomFill_SimpleBound;
		 GeomFill_SimpleBound (const opencascade::handle<Adaptor3d_HCurve> & Curve,const Standard_Real Tol3d,const Standard_Real Tolang);
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "	:rtype: bool
") IsDegenerated;
		Standard_Boolean IsDegenerated ();
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasDF:
	:type HasDF: bool
	:param HasDL:
	:type HasDL: bool
	:param DF:
	:type DF: float
	:param DL:
	:type DL: float
	:param Rev:
	:type Rev: bool
	:rtype: None
") Reparametrize;
		void Reparametrize (const Standard_Real First,const Standard_Real Last,const Standard_Boolean HasDF,const Standard_Boolean HasDL,const Standard_Real DF,const Standard_Real DL,const Standard_Boolean Rev);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
};


%make_alias(GeomFill_SimpleBound)

%extend GeomFill_SimpleBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_Stretch;
class GeomFill_Stretch : public GeomFill_Filling {
	public:
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "	:rtype: None
") GeomFill_Stretch;
		 GeomFill_Stretch ();
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:rtype: None
") GeomFill_Stretch;
		 GeomFill_Stretch (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4);
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:param W3:
	:type W3: TColStd_Array1OfReal &
	:param W4:
	:type W4: TColStd_Array1OfReal &
	:rtype: None
") GeomFill_Stretch;
		 GeomFill_Stretch (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2,const TColStd_Array1OfReal & W3,const TColStd_Array1OfReal & W4);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P1:
	:type P1: TColgp_Array1OfPnt
	:param P2:
	:type P2: TColgp_Array1OfPnt
	:param P3:
	:type P3: TColgp_Array1OfPnt
	:param P4:
	:type P4: TColgp_Array1OfPnt
	:param W1:
	:type W1: TColStd_Array1OfReal &
	:param W2:
	:type W2: TColStd_Array1OfReal &
	:param W3:
	:type W3: TColStd_Array1OfReal &
	:param W4:
	:type W4: TColStd_Array1OfReal &
	:rtype: None
") Init;
		void Init (const TColgp_Array1OfPnt & P1,const TColgp_Array1OfPnt & P2,const TColgp_Array1OfPnt & P3,const TColgp_Array1OfPnt & P4,const TColStd_Array1OfReal & W1,const TColStd_Array1OfReal & W2,const TColStd_Array1OfReal & W3,const TColStd_Array1OfReal & W4);
};


%extend GeomFill_Stretch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_TgtOnCoons;
class GeomFill_TgtOnCoons : public GeomFill_TgtField {
	public:
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the derivative of the field of tangency at parameter W.

	:param W:
	:type W: float
	:rtype: gp_Vec
") D1;
		gp_Vec D1 (const Standard_Real W);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the value and the derivative of the field of tangency at parameter W.

	:param W:
	:type W: float
	:param T:
	:type T: gp_Vec
	:param DT:
	:type DT: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real W,gp_Vec & T,gp_Vec & DT);
		%feature("compactdefaultargs") GeomFill_TgtOnCoons;
		%feature("autodoc", "	:param K:
	:type K: opencascade::handle<GeomFill_CoonsAlgPatch> &
	:param I:
	:type I: int
	:rtype: None
") GeomFill_TgtOnCoons;
		 GeomFill_TgtOnCoons (const opencascade::handle<GeomFill_CoonsAlgPatch> & K,const Standard_Integer I);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the field of tangency at parameter W.

	:param W:
	:type W: float
	:rtype: gp_Vec
") Value;
		gp_Vec Value (const Standard_Real W);
};


%make_alias(GeomFill_TgtOnCoons)

%extend GeomFill_TgtOnCoons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_TrihedronWithGuide;
class GeomFill_TrihedronWithGuide : public GeomFill_TrihedronLaw {
	public:
		%feature("compactdefaultargs") CurrentPointOnGuide;
		%feature("autodoc", "	* Returns the current point on guide found by D0, D1 or D2.

	:rtype: gp_Pnt
") CurrentPointOnGuide;
		gp_Pnt CurrentPointOnGuide ();
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide ();
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:rtype: void
") Origine;
		virtual void Origine (const Standard_Real Param1,const Standard_Real Param2);
};


%make_alias(GeomFill_TrihedronWithGuide)

%extend GeomFill_TrihedronWithGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_UniformSection;
class GeomFill_UniformSection : public GeomFill_SectionLaw {
	public:
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "	* give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface ();
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "	* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditioned rational approximation. Warning: Used only if <self> IsRational

	:rtype: gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "	* Return the constant Section if <self> IsConstant.

	:rtype: opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* compute the section for v = param

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* compute the first derivative in v direction of the section for v = param Warning : It used only for C1 or C2 aproximation

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* compute the second derivative in v direction of the section for v = param Warning : It used only for C2 aproximation

	:param Param:
	:type Param: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal &
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal &
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);
		%feature("compactdefaultargs") GeomFill_UniformSection;
		%feature("autodoc", "	* Make an constant Law with C. [First, Last] define law definition domain

	:param C:
	:type C: opencascade::handle<Geom_Curve> &
	:param FirstParameter: default value is 0.0
	:type FirstParameter: float
	:param LastParameter: default value is 1.0
	:type LastParameter: float
	:rtype: None
") GeomFill_UniformSection;
		 GeomFill_UniformSection (const opencascade::handle<Geom_Curve> & C,const Standard_Real FirstParameter = 0.0,const Standard_Real LastParameter = 1.0);
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "	* Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetDomain;
		virtual void GetDomain (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "	* Gets the bounds of the parametric interval on the function

	:param First:
	:type First: float &
	:param Last:
	:type Last: float &
	:rtype: void
") GetInterval;
		virtual void GetInterval (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "	* Compute the minimal value of weight for each poles in all sections. This information is usefull to control error in rational approximation. Warning: Used only if <self> IsRational

	:param Weigths:
	:type Weigths: TColStd_Array1OfReal &
	:rtype: void
") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.

	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal &
	:rtype: void
") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* return True

	:param Error:
	:type Error: float &
	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant (Standard_Real &OutValue);
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	* Returns if the sections are rationnal or not

	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	* Returns if the sections are periodic or not

	:rtype: bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	* Returns if the law isperiodic or not

	:rtype: bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "	* get the Knots of the section

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:rtype: void
") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "	* Returns the length of the greater section. This information is usefull to G1's control. Warning: With an little value, approximation can be slower.

	:rtype: float
") MaximalSection;
		virtual Standard_Real MaximalSection ();
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "	* get the Multplicities of the section

	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "	* get the format of an section

	:param NbPoles:
	:type NbPoles: int &
	:param NbKnots:
	:type NbKnots: int &
	:param Degree:
	:type Degree: int &
	:rtype: void
") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
};


%make_alias(GeomFill_UniformSection)

%extend GeomFill_UniformSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_GuideTrihedronAC;
class GeomFill_GuideTrihedronAC : public GeomFill_TrihedronWithGuide {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") GeomFill_GuideTrihedronAC;
		%feature("autodoc", "	:param guide:
	:type guide: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") GeomFill_GuideTrihedronAC;
		 GeomFill_GuideTrihedronAC (const opencascade::handle<Adaptor3d_HCurve> & guide);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Say if the law is defined, only by the 3d Geometry of the setted Curve Return False by Default.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "	:param OrACR1:
	:type OrACR1: float
	:param OrACR2:
	:type OrACR2: float
	:rtype: void
") Origine;
		virtual void Origine (const Standard_Real OrACR1,const Standard_Real OrACR2);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
};


%make_alias(GeomFill_GuideTrihedronAC)

%extend GeomFill_GuideTrihedronAC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomFill_GuideTrihedronPlan;
class GeomFill_GuideTrihedronPlan : public GeomFill_TrihedronWithGuide {
	public:
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:rtype: bool
") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & Normal,gp_Vec & BiNormal);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & BiNormal,gp_Vec & DBiNormal);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param Tangent:
	:type Tangent: gp_Vec
	:param DTangent:
	:type DTangent: gp_Vec
	:param D2Tangent:
	:type D2Tangent: gp_Vec
	:param Normal:
	:type Normal: gp_Vec
	:param DNormal:
	:type DNormal: gp_Vec
	:param D2Normal:
	:type D2Normal: gp_Vec
	:param BiNormal:
	:type BiNormal: gp_Vec
	:param DBiNormal:
	:type DBiNormal: gp_Vec
	:param D2BiNormal:
	:type D2BiNormal: gp_Vec
	:rtype: bool
") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,gp_Vec & Tangent,gp_Vec & DTangent,gp_Vec & D2Tangent,gp_Vec & Normal,gp_Vec & DNormal,gp_Vec & D2Normal,gp_Vec & BiNormal,gp_Vec & DBiNormal,gp_Vec & D2BiNormal);
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Give a status to the Law Returns PipeOk (default implementation)

	:rtype: GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus ();
		%feature("compactdefaultargs") GeomFill_GuideTrihedronPlan;
		%feature("autodoc", "	:param theGuide:
	:type theGuide: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") GeomFill_GuideTrihedronPlan;
		 GeomFill_GuideTrihedronPlan (const opencascade::handle<Adaptor3d_HCurve> & theGuide);
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "	* Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.

	:param ATangent:
	:type ATangent: gp_Vec
	:param ANormal:
	:type ANormal: gp_Vec
	:param ABiNormal:
	:type ABiNormal: gp_Vec
	:rtype: void
") GetAverageLaw;
		virtual void GetAverageLaw (gp_Vec & ATangent,gp_Vec & ANormal,gp_Vec & ABiNormal);
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide ();
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "	* Say if the law is Constant

	:rtype: bool
") IsConstant;
		virtual Standard_Boolean IsConstant ();
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "	* Say if the law is defined, only by the 3d Geometry of the setted Curve Return False by Default.

	:rtype: bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "	:param OrACR1:
	:type OrACR1: float
	:param OrACR2:
	:type OrACR2: float
	:rtype: void
") Origine;
		virtual void Origine (const Standard_Real OrACR1,const Standard_Real OrACR2);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param thePath:
	:type thePath: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: void
") SetCurve;
		virtual void SetCurve (const opencascade::handle<Adaptor3d_HCurve> & thePath);
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "	* Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void
") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);
};


%make_alias(GeomFill_GuideTrihedronPlan)

%extend GeomFill_GuideTrihedronPlan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
%wrap_handle(GeomFill_HArray1OfLocationLaw)
class GeomFill_HArray1OfLocationLaw : public  GeomFill_Array1OfLocationLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const  GeomFill_Array1OfLocationLaw::value_type& theValue);
    GeomFill_HArray1OfLocationLaw(const  GeomFill_Array1OfLocationLaw& theOther);
    const  GeomFill_Array1OfLocationLaw& Array1();
     GeomFill_Array1OfLocationLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfLocationLaw)


%wrap_handle(GeomFill_HArray1OfSectionLaw)
class GeomFill_HArray1OfSectionLaw : public  GeomFill_Array1OfSectionLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const  GeomFill_Array1OfSectionLaw::value_type& theValue);
    GeomFill_HArray1OfSectionLaw(const  GeomFill_Array1OfSectionLaw& theOther);
    const  GeomFill_Array1OfSectionLaw& Array1();
     GeomFill_Array1OfSectionLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfSectionLaw)


/* harray2 class */
/* harray2 class */
%wrap_handle(GeomFill_HSequenceOfAx2)
class GeomFill_HSequenceOfAx2 : public  GeomFill_SequenceOfAx2, public Standard_Transient {
    GeomFill_HSequenceOfAx2();
    GeomFill_HSequenceOfAx2(const  GeomFill_SequenceOfAx2& theOther);
    const  GeomFill_SequenceOfAx2& Sequence();
    void Append (const  GeomFill_SequenceOfAx2::value_type& theItem);
    void Append ( GeomFill_SequenceOfAx2& theSequence);
     GeomFill_SequenceOfAx2& ChangeSequence();
};
%make_alias(GeomFill_HSequenceOfAx2)


