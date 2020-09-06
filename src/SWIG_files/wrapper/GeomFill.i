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
from enum import IntEnum
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

class GeomFill_ApproxStyle(IntEnum):
	GeomFill_Section = 0
	GeomFill_Location = 1
GeomFill_Section = GeomFill_ApproxStyle.GeomFill_Section
GeomFill_Location = GeomFill_ApproxStyle.GeomFill_Location

class GeomFill_Trihedron(IntEnum):
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
GeomFill_IsCorrectedFrenet = GeomFill_Trihedron.GeomFill_IsCorrectedFrenet
GeomFill_IsFixed = GeomFill_Trihedron.GeomFill_IsFixed
GeomFill_IsFrenet = GeomFill_Trihedron.GeomFill_IsFrenet
GeomFill_IsConstantNormal = GeomFill_Trihedron.GeomFill_IsConstantNormal
GeomFill_IsDarboux = GeomFill_Trihedron.GeomFill_IsDarboux
GeomFill_IsGuideAC = GeomFill_Trihedron.GeomFill_IsGuideAC
GeomFill_IsGuidePlan = GeomFill_Trihedron.GeomFill_IsGuidePlan
GeomFill_IsGuideACWithContact = GeomFill_Trihedron.GeomFill_IsGuideACWithContact
GeomFill_IsGuidePlanWithContact = GeomFill_Trihedron.GeomFill_IsGuidePlanWithContact
GeomFill_IsDiscreteTrihedron = GeomFill_Trihedron.GeomFill_IsDiscreteTrihedron

class GeomFill_FillingStyle(IntEnum):
	GeomFill_StretchStyle = 0
	GeomFill_CoonsStyle = 1
	GeomFill_CurvedStyle = 2
GeomFill_StretchStyle = GeomFill_FillingStyle.GeomFill_StretchStyle
GeomFill_CoonsStyle = GeomFill_FillingStyle.GeomFill_CoonsStyle
GeomFill_CurvedStyle = GeomFill_FillingStyle.GeomFill_CurvedStyle

class GeomFill_PipeError(IntEnum):
	GeomFill_PipeOk = 0
	GeomFill_PipeNotOk = 1
	GeomFill_PlaneNotIntersectGuide = 2
	GeomFill_ImpossibleContact = 3
GeomFill_PipeOk = GeomFill_PipeError.GeomFill_PipeOk
GeomFill_PipeNotOk = GeomFill_PipeError.GeomFill_PipeNotOk
GeomFill_PlaneNotIntersectGuide = GeomFill_PipeError.GeomFill_PlaneNotIntersectGuide
GeomFill_ImpossibleContact = GeomFill_PipeError.GeomFill_ImpossibleContact
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
%wrap_handle(GeomFill_NSections)
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

%extend NCollection_Sequence<gp_Ax2> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomFill_SequenceOfTrsf) NCollection_Sequence<gp_Trsf>;

%extend NCollection_Sequence<gp_Trsf> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: 7670935987fa38c6bda2cd1f57feb0ed ****/
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
		/**** md5 signature: 32287dfdf4d02cc6e907c948a85c8d68 ****/
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
		/**** md5 signature: a00c25f874484c064860aa81fa70acb6 ****/
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
		/**** md5 signature: f85c68b214a52df79ab84c0fed389ed6 ****/
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
		/**** md5 signature: 003ee9f808c91303411dd1103ac1580f ****/
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
		/**** md5 signature: 41a668da380cd0191814e6697f67950d ****/
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
		/**** md5 signature: 8c24952ff029ceb3b99a201b830b6212 ****/
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
		/**** md5 signature: 264559ae34cbb529bcff7630a6f546c3 ****/
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
		/**** md5 signature: 9ce66d74545adeac22c48a48241309ed ****/
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
		/**** md5 signature: 1c7dbddb83a07cfe5e8bef48ba5dabe0 ****/
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_AppSurf;
		 GeomFill_AppSurf();

		/****************** GeomFill_AppSurf ******************/
		/**** md5 signature: 3bd483f9e3eb4e01e4564c16be2b3791 ****/
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
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		/**** md5 signature: 4b68323f3c03d233f69e27404a58a42c ****/
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
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
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
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
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
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
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
		/**** md5 signature: 44a81349dbd1c40eccbaf3f763903054 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		/**** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ****/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		/**** md5 signature: e8e4da371dbd87da036a62de5595f08b ****/
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
		/**** md5 signature: 2eb325a3136863679e94e12dd2910a46 ****/
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
		/**** md5 signature: e46fca96d8fba2154acfef98f49f263e ****/
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
		/**** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ****/
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
		/**** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ****/
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
		/**** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ****/
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
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
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
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
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
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
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
		/**** md5 signature: c8d3e7f26c4ee8a50f4eca5274d79e63 ****/
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
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
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
		/**** md5 signature: 9e735b03a8b92d1b4b7f9849156ea8dc ****/
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_AppSweep;
		 GeomFill_AppSweep();

		/****************** GeomFill_AppSweep ******************/
		/**** md5 signature: 1077fe95aa476880e0b3f86c33c517cd ****/
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
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity used in the approximation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** CriteriumWeight ******************/
		/**** md5 signature: 4b68323f3c03d233f69e27404a58a42c ****/
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
		/**** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ****/
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
		/**** md5 signature: 8df321abd16a4651f96229eab1c5f048 ****/
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
		/**** md5 signature: 85ba31033da623d05ad75c9b051842b3 ****/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****************** Curves2dKnots ******************/
		/**** md5 signature: cd12725d88c425f3fe1ebccf9467256f ****/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****************** Curves2dMults ******************/
		/**** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ****/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****************** Curves2dShape ******************/
		/**** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ****/
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
		/**** md5 signature: 44a81349dbd1c40eccbaf3f763903054 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbCurves2d ******************/
		/**** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ****/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****************** ParType ******************/
		/**** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ****/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Returns the type of parametrization used in the approximation.

Returns
-------
Approx_ParametrizationType
") ParType;
		Approx_ParametrizationType ParType();

		/****************** Perform ******************/
		/**** md5 signature: 5729175890fe0309e2865ec4bb63bd8f ****/
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
		/**** md5 signature: 57bd689c19c25917c19e2b9cd362cce3 ****/
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
		/**** md5 signature: 405eff04997dd8c0d95c5553e2f99624 ****/
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
		/**** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ****/
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
		/**** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ****/
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
		/**** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ****/
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
		/**** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ****/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
TColgp_Array2OfPnt
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****************** SurfShape ******************/
		/**** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ****/
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
		/**** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ****/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****************** SurfUMults ******************/
		/**** md5 signature: ef046447df8e4b2931da90e1475e731f ****/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****************** SurfVKnots ******************/
		/**** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ****/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****************** SurfVMults ******************/
		/**** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ****/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****************** SurfWeights ******************/
		/**** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ****/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array2OfReal
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****************** Surface ******************/
		/**** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ****/
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
		/**** md5 signature: f21f0f877b35cf67581fa59260f72857 ****/
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
		/**** md5 signature: c8d3e7f26c4ee8a50f4eca5274d79e63 ****/
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
		/**** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** VDegree ******************/
		/**** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ****/
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
		/**** md5 signature: 87e0aef52475a1573c465fec5d82d48d ****/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "Constructs a default bspline surface framework.

Returns
-------
None
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves();

		/****************** GeomFill_BSplineCurves ******************/
		/**** md5 signature: e2d7231f750710ead9d50ecb66ca1979 ****/
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
		/**** md5 signature: acb50b52f59852f0aa0519551cc6a635 ****/
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
		/**** md5 signature: 128f91ad74ed4756ca15ba7ce405c9c7 ****/
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
		/**** md5 signature: 39be09b652d63f92221b6a9f668da556 ****/
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
		/**** md5 signature: 8c1e4ea27db140918013a210804afd7a ****/
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
		/**** md5 signature: a60013b896a33bdae0dfab458ab2dd4c ****/
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
		/**** md5 signature: 671a5de971e9a6baf08b4e111daa768f ****/
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
		/**** md5 signature: bfa320d41e7cefe14ec555f53005095c ****/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "Constructs an empty framework for building a bezier surface from contiguous bezier curves. you use the init function to define the boundaries of the surface.

Returns
-------
None
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves();

		/****************** GeomFill_BezierCurves ******************/
		/**** md5 signature: 66f314aaa192119199c8fed852c1b6d5 ****/
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
		/**** md5 signature: 097f529258a45247cc5acab7298ebfa1 ****/
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
		/**** md5 signature: 510d7795e7257dc3b826a3c0344d89f7 ****/
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
		/**** md5 signature: 6f1126ff718aaa99f991335b7e5e5379 ****/
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
		/**** md5 signature: 7df84fc2f0be865f8a23e1f7b445f402 ****/
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
		/**** md5 signature: bcf8670cf0bcde11da542b274e3f7ff9 ****/
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
		/**** md5 signature: ec0ec9a2ddd5540d0c39fd4a1f632437 ****/
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
		/**** md5 signature: 4e8179e13e1bc1406a047903884f8b0f ****/
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
		/**** md5 signature: ae5a83b60da9cbff06b3607a7e3ff572 ****/
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
		/**** md5 signature: f893ebdce4a5fbbff73f4358ac8b5978 ****/
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
		/**** md5 signature: 5f6a8ed75c40f46eb7071afbd4bf6f85 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasNormals;
		virtual Standard_Boolean HasNormals();

		/****************** IsDegenerated ******************/
		/**** md5 signature: 394a948c8760e522f4d807c029014116 ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		virtual Standard_Boolean IsDegenerated();

		/****************** Norm ******************/
		/**** md5 signature: 987eaa9aa4439bd8474e291368d19c1e ****/
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
		/**** md5 signature: 63f81329674af973a02f91ae5822973a ****/
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
		/**** md5 signature: 89d15d5b042afa6cfa640283df9a718e ****/
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
		/**** md5 signature: 0c721fa385f74a0241e7db7704f9176b ****/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tol3d;
		Standard_Real Tol3d();

		/****************** Tol3d ******************/
		/**** md5 signature: e2856f01229403a6922bd0bdb96cc6a4 ****/
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
		/**** md5 signature: 4dd5ea66cb1bdd5fbeec6eac3cb6a07c ****/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolang;
		Standard_Real Tolang();

		/****************** Tolang ******************/
		/**** md5 signature: be6abd09513454fc3f8616ab23ce4464 ****/
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
		/**** md5 signature: 1036ed4d9f5021803fbe93aafa457209 ****/
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
		/**** md5 signature: bafdd660219fe39f80e3292e9c6aa0f4 ****/
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
		/**** md5 signature: a691940df52b45c198f3414d0790e091 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditionned rational approximation.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		/**** md5 signature: 6e91f38f7b850db44626fcacae37aa41 ****/
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
		/**** md5 signature: 2393309f0bc419006f62cbad28865129 ****/
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
		/**** md5 signature: 4cdf4be928174877f3da59b3bf48c192 ****/
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
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
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
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
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
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the maximum section. this information is usefull to perform well conditionned rational approximation.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
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
		/**** md5 signature: a7d69b59dcf4f7a28533481bfba32ffb ****/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ****/
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
		/**** md5 signature: 05a10ea67ce9ff5c6eb06e7785b8f511 ****/
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
		/**** md5 signature: d66093f22e02305950c68ac9d1e5738f ****/
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
		/**** md5 signature: 71f119ceb88cef03284bfde58080f00a ****/
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
		/**** md5 signature: 5bb522a338dcaa3b28b36318e1e600dd ****/
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
		/**** md5 signature: c9aa2edfff728ef4e67f742b02df583e ****/
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
		/**** md5 signature: 92ccf822cba93322d7258e90bf6a9ed8 ****/
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
		/**** md5 signature: f6ee8af82d58715b28cbfb3fc55e1b3d ****/
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
		/**** md5 signature: bb90dabc55e8eef56ed3f74ed6e0c72e ****/
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
		/**** md5 signature: 6c95d04c6903e9495319ba3b7855e782 ****/
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
		/**** md5 signature: 446512b2f33090f1848a5ff7131926bf ****/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "Computes the new poles of the surface using the new blending functions set by several calls to setdomain.

Returns
-------
None
") ReBuild;
		void ReBuild();

		/****************** SetDomain ******************/
		/**** md5 signature: f15e2b06830a710fdf8f11f792509cfd ****/
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
		/**** md5 signature: 2f50ef783efd4092d3a11c39580e031f ****/
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
		/**** md5 signature: 8313801afe15d97502730d205ba6aedd ****/
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
		/**** md5 signature: c7a6b953b6e3152dbf24245ec3855852 ****/
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
		/**** md5 signature: 52d3f66618593ed082e79ce47ae5b2e9 ****/
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
		/**** md5 signature: e0ed54fcb23b418df4c3f658cc6a93a7 ****/
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
		/**** md5 signature: 3e884a933d6ef4b91df297a08be6eaed ****/
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
		/**** md5 signature: 551cda651252e0218c32235dbe891afa ****/
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
		/**** md5 signature: e7f1d4ad2f7ad640080d862cd1acd5ac ****/
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
		/**** md5 signature: 8d1466c000c855ccc37326b09627c4b3 ****/
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
		/**** md5 signature: d7c144cb61c98bd760c2897ab648584c ****/
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
		/**** md5 signature: 42959897db65d301eb66b5528ed15f16 ****/
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
		/**** md5 signature: 6f8ba49168e735184f5cbf02f218d961 ****/
		%feature("compactdefaultargs") GeomFill_CornerState;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_CornerState;
		 GeomFill_CornerState();

		/****************** Constraint ******************/
		/**** md5 signature: c65689f41db5ca0fb92caabb5e354a5d ****/
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Constraint;
		void Constraint();

		/****************** DoKill ******************/
		/**** md5 signature: f59d3324e2d958952750dbe3caa2d8ca ****/
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
		/**** md5 signature: 57884ecbe8d7b5b092e706848a3678db ****/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Gap;
		Standard_Real Gap();

		/****************** Gap ******************/
		/**** md5 signature: f1f69db79c82510ff6d3e007517400a7 ****/
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
		/**** md5 signature: b284feaf1d053df9b6efe4b2a8443c50 ****/
		%feature("compactdefaultargs") HasConstraint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasConstraint;
		Standard_Boolean HasConstraint();

		/****************** IsToKill ******************/
		/**** md5 signature: 6df117c61ed49f132cf24a2849741b58 ****/
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
		/**** md5 signature: af8052ba83d247ad3d6bb5c4ca00983f ****/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") NorAng;
		Standard_Real NorAng();

		/****************** NorAng ******************/
		/**** md5 signature: 978de348befc356078bda3f1ab4a84d4 ****/
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
		/**** md5 signature: 0c0974dcf961b00f0f5e5459288df2aa ****/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TgtAng;
		Standard_Real TgtAng();

		/****************** TgtAng ******************/
		/**** md5 signature: 25b12c2b442b6535ed79421583afc990 ****/
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
		/**** md5 signature: 3b1110ca9e87c0eec14c23c2b775f31f ****/
		%feature("compactdefaultargs") GeomFill_Filling;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Filling;
		 GeomFill_Filling();

		/****************** NbUPoles ******************/
		/**** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ****/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVPoles ******************/
		/**** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ****/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** Poles ******************/
		/**** md5 signature: d37f7b27fa9ff1e224fe0dc4f7081466 ****/
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
		/**** md5 signature: db937f94d83b7a0ec9af807fb8a53a4c ****/
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
		/**** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ****/
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
		/**** md5 signature: 178271c5b9c2baec39e6e9142ced9d7f ****/
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
		/**** md5 signature: 296f64e4925be19b19e0a50ae54545cf ****/
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
		/**** md5 signature: 3717235c7a0694bb0026f224747d3335 ****/
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
		/**** md5 signature: 4d36763de463ed3975bad9df69ce4b17 ****/
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
		/**** md5 signature: 364759ce3f6d1a901ce6394ecbbe5652 ****/
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
		/**** md5 signature: 95432d04d2efca37d62c37543709dc0f ****/
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
		/**** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: 28ab91d0183585502101892aac2c5b98 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ****/
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
		/**** md5 signature: e89fa39b5a97388571b1cb93b3e7b2fc ****/
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
		/**** md5 signature: c0add4de311a84100121077f637a58d1 ****/
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
		/**** md5 signature: 8497a0e1c79d28b9784f7f110d8384d9 ****/
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
		/**** md5 signature: 95432d04d2efca37d62c37543709dc0f ****/
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
		/**** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

Returns
-------
int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: 28ab91d0183585502101892aac2c5b98 ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

Returns
-------
int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** SetParam ******************/
		/**** md5 signature: 3321ed78a982705949ad4814c7465405 ****/
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
		/**** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ****/
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
		/**** md5 signature: e89fa39b5a97388571b1cb93b3e7b2fc ****/
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
		/**** md5 signature: d3df0f91b73168b7305fa019e59eba18 ****/
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Line;
		 GeomFill_Line();

		/****************** GeomFill_Line ******************/
		/**** md5 signature: 00a03a4156c22378791f2c1ca351787c ****/
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
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: c110b5c5190958c17fd0e50ed19311a4 ****/
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
		/**** md5 signature: cf11221f5fc7ad9a3cce4de4d90f2173 ****/
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
		/**** md5 signature: 006a1880f4e40acd2935e3b8032245a4 ****/
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
		/**** md5 signature: d5c0cc2ce05f94677e40a80295be4ff8 ****/
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
		/**** md5 signature: f79a4f85e4411bd9394e523c7df07571 ****/
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
		/**** md5 signature: 1ae44f0e971d9abebc1a35a83c1801f8 ****/
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
		/**** md5 signature: 29fa43f07f04799bcbcf97729b2d4ad0 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: fc43bb497d611730db6e5b24c13bb862 ****/
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
		/**** md5 signature: 593572b2f048fe9a55932c2f8460631d ****/
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
		/**** md5 signature: 86f0d1b0166d91c445bbc4baeef97928 ****/
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
		/**** md5 signature: b8394f0997756eb2e29dda1a7f0fba5e ****/
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
		/**** md5 signature: 6ba28977b4572c57396a526bbdd7889b ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		/**** md5 signature: 61f510937966f8431506453d1a544474 ****/
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
		/**** md5 signature: 4a1ef3d9ce66db54e3e4d47a7b4fc050 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		/**** md5 signature: cf4b59a00ac748986e419ee48c8333d6 ****/
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
		/**** md5 signature: a17748ec1150378c402b1599113effd4 ****/
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
		/**** md5 signature: 1b12372928d2ac3fbdb0f3124e438215 ****/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** HasFirstRestriction ******************/
		/**** md5 signature: ad052bc083e2d3e77328b919df490b7a ****/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Say if the first restriction is defined in this class. if it is true the first element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****************** HasLastRestriction ******************/
		/**** md5 signature: e04ed5bec90f35e567347a3b96d763c3 ****/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Say if the last restriction is defined in this class. if it is true the last element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****************** Intervals ******************/
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
		/**** md5 signature: 973edf98b0a7a11b959acaead8b42c67 ****/
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
		/**** md5 signature: ab2a53c062db49c3cabaf4b675826102 ****/
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
		/**** md5 signature: 6db4babc7c8801d581426366f92a32f0 ****/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves (restrictions + traces) to approximate.

Returns
-------
int
") Nb2dCurves;
		Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
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
		/**** md5 signature: 70b0f0265ef5802a650e7ab2f0220a7e ****/
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
		/**** md5 signature: af16e6da9546d03e40f34ed4bd8cc695 ****/
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
		/**** md5 signature: b1fda43a9cad4ea0461b36c87a954013 ****/
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
		/**** md5 signature: 0547f3a9c04c5f6c0363c26295b2e795 ****/
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
		/**** md5 signature: 1565024762efa75936883ee9558fa99d ****/
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
		/**** md5 signature: d24d0b12a29328de00f56e6c06319c83 ****/
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
		/**** md5 signature: d8da584be0a6e10afb5206d653daab74 ****/
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
		/**** md5 signature: 26475aa1bbdb26dae7e70e591201bff5 ****/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Constructs an empty algorithm for building pipes. use the function init to initialize it.

Returns
-------
None
") GeomFill_Pipe;
		 GeomFill_Pipe();

		/****************** GeomFill_Pipe ******************/
		/**** md5 signature: ee732a0cea4d5696417bc56d24241c83 ****/
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
		/**** md5 signature: 00b93a896a2ca0b4ecb608e85a9693e4 ****/
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
		/**** md5 signature: 0a728fc1802aac6865c935cb6ea957ea ****/
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
		/**** md5 signature: 0c249401b0246b0792f11f061c787f6b ****/
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
		/**** md5 signature: 21e998388a5fd330c89065860278090b ****/
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
		/**** md5 signature: d33e1011fa11db81b148eb3e78127152 ****/
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
		/**** md5 signature: bee87cb22c4bccd102806cb27434f59a ****/
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
		/**** md5 signature: bbe271d79f8412ad875968c53c099387 ****/
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
		/**** md5 signature: ad01ec3b93107af5be5d298fb4c00be1 ****/
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
		/**** md5 signature: 8f3f314d7b67e1d3eba24c5bbbfc1bbe ****/
		%feature("compactdefaultargs") ErrorOnSurf;
		%feature("autodoc", "Returns the approximation's error. if the surface is plane, cylinder ... this error can be 0.

Returns
-------
float
") ErrorOnSurf;
		Standard_Real ErrorOnSurf();

		/****************** ExchangeUV ******************/
		/**** md5 signature: b9b6c7f5992ff1ca7ae0d75a331ba2e9 ****/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "The u parametric direction of the surface constructed by this algorithm usually corresponds to the evolution along the path and the v parametric direction corresponds to the evolution along the section(s). however, this rule is not respected when constructing certain specific geom surfaces (typically cylindrical surfaces, surfaces of revolution, etc.) for which the parameterization is inversed. the exchangeuv function checks for this, and returns true in all these specific cases. warning do not use this function before the surface is built.

Returns
-------
bool
") ExchangeUV;
		Standard_Boolean ExchangeUV();

		/****************** GenerateParticularCase ******************/
		/**** md5 signature: aa8149250d2924b1d4e59f5e32c9e9c4 ****/
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
		/**** md5 signature: 25ab3daf2d52dd071efed1af2e8f07fe ****/
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "Returns the flag.

Returns
-------
bool
") GenerateParticularCase;
		Standard_Boolean GenerateParticularCase();

		/****************** Init ******************/
		/**** md5 signature: d03408a50bd75e5b4692d40387d5a32a ****/
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
		/**** md5 signature: b88dff012b9c1655d8e30b8428e98490 ****/
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
		/**** md5 signature: dd3854a6bba8e1f858ac6a42fe88b1f3 ****/
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
		/**** md5 signature: 9706fb74713beb9a8067845e9f3a59ee ****/
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
		/**** md5 signature: 95c764e9435c3ae61bdb25df43fb5a17 ****/
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
		/**** md5 signature: 1a1e6dec3cfed294ef6c0e487fa8fa7b ****/
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
		/**** md5 signature: 6b8c033e7f0e709d08fa123d51eebb91 ****/
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
		/**** md5 signature: 2c9856fb0aa3957df108423b1312aea7 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns whether approximation was done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: 6d0a57d6eb2e1596ca375a617ef63411 ****/
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
		/**** md5 signature: aca0081a2ee5f30c242a64dc111e92c1 ****/
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
		/**** md5 signature: a469e18cbceeb351572a461f96ff0f4d ****/
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
		/**** md5 signature: 7f7996e42c119051df0fe4e37e9b1d0a ****/
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
		/**** md5 signature: 3593cd3677dd66060bb00c05ef08ee1e ****/
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
		/**** md5 signature: 0d2ec6b4f7dc96e9de72b64afa69ab3d ****/
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
		/**** md5 signature: f8ffb48842950ca5a73c35193856f25e ****/
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
		/**** md5 signature: db0dcd567f64073c6f81e974e7fd2624 ****/
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
		/**** md5 signature: 15617dca721c4472bfb7ee7933f04bce ****/
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
		/**** md5 signature: 6f2163d9b7f09d24e575a61101ce4492 ****/
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
		/**** md5 signature: ee753b2a7ff11205a515831d90f0a487 ****/
		%feature("compactdefaultargs") GeomFill_PolynomialConvertor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_PolynomialConvertor;
		 GeomFill_PolynomialConvertor();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Initialized ******************/
		/**** md5 signature: 54566042fad9d35dc02b275e9a7893f4 ****/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Say if <self> is initialized.

Returns
-------
bool
") Initialized;
		Standard_Boolean Initialized();

		/****************** Section ******************/
		/**** md5 signature: 1595f7a23eaa9457c3afbcaa7893b4ed ****/
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
		/**** md5 signature: ec8a210042d92172d84213435013a438 ****/
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
		/**** md5 signature: 3b65c9fc21cb71775c8b8c832946e6f3 ****/
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
		/**** md5 signature: f2c7a9b80da515f2c466a31f1c6d230f ****/
		%feature("compactdefaultargs") GeomFill_Profiler;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Profiler;
		 GeomFill_Profiler();

		/****************** AddCurve ******************/
		/**** md5 signature: 11c20dbcd749bd2a76890d8d6a6be7ae ****/
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
		/**** md5 signature: 684e9a3c11b3f249343e6a914ac640ee ****/
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
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Raises if not yet perform.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** KnotsAndMults ******************/
		/**** md5 signature: 19787aa39b0400d3a08b5785b90459e8 ****/
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
		/**** md5 signature: ccda669299f8eba1ba0d3387af4c950e ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Raises if not yet perform.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Raises if not yet perform.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Perform ******************/
		/**** md5 signature: 190ae4aa2767ac61fd4fd06132b62d02 ****/
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
		/**** md5 signature: 66d6e30649c8a0a21c5831aa2eb82d30 ****/
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
		/**** md5 signature: ccaae2145009995024e15db4b294fc35 ****/
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
		/**** md5 signature: 1cc1111b9d2a6695b2f123ffc4cf75f3 ****/
		%feature("compactdefaultargs") GeomFill_QuasiAngularConvertor;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_QuasiAngularConvertor;
		 GeomFill_QuasiAngularConvertor();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Initialized ******************/
		/**** md5 signature: 54566042fad9d35dc02b275e9a7893f4 ****/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Say if <self> is initialized.

Returns
-------
bool
") Initialized;
		Standard_Boolean Initialized();

		/****************** Section ******************/
		/**** md5 signature: 90bd2cc2c9a5b6ae2fba3dd58381e760 ****/
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
		/**** md5 signature: bf838dcc8ca8bb48e4e3083dbbf9d136 ****/
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
		/**** md5 signature: fe6e5b059717f9ab3a642382d42feeea ****/
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
		/**** md5 signature: b51703ac160c5002a0ad431d9cf0e55c ****/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. it is the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		/**** md5 signature: cbc6eaf5619edbfc0f2839466f8de856 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** CirclSection ******************/
		/**** md5 signature: ac51174d3b9979dabe76e219f49bf427 ****/
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
		/**** md5 signature: 295eba02ad0b95a48fd7857d1d41877a ****/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return a copy of the constant section, if me isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		/**** md5 signature: eaa73c1de6c91beab5d6772f732020d6 ****/
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
		/**** md5 signature: e3c6434afb03815d368e10617d5a7f5b ****/
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
		/**** md5 signature: 8e60d2fe6644e0ec8d5c8468e973d40c ****/
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
		/**** md5 signature: cf4b59a00ac748986e419ee48c8333d6 ****/
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
		/**** md5 signature: a17748ec1150378c402b1599113effd4 ****/
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
		/**** md5 signature: 6fdd12d5da1669c5217b9449c91c0d9e ****/
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
		/**** md5 signature: 1096196f89d9fc10f33e62e0d43284fe ****/
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
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
		/**** md5 signature: 1abaa4ece9c4b4d441420168b7911bfc ****/
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
		/**** md5 signature: 2bee4baf834a2f08caa73a2fd5e7286c ****/
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
		/**** md5 signature: e2d546fe827c13e22032dacc2ce90819 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 7581170790b0f02294b3a98c2ef39654 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 157f80ff35b8cd25014f915c1fea4793 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if law is periodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		/**** md5 signature: 7e71a376fdfa4fc27638b1b7f6f203bb ****/
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
		/**** md5 signature: 138e071f49741ba955ed2185c4c8ab9f ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: d5fb3b1381d15914585fd7e6e0eafecb ****/
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
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
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
		/**** md5 signature: 2709d0545e048eec44ae3de66392188f ****/
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
		/**** md5 signature: 0547f3a9c04c5f6c0363c26295b2e795 ****/
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
		/**** md5 signature: 1565024762efa75936883ee9558fa99d ****/
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
		/**** md5 signature: ced25f171c3a20926362a90337aa6c13 ****/
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
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Distance ******************/
		/**** md5 signature: c054352e1b604c83d759bc4ccf6c526d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** ModifiedSection ******************/
		/**** md5 signature: d50774cace5784c6bcc30e9f082ed831 ****/
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
		/**** md5 signature: a4a06b5cfcc62ace4862e77e5e07ee7d ****/
		%feature("compactdefaultargs") ParameterOnPath;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnPath;
		Standard_Real ParameterOnPath();

		/****************** ParameterOnSection ******************/
		/**** md5 signature: d63193b90bace979eb3a78d341ba60bb ****/
		%feature("compactdefaultargs") ParameterOnSection;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnSection;
		Standard_Real ParameterOnSection();

		/****************** Perform ******************/
		/**** md5 signature: ef21d92cc56ea9fb08a6295512a1f679 ****/
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
		/**** md5 signature: 542185d2c15c97da6e95ee9fb149834c ****/
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
		/**** md5 signature: 1247c2342803e8af98196331e0da37ff ****/
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
		/**** md5 signature: 06d8ebfd837653e5db544efc38571dc8 ****/
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
		/**** md5 signature: bb75da6b01c89ab382627f3ab60412e1 ****/
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
		/**** md5 signature: 868f10efc437c37220d49de0dc80a297 ****/
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
		/**** md5 signature: 9d23a6d56ef665fed92eb38743540c2d ****/
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
		/**** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ****/
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
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
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
		/**** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ****/
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
		/**** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ****/
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
		/**** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ****/
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
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
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
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
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
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
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
		/**** md5 signature: cc4a35be4cdecff3ce638489af66189a ****/
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
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
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
		/**** md5 signature: ce50089dbc77201f26c276d7fa420f1d ****/
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
		/**** md5 signature: 81671eb89e696302d692cbf60bef48d7 ****/
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
		/**** md5 signature: 13a5e151e0b4b5ded2aaf892b3908f57 ****/
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
		/**** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ****/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Gets the approximation error.

Returns
-------
float
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****************** ErrorOnTrace ******************/
		/**** md5 signature: e1d1b11dd51d8fa33d430dff16f939ce ****/
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
		/**** md5 signature: b9b6c7f5992ff1ca7ae0d75a331ba2e9 ****/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Returns true if sections are u-iso this can be produce in some cases when <withkpart> is true.

Returns
-------
bool
") ExchangeUV;
		Standard_Boolean ExchangeUV();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tells if the surface is buildt.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NumberOfTrace ******************/
		/**** md5 signature: b894645ce5dbfa6b6645bffcaaefc219 ****/
		%feature("compactdefaultargs") NumberOfTrace;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NumberOfTrace;
		Standard_Integer NumberOfTrace();

		/****************** Restriction ******************/
		/**** md5 signature: 1e847729e33880d2f3dfee7d55da1756 ****/
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
		/**** md5 signature: cd38e538169c6afd28f46a7bef651d8c ****/
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
		/**** md5 signature: ef99bf0713e14fbe9531aef549b5c75b ****/
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
		/**** md5 signature: 9b397c9283d7e37feb630a46515777f2 ****/
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
		/**** md5 signature: 352bd890213763e77e08756c09e1fdcc ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** Trace ******************/
		/**** md5 signature: e6371fd3991ead038eaf12d26411dece ****/
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
		/**** md5 signature: 34ae19eef56aaa441350ad13af311fe2 ****/
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "Returns true if parametrisation sens in u is inverse of parametrisation sens of section (or of path if exchangeuv).

Returns
-------
bool
") UReversed;
		Standard_Boolean UReversed();

		/****************** VReversed ******************/
		/**** md5 signature: 3da7b47a32a00f3b216aa304d3009cba ****/
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
		/**** md5 signature: 352eb55fcdf0347a67f21144e2b992d0 ****/
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
		/**** md5 signature: a691940df52b45c198f3414d0790e091 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditionned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** D0 ******************/
		/**** md5 signature: 6e91f38f7b850db44626fcacae37aa41 ****/
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
		/**** md5 signature: 2393309f0bc419006f62cbad28865129 ****/
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
		/**** md5 signature: 4cdf4be928174877f3da59b3bf48c192 ****/
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
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
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
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the section is rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
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
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the maximum section. this information is usefull to perform well conditionned rational approximation.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
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
		/**** md5 signature: a7d69b59dcf4f7a28533481bfba32ffb ****/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Get the number of 2d curves to approximate.

Returns
-------
int
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ****/
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
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ****/
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
		/**** md5 signature: 000a58d4d29e492e0aabe3e1452a182e ****/
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
		/**** md5 signature: 6aef026ef1fcb18a844e723ac935cd4b ****/
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
		/**** md5 signature: 1744e84f6795d21ff935088da038d2e5 ****/
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
		/**** md5 signature: fd791f445ff1b5b7d6ca99e04d3b9805 ****/
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
		/**** md5 signature: 7fbff4c14c2799d1ff4bfb28332c2b6c ****/
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
		/**** md5 signature: d71dce235736f311096e4f932871958f ****/
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
		/**** md5 signature: d0bcc01a9a4d8ef8a1917bcff520e752 ****/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsScalable;
		virtual Standard_Boolean IsScalable();

		/****************** Scale ******************/
		/**** md5 signature: f0c1f3ce29463e8b8cb8c0b2fa88c037 ****/
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
		/**** md5 signature: 9bacab87e385edc8be267028cb7f46b8 ****/
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
		/**** md5 signature: 601808d007c14e98b2b54a537528d3e3 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 13340e73a6729e1ab799d984c9be5508 ****/
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
		/**** md5 signature: b5761cd22f011e952e89db7159aa7a9f ****/
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
		/**** md5 signature: 6a10a5c6f84e96e0f1ac82eef85cbf5f ****/
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
		/**** md5 signature: 6ba28977b4572c57396a526bbdd7889b ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		/**** md5 signature: fef62e0a533c49957f58085cc44431be ****/
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
		/**** md5 signature: bcc50715ebf5d151a1f9ef097844cbdc ****/
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
		/**** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ****/
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
		/**** md5 signature: 9069188cb3620131a57a89d1f535a3b9 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: f8d791bc049901655a5239dfa1822db7 ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Say if the law is defined, only by the 3d geometry of the setted curve return false by default.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ****/
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
		/**** md5 signature: 1717edc5168c614fe8501a6ca815a592 ****/
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
		/**** md5 signature: 128fbeb43b59baa5a891a2c4ea58f02a ****/
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
		/**** md5 signature: d054c1079b9edcd7cb9b4e65d2b74232 ****/
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
		/**** md5 signature: 618f7ac8e8773975015964105699f46f ****/
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
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
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
		/**** md5 signature: eae6b219d51a14ef99ea0d96ffa245af ****/
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
		/**** md5 signature: 6931d1f66362c6d45d4df1056914318c ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasNormals;
		virtual Standard_Boolean HasNormals();

		/****************** IsDegenerated ******************/
		/**** md5 signature: 79ce66385cf4dd5e407488fd7c6a2ef0 ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** Norm ******************/
		/**** md5 signature: 8ec9451193b200cdc07951b55f2348bd ****/
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
		/**** md5 signature: bd7b671d45505164bc59f6ce8496d6d0 ****/
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
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
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
		/**** md5 signature: 8343818ff749757501766023742e5008 ****/
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
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Says if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 3e7ce345fdc4339d51a4f1830d2d4a10 ****/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Coons;
		 GeomFill_Coons();

		/****************** GeomFill_Coons ******************/
		/**** md5 signature: d3ed2c1d3406214cebf52159644ee665 ****/
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
		/**** md5 signature: cbef7bb663e9994379c9aab840ba0fd0 ****/
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
		/**** md5 signature: d3ffe113a485ff934a537831bed2560b ****/
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
		/**** md5 signature: 094f730897c039878a8e655c32e65678 ****/
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
		/**** md5 signature: d76c98f61ce89e9ec82b5b957281f8d0 ****/
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet();

		/****************** GeomFill_CorrectedFrenet ******************/
		/**** md5 signature: ca99dabed4feeef737a90b4a039cdf77 ****/
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
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: d239be0fafe7316fa059e4a41d53d45f ****/
		%feature("compactdefaultargs") EvaluateBestMode;
		%feature("autodoc", "Tries to define the best trihedron mode for the curve. it can be: - frenet - correctedfrenet - discretetrihedron warning: the correctedfrenet must be constructed with option forevaluation = true, the curve must be set by method setcurve.

Returns
-------
GeomFill_Trihedron
") EvaluateBestMode;
		GeomFill_Trihedron EvaluateBestMode();

		/****************** GetAverageLaw ******************/
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: bd832d5dba5dd09f0cd75b38254e98a1 ****/
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
		/**** md5 signature: 6211f5514688258100f0ea82262b2f4b ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 316ea693fc5dcb4b89eef4bd219d0f5e ****/
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
		/**** md5 signature: 924a51426e408dff0c68c8625c80f165 ****/
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
		/**** md5 signature: 288bb22d14e06a66281554b33f433d63 ****/
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
		/**** md5 signature: 940621cc935757a0b177b16f7cd72d05 ****/
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
		/**** md5 signature: c8399d110fc93e54f7a94c0255e22682 ****/
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
		/**** md5 signature: ead921cddde0ab49628eb8cd84dd99a0 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		/**** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ****/
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
		/**** md5 signature: 5025922809e891f5aa8a2358198f31e4 ****/
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
		/**** md5 signature: d33bcb5496370d9914e70fb48ea83d28 ****/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 69c76c5168e987b8419ad259813fc9af ****/
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
		/**** md5 signature: 4064d79964f3a03428b0eb9740c21e0f ****/
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
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: b76821e717ce4d2049156bbde7eb7114 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: 52b4e29e16b9b86f3d7835907847b3d0 ****/
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
		/**** md5 signature: 6c0f36b4961d5e44a2bcde6567edd42e ****/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Curved;
		 GeomFill_Curved();

		/****************** GeomFill_Curved ******************/
		/**** md5 signature: eddcfa7b1fc9058a685f65fa4e4f0c91 ****/
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
		/**** md5 signature: f2ed21eacfd772c7afd8f10da79331b7 ****/
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
		/**** md5 signature: b8dc04ce3e1f65428d7efb97fba9cc9b ****/
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
		/**** md5 signature: 006a3e85ffd95781c1e9baa1fbb76176 ****/
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
		/**** md5 signature: d3ffe113a485ff934a537831bed2560b ****/
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
		/**** md5 signature: 094f730897c039878a8e655c32e65678 ****/
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
		/**** md5 signature: f6ef827de0cf3ac234bbfb173cd78cfe ****/
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
		/**** md5 signature: 0bfe4b6915157b1607faa578cfa286ef ****/
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
		/**** md5 signature: 5873413a2d8edcecd0fc7983a15a6a0d ****/
		%feature("compactdefaultargs") GeomFill_Darboux;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Darboux;
		 GeomFill_Darboux();

		/****************** Copy ******************/
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return false.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: f676839e48e6a57f125f5a1250ca4763 ****/
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
		/**** md5 signature: 618f7ac8e8773975015964105699f46f ****/
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
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
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
		/**** md5 signature: 79ce66385cf4dd5e407488fd7c6a2ef0 ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** Reparametrize ******************/
		/**** md5 signature: bd7b671d45505164bc59f6ce8496d6d0 ****/
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
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
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
		/**** md5 signature: 76fb1e45ad1e1d3ab57dc791e8e6458c ****/
		%feature("compactdefaultargs") GeomFill_DiscreteTrihedron;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_DiscreteTrihedron;
		 GeomFill_DiscreteTrihedron();

		/****************** Copy ******************/
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 729e35bd4c91cccae626d88982c0923e ****/
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
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: a0d60e2a1ea25c193dafa15194b0ab24 ****/
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
		/**** md5 signature: 5316bbaca3d5924b7b79d5ad0d098294 ****/
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
		/**** md5 signature: 723eb488e2a06d913977b581dcccba8f ****/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. is it the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		/**** md5 signature: a691940df52b45c198f3414d0790e091 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** ConstantSection ******************/
		/**** md5 signature: 86519bb197ca223d0ba2720b381f4036 ****/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return the constant section if <self> isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		/**** md5 signature: d889e1bd3dadd721c935f604be609d57 ****/
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
		/**** md5 signature: 127f80b4c43e681b4262dad7d1db79d7 ****/
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
		/**** md5 signature: e7553cf232323cae7964c205cd5a06a9 ****/
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
		/**** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ****/
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
		/**** md5 signature: 5025922809e891f5aa8a2358198f31e4 ****/
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
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
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
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: b8fcd911afc2577f90f33f0c8d046c8a ****/
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
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if the law isperiodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
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
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
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
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: 5e2066acb7e356d3da3376939b0798ba ****/
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
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 288a206669314641ffb5fa1c0c70d683 ****/
		%feature("compactdefaultargs") GeomFill_Frenet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Frenet;
		 GeomFill_Frenet();

		/****************** Copy ******************/
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return true.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 7ab26cd3e7d707fc8575a1a0a3937407 ****/
		%feature("compactdefaultargs") GeomFill_Generator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Generator;
		 GeomFill_Generator();

		/****************** Perform ******************/
		/**** md5 signature: 3733dc09fb22e11eab38814671c39e85 ****/
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
		/**** md5 signature: a469e18cbceeb351572a461f96ff0f4d ****/
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
		/**** md5 signature: d7713d06b5da3938a026ac9f7be9143a ****/
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
		/**** md5 signature: 6211f5514688258100f0ea82262b2f4b ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 316ea693fc5dcb4b89eef4bd219d0f5e ****/
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
		/**** md5 signature: 924a51426e408dff0c68c8625c80f165 ****/
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
		/**** md5 signature: 288bb22d14e06a66281554b33f433d63 ****/
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
		/**** md5 signature: 940621cc935757a0b177b16f7cd72d05 ****/
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
		/**** md5 signature: 7db1622a0b370b4453af0886bb5f840c ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** GetAverageLaw ******************/
		/**** md5 signature: c8399d110fc93e54f7a94c0255e22682 ****/
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
		/**** md5 signature: ead921cddde0ab49628eb8cd84dd99a0 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		/**** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ****/
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
		/**** md5 signature: 5025922809e891f5aa8a2358198f31e4 ****/
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
		/**** md5 signature: d33bcb5496370d9914e70fb48ea83d28 ****/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** HasFirstRestriction ******************/
		/**** md5 signature: ccbee780c99b1c07b285852506752491 ****/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Say if the first restriction is defined in this class. if it is true the first element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****************** HasLastRestriction ******************/
		/**** md5 signature: 74a37dbf296a415f833e8fc9033f1e92 ****/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Say if the last restriction is defined in this class. if it is true the last element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 2edf1ff5440c6e25ebd8f0348eb8f041 ****/
		%feature("compactdefaultargs") IsIntersec;
		%feature("autodoc", "Say if the generatrice interset the surface.

Returns
-------
bool
") IsIntersec;
		Standard_Boolean IsIntersec();

		/****************** IsRotation ******************/
		/**** md5 signature: 69c76c5168e987b8419ad259813fc9af ****/
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
		/**** md5 signature: 4064d79964f3a03428b0eb9740c21e0f ****/
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
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ****/
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
		/**** md5 signature: b76821e717ce4d2049156bbde7eb7114 ****/
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
		/**** md5 signature: a0d60e2a1ea25c193dafa15194b0ab24 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: 82e5909f3450ddb28497aec115ad1d50 ****/
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
		/**** md5 signature: 52b4e29e16b9b86f3d7835907847b3d0 ****/
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
		/**** md5 signature: 603a2d12181693878dfcc406bb4cd8ac ****/
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
		/**** md5 signature: 136dfedf65ea6a2c7c98ae444031587f ****/
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
		/**** md5 signature: cbfc9f5ba26398ec5c16dc921f27bd12 ****/
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
		/**** md5 signature: 6211f5514688258100f0ea82262b2f4b ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_LocationLaw>
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 316ea693fc5dcb4b89eef4bd219d0f5e ****/
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
		/**** md5 signature: 924a51426e408dff0c68c8625c80f165 ****/
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
		/**** md5 signature: 288bb22d14e06a66281554b33f433d63 ****/
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
		/**** md5 signature: 940621cc935757a0b177b16f7cd72d05 ****/
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
		/**** md5 signature: 2a36e5d874195d280379b1872ee5893a ****/
		%feature("compactdefaultargs") EraseRotation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") EraseRotation;
		void EraseRotation();

		/****************** ErrorStatus ******************/
		/**** md5 signature: 0524df84e8d9c275d5bcd5d3fe7977dc ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		/**** md5 signature: c8399d110fc93e54f7a94c0255e22682 ****/
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
		/**** md5 signature: ead921cddde0ab49628eb8cd84dd99a0 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_HCurve> & GetCurve();

		/****************** GetDomain ******************/
		/**** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ****/
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
		/**** md5 signature: 5025922809e891f5aa8a2358198f31e4 ****/
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
		/**** md5 signature: d33bcb5496370d9914e70fb48ea83d28 ****/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Get the maximum norm of the matrix-location part. it is usful to find an good tolerance to approx m(t).

Returns
-------
float
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****************** Guide ******************/
		/**** md5 signature: 7f9eb3f08360f033106bb3e58722ebc3 ****/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** HasFirstRestriction ******************/
		/**** md5 signature: ccbee780c99b1c07b285852506752491 ****/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Say if the first restriction is defined in this class. if it is true the first element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****************** HasLastRestriction ******************/
		/**** md5 signature: 74a37dbf296a415f833e8fc9033f1e92 ****/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Say if the last restriction is defined in this class. if it is true the last element of poles array in d0,d1,d2... correspond to this restriction. returns standard_false (default implementation).

Returns
-------
bool
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 69c76c5168e987b8419ad259813fc9af ****/
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
		/**** md5 signature: 4064d79964f3a03428b0eb9740c21e0f ****/
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
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ****/
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
		/**** md5 signature: b76821e717ce4d2049156bbde7eb7114 ****/
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
		/**** md5 signature: f9bca12fa783e47192673ca3f07be5a5 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Section;
		opencascade::handle<Geom_Curve> Section();

		/****************** Set ******************/
		/**** md5 signature: 4de0dc1362ddd21a958ddc8382ea6c1d ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: fe581f3dcaec0cd160e673a6c833f73a ****/
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
		/**** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ****/
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
		/**** md5 signature: 52b4e29e16b9b86f3d7835907847b3d0 ****/
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
		/**** md5 signature: 603a2d12181693878dfcc406bb4cd8ac ****/
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
class GeomFill_NSections : public GeomFill_SectionLaw {
	public:
		/****************** GeomFill_NSections ******************/
		/**** md5 signature: 0d9de61d62ecb7757dcd4d340c2a039b ****/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "Make a sectionlaw with n curves.

Parameters
----------
NC: TColGeom_SequenceOfCurve

Returns
-------
None
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC);

		/****************** GeomFill_NSections ******************/
		/**** md5 signature: b6026d7641aed88e8faa4632aecda31b ****/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "Make a sectionlaw with n curves and n associated parameters.

Parameters
----------
NC: TColGeom_SequenceOfCurve
NP: TColStd_SequenceOfReal

Returns
-------
None
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const TColStd_SequenceOfReal & NP);

		/****************** GeomFill_NSections ******************/
		/**** md5 signature: 979fe2339b2fd239655f9ddec9dcb075 ****/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "Make a sectionlaw with n curves and n associated parameters. uf and ul are the parametric bounds of the nsections vf and vl are the parametric bounds of the path.

Parameters
----------
NC: TColGeom_SequenceOfCurve
NP: TColStd_SequenceOfReal
UF: float
UL: float
VF: float
VL: float

Returns
-------
None
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const TColStd_SequenceOfReal & NP, const Standard_Real UF, const Standard_Real UL, const Standard_Real VF, const Standard_Real VL);

		/****************** GeomFill_NSections ******************/
		/**** md5 signature: beb7f1c7e304223c771db4b9243db92d ****/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "Make a sectionlaw with n curves and n associated parameters. uf and ul are the parametric bounds of the nsections vf and vl are the parametric bounds of the path uf and ul are the parametric bounds of the nsections surf is a reference surface used by brepfill_nsections.

Parameters
----------
NC: TColGeom_SequenceOfCurve
Trsfs: GeomFill_SequenceOfTrsf
NP: TColStd_SequenceOfReal
UF: float
UL: float
VF: float
VL: float
Surf: Geom_BSplineSurface

Returns
-------
None
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const GeomFill_SequenceOfTrsf & Trsfs, const TColStd_SequenceOfReal & NP, const Standard_Real UF, const Standard_Real UL, const Standard_Real VF, const Standard_Real VL, const opencascade::handle<Geom_BSplineSurface> & Surf);

		/****************** BSplineSurface ******************/
		/**** md5 signature: 723eb488e2a06d913977b581dcccba8f ****/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. is it the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		/**** md5 signature: a691940df52b45c198f3414d0790e091 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** CirclSection ******************/
		/**** md5 signature: f8ab2465d0ffa1d0b9c5f4f02cd11e1d ****/
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

		/****************** ComputeSurface ******************/
		/**** md5 signature: 476c520f64187195041f7fc66a49e45d ****/
		%feature("compactdefaultargs") ComputeSurface;
		%feature("autodoc", "Computes the surface.

Returns
-------
None
") ComputeSurface;
		void ComputeSurface();

		/****************** ConstantSection ******************/
		/**** md5 signature: 86519bb197ca223d0ba2720b381f4036 ****/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return the constant section if <self> isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		/**** md5 signature: d889e1bd3dadd721c935f604be609d57 ****/
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
		/**** md5 signature: 127f80b4c43e681b4262dad7d1db79d7 ****/
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
		/**** md5 signature: e7553cf232323cae7964c205cd5a06a9 ****/
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
		/**** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ****/
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
		/**** md5 signature: 5025922809e891f5aa8a2358198f31e4 ****/
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
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
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
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 650c3ea527a26e948c9d1fcec0b7a9f1 ****/
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
		/**** md5 signature: b8fcd911afc2577f90f33f0c8d046c8a ****/
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
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if the law isperiodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
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
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
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
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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

		/****************** SetSurface ******************/
		/**** md5 signature: f01d27fcfb76b333f1ccc32457928336 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Sets the reference surface.

Parameters
----------
RefSurf: Geom_BSplineSurface

Returns
-------
None
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_BSplineSurface> & RefSurf);

};


%make_alias(GeomFill_NSections)

%extend GeomFill_NSections {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_SectionGenerator *
**********************************/
class GeomFill_SectionGenerator : public GeomFill_Profiler {
	public:
		/****************** GeomFill_SectionGenerator ******************/
		/**** md5 signature: dca68bc2332bb276f5d183db1f4a4460 ****/
		%feature("compactdefaultargs") GeomFill_SectionGenerator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_SectionGenerator;
		 GeomFill_SectionGenerator();

		/****************** GetShape ******************/
		/**** md5 signature: 6fa2df877c22a0270d6d56c00ebd130a ****/
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
		/**** md5 signature: 4ce44c7a3fc1e54d65161ad10947be07 ****/
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
		/**** md5 signature: 010f762aa4509ca765334728b1b5f9d3 ****/
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
		/**** md5 signature: 8b634e347a83843e998af17b94636e6a ****/
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
		/**** md5 signature: 941468dc4168033158bf84bf49fd2ff4 ****/
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
		/**** md5 signature: 29433ba5af12c8cc98ba4cf28193643f ****/
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
		/**** md5 signature: b95716ca77d413493ee4b317df6cb485 ****/
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
		/**** md5 signature: 9d3727d66f84862b81072dc871109cea ****/
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
		/**** md5 signature: 618f7ac8e8773975015964105699f46f ****/
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
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
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
		/**** md5 signature: 79ce66385cf4dd5e407488fd7c6a2ef0 ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** Reparametrize ******************/
		/**** md5 signature: bd7b671d45505164bc59f6ce8496d6d0 ****/
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
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
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
		/**** md5 signature: 41f33067fd48a3590d98e7ade538a4c7 ****/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomFill_Stretch;
		 GeomFill_Stretch();

		/****************** GeomFill_Stretch ******************/
		/**** md5 signature: bd6d1b8bdd9019d915c725313de24d3f ****/
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
		/**** md5 signature: e01a073231883a55d9edf57f955bbdb7 ****/
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
		/**** md5 signature: d3ffe113a485ff934a537831bed2560b ****/
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
		/**** md5 signature: 094f730897c039878a8e655c32e65678 ****/
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
		/**** md5 signature: f9db6752cf19f01ffe8c0de3e7fd61d6 ****/
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
		/**** md5 signature: 42d862b11603d6c162c9eabde6707d9b ****/
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
		/**** md5 signature: e2197b03e817998bb9edb386a43462ba ****/
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
		/**** md5 signature: 7ecedcaa349ee68ef1012600c127d0d1 ****/
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
		/**** md5 signature: 3f10164efb4173e700e58c5603874672 ****/
		%feature("compactdefaultargs") CurrentPointOnGuide;
		%feature("autodoc", "Returns the current point on guide found by d0, d1 or d2.

Returns
-------
gp_Pnt
") CurrentPointOnGuide;
		gp_Pnt CurrentPointOnGuide();

		/****************** Guide ******************/
		/**** md5 signature: b13fb6fbc45c3f2506db01721bc154fa ****/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** Origine ******************/
		/**** md5 signature: 16919287683a2d5ba18e225cee37cd92 ****/
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
		/**** md5 signature: 41b6e34dce2780689a7d85e0f3b351f6 ****/
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
		/**** md5 signature: 723eb488e2a06d913977b581dcccba8f ****/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Give if possible an bspline surface, like iso-v are the section. if it is not possible this methode have to get an null surface. is it the default implementation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****************** BarycentreOfSurf ******************/
		/**** md5 signature: a691940df52b45c198f3414d0790e091 ****/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Get the barycentre of surface. an very poor estimation is sufficent. this information is usefull to perform well conditioned rational approximation. warning: used only if <self> isrational.

Returns
-------
gp_Pnt
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****************** ConstantSection ******************/
		/**** md5 signature: 86519bb197ca223d0ba2720b381f4036 ****/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return the constant section if <self> isconstant.

Returns
-------
opencascade::handle<Geom_Curve>
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****************** D0 ******************/
		/**** md5 signature: d889e1bd3dadd721c935f604be609d57 ****/
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
		/**** md5 signature: 127f80b4c43e681b4262dad7d1db79d7 ****/
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
		/**** md5 signature: e7553cf232323cae7964c205cd5a06a9 ****/
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
		/**** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ****/
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
		/**** md5 signature: 5025922809e891f5aa8a2358198f31e4 ****/
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
		/**** md5 signature: 36fb20110448cba55b750bc7db93d222 ****/
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
		/**** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ****/
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
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: b8fcd911afc2577f90f33f0c8d046c8a ****/
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
		/**** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns if the sections are rationnal or not.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Returns if the sections are periodic or not.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Returns if the law isperiodic or not.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** Knots ******************/
		/**** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ****/
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
		/**** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ****/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Returns the length of the greater section. this information is usefull to g1's control. warning: with an little value, approximation can be slower.

Returns
-------
float
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****************** Mults ******************/
		/**** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ****/
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
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: 3210e6226bc168d1bbb8276d12d59fa5 ****/
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
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 7825016167368c6530be15068ef7ba41 ****/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Say if the law is defined, only by the 3d geometry of the setted curve return false by default.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 7e4cf323c0179191614321290ceee376 ****/
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
		/**** md5 signature: 5ec05cc00541a0c19784acc9db48edc6 ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
		/**** md5 signature: c01bdb6e70304336b9b42c5ed34b7639 ****/
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
		/**** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<GeomFill_TrihedronLaw>
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ****/
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
		/**** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ****/
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
		/**** md5 signature: e308ebcce924017ac2cd5d4701d10219 ****/
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
		/**** md5 signature: 0524df84e8d9c275d5bcd5d3fe7977dc ****/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Give a status to the law returns pipeok (default implementation).

Returns
-------
GeomFill_PipeError
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****************** GetAverageLaw ******************/
		/**** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ****/
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
		/**** md5 signature: 7825016167368c6530be15068ef7ba41 ****/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Guide;
		virtual opencascade::handle<Adaptor3d_HCurve> Guide();

		/****************** Intervals ******************/
		/**** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ****/
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
		/**** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Say if the law is constant.

Returns
-------
bool
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****************** IsOnlyBy3dCurve ******************/
		/**** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ****/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Say if the law is defined, only by the 3d geometry of the setted curve return false by default.

Returns
-------
bool
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****************** NbIntervals ******************/
		/**** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ****/
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
		/**** md5 signature: 7e4cf323c0179191614321290ceee376 ****/
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
		/**** md5 signature: 461c0cca1ef3154515f91bc70d65d0a5 ****/
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
		/**** md5 signature: 09d00fda8057705f50d4a0bf656696ed ****/
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
class GeomFill_SweepSectionGenerator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class GeomFill_HArray1OfLocationLaw : public GeomFill_Array1OfLocationLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomFill_Array1OfLocationLaw::value_type& theValue);
    GeomFill_HArray1OfLocationLaw(const GeomFill_Array1OfLocationLaw& theOther);
    const GeomFill_Array1OfLocationLaw& Array1();
    GeomFill_Array1OfLocationLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfLocationLaw)


class GeomFill_HArray1OfSectionLaw : public GeomFill_Array1OfSectionLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomFill_Array1OfSectionLaw::value_type& theValue);
    GeomFill_HArray1OfSectionLaw(const GeomFill_Array1OfSectionLaw& theOther);
    const GeomFill_Array1OfSectionLaw& Array1();
    GeomFill_Array1OfSectionLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfSectionLaw)

/* harray2 classes */
/* hsequence classes */
class GeomFill_HSequenceOfAx2 : public GeomFill_SequenceOfAx2, public Standard_Transient {
  public:
    GeomFill_HSequenceOfAx2();
    GeomFill_HSequenceOfAx2(const GeomFill_SequenceOfAx2& theOther);
    const GeomFill_SequenceOfAx2& Sequence();
    void Append (const GeomFill_SequenceOfAx2::value_type& theItem);
    void Append (GeomFill_SequenceOfAx2& theSequence);
    GeomFill_SequenceOfAx2& ChangeSequence();
};
%make_alias(GeomFill_HSequenceOfAx2)


