/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define GEOMPLATEDOCSTRING
"GeomPlate module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomplate.html"
%enddef
%module (package="OCC.Core", docstring=GEOMPLATEDOCSTRING) GeomPlate


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
#include<GeomPlate_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<TColGeom2d_module.hxx>
#include<Message_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomLProp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Law_module.hxx>
#include<AdvApp2Var_module.hxx>
#include<GeomAbs_module.hxx>
#include<Plate_module.hxx>
#include<PLib_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import gp.i
%import TColgp.i
%import Geom.i
%import TColStd.i
%import TColGeom2d.i
%import Message.i
%import Geom2d.i
%import GeomLProp.i
%import Adaptor2d.i
%import Law.i
%import AdvApp2Var.i
%import GeomAbs.i
%import Plate.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(GeomPlate_CurveConstraint)
%wrap_handle(GeomPlate_PointConstraint)
%wrap_handle(GeomPlate_Surface)
%wrap_handle(GeomPlate_HArray1OfHCurve)
%wrap_handle(GeomPlate_HArray1OfSequenceOfReal)
%wrap_handle(GeomPlate_HSequenceOfCurveConstraint)
%wrap_handle(GeomPlate_HSequenceOfPointConstraint)
/* end handles declaration */

/* templates */
%template(GeomPlate_Array1OfHCurve) NCollection_Array1<opencascade::handle<Adaptor3d_Curve>>;
Array1ExtendIter(opencascade::handle<Adaptor3d_Curve>)

%template(GeomPlate_Array1OfSequenceOfReal) NCollection_Array1<TColStd_SequenceOfReal>;
Array1ExtendIter(TColStd_SequenceOfReal)

%template(GeomPlate_SequenceOfAij) NCollection_Sequence<GeomPlate_Aij>;

%extend NCollection_Sequence<GeomPlate_Aij> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomPlate_SequenceOfCurveConstraint) NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>>;

%extend NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomPlate_SequenceOfPointConstraint) NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>>;

%extend NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<Adaptor3d_Curve>> GeomPlate_Array1OfHCurve;
typedef NCollection_Array1<TColStd_SequenceOfReal> GeomPlate_Array1OfSequenceOfReal;
typedef NCollection_Sequence<GeomPlate_Aij> GeomPlate_SequenceOfAij;
typedef NCollection_Sequence<opencascade::handle<GeomPlate_CurveConstraint>> GeomPlate_SequenceOfCurveConstraint;
typedef NCollection_Sequence<opencascade::handle<GeomPlate_PointConstraint>> GeomPlate_SequenceOfPointConstraint;
/* end typedefs declaration */

/**********************
* class GeomPlate_Aij *
**********************/
class GeomPlate_Aij {
	public:
		/****** GeomPlate_Aij::GeomPlate_Aij ******/
		/****** md5 signature: 37e6f94af22a1cb23f7b568753a691c8 ******/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_Aij;
		 GeomPlate_Aij();

		/****** GeomPlate_Aij::GeomPlate_Aij ******/
		/****** md5 signature: b93f89839e60989bf7d76bde428aaf99 ******/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "
Parameters
----------
anInd1: int
anInd2: int
aVec: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_Aij;
		 GeomPlate_Aij(const Standard_Integer anInd1, const Standard_Integer anInd2, const gp_Vec & aVec);

};


%extend GeomPlate_Aij {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomPlate_BuildAveragePlane *
************************************/
class GeomPlate_BuildAveragePlane {
	public:
		/****** GeomPlate_BuildAveragePlane::GeomPlate_BuildAveragePlane ******/
		/****** md5 signature: f8e410af32a166197807dc932dfffd60 ******/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "
Parameters
----------
Pts: TColgp_HArray1OfPnt
NbBoundPoints: int
Tol: float
POption: int
NOption: int

Return
-------
None

Description
-----------
Tol is a Tolerance to make the difference between the result plane and the result line. if POption = 1: automatic parametrisation if POption = 2: parametrisation by eigen vectors if NOption = 1: the average plane is the inertial plane. if NOption = 2: the average plane is the plane of max. flux.
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane(const opencascade::handle<TColgp_HArray1OfPnt> & Pts, const Standard_Integer NbBoundPoints, const Standard_Real Tol, const Standard_Integer POption, const Standard_Integer NOption);

		/****** GeomPlate_BuildAveragePlane::GeomPlate_BuildAveragePlane ******/
		/****** md5 signature: a2409cdd1c0e5a1f0f5fa82d87468468 ******/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "
Parameters
----------
Normals: TColgp_SequenceOfVec
Pts: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
Creates the plane from the 'best vector'.
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane(const TColgp_SequenceOfVec & Normals, const opencascade::handle<TColgp_HArray1OfPnt> & Pts);

		/****** GeomPlate_BuildAveragePlane::HalfSpace ******/
		/****** md5 signature: 625320c63484bc3da49fd5d48829d7e9 ******/
		%feature("compactdefaultargs") HalfSpace;
		%feature("autodoc", "
Parameters
----------
NewNormals: TColgp_SequenceOfVec
Normals: TColgp_SequenceOfVec
Bset: GeomPlate_SequenceOfAij
LinTol: float
AngTol: float

Return
-------
bool

Description
-----------
No available documentation.
") HalfSpace;
		static Standard_Boolean HalfSpace(const TColgp_SequenceOfVec & NewNormals, TColgp_SequenceOfVec & Normals, GeomPlate_SequenceOfAij & Bset, const Standard_Real LinTol, const Standard_Real AngTol);

		/****** GeomPlate_BuildAveragePlane::IsLine ******/
		/****** md5 signature: 51ad3b0e1f56ed6f328a7a7940918c54 ******/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return OK if is a line.
") IsLine;
		Standard_Boolean IsLine();

		/****** GeomPlate_BuildAveragePlane::IsPlane ******/
		/****** md5 signature: 66a5e8df3e3841a38fe0a90cbc042e0e ******/
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
return OK if is a plane.
") IsPlane;
		Standard_Boolean IsPlane();

		/****** GeomPlate_BuildAveragePlane::Line ******/
		/****** md5 signature: 0527a3e42e1f653976ba08cd7db9b8e0 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Line>

Description
-----------
Return a Line when 2 eigenvalues are null.
") Line;
		opencascade::handle<Geom_Line> Line();

		/****** GeomPlate_BuildAveragePlane::MinMaxBox ******/
		/****** md5 signature: 626e558e1ac26b23212992e4d6955923 ******/
		%feature("compactdefaultargs") MinMaxBox;
		%feature("autodoc", "
Parameters
----------

Return
-------
Umin: float
Umax: float
Vmin: float
Vmax: float

Description
-----------
computes the minimal box to include all normal projection points of the initial array on the plane.
") MinMaxBox;
		void MinMaxBox(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomPlate_BuildAveragePlane::Plane ******/
		/****** md5 signature: 5c94d426c8cb0ea718d9147a0f1d68f5 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Return the average Plane.
") Plane;
		opencascade::handle<Geom_Plane> Plane();

};


%extend GeomPlate_BuildAveragePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomPlate_BuildPlateSurface *
************************************/
class GeomPlate_BuildPlateSurface {
	public:
		/****** GeomPlate_BuildPlateSurface::GeomPlate_BuildPlateSurface ******/
		/****** md5 signature: 719055337247e2306cefda66734f315c ******/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "
Parameters
----------
NPoints: TColStd_HArray1OfInteger
TabCurve: GeomPlate_HArray1OfHCurve
Tang: TColStd_HArray1OfInteger
Degree: int
NbIter: int (optional, default to 3)
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)
Anisotropie: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor compatible with the old version with this constructor the constraint are given in a Array of Curve on Surface The array NbPoints contains the number of points for each constraint. The Array Tang contains the order of constraint for each Constraint: The possible values for this order has to be -1 , 0 , 1 , 2 . Order i means constraint Gi. NbIter is the maximum number of iteration to optimise the number of points for resolution Degree is the degree of resolution for Plate Tol2d is the tolerance used to test if two points of different constraint are identical in the parametric space of the initial surface Tol3d is used to test if two identical points in the 2d space are identical in 3d space TolAng is used to compare the angle between normal of two identical points in the 2d space Raises ConstructionError;.
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const opencascade::handle<TColStd_HArray1OfInteger> & NPoints, const opencascade::handle<GeomPlate_HArray1OfHCurve> & TabCurve, const opencascade::handle<TColStd_HArray1OfInteger> & Tang, const Standard_Integer Degree, const Standard_Integer NbIter = 3, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Boolean Anisotropie = Standard_False);

		/****** GeomPlate_BuildPlateSurface::GeomPlate_BuildPlateSurface ******/
		/****** md5 signature: 9a58cafacbf3294f7787c5ccf9dedec8 ******/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_Surface
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 10)
NbIter: int (optional, default to 3)
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)
Anisotropie: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const opencascade::handle<Geom_Surface> & Surf, const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 10, const Standard_Integer NbIter = 3, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Boolean Anisotropie = Standard_False);

		/****** GeomPlate_BuildPlateSurface::GeomPlate_BuildPlateSurface ******/
		/****** md5 signature: 9e612aac4a64099f5a264f5f15055758 ******/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "
Parameters
----------
Degree: int (optional, default to 3)
NbPtsOnCur: int (optional, default to 10)
NbIter: int (optional, default to 3)
Tol2d: float (optional, default to 0.00001)
Tol3d: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)
Anisotropie: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the BuildPlateSurface framework for deforming plate surfaces using curve and point constraints. You use the first constructor if you have an initial surface to work with at construction time. If not, you use the second. You can add one later by using the method LoadInitSurface. If no initial surface is loaded, one will automatically be computed. The curve and point constraints will be defined by using the method Add. Before the call to the algorithm, the curve constraints will be transformed into sequences of discrete points. Each curve defined as a constraint will be given the value of NbPtsOnCur as the average number of points on it. Several arguments serve to improve performance of the algorithm. NbIter, for example, expresses the number of iterations allowed and is used to control the duration of computation. To optimize resolution, Degree will have the default value of 3. The surface generated must respect several tolerance values: - 2d tolerance given by Tol2d, with a default value of 0.00001 - 3d tolerance expressed by Tol3d, with a default value of 0.0001 - angular tolerance given by TolAng, with a default value of 0.01, defining the greatest angle allowed between the constraint and the target surface. Exceptions Standard_ConstructionError if NbIter is less than 1 or Degree is less than 3.
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 10, const Standard_Integer NbIter = 3, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Boolean Anisotropie = Standard_False);

		/****** GeomPlate_BuildPlateSurface::Add ******/
		/****** md5 signature: 38731a3aa718b3fec2b48ae7946c4e8e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Cont: GeomPlate_CurveConstraint

Return
-------
None

Description
-----------
Adds the linear constraint cont.
") Add;
		void Add(const opencascade::handle<GeomPlate_CurveConstraint> & Cont);

		/****** GeomPlate_BuildPlateSurface::Add ******/
		/****** md5 signature: 1d4de1ff59aecdb4597ed3c7a2b94522 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Cont: GeomPlate_PointConstraint

Return
-------
None

Description
-----------
Adds the point constraint cont.
") Add;
		void Add(const opencascade::handle<GeomPlate_PointConstraint> & Cont);

		/****** GeomPlate_BuildPlateSurface::CurveConstraint ******/
		/****** md5 signature: d2863a2f63213cbc5ba632a319b98ba5 ******/
		%feature("compactdefaultargs") CurveConstraint;
		%feature("autodoc", "
Parameters
----------
order: int

Return
-------
opencascade::handle<GeomPlate_CurveConstraint>

Description
-----------
returns the CurveConstraints of order order.
") CurveConstraint;
		opencascade::handle<GeomPlate_CurveConstraint> CurveConstraint(const Standard_Integer order);

		/****** GeomPlate_BuildPlateSurface::Curves2d ******/
		/****** md5 signature: c016bbe6c4b5018c38c3fbc35d9a3916 ******/
		%feature("compactdefaultargs") Curves2d;
		%feature("autodoc", "Return
-------
opencascade::handle<TColGeom2d_HArray1OfCurve>

Description
-----------
Extracts the array of curves on the plate surface which correspond to the curve constraints set in Add.
") Curves2d;
		opencascade::handle<TColGeom2d_HArray1OfCurve> Curves2d();

		/****** GeomPlate_BuildPlateSurface::Disc2dContour ******/
		/****** md5 signature: 3f3a1bea1a2f795f4aac1d5028cede20 ******/
		%feature("compactdefaultargs") Disc2dContour;
		%feature("autodoc", "
Parameters
----------
nbp: int
Seq2d: TColgp_SequenceOfXY

Return
-------
None

Description
-----------
No available documentation.
") Disc2dContour;
		void Disc2dContour(const Standard_Integer nbp, TColgp_SequenceOfXY & Seq2d);

		/****** GeomPlate_BuildPlateSurface::Disc3dContour ******/
		/****** md5 signature: 67db8fdcfdf390a10d4af3f50f40e707 ******/
		%feature("compactdefaultargs") Disc3dContour;
		%feature("autodoc", "
Parameters
----------
nbp: int
iordre: int
Seq3d: TColgp_SequenceOfXYZ

Return
-------
None

Description
-----------
No available documentation.
") Disc3dContour;
		void Disc3dContour(const Standard_Integer nbp, const Standard_Integer iordre, TColgp_SequenceOfXYZ & Seq3d);

		/****** GeomPlate_BuildPlateSurface::G0Error ******/
		/****** md5 signature: ba177a9a7bac2d394577a179fd8040ef ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the max distance between the result and the constraints.
") G0Error;
		Standard_Real G0Error();

		/****** GeomPlate_BuildPlateSurface::G0Error ******/
		/****** md5 signature: f99dce5527bffb3ecaa2d1093b4a3635 ******/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the max distance between the result and the constraint Index.
") G0Error;
		Standard_Real G0Error(const Standard_Integer Index);

		/****** GeomPlate_BuildPlateSurface::G1Error ******/
		/****** md5 signature: 0a0e55267bc5572a38177b75a97dfedc ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the max angle between the result and the constraints.
") G1Error;
		Standard_Real G1Error();

		/****** GeomPlate_BuildPlateSurface::G1Error ******/
		/****** md5 signature: 0d786918d533628c34e845fd87da5a9b ******/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the max angle between the result and the constraint Index.
") G1Error;
		Standard_Real G1Error(const Standard_Integer Index);

		/****** GeomPlate_BuildPlateSurface::G2Error ******/
		/****** md5 signature: 0eac129a84e8ae945532a18ff833414e ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the max difference of curvature between the result and the constraints.
") G2Error;
		Standard_Real G2Error();

		/****** GeomPlate_BuildPlateSurface::G2Error ******/
		/****** md5 signature: 02032765271044476a9ce38570208342 ******/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
Returns the max difference of curvature between the result and the constraint Index.
") G2Error;
		Standard_Real G2Error(const Standard_Integer Index);

		/****** GeomPlate_BuildPlateSurface::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets all constraints.
") Init;
		void Init();

		/****** GeomPlate_BuildPlateSurface::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tests whether computation of the plate has been completed.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomPlate_BuildPlateSurface::LoadInitSurface ******/
		/****** md5 signature: 242b03f070695dbfa5f639e0217f32a7 ******/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "
Parameters
----------
Surf: Geom_Surface

Return
-------
None

Description
-----------
Loads the initial Surface.
") LoadInitSurface;
		void LoadInitSurface(const opencascade::handle<Geom_Surface> & Surf);

		/****** GeomPlate_BuildPlateSurface::Order ******/
		/****** md5 signature: 46ad82cbf039a28ad2e8b3e47277f1fc ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Returns the order of the curves in the array returned by Curves2d. Computation changes this order. Consequently, this method returns the order of the curves prior to computation.
") Order;
		opencascade::handle<TColStd_HArray1OfInteger> Order();

		/****** GeomPlate_BuildPlateSurface::Perform ******/
		/****** md5 signature: d7fed22833997c4a8f7923f6a29bd664 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Calls the algorithm and computes the plate surface using the loaded constraints. If no initial surface is given, the algorithm automatically computes one. Exceptions Standard_RangeError if the value of the constraint is null or if plate is not done.
") Perform;
		void Perform(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** GeomPlate_BuildPlateSurface::PointConstraint ******/
		/****** md5 signature: fb64f566843365d8012cf3a6bac770bd ******/
		%feature("compactdefaultargs") PointConstraint;
		%feature("autodoc", "
Parameters
----------
order: int

Return
-------
opencascade::handle<GeomPlate_PointConstraint>

Description
-----------
returns the PointConstraint of order order.
") PointConstraint;
		opencascade::handle<GeomPlate_PointConstraint> PointConstraint(const Standard_Integer order);

		/****** GeomPlate_BuildPlateSurface::Sense ******/
		/****** md5 signature: 8cfff544568a5ecc0c039bc023102a19 ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
Allows you to ensure that the array of curves returned by Curves2d has the correct orientation. Returns the orientation of the curves in the array returned by Curves2d. Computation changes the orientation of these curves. Consequently, this method returns the orientation prior to computation.
") Sense;
		opencascade::handle<TColStd_HArray1OfInteger> Sense();

		/****** GeomPlate_BuildPlateSurface::SetNbBounds ******/
		/****** md5 signature: 60c94d877ed49bf3ec90cdf5c37ce55b ******/
		%feature("compactdefaultargs") SetNbBounds;
		%feature("autodoc", "
Parameters
----------
NbBounds: int

Return
-------
None

Description
-----------
No available documentation.
") SetNbBounds;
		void SetNbBounds(const Standard_Integer NbBounds);

		/****** GeomPlate_BuildPlateSurface::SurfInit ******/
		/****** md5 signature: f5f7681588f97bd50595e36576801deb ******/
		%feature("compactdefaultargs") SurfInit;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the initial surface.
") SurfInit;
		opencascade::handle<Geom_Surface> SurfInit();

		/****** GeomPlate_BuildPlateSurface::Surface ******/
		/****** md5 signature: 9a0e3bb81696069d481684cfe7c90d56 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomPlate_Surface>

Description
-----------
Returns the result of the computation. This surface can then be used by GeomPlate_MakeApprox for converting the resulting surface into a BSpline.
") Surface;
		opencascade::handle<GeomPlate_Surface> Surface();

};


%extend GeomPlate_BuildPlateSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomPlate_CurveConstraint *
**********************************/
class GeomPlate_CurveConstraint : public Standard_Transient {
	public:
		/****** GeomPlate_CurveConstraint::GeomPlate_CurveConstraint ******/
		/****** md5 signature: 3ad0c2328e9f3ac99262c01554acfcf7 ******/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an empty curve constraint object.
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint();

		/****** GeomPlate_CurveConstraint::GeomPlate_CurveConstraint ******/
		/****** md5 signature: 401c58e34f2f2beea3aadc062461bd35 ******/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "
Parameters
----------
Boundary: Adaptor3d_Curve
Order: int
NPt: int (optional, default to 10)
TolDist: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion. Raises ConstructionError if Order is not -1 , 0, 1, 2.
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint(const opencascade::handle<Adaptor3d_Curve> & Boundary, const Standard_Integer Order, const Standard_Integer NPt = 10, const Standard_Real TolDist = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****** GeomPlate_CurveConstraint::Curve2dOnSurf ******/
		/****** md5 signature: 8c609bb48844258264c3cf92c31ed7f4 ******/
		%feature("compactdefaultargs") Curve2dOnSurf;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Returns a 2d curve associated the surface resulting of the constraints.
") Curve2dOnSurf;
		opencascade::handle<Geom2d_Curve> Curve2dOnSurf();

		/****** GeomPlate_CurveConstraint::Curve3d ******/
		/****** md5 signature: 2fa5bec7732a5b0addd39b44bb53f0e5 ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Curve3d;
		opencascade::handle<Adaptor3d_Curve> Curve3d();

		/****** GeomPlate_CurveConstraint::D0 ******/
		/****** md5 signature: c5111ce8ff4abb74b6c4ba34040c62bb ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** GeomPlate_CurveConstraint::D1 ******/
		/****** md5 signature: 858f158dffbf609a8dc7a05ce5ad141f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomPlate_CurveConstraint::D2 ******/
		/****** md5 signature: 14adcb7732620f6a120ea7c371b6898e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec
V4: gp_Vec
V5: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3, gp_Vec & V4, gp_Vec & V5);

		/****** GeomPlate_CurveConstraint::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** GeomPlate_CurveConstraint::G0Criterion ******/
		/****** md5 signature: e9350f81ed4bb4c49730741e1a89659b ******/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the G0 criterion at the parametric point U on the curve. This is the greatest distance allowed between the constraint and the target surface at U.
") G0Criterion;
		Standard_Real G0Criterion(const Standard_Real U);

		/****** GeomPlate_CurveConstraint::G1Criterion ******/
		/****** md5 signature: adef69eebb64d91e9f543aae1cba8a30 ******/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the G1 criterion at the parametric point U on the curve. This is the greatest angle allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface.
") G1Criterion;
		Standard_Real G1Criterion(const Standard_Real U);

		/****** GeomPlate_CurveConstraint::G2Criterion ******/
		/****** md5 signature: b80df34f4a0ea24cd73e42bfb6988018 ******/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Returns the G2 criterion at the parametric point U on the curve. This is the greatest difference in curvature allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface.
") G2Criterion;
		Standard_Real G2Criterion(const Standard_Real U);

		/****** GeomPlate_CurveConstraint::LPropSurf ******/
		/****** md5 signature: 44f6b352a682f6000b7541e56935b13e ******/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
GeomLProp_SLProps

Description
-----------
No available documentation.
") LPropSurf;
		GeomLProp_SLProps & LPropSurf(const Standard_Real U);

		/****** GeomPlate_CurveConstraint::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** GeomPlate_CurveConstraint::Length ******/
		/****** md5 signature: 7a11021be5ff74a321b964da373ca8bd ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Length;
		Standard_Real Length();

		/****** GeomPlate_CurveConstraint::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points on the curve used as a constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GeomPlate_CurveConstraint::Order ******/
		/****** md5 signature: 29e3c952f10c463fdb1b5e1c18c1d597 ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the order of constraint, one of G0, G1 or G2.
") Order;
		Standard_Integer Order();

		/****** GeomPlate_CurveConstraint::ProjectedCurve ******/
		/****** md5 signature: 29a2a58b4c1684492940e001f45b28a1 ******/
		%feature("compactdefaultargs") ProjectedCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the projected curve resulting from the normal projection of the curve on the initial surface.
") ProjectedCurve;
		opencascade::handle<Adaptor2d_Curve2d> ProjectedCurve();

		/****** GeomPlate_CurveConstraint::SetCurve2dOnSurf ******/
		/****** md5 signature: e48c08a1c66719832c40503ef697b26b ******/
		%feature("compactdefaultargs") SetCurve2dOnSurf;
		%feature("autodoc", "
Parameters
----------
Curve2d: Geom2d_Curve

Return
-------
None

Description
-----------
loads a 2d curve associated the surface resulting of the constraints.
") SetCurve2dOnSurf;
		void SetCurve2dOnSurf(const opencascade::handle<Geom2d_Curve> & Curve2d);

		/****** GeomPlate_CurveConstraint::SetG0Criterion ******/
		/****** md5 signature: 0e8e4ff031d080d6ac20814bbd223cd8 ******/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "
Parameters
----------
G0Crit: Law_Function

Return
-------
None

Description
-----------
Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface for each point of the constraint. If this criterion is not set, TolDist, the distance tolerance from the constructor, is used.
") SetG0Criterion;
		void SetG0Criterion(const opencascade::handle<Law_Function> & G0Crit);

		/****** GeomPlate_CurveConstraint::SetG1Criterion ******/
		/****** md5 signature: 310e7fd3dd1b246d73364de3e1b1446f ******/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "
Parameters
----------
G1Crit: Law_Function

Return
-------
None

Description
-----------
Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the curve is not on a surface.
") SetG1Criterion;
		void SetG1Criterion(const opencascade::handle<Law_Function> & G1Crit);

		/****** GeomPlate_CurveConstraint::SetG2Criterion ******/
		/****** md5 signature: 6180bde7cf9778e66114e191d1f8289e ******/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "
Parameters
----------
G2Crit: Law_Function

Return
-------
None

Description
-----------
No available documentation.
") SetG2Criterion;
		void SetG2Criterion(const opencascade::handle<Law_Function> & G2Crit);

		/****** GeomPlate_CurveConstraint::SetNbPoints ******/
		/****** md5 signature: 24cd83460573b8a5c77f14a746b45525 ******/
		%feature("compactdefaultargs") SetNbPoints;
		%feature("autodoc", "
Parameters
----------
NewNb: int

Return
-------
None

Description
-----------
Allows you to set the number of points on the curve constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.
") SetNbPoints;
		void SetNbPoints(const Standard_Integer NewNb);

		/****** GeomPlate_CurveConstraint::SetOrder ******/
		/****** md5 signature: e5c9a6282123051921f40d29e1dfc28a ******/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "
Parameters
----------
Order: int

Return
-------
None

Description
-----------
Allows you to set the order of continuity required for the constraints: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.
") SetOrder;
		void SetOrder(const Standard_Integer Order);

		/****** GeomPlate_CurveConstraint::SetProjectedCurve ******/
		/****** md5 signature: 61ce53d83dd31188e0a868cc575a4394 ******/
		%feature("compactdefaultargs") SetProjectedCurve;
		%feature("autodoc", "
Parameters
----------
Curve2d: Adaptor2d_Curve2d
TolU: float
TolV: float

Return
-------
None

Description
-----------
loads a 2d curve resulting from the normal projection of the curve on the initial surface.
") SetProjectedCurve;
		void SetProjectedCurve(const opencascade::handle<Adaptor2d_Curve2d> & Curve2d, const Standard_Real TolU, const Standard_Real TolV);

};


%make_alias(GeomPlate_CurveConstraint)

%extend GeomPlate_CurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomPlate_MakeApprox *
*****************************/
class GeomPlate_MakeApprox {
	public:
		/****** GeomPlate_MakeApprox::GeomPlate_MakeApprox ******/
		/****** md5 signature: c3559ac86fd20d649f9937675e3ec408 ******/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "
Parameters
----------
SurfPlate: GeomPlate_Surface
PlateCrit: AdvApp2Var_Criterion
Tol3d: float
Nbmax: int
dgmax: int
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
EnlargeCoeff: float (optional, default to 1.1)

Return
-------
None

Description
-----------
Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible the criterion CritPlate is satisfied if possible.
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox(const opencascade::handle<GeomPlate_Surface> & SurfPlate, const AdvApp2Var_Criterion & PlateCrit, const Standard_Real Tol3d, const Standard_Integer Nbmax, const Standard_Integer dgmax, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Real EnlargeCoeff = 1.1);

		/****** GeomPlate_MakeApprox::GeomPlate_MakeApprox ******/
		/****** md5 signature: 11dd85cc6ab536dfe14b6591af159b11 ******/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "
Parameters
----------
SurfPlate: GeomPlate_Surface
Tol3d: float
Nbmax: int
dgmax: int
dmax: float
CritOrder: int (optional, default to 0)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C1)
EnlargeCoeff: float (optional, default to 1.1)

Return
-------
None

Description
-----------
Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible if CritOrder = -1 , no criterion is used if CritOrder = 0 , a PlateG0Criterion is used with max value > 10*dmax if CritOrder = 1 , a PlateG1Criterion is used with max value > 10*dmax WARNING: for CritOrder = 0 or 1, only the constraints points of SurfPlate are used to evaluate the value of the criterion.
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox(const opencascade::handle<GeomPlate_Surface> & SurfPlate, const Standard_Real Tol3d, const Standard_Integer Nbmax, const Standard_Integer dgmax, const Standard_Real dmax, const Standard_Integer CritOrder = 0, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Real EnlargeCoeff = 1.1);

		/****** GeomPlate_MakeApprox::ApproxError ******/
		/****** md5 signature: 2a3fbb0e410b6d24d6719a8a79285a23 ******/
		%feature("compactdefaultargs") ApproxError;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the error in computation of the approximation surface. This is the distance between the entire target BSpline surface and the entire original surface generated by BuildPlateSurface and converted by GeomPlate_Surface.
") ApproxError;
		Standard_Real ApproxError();

		/****** GeomPlate_MakeApprox::CriterionError ******/
		/****** md5 signature: fe3d9195cbf00531a797a7c49841063a ******/
		%feature("compactdefaultargs") CriterionError;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the criterion error in computation of the approximation surface. This is estimated relative to the curve and point constraints only.
") CriterionError;
		Standard_Real CriterionError();

		/****** GeomPlate_MakeApprox::Surface ******/
		/****** md5 signature: 2f50ef783efd4092d3a11c39580e031f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the BSpline surface extracted from the GeomPlate_MakeApprox object.
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface();

};


%extend GeomPlate_MakeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomPlate_PlateG0Criterion *
***********************************/
class GeomPlate_PlateG0Criterion : public AdvApp2Var_Criterion {
	public:
		/****** GeomPlate_PlateG0Criterion::GeomPlate_PlateG0Criterion ******/
		/****** md5 signature: dbf6618e7b45035ca70a87e835a2ec01 ******/
		%feature("compactdefaultargs") GeomPlate_PlateG0Criterion;
		%feature("autodoc", "
Parameters
----------
Data: TColgp_SequenceOfXY
G0Data: TColgp_SequenceOfXYZ
Maximum: float
Type: AdvApp2Var_CriterionType (optional, default to AdvApp2Var_Absolute)
Repart: AdvApp2Var_CriterionRepartition (optional, default to AdvApp2Var_Regular)

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_PlateG0Criterion;
		 GeomPlate_PlateG0Criterion(const TColgp_SequenceOfXY & Data, const TColgp_SequenceOfXYZ & G0Data, const Standard_Real Maximum, const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute, const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****** GeomPlate_PlateG0Criterion::IsSatisfied ******/
		/****** md5 signature: 36b58bb72cd51963a174f29bac551403 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch

Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied(const AdvApp2Var_Patch & P);

		/****** GeomPlate_PlateG0Criterion::Value ******/
		/****** md5 signature: 72ff1ddaefca7f5b0f2dce81eaa13cc5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Return
-------
None

Description
-----------
No available documentation.
") Value;
		virtual void Value(AdvApp2Var_Patch & P, const AdvApp2Var_Context & C);

};


%extend GeomPlate_PlateG0Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomPlate_PlateG1Criterion *
***********************************/
class GeomPlate_PlateG1Criterion : public AdvApp2Var_Criterion {
	public:
		/****** GeomPlate_PlateG1Criterion::GeomPlate_PlateG1Criterion ******/
		/****** md5 signature: aea3921133d20989a35e4ac7258b027f ******/
		%feature("compactdefaultargs") GeomPlate_PlateG1Criterion;
		%feature("autodoc", "
Parameters
----------
Data: TColgp_SequenceOfXY
G1Data: TColgp_SequenceOfXYZ
Maximum: float
Type: AdvApp2Var_CriterionType (optional, default to AdvApp2Var_Absolute)
Repart: AdvApp2Var_CriterionRepartition (optional, default to AdvApp2Var_Regular)

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_PlateG1Criterion;
		 GeomPlate_PlateG1Criterion(const TColgp_SequenceOfXY & Data, const TColgp_SequenceOfXYZ & G1Data, const Standard_Real Maximum, const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute, const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****** GeomPlate_PlateG1Criterion::IsSatisfied ******/
		/****** md5 signature: 36b58bb72cd51963a174f29bac551403 ******/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch

Return
-------
bool

Description
-----------
No available documentation.
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied(const AdvApp2Var_Patch & P);

		/****** GeomPlate_PlateG1Criterion::Value ******/
		/****** md5 signature: 72ff1ddaefca7f5b0f2dce81eaa13cc5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Return
-------
None

Description
-----------
No available documentation.
") Value;
		virtual void Value(AdvApp2Var_Patch & P, const AdvApp2Var_Context & C);

};


%extend GeomPlate_PlateG1Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomPlate_PointConstraint *
**********************************/
class GeomPlate_PointConstraint : public Standard_Transient {
	public:
		/****** GeomPlate_PointConstraint::GeomPlate_PointConstraint ******/
		/****** md5 signature: 0d9afe5ab86321593798b6c8a19a80c9 ******/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Order: int
TolDist: float (optional, default to 0.0001)

Return
-------
None

Description
-----------
Constructs a point constraint object defined by Pt, a 3D point Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor, only TolDist is given. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if Order is not 0 or -1.
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint(const gp_Pnt & Pt, const Standard_Integer Order, const Standard_Real TolDist = 0.0001);

		/****** GeomPlate_PointConstraint::GeomPlate_PointConstraint ******/
		/****** md5 signature: ac001d7ea93d59930168cec3d03c7c5c ******/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Surf: Geom_Surface
Order: int
TolDist: float (optional, default to 0.0001)
TolAng: float (optional, default to 0.01)
TolCurv: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Constructs a point constraint object defined by the intersection point of U and V on the surface Surf. Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor the surface to be generated must respect several tolerance values only: - the distance tolerance TolDist - the angular tolerance TolAng - the curvature tolerance, TolCurv. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface.Creates a punctual constraint.
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint(const Standard_Real U, const Standard_Real V, const opencascade::handle<Geom_Surface> & Surf, const Standard_Integer Order, const Standard_Real TolDist = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****** GeomPlate_PointConstraint::D0 ******/
		/****** md5 signature: 08199c5cd3a9368c201379f7960011d9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(gp_Pnt & P);

		/****** GeomPlate_PointConstraint::D1 ******/
		/****** md5 signature: 7efc119e5b1eac12afa3ec547ad82318 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomPlate_PointConstraint::D2 ******/
		/****** md5 signature: 940ebc96acf7815a2cb59cbcd936498e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec
V4: gp_Vec
V5: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3, gp_Vec & V4, gp_Vec & V5);

		/****** GeomPlate_PointConstraint::G0Criterion ******/
		/****** md5 signature: 8656f472e7fdba4f071fbe4aaa7cf62a ******/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the G0 criterion. This is the greatest distance allowed between the constraint and the target surface.
") G0Criterion;
		Standard_Real G0Criterion();

		/****** GeomPlate_PointConstraint::G1Criterion ******/
		/****** md5 signature: b9005724b99845fd3537d391fffd2e1d ******/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the G1 criterion. This is the greatest angle allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface.
") G1Criterion;
		Standard_Real G1Criterion();

		/****** GeomPlate_PointConstraint::G2Criterion ******/
		/****** md5 signature: 32df7c10d58b9000703fb0609ec508fb ******/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the G2 criterion. This is the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface.
") G2Criterion;
		Standard_Real G2Criterion();

		/****** GeomPlate_PointConstraint::HasPnt2dOnSurf ******/
		/****** md5 signature: fbd2d51e12a2d88bfa609432cb2e669e ******/
		%feature("compactdefaultargs") HasPnt2dOnSurf;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPnt2dOnSurf;
		Standard_Boolean HasPnt2dOnSurf();

		/****** GeomPlate_PointConstraint::LPropSurf ******/
		/****** md5 signature: ad4b23341cdf9a128c1f8dc8f59255c5 ******/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "Return
-------
GeomLProp_SLProps

Description
-----------
No available documentation.
") LPropSurf;
		GeomLProp_SLProps & LPropSurf();

		/****** GeomPlate_PointConstraint::Order ******/
		/****** md5 signature: 29e3c952f10c463fdb1b5e1c18c1d597 ******/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the order of constraint: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.
") Order;
		Standard_Integer Order();

		/****** GeomPlate_PointConstraint::Pnt2dOnSurf ******/
		/****** md5 signature: 09c83c1db3d333932aca0c51bbfdeb83 ******/
		%feature("compactdefaultargs") Pnt2dOnSurf;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Pnt2dOnSurf;
		gp_Pnt2d Pnt2dOnSurf();

		/****** GeomPlate_PointConstraint::SetG0Criterion ******/
		/****** md5 signature: b33d4653f6e437f1f3c360b2464460fe ******/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "
Parameters
----------
TolDist: float

Return
-------
None

Description
-----------
Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface. If this criterion is not set, {TolDist, the distance tolerance from the constructor, is used.
") SetG0Criterion;
		void SetG0Criterion(const Standard_Real TolDist);

		/****** GeomPlate_PointConstraint::SetG1Criterion ******/
		/****** md5 signature: 38e46bce80668508c53652088fe310c0 ******/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "
Parameters
----------
TolAng: float

Return
-------
None

Description
-----------
Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface.
") SetG1Criterion;
		void SetG1Criterion(const Standard_Real TolAng);

		/****** GeomPlate_PointConstraint::SetG2Criterion ******/
		/****** md5 signature: cd8438932c050d7dc27a81304a0b1e4a ******/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "
Parameters
----------
TolCurv: float

Return
-------
None

Description
-----------
Allows you to set the G2 criterion. This is the law defining the greatest difference in curvature allowed between the constraint and the target surface. If this criterion is not set, TolCurv, the curvature tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface.
") SetG2Criterion;
		void SetG2Criterion(const Standard_Real TolCurv);

		/****** GeomPlate_PointConstraint::SetOrder ******/
		/****** md5 signature: e5c9a6282123051921f40d29e1dfc28a ******/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "
Parameters
----------
Order: int

Return
-------
None

Description
-----------
No available documentation.
") SetOrder;
		void SetOrder(const Standard_Integer Order);

		/****** GeomPlate_PointConstraint::SetPnt2dOnSurf ******/
		/****** md5 signature: 51fcd360e040f75e6558e21bd6fd66dd ******/
		%feature("compactdefaultargs") SetPnt2dOnSurf;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") SetPnt2dOnSurf;
		void SetPnt2dOnSurf(const gp_Pnt2d & Pnt);

};


%make_alias(GeomPlate_PointConstraint)

%extend GeomPlate_PointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomPlate_Surface *
**************************/
class GeomPlate_Surface : public Geom_Surface {
	public:
		/****** GeomPlate_Surface::GeomPlate_Surface ******/
		/****** md5 signature: fcdf26b5ac10741eceb18e95b5b358c3 ******/
		%feature("compactdefaultargs") GeomPlate_Surface;
		%feature("autodoc", "
Parameters
----------
Surfinit: Geom_Surface
Surfinter: Plate_Plate

Return
-------
None

Description
-----------
No available documentation.
") GeomPlate_Surface;
		 GeomPlate_Surface(const opencascade::handle<Geom_Surface> & Surfinit, const Plate_Plate & Surfinter);

		/****** GeomPlate_Surface::Bounds ******/
		/****** md5 signature: bbc36976e796eedf3c69513e986f2adb ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomPlate_Surface::CallSurfinit ******/
		/****** md5 signature: bffc80d2b69351c87065c51824198abd ******/
		%feature("compactdefaultargs") CallSurfinit;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") CallSurfinit;
		opencascade::handle<Geom_Surface> CallSurfinit();

		/****** GeomPlate_Surface::Constraints ******/
		/****** md5 signature: 88a670186229c9cf80f58b8c1c1e6764 ******/
		%feature("compactdefaultargs") Constraints;
		%feature("autodoc", "
Parameters
----------
Seq: TColgp_SequenceOfXY

Return
-------
None

Description
-----------
No available documentation.
") Constraints;
		void Constraints(TColgp_SequenceOfXY & Seq);

		/****** GeomPlate_Surface::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
Global Continuity of the surface in direction U and V: C0: only geometric continuity, C1: continuity of the first derivative all along the surface, C2: continuity of the second derivative all along the surface, C3: continuity of the third derivative all along the surface, G1: tangency continuity all along the surface, G2: curvature continuity all along the surface, CN: the order of continuity is infinite. Example: If the surface is C1 in the V parametric direction and C2 in the U parametric direction Shape = C1.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomPlate_Surface::Copy ******/
		/****** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****** GeomPlate_Surface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U,V on the surface. //! Raised only for an 'OffsetSurface' if it is not possible to compute the current point.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** GeomPlate_Surface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point P and the first derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C1.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** GeomPlate_Surface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Return
-------
None

Description
-----------
Computes the point P, the first and the second derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** GeomPlate_Surface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Return
-------
None

Description
-----------
Computes the point P, the first,the second and the third derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** GeomPlate_Surface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
---Purpose ; Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Raised if the continuity of the surface is not CNu in the U direction or not CNv in the V direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** GeomPlate_Surface::IsCNu ******/
		/****** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ******/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the surface in the U parametric direction. Raised if N < 0.
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****** GeomPlate_Surface::IsCNv ******/
		/****** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ******/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns the order of continuity of the surface in the V parametric direction. Raised if N < 0.
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****** GeomPlate_Surface::IsUClosed ******/
		/****** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the surface closed in the parametric direction U ? Returns True if for each parameter V the distance between the point P (UFirst, V) and P (ULast, V) is lower or equal to Resolution from gp. UFirst and ULast are the parametric bounds in the U direction.
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****** GeomPlate_Surface::IsUPeriodic ******/
		/****** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied: for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****** GeomPlate_Surface::IsVClosed ******/
		/****** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the surface closed in the parametric direction V ? Returns True if for each parameter U the distance between the point P (U, VFirst) and P (U, VLast) is lower or equal to Resolution from gp. VFirst and VLast are the parametric bounds in the V direction.
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****** GeomPlate_Surface::IsVPeriodic ******/
		/****** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied: for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****** GeomPlate_Surface::ParametricTransformation ******/
		/****** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ******/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
gp_GTrsf2d

Description
-----------
Returns a 2d transformation used to find the new parameters of a point on the transformed surface. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are obtained by transforming U,V with the 2d transformation returned by @code me->ParametricTransformation(T) @endcode This method returns an identity transformation //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****** GeomPlate_Surface::RealBounds ******/
		/****** md5 signature: c6bfe002a66421759247a297ee799115 ******/
		%feature("compactdefaultargs") RealBounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: float
U2: float
V1: float
V2: float

Description
-----------
No available documentation.
") RealBounds;
		void RealBounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomPlate_Surface::SetBounds ******/
		/****** md5 signature: f9b00539a5ee696f2b7b8724fb01c337 ******/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "
Parameters
----------
Umin: float
Umax: float
Vmin: float
Vmax: float

Return
-------
None

Description
-----------
No available documentation.
") SetBounds;
		void SetBounds(const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****** GeomPlate_Surface::Transform ******/
		/****** md5 signature: b643be97d129c62226d788cd0501ced0 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
None

Description
-----------
Transformation of a geometric object. This transformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class Transformation of the package Geom).
") Transform;
		void Transform(const gp_Trsf & T);

		/****** GeomPlate_Surface::TransformParameters ******/
		/****** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ******/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
U: float
V: float

Description
-----------
Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. @code me->Transformed(T)->Value(U',V') @endcode is the same point as @code me->Value(U,V).Transformed(T) @endcode Where U',V' are the new values of U,V after calling @code me->TransformParameters(U,V,T) @endcode This methods does not change <U> and <V> //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****** GeomPlate_Surface::UIso ******/
		/****** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ******/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the U isoparametric curve.
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****** GeomPlate_Surface::UPeriod ******/
		/****** md5 signature: 99929007fac43736aa36012893e9b882 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the Uperiod. raises if the surface is not uperiodic.
") UPeriod;
		virtual Standard_Real UPeriod();

		/****** GeomPlate_Surface::UReverse ******/
		/****** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ******/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the U direction of parametrization of <self>. The bounds of the surface are not modified.
") UReverse;
		void UReverse();

		/****** GeomPlate_Surface::UReversedParameter ******/
		/****** md5 signature: 0071925b176316f0aaaf26f369ac410c ******/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Return the parameter on the Ureversed surface for the point of parameter U on <self>. @code me->UReversed()->Value(me->UReversedParameter(U),V) @endcode is the same point as @code me->Value(U,V) @endcode.
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****** GeomPlate_Surface::VIso ******/
		/****** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ******/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Computes the V isoparametric curve.
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****** GeomPlate_Surface::VPeriod ******/
		/****** md5 signature: 0b2fb065ece518694127e1e1eadebb25 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the Vperiod. raises if the surface is not vperiodic.
") VPeriod;
		virtual Standard_Real VPeriod();

		/****** GeomPlate_Surface::VReverse ******/
		/****** md5 signature: ca22d262a13cf236e9be77a884d19536 ******/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the V direction of parametrization of <self>. The bounds of the surface are not modified.
") VReverse;
		void VReverse();

		/****** GeomPlate_Surface::VReversedParameter ******/
		/****** md5 signature: 92057d43e0e5ee078908582a4176343b ******/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "
Parameters
----------
V: float

Return
-------
float

Description
-----------
Return the parameter on the Vreversed surface for the point of parameter V on <self>. @code me->VReversed()->Value(U,me->VReversedParameter(V)) @endcode is the same point as @code me->Value(U,V) @endcode.
") VReversedParameter;
		Standard_Real VReversedParameter(const Standard_Real V);

};


%make_alias(GeomPlate_Surface)

%extend GeomPlate_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class GeomPlate_HArray1OfHCurve : public GeomPlate_Array1OfHCurve, public Standard_Transient {
  public:
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomPlate_Array1OfHCurve::value_type& theValue);
    GeomPlate_HArray1OfHCurve(const GeomPlate_Array1OfHCurve& theOther);
    const GeomPlate_Array1OfHCurve& Array1();
    GeomPlate_Array1OfHCurve& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfHCurve)


class GeomPlate_HArray1OfSequenceOfReal : public GeomPlate_Array1OfSequenceOfReal, public Standard_Transient {
  public:
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomPlate_Array1OfSequenceOfReal::value_type& theValue);
    GeomPlate_HArray1OfSequenceOfReal(const GeomPlate_Array1OfSequenceOfReal& theOther);
    const GeomPlate_Array1OfSequenceOfReal& Array1();
    GeomPlate_Array1OfSequenceOfReal& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfSequenceOfReal)

/* harray2 classes */
/* hsequence classes */
class GeomPlate_HSequenceOfCurveConstraint : public GeomPlate_SequenceOfCurveConstraint, public Standard_Transient {
  public:
    GeomPlate_HSequenceOfCurveConstraint();
    GeomPlate_HSequenceOfCurveConstraint(const GeomPlate_SequenceOfCurveConstraint& theOther);
    const GeomPlate_SequenceOfCurveConstraint& Sequence();
    void Append (const GeomPlate_SequenceOfCurveConstraint::value_type& theItem);
    void Append (GeomPlate_SequenceOfCurveConstraint& theSequence);
    GeomPlate_SequenceOfCurveConstraint& ChangeSequence();
};
%make_alias(GeomPlate_HSequenceOfCurveConstraint)


class GeomPlate_HSequenceOfPointConstraint : public GeomPlate_SequenceOfPointConstraint, public Standard_Transient {
  public:
    GeomPlate_HSequenceOfPointConstraint();
    GeomPlate_HSequenceOfPointConstraint(const GeomPlate_SequenceOfPointConstraint& theOther);
    const GeomPlate_SequenceOfPointConstraint& Sequence();
    void Append (const GeomPlate_SequenceOfPointConstraint::value_type& theItem);
    void Append (GeomPlate_SequenceOfPointConstraint& theSequence);
    GeomPlate_SequenceOfPointConstraint& ChangeSequence();
};
%make_alias(GeomPlate_HSequenceOfPointConstraint)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def GeomPlate_BuildAveragePlane_HalfSpace(*args):
	return GeomPlate_BuildAveragePlane.HalfSpace(*args)

}
