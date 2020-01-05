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
#include<TColGeom2d_module.hxx>
#include<TColStd_module.hxx>
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
%import TColGeom2d.i
%import TColStd.i
%import Message.i
%import Geom2d.i
%import GeomLProp.i
%import Adaptor2d.i
%import Law.i
%import AdvApp2Var.i
%import GeomAbs.i
%import Plate.i
/* public enums */
/* end public enums declaration */

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
%template(GeomPlate_SequenceOfAij) NCollection_Sequence <GeomPlate_Aij>;
%template(GeomPlate_Array1OfHCurve) NCollection_Array1 <opencascade::handle <Adaptor3d_HCurve>>;

%extend NCollection_Array1 <opencascade::handle <Adaptor3d_HCurve>> {
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
%template(GeomPlate_Array1OfSequenceOfReal) NCollection_Array1 <TColStd_SequenceOfReal>;

%extend NCollection_Array1 <TColStd_SequenceOfReal> {
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
%template(GeomPlate_SequenceOfPointConstraint) NCollection_Sequence <opencascade::handle <GeomPlate_PointConstraint>>;
%template(GeomPlate_SequenceOfCurveConstraint) NCollection_Sequence <opencascade::handle <GeomPlate_CurveConstraint>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <GeomPlate_Aij> GeomPlate_SequenceOfAij;
typedef NCollection_Array1 <opencascade::handle <Adaptor3d_HCurve>> GeomPlate_Array1OfHCurve;
typedef NCollection_Array1 <TColStd_SequenceOfReal> GeomPlate_Array1OfSequenceOfReal;
typedef NCollection_Sequence <opencascade::handle <GeomPlate_PointConstraint>> GeomPlate_SequenceOfPointConstraint;
typedef NCollection_Sequence <opencascade::handle <GeomPlate_CurveConstraint>> GeomPlate_SequenceOfCurveConstraint;
/* end typedefs declaration */

/**********************
* class GeomPlate_Aij *
**********************/
class GeomPlate_Aij {
	public:
		/****************** GeomPlate_Aij ******************/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", ":rtype: None") GeomPlate_Aij;
		 GeomPlate_Aij ();

		/****************** GeomPlate_Aij ******************/
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", ":param anInd1:
	:type anInd1: int
	:param anInd2:
	:type anInd2: int
	:param aVec:
	:type aVec: gp_Vec
	:rtype: None") GeomPlate_Aij;
		 GeomPlate_Aij (const Standard_Integer anInd1,const Standard_Integer anInd2,const gp_Vec & aVec);

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
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "* Tol is a Tolerance to make the difference between the result plane and the result line. if POption = 1 : automatical parametrisation if POption = 2 : parametrisation by eigen vectors if NOption = 1 : the average plane is the inertial plane. if NOption = 2 : the average plane is the plane of max. flux.
	:param Pts:
	:type Pts: TColgp_HArray1OfPnt
	:param NbBoundPoints:
	:type NbBoundPoints: int
	:param Tol:
	:type Tol: float
	:param POption:
	:type POption: int
	:param NOption:
	:type NOption: int
	:rtype: None") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane (const opencascade::handle<TColgp_HArray1OfPnt> & Pts,const Standard_Integer NbBoundPoints,const Standard_Real Tol,const Standard_Integer POption,const Standard_Integer NOption);

		/****************** GeomPlate_BuildAveragePlane ******************/
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "* Creates the plane from the 'best vector'
	:param Normals:
	:type Normals: TColgp_SequenceOfVec
	:param Pts:
	:type Pts: TColgp_HArray1OfPnt
	:rtype: None") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane (const TColgp_SequenceOfVec & Normals,const opencascade::handle<TColgp_HArray1OfPnt> & Pts);

		/****************** HalfSpace ******************/
		%feature("compactdefaultargs") HalfSpace;
		%feature("autodoc", ":param NewNormals:
	:type NewNormals: TColgp_SequenceOfVec
	:param Normals:
	:type Normals: TColgp_SequenceOfVec
	:param Bset:
	:type Bset: GeomPlate_SequenceOfAij
	:param LinTol:
	:type LinTol: float
	:param AngTol:
	:type AngTol: float
	:rtype: bool") HalfSpace;
		static Standard_Boolean HalfSpace (const TColgp_SequenceOfVec & NewNormals,TColgp_SequenceOfVec & Normals,GeomPlate_SequenceOfAij & Bset,const Standard_Real LinTol,const Standard_Real AngTol);

		/****************** IsLine ******************/
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "* return OK if is a line.
	:rtype: bool") IsLine;
		Standard_Boolean IsLine ();

		/****************** IsPlane ******************/
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "* return OK if is a plane.
	:rtype: bool") IsPlane;
		Standard_Boolean IsPlane ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Return a Line when 2 eigenvalues are null.
	:rtype: opencascade::handle<Geom_Line>") Line;
		opencascade::handle<Geom_Line> Line ();

		/****************** MinMaxBox ******************/
		%feature("compactdefaultargs") MinMaxBox;
		%feature("autodoc", "* computes the minimal box to include all normal projection points of the initial array on the plane.
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: None") MinMaxBox;
		void MinMaxBox (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "* Return the average Plane.
	:rtype: opencascade::handle<Geom_Plane>") Plane;
		opencascade::handle<Geom_Plane> Plane ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the linear constraint cont.
	:param Cont:
	:type Cont: GeomPlate_CurveConstraint
	:rtype: None") Add;
		void Add (const opencascade::handle<GeomPlate_CurveConstraint> & Cont);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the point constraint cont.
	:param Cont:
	:type Cont: GeomPlate_PointConstraint
	:rtype: None") Add;
		void Add (const opencascade::handle<GeomPlate_PointConstraint> & Cont);

		/****************** CurveConstraint ******************/
		%feature("compactdefaultargs") CurveConstraint;
		%feature("autodoc", "* returns the CurveConstraints of order order
	:param order:
	:type order: int
	:rtype: opencascade::handle<GeomPlate_CurveConstraint>") CurveConstraint;
		opencascade::handle<GeomPlate_CurveConstraint> CurveConstraint (const Standard_Integer order);

		/****************** Curves2d ******************/
		%feature("compactdefaultargs") Curves2d;
		%feature("autodoc", "* Extracts the array of curves on the plate surface which correspond to the curve constraints set in Add.
	:rtype: opencascade::handle<TColGeom2d_HArray1OfCurve>") Curves2d;
		opencascade::handle<TColGeom2d_HArray1OfCurve> Curves2d ();

		/****************** Disc2dContour ******************/
		%feature("compactdefaultargs") Disc2dContour;
		%feature("autodoc", ":param nbp:
	:type nbp: int
	:param Seq2d:
	:type Seq2d: TColgp_SequenceOfXY
	:rtype: None") Disc2dContour;
		void Disc2dContour (const Standard_Integer nbp,TColgp_SequenceOfXY & Seq2d);

		/****************** Disc3dContour ******************/
		%feature("compactdefaultargs") Disc3dContour;
		%feature("autodoc", ":param nbp:
	:type nbp: int
	:param iordre:
	:type iordre: int
	:param Seq3d:
	:type Seq3d: TColgp_SequenceOfXYZ
	:rtype: None") Disc3dContour;
		void Disc3dContour (const Standard_Integer nbp,const Standard_Integer iordre,TColgp_SequenceOfXYZ & Seq3d);

		/****************** G0Error ******************/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "* Returns the max distance betwen the result and the constraints
	:rtype: float") G0Error;
		Standard_Real G0Error ();

		/****************** G0Error ******************/
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "* Returns the max distance between the result and the constraint Index
	:param Index:
	:type Index: int
	:rtype: float") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);

		/****************** G1Error ******************/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "* Returns the max angle betwen the result and the constraints
	:rtype: float") G1Error;
		Standard_Real G1Error ();

		/****************** G1Error ******************/
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "* Returns the max angle between the result and the constraint Index
	:param Index:
	:type Index: int
	:rtype: float") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);

		/****************** G2Error ******************/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "* Returns the max difference of curvature betwen the result and the constraints
	:rtype: float") G2Error;
		Standard_Real G2Error ();

		/****************** G2Error ******************/
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "* Returns the max difference of curvature between the result and the constraint Index
	:param Index:
	:type Index: int
	:rtype: float") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);

		/****************** GeomPlate_BuildPlateSurface ******************/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "* Constructor compatible with the old version with this constructor the constraint are given in a Array of Curve on Surface The array NbPoints contains the number of points for each constraint. The Array Tang contains the order of constraint for each Constraint: The possible values for this order has to be -1 , 0 , 1 , 2 . Order i means constraint Gi. NbIter is the maximum number of iteration to optimise the number of points for resolution Degree is the degree of resolution for Plate Tol2d is the tolerance used to test if two points of different constraint are identical in the parametric space of the initial surface Tol3d is used to test if two identical points in the 2d space are identical in 3d space TolAng is used to compare the angle between normal of two identical points in the 2d space Raises ConstructionError;
	:param NPoints:
	:type NPoints: TColStd_HArray1OfInteger
	:param TabCurve:
	:type TabCurve: GeomPlate_HArray1OfHCurve
	:param Tang:
	:type Tang: TColStd_HArray1OfInteger
	:param Degree:
	:type Degree: int
	:param NbIter: default value is 3
	:type NbIter: int
	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:rtype: None") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const opencascade::handle<TColStd_HArray1OfInteger> & NPoints,const opencascade::handle<GeomPlate_HArray1OfHCurve> & TabCurve,const opencascade::handle<TColStd_HArray1OfInteger> & Tang,const Standard_Integer Degree,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);

		/****************** GeomPlate_BuildPlateSurface ******************/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", ":param Surf:
	:type Surf: Geom_Surface
	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 10
	:type NbPtsOnCur: int
	:param NbIter: default value is 3
	:type NbIter: int
	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:rtype: None") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const opencascade::handle<Geom_Surface> & Surf,const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 10,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);

		/****************** GeomPlate_BuildPlateSurface ******************/
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "* Initializes the BuildPlateSurface framework for deforming plate surfaces using curve and point constraints. You use the first constructor if you have an initial surface to work with at construction time. If not, you use the second. You can add one later by using the method LoadInitSurface. If no initial surface is loaded, one will automatically be computed. The curve and point constraints will be defined by using the method Add. Before the call to the algorithm, the curve constraints will be transformed into sequences of discrete points. Each curve defined as a constraint will be given the value of NbPtsOnCur as the average number of points on it. Several arguments serve to improve performance of the algorithm. NbIter, for example, expresses the number of iterations allowed and is used to control the duration of computation. To optimize resolution, Degree will have the default value of 3. The surface generated must respect several tolerance values: - 2d tolerance given by Tol2d, with a default value of 0.00001 - 3d tolerance expressed by Tol3d, with a default value of 0.0001 - angular tolerance given by TolAng, with a default value of 0.01, defining the greatest angle allowed between the constraint and the target surface. Exceptions Standard_ConstructionError if NbIter is less than 1 or Degree is less than 3.
	:param Degree: default value is 3
	:type Degree: int
	:param NbPtsOnCur: default value is 10
	:type NbPtsOnCur: int
	:param NbIter: default value is 3
	:type NbIter: int
	:param Tol2d: default value is 0.00001
	:type Tol2d: float
	:param Tol3d: default value is 0.0001
	:type Tol3d: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:param Anisotropie: default value is Standard_False
	:type Anisotropie: bool
	:rtype: None") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 10,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Resets all constraints
	:rtype: None") Init;
		void Init ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Tests whether computation of the plate has been completed.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LoadInitSurface ******************/
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "* Loads the initial Surface
	:param Surf:
	:type Surf: Geom_Surface
	:rtype: None") LoadInitSurface;
		void LoadInitSurface (const opencascade::handle<Geom_Surface> & Surf);

		/****************** Order ******************/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "* Returns the order of the curves in the array returned by Curves2d. Computation changes this order. Consequently, this method returns the order of the curves prior to computation.
	:rtype: opencascade::handle<TColStd_HArray1OfInteger>") Order;
		opencascade::handle<TColStd_HArray1OfInteger> Order ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Calls the algorithm and computes the plate surface using the loaded constraints. If no initial surface is given, the algorithm automatically computes one. Exceptions Standard_RangeError if the value of the constraint is null or if plate is not done.
	:param aProgress: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgress: Message_ProgressIndicator
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Message_ProgressIndicator> & aProgress = opencascade::handle<Message_ProgressIndicator>());

		/****************** PointConstraint ******************/
		%feature("compactdefaultargs") PointConstraint;
		%feature("autodoc", "* returns the PointConstraint of order order
	:param order:
	:type order: int
	:rtype: opencascade::handle<GeomPlate_PointConstraint>") PointConstraint;
		opencascade::handle<GeomPlate_PointConstraint> PointConstraint (const Standard_Integer order);

		/****************** Sense ******************/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "* Allows you to ensure that the array of curves returned by Curves2d has the correct orientation. Returns the orientation of the curves in the the array returned by Curves2d. Computation changes the orientation of these curves. Consequently, this method returns the orientation prior to computation.
	:rtype: opencascade::handle<TColStd_HArray1OfInteger>") Sense;
		opencascade::handle<TColStd_HArray1OfInteger> Sense ();

		/****************** SetNbBounds ******************/
		%feature("compactdefaultargs") SetNbBounds;
		%feature("autodoc", ":param NbBounds:
	:type NbBounds: int
	:rtype: None") SetNbBounds;
		void SetNbBounds (const Standard_Integer NbBounds);

		/****************** SurfInit ******************/
		%feature("compactdefaultargs") SurfInit;
		%feature("autodoc", "* Returns the initial surface
	:rtype: opencascade::handle<Geom_Surface>") SurfInit;
		opencascade::handle<Geom_Surface> SurfInit ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the result of the computation. This surface can then be used by GeomPlate_MakeApprox for converting the resulting surface into a BSpline.
	:rtype: opencascade::handle<GeomPlate_Surface>") Surface;
		opencascade::handle<GeomPlate_Surface> Surface ();

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
		/****************** Curve2dOnSurf ******************/
		%feature("compactdefaultargs") Curve2dOnSurf;
		%feature("autodoc", "* Returns a 2d curve associated the surface resulting of the constraints
	:rtype: opencascade::handle<Geom2d_Curve>") Curve2dOnSurf;
		opencascade::handle<Geom2d_Curve> Curve2dOnSurf ();

		/****************** Curve3d ******************/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HCurve>") Curve3d;
		opencascade::handle<Adaptor3d_HCurve> Curve3d ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:param V4:
	:type V4: gp_Vec
	:param V5:
	:type V5: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3,gp_Vec & V4,gp_Vec & V5);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** G0Criterion ******************/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "* Returns the G0 criterion at the parametric point U on the curve. This is the greatest distance allowed between the constraint and the target surface at U.
	:param U:
	:type U: float
	:rtype: float") G0Criterion;
		Standard_Real G0Criterion (const Standard_Real U);

		/****************** G1Criterion ******************/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "* Returns the G1 criterion at the parametric point U on the curve. This is the greatest angle allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface
	:param U:
	:type U: float
	:rtype: float") G1Criterion;
		Standard_Real G1Criterion (const Standard_Real U);

		/****************** G2Criterion ******************/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "* Returns the G2 criterion at the parametric point U on the curve. This is the greatest difference in curvature allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface
	:param U:
	:type U: float
	:rtype: float") G2Criterion;
		Standard_Real G2Criterion (const Standard_Real U);

		/****************** GeomPlate_CurveConstraint ******************/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "* Initializes an empty curve constraint object.
	:rtype: None") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint ();

		/****************** GeomPlate_CurveConstraint ******************/
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "* Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion. Raises ConstructionError if Order is not -1 , 0, 1, 2
	:param Boundary:
	:type Boundary: Adaptor3d_HCurve
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
	:rtype: None") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint (const opencascade::handle<Adaptor3d_HCurve> & Boundary,const Standard_Integer Order,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);

		/****************** LPropSurf ******************/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", ":param U:
	:type U: float
	:rtype: GeomLProp_SLProps") LPropSurf;
		GeomLProp_SLProps & LPropSurf (const Standard_Real U);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", ":rtype: float") Length;
		Standard_Real Length ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of points on the curve used as a constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Order ******************/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "* Returns the order of constraint, one of G0, G1 or G2.
	:rtype: int") Order;
		Standard_Integer Order ();

		/****************** ProjectedCurve ******************/
		%feature("compactdefaultargs") ProjectedCurve;
		%feature("autodoc", "* Returns the projected curve resulting from the normal projection of the curve on the initial surface
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") ProjectedCurve;
		opencascade::handle<Adaptor2d_HCurve2d> ProjectedCurve ();

		/****************** SetCurve2dOnSurf ******************/
		%feature("compactdefaultargs") SetCurve2dOnSurf;
		%feature("autodoc", "* loads a 2d curve associated the surface resulting of the constraints
	:param Curve2d:
	:type Curve2d: Geom2d_Curve
	:rtype: None") SetCurve2dOnSurf;
		void SetCurve2dOnSurf (const opencascade::handle<Geom2d_Curve> & Curve2d);

		/****************** SetG0Criterion ******************/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "* Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface for each point of the constraint. If this criterion is not set, TolDist, the distance tolerance from the constructor, is used.
	:param G0Crit:
	:type G0Crit: Law_Function
	:rtype: None") SetG0Criterion;
		void SetG0Criterion (const opencascade::handle<Law_Function> & G0Crit);

		/****************** SetG1Criterion ******************/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "* Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the curve is not on a surface
	:param G1Crit:
	:type G1Crit: Law_Function
	:rtype: None") SetG1Criterion;
		void SetG1Criterion (const opencascade::handle<Law_Function> & G1Crit);

		/****************** SetG2Criterion ******************/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", ":param G2Crit:
	:type G2Crit: Law_Function
	:rtype: None") SetG2Criterion;
		void SetG2Criterion (const opencascade::handle<Law_Function> & G2Crit);

		/****************** SetNbPoints ******************/
		%feature("compactdefaultargs") SetNbPoints;
		%feature("autodoc", "* Allows you to set the number of points on the curve constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.
	:param NewNb:
	:type NewNb: int
	:rtype: None") SetNbPoints;
		void SetNbPoints (const Standard_Integer NewNb);

		/****************** SetOrder ******************/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "* Allows you to set the order of continuity required for the constraints: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.
	:param Order:
	:type Order: int
	:rtype: None") SetOrder;
		void SetOrder (const Standard_Integer Order);

		/****************** SetProjectedCurve ******************/
		%feature("compactdefaultargs") SetProjectedCurve;
		%feature("autodoc", "* loads a 2d curve resulting from the normal projection of the curve on the initial surface
	:param Curve2d:
	:type Curve2d: Adaptor2d_HCurve2d
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None") SetProjectedCurve;
		void SetProjectedCurve (const opencascade::handle<Adaptor2d_HCurve2d> & Curve2d,const Standard_Real TolU,const Standard_Real TolV);

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
		/****************** ApproxError ******************/
		%feature("compactdefaultargs") ApproxError;
		%feature("autodoc", "* Returns the error in computation of the approximation surface. This is the distance between the entire target BSpline surface and the entire original surface generated by BuildPlateSurface and converted by GeomPlate_Surface.
	:rtype: float") ApproxError;
		Standard_Real ApproxError ();

		/****************** CriterionError ******************/
		%feature("compactdefaultargs") CriterionError;
		%feature("autodoc", "* Returns the criterion error in computation of the approximation surface. This is estimated relative to the curve and point constraints only.
	:rtype: float") CriterionError;
		Standard_Real CriterionError ();

		/****************** GeomPlate_MakeApprox ******************/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "* Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible the criterion CritPlate is satisfied if possible
	:param SurfPlate:
	:type SurfPlate: GeomPlate_Surface
	:param PlateCrit:
	:type PlateCrit: AdvApp2Var_Criterion
	:param Tol3d:
	:type Tol3d: float
	:param Nbmax:
	:type Nbmax: int
	:param dgmax:
	:type dgmax: int
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param EnlargeCoeff: default value is 1.1
	:type EnlargeCoeff: float
	:rtype: None") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox (const opencascade::handle<GeomPlate_Surface> & SurfPlate,const AdvApp2Var_Criterion & PlateCrit,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);

		/****************** GeomPlate_MakeApprox ******************/
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "* Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible if CritOrder = -1 , no criterion is used if CritOrder = 0 , a PlateG0Criterion is used with max value > 10*dmax if CritOrder = 1 , a PlateG1Criterion is used with max value > 10*dmax WARNING : for CritOrder = 0 or 1, only the constraints points of SurfPlate are used to evaluate the value of the criterion
	:param SurfPlate:
	:type SurfPlate: GeomPlate_Surface
	:param Tol3d:
	:type Tol3d: float
	:param Nbmax:
	:type Nbmax: int
	:param dgmax:
	:type dgmax: int
	:param dmax:
	:type dmax: float
	:param CritOrder: default value is 0
	:type CritOrder: int
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param EnlargeCoeff: default value is 1.1
	:type EnlargeCoeff: float
	:rtype: None") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox (const opencascade::handle<GeomPlate_Surface> & SurfPlate,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const Standard_Real dmax,const Standard_Integer CritOrder = 0,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the BSpline surface extracted from the GeomPlate_MakeApprox object.
	:rtype: opencascade::handle<Geom_BSplineSurface>") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface ();

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
		%feature("compactdefaultargs") GeomPlate_PlateG0Criterion;
		%feature("autodoc", ":param Data:
	:type Data: TColgp_SequenceOfXY
	:param G0Data:
	:type G0Data: TColgp_SequenceOfXYZ
	:param Maximum:
	:type Maximum: float
	:param Type: default value is AdvApp2Var_Absolute
	:type Type: AdvApp2Var_CriterionType
	:param Repart: default value is AdvApp2Var_Regular
	:type Repart: AdvApp2Var_CriterionRepartition
	:rtype: None") GeomPlate_PlateG0Criterion;
		 GeomPlate_PlateG0Criterion (const TColgp_SequenceOfXY & Data,const TColgp_SequenceOfXYZ & G0Data,const Standard_Real Maximum,const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute,const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****************** IsSatisfied ******************/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", ":param P:
	:type P: AdvApp2Var_Patch
	:rtype: bool") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param P:
	:type P: AdvApp2Var_Patch
	:param C:
	:type C: AdvApp2Var_Context
	:rtype: void") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);

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
		%feature("compactdefaultargs") GeomPlate_PlateG1Criterion;
		%feature("autodoc", ":param Data:
	:type Data: TColgp_SequenceOfXY
	:param G1Data:
	:type G1Data: TColgp_SequenceOfXYZ
	:param Maximum:
	:type Maximum: float
	:param Type: default value is AdvApp2Var_Absolute
	:type Type: AdvApp2Var_CriterionType
	:param Repart: default value is AdvApp2Var_Regular
	:type Repart: AdvApp2Var_CriterionRepartition
	:rtype: None") GeomPlate_PlateG1Criterion;
		 GeomPlate_PlateG1Criterion (const TColgp_SequenceOfXY & Data,const TColgp_SequenceOfXYZ & G1Data,const Standard_Real Maximum,const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute,const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);

		/****************** IsSatisfied ******************/
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", ":param P:
	:type P: AdvApp2Var_Patch
	:rtype: bool") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param P:
	:type P: AdvApp2Var_Patch
	:param C:
	:type C: AdvApp2Var_Context
	:rtype: void") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);

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
		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D1;
		void D1 (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:param V4:
	:type V4: gp_Vec
	:param V5:
	:type V5: gp_Vec
	:rtype: None") D2;
		void D2 (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3,gp_Vec & V4,gp_Vec & V5);

		/****************** G0Criterion ******************/
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "* Returns the G0 criterion. This is the greatest distance allowed between the constraint and the target surface.
	:rtype: float") G0Criterion;
		Standard_Real G0Criterion ();

		/****************** G1Criterion ******************/
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "* Returns the G1 criterion. This is the greatest angle allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface.
	:rtype: float") G1Criterion;
		Standard_Real G1Criterion ();

		/****************** G2Criterion ******************/
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "* Returns the G2 criterion. This is the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface
	:rtype: float") G2Criterion;
		Standard_Real G2Criterion ();

		/****************** GeomPlate_PointConstraint ******************/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "* Constructs a point constraint object defined by Pt, a 3D point Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor, only TolDist is given. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if Order is not 0 or -1
	:param Pt:
	:type Pt: gp_Pnt
	:param Order:
	:type Order: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:rtype: None") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint (const gp_Pnt & Pt,const Standard_Integer Order,const Standard_Real TolDist = 0.0001);

		/****************** GeomPlate_PointConstraint ******************/
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "* Constructs a point constraint object defined by the intersection point of U and V on the surface Surf. Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor the surface to be generated must respect several tolerance values only: - the distance tolerance TolDist - the angular tolerance TolAng - the curvature tolerance, TolCurv. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface.Creates a punctual constraint.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Surf:
	:type Surf: Geom_Surface
	:param Order:
	:type Order: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:rtype: None") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint (const Standard_Real U,const Standard_Real V,const opencascade::handle<Geom_Surface> & Surf,const Standard_Integer Order,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);

		/****************** HasPnt2dOnSurf ******************/
		%feature("compactdefaultargs") HasPnt2dOnSurf;
		%feature("autodoc", ":rtype: bool") HasPnt2dOnSurf;
		Standard_Boolean HasPnt2dOnSurf ();

		/****************** LPropSurf ******************/
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", ":rtype: GeomLProp_SLProps") LPropSurf;
		GeomLProp_SLProps & LPropSurf ();

		/****************** Order ******************/
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "* Returns the order of constraint: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.
	:rtype: int") Order;
		Standard_Integer Order ();

		/****************** Pnt2dOnSurf ******************/
		%feature("compactdefaultargs") Pnt2dOnSurf;
		%feature("autodoc", ":rtype: gp_Pnt2d") Pnt2dOnSurf;
		gp_Pnt2d Pnt2dOnSurf ();

		/****************** SetG0Criterion ******************/
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "* Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface. If this criterion is not set, {TolDist, the distance tolerance from the constructor, is used
	:param TolDist:
	:type TolDist: float
	:rtype: None") SetG0Criterion;
		void SetG0Criterion (const Standard_Real TolDist);

		/****************** SetG1Criterion ******************/
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "* Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface
	:param TolAng:
	:type TolAng: float
	:rtype: None") SetG1Criterion;
		void SetG1Criterion (const Standard_Real TolAng);

		/****************** SetG2Criterion ******************/
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "* Allows you to set the G2 criterion. This is the law defining the greatest difference in curvature allowed between the constraint and the target surface. If this criterion is not set, TolCurv, the curvature tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface
	:param TolCurv:
	:type TolCurv: float
	:rtype: None") SetG2Criterion;
		void SetG2Criterion (const Standard_Real TolCurv);

		/****************** SetOrder ******************/
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", ":param Order:
	:type Order: int
	:rtype: None") SetOrder;
		void SetOrder (const Standard_Integer Order);

		/****************** SetPnt2dOnSurf ******************/
		%feature("compactdefaultargs") SetPnt2dOnSurf;
		%feature("autodoc", ":param Pnt:
	:type Pnt: gp_Pnt2d
	:rtype: None") SetPnt2dOnSurf;
		void SetPnt2dOnSurf (const gp_Pnt2d & Pnt);

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
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", ":param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CallSurfinit ******************/
		%feature("compactdefaultargs") CallSurfinit;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") CallSurfinit;
		opencascade::handle<Geom_Surface> CallSurfinit ();

		/****************** Constraints ******************/
		%feature("compactdefaultargs") Constraints;
		%feature("autodoc", ":param Seq:
	:type Seq: TColgp_SequenceOfXY
	:rtype: None") Constraints;
		void Constraints (TColgp_SequenceOfXY & Seq);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Global Continuity of the surface in direction U and V : C0 : only geometric continuity, C1 : continuity of the first derivative all along the surface, C2 : continuity of the second derivative all along the surface, C3 : continuity of the third derivative all along the surface, G1 : tangency continuity all along the surface, G2 : curvature continuity all along the surface, CN : the order of continuity is infinite. Example : If the surface is C1 in the V parametric direction and C2 in the U parametric direction Shape = C1.
	:rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Geometry>") Copy;
		opencascade::handle<Geom_Geometry> Copy ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U,V on the surface. //! Raised only for an 'OffsetSurface' if it is not possible to compute the current point.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point P and the first derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C1.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point P, the first and the second derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point P, the first,the second and the third derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* ---Purpose ; Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Raised if the continuity of the surface is not CNu in the U direction or not CNv in the V direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** GeomPlate_Surface ******************/
		%feature("compactdefaultargs") GeomPlate_Surface;
		%feature("autodoc", ":param Surfinit:
	:type Surfinit: Geom_Surface
	:param Surfinter:
	:type Surfinter: Plate_Plate
	:rtype: None") GeomPlate_Surface;
		 GeomPlate_Surface (const opencascade::handle<Geom_Surface> & Surfinit,const Plate_Plate & Surfinter);

		/****************** IsCNu ******************/
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "* Returns the order of continuity of the surface in the U parametric direction. Raised if N < 0.
	:param N:
	:type N: int
	:rtype: bool") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);

		/****************** IsCNv ******************/
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "* Returns the order of continuity of the surface in the V parametric direction. Raised if N < 0.
	:param N:
	:type N: int
	:rtype: bool") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "* Is the surface closed in the parametric direction U ? Returns True if for each parameter V the distance between the point P (UFirst, V) and P (ULast, V) is lower or equal to Resolution from gp. UFirst and ULast are the parametric bounds in the U direction.
	:rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "* Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied : for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.
	:rtype: bool") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "* Is the surface closed in the parametric direction V ? Returns True if for each parameter U the distance between the point P (U, VFirst) and P (U, VLast) is lower or equal to Resolution from gp. VFirst and VLast are the parametric bounds in the V direction.
	:rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "* Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied : for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.
	:rtype: bool") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "* Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->Transformed(T)->Value(U',V') //! is the same point as //! me->Value(U,V).Transformed(T) //! Where U',V' are obtained by transforming U,V with th 2d transformation returned by //! me->ParametricTransformation(T) //! This methods returns an identity transformation //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
	:param T:
	:type T: gp_Trsf
	:rtype: gp_GTrsf2d") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);

		/****************** RealBounds ******************/
		%feature("compactdefaultargs") RealBounds;
		%feature("autodoc", ":param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None") RealBounds;
		void RealBounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetBounds ******************/
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", ":param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: None") SetBounds;
		void SetBounds (const Standard_Real Umin,const Standard_Real Umax,const Standard_Real Vmin,const Standard_Real Vmax);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Transformation of a geometric object. This tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class Transformation of the package Geom).
	:param T:
	:type T: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & T);

		/****************** TransformParameters ******************/
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "* Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. //! me->Transformed(T)->Value(U',V') //! is the same point as //! me->Value(U,V).Transformed(T) //! Where U',V' are the new values of U,V after calling //! me->TranformParameters(U,V,T) //! This methods does not change <U> and <V> //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param T:
	:type T: gp_Trsf
	:rtype: void") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);

		/****************** UIso ******************/
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "* Computes the U isoparametric curve.
	:param U:
	:type U: float
	:rtype: opencascade::handle<Geom_Curve>") UIso;
		opencascade::handle<Geom_Curve> UIso (const Standard_Real U);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "* returns the Uperiod. raises if the surface is not uperiodic.
	:rtype: float") UPeriod;
		virtual Standard_Real UPeriod ();

		/****************** UReverse ******************/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "* Reverses the U direction of parametrization of <self>. The bounds of the surface are not modified.
	:rtype: None") UReverse;
		void UReverse ();

		/****************** UReversedParameter ******************/
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "* Return the parameter on the Ureversed surface for the point of parameter U on <self>. //! me->UReversed()->Value(me->UReversedParameter(U),V) //! is the same point as //! me->Value(U,V)
	:param U:
	:type U: float
	:rtype: float") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);

		/****************** VIso ******************/
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "* Computes the V isoparametric curve.
	:param V:
	:type V: float
	:rtype: opencascade::handle<Geom_Curve>") VIso;
		opencascade::handle<Geom_Curve> VIso (const Standard_Real V);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "* returns the Vperiod. raises if the surface is not vperiodic.
	:rtype: float") VPeriod;
		virtual Standard_Real VPeriod ();

		/****************** VReverse ******************/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "* Reverses the V direction of parametrization of <self>. The bounds of the surface are not modified.
	:rtype: None") VReverse;
		void VReverse ();

		/****************** VReversedParameter ******************/
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "* Return the parameter on the Vreversed surface for the point of parameter V on <self>. //! me->VReversed()->Value(U,me->VReversedParameter(V)) //! is the same point as //! me->Value(U,V)
	:param V:
	:type V: float
	:rtype: float") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);

};


%make_alias(GeomPlate_Surface)

%extend GeomPlate_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class GeomPlate_HArray1OfSequenceOfReal : public  GeomPlate_Array1OfSequenceOfReal, public Standard_Transient {
  public:
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfSequenceOfReal(const Standard_Integer theLower, const Standard_Integer theUpper, const  GeomPlate_Array1OfSequenceOfReal::value_type& theValue);
    GeomPlate_HArray1OfSequenceOfReal(const  GeomPlate_Array1OfSequenceOfReal& theOther);
    const  GeomPlate_Array1OfSequenceOfReal& Array1();
     GeomPlate_Array1OfSequenceOfReal& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfSequenceOfReal)


class GeomPlate_HArray1OfHCurve : public  GeomPlate_Array1OfHCurve, public Standard_Transient {
  public:
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomPlate_HArray1OfHCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  GeomPlate_Array1OfHCurve::value_type& theValue);
    GeomPlate_HArray1OfHCurve(const  GeomPlate_Array1OfHCurve& theOther);
    const  GeomPlate_Array1OfHCurve& Array1();
     GeomPlate_Array1OfHCurve& ChangeArray1();
};
%make_alias(GeomPlate_HArray1OfHCurve)


/* harray2 classes */
/* hsequence classes */
class GeomPlate_HSequenceOfPointConstraint : public  GeomPlate_SequenceOfPointConstraint, public Standard_Transient {
  public:
    GeomPlate_HSequenceOfPointConstraint();
    GeomPlate_HSequenceOfPointConstraint(const  GeomPlate_SequenceOfPointConstraint& theOther);
    const  GeomPlate_SequenceOfPointConstraint& Sequence();
    void Append (const  GeomPlate_SequenceOfPointConstraint::value_type& theItem);
    void Append ( GeomPlate_SequenceOfPointConstraint& theSequence);
     GeomPlate_SequenceOfPointConstraint& ChangeSequence();
};
%make_alias(GeomPlate_HSequenceOfPointConstraint)


class GeomPlate_HSequenceOfCurveConstraint : public  GeomPlate_SequenceOfCurveConstraint, public Standard_Transient {
  public:
    GeomPlate_HSequenceOfCurveConstraint();
    GeomPlate_HSequenceOfCurveConstraint(const  GeomPlate_SequenceOfCurveConstraint& theOther);
    const  GeomPlate_SequenceOfCurveConstraint& Sequence();
    void Append (const  GeomPlate_SequenceOfCurveConstraint::value_type& theItem);
    void Append ( GeomPlate_SequenceOfCurveConstraint& theSequence);
     GeomPlate_SequenceOfCurveConstraint& ChangeSequence();
};
%make_alias(GeomPlate_HSequenceOfCurveConstraint)


