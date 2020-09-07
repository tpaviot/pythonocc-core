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
%define GEOMPLATEDOCSTRING
"GeomPlate module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomplate.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(GeomPlate_CurveConstraint)
%wrap_handle(GeomPlate_PointConstraint)
%wrap_handle(GeomPlate_Surface)
%wrap_handle(GeomPlate_HArray1OfSequenceOfReal)
%wrap_handle(GeomPlate_HArray1OfHCurve)
%wrap_handle(GeomPlate_HSequenceOfPointConstraint)
%wrap_handle(GeomPlate_HSequenceOfCurveConstraint)
/* end handles declaration */

/* templates */
%template(GeomPlate_Array1OfHCurve) NCollection_Array1<opencascade::handle<Adaptor3d_HCurve>>;

%extend NCollection_Array1<opencascade::handle<Adaptor3d_HCurve>> {
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
%template(GeomPlate_Array1OfSequenceOfReal) NCollection_Array1<TColStd_SequenceOfReal>;

%extend NCollection_Array1<TColStd_SequenceOfReal> {
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
typedef NCollection_Array1<opencascade::handle<Adaptor3d_HCurve>> GeomPlate_Array1OfHCurve;
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
		/****************** GeomPlate_Aij ******************/
		/**** md5 signature: 37e6f94af22a1cb23f7b568753a691c8 ****/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") GeomPlate_Aij;
		 GeomPlate_Aij();

		/****************** GeomPlate_Aij ******************/
		/**** md5 signature: b93f89839e60989bf7d76bde428aaf99 ****/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "No available documentation.

Parameters
----------
anInd1: int
anInd2: int
aVec: gp_Vec

Returns
-------
None
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
		/****************** GeomPlate_BuildAveragePlane ******************/
		/**** md5 signature: f8e410af32a166197807dc932dfffd60 ****/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "Tol is a tolerance to make the difference between the result plane and the result line. if poption = 1 : automatical parametrisation if poption = 2 : parametrisation by eigen vectors if noption = 1 : the average plane is the inertial plane. if noption = 2 : the average plane is the plane of max. flux.

Parameters
----------
Pts: TColgp_HArray1OfPnt
NbBoundPoints: int
Tol: float
POption: int
NOption: int

Returns
-------
None
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane(const opencascade::handle<TColgp_HArray1OfPnt> & Pts, const Standard_Integer NbBoundPoints, const Standard_Real Tol, const Standard_Integer POption, const Standard_Integer NOption);

		/****************** GeomPlate_BuildAveragePlane ******************/
		/**** md5 signature: a2409cdd1c0e5a1f0f5fa82d87468468 ****/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "Creates the plane from the 'best vector'.

Parameters
----------
Normals: TColgp_SequenceOfVec
Pts: TColgp_HArray1OfPnt

Returns
-------
None
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane(const TColgp_SequenceOfVec & Normals, const opencascade::handle<TColgp_HArray1OfPnt> & Pts);

		/****************** HalfSpace ******************/
		/**** md5 signature: 625320c63484bc3da49fd5d48829d7e9 ****/
		%feature("compactdefaultargs") HalfSpace;
		%feature("autodoc", "No available documentation.

Parameters
----------
NewNormals: TColgp_SequenceOfVec
Normals: TColgp_SequenceOfVec
Bset: GeomPlate_SequenceOfAij
LinTol: float
AngTol: float

Returns
-------
bool
") HalfSpace;
		static Standard_Boolean HalfSpace(const TColgp_SequenceOfVec & NewNormals, TColgp_SequenceOfVec & Normals, GeomPlate_SequenceOfAij & Bset, const Standard_Real LinTol, const Standard_Real AngTol);

		/****************** IsLine ******************/
		/**** md5 signature: 51ad3b0e1f56ed6f328a7a7940918c54 ****/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "Return ok if is a line.

Returns
-------
bool
") IsLine;
		Standard_Boolean IsLine();

		/****************** IsPlane ******************/
		/**** md5 signature: 66a5e8df3e3841a38fe0a90cbc042e0e ****/
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "Return ok if is a plane.

Returns
-------
bool
") IsPlane;
		Standard_Boolean IsPlane();

		/****************** Line ******************/
		/**** md5 signature: 0527a3e42e1f653976ba08cd7db9b8e0 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return a line when 2 eigenvalues are null.

Returns
-------
opencascade::handle<Geom_Line>
") Line;
		opencascade::handle<Geom_Line> Line();

		/****************** MinMaxBox ******************/
		/**** md5 signature: 626e558e1ac26b23212992e4d6955923 ****/
		%feature("compactdefaultargs") MinMaxBox;
		%feature("autodoc", "Computes the minimal box to include all normal projection points of the initial array on the plane.

Parameters
----------

Returns
-------
Umin: float
Umax: float
Vmin: float
Vmax: float
") MinMaxBox;
		void MinMaxBox(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Plane ******************/
		/**** md5 signature: 5c94d426c8cb0ea718d9147a0f1d68f5 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return the average plane.

Returns
-------
opencascade::handle<Geom_Plane>
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
		/****************** GeomPlate_BuildPlateSurface ******************/
		/**** md5 signature: 719055337247e2306cefda66734f315c ****/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "Constructor compatible with the old version with this constructor the constraint are given in a array of curve on surface the array nbpoints contains the number of points for each constraint. the array tang contains the order of constraint for each constraint: the possible values for this order has to be -1 , 0 , 1 , 2 . order i means constraint gi. nbiter is the maximum number of iteration to optimise the number of points for resolution degree is the degree of resolution for plate tol2d is the tolerance used to test if two points of different constraint are identical in the parametric space of the initial surface tol3d is used to test if two identical points in the 2d space are identical in 3d space tolang is used to compare the angle between normal of two identical points in the 2d space raises constructionerror;.

Parameters
----------
NPoints: TColStd_HArray1OfInteger
TabCurve: GeomPlate_HArray1OfHCurve
Tang: TColStd_HArray1OfInteger
Degree: int
NbIter: int,optional
	default value is 3
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1
Anisotropie: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const opencascade::handle<TColStd_HArray1OfInteger> & NPoints, const opencascade::handle<GeomPlate_HArray1OfHCurve> & TabCurve, const opencascade::handle<TColStd_HArray1OfInteger> & Tang, const Standard_Integer Degree, const Standard_Integer NbIter = 3, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Boolean Anisotropie = Standard_False);

		/****************** GeomPlate_BuildPlateSurface ******************/
		/**** md5 signature: 9a58cafacbf3294f7787c5ccf9dedec8 ****/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf: Geom_Surface
Degree: int,optional
	default value is 3
NbPtsOnCur: int,optional
	default value is 10
NbIter: int,optional
	default value is 3
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1
Anisotropie: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const opencascade::handle<Geom_Surface> & Surf, const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 10, const Standard_Integer NbIter = 3, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Boolean Anisotropie = Standard_False);

		/****************** GeomPlate_BuildPlateSurface ******************/
		/**** md5 signature: 9e612aac4a64099f5a264f5f15055758 ****/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "Initializes the buildplatesurface framework for deforming plate surfaces using curve and point constraints. you use the first constructor if you have an initial surface to work with at construction time. if not, you use the second. you can add one later by using the method loadinitsurface. if no initial surface is loaded, one will automatically be computed. the curve and point constraints will be defined by using the method add. before the call to the algorithm, the curve constraints will be transformed into sequences of discrete points. each curve defined as a constraint will be given the value of nbptsoncur as the average number of points on it. several arguments serve to improve performance of the algorithm. nbiter, for example, expresses the number of iterations allowed and is used to control the duration of computation. to optimize resolution, degree will have the default value of 3. the surface generated must respect several tolerance values: - 2d tolerance given by tol2d, with a default value of 0.00001 - 3d tolerance expressed by tol3d, with a default value of 0.0001 - angular tolerance given by tolang, with a default value of 0.01, defining the greatest angle allowed between the constraint and the target surface. exceptions standard_constructionerror if nbiter is less than 1 or degree is less than 3.

Parameters
----------
Degree: int,optional
	default value is 3
NbPtsOnCur: int,optional
	default value is 10
NbIter: int,optional
	default value is 3
Tol2d: float,optional
	default value is 0.00001
Tol3d: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1
Anisotropie: bool,optional
	default value is Standard_False

Returns
-------
None
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface(const Standard_Integer Degree = 3, const Standard_Integer NbPtsOnCur = 10, const Standard_Integer NbIter = 3, const Standard_Real Tol2d = 0.00001, const Standard_Real Tol3d = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1, const Standard_Boolean Anisotropie = Standard_False);

		/****************** Add ******************/
		/**** md5 signature: 38731a3aa718b3fec2b48ae7946c4e8e ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the linear constraint cont.

Parameters
----------
Cont: GeomPlate_CurveConstraint

Returns
-------
None
") Add;
		void Add(const opencascade::handle<GeomPlate_CurveConstraint> & Cont);

		/****************** Add ******************/
		/**** md5 signature: 1d4de1ff59aecdb4597ed3c7a2b94522 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the point constraint cont.

Parameters
----------
Cont: GeomPlate_PointConstraint

Returns
-------
None
") Add;
		void Add(const opencascade::handle<GeomPlate_PointConstraint> & Cont);

		/****************** CurveConstraint ******************/
		/**** md5 signature: d2863a2f63213cbc5ba632a319b98ba5 ****/
		%feature("compactdefaultargs") CurveConstraint;
		%feature("autodoc", "Returns the curveconstraints of order order.

Parameters
----------
order: int

Returns
-------
opencascade::handle<GeomPlate_CurveConstraint>
") CurveConstraint;
		opencascade::handle<GeomPlate_CurveConstraint> CurveConstraint(const Standard_Integer order);

		/****************** Curves2d ******************/
		/**** md5 signature: c016bbe6c4b5018c38c3fbc35d9a3916 ****/
		%feature("compactdefaultargs") Curves2d;
		%feature("autodoc", "Extracts the array of curves on the plate surface which correspond to the curve constraints set in add.

Returns
-------
opencascade::handle<TColGeom2d_HArray1OfCurve>
") Curves2d;
		opencascade::handle<TColGeom2d_HArray1OfCurve> Curves2d();

		/****************** Disc2dContour ******************/
		/**** md5 signature: 3f3a1bea1a2f795f4aac1d5028cede20 ****/
		%feature("compactdefaultargs") Disc2dContour;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbp: int
Seq2d: TColgp_SequenceOfXY

Returns
-------
None
") Disc2dContour;
		void Disc2dContour(const Standard_Integer nbp, TColgp_SequenceOfXY & Seq2d);

		/****************** Disc3dContour ******************/
		/**** md5 signature: 67db8fdcfdf390a10d4af3f50f40e707 ****/
		%feature("compactdefaultargs") Disc3dContour;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbp: int
iordre: int
Seq3d: TColgp_SequenceOfXYZ

Returns
-------
None
") Disc3dContour;
		void Disc3dContour(const Standard_Integer nbp, const Standard_Integer iordre, TColgp_SequenceOfXYZ & Seq3d);

		/****************** G0Error ******************/
		/**** md5 signature: ba177a9a7bac2d394577a179fd8040ef ****/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Returns the max distance betwen the result and the constraints.

Returns
-------
float
") G0Error;
		Standard_Real G0Error();

		/****************** G0Error ******************/
		/**** md5 signature: f99dce5527bffb3ecaa2d1093b4a3635 ****/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "Returns the max distance between the result and the constraint index.

Parameters
----------
Index: int

Returns
-------
float
") G0Error;
		Standard_Real G0Error(const Standard_Integer Index);

		/****************** G1Error ******************/
		/**** md5 signature: 0a0e55267bc5572a38177b75a97dfedc ****/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Returns the max angle betwen the result and the constraints.

Returns
-------
float
") G1Error;
		Standard_Real G1Error();

		/****************** G1Error ******************/
		/**** md5 signature: 0d786918d533628c34e845fd87da5a9b ****/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "Returns the max angle between the result and the constraint index.

Parameters
----------
Index: int

Returns
-------
float
") G1Error;
		Standard_Real G1Error(const Standard_Integer Index);

		/****************** G2Error ******************/
		/**** md5 signature: 0eac129a84e8ae945532a18ff833414e ****/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Returns the max difference of curvature betwen the result and the constraints.

Returns
-------
float
") G2Error;
		Standard_Real G2Error();

		/****************** G2Error ******************/
		/**** md5 signature: 02032765271044476a9ce38570208342 ****/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "Returns the max difference of curvature between the result and the constraint index.

Parameters
----------
Index: int

Returns
-------
float
") G2Error;
		Standard_Real G2Error(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Resets all constraints.

Returns
-------
None
") Init;
		void Init();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tests whether computation of the plate has been completed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LoadInitSurface ******************/
		/**** md5 signature: 242b03f070695dbfa5f639e0217f32a7 ****/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "Loads the initial surface.

Parameters
----------
Surf: Geom_Surface

Returns
-------
None
") LoadInitSurface;
		void LoadInitSurface(const opencascade::handle<Geom_Surface> & Surf);

		/****************** Order ******************/
		/**** md5 signature: 46ad82cbf039a28ad2e8b3e47277f1fc ****/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Returns the order of the curves in the array returned by curves2d. computation changes this order. consequently, this method returns the order of the curves prior to computation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Order;
		opencascade::handle<TColStd_HArray1OfInteger> Order();

		/****************** Perform ******************/
		/**** md5 signature: 04f285fbff57c03afe82932956ba2297 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Calls the algorithm and computes the plate surface using the loaded constraints. if no initial surface is given, the algorithm automatically computes one. exceptions standard_rangeerror if the value of the constraint is null or if plate is not done.

Parameters
----------
aProgress: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Message_ProgressIndicator> & aProgress = opencascade::handle<Message_ProgressIndicator>());

		/****************** PointConstraint ******************/
		/**** md5 signature: fb64f566843365d8012cf3a6bac770bd ****/
		%feature("compactdefaultargs") PointConstraint;
		%feature("autodoc", "Returns the pointconstraint of order order.

Parameters
----------
order: int

Returns
-------
opencascade::handle<GeomPlate_PointConstraint>
") PointConstraint;
		opencascade::handle<GeomPlate_PointConstraint> PointConstraint(const Standard_Integer order);

		/****************** Sense ******************/
		/**** md5 signature: 8cfff544568a5ecc0c039bc023102a19 ****/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "Allows you to ensure that the array of curves returned by curves2d has the correct orientation. returns the orientation of the curves in the the array returned by curves2d. computation changes the orientation of these curves. consequently, this method returns the orientation prior to computation.

Returns
-------
opencascade::handle<TColStd_HArray1OfInteger>
") Sense;
		opencascade::handle<TColStd_HArray1OfInteger> Sense();

		/****************** SetNbBounds ******************/
		/**** md5 signature: 60c94d877ed49bf3ec90cdf5c37ce55b ****/
		%feature("compactdefaultargs") SetNbBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
NbBounds: int

Returns
-------
None
") SetNbBounds;
		void SetNbBounds(const Standard_Integer NbBounds);

		/****************** SurfInit ******************/
		/**** md5 signature: f5f7681588f97bd50595e36576801deb ****/
		%feature("compactdefaultargs") SurfInit;
		%feature("autodoc", "Returns the initial surface.

Returns
-------
opencascade::handle<Geom_Surface>
") SurfInit;
		opencascade::handle<Geom_Surface> SurfInit();

		/****************** Surface ******************/
		/**** md5 signature: 9a0e3bb81696069d481684cfe7c90d56 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the result of the computation. this surface can then be used by geomplate_makeapprox for converting the resulting surface into a bspline.

Returns
-------
opencascade::handle<GeomPlate_Surface>
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
		/****************** GeomPlate_CurveConstraint ******************/
		/**** md5 signature: 3ad0c2328e9f3ac99262c01554acfcf7 ****/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "Initializes an empty curve constraint object.

Returns
-------
None
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint();

		/****************** GeomPlate_CurveConstraint ******************/
		/**** md5 signature: a62faecefa077f152bd27f5f64755f67 ****/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "Create a constraint order is the order of the constraint. the possible values for order are -1,0,1,2. order i means constraints gi npt is the number of points associated with the constraint. toldist is the maximum error to satisfy for g0 constraints tolang is the maximum error to satisfy for g1 constraints tolcurv is the maximum error to satisfy for g2 constraints these errors can be replaced by laws of criterion. raises constructionerror if order is not -1 , 0, 1, 2.

Parameters
----------
Boundary: Adaptor3d_HCurve
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
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint(const opencascade::handle<Adaptor3d_HCurve> & Boundary, const Standard_Integer Order, const Standard_Integer NPt = 10, const Standard_Real TolDist = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****************** Curve2dOnSurf ******************/
		/**** md5 signature: 8c609bb48844258264c3cf92c31ed7f4 ****/
		%feature("compactdefaultargs") Curve2dOnSurf;
		%feature("autodoc", "Returns a 2d curve associated the surface resulting of the constraints.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2dOnSurf;
		opencascade::handle<Geom2d_Curve> Curve2dOnSurf();

		/****************** Curve3d ******************/
		/**** md5 signature: 596e8aeb9d7f684bb78e6f52b63a1e08 ****/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Curve3d;
		opencascade::handle<Adaptor3d_HCurve> Curve3d();

		/****************** D0 ******************/
		/**** md5 signature: c5111ce8ff4abb74b6c4ba34040c62bb ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

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
		/**** md5 signature: 858f158dffbf609a8dc7a05ce5ad141f ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: 14adcb7732620f6a120ea7c371b6898e ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec
V4: gp_Vec
V5: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3, gp_Vec & V4, gp_Vec & V5);

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** G0Criterion ******************/
		/**** md5 signature: e9350f81ed4bb4c49730741e1a89659b ****/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "Returns the g0 criterion at the parametric point u on the curve. this is the greatest distance allowed between the constraint and the target surface at u.

Parameters
----------
U: float

Returns
-------
float
") G0Criterion;
		Standard_Real G0Criterion(const Standard_Real U);

		/****************** G1Criterion ******************/
		/**** md5 signature: adef69eebb64d91e9f543aae1cba8a30 ****/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "Returns the g1 criterion at the parametric point u on the curve. this is the greatest angle allowed between the constraint and the target surface at u. raises constructionerror if the curve is not on a surface.

Parameters
----------
U: float

Returns
-------
float
") G1Criterion;
		Standard_Real G1Criterion(const Standard_Real U);

		/****************** G2Criterion ******************/
		/**** md5 signature: b80df34f4a0ea24cd73e42bfb6988018 ****/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "Returns the g2 criterion at the parametric point u on the curve. this is the greatest difference in curvature allowed between the constraint and the target surface at u. raises constructionerror if the curve is not on a surface.

Parameters
----------
U: float

Returns
-------
float
") G2Criterion;
		Standard_Real G2Criterion(const Standard_Real U);

		/****************** LPropSurf ******************/
		/**** md5 signature: 44f6b352a682f6000b7541e56935b13e ****/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
U: float

Returns
-------
GeomLProp_SLProps
") LPropSurf;
		GeomLProp_SLProps & LPropSurf(const Standard_Real U);

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Length ******************/
		/**** md5 signature: 7a11021be5ff74a321b964da373ca8bd ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Length;
		Standard_Real Length();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points on the curve used as a constraint. the default setting is 10. this parameter affects computation time, which increases by the cube of the number of points.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Order ******************/
		/**** md5 signature: 29e3c952f10c463fdb1b5e1c18c1d597 ****/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Returns the order of constraint, one of g0, g1 or g2.

Returns
-------
int
") Order;
		Standard_Integer Order();

		/****************** ProjectedCurve ******************/
		/**** md5 signature: c2c13b514792a4dff1cc971d955aac37 ****/
		%feature("compactdefaultargs") ProjectedCurve;
		%feature("autodoc", "Returns the projected curve resulting from the normal projection of the curve on the initial surface.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ProjectedCurve;
		opencascade::handle<Adaptor2d_HCurve2d> ProjectedCurve();

		/****************** SetCurve2dOnSurf ******************/
		/**** md5 signature: e48c08a1c66719832c40503ef697b26b ****/
		%feature("compactdefaultargs") SetCurve2dOnSurf;
		%feature("autodoc", "Loads a 2d curve associated the surface resulting of the constraints.

Parameters
----------
Curve2d: Geom2d_Curve

Returns
-------
None
") SetCurve2dOnSurf;
		void SetCurve2dOnSurf(const opencascade::handle<Geom2d_Curve> & Curve2d);

		/****************** SetG0Criterion ******************/
		/**** md5 signature: 0e8e4ff031d080d6ac20814bbd223cd8 ****/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "Allows you to set the g0 criterion. this is the law defining the greatest distance allowed between the constraint and the target surface for each point of the constraint. if this criterion is not set, toldist, the distance tolerance from the constructor, is used.

Parameters
----------
G0Crit: Law_Function

Returns
-------
None
") SetG0Criterion;
		void SetG0Criterion(const opencascade::handle<Law_Function> & G0Crit);

		/****************** SetG1Criterion ******************/
		/**** md5 signature: 310e7fd3dd1b246d73364de3e1b1446f ****/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "Allows you to set the g1 criterion. this is the law defining the greatest angle allowed between the constraint and the target surface. if this criterion is not set, tolang, the angular tolerance from the constructor, is used. raises constructionerror if the curve is not on a surface.

Parameters
----------
G1Crit: Law_Function

Returns
-------
None
") SetG1Criterion;
		void SetG1Criterion(const opencascade::handle<Law_Function> & G1Crit);

		/****************** SetG2Criterion ******************/
		/**** md5 signature: 6180bde7cf9778e66114e191d1f8289e ****/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
G2Crit: Law_Function

Returns
-------
None
") SetG2Criterion;
		void SetG2Criterion(const opencascade::handle<Law_Function> & G2Crit);

		/****************** SetNbPoints ******************/
		/**** md5 signature: 24cd83460573b8a5c77f14a746b45525 ****/
		%feature("compactdefaultargs") SetNbPoints;
		%feature("autodoc", "Allows you to set the number of points on the curve constraint. the default setting is 10. this parameter affects computation time, which increases by the cube of the number of points.

Parameters
----------
NewNb: int

Returns
-------
None
") SetNbPoints;
		void SetNbPoints(const Standard_Integer NewNb);

		/****************** SetOrder ******************/
		/**** md5 signature: e5c9a6282123051921f40d29e1dfc28a ****/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "Allows you to set the order of continuity required for the constraints: g0, g1, and g2, controlled respectively by g0criterion g1criterion and g2criterion.

Parameters
----------
Order: int

Returns
-------
None
") SetOrder;
		void SetOrder(const Standard_Integer Order);

		/****************** SetProjectedCurve ******************/
		/**** md5 signature: 537f5fc7e623dce31c80f73c538af961 ****/
		%feature("compactdefaultargs") SetProjectedCurve;
		%feature("autodoc", "Loads a 2d curve resulting from the normal projection of the curve on the initial surface.

Parameters
----------
Curve2d: Adaptor2d_HCurve2d
TolU: float
TolV: float

Returns
-------
None
") SetProjectedCurve;
		void SetProjectedCurve(const opencascade::handle<Adaptor2d_HCurve2d> & Curve2d, const Standard_Real TolU, const Standard_Real TolV);

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
		/****************** GeomPlate_MakeApprox ******************/
		/**** md5 signature: c3559ac86fd20d649f9937675e3ec408 ****/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "Converts surfplate into a geom_bsplinesurface with n bezier pieces (n<=nbmax) of degree <= dgmax and an approximation error < tol3d if possible the criterion critplate is satisfied if possible.

Parameters
----------
SurfPlate: GeomPlate_Surface
PlateCrit: AdvApp2Var_Criterion
Tol3d: float
Nbmax: int
dgmax: int
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1
EnlargeCoeff: float,optional
	default value is 1.1

Returns
-------
None
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox(const opencascade::handle<GeomPlate_Surface> & SurfPlate, const AdvApp2Var_Criterion & PlateCrit, const Standard_Real Tol3d, const Standard_Integer Nbmax, const Standard_Integer dgmax, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Real EnlargeCoeff = 1.1);

		/****************** GeomPlate_MakeApprox ******************/
		/**** md5 signature: 11dd85cc6ab536dfe14b6591af159b11 ****/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "Converts surfplate into a geom_bsplinesurface with n bezier pieces (n<=nbmax) of degree <= dgmax and an approximation error < tol3d if possible if critorder = -1 , no criterion is used if critorder = 0 , a plateg0criterion is used with max value > 10*dmax if critorder = 1 , a plateg1criterion is used with max value > 10*dmax warning : for critorder = 0 or 1, only the constraints points of surfplate are used to evaluate the value of the criterion.

Parameters
----------
SurfPlate: GeomPlate_Surface
Tol3d: float
Nbmax: int
dgmax: int
dmax: float
CritOrder: int,optional
	default value is 0
Continuity: GeomAbs_Shape,optional
	default value is GeomAbs_C1
EnlargeCoeff: float,optional
	default value is 1.1

Returns
-------
None
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox(const opencascade::handle<GeomPlate_Surface> & SurfPlate, const Standard_Real Tol3d, const Standard_Integer Nbmax, const Standard_Integer dgmax, const Standard_Real dmax, const Standard_Integer CritOrder = 0, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Real EnlargeCoeff = 1.1);

		/****************** ApproxError ******************/
		/**** md5 signature: 2a3fbb0e410b6d24d6719a8a79285a23 ****/
		%feature("compactdefaultargs") ApproxError;
		%feature("autodoc", "Returns the error in computation of the approximation surface. this is the distance between the entire target bspline surface and the entire original surface generated by buildplatesurface and converted by geomplate_surface.

Returns
-------
float
") ApproxError;
		Standard_Real ApproxError();

		/****************** CriterionError ******************/
		/**** md5 signature: fe3d9195cbf00531a797a7c49841063a ****/
		%feature("compactdefaultargs") CriterionError;
		%feature("autodoc", "Returns the criterion error in computation of the approximation surface. this is estimated relative to the curve and point constraints only.

Returns
-------
float
") CriterionError;
		Standard_Real CriterionError();

		/****************** Surface ******************/
		/**** md5 signature: 2f50ef783efd4092d3a11c39580e031f ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bspline surface extracted from the geomplate_makeapprox object.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
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
		/****************** GeomPlate_PlateG0Criterion ******************/
		/**** md5 signature: dbf6618e7b45035ca70a87e835a2ec01 ****/
		%feature("compactdefaultargs") GeomPlate_PlateG0Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
Data: TColgp_SequenceOfXY
G0Data: TColgp_SequenceOfXYZ
Maximum: float
Type: AdvApp2Var_CriterionType,optional
	default value is AdvApp2Var_Absolute
Repart: AdvApp2Var_CriterionRepartition,optional
	default value is AdvApp2Var_Regular

Returns
-------
None
") GeomPlate_PlateG0Criterion;
		 GeomPlate_PlateG0Criterion(const TColgp_SequenceOfXY & Data, const TColgp_SequenceOfXYZ & G0Data, const Standard_Real Maximum, const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute, const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****************** IsSatisfied ******************/
		/**** md5 signature: 36b58bb72cd51963a174f29bac551403 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: AdvApp2Var_Patch

Returns
-------
bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied(const AdvApp2Var_Patch & P);

		/****************** Value ******************/
		/**** md5 signature: 72ff1ddaefca7f5b0f2dce81eaa13cc5 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Returns
-------
None
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
		/****************** GeomPlate_PlateG1Criterion ******************/
		/**** md5 signature: aea3921133d20989a35e4ac7258b027f ****/
		%feature("compactdefaultargs") GeomPlate_PlateG1Criterion;
		%feature("autodoc", "No available documentation.

Parameters
----------
Data: TColgp_SequenceOfXY
G1Data: TColgp_SequenceOfXYZ
Maximum: float
Type: AdvApp2Var_CriterionType,optional
	default value is AdvApp2Var_Absolute
Repart: AdvApp2Var_CriterionRepartition,optional
	default value is AdvApp2Var_Regular

Returns
-------
None
") GeomPlate_PlateG1Criterion;
		 GeomPlate_PlateG1Criterion(const TColgp_SequenceOfXY & Data, const TColgp_SequenceOfXYZ & G1Data, const Standard_Real Maximum, const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute, const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****************** IsSatisfied ******************/
		/**** md5 signature: 36b58bb72cd51963a174f29bac551403 ****/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: AdvApp2Var_Patch

Returns
-------
bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied(const AdvApp2Var_Patch & P);

		/****************** Value ******************/
		/**** md5 signature: 72ff1ddaefca7f5b0f2dce81eaa13cc5 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: AdvApp2Var_Patch
C: AdvApp2Var_Context

Returns
-------
None
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
		/****************** GeomPlate_PointConstraint ******************/
		/**** md5 signature: 0d9afe5ab86321593798b6c8a19a80c9 ****/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "Constructs a point constraint object defined by pt, a 3d point order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.g0 when assigned to pt - -1 i.e. none, 0 i.e. g0, 1 i.e. g1, 2 i.e. g2 when assigned to u, v and surf. in this constructor, only toldist is given. distance tolerance represents the greatest distance allowed between the constraint and the target surface. angular tolerance represents the largest angle allowed between the constraint and the target surface. curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface. raises constructionerror if order is not 0 or -1.

Parameters
----------
Pt: gp_Pnt
Order: int
TolDist: float,optional
	default value is 0.0001

Returns
-------
None
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint(const gp_Pnt & Pt, const Standard_Integer Order, const Standard_Real TolDist = 0.0001);

		/****************** GeomPlate_PointConstraint ******************/
		/**** md5 signature: ac001d7ea93d59930168cec3d03c7c5c ****/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "Constructs a point constraint object defined by the intersection point of u and v on the surface surf. order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.g0 when assigned to pt - -1 i.e. none, 0 i.e. g0, 1 i.e. g1, 2 i.e. g2 when assigned to u, v and surf. in this constructor the surface to be generated must respect several tolerance values only: - the distance tolerance toldist - the angular tolerance tolang - the curvature tolerance, tolcurv. distance tolerance represents the greatest distance allowed between the constraint and the target surface. angular tolerance represents the largest angle allowed between the constraint and the target surface. curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface.creates a punctual constraint.

Parameters
----------
U: float
V: float
Surf: Geom_Surface
Order: int
TolDist: float,optional
	default value is 0.0001
TolAng: float,optional
	default value is 0.01
TolCurv: float,optional
	default value is 0.1

Returns
-------
None
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint(const Standard_Real U, const Standard_Real V, const opencascade::handle<Geom_Surface> & Surf, const Standard_Integer Order, const Standard_Real TolDist = 0.0001, const Standard_Real TolAng = 0.01, const Standard_Real TolCurv = 0.1);

		/****************** D0 ******************/
		/**** md5 signature: 08199c5cd3a9368c201379f7960011d9 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 7efc119e5b1eac12afa3ec547ad82318 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D1;
		void D1(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		/**** md5 signature: 940ebc96acf7815a2cb59cbcd936498e ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec
V4: gp_Vec
V5: gp_Vec

Returns
-------
None
") D2;
		void D2(gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3, gp_Vec & V4, gp_Vec & V5);

		/****************** G0Criterion ******************/
		/**** md5 signature: 8656f472e7fdba4f071fbe4aaa7cf62a ****/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "Returns the g0 criterion. this is the greatest distance allowed between the constraint and the target surface.

Returns
-------
float
") G0Criterion;
		Standard_Real G0Criterion();

		/****************** G1Criterion ******************/
		/**** md5 signature: b9005724b99845fd3537d391fffd2e1d ****/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "Returns the g1 criterion. this is the greatest angle allowed between the constraint and the target surface. raises constructionerror if the point is not on the surface.

Returns
-------
float
") G1Criterion;
		Standard_Real G1Criterion();

		/****************** G2Criterion ******************/
		/**** md5 signature: 32df7c10d58b9000703fb0609ec508fb ****/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "Returns the g2 criterion. this is the greatest difference in curvature allowed between the constraint and the target surface. raises constructionerror if the point is not on the surface.

Returns
-------
float
") G2Criterion;
		Standard_Real G2Criterion();

		/****************** HasPnt2dOnSurf ******************/
		/**** md5 signature: fbd2d51e12a2d88bfa609432cb2e669e ****/
		%feature("compactdefaultargs") HasPnt2dOnSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPnt2dOnSurf;
		Standard_Boolean HasPnt2dOnSurf();

		/****************** LPropSurf ******************/
		/**** md5 signature: ad4b23341cdf9a128c1f8dc8f59255c5 ****/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomLProp_SLProps
") LPropSurf;
		GeomLProp_SLProps & LPropSurf();

		/****************** Order ******************/
		/**** md5 signature: 29e3c952f10c463fdb1b5e1c18c1d597 ****/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "Returns the order of constraint: g0, g1, and g2, controlled respectively by g0criterion g1criterion and g2criterion.

Returns
-------
int
") Order;
		Standard_Integer Order();

		/****************** Pnt2dOnSurf ******************/
		/**** md5 signature: 09c83c1db3d333932aca0c51bbfdeb83 ****/
		%feature("compactdefaultargs") Pnt2dOnSurf;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") Pnt2dOnSurf;
		gp_Pnt2d Pnt2dOnSurf();

		/****************** SetG0Criterion ******************/
		/**** md5 signature: b33d4653f6e437f1f3c360b2464460fe ****/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "Allows you to set the g0 criterion. this is the law defining the greatest distance allowed between the constraint and the target surface. if this criterion is not set, {toldist, the distance tolerance from the constructor, is used.

Parameters
----------
TolDist: float

Returns
-------
None
") SetG0Criterion;
		void SetG0Criterion(const Standard_Real TolDist);

		/****************** SetG1Criterion ******************/
		/**** md5 signature: 38e46bce80668508c53652088fe310c0 ****/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "Allows you to set the g1 criterion. this is the law defining the greatest angle allowed between the constraint and the target surface. if this criterion is not set, tolang, the angular tolerance from the constructor, is used. raises constructionerror if the point is not on the surface.

Parameters
----------
TolAng: float

Returns
-------
None
") SetG1Criterion;
		void SetG1Criterion(const Standard_Real TolAng);

		/****************** SetG2Criterion ******************/
		/**** md5 signature: cd8438932c050d7dc27a81304a0b1e4a ****/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "Allows you to set the g2 criterion. this is the law defining the greatest difference in curvature allowed between the constraint and the target surface. if this criterion is not set, tolcurv, the curvature tolerance from the constructor, is used. raises constructionerror if the point is not on the surface.

Parameters
----------
TolCurv: float

Returns
-------
None
") SetG2Criterion;
		void SetG2Criterion(const Standard_Real TolCurv);

		/****************** SetOrder ******************/
		/**** md5 signature: e5c9a6282123051921f40d29e1dfc28a ****/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Order: int

Returns
-------
None
") SetOrder;
		void SetOrder(const Standard_Integer Order);

		/****************** SetPnt2dOnSurf ******************/
		/**** md5 signature: 51fcd360e040f75e6558e21bd6fd66dd ****/
		%feature("compactdefaultargs") SetPnt2dOnSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pnt: gp_Pnt2d

Returns
-------
None
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
		/****************** GeomPlate_Surface ******************/
		/**** md5 signature: fcdf26b5ac10741eceb18e95b5b358c3 ****/
		%feature("compactdefaultargs") GeomPlate_Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surfinit: Geom_Surface
Surfinter: Plate_Plate

Returns
-------
None
") GeomPlate_Surface;
		 GeomPlate_Surface(const opencascade::handle<Geom_Surface> & Surfinit, const Plate_Plate & Surfinter);

		/****************** Bounds ******************/
		/**** md5 signature: bbc36976e796eedf3c69513e986f2adb ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CallSurfinit ******************/
		/**** md5 signature: bffc80d2b69351c87065c51824198abd ****/
		%feature("compactdefaultargs") CallSurfinit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") CallSurfinit;
		opencascade::handle<Geom_Surface> CallSurfinit();

		/****************** Constraints ******************/
		/**** md5 signature: 88a670186229c9cf80f58b8c1c1e6764 ****/
		%feature("compactdefaultargs") Constraints;
		%feature("autodoc", "No available documentation.

Parameters
----------
Seq: TColgp_SequenceOfXY

Returns
-------
None
") Constraints;
		void Constraints(TColgp_SequenceOfXY & Seq);

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Global continuity of the surface in direction u and v : c0 : only geometric continuity, c1 : continuity of the first derivative all along the surface, c2 : continuity of the second derivative all along the surface, c3 : continuity of the third derivative all along the surface, g1 : tangency continuity all along the surface, g2 : curvature continuity all along the surface, cn : the order of continuity is infinite. example : if the surface is c1 in the v parametric direction and c2 in the u parametric direction shape = c1.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		/**** md5 signature: 1360a3e0ea51e38ae19c71fb8aa1c4e9 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Geometry>
") Copy;
		opencascade::handle<Geom_Geometry> Copy();

		/****************** D0 ******************/
		/**** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u,v on the surface. //! raised only for an 'offsetsurface' if it is not possible to compute the current point.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 0868b105367e01c443402a5728aa3395 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point p and the first derivatives in the directions u and v at this point. raised if the continuity of the surface is not c1.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		/**** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point p, the first and the second derivatives in the directions u and v at this point. raised if the continuity of the surface is not c2.

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

Returns
-------
None
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		/**** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point p, the first,the second and the third derivatives in the directions u and v at this point. raised if the continuity of the surface is not c2.

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

Returns
-------
None
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		/**** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "---purpose ; computes the derivative of order nu in the direction u and nv in the direction v at the point p(u, v). //! raised if the continuity of the surface is not cnu in the u direction or not cnv in the v direction. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** IsCNu ******************/
		/**** md5 signature: c9f9f7f6eb82d83e9ba43e721cffba8a ****/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "Returns the order of continuity of the surface in the u parametric direction. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNu;
		Standard_Boolean IsCNu(const Standard_Integer N);

		/****************** IsCNv ******************/
		/**** md5 signature: 0acb88d1ffd7eea46785f30d7fc5f85e ****/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "Returns the order of continuity of the surface in the v parametric direction. raised if n < 0.

Parameters
----------
N: int

Returns
-------
bool
") IsCNv;
		Standard_Boolean IsCNv(const Standard_Integer N);

		/****************** IsUClosed ******************/
		/**** md5 signature: d1e8bae29b90dc447f4693c94ad31c37 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Is the surface closed in the parametric direction u ? returns true if for each parameter v the distance between the point p (ufirst, v) and p (ulast, v) is lower or equal to resolution from gp. ufirst and ulast are the parametric bounds in the u direction.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 91acb028d6850ac4bbf00dc198b558b7 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Is the parametrization of a surface periodic in the direction u ? it is possible only if the surface is closed in this parametric direction and if the following relation is satisfied : for each parameter v the distance between the point p (u, v) and the point p (u + t, v) is lower or equal to resolution from package gp. t is the parametric period and must be a constant.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsVClosed ******************/
		/**** md5 signature: aa0eae8155ddef3e9f1d0cc573955bb6 ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Is the surface closed in the parametric direction v ? returns true if for each parameter u the distance between the point p (u, vfirst) and p (u, vlast) is lower or equal to resolution from gp. vfirst and vlast are the parametric bounds in the v direction.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 88e9b94f2ab4a3d73c3fe787315e4448 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Is the parametrization of a surface periodic in the direction u ? it is possible only if the surface is closed in this parametric direction and if the following relation is satisfied : for each parameter v the distance between the point p (u, v) and the point p (u + t, v) is lower or equal to resolution from package gp. t is the parametric period and must be a constant.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** ParametricTransformation ******************/
		/**** md5 signature: 019b69215b9dcafd8e9b0052b449ea05 ****/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are obtained by transforming u,v with th 2d transformation returned by //! me->parametrictransformation(t) //! this methods returns an identity transformation //! it can be redefined. for example on the plane, cylinder, cone, revolved and extruded surfaces.

Parameters
----------
T: gp_Trsf

Returns
-------
gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation(const gp_Trsf & T);

		/****************** RealBounds ******************/
		/**** md5 signature: c6bfe002a66421759247a297ee799115 ****/
		%feature("compactdefaultargs") RealBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U1: float
U2: float
V1: float
V2: float
") RealBounds;
		void RealBounds(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetBounds ******************/
		/**** md5 signature: f9b00539a5ee696f2b7b8724fb01c337 ****/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
Umin: float
Umax: float
Vmin: float
Vmax: float

Returns
-------
None
") SetBounds;
		void SetBounds(const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****************** Transform ******************/
		/**** md5 signature: b643be97d129c62226d788cd0501ced0 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transformation of a geometric object. this tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class transformation of the package geom).

Parameters
----------
T: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & T);

		/****************** TransformParameters ******************/
		/**** md5 signature: 2d9e8651399bacbb299466ac222a6ca8 ****/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "Computes the parameters on the transformed surface for the transform of the point of parameters u,v on <self>. //! me->transformed(t)->value(u',v') //! is the same point as //! me->value(u,v).transformed(t) //! where u',v' are the new values of u,v after calling //! me->tranformparameters(u,v,t) //! this methods does not change <u> and <v> //! it can be redefined. for example on the plane, cylinder, cone, revolved and extruded surfaces.

Parameters
----------
T: gp_Trsf

Returns
-------
U: float
V: float
") TransformParameters;
		virtual void TransformParameters(Standard_Real &OutValue, Standard_Real &OutValue, const gp_Trsf & T);

		/****************** UIso ******************/
		/**** md5 signature: f5e8cbc22e32c38f4dd05caadff59fee ****/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "Computes the u isoparametric curve.

Parameters
----------
U: float

Returns
-------
opencascade::handle<Geom_Curve>
") UIso;
		opencascade::handle<Geom_Curve> UIso(const Standard_Real U);

		/****************** UPeriod ******************/
		/**** md5 signature: 99929007fac43736aa36012893e9b882 ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Returns the uperiod. raises if the surface is not uperiodic.

Returns
-------
float
") UPeriod;
		virtual Standard_Real UPeriod();

		/****************** UReverse ******************/
		/**** md5 signature: 31a376207d6b3f3c82d0cde57034e1f2 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Reverses the u direction of parametrization of <self>. the bounds of the surface are not modified.

Returns
-------
None
") UReverse;
		void UReverse();

		/****************** UReversedParameter ******************/
		/**** md5 signature: 0071925b176316f0aaaf26f369ac410c ****/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "Return the parameter on the ureversed surface for the point of parameter u on <self>. //! me->ureversed()->value(me->ureversedparameter(u),v) //! is the same point as //! me->value(u,v).

Parameters
----------
U: float

Returns
-------
float
") UReversedParameter;
		Standard_Real UReversedParameter(const Standard_Real U);

		/****************** VIso ******************/
		/**** md5 signature: ef8726fc193d6cf33f54c94b9ed952a5 ****/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "Computes the v isoparametric curve.

Parameters
----------
V: float

Returns
-------
opencascade::handle<Geom_Curve>
") VIso;
		opencascade::handle<Geom_Curve> VIso(const Standard_Real V);

		/****************** VPeriod ******************/
		/**** md5 signature: 0b2fb065ece518694127e1e1eadebb25 ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Returns the vperiod. raises if the surface is not vperiodic.

Returns
-------
float
") VPeriod;
		virtual Standard_Real VPeriod();

		/****************** VReverse ******************/
		/**** md5 signature: ca22d262a13cf236e9be77a884d19536 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Reverses the v direction of parametrization of <self>. the bounds of the surface are not modified.

Returns
-------
None
") VReverse;
		void VReverse();

		/****************** VReversedParameter ******************/
		/**** md5 signature: 92057d43e0e5ee078908582a4176343b ****/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "Return the parameter on the vreversed surface for the point of parameter v on <self>. //! me->vreversed()->value(u,me->vreversedparameter(v)) //! is the same point as //! me->value(u,v).

Parameters
----------
V: float

Returns
-------
float
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

class GeomPlate_HArray1OfSequenceOfReal : public GeomPlate_Array1OfSequenceOfReal, public Standard_Transient {
  public:
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomPlate_Array1OfSequenceOfReal::value_type& theValue);
    GeomPlate_HArray1OfSequenceOfReal(const GeomPlate_Array1OfSequenceOfReal& theOther);
    const GeomPlate_Array1OfSequenceOfReal& Array1();
    GeomPlate_Array1OfSequenceOfReal& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfSequenceOfReal)


class GeomPlate_HArray1OfHCurve : public GeomPlate_Array1OfHCurve, public Standard_Transient {
  public:
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomPlate_Array1OfHCurve::value_type& theValue);
    GeomPlate_HArray1OfHCurve(const GeomPlate_Array1OfHCurve& theOther);
    const GeomPlate_Array1OfHCurve& Array1();
    GeomPlate_Array1OfHCurve& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfHCurve)

/* harray2 classes */
/* hsequence classes */
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


