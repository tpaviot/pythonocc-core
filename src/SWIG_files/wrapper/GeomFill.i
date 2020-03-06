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
%define GEOMFILLDOCSTRING
"GeomFill module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomfill.html"
%enddef
%module (package="OCC.Core", docstring=GEOMFILLDOCSTRING) GeomFill


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
#include<GeomFill_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Convert_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<AppBlend_module.hxx>
#include<GeomAbs_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Law_module.hxx>
#include<math_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<FEmTool_module.hxx>
#include<AppParCurves_module.hxx>
#include<PLib_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Convert.i
%import gp.i
%import TColgp.i
%import TColStd.i
%import Geom.i
%import AppBlend.i
%import GeomAbs.i
%import Approx.i
%import Adaptor3d.i
%import Law.i
%import math.i
%import Geom2d.i
%import TColGeom.i

%pythoncode {
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class GeomFill_ApproxStyle:
	GeomFill_Section = 0
	GeomFill_Location = 1

class GeomFill_Trihedron:
	GeomFill_IsCorrectedFrenet = 0
	GeomFill_IsFixed = 1
	GeomFill_IsFrenet = 2
	GeomFill_IsConstantNormal = 3
	GeomFill_IsDarboux = 4
	GeomFill_IsGuideAC = 5
	GeomFill_IsGuidePlan = 6
	GeomFill_IsGuideACWithContact = 7
	GeomFill_IsGuidePlanWithContact = 8
	GeomFill_IsDiscreteTrihedron = 9

class GeomFill_FillingStyle:
	GeomFill_StretchStyle = 0
	GeomFill_CoonsStyle = 1
	GeomFill_CurvedStyle = 2

class GeomFill_PipeError:
	GeomFill_PipeOk = 0
	GeomFill_PipeNotOk = 1
	GeomFill_PlaneNotIntersectGuide = 2
	GeomFill_ImpossibleContact = 3
};
/* end python proxy for enums */

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
%wrap_handle(GeomFill_HArray1OfLocationLaw)
%wrap_handle(GeomFill_HArray1OfSectionLaw)
%wrap_handle(GeomFill_HSequenceOfAx2)
/* end handles declaration */

/* templates */
%template(GeomFill_Array1OfLocationLaw) NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>;

%extend NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>> {
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
%template(GeomFill_Array1OfSectionLaw) NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>;

%extend NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>> {
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
%template(GeomFill_SequenceOfAx2) NCollection_Sequence<gp_Ax2>;
%template(GeomFill_SequenceOfTrsf) NCollection_Sequence<gp_Trsf>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>> GeomFill_Array1OfLocationLaw;
typedef NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>> GeomFill_Array1OfSectionLaw;
typedef NCollection_Sequence<gp_Ax2> GeomFill_SequenceOfAx2;
typedef NCollection_Sequence<gp_Trsf> GeomFill_SequenceOfTrsf;
/* end typedefs declaration */

/*****************
* class GeomFill *
*****************/
%rename(geomfill) GeomFill;
class GeomFill {
	public:
		/****************** GetCircle ******************/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
TConv: Convert_ParameterisationType
ns1: gp_Vec
ns2: gp_Vec
nplan: gp_Vec
pt1: gp_Pnt
pt2: gp_Pnt
Rayon: float
Center: gp_Pnt
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetCircle;
		static void GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & nplan, const gp_Pnt & pt1, const gp_Pnt & pt2, const Standard_Real Rayon, const gp_Pnt & Center, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****************** GetCircle ******************/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
TConv: Convert_ParameterisationType
ns1: gp_Vec
ns2: gp_Vec
dn1w: gp_Vec
dn2w: gp_Vec
nplan: gp_Vec
dnplan: gp_Vec
pts1: gp_Pnt
pts2: gp_Pnt
tang1: gp_Vec
tang2: gp_Vec
Rayon: float
DRayon: float
Center: gp_Pnt
DCenter: gp_Vec
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") GetCircle;
		static Standard_Boolean GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & dn1w, const gp_Vec & dn2w, const gp_Vec & nplan, const gp_Vec & dnplan, const gp_Pnt & pts1, const gp_Pnt & pts2, const gp_Vec & tang1, const gp_Vec & tang2, const Standard_Real Rayon, const Standard_Real DRayon, const gp_Pnt & Center, const gp_Vec & DCenter, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** GetCircle ******************/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
TConv: Convert_ParameterisationType
ns1: gp_Vec
ns2: gp_Vec
dn1w: gp_Vec
dn2w: gp_Vec
d2n1w: gp_Vec
d2n2w: gp_Vec
nplan: gp_Vec
dnplan: gp_Vec
d2nplan: gp_Vec
pts1: gp_Pnt
pts2: gp_Pnt
tang1: gp_Vec
tang2: gp_Vec
Dtang1: gp_Vec
Dtang2: gp_Vec
Rayon: float
DRayon: float
D2Rayon: float
Center: gp_Pnt
DCenter: gp_Vec
D2Center: gp_Vec
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") GetCircle;
		static Standard_Boolean GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & dn1w, const gp_Vec & dn2w, const gp_Vec & d2n1w, const gp_Vec & d2n2w, const gp_Vec & nplan, const gp_Vec & dnplan, const gp_Vec & d2nplan, const gp_Pnt & pts1, const gp_Pnt & pts2, const gp_Vec & tang1, const gp_Vec & tang2, const gp_Vec & Dtang1, const gp_Vec & Dtang2, const Standard_Real Rayon, const Standard_Real DRayon, const Standard_Real D2Rayon, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeights ******************/
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "No available documentation.

Parameters
----------
TConv: Convert_ParameterisationType
AngleMin: float
AngleMax: float
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeights;
		static void GetMinimalWeights(const Convert_ParameterisationType TConv, const Standard_Real AngleMin, const Standard_Real AngleMax, TColStd_Array1OfReal & Weigths);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
MaxAng: float
TypeConv: Convert_ParameterisationType

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") GetShape;
		static void GetShape(const Standard_Real MaxAng, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Convert_ParameterisationType & TypeConv);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Used by the generical classes to determine tolerance for approximation.

Parameters
----------
TConv: Convert_ParameterisationType
AngleMin: float
Radius: float
AngularTol: float
SpatialTol: float

Returns
-------
float
") GetTolerance;
		static Standard_Real GetTolerance(const Convert_ParameterisationType TConv, const Standard_Real AngleMin, const Standard_Real Radius, const Standard_Real AngularTol, const Standard_Real SpatialTol);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeConv: Convert_ParameterisationType
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		static void Knots(const Convert_ParameterisationType TypeConv, TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TypeConv: Convert_ParameterisationType
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		static void Mults(const Convert_ParameterisationType TypeConv, TColStd_Array1OfInteger & TMults);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Builds a ruled surface between the two curves, curve1 and curve2.

Parameters
----------
Curve1: Geom_Curve
Curve2: Geom_Curve

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const opencascade::handle<Geom_Curve> & Curve1, const opencascade::handle<Geom_Curve> & Curve2);

};


%extend GeomFill {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_AppSurf *
*************************/
class GeomFill_AppSurf : public AppBlend_Approx {
	public:
		/****************** GeomFill_AppSurf ******************/
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_AppSurf;
		 GeomFill_AppSurf();

		/****************** GeomFill_AppSurf ******************/
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomFill_AppSurf;
		 GeomFill_AppSurf(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "Returns the weights (as percent) associed to the criterium used in the optimization.

Parameters
----------

Returns
-------
W1: float
W2: float
W3: float
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator
SpApprox: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen, const Standard_Boolean SpApprox = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator
NbMaxP: int

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen, const Standard_Integer NbMaxP);

		/****************** PerformSmoothing ******************/
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator

Returns
-------
None
") PerformSmoothing;
		void PerformSmoothing(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Define the continuity used in the approximation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "Define the weights associed to the criterium used in the optimization. //! if wi <= 0.

Parameters
----------
W1: float
W2: float
W3: float

Returns
-------
None
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****************** SetParType ******************/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "Define the type of parametrization used in the approximation.

Parameters
----------
ParType: Approx_ParametrizationType

Returns
-------
None
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Tol3d: float
Tol2d: float
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

};


%extend GeomFill_AppSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_AppSweep *
**************************/
class GeomFill_AppSweep : public AppBlend_Approx {
	public:
		/****************** GeomFill_AppSweep ******************/
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_AppSweep;
		 GeomFill_AppSweep();

		/****************** GeomFill_AppSweep ******************/
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomFill_AppSweep;
		 GeomFill_AppSweep(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "Returns the weights (as percent) associed to the criterium used in the optimization.

Parameters
----------

Returns
-------
W1: float
W2: float
W3: float
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
TColgp_Array1OfPnt2d
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Degree: int
NbPoles: int
NbKnots: int
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator
SpApprox: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen, const Standard_Boolean SpApprox = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator
NbMaxP: int

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen, const Standard_Integer NbMaxP);

		/****************** PerformSmoothing ******************/
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator

Returns
-------
None
") PerformSmoothing;
		void PerformSmoothing(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Define the continuity used in the approximation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****************** SetCriteriumWeight ******************/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "Define the weights associed to the criterium used in the optimization. //! if wi <= 0.

Parameters
----------
W1: float
W2: float
W3: float

Returns
-------
None
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****************** SetParType ******************/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "Define the type of parametrization used in the approximation.

Parameters
----------
ParType: Approx_ParametrizationType

Returns
-------
None
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Returns
-------
None
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Tol3d: float
Tol2d: float
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

};


%extend GeomFill_AppSweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_BSplineCurves *
*******************************/
class GeomFill_BSplineCurves {
	public:
		/****************** GeomFill_BSplineCurves ******************/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "Constructs a default bspline surface framework.

Returns
-------
None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves();

		/****************** GeomFill_BSplineCurves ******************/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
C4: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const opencascade::handle<Geom_BSplineCurve> & C4, const GeomFill_FillingStyle Type);

		/****************** GeomFill_BSplineCurves ******************/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const GeomFill_FillingStyle Type);

		/****************** GeomFill_BSplineCurves ******************/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "Constructs a framework for building a bspline surface from either - the four contiguous bspline curves, c1, c2, c3 and c4, or - the three contiguous bspline curves, c1, c2 and c3, or - the two contiguous bspline curves, c1 and c2. the type of filling style type to be used is one of: - geomfill_stretch - the style with the flattest patch - geomfill_coons - a rounded style of patch with less depth than that of curved - geomfill_curved - the style with the most rounded patch.constructs a framework for building a bspline surface common to the two bspline curves, c1 and c2. exceptions standard_constructionerror if the curves are not contiguous.

Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const GeomFill_FillingStyle Type);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "If the curves cannot be joined.

Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
C4: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const opencascade::handle<Geom_BSplineCurve> & C4, const GeomFill_FillingStyle Type);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "If the curves cannot be joined.

Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const GeomFill_FillingStyle Type);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes or reinitializes this algorithm with two, three, or four curves - c1, c2, c3, and c4 - and type, one of the following filling styles: - geomfill_stretch - the style with the flattest patch - geomfill_coons - a rounded style of patch with less depth than that of curved - geomfill_curved - the style with the most rounded patch. exceptions standard_constructionerror if the curves are not contiguous.

Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const GeomFill_FillingStyle Type);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bspline surface surface resulting from the computation performed by this algorithm.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface();

};


%extend GeomFill_BSplineCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomFill_BezierCurves *
******************************/
class GeomFill_BezierCurves {
	public:
		/****************** GeomFill_BezierCurves ******************/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "Constructs an empty framework for building a bezier surface from contiguous bezier curves. you use the init function to define the boundaries of the surface.

Returns
-------
None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves();

		/****************** GeomFill_BezierCurves ******************/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "Constructs a framework for building a bezier surface from the four contiguous bezier curves, c1, c2, c3 and c4 raises standard_constructionerror if the curves are not contiguous.

Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
C4: Geom_BezierCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const opencascade::handle<Geom_BezierCurve> & C4, const GeomFill_FillingStyle Type);

		/****************** GeomFill_BezierCurves ******************/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "Constructs a framework for building a bezier surface from the three contiguous bezier curves, c1, c2 and c3 raises standard_constructionerror if the curves are not contiguous.

Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const GeomFill_FillingStyle Type);

		/****************** GeomFill_BezierCurves ******************/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "Constructs a framework for building a bezier surface from the two contiguous bezier curves, c1 and c2 raises standard_constructionerror if the curves are not contiguous.

Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const GeomFill_FillingStyle Type);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "If the curves cannot be joined.

Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
C4: Geom_BezierCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const opencascade::handle<Geom_BezierCurve> & C4, const GeomFill_FillingStyle Type);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "If the curves cannot be joined.

Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const GeomFill_FillingStyle Type);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes or reinitializes this algorithm with two, three, or four curves - c1, c2, c3, and c4 - and type, one of the following filling styles: - geomfill_stretch - the style with the flattest patch - geomfill_coons - a rounded style of patch with less depth than that of curved - geomfill_curved - the style with the most rounded patch. exceptions standard_constructionerror if the curves are not contiguous.

Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
Type: GeomFill_FillingStyle

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const GeomFill_FillingStyle Type);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bezier surface resulting from the computation performed by this algorithm.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Surface;
		const opencascade::handle<Geom_BezierSurface> & Surface();

};


%extend GeomFill_BezierCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_Boundary *
**************************/
%nodefaultctor GeomFill_Boundary;
class GeomFill_Boundary : public Standard_Transient {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
First: float
Last: float
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D1Norm ******************/
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: gp_Vec
DN: gp_Vec

Returns
-------
None
") D1Norm;
		virtual void D1Norm(const Standard_Real U, gp_Vec & N, gp_Vec & DN);

		/****************** HasNormals ******************/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasNormals;
		virtual Standard_Boolean HasNormals();

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		virtual Standard_Boolean IsDegenerated();

		/****************** Norm ******************/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Vec
") Norm;
		virtual gp_Vec Norm(const Standard_Real U);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "No available documentation.

Parameters
----------
PFirst: gp_Pnt
PLast: gp_Pnt

Returns
-------
None
") Points;
		void Points(gp_Pnt & PFirst, gp_Pnt & PLast);

		/****************** Reparametrize ******************/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Returns
-------
None
") Reparametrize;
		virtual void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****************** Tol3d ******************/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tol3d;
		Standard_Real Tol3d();

		/****************** Tol3d ******************/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") Tol3d;
		void Tol3d(const Standard_Real Tol);

		/****************** Tolang ******************/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolang;
		Standard_Real Tolang();

		/****************** Tolang ******************/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") Tolang;
		void Tolang(const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		virtual gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_Boundary)

%extend GeomFill_Boundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomFill_CircularBlendFunc *
***********************************/
class GeomFill_CircularBlendFunc : public Approx_SweepFunction {
	public:
		/****************** GeomFill_CircularBlendFunc ******************/
		%feature("compactdefaultargs") GeomFill_CircularBlendFunc;
		%feature("autodoc", "Create a blend with a constant radius with 2 guide-line. <fshape> sets the type of fillet surface. the -- default value is convert_tgtthetaover2 (classical -- nurbs -- representation of circles). chfi3d_quasiangular -- corresponds to a nurbs representation of circles -- which parameterisation matches the circle one. -- chfi3d_polynomial corresponds to a polynomial -- representation of circles.

Parameters
----------
Path: Adaptor3d_HCurve
Curve1: Adaptor3d_HCurve
Curve2: Adaptor3d_HCurve
Radius: float
Polynomial: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomFill_CircularBlendFunc;
		 GeomFill_CircularBlendFunc(const opencascade::handle<Adaptor3d_HCurve> & Path, const opencascade::handle<Adaptor3d_HCurve> & Curve1, const opencascade::handle<Adaptor3d_HCurve> & Curve2, const Standard_Real Radius, const Standard_Boolean Polynomial = Standard_False);

		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditionned rational approximation.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections. this information is usefull to perform well conditionned rational approximation.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the maximum section. this information is usefull to perform well conditionned rational approximation.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the fonction this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usfull, if (me) have to be run numerical algorithme to perform d0, d1 or d2.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(GeomFill_CircularBlendFunc)

%extend GeomFill_CircularBlendFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomFill_ConstrainedFilling *
************************************/
class GeomFill_ConstrainedFilling {
	public:
		/****************** GeomFill_ConstrainedFilling ******************/
		%feature("compactdefaultargs") GeomFill_ConstrainedFilling;
		%feature("autodoc", "Constructs an empty framework for filling a surface from boundaries. the boundaries of the surface will be defined, and the surface will be built by using the function init. the surface will respect the following constraints: - its degree will not be greater than maxdeg - the maximum number of segments maxseg which bspline surfaces can have.

Parameters
----------
MaxDeg: int
MaxSeg: int

Returns
-------
None
") GeomFill_ConstrainedFilling;
		 GeomFill_ConstrainedFilling(const Standard_Integer MaxDeg, const Standard_Integer MaxSeg);

		/****************** Boundary ******************/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "Returns the bound of index i after sort.

Parameters
----------
I: int

Returns
-------
opencascade::handle<GeomFill_Boundary>
") Boundary;
		opencascade::handle<GeomFill_Boundary> Boundary(const Standard_Integer I);

		/****************** CheckApprox ******************/
		%feature("compactdefaultargs") CheckApprox;
		%feature("autodoc", "Computes values and normals along the bound i and compare them to the approx result curves (bound and tgte field) , draw the normals and tangents.

Parameters
----------
I: int

Returns
-------
None
") CheckApprox;
		void CheckApprox(const Standard_Integer I);

		/****************** CheckCoonsAlgPatch ******************/
		%feature("compactdefaultargs") CheckCoonsAlgPatch;
		%feature("autodoc", "Computes the fields of tangents on 30 points along the bound i, these are not the constraint tangents but gives an idea of the coonsalgpatch regularity.

Parameters
----------
I: int

Returns
-------
None
") CheckCoonsAlgPatch;
		void CheckCoonsAlgPatch(const Standard_Integer I);

		/****************** CheckResult ******************/
		%feature("compactdefaultargs") CheckResult;
		%feature("autodoc", "Computes values and normals along the bound i on both constraint surface and result surface, draw the normals, and computes the max distance between values and the max angle between normals.

Parameters
----------
I: int

Returns
-------
None
") CheckResult;
		void CheckResult(const Standard_Integer I);

		/****************** CheckTgteField ******************/
		%feature("compactdefaultargs") CheckTgteField;
		%feature("autodoc", "Computes the fields of tangents and normals on 30 points along the bound i, draw them, and computes the max dot product that must be near than 0.

Parameters
----------
I: int

Returns
-------
None
") CheckTgteField;
		void CheckTgteField(const Standard_Integer I);

		/****************** Eval ******************/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "Internal use for advmath approximation call.

Parameters
----------
W: float
Ord: int

Returns
-------
Result: float
") Eval;
		Standard_Integer Eval(const Standard_Real W, const Standard_Integer Ord, Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
NoCheck: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const Standard_Boolean NoCheck = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Constructs a bspline surface filled from the series of boundaries b1, b2, b3 and, if need be, b4, which serve: - as path constraints - and optionally, as tangency constraints if they are geomfill_boundwithsurf curves. the boundaries may be given in any order: they are classified and if necessary, reversed and reparameterized. the surface will also respect the following constraints: - its degree will not be greater than the maximum degree defined at the time of construction of this framework, and - the maximum number of segments maxseg which bspline surfaces can have.

Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
B4: GeomFill_Boundary
NoCheck: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const opencascade::handle<GeomFill_Boundary> & B4, const Standard_Boolean NoCheck = Standard_False);

		/****************** ReBuild ******************/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "Computes the new poles of the surface using the new blending functions set by several calls to setdomain.

Returns
-------
None
") ReBuild;
		void ReBuild();

		/****************** SetDomain ******************/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "Allows to modify domain on witch the blending function associated to the constrained boundary b will propag the influence of the field of tangency. can be usefull to reduce influence of boundaries on whitch the coons compatibility conditions are not respected. l is a relative value of the parametric range of b. default value for l is 1 (used in init). warning: must be called after init with a constrained boundary used in the call to init.

Parameters
----------
l: float
B: GeomFill_BoundWithSurf

Returns
-------
None
") SetDomain;
		void SetDomain(const Standard_Real l, const opencascade::handle<GeomFill_BoundWithSurf> & B);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bspline surface after computation of the fill by this framework.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface();

};


%extend GeomFill_ConstrainedFilling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_CoonsAlgPatch *
*******************************/
class GeomFill_CoonsAlgPatch : public Standard_Transient {
	public:
		/****************** GeomFill_CoonsAlgPatch ******************/
		%feature("compactdefaultargs") GeomFill_CoonsAlgPatch;
		%feature("autodoc", "Constructs the algorithmic patch. by default the constructed blending functions are linear. warning: no control is done on the bounds. b1/b3 and b2/b4 must be same range and well oriented.

Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
B4: GeomFill_Boundary

Returns
-------
None
") GeomFill_CoonsAlgPatch;
		 GeomFill_CoonsAlgPatch(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const opencascade::handle<GeomFill_Boundary> & B4);

		/****************** Bound ******************/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
opencascade::handle<GeomFill_Boundary>
") Bound;
		const opencascade::handle<GeomFill_Boundary> & Bound(const Standard_Integer I);

		/****************** Corner ******************/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
gp_Pnt
") Corner;
		const gp_Pnt Corner(const Standard_Integer I);

		/****************** D1U ******************/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Computes the d/du partial derivative on the algorithmic patch at parameters u and v.

Parameters
----------
U: float
V: float

Returns
-------
gp_Vec
") D1U;
		gp_Vec D1U(const Standard_Real U, const Standard_Real V);

		/****************** D1V ******************/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Computes the d/dv partial derivative on the algorithmic patch at parameters u and v.

Parameters
----------
U: float
V: float

Returns
-------
gp_Vec
") D1V;
		gp_Vec D1V(const Standard_Real U, const Standard_Real V);

		/****************** DUV ******************/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Computes the d2/dudv partial derivative on the algorithmic patch made with linear blending functions at parameter u and v.

Parameters
----------
U: float
V: float

Returns
-------
gp_Vec
") DUV;
		gp_Vec DUV(const Standard_Real U, const Standard_Real V);

		/****************** Func ******************/
		%feature("compactdefaultargs") Func;
		%feature("autodoc", "Give the blending functions.

Parameters
----------
f1: Law_Function
f2: Law_Function

Returns
-------
None
") Func;
		void Func(opencascade::handle<Law_Function> & f1, opencascade::handle<Law_Function> & f2);

		/****************** Func ******************/
		%feature("compactdefaultargs") Func;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
opencascade::handle<Law_Function>
") Func;
		const opencascade::handle<Law_Function> & Func(const Standard_Integer I);

		/****************** SetFunc ******************/
		%feature("compactdefaultargs") SetFunc;
		%feature("autodoc", "Set the blending functions.

Parameters
----------
f1: Law_Function
f2: Law_Function

Returns
-------
None
") SetFunc;
		void SetFunc(const opencascade::handle<Law_Function> & f1, const opencascade::handle<Law_Function> & f2);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value on the algorithmic patch at parameters u and v.

Parameters
----------
U: float
V: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%make_alias(GeomFill_CoonsAlgPatch)

%extend GeomFill_CoonsAlgPatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_CornerState *
*****************************/
class GeomFill_CornerState {
	public:
		/****************** GeomFill_CornerState ******************/
		%feature("compactdefaultargs") GeomFill_CornerState;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_CornerState;
		 GeomFill_CornerState();

		/****************** Constraint ******************/
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Constraint;
		void Constraint();

		/****************** DoKill ******************/
		%feature("compactdefaultargs") DoKill;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scal: float

Returns
-------
None
") DoKill;
		void DoKill(const Standard_Real Scal);

		/****************** Gap ******************/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Gap;
		Standard_Real Gap();

		/****************** Gap ******************/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: float

Returns
-------
None
") Gap;
		void Gap(const Standard_Real G);

		/****************** HasConstraint ******************/
		%feature("compactdefaultargs") HasConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasConstraint;
		Standard_Boolean HasConstraint();

		/****************** IsToKill ******************/
		%feature("compactdefaultargs") IsToKill;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Scal: float
") IsToKill;
		Standard_Boolean IsToKill(Standard_Real &OutValue);

		/****************** NorAng ******************/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") NorAng;
		Standard_Real NorAng();

		/****************** NorAng ******************/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ang: float

Returns
-------
None
") NorAng;
		void NorAng(const Standard_Real Ang);

		/****************** TgtAng ******************/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TgtAng;
		Standard_Real TgtAng();

		/****************** TgtAng ******************/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ang: float

Returns
-------
None
") TgtAng;
		void TgtAng(const Standard_Real Ang);

};


%extend GeomFill_CornerState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_Filling *
*************************/
class GeomFill_Filling {
	public:
		/****************** GeomFill_Filling ******************/
		%feature("compactdefaultargs") GeomFill_Filling;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Filling;
		 GeomFill_Filling();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "No available documentation.

Parameters
----------
Poles: TColgp_Array2OfPnt

Returns
-------
None
") Poles;
		void Poles(TColgp_Array2OfPnt & Poles);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "No available documentation.

Parameters
----------
Weights: TColStd_Array2OfReal

Returns
-------
None
") Weights;
		void Weights(TColStd_Array2OfReal & Weights);

		/****************** isRational ******************/
		%feature("compactdefaultargs") isRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") isRational;
		Standard_Boolean isRational();

};


%extend GeomFill_Filling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_FunctionDraft *
*******************************/
class GeomFill_FunctionDraft : public math_FunctionSetWithDerivatives {
	public:
		/****************** GeomFill_FunctionDraft ******************/
		%feature("compactdefaultargs") GeomFill_FunctionDraft;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") GeomFill_FunctionDraft;
		 GeomFill_FunctionDraft(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Deriv2T ******************/
		%feature("compactdefaultargs") Deriv2T;
		%feature("autodoc", "Returns the values <f> of the t2 derivatives for the parameter param .

Parameters
----------
C: Adaptor3d_HCurve
Param: float
W: float
d2N: gp_Vec
teta: float
F: math_Vector

Returns
-------
bool
") Deriv2T;
		Standard_Boolean Deriv2T(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real Param, const Standard_Real W, const gp_Vec & d2N, const Standard_Real teta, math_Vector & F);

		/****************** Deriv2X ******************/
		%feature("compactdefaultargs") Deriv2X;
		%feature("autodoc", "Returns the values <t> of the x2 derivatives for the parameter param .

Parameters
----------
X: math_Vector
T: GeomFill_Tensor

Returns
-------
bool
") Deriv2X;
		Standard_Boolean Deriv2X(const math_Vector & X, GeomFill_Tensor & T);

		/****************** DerivT ******************/
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "Returns the values <f> of the t derivatives for the parameter param .

Parameters
----------
C: Adaptor3d_HCurve
Param: float
W: float
dN: gp_Vec
teta: float
F: math_Vector

Returns
-------
bool
") DerivT;
		Standard_Boolean DerivT(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real Param, const Standard_Real W, const gp_Vec & dN, const Standard_Real teta, math_Vector & F);

		/****************** DerivTX ******************/
		%feature("compactdefaultargs") DerivTX;
		%feature("autodoc", "Returns the values <d> of the tx derivatives for the parameter param .

Parameters
----------
dN: gp_Vec
teta: float
D: math_Matrix

Returns
-------
bool
") DerivTX;
		Standard_Boolean DerivTX(const gp_Vec & dN, const Standard_Real teta, math_Matrix & D);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomFill_FunctionDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_FunctionGuide *
*******************************/
class GeomFill_FunctionGuide : public math_FunctionSetWithDerivatives {
	public:
		/****************** GeomFill_FunctionGuide ******************/
		%feature("compactdefaultargs") GeomFill_FunctionGuide;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: GeomFill_SectionLaw
Guide: Adaptor3d_HCurve
ParamOnLaw: float,optional
	default value is 0.0

Returns
-------
None
") GeomFill_FunctionGuide;
		 GeomFill_FunctionGuide(const opencascade::handle<GeomFill_SectionLaw> & S, const opencascade::handle<Adaptor3d_HCurve> & Guide, const Standard_Real ParamOnLaw = 0.0);

		/****************** DerivT ******************/
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "Returns the values <f> of the t derivatives for the parameter param .

Parameters
----------
X: math_Vector
DCentre: gp_XYZ
DDir: gp_XYZ
DFDT: math_Vector

Returns
-------
bool
") DerivT;
		Standard_Boolean DerivT(const math_Vector & X, const gp_XYZ & DCentre, const gp_XYZ & DDir, math_Vector & DFDT);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** SetParam ******************/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Centre: gp_Pnt
Dir: gp_XYZ
XDir: gp_XYZ

Returns
-------
None
") SetParam;
		void SetParam(const Standard_Real Param, const gp_Pnt & Centre, const gp_XYZ & Dir, const gp_XYZ & XDir);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomFill_FunctionGuide {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Deriv2T(self):
		pass
	}
};

/**********************
* class GeomFill_Line *
**********************/
class GeomFill_Line : public Standard_Transient {
	public:
		/****************** GeomFill_Line ******************/
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Line;
		 GeomFill_Line();

		/****************** GeomFill_Line ******************/
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbPoints: int

Returns
-------
None
") GeomFill_Line;
		 GeomFill_Line(const Standard_Integer NbPoints);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
int
") Point;
		Standard_Integer Point(const Standard_Integer Index);

};


%make_alias(GeomFill_Line)

%extend GeomFill_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_LocFunction *
*****************************/
class GeomFill_LocFunction {
	public:
		/****************** GeomFill_LocFunction ******************/
		%feature("compactdefaultargs") GeomFill_LocFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
Law: GeomFill_LocationLaw

Returns
-------
None
") GeomFill_LocFunction;
		 GeomFill_LocFunction(const opencascade::handle<GeomFill_LocationLaw> & Law);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
First: float
Last: float

Returns
-------
bool
") D0;
		Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float

Returns
-------
bool
") D1;
		Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float

Returns
-------
bool
") D2;
		Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
First: float
Last: float
Order: int

Returns
-------
Result: float
Ier: int
") DN;
		void DN(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, const Standard_Integer Order, Standard_Real &OutValue, Standard_Integer &OutValue);

};


%extend GeomFill_LocFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_LocationLaw *
*****************************/
%nodefaultctor GeomFill_LocationLaw;
class GeomFill_LocationLaw : public Standard_Transient {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location and 2d points.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute location 2d points and associated first derivatives. warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute location 2d points and associated first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
AM: gp_Mat
AV: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMaximalNorm ******************/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** HasFirstRestriction ******************/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Say if the first restriction is defined in this class. if it is true the first element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****************** HasLastRestriction ******************/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Say if the last restriction is defined in this class. if it is true the last element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRotation ******************/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "Say if the location law, is a rotation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****************** IsTranslation ******************/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "Say if the location law, is an translation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****************** Nb2dCurves ******************/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves (restrictions + traces) to approximate.

Returns
-------
int
") Nb2dCurves;
		Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> this information is usfull to find an good tolerance in 2d approximation.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Center: gp_Pnt

Returns
-------
None
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usefull, if (me) have to run numerical algorithm to perform d0, d1 or d2 the default implementation make nothing.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "Set a transformation matrix like the law m(t) become mat * m(t).

Parameters
----------
Transfo: gp_Mat

Returns
-------
None
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

		/****************** TraceNumber ******************/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Give the number of trace (curves 2d wich are not restriction) returns 0 (default implementation).

Returns
-------
int
") TraceNumber;
		virtual Standard_Integer TraceNumber();

};


%make_alias(GeomFill_LocationLaw)

%extend GeomFill_LocationLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomFill_Pipe *
**********************/
class GeomFill_Pipe {
	public:
		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Constructs an empty algorithm for building pipes. use the function init to initialize it.

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe();

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom_Curve
Radius: float

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const Standard_Real Radius);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with a constant section (<firstsection>) and a path (<path>) option can be - geomfill_iscorrectedfrenet - geomfill_isfrenet - geomfill_isconstant.

Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Option: GeomFill_Trihedron,optional
	default value is GeomFill_IsCorrectedFrenet

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const GeomFill_Trihedron Option = GeomFill_IsCorrectedFrenet);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with a constant section (<firstsection>) and a path defined by <path> and <support>.

Parameters
----------
Path: Geom2d_Curve
Support: Geom_Surface
FirstSect: Geom_Curve

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom2d_Curve> & Path, const opencascade::handle<Geom_Surface> & Support, const opencascade::handle<Geom_Curve> & FirstSect);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with a constant section (<firstsection>) and a path <path> and a fixed binormal direction <dir>.

Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Dir: gp_Dir

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const gp_Dir & Dir);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with an evolving section the section evoluate from first to last section.

Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
LastSect: Geom_Curve

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const opencascade::handle<Geom_Curve> & LastSect);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with n sections the section evoluate from first to last section.

Parameters
----------
Path: Geom_Curve
NSections: TColGeom_SequenceOfCurve

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const TColGeom_SequenceOfCurve & NSections);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with a constant radius with 2 guide-line.

Parameters
----------
Path: Geom_Curve
Curve1: Geom_Curve
Curve2: Geom_Curve
Radius: float

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & Curve1, const opencascade::handle<Geom_Curve> & Curve2, const Standard_Real Radius);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with a constant radius with 2 guide-line.

Parameters
----------
Path: Adaptor3d_HCurve
Curve1: Adaptor3d_HCurve
Curve2: Adaptor3d_HCurve
Radius: float

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Adaptor3d_HCurve> & Path, const opencascade::handle<Adaptor3d_HCurve> & Curve1, const opencascade::handle<Adaptor3d_HCurve> & Curve2, const Standard_Real Radius);

		/****************** GeomFill_Pipe ******************/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Create a pipe with a constant section and with 1 guide-line. use the function perform to build the surface. all standard specific cases are detected in order to construct, according to the respective geometric nature of path and the sections, a planar, cylindrical, conical, spherical or toroidal surface, a surface of linear extrusion or a surface of revolution. in the general case, the result is a bspline surface (nurbs) built by approximation of a series of sections where: - the number of sections n is chosen automatically by the algorithm according to the respective geometries of path and the sections. n is greater than or equal to 2; - n points pi (with i in the range [ 1,n ]) are defined at regular intervals along the curve path from its first point to its end point. at each point pi, a coordinate system ti is computed with pi as origin, and with the tangential and normal vectors to path defining two of its coordinate axes. in the case of a pipe with a constant circular section, the first section is a circle of radius radius centered on the origin of path and whose 'z axis' is aligned along the vector tangential to the origin of path. in the case of a pipe with a constant section, the first section is the curve firstsect. in these two cases, the ith section (for values of i greater than 1) is obtained by applying to a copy of this first section the geometric transformation which transforms coordinate system t1 into coordinate system ti. in the case of an evolving section, n-2 intermediate curves si are first computed (if n is greater than 2, and with i in the range [ 2,n-1 ]) whose geometry evolves regularly from the curve s1=firstsect to the curve sn=lastsect. the first section is firstsect, and the ith section (for values of i greater than 1) is obtained by applying to the curve si the geometric transformation which transforms coordinate system t1 into coordinate system ti.

Parameters
----------
Path: Geom_Curve
Guide: Adaptor3d_HCurve
FirstSect: Geom_Curve
ByACR: bool
rotat: bool

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Adaptor3d_HCurve> & Guide, const opencascade::handle<Geom_Curve> & FirstSect, const Standard_Boolean ByACR, const Standard_Boolean rotat);

		/****************** ErrorOnSurf ******************/
		%feature("compactdefaultargs") ErrorOnSurf;
		%feature("autodoc", "Returns the approximation's error. if the surface is plane, cylinder ... this error can be 0.

Returns
-------
float
") ErrorOnSurf;
		Standard_Real ErrorOnSurf();

		/****************** ExchangeUV ******************/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "The u parametric direction of the surface constructed by this algorithm usually corresponds to the evolution along the path and the v parametric direction corresponds to the evolution along the section(s). however, this rule is not respected when constructing certain specific geom surfaces (typically cylindrical surfaces, surfaces of revolution, etc.) for which the parameterization is inversed. the exchangeuv function checks for this, and returns true in all these specific cases. warning do not use this function before the surface is built.

Returns
-------
bool
") ExchangeUV;
		Standard_Boolean ExchangeUV();

		/****************** GenerateParticularCase ******************/
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "Sets a flag to try to create as many planes, cylinder,... as possible. default value is <standard_false>.

Parameters
----------
B: bool

Returns
-------
None
") GenerateParticularCase;
		void GenerateParticularCase(const Standard_Boolean B);

		/****************** GenerateParticularCase ******************/
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "Returns the flag.

Returns
-------
bool
") GenerateParticularCase;
		Standard_Boolean GenerateParticularCase();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom_Curve
Radius: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const Standard_Real Radius);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Option: GeomFill_Trihedron,optional
	default value is GeomFill_IsCorrectedFrenet

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const GeomFill_Trihedron Option = GeomFill_IsCorrectedFrenet);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom2d_Curve
Support: Geom_Surface
FirstSect: Geom_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & Path, const opencascade::handle<Geom_Surface> & Support, const opencascade::handle<Geom_Curve> & FirstSect);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Dir: gp_Dir

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const gp_Dir & Dir);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
LastSect: Geom_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const opencascade::handle<Geom_Curve> & LastSect);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Geom_Curve
NSections: TColGeom_SequenceOfCurve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const TColGeom_SequenceOfCurve & NSections);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Create a pipe with a constant radius with 2 guide-line.

Parameters
----------
Path: Adaptor3d_HCurve
Curve1: Adaptor3d_HCurve
Curve2: Adaptor3d_HCurve
Radius: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Adaptor3d_HCurve> & Path, const opencascade::handle<Adaptor3d_HCurve> & Curve1, const opencascade::handle<Adaptor3d_HCurve> & Curve2, const Standard_Real Radius);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this pipe algorithm to build the following surface: - a pipe with a constant circular section of radius radius along the path path, or - a pipe with constant section firstsect along the path path, or - a pipe where the section evolves from firstsect to lastsect along the path path. use the function perform to build the surface. note: a description of the resulting surface is given under constructors.

Parameters
----------
Path: Geom_Curve
Guide: Adaptor3d_HCurve
FirstSect: Geom_Curve
ByACR: bool
rotat: bool

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Adaptor3d_HCurve> & Guide, const opencascade::handle<Geom_Curve> & FirstSect, const Standard_Boolean ByACR, const Standard_Boolean rotat);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns whether approximation was done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Builds the pipe defined at the time of initialization of this algorithm. a description of the resulting surface is given under constructors. if withparameters (defaulted to false) is set to true, the approximation algorithm (used only in the general case of construction of a bspline surface) builds the surface with a u parameter corresponding to the one of the path. exceptions standard_constructionerror if a surface cannot be constructed from the data. warning: it is the old perform method, the next methode is recommended.

Parameters
----------
WithParameters: bool,optional
	default value is Standard_False
myPolynomial: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean WithParameters = Standard_False, const Standard_Boolean myPolynomial = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Detects the particular cases. and compute the surface. if none particular case is detected we make an approximation with respect of the tolerance <tol>, the continuty <conti>, the maximum degree <maxdegree>, the maximum number of span <nbmaxsegment> and the spine parametrization. if we can't create a surface with the data.

Parameters
----------
Tol: float
Polynomial: bool
Conti: GeomAbs_Shape,optional
	default value is GeomAbs_C1
MaxDegree: int,optional
	default value is 11
NbMaxSegment: int,optional
	default value is 30

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Tol, const Standard_Boolean Polynomial, const GeomAbs_Shape Conti = GeomAbs_C1, const Standard_Integer MaxDegree = 11, const Standard_Integer NbMaxSegment = 30);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface built by this algorithm. warning do not use this function before the surface is built (in this case the function will return a null handle).

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

};


%extend GeomFill_Pipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_PlanFunc *
**************************/
class GeomFill_PlanFunc : public math_FunctionWithDerivative {
	public:
		/****************** GeomFill_PlanFunc ******************/
		%feature("compactdefaultargs") GeomFill_PlanFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
V: gp_Vec
C: Adaptor3d_HCurve

Returns
-------
None
") GeomFill_PlanFunc;
		 GeomFill_PlanFunc(const gp_Pnt & P, const gp_Vec & V, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
D1: float
D2: float
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2E ******************/
		%feature("compactdefaultargs") D2E;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
DP: gp_Vec
D2P: gp_Vec
DV: gp_Vec
D2V: gp_Vec

Returns
-------
DFDT: float
D2FDT2: float
D2FDTDX: float
") D2E;
		void D2E(const Standard_Real X, const gp_Vec & DP, const gp_Vec & D2P, const gp_Vec & DV, const gp_Vec & D2V, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** DEDT ******************/
		%feature("compactdefaultargs") DEDT;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float
DP: gp_Vec
DV: gp_Vec

Returns
-------
DF: float
") DEDT;
		void DEDT(const Standard_Real X, const gp_Vec & DP, const gp_Vec & DV, Standard_Real &OutValue);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		virtual Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value <f>of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f> and the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		virtual Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GeomFill_PlanFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class GeomFill_PolynomialConvertor *
*************************************/
class GeomFill_PolynomialConvertor {
	public:
		/****************** GeomFill_PolynomialConvertor ******************/
		%feature("compactdefaultargs") GeomFill_PolynomialConvertor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_PolynomialConvertor;
		 GeomFill_PolynomialConvertor();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Initialized ******************/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Say if <self> is initialized.

Returns
-------
bool
") Initialized;
		Standard_Boolean Initialized();

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstPnt: gp_Pnt
Center: gp_Pnt
Dir: gp_Vec
Angle: float
Poles: TColgp_Array1OfPnt

Returns
-------
None
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Pnt & Center, const gp_Vec & Dir, const Standard_Real Angle, TColgp_Array1OfPnt & Poles);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
Angle: float
DAngle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec

Returns
-------
None
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & Dir, const gp_Vec & DDir, const Standard_Real Angle, const Standard_Real DAngle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
D2FirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
D2Center: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
D2Dir: gp_Vec
Angle: float
DAngle: float
D2Angle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec

Returns
-------
None
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Vec & D2FirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, const gp_Vec & Dir, const gp_Vec & DDir, const gp_Vec & D2Dir, const Standard_Real Angle, const Standard_Real DAngle, const Standard_Real D2Angle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles);

};


%extend GeomFill_PolynomialConvertor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_Profiler *
**************************/
class GeomFill_Profiler {
	public:
		/****************** GeomFill_Profiler ******************/
		%feature("compactdefaultargs") GeomFill_Profiler;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Profiler;
		 GeomFill_Profiler();

		/****************** AddCurve ******************/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Geom_Curve

Returns
-------
None
") AddCurve;
		void AddCurve(const opencascade::handle<Geom_Curve> & Curve);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve(const Standard_Integer Index);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Raises if not yet perform.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** KnotsAndMults ******************/
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "Raises if not yet perform raises if the lengthes of <knots> and <mults> are not equal to nbknots().

Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Returns
-------
None
") KnotsAndMults;
		void KnotsAndMults(TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Raises if not yet perform.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Raises if not yet perform.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Converts all curves to bsplinecurves. set them to the common profile. <ptol> is used to compare 2 knots.

Parameters
----------
PTol: float

Returns
-------
None
") Perform;
		virtual void Perform(const Standard_Real PTol);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns in <poles> the poles of the bsplinecurve from index <index> adjusting to the current profile. raises if not yet perform raises if <index> not in the range [1,nbcurves] if the length of <poles> is not equal to nbpoles().

Parameters
----------
Index: int
Poles: TColgp_Array1OfPnt

Returns
-------
None
") Poles;
		void Poles(const Standard_Integer Index, TColgp_Array1OfPnt & Poles);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns in <weights> the weights of the bsplinecurve from index <index> adjusting to the current profile. raises if not yet perform raises if <index> not in the range [1,nbcurves] or if the length of <weights> is not equal to nbpoles().

Parameters
----------
Index: int
Weights: TColStd_Array1OfReal

Returns
-------
None
") Weights;
		void Weights(const Standard_Integer Index, TColStd_Array1OfReal & Weights);

};


%extend GeomFill_Profiler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomFill_QuasiAngularConvertor *
***************************************/
class GeomFill_QuasiAngularConvertor {
	public:
		/****************** GeomFill_QuasiAngularConvertor ******************/
		%feature("compactdefaultargs") GeomFill_QuasiAngularConvertor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_QuasiAngularConvertor;
		 GeomFill_QuasiAngularConvertor();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Initialized ******************/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Say if <self> is initialized.

Returns
-------
bool
") Initialized;
		Standard_Boolean Initialized();

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstPnt: gp_Pnt
Center: gp_Pnt
Dir: gp_Vec
Angle: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Pnt & Center, const gp_Vec & Dir, const Standard_Real Angle, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
Angle: float
DAngle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weights: TColStd_Array1OfReal
DWeights: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & Dir, const gp_Vec & DDir, const Standard_Real Angle, const Standard_Real DAngle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & DWeights);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
D2FirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
D2Center: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
D2Dir: gp_Vec
Angle: float
DAngle: float
D2Angle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weights: TColStd_Array1OfReal
DWeights: TColStd_Array1OfReal
D2Weights: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Vec & D2FirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, const gp_Vec & Dir, const gp_Vec & DDir, const gp_Vec & D2Dir, const Standard_Real Angle, const Standard_Real DAngle, const Standard_Real D2Angle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & DWeights, TColStd_Array1OfReal & D2Weights);

};


%extend GeomFill_QuasiAngularConvertor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomFill_SectionLaw *
****************************/
%nodefaultctor GeomFill_SectionLaw;
class GeomFill_SectionLaw : public Standard_Transient {
	public:
		/****************** BSplineSurface ******************/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. it is the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** CirclSection ******************/
		%feature("compactdefaultargs") CirclSection;
		%feature("autodoc", "Return the circle section at parameter <param>, if <self> a isconicallaw.

Parameters
----------
Param: float

Returns
-------
opencascade::handle<Geom_Curve>
") CirclSection;
		virtual opencascade::handle<Geom_Curve> CirclSection(const Standard_Real Param);

		/****************** ConstantSection ******************/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return a copy of the constant section, if me isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles in all sections. this information is usefull to control error in rational approximation. warning: used only if <self> isrational.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerances associated at each poles to reach in approximation, to satisfy: boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConicalLaw ******************/
		%feature("compactdefaultargs") IsConicalLaw;
		%feature("autodoc", "Returns true if all section are circle, with same plane,same center and linear radius evolution return false by default.

Parameters
----------

Returns
-------
Error: float
") IsConicalLaw;
		virtual Standard_Boolean IsConicalLaw(Standard_Real &OutValue);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if all sections are equals.

Parameters
----------

Returns
-------
Error: float
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if law is periodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usefull, if (me) have to run numerical algorithm to perform d0, d1 or d2 the default implementation make nothing.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(GeomFill_SectionLaw)

%extend GeomFill_SectionLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_SectionPlacement *
**********************************/
class GeomFill_SectionPlacement {
	public:
		/****************** GeomFill_SectionPlacement ******************/
		%feature("compactdefaultargs") GeomFill_SectionPlacement;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: GeomFill_LocationLaw
Section: Geom_Geometry

Returns
-------
None
") GeomFill_SectionPlacement;
		 GeomFill_SectionPlacement(const opencascade::handle<GeomFill_LocationLaw> & L, const opencascade::handle<Geom_Geometry> & Section);

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** ModifiedSection ******************/
		%feature("compactdefaultargs") ModifiedSection;
		%feature("autodoc", "Compute the section, in the coordinate syteme given by the location law. to have the normal to section equal to the location law normal. if <withtranslation> contact beetween <section> and <path> is forced.

Parameters
----------
WithTranslation: bool

Returns
-------
opencascade::handle<Geom_Curve>
") ModifiedSection;
		opencascade::handle<Geom_Curve> ModifiedSection(const Standard_Boolean WithTranslation);

		/****************** ParameterOnPath ******************/
		%feature("compactdefaultargs") ParameterOnPath;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnPath;
		Standard_Real ParameterOnPath();

		/****************** ParameterOnSection ******************/
		%feature("compactdefaultargs") ParameterOnSection;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnSection;
		Standard_Real ParameterOnSection();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Path: Adaptor3d_HCurve
Tol: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & Path, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
ParamOnPath: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real ParamOnPath, const Standard_Real Tol);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Compute the section, in the coordinate syteme given by the location law. if <withtranslation> contact beetween <section> and <path> is forced.

Parameters
----------
WithTranslation: bool

Returns
-------
opencascade::handle<Geom_Curve>
") Section;
		opencascade::handle<Geom_Curve> Section(const Standard_Boolean WithTranslation);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "To change the section law.

Parameters
----------
L: GeomFill_LocationLaw

Returns
-------
None
") SetLocation;
		void SetLocation(const opencascade::handle<GeomFill_LocationLaw> & L);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "No available documentation.

Parameters
----------
WithTranslation: bool
WithCorrection: bool,optional
	default value is Standard_False

Returns
-------
gp_Trsf
") Transformation;
		gp_Trsf Transformation(const Standard_Boolean WithTranslation, const Standard_Boolean WithCorrection = Standard_False);

};


%extend GeomFill_SectionPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomFill_SnglrFunc *
***************************/
class GeomFill_SnglrFunc : public Adaptor3d_Curve {
	public:
		/****************** GeomFill_SnglrFunc ******************/
		%feature("compactdefaultargs") GeomFill_SnglrFunc;
		%feature("autodoc", "No available documentation.

Parameters
----------
HC: Adaptor3d_HCurve

Returns
-------
None
") GeomFill_SnglrFunc;
		 GeomFill_SnglrFunc(const opencascade::handle<Adaptor3d_HCurve> & HC);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** SetRatio ******************/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ratio: float

Returns
-------
None
") SetRatio;
		void SetRatio(const Standard_Real Ratio);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%extend GeomFill_SnglrFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GeomFill_Sweep *
***********************/
class GeomFill_Sweep {
	public:
		/****************** GeomFill_Sweep ******************/
		%feature("compactdefaultargs") GeomFill_Sweep;
		%feature("autodoc", "No available documentation.

Parameters
----------
Location: GeomFill_LocationLaw
WithKpart: bool,optional
	default value is Standard_True

Returns
-------
None
") GeomFill_Sweep;
		 GeomFill_Sweep(const opencascade::handle<GeomFill_LocationLaw> & Location, const Standard_Boolean WithKpart = Standard_True);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Build the sweeep surface approxstyle defines approximation strategy - geomfill_section : the composed function : location x section is directly approximed. - geomfill_location : the location law is approximed, and the sweepsurface is build algebric composition of approximed location law and section law this option is ok, if section.surface() methode is effective. continuity : the continuity in v waiting on the surface degmax : the maximum degree in v requiered on the surface segmax : the maximum number of span in v requiered on the surface //! raise if domain are infinite or profile not setted.

Parameters
----------
Section: GeomFill_SectionLaw
Methode: GeomFill_ApproxStyle,optional
	default value is GeomFill_Location
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C2
Degmax: int,optional
	default value is 10
Segmax: int,optional
	default value is 30

Returns
-------
None
") Build;
		void Build(const opencascade::handle<GeomFill_SectionLaw> & Section, const GeomFill_ApproxStyle Methode = GeomFill_Location, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Integer Degmax = 10, const Standard_Integer Segmax = 30);

		/****************** ErrorOnRestriction ******************/
		%feature("compactdefaultargs") ErrorOnRestriction;
		%feature("autodoc", "Gets the approximation error.

Parameters
----------
IsFirst: bool

Returns
-------
UError: float
VError: float
") ErrorOnRestriction;
		void ErrorOnRestriction(const Standard_Boolean IsFirst, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ErrorOnSurface ******************/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Gets the approximation error.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** ErrorOnTrace ******************/
		%feature("compactdefaultargs") ErrorOnTrace;
		%feature("autodoc", "Gets the approximation error.

Parameters
----------
IndexOfTrace: int

Returns
-------
UError: float
VError: float
") ErrorOnTrace;
		void ErrorOnTrace(const Standard_Integer IndexOfTrace, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ExchangeUV ******************/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Returns true if sections are u-iso this can be produce in some cases when <withkpart> is true.

Returns
-------
bool
") ExchangeUV;
		Standard_Boolean ExchangeUV();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tells if the surface is buildt.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NumberOfTrace ******************/
		%feature("compactdefaultargs") NumberOfTrace;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NumberOfTrace;
		Standard_Integer NumberOfTrace();

		/****************** Restriction ******************/
		%feature("compactdefaultargs") Restriction;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsFirst: bool

Returns
-------
opencascade::handle<Geom2d_Curve>
") Restriction;
		opencascade::handle<Geom2d_Curve> Restriction(const Standard_Boolean IsFirst);

		/****************** SetDomain ******************/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "Set parametric information [<first>, <last>] sets the parametric bound of the sweeping surface to build. <sectionfirst>, <sectionlast> gives coresponding bounds parameter on the section law of <first> and <last> //! v-iso on sweeping surface s(u,v) is defined by location(v) and section(w) where w = sectionfirst + (v - first) / (last-first) * (sectionlast - sectionfirst) //! by default w = v, and first and last are given by first and last parameter stored in locationlaw.

Parameters
----------
First: float
Last: float
SectionFirst: float
SectionLast: float

Returns
-------
None
") SetDomain;
		void SetDomain(const Standard_Real First, const Standard_Real Last, const Standard_Real SectionFirst, const Standard_Real SectionLast);

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
		%feature("autodoc", "Set approximation tolerance tol3d : tolerance to surface approximation tol2d : tolerance used to perform curve approximation normaly the 2d curve are approximated with a tolerance given by the resolution method define in <locationlaw> but if this tolerance is too large tol2d is used. tolangular : tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface.

Parameters
----------
Tol3d: float
BoundTol: float,optional
	default value is 1.0
Tol2d: float,optional
	default value is 1.0e-5
TolAngular: float,optional
	default value is 1.0

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d, const Standard_Real BoundTol = 1.0, const Standard_Real Tol2d = 1.0e-5, const Standard_Real TolAngular = 1.0);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** Trace ******************/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexOfTrace: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") Trace;
		opencascade::handle<Geom2d_Curve> Trace(const Standard_Integer IndexOfTrace);

		/****************** UReversed ******************/
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "Returns true if parametrisation sens in u is inverse of parametrisation sens of section (or of path if exchangeuv).

Returns
-------
bool
") UReversed;
		Standard_Boolean UReversed();

		/****************** VReversed ******************/
		%feature("compactdefaultargs") VReversed;
		%feature("autodoc", "Returns true if parametrisation sens in v is inverse of parametrisation sens of path (or of section if exchangeuv).

Returns
-------
bool
") VReversed;
		Standard_Boolean VReversed();

};


%extend GeomFill_Sweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_SweepFunction *
*******************************/
class GeomFill_SweepFunction : public Approx_SweepFunction {
	public:
		/****************** GeomFill_SweepFunction ******************/
		%feature("compactdefaultargs") GeomFill_SweepFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
Section: GeomFill_SectionLaw
Location: GeomFill_LocationLaw
FirstParameter: float
FirstParameterOnS: float
RatioParameterOnS: float

Returns
-------
None
") GeomFill_SweepFunction;
		 GeomFill_SweepFunction(const opencascade::handle<GeomFill_SectionLaw> & Section, const opencascade::handle<GeomFill_LocationLaw> & Location, const Standard_Real FirstParameter, const Standard_Real FirstParameterOnS, const Standard_Real RatioParameterOnS);

		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditionned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param.

Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles of all sections. this information is usefull to perform well conditionned rational approximation. warning: used only if <self> isrational.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerance to reach in approximation to respecte boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the maximum section. this information is usefull to perform well conditionned rational approximation.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> this information is usfull to find an good tolerance in 2d approximation. warning: used only if nb2dcurve > 0.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usfull, if (me) have to be run numerical algorithme to perform d0, d1 or d2.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(GeomFill_SweepFunction)

%extend GeomFill_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomFill_SweepSectionGenerator *
***************************************/
/************************
* class GeomFill_Tensor *
************************/
class GeomFill_Tensor {
	public:
		/****************** GeomFill_Tensor ******************/
		%feature("compactdefaultargs") GeomFill_Tensor;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbRow: int
NbCol: int
NbMat: int

Returns
-------
None
") GeomFill_Tensor;
		 GeomFill_Tensor(const Standard_Integer NbRow, const Standard_Integer NbCol, const Standard_Integer NbMat);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat) {
            return (Standard_Real) $self->ChangeValue(Row,Col,Mat);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat,Standard_Real value) {
            $self->ChangeValue(Row,Col,Mat)=value;
            }
        };
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all the elements of a tensor to initialvalue.

Parameters
----------
InitialValue: float

Returns
-------
None
") Init;
		void Init(const Standard_Real InitialValue);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "No available documentation.

Parameters
----------
Right: math_Vector
Product: math_Matrix

Returns
-------
None
") Multiply;
		void Multiply(const math_Vector & Right, math_Matrix & Product);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Accesses (in read or write mode) the value of index <row>, <col> and <mat> of a tensor. an exception is raised if <row>, <col> or <mat> are not in the correct range.

Parameters
----------
Row: int
Col: int
Mat: int

Returns
-------
float
") Value;
		const Standard_Real & Value(const Standard_Integer Row, const Standard_Integer Col, const Standard_Integer Mat);

};


%extend GeomFill_Tensor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_TgtField *
**************************/
%nodefaultctor GeomFill_TgtField;
class GeomFill_TgtField : public Standard_Transient {
	public:
		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the derivative of the field of tangency at parameter w.

Parameters
----------
W: float

Returns
-------
gp_Vec
") D1;
		virtual gp_Vec D1(const Standard_Real W);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the value and the derivative of the field of tangency at parameter w.

Parameters
----------
W: float
V: gp_Vec
DV: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real W, gp_Vec & V, gp_Vec & DV);

		/****************** IsScalable ******************/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsScalable;
		virtual Standard_Boolean IsScalable();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "No available documentation.

Parameters
----------
Func: Law_BSpline

Returns
-------
None
") Scale;
		virtual void Scale(const opencascade::handle<Law_BSpline> & Func);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the field of tangency at parameter w.

Parameters
----------
W: float

Returns
-------
gp_Vec
") Value;
		virtual gp_Vec Value(const Standard_Real W);

};


%make_alias(GeomFill_TgtField)

%extend GeomFill_TgtField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomFill_TrihedronLaw *
******************************/
%nodefaultctor GeomFill_TrihedronLaw;
class GeomFill_TrihedronLaw : public Standard_Transient {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute triedrhon on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Say if the law is defined, only by the 3d geometry of the setted curve return false by default.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_TrihedronLaw)

%extend GeomFill_TrihedronLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_BoundWithSurf *
*******************************/
class GeomFill_BoundWithSurf : public GeomFill_Boundary {
	public:
		/****************** GeomFill_BoundWithSurf ******************/
		%feature("compactdefaultargs") GeomFill_BoundWithSurf;
		%feature("autodoc", "Constructs a boundary object defined by the 3d curve curveonsurf. the surface to be filled along this boundary will be in the tolerance range defined by tol3d. what's more, at each point of curveonsurf, the angle between the normal to the surface to be filled along this boundary, and the normal to the surface on which curveonsurf lies, must not be greater than tolang. this object is to be used as a boundary for a geomfill_constrainedfilling framework. warning curveonsurf is an adapted curve, that is, an object which is an interface between: - the services provided by a curve lying on a surface from the package geom - and those required of the curve by the computation algorithm which uses it. the adapted curve is created in the following way: opencascade::handle<geom_surface> mysurface = ... ; opencascade::handle<geom2d_curve> myparamcurve = ... ; // where myparamcurve is a 2d curve in the parametric space of the surface mysurface opencascade::handle<geomadaptor_hsurface> surface = new geomadaptor_hsurface(mysurface); opencascade::handle<geom2dadaptor_hcurve> paramcurve = new geom2dadaptor_hcurve(myparamcurve); curveonsurf = adaptor3d_curveonsurface(paramcurve,surface); the boundary is then constructed with the curveonsurf object: standard_real tol = ... ; standard_real tolang = ... ; myboundary = geomfill_boundwithsurf ( curveonsurf, tol, tolang );.

Parameters
----------
CurveOnSurf: Adaptor3d_CurveOnSurface
Tol3d: float
Tolang: float

Returns
-------
None
") GeomFill_BoundWithSurf;
		 GeomFill_BoundWithSurf(const Adaptor3d_CurveOnSurface & CurveOnSurf, const Standard_Real Tol3d, const Standard_Real Tolang);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
First: float
Last: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D1Norm ******************/
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
N: gp_Vec
DN: gp_Vec

Returns
-------
None
") D1Norm;
		virtual void D1Norm(const Standard_Real U, gp_Vec & N, gp_Vec & DN);

		/****************** HasNormals ******************/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasNormals;
		virtual Standard_Boolean HasNormals();

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** Norm ******************/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Vec
") Norm;
		virtual gp_Vec Norm(const Standard_Real U);

		/****************** Reparametrize ******************/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Returns
-------
None
") Reparametrize;
		void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_BoundWithSurf)

%extend GeomFill_BoundWithSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_ConstantBiNormal *
**********************************/
class GeomFill_ConstantBiNormal : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_ConstantBiNormal ******************/
		%feature("compactdefaultargs") GeomFill_ConstantBiNormal;
		%feature("autodoc", "No available documentation.

Parameters
----------
BiNormal: gp_Dir

Returns
-------
None
") GeomFill_ConstantBiNormal;
		 GeomFill_ConstantBiNormal(const gp_Dir & BiNormal);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes triedrhon on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Gets average value of tangent(t) and normal(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Says if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

};


%make_alias(GeomFill_ConstantBiNormal)

%extend GeomFill_ConstantBiNormal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GeomFill_Coons *
***********************/
class GeomFill_Coons : public GeomFill_Filling {
	public:
		/****************** GeomFill_Coons ******************/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Coons;
		 GeomFill_Coons();

		/****************** GeomFill_Coons ******************/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Returns
-------
None
") GeomFill_Coons;
		 GeomFill_Coons(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****************** GeomFill_Coons ******************/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Returns
-------
None
") GeomFill_Coons;
		 GeomFill_Coons(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

};


%extend GeomFill_Coons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomFill_CorrectedFrenet *
*********************************/
class GeomFill_CorrectedFrenet : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_CorrectedFrenet ******************/
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet();

		/****************** GeomFill_CorrectedFrenet ******************/
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "No available documentation.

Parameters
----------
ForEvaluation: bool

Returns
-------
None
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet(const Standard_Boolean ForEvaluation);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute triedrhon on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** EvaluateBestMode ******************/
		%feature("compactdefaultargs") EvaluateBestMode;
		%feature("autodoc", "Tries to define the best trihedron mode for the curve. it can be: - frenet - correctedfrenet - discretetrihedron warning: the correctedfrenet must be constructed with option forevaluation = true, the curve must be set by method setcurve.

Returns
-------
GeomFill_Trihedron
") EvaluateBestMode;
		GeomFill_Trihedron EvaluateBestMode();

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of tangent(t) and normal(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_CorrectedFrenet)

%extend GeomFill_CorrectedFrenet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomFill_CurveAndTrihedron *
***********************************/
class GeomFill_CurveAndTrihedron : public GeomFill_LocationLaw {
	public:
		/****************** GeomFill_CurveAndTrihedron ******************/
		%feature("compactdefaultargs") GeomFill_CurveAndTrihedron;
		%feature("autodoc", "No available documentation.

Parameters
----------
Trihedron: GeomFill_TrihedronLaw

Returns
-------
None
") GeomFill_CurveAndTrihedron;
		 GeomFill_CurveAndTrihedron(const opencascade::handle<GeomFill_TrihedronLaw> & Trihedron);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location and 2d points.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location and 2d points.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute location 2d points and associated first derivatives. warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute location 2d points and associated first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
AM: gp_Mat
AV: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMaximalNorm ******************/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRotation ******************/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "Say if the location law, is a rotation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****************** IsTranslation ******************/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "Say if the location law, is an translation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Center: gp_Pnt

Returns
-------
None
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "Set a transformation matrix like the law m(t) become mat * m(t).

Parameters
----------
Transfo: gp_Mat

Returns
-------
None
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

};


%make_alias(GeomFill_CurveAndTrihedron)

%extend GeomFill_CurveAndTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GeomFill_Curved *
************************/
class GeomFill_Curved : public GeomFill_Filling {
	public:
		/****************** GeomFill_Curved ******************/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Curved;
		 GeomFill_Curved();

		/****************** GeomFill_Curved ******************/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Returns
-------
None
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****************** GeomFill_Curved ******************/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Returns
-------
None
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****************** GeomFill_Curved ******************/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt

Returns
-------
None
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2);

		/****************** GeomFill_Curved ******************/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal

Returns
-------
None
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2);

};


%extend GeomFill_Curved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_Darboux *
*************************/
class GeomFill_Darboux : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_Darboux ******************/
		%feature("compactdefaultargs") GeomFill_Darboux;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Darboux;
		 GeomFill_Darboux();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute triedrhon on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of tangent(t) and normal(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

};


%make_alias(GeomFill_Darboux)

%extend GeomFill_Darboux {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_DegeneratedBound *
**********************************/
class GeomFill_DegeneratedBound : public GeomFill_Boundary {
	public:
		/****************** GeomFill_DegeneratedBound ******************/
		%feature("compactdefaultargs") GeomFill_DegeneratedBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
Point: gp_Pnt
First: float
Last: float
Tol3d: float
Tolang: float

Returns
-------
None
") GeomFill_DegeneratedBound;
		 GeomFill_DegeneratedBound(const gp_Pnt & Point, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real Tolang);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
First: float
Last: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** Reparametrize ******************/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Returns
-------
None
") Reparametrize;
		void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_DegeneratedBound)

%extend GeomFill_DegeneratedBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomFill_DiscreteTrihedron *
***********************************/
class GeomFill_DiscreteTrihedron : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_DiscreteTrihedron ******************/
		%feature("compactdefaultargs") GeomFill_DiscreteTrihedron;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_DiscreteTrihedron;
		 GeomFill_DiscreteTrihedron();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute trihedron on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute trihedron and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation for the moment it returns null values for dtangent, dnormal and dbinormal.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation for the moment it returns null values for dtangent, dnormal dbinormal, d2tangent, d2normal, d2binormal.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of tangent(t) and normal(t) it is usful to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

};


%make_alias(GeomFill_DiscreteTrihedron)

%extend GeomFill_DiscreteTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomFill_DraftTrihedron *
********************************/
class GeomFill_DraftTrihedron : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_DraftTrihedron ******************/
		%feature("compactdefaultargs") GeomFill_DraftTrihedron;
		%feature("autodoc", "No available documentation.

Parameters
----------
BiNormal: gp_Vec
Angle: float

Returns
-------
None
") GeomFill_DraftTrihedron;
		 GeomFill_DraftTrihedron(const gp_Vec & BiNormal, const Standard_Real Angle);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of tangent(t) and normal(t) it is usefull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
Angle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real Angle);

};


%make_alias(GeomFill_DraftTrihedron)

%extend GeomFill_DraftTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomFill_EvolvedSection *
********************************/
class GeomFill_EvolvedSection : public GeomFill_SectionLaw {
	public:
		/****************** GeomFill_EvolvedSection ******************/
		%feature("compactdefaultargs") GeomFill_EvolvedSection;
		%feature("autodoc", "Make an sectionlaw with a curve and a real law.

Parameters
----------
C: Geom_Curve
L: Law_Function

Returns
-------
None
") GeomFill_EvolvedSection;
		 GeomFill_EvolvedSection(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Law_Function> & L);

		/****************** BSplineSurface ******************/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. is it the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** ConstantSection ******************/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return the constant section if <self> isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles in all sections. this information is usefull to control error in rational approximation. warning: used only if <self> isrational.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerances associated at each poles to reach in approximation, to satisfy: boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return true if the law isconstant.

Parameters
----------

Returns
-------
Error: float
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if the law isperiodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_EvolvedSection)

%extend GeomFill_EvolvedSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GeomFill_Fixed *
***********************/
class GeomFill_Fixed : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_Fixed ******************/
		%feature("compactdefaultargs") GeomFill_Fixed;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tangent: gp_Vec
Normal: gp_Vec

Returns
-------
None
") GeomFill_Fixed;
		 GeomFill_Fixed(const gp_Vec & Tangent, const gp_Vec & Normal);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute triedrhon on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of tangent(t) and normal(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

};


%make_alias(GeomFill_Fixed)

%extend GeomFill_Fixed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GeomFill_Frenet *
************************/
class GeomFill_Frenet : public GeomFill_TrihedronLaw {
	public:
		/****************** GeomFill_Frenet ******************/
		%feature("compactdefaultargs") GeomFill_Frenet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Frenet;
		 GeomFill_Frenet();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute triedrhon on curve at parameter <param>.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute triedrhon and derivative trihedron on curve at parameter <param> warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute trihedron on curve first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of tangent(t) and normal(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

};


%make_alias(GeomFill_Frenet)

%extend GeomFill_Frenet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomFill_Generator *
***************************/
class GeomFill_Generator : public GeomFill_Profiler {
	public:
		/****************** GeomFill_Generator ******************/
		%feature("compactdefaultargs") GeomFill_Generator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Generator;
		 GeomFill_Generator();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Converts all curves to bsplinecurves. set them to the common profile. compute the surface (degv = 1). <ptol> is used to compare 2 knots.

Parameters
----------
PTol: float

Returns
-------
None
") Perform;
		virtual void Perform(const Standard_Real PTol);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

};


%extend GeomFill_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_LocationDraft *
*******************************/
class GeomFill_LocationDraft : public GeomFill_LocationLaw {
	public:
		/****************** GeomFill_LocationDraft ******************/
		%feature("compactdefaultargs") GeomFill_LocationDraft;
		%feature("autodoc", "No available documentation.

Parameters
----------
Direction: gp_Dir
Angle: float

Returns
-------
None
") GeomFill_LocationDraft;
		 GeomFill_LocationDraft(const gp_Dir & Direction, const Standard_Real Angle);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location and 2d points.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute location 2d points and associated first derivatives. warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute location 2d points and associated first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
AM: gp_Mat
AV: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMaximalNorm ******************/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** HasFirstRestriction ******************/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Say if the first restriction is defined in this class. if it is true the first element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****************** HasLastRestriction ******************/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Say if the last restriction is defined in this class. if it is true the last element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsIntersec ******************/
		%feature("compactdefaultargs") IsIntersec;
		%feature("autodoc", "Say if the generatrice interset the surface.

Returns
-------
bool
") IsIntersec;
		Standard_Boolean IsIntersec();

		/****************** IsRotation ******************/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "Say if the location law, is a rotation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****************** IsTranslation ******************/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "Say if the location law, is an translation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> this information is usfull to find an good tolerance in 2d approximation. warning: used only if nb2dcurve > 0.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Center: gp_Pnt

Returns
-------
None
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
Angle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real Angle);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetStopSurf ******************/
		%feature("compactdefaultargs") SetStopSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf: Adaptor3d_HSurface

Returns
-------
None
") SetStopSurf;
		void SetStopSurf(const opencascade::handle<Adaptor3d_HSurface> & Surf);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transfo: gp_Mat

Returns
-------
None
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

		/****************** TraceNumber ******************/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Give the number of trace (curves 2d wich are not restriction) returns 1 (default implementation).

Returns
-------
int
") TraceNumber;
		virtual Standard_Integer TraceNumber();

};


%make_alias(GeomFill_LocationDraft)

%extend GeomFill_LocationDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_LocationGuide *
*******************************/
class GeomFill_LocationGuide : public GeomFill_LocationLaw {
	public:
		/****************** GeomFill_LocationGuide ******************/
		%feature("compactdefaultargs") GeomFill_LocationGuide;
		%feature("autodoc", "No available documentation.

Parameters
----------
Triedre: GeomFill_TrihedronWithGuide

Returns
-------
None
") GeomFill_LocationGuide;
		 GeomFill_LocationGuide(const opencascade::handle<GeomFill_TrihedronWithGuide> & Triedre);

		/****************** ComputeAutomaticLaw ******************/
		%feature("compactdefaultargs") ComputeAutomaticLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
ParAndRad: TColgp_HArray1OfPnt2d

Returns
-------
GeomFill_PipeError
") ComputeAutomaticLaw;
		GeomFill_PipeError ComputeAutomaticLaw(opencascade::handle<TColgp_HArray1OfPnt2d> & ParAndRad);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute location and 2d points.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute location 2d points and associated first derivatives. warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute location 2d points and associated first and seconde derivatives. warning : it used only for c2 aproximation.

Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****************** EraseRotation ******************/
		%feature("compactdefaultargs") EraseRotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") EraseRotation;
		void EraseRotation();

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
AM: gp_Mat
AV: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMaximalNorm ******************/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** Guide ******************/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** HasFirstRestriction ******************/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Say if the first restriction is defined in this class. if it is true the first element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****************** HasLastRestriction ******************/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Say if the last restriction is defined in this class. if it is true the last element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsRotation ******************/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "Say if the location law, is a rotation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****************** IsTranslation ******************/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "Say if the location law, is an translation of location the default implementation is ' returns false '.

Parameters
----------

Returns
-------
Error: float
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the resolutions in the sub-space 2d <index> this information is usfull to find an good tolerance in 2d approximation. warning: used only if nb2dcurve > 0.

Parameters
----------
Index: int
Tol: float

Returns
-------
TolU: float
TolV: float
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "No available documentation.

Parameters
----------
Center: gp_Pnt

Returns
-------
None
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Section;
		opencascade::handle<Geom_Curve> Section();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Section: GeomFill_SectionLaw
rotat: bool
SFirst: float
SLast: float
PrecAngle: float

Returns
-------
LastAngle: float
") Set;
		void Set(const opencascade::handle<GeomFill_SectionLaw> & Section, const Standard_Boolean rotat, const Standard_Real SFirst, const Standard_Real SLast, const Standard_Real PrecAngle, Standard_Real &OutValue);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****************** SetOrigine ******************/
		%feature("compactdefaultargs") SetOrigine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param1: float
Param2: float

Returns
-------
None
") SetOrigine;
		void SetOrigine(const Standard_Real Param1, const Standard_Real Param2);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Is usefull, if (me) have to run numerical algorithm to perform d0, d1 or d2 the default implementation make nothing.

Parameters
----------
Tol3d: float
Tol2d: float

Returns
-------
None
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****************** SetTrsf ******************/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transfo: gp_Mat

Returns
-------
None
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

		/****************** TraceNumber ******************/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Give the number of trace (curves 2d wich are not restriction) returns 1 (default implementation).

Returns
-------
int
") TraceNumber;
		virtual Standard_Integer TraceNumber();

};


%make_alias(GeomFill_LocationGuide)

%extend GeomFill_LocationGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomFill_NSections *
***************************/
/**********************************
* class GeomFill_SectionGenerator *
**********************************/
class GeomFill_SectionGenerator : public GeomFill_Profiler {
	public:
		/****************** GeomFill_SectionGenerator ******************/
		%feature("compactdefaultargs") GeomFill_SectionGenerator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_SectionGenerator;
		 GeomFill_SectionGenerator();

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "No available documentation.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of section<p>, to impose it for the approximation.

Parameters
----------
P: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer P);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Used for the first and last section the method returns standard_true if the derivatives are computed, otherwise it returns standard_false.

Parameters
----------
P: int
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") Section;
		Standard_Boolean Section(const Standard_Integer P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** Section ******************/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: int
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Returns
-------
None
") Section;
		void Section(const Standard_Integer P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****************** SetParam ******************/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "No available documentation.

Parameters
----------
Params: TColStd_HArray1OfReal

Returns
-------
None
") SetParam;
		void SetParam(const opencascade::handle<TColStd_HArray1OfReal> & Params);

};


%extend GeomFill_SectionGenerator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_SimpleBound *
*****************************/
class GeomFill_SimpleBound : public GeomFill_Boundary {
	public:
		/****************** GeomFill_SimpleBound ******************/
		%feature("compactdefaultargs") GeomFill_SimpleBound;
		%feature("autodoc", "Constructs the boundary object defined by the 3d curve. the surface to be built along this boundary will be in the tolerance range defined by tol3d. this object is to be used as a boundary for a geomfill_constrainedfilling framework. dummy is initialized but has no function in this class. warning curve is an adapted curve, that is, an object which is an interface between: - the services provided by a 3d curve from the package geom - and those required of the curve by the computation algorithm which uses it. the adapted curve is created in one of the following ways: - first sequence: opencascade::handle<geom_curve> mycurve = ... ; opencascade::handle<geomadaptor_hcurve> curve = new geomadaptor_hcurve(mycurve); - second sequence: // step 1 opencascade::handle<geom_curve> mycurve = ... ; geomadaptor_curve crv (mycurve); // step 2 opencascade::handle<geomadaptor_hcurve> curve = new geomadaptor_hcurve(crv); you use the second part of this sequence if you already have the adapted curve crv. the boundary is then constructed with the curve object: standard_real tol = ... ; standard_real dummy = 0. ; myboundary = geomfill_simplebound (curve,tol,dummy);.

Parameters
----------
Curve: Adaptor3d_HCurve
Tol3d: float
Tolang: float

Returns
-------
None
") GeomFill_SimpleBound;
		 GeomFill_SimpleBound(const opencascade::handle<Adaptor3d_HCurve> & Curve, const Standard_Real Tol3d, const Standard_Real Tolang);

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
First: float
Last: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** Reparametrize ******************/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Returns
-------
None
") Reparametrize;
		void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_SimpleBound)

%extend GeomFill_SimpleBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_Stretch *
*************************/
class GeomFill_Stretch : public GeomFill_Filling {
	public:
		/****************** GeomFill_Stretch ******************/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Stretch;
		 GeomFill_Stretch();

		/****************** GeomFill_Stretch ******************/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Returns
-------
None
") GeomFill_Stretch;
		 GeomFill_Stretch(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****************** GeomFill_Stretch ******************/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Returns
-------
None
") GeomFill_Stretch;
		 GeomFill_Stretch(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Returns
-------
None
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

};


%extend GeomFill_Stretch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomFill_TgtOnCoons *
****************************/
class GeomFill_TgtOnCoons : public GeomFill_TgtField {
	public:
		/****************** GeomFill_TgtOnCoons ******************/
		%feature("compactdefaultargs") GeomFill_TgtOnCoons;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: GeomFill_CoonsAlgPatch
I: int

Returns
-------
None
") GeomFill_TgtOnCoons;
		 GeomFill_TgtOnCoons(const opencascade::handle<GeomFill_CoonsAlgPatch> & K, const Standard_Integer I);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the derivative of the field of tangency at parameter w.

Parameters
----------
W: float

Returns
-------
gp_Vec
") D1;
		gp_Vec D1(const Standard_Real W);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the value and the derivative of the field of tangency at parameter w.

Parameters
----------
W: float
T: gp_Vec
DT: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real W, gp_Vec & T, gp_Vec & DT);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the field of tangency at parameter w.

Parameters
----------
W: float

Returns
-------
gp_Vec
") Value;
		gp_Vec Value(const Standard_Real W);

};


%make_alias(GeomFill_TgtOnCoons)

%extend GeomFill_TgtOnCoons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomFill_TrihedronWithGuide *
************************************/
%nodefaultctor GeomFill_TrihedronWithGuide;
class GeomFill_TrihedronWithGuide : public GeomFill_TrihedronLaw {
	public:
		/****************** CurrentPointOnGuide ******************/
		%feature("compactdefaultargs") CurrentPointOnGuide;
		%feature("autodoc", "Returns the current point on guide found by d0, d1 or d2.

Returns
-------
gp_Pnt
") CurrentPointOnGuide;
		gp_Pnt CurrentPointOnGuide();

		/****************** Guide ******************/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** Origine ******************/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param1: float
Param2: float

Returns
-------
None
") Origine;
		virtual void Origine(const Standard_Real Param1, const Standard_Real Param2);

};


%make_alias(GeomFill_TrihedronWithGuide)

%extend GeomFill_TrihedronWithGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomFill_UniformSection *
********************************/
class GeomFill_UniformSection : public GeomFill_SectionLaw {
	public:
		/****************** GeomFill_UniformSection ******************/
		%feature("compactdefaultargs") GeomFill_UniformSection;
		%feature("autodoc", "Make an constant law with c. [first, last] define law definition domain.

Parameters
----------
C: Geom_Curve
FirstParameter: float,optional
	default value is 0.0
LastParameter: float,optional
	default value is 1.0

Returns
-------
None
") GeomFill_UniformSection;
		 GeomFill_UniformSection(const opencascade::handle<Geom_Curve> & C, const Standard_Real FirstParameter = 0.0, const Standard_Real LastParameter = 1.0);

		/****************** BSplineSurface ******************/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. is it the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** ConstantSection ******************/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return the constant section if <self> isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the section for v = param.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the first derivative in v direction of the section for v = param warning : it used only for c1 or c2 aproximation.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the second derivative in v direction of the section for v = param warning : it used only for c2 aproximation.

Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****************** GetDomain ******************/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "Gets the bounds of the function parametric domain. warning: this domain it is not modified by the setvalue method.

Parameters
----------

Returns
-------
First: float
Last: float
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Gets the bounds of the parametric interval on the function.

Parameters
----------

Returns
-------
First: float
Last: float
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "Compute the minimal value of weight for each poles in all sections. this information is usefull to control error in rational approximation. warning: used only if <self> isrational.

Parameters
----------
Weigths: TColStd_Array1OfReal

Returns
-------
None
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns the tolerances associated at each poles to reach in approximation, to satisfy: boundtol error at the boundary angletol tangent error at the boundary (in radian) surftol error inside the surface.

Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Returns
-------
None
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return true.

Parameters
----------

Returns
-------
Error: float
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if the law isperiodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Get the knots of the section.

Parameters
----------
TKnots: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "Get the multplicities of the section.

Parameters
----------
TMults: TColStd_Array1OfInteger

Returns
-------
None
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "Get the format of an section.

Parameters
----------

Returns
-------
NbPoles: int
NbKnots: int
Degree: int
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_UniformSection)

%extend GeomFill_UniformSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_GuideTrihedronAC *
**********************************/
class GeomFill_GuideTrihedronAC : public GeomFill_TrihedronWithGuide {
	public:
		/****************** GeomFill_GuideTrihedronAC ******************/
		%feature("compactdefaultargs") GeomFill_GuideTrihedronAC;
		%feature("autodoc", "No available documentation.

Parameters
----------
guide: Adaptor3d_HCurve

Returns
-------
None
") GeomFill_GuideTrihedronAC;
		 GeomFill_GuideTrihedronAC(const opencascade::handle<Adaptor3d_HCurve> & guide);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Guide ******************/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Say if the law is defined, only by the 3d geometry of the setted curve return false by default.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Origine ******************/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "No available documentation.

Parameters
----------
OrACR1: float
OrACR2: float

Returns
-------
None
") Origine;
		virtual void Origine(const Standard_Real OrACR1, const Standard_Real OrACR2);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_GuideTrihedronAC)

%extend GeomFill_GuideTrihedronAC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomFill_GuideTrihedronPlan *
************************************/
class GeomFill_GuideTrihedronPlan : public GeomFill_TrihedronWithGuide {
	public:
		/****************** GeomFill_GuideTrihedronPlan ******************/
		%feature("compactdefaultargs") GeomFill_GuideTrihedronPlan;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGuide: Adaptor3d_HCurve

Returns
-------
None
") GeomFill_GuideTrihedronPlan;
		 GeomFill_GuideTrihedronPlan(const opencascade::handle<Adaptor3d_HCurve> & theGuide);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Returns
-------
bool
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Returns
-------
bool
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Returns
-------
bool
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "Get average value of m(t) and v(t) it is usfull to make fast approximation of rational surfaces.

Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Returns
-------
None
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****************** Guide ******************/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Say if the law is defined, only by the 3d geometry of the setted curve return false by default.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Origine ******************/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "No available documentation.

Parameters
----------
OrACR1: float
OrACR2: float

Returns
-------
None
") Origine;
		virtual void Origine(const Standard_Real OrACR1, const Standard_Real OrACR2);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePath: Adaptor3d_HCurve

Returns
-------
None
") SetCurve;
		virtual void SetCurve(const opencascade::handle<Adaptor3d_HCurve> & thePath);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "Sets the bounds of the parametric interval on the function this determines the derivatives in these values if the function is not cn.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_GuideTrihedronPlan)

%extend GeomFill_GuideTrihedronPlan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class GeomFill_NSections:
	pass

@classnotwrapped
class GeomFill_SweepSectionGenerator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
class GeomFill_HArray1OfLocationLaw : public  GeomFill_Array1OfLocationLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const  GeomFill_Array1OfLocationLaw::value_type& theValue);
    GeomFill_HArray1OfLocationLaw(const  GeomFill_Array1OfLocationLaw& theOther);
    const  GeomFill_Array1OfLocationLaw& Array1();
     GeomFill_Array1OfLocationLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfLocationLaw)


class GeomFill_HArray1OfSectionLaw : public  GeomFill_Array1OfSectionLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const  GeomFill_Array1OfSectionLaw::value_type& theValue);
    GeomFill_HArray1OfSectionLaw(const  GeomFill_Array1OfSectionLaw& theOther);
    const  GeomFill_Array1OfSectionLaw& Array1();
     GeomFill_Array1OfSectionLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfSectionLaw)


/* harray2 classes */
/* hsequence classes */
class GeomFill_HSequenceOfAx2 : public  GeomFill_SequenceOfAx2, public Standard_Transient {
  public:
    GeomFill_HSequenceOfAx2();
    GeomFill_HSequenceOfAx2(const  GeomFill_SequenceOfAx2& theOther);
    const  GeomFill_SequenceOfAx2& Sequence();
    void Append (const  GeomFill_SequenceOfAx2::value_type& theItem);
    void Append ( GeomFill_SequenceOfAx2& theSequence);
     GeomFill_SequenceOfAx2& ChangeSequence();
};
%make_alias(GeomFill_HSequenceOfAx2)


