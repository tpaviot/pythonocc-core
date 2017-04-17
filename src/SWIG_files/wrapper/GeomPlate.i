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
%module (package="OCC") GeomPlate

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


%include GeomPlate_headers.i


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
/* end public enums declaration */

%nodefaultctor GeomPlate_Aij;
class GeomPlate_Aij {
	public:
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "	:rtype: None
") GeomPlate_Aij;
		 GeomPlate_Aij ();
		%feature("compactdefaultargs") GeomPlate_Aij;
		%feature("autodoc", "	:param anInd1:
	:type anInd1: int
	:param anInd2:
	:type anInd2: int
	:param aVec:
	:type aVec: gp_Vec
	:rtype: None
") GeomPlate_Aij;
		 GeomPlate_Aij (const Standard_Integer anInd1,const Standard_Integer anInd2,const gp_Vec & aVec);
};


%extend GeomPlate_Aij {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_Array1OfHCurveOnSurface;
class GeomPlate_Array1OfHCurveOnSurface {
	public:
		%feature("compactdefaultargs") GeomPlate_Array1OfHCurveOnSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomPlate_Array1OfHCurveOnSurface;
		 GeomPlate_Array1OfHCurveOnSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") GeomPlate_Array1OfHCurveOnSurface;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_Adaptor3d_HCurveOnSurface &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomPlate_Array1OfHCurveOnSurface;
		 GeomPlate_Array1OfHCurveOnSurface (const Handle_Adaptor3d_HCurveOnSurface & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HCurveOnSurface &
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HCurveOnSurface & V);
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
	:type Other: GeomPlate_Array1OfHCurveOnSurface &
	:rtype: GeomPlate_Array1OfHCurveOnSurface
") Assign;
		const GeomPlate_Array1OfHCurveOnSurface & Assign (const GeomPlate_Array1OfHCurveOnSurface & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_Array1OfHCurveOnSurface &
	:rtype: GeomPlate_Array1OfHCurveOnSurface
") operator =;
		const GeomPlate_Array1OfHCurveOnSurface & operator = (const GeomPlate_Array1OfHCurveOnSurface & Other);
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
	:type Value: Handle_Adaptor3d_HCurveOnSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HCurveOnSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HCurveOnSurface
") Value;
		Handle_Adaptor3d_HCurveOnSurface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HCurveOnSurface
") ChangeValue;
		Handle_Adaptor3d_HCurveOnSurface ChangeValue (const Standard_Integer Index);
};


%extend GeomPlate_Array1OfHCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_Array1OfSequenceOfReal;
class GeomPlate_Array1OfSequenceOfReal {
	public:
		%feature("compactdefaultargs") GeomPlate_Array1OfSequenceOfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomPlate_Array1OfSequenceOfReal;
		 GeomPlate_Array1OfSequenceOfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") GeomPlate_Array1OfSequenceOfReal;
		%feature("autodoc", "	:param Item:
	:type Item: TColStd_SequenceOfReal &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomPlate_Array1OfSequenceOfReal;
		 GeomPlate_Array1OfSequenceOfReal (const TColStd_SequenceOfReal & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TColStd_SequenceOfReal &
	:rtype: None
") Init;
		void Init (const TColStd_SequenceOfReal & V);
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
	:type Other: GeomPlate_Array1OfSequenceOfReal &
	:rtype: GeomPlate_Array1OfSequenceOfReal
") Assign;
		const GeomPlate_Array1OfSequenceOfReal & Assign (const GeomPlate_Array1OfSequenceOfReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_Array1OfSequenceOfReal &
	:rtype: GeomPlate_Array1OfSequenceOfReal
") operator =;
		const GeomPlate_Array1OfSequenceOfReal & operator = (const GeomPlate_Array1OfSequenceOfReal & Other);
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
	:type Value: TColStd_SequenceOfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfReal
") Value;
		const TColStd_SequenceOfReal & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfReal
") ChangeValue;
		TColStd_SequenceOfReal & ChangeValue (const Standard_Integer Index);
};


%extend GeomPlate_Array1OfSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_BuildAveragePlane;
class GeomPlate_BuildAveragePlane {
	public:
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "	* Tol is a Tolerance to make the difference between the result plane and the result line. if POption = 1 : automatical parametrisation if POption = 2 : parametrisation by eigen vectors if NOption = 1 : the average plane is the inertial plane. if NOption = 2 : the average plane is the plane of max. flux.

	:param Pts:
	:type Pts: Handle_TColgp_HArray1OfPnt
	:param NbBoundPoints:
	:type NbBoundPoints: int
	:param Tol:
	:type Tol: float
	:param POption:
	:type POption: int
	:param NOption:
	:type NOption: int
	:rtype: None
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane (const Handle_TColgp_HArray1OfPnt & Pts,const Standard_Integer NbBoundPoints,const Standard_Real Tol,const Standard_Integer POption,const Standard_Integer NOption);
		%feature("compactdefaultargs") GeomPlate_BuildAveragePlane;
		%feature("autodoc", "	* Creates the plane from the 'best vector'

	:param Normals:
	:type Normals: TColgp_SequenceOfVec
	:param Pts:
	:type Pts: Handle_TColgp_HArray1OfPnt
	:rtype: None
") GeomPlate_BuildAveragePlane;
		 GeomPlate_BuildAveragePlane (const TColgp_SequenceOfVec & Normals,const Handle_TColgp_HArray1OfPnt & Pts);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Return the average Plane.

	:rtype: Handle_Geom_Plane
") Plane;
		Handle_Geom_Plane Plane ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Return a Line when 2 eigenvalues are null.

	:rtype: Handle_Geom_Line
") Line;
		Handle_Geom_Line Line ();
		%feature("compactdefaultargs") IsPlane;
		%feature("autodoc", "	* return OK if is a plane.

	:rtype: bool
") IsPlane;
		Standard_Boolean IsPlane ();
		%feature("compactdefaultargs") IsLine;
		%feature("autodoc", "	* return OK if is a line.

	:rtype: bool
") IsLine;
		Standard_Boolean IsLine ();
		%feature("compactdefaultargs") MinMaxBox;
		%feature("autodoc", "	* computes the minimal box to include all normal projection points of the initial array on the plane.

	:param Umin:
	:type Umin: float &
	:param Umax:
	:type Umax: float &
	:param Vmin:
	:type Vmin: float &
	:param Vmax:
	:type Vmax: float &
	:rtype: None
") MinMaxBox;
		void MinMaxBox (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HalfSpace;
		%feature("autodoc", "	:param NewNormals:
	:type NewNormals: TColgp_SequenceOfVec
	:param Normals:
	:type Normals: TColgp_SequenceOfVec
	:param Bset:
	:type Bset: GeomPlate_SequenceOfAij &
	:param LinTol:
	:type LinTol: float
	:param AngTol:
	:type AngTol: float
	:rtype: bool
") HalfSpace;
		static Standard_Boolean HalfSpace (const TColgp_SequenceOfVec & NewNormals,TColgp_SequenceOfVec & Normals,GeomPlate_SequenceOfAij & Bset,const Standard_Real LinTol,const Standard_Real AngTol);
};


%extend GeomPlate_BuildAveragePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_BuildPlateSurface;
class GeomPlate_BuildPlateSurface {
	public:
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "	* Constructor compatible with the old version with this constructor the constraint are given in a Array of Curve on Surface The array NbPoints contains the number of points for each constraint. The Array Tang contains the order of constraint for each Constraint: The possible values for this order has to be -1 , 0 , 1 , 2 . Order i means constraint Gi. NbIter is the maximum number of iteration to optimise the number of points for resolution Degree is the degree of resolution for Plate Tol2d is the tolerance used to test if two points of different constraint are identical in the parametric space of the initial surface Tol3d is used to test if two identical points in the 2d space are identical in 3d space TolAng is used to compare the angle between normal of two identical points in the 2d space Raises ConstructionError;

	:param NPoints:
	:type NPoints: Handle_TColStd_HArray1OfInteger &
	:param TabCurve:
	:type TabCurve: Handle_GeomPlate_HArray1OfHCurveOnSurface &
	:param Tang:
	:type Tang: Handle_TColStd_HArray1OfInteger &
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
	:rtype: None
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Handle_TColStd_HArray1OfInteger & NPoints,const Handle_GeomPlate_HArray1OfHCurveOnSurface & TabCurve,const Handle_TColStd_HArray1OfInteger & Tang,const Standard_Integer Degree,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_Geom_Surface &
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
	:rtype: None
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Handle_Geom_Surface & Surf,const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 10,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);
		%feature("compactdefaultargs") GeomPlate_BuildPlateSurface;
		%feature("autodoc", "	* Initializes the BuildPlateSurface framework for deforming plate surfaces using curve and point constraints. You use the first constructor if you have an initial surface to work with at construction time. If not, you use the second. You can add one later by using the method LoadInitSurface. If no initial surface is loaded, one will automatically be computed. The curve and point constraints will be defined by using the method Add. Before the call to the algorithm, the curve constraints will be transformed into sequences of discrete points. Each curve defined as a constraint will be given the value of NbPtsOnCur as the average number of points on it. Several arguments serve to improve performance of the algorithm. NbIter, for example, expresses the number of iterations allowed and is used to control the duration of computation. To optimize resolution, Degree will have the default value of 3. The surface generated must respect several tolerance values: - 2d tolerance given by Tol2d, with a default value of 0.00001 - 3d tolerance expressed by Tol3d, with a default value of 0.0001 - angular tolerance given by TolAng, with a default value of 0.01, defining the greatest angle allowed between the constraint and the target surface. Exceptions Standard_ConstructionError if NbIter is less than 1 or Degree is less than 3.

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
	:rtype: None
") GeomPlate_BuildPlateSurface;
		 GeomPlate_BuildPlateSurface (const Standard_Integer Degree = 3,const Standard_Integer NbPtsOnCur = 10,const Standard_Integer NbIter = 3,const Standard_Real Tol2d = 0.00001,const Standard_Real Tol3d = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1,const Standard_Boolean Anisotropie = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Resets all constraints

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") LoadInitSurface;
		%feature("autodoc", "	* Loads the initial Surface

	:param Surf:
	:type Surf: Handle_Geom_Surface &
	:rtype: None
") LoadInitSurface;
		void LoadInitSurface (const Handle_Geom_Surface & Surf);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the linear constraint cont.

	:param Cont:
	:type Cont: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") Add;
		void Add (const Handle_GeomPlate_CurveConstraint & Cont);
		%feature("compactdefaultargs") SetNbBounds;
		%feature("autodoc", "	:param NbBounds:
	:type NbBounds: int
	:rtype: None
") SetNbBounds;
		void SetNbBounds (const Standard_Integer NbBounds);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the point constraint cont.

	:param Cont:
	:type Cont: Handle_GeomPlate_PointConstraint &
	:rtype: None
") Add;
		void Add (const Handle_GeomPlate_PointConstraint & Cont);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Calls the algorithm and computes the plate surface using the loaded constraints. If no initial surface is given, the algorithm automatically computes one. Exceptions Standard_RangeError if the value of the constraint is null or if plate is not done.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") CurveConstraint;
		%feature("autodoc", "	* returns the CurveConstraints of order order

	:param order:
	:type order: int
	:rtype: Handle_GeomPlate_CurveConstraint
") CurveConstraint;
		Handle_GeomPlate_CurveConstraint CurveConstraint (const Standard_Integer order);
		%feature("compactdefaultargs") PointConstraint;
		%feature("autodoc", "	* returns the PointConstraint of order order

	:param order:
	:type order: int
	:rtype: Handle_GeomPlate_PointConstraint
") PointConstraint;
		Handle_GeomPlate_PointConstraint PointConstraint (const Standard_Integer order);
		%feature("compactdefaultargs") Disc2dContour;
		%feature("autodoc", "	:param nbp:
	:type nbp: int
	:param Seq2d:
	:type Seq2d: TColgp_SequenceOfXY
	:rtype: None
") Disc2dContour;
		void Disc2dContour (const Standard_Integer nbp,TColgp_SequenceOfXY & Seq2d);
		%feature("compactdefaultargs") Disc3dContour;
		%feature("autodoc", "	:param nbp:
	:type nbp: int
	:param iordre:
	:type iordre: int
	:param Seq3d:
	:type Seq3d: TColgp_SequenceOfXYZ
	:rtype: None
") Disc3dContour;
		void Disc3dContour (const Standard_Integer nbp,const Standard_Integer iordre,TColgp_SequenceOfXYZ & Seq3d);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Tests whether computation of the plate has been completed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the result of the computation. This surface can then be used by GeomPlate_MakeApprox for converting the resulting surface into a BSpline.

	:rtype: Handle_GeomPlate_Surface
") Surface;
		Handle_GeomPlate_Surface Surface ();
		%feature("compactdefaultargs") SurfInit;
		%feature("autodoc", "	* Returns the initial surface

	:rtype: Handle_Geom_Surface
") SurfInit;
		Handle_Geom_Surface SurfInit ();
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "	* Allows you to ensure that the array of curves returned by Curves2d has the correct orientation. Returns the orientation of the curves in the the array returned by Curves2d. Computation changes the orientation of these curves. Consequently, this method returns the orientation prior to computation.

	:rtype: Handle_TColStd_HArray1OfInteger
") Sense;
		Handle_TColStd_HArray1OfInteger Sense ();
		%feature("compactdefaultargs") Curves2d;
		%feature("autodoc", "	* Extracts the array of curves on the plate surface which correspond to the curve constraints set in Add.

	:rtype: Handle_TColGeom2d_HArray1OfCurve
") Curves2d;
		Handle_TColGeom2d_HArray1OfCurve Curves2d ();
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "	* Returns the order of the curves in the array returned by Curves2d. Computation changes this order. Consequently, this method returns the order of the curves prior to computation.

	:rtype: Handle_TColStd_HArray1OfInteger
") Order;
		Handle_TColStd_HArray1OfInteger Order ();
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "	* Returns the max distance betwen the result and the constraints

	:rtype: float
") G0Error;
		Standard_Real G0Error ();
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "	* Returns the max angle betwen the result and the constraints

	:rtype: float
") G1Error;
		Standard_Real G1Error ();
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "	* Returns the max difference of curvature betwen the result and the constraints

	:rtype: float
") G2Error;
		Standard_Real G2Error ();
		%feature("compactdefaultargs") G0Error;
		%feature("autodoc", "	* Returns the max distance between the result and the constraint Index

	:param Index:
	:type Index: int
	:rtype: float
") G0Error;
		Standard_Real G0Error (const Standard_Integer Index);
		%feature("compactdefaultargs") G1Error;
		%feature("autodoc", "	* Returns the max angle between the result and the constraint Index

	:param Index:
	:type Index: int
	:rtype: float
") G1Error;
		Standard_Real G1Error (const Standard_Integer Index);
		%feature("compactdefaultargs") G2Error;
		%feature("autodoc", "	* Returns the max difference of curvature between the result and the constraint Index

	:param Index:
	:type Index: int
	:rtype: float
") G2Error;
		Standard_Real G2Error (const Standard_Integer Index);
};


%extend GeomPlate_BuildPlateSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_CurveConstraint;
class GeomPlate_CurveConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "	* Initializes an empty curve constraint object.

	:rtype: None
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint ();
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "	* Create a constraint Order is the order of the constraint. The possible values for order are -1,0,1,2. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints TolAng is the maximum error to satisfy for G1 constraints TolCurv is the maximum error to satisfy for G2 constraints These errors can be replaced by laws of criterion. Raises ConstructionError if Order is not -1 , 0, 1, 2

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
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint (const Handle_Adaptor3d_HCurveOnSurface & Boundary,const Standard_Integer Order,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("compactdefaultargs") GeomPlate_CurveConstraint;
		%feature("autodoc", "	* Create a constraint Order is the order of the constraint. The possible values for order are -1,0. Order i means constraints Gi Npt is the number of points associated with the constraint. TolDist is the maximum error to satisfy for G0 constraints These errors can be replaced by laws of criterion. Raises ConstructionError if Order is not 0 or -1

	:param Boundary:
	:type Boundary: Handle_Adaptor3d_HCurve &
	:param Tang:
	:type Tang: int
	:param NPt: default value is 10
	:type NPt: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:rtype: None
") GeomPlate_CurveConstraint;
		 GeomPlate_CurveConstraint (const Handle_Adaptor3d_HCurve & Boundary,const Standard_Integer Tang,const Standard_Integer NPt = 10,const Standard_Real TolDist = 0.0001);
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "	* Allows you to set the order of continuity required for the constraints: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.

	:param Order:
	:type Order: int
	:rtype: None
") SetOrder;
		void SetOrder (const Standard_Integer Order);
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "	* Returns the order of constraint, one of G0, G1 or G2.

	:rtype: int
") Order;
		Standard_Integer Order ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of points on the curve used as a constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") SetNbPoints;
		%feature("autodoc", "	* Allows you to set the number of points on the curve constraint. The default setting is 10. This parameter affects computation time, which increases by the cube of the number of points.

	:param NewNb:
	:type NewNb: int
	:rtype: None
") SetNbPoints;
		void SetNbPoints (const Standard_Integer NewNb);
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "	* Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface for each point of the constraint. If this criterion is not set, TolDist, the distance tolerance from the constructor, is used.

	:param G0Crit:
	:type G0Crit: Handle_Law_Function &
	:rtype: None
") SetG0Criterion;
		void SetG0Criterion (const Handle_Law_Function & G0Crit);
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "	* Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the curve is not on a surface

	:param G1Crit:
	:type G1Crit: Handle_Law_Function &
	:rtype: None
") SetG1Criterion;
		void SetG1Criterion (const Handle_Law_Function & G1Crit);
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "	:param G2Crit:
	:type G2Crit: Handle_Law_Function &
	:rtype: None
") SetG2Criterion;
		void SetG2Criterion (const Handle_Law_Function & G2Crit);
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "	* Returns the G0 criterion at the parametric point U on the curve. This is the greatest distance allowed between the constraint and the target surface at U.

	:param U:
	:type U: float
	:rtype: float
") G0Criterion;
		Standard_Real G0Criterion (const Standard_Real U);
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "	* Returns the G1 criterion at the parametric point U on the curve. This is the greatest angle allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface

	:param U:
	:type U: float
	:rtype: float
") G1Criterion;
		Standard_Real G1Criterion (const Standard_Real U);
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "	* Returns the G2 criterion at the parametric point U on the curve. This is the greatest difference in curvature allowed between the constraint and the target surface at U. Raises ConstructionError if the curve is not on a surface

	:param U:
	:type U: float
	:rtype: float
") G2Criterion;
		Standard_Real G2Criterion (const Standard_Real U);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: float
") Length;
		Standard_Real Length ();
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: GeomLProp_SLProps
") LPropSurf;
		GeomLProp_SLProps & LPropSurf (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
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
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3,gp_Vec & V4,gp_Vec & V5);
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") Curve3d;
		Handle_Adaptor3d_HCurve Curve3d ();
		%feature("compactdefaultargs") SetCurve2dOnSurf;
		%feature("autodoc", "	* loads a 2d curve associated the surface resulting of the constraints

	:param Curve2d:
	:type Curve2d: Handle_Geom2d_Curve &
	:rtype: None
") SetCurve2dOnSurf;
		void SetCurve2dOnSurf (const Handle_Geom2d_Curve & Curve2d);
		%feature("compactdefaultargs") Curve2dOnSurf;
		%feature("autodoc", "	* Returns a 2d curve associated the surface resulting of the constraints

	:rtype: Handle_Geom2d_Curve
") Curve2dOnSurf;
		Handle_Geom2d_Curve Curve2dOnSurf ();
		%feature("compactdefaultargs") SetProjectedCurve;
		%feature("autodoc", "	* loads a 2d curve resulting from the normal projection of the curve on the initial surface

	:param Curve2d:
	:type Curve2d: Handle_Adaptor2d_HCurve2d &
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: None
") SetProjectedCurve;
		void SetProjectedCurve (const Handle_Adaptor2d_HCurve2d & Curve2d,const Standard_Real TolU,const Standard_Real TolV);
		%feature("compactdefaultargs") ProjectedCurve;
		%feature("autodoc", "	* Returns the projected curve resulting from the normal projection of the curve on the initial surface

	:rtype: Handle_Adaptor2d_HCurve2d
") ProjectedCurve;
		Handle_Adaptor2d_HCurve2d ProjectedCurve ();
};


%extend GeomPlate_CurveConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_CurveConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_CurveConstraint::Handle_GeomPlate_CurveConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_CurveConstraint;
class Handle_GeomPlate_CurveConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_CurveConstraint();
        Handle_GeomPlate_CurveConstraint(const Handle_GeomPlate_CurveConstraint &aHandle);
        Handle_GeomPlate_CurveConstraint(const GeomPlate_CurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_CurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_CurveConstraint {
    GeomPlate_CurveConstraint* _get_reference() {
    return (GeomPlate_CurveConstraint*)$self->Access();
    }
};

%extend Handle_GeomPlate_CurveConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_CurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_HArray1OfHCurveOnSurface;
class GeomPlate_HArray1OfHCurveOnSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomPlate_HArray1OfHCurveOnSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomPlate_HArray1OfHCurveOnSurface;
		 GeomPlate_HArray1OfHCurveOnSurface (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") GeomPlate_HArray1OfHCurveOnSurface;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_Adaptor3d_HCurveOnSurface &
	:rtype: None
") GeomPlate_HArray1OfHCurveOnSurface;
		 GeomPlate_HArray1OfHCurveOnSurface (const Standard_Integer Low,const Standard_Integer Up,const Handle_Adaptor3d_HCurveOnSurface & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_Adaptor3d_HCurveOnSurface &
	:rtype: None
") Init;
		void Init (const Handle_Adaptor3d_HCurveOnSurface & V);
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
	:type Value: Handle_Adaptor3d_HCurveOnSurface &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Adaptor3d_HCurveOnSurface & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HCurveOnSurface
") Value;
		Handle_Adaptor3d_HCurveOnSurface Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Adaptor3d_HCurveOnSurface
") ChangeValue;
		Handle_Adaptor3d_HCurveOnSurface ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: GeomPlate_Array1OfHCurveOnSurface
") Array1;
		const GeomPlate_Array1OfHCurveOnSurface & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: GeomPlate_Array1OfHCurveOnSurface
") ChangeArray1;
		GeomPlate_Array1OfHCurveOnSurface & ChangeArray1 ();
};


%extend GeomPlate_HArray1OfHCurveOnSurface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_HArray1OfHCurveOnSurface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_HArray1OfHCurveOnSurface::Handle_GeomPlate_HArray1OfHCurveOnSurface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_HArray1OfHCurveOnSurface;
class Handle_GeomPlate_HArray1OfHCurveOnSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HArray1OfHCurveOnSurface();
        Handle_GeomPlate_HArray1OfHCurveOnSurface(const Handle_GeomPlate_HArray1OfHCurveOnSurface &aHandle);
        Handle_GeomPlate_HArray1OfHCurveOnSurface(const GeomPlate_HArray1OfHCurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HArray1OfHCurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HArray1OfHCurveOnSurface {
    GeomPlate_HArray1OfHCurveOnSurface* _get_reference() {
    return (GeomPlate_HArray1OfHCurveOnSurface*)$self->Access();
    }
};

%extend Handle_GeomPlate_HArray1OfHCurveOnSurface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_HArray1OfHCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_HArray1OfSequenceOfReal;
class GeomPlate_HArray1OfSequenceOfReal : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomPlate_HArray1OfSequenceOfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") GeomPlate_HArray1OfSequenceOfReal;
		 GeomPlate_HArray1OfSequenceOfReal (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") GeomPlate_HArray1OfSequenceOfReal;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: TColStd_SequenceOfReal &
	:rtype: None
") GeomPlate_HArray1OfSequenceOfReal;
		 GeomPlate_HArray1OfSequenceOfReal (const Standard_Integer Low,const Standard_Integer Up,const TColStd_SequenceOfReal & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: TColStd_SequenceOfReal &
	:rtype: None
") Init;
		void Init (const TColStd_SequenceOfReal & V);
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
	:type Value: TColStd_SequenceOfReal &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const TColStd_SequenceOfReal & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfReal
") Value;
		const TColStd_SequenceOfReal & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: TColStd_SequenceOfReal
") ChangeValue;
		TColStd_SequenceOfReal & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: GeomPlate_Array1OfSequenceOfReal
") Array1;
		const GeomPlate_Array1OfSequenceOfReal & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: GeomPlate_Array1OfSequenceOfReal
") ChangeArray1;
		GeomPlate_Array1OfSequenceOfReal & ChangeArray1 ();
};


%extend GeomPlate_HArray1OfSequenceOfReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_HArray1OfSequenceOfReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_HArray1OfSequenceOfReal::Handle_GeomPlate_HArray1OfSequenceOfReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_HArray1OfSequenceOfReal;
class Handle_GeomPlate_HArray1OfSequenceOfReal : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HArray1OfSequenceOfReal();
        Handle_GeomPlate_HArray1OfSequenceOfReal(const Handle_GeomPlate_HArray1OfSequenceOfReal &aHandle);
        Handle_GeomPlate_HArray1OfSequenceOfReal(const GeomPlate_HArray1OfSequenceOfReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HArray1OfSequenceOfReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HArray1OfSequenceOfReal {
    GeomPlate_HArray1OfSequenceOfReal* _get_reference() {
    return (GeomPlate_HArray1OfSequenceOfReal*)$self->Access();
    }
};

%extend Handle_GeomPlate_HArray1OfSequenceOfReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_HArray1OfSequenceOfReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_HSequenceOfCurveConstraint;
class GeomPlate_HSequenceOfCurveConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomPlate_HSequenceOfCurveConstraint;
		%feature("autodoc", "	:rtype: None
") GeomPlate_HSequenceOfCurveConstraint;
		 GeomPlate_HSequenceOfCurveConstraint ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") Append;
		void Append (const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfCurveConstraint &
	:rtype: None
") Append;
		void Append (const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfCurveConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfCurveConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfCurveConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfCurveConstraint & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_GeomPlate_HSequenceOfCurveConstraint
") Split;
		Handle_GeomPlate_HSequenceOfCurveConstraint Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_GeomPlate_CurveConstraint & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_GeomPlate_CurveConstraint
") Value;
		Handle_GeomPlate_CurveConstraint Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_GeomPlate_CurveConstraint
") ChangeValue;
		Handle_GeomPlate_CurveConstraint ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: GeomPlate_SequenceOfCurveConstraint
") Sequence;
		const GeomPlate_SequenceOfCurveConstraint & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: GeomPlate_SequenceOfCurveConstraint
") ChangeSequence;
		GeomPlate_SequenceOfCurveConstraint & ChangeSequence ();
};


%extend GeomPlate_HSequenceOfCurveConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_HSequenceOfCurveConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_HSequenceOfCurveConstraint::Handle_GeomPlate_HSequenceOfCurveConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_HSequenceOfCurveConstraint;
class Handle_GeomPlate_HSequenceOfCurveConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HSequenceOfCurveConstraint();
        Handle_GeomPlate_HSequenceOfCurveConstraint(const Handle_GeomPlate_HSequenceOfCurveConstraint &aHandle);
        Handle_GeomPlate_HSequenceOfCurveConstraint(const GeomPlate_HSequenceOfCurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HSequenceOfCurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HSequenceOfCurveConstraint {
    GeomPlate_HSequenceOfCurveConstraint* _get_reference() {
    return (GeomPlate_HSequenceOfCurveConstraint*)$self->Access();
    }
};

%extend Handle_GeomPlate_HSequenceOfCurveConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_HSequenceOfCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_HSequenceOfPointConstraint;
class GeomPlate_HSequenceOfPointConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomPlate_HSequenceOfPointConstraint;
		%feature("autodoc", "	:rtype: None
") GeomPlate_HSequenceOfPointConstraint;
		 GeomPlate_HSequenceOfPointConstraint ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_GeomPlate_PointConstraint &
	:rtype: None
") Append;
		void Append (const Handle_GeomPlate_PointConstraint & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfPointConstraint &
	:rtype: None
") Append;
		void Append (const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_GeomPlate_PointConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GeomPlate_PointConstraint & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfPointConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_GeomPlate_PointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_PointConstraint & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfPointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_GeomPlate_PointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_PointConstraint & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_GeomPlate_HSequenceOfPointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_GeomPlate_HSequenceOfPointConstraint & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_GeomPlate_HSequenceOfPointConstraint
") Split;
		Handle_GeomPlate_HSequenceOfPointConstraint Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_GeomPlate_PointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_GeomPlate_PointConstraint & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_GeomPlate_PointConstraint
") Value;
		Handle_GeomPlate_PointConstraint Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_GeomPlate_PointConstraint
") ChangeValue;
		Handle_GeomPlate_PointConstraint ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: GeomPlate_SequenceOfPointConstraint
") Sequence;
		const GeomPlate_SequenceOfPointConstraint & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: GeomPlate_SequenceOfPointConstraint
") ChangeSequence;
		GeomPlate_SequenceOfPointConstraint & ChangeSequence ();
};


%extend GeomPlate_HSequenceOfPointConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_HSequenceOfPointConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_HSequenceOfPointConstraint::Handle_GeomPlate_HSequenceOfPointConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_HSequenceOfPointConstraint;
class Handle_GeomPlate_HSequenceOfPointConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_HSequenceOfPointConstraint();
        Handle_GeomPlate_HSequenceOfPointConstraint(const Handle_GeomPlate_HSequenceOfPointConstraint &aHandle);
        Handle_GeomPlate_HSequenceOfPointConstraint(const GeomPlate_HSequenceOfPointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_HSequenceOfPointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_HSequenceOfPointConstraint {
    GeomPlate_HSequenceOfPointConstraint* _get_reference() {
    return (GeomPlate_HSequenceOfPointConstraint*)$self->Access();
    }
};

%extend Handle_GeomPlate_HSequenceOfPointConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_HSequenceOfPointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_MakeApprox;
class GeomPlate_MakeApprox {
	public:
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "	* Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible the criterion CritPlate is satisfied if possible

	:param SurfPlate:
	:type SurfPlate: Handle_GeomPlate_Surface &
	:param PlateCrit:
	:type PlateCrit: AdvApp2Var_Criterion &
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
	:rtype: None
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox (const Handle_GeomPlate_Surface & SurfPlate,const AdvApp2Var_Criterion & PlateCrit,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);
		%feature("compactdefaultargs") GeomPlate_MakeApprox;
		%feature("autodoc", "	* Converts SurfPlate into a Geom_BSplineSurface with n Bezier pieces (n<=Nbmax) of degree <= dgmax and an approximation error < Tol3d if possible if CritOrder = -1 , no criterion is used if CritOrder = 0 , a PlateG0Criterion is used with max value > 10*dmax if CritOrder = 1 , a PlateG1Criterion is used with max value > 10*dmax WARNING : for CritOrder = 0 or 1, only the constraints points of SurfPlate are used to evaluate the value of the criterion

	:param SurfPlate:
	:type SurfPlate: Handle_GeomPlate_Surface &
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
	:rtype: None
") GeomPlate_MakeApprox;
		 GeomPlate_MakeApprox (const Handle_GeomPlate_Surface & SurfPlate,const Standard_Real Tol3d,const Standard_Integer Nbmax,const Standard_Integer dgmax,const Standard_Real dmax,const Standard_Integer CritOrder = 0,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Real EnlargeCoeff = 1.1);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns the BSpline surface extracted from the GeomPlate_MakeApprox object.

	:rtype: Handle_Geom_BSplineSurface
") Surface;
		Handle_Geom_BSplineSurface Surface ();
		%feature("compactdefaultargs") ApproxError;
		%feature("autodoc", "	* Returns the error in computation of the approximation surface. This is the distance between the entire target BSpline surface and the entire original surface generated by BuildPlateSurface and converted by GeomPlate_Surface.

	:rtype: float
") ApproxError;
		Standard_Real ApproxError ();
		%feature("compactdefaultargs") CriterionError;
		%feature("autodoc", "	* Returns the criterion error in computation of the approximation surface. This is estimated relative to the curve and point constraints only.

	:rtype: float
") CriterionError;
		Standard_Real CriterionError ();
};


%extend GeomPlate_MakeApprox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_PlateG0Criterion;
class GeomPlate_PlateG0Criterion : public AdvApp2Var_Criterion {
	public:
		%feature("compactdefaultargs") GeomPlate_PlateG0Criterion;
		%feature("autodoc", "	:param Data:
	:type Data: TColgp_SequenceOfXY
	:param G0Data:
	:type G0Data: TColgp_SequenceOfXYZ
	:param Maximum:
	:type Maximum: float
	:param Type: default value is AdvApp2Var_Absolute
	:type Type: AdvApp2Var_CriterionType
	:param Repart: default value is AdvApp2Var_Regular
	:type Repart: AdvApp2Var_CriterionRepartition
	:rtype: None
") GeomPlate_PlateG0Criterion;
		 GeomPlate_PlateG0Criterion (const TColgp_SequenceOfXY & Data,const TColgp_SequenceOfXYZ & G0Data,const Standard_Real Maximum,const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute,const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param P:
	:type P: AdvApp2Var_Patch &
	:param C:
	:type C: AdvApp2Var_Context &
	:rtype: void
") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:param P:
	:type P: AdvApp2Var_Patch &
	:rtype: bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);
};


%extend GeomPlate_PlateG0Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_PlateG1Criterion;
class GeomPlate_PlateG1Criterion : public AdvApp2Var_Criterion {
	public:
		%feature("compactdefaultargs") GeomPlate_PlateG1Criterion;
		%feature("autodoc", "	:param Data:
	:type Data: TColgp_SequenceOfXY
	:param G1Data:
	:type G1Data: TColgp_SequenceOfXYZ
	:param Maximum:
	:type Maximum: float
	:param Type: default value is AdvApp2Var_Absolute
	:type Type: AdvApp2Var_CriterionType
	:param Repart: default value is AdvApp2Var_Regular
	:type Repart: AdvApp2Var_CriterionRepartition
	:rtype: None
") GeomPlate_PlateG1Criterion;
		 GeomPlate_PlateG1Criterion (const TColgp_SequenceOfXY & Data,const TColgp_SequenceOfXYZ & G1Data,const Standard_Real Maximum,const AdvApp2Var_CriterionType Type = AdvApp2Var_Absolute,const AdvApp2Var_CriterionRepartition Repart = AdvApp2Var_Regular);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param P:
	:type P: AdvApp2Var_Patch &
	:param C:
	:type C: AdvApp2Var_Context &
	:rtype: void
") Value;
		virtual void Value (AdvApp2Var_Patch & P,const AdvApp2Var_Context & C);
		%feature("compactdefaultargs") IsSatisfied;
		%feature("autodoc", "	:param P:
	:type P: AdvApp2Var_Patch &
	:rtype: bool
") IsSatisfied;
		virtual Standard_Boolean IsSatisfied (const AdvApp2Var_Patch & P);
};


%extend GeomPlate_PlateG1Criterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_PointConstraint;
class GeomPlate_PointConstraint : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "	* Constructs a point constraint object defined by Pt, a 3D point Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor, only TolDist is given. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if Order is not 0 or -1

	:param Pt:
	:type Pt: gp_Pnt
	:param Order:
	:type Order: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:rtype: None
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint (const gp_Pnt & Pt,const Standard_Integer Order,const Standard_Real TolDist = 0.0001);
		%feature("compactdefaultargs") GeomPlate_PointConstraint;
		%feature("autodoc", "	* Constructs a point constraint object defined by the intersection point of U and V on the surface Surf. Order gives the order of constraint, one of: - -1 i.e. none, or 0 i.e.G0 when assigned to Pt - -1 i.e. none, 0 i.e. G0, 1 i.e. G1, 2 i.e. G2 when assigned to U, V and Surf. In this constructor the surface to be generated must respect several tolerance values only: - the distance tolerance TolDist - the angular tolerance TolAng - the curvature tolerance, TolCurv. Distance tolerance represents the greatest distance allowed between the constraint and the target surface. Angular tolerance represents the largest angle allowed between the constraint and the target surface. Curvature tolerance represents the greatest difference in curvature allowed between the constraint and the target surface.Creates a punctual constraint.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Surf:
	:type Surf: Handle_Geom_Surface &
	:param Order:
	:type Order: int
	:param TolDist: default value is 0.0001
	:type TolDist: float
	:param TolAng: default value is 0.01
	:type TolAng: float
	:param TolCurv: default value is 0.1
	:type TolCurv: float
	:rtype: None
") GeomPlate_PointConstraint;
		 GeomPlate_PointConstraint (const Standard_Real U,const Standard_Real V,const Handle_Geom_Surface & Surf,const Standard_Integer Order,const Standard_Real TolDist = 0.0001,const Standard_Real TolAng = 0.01,const Standard_Real TolCurv = 0.1);
		%feature("compactdefaultargs") SetOrder;
		%feature("autodoc", "	:param Order:
	:type Order: int
	:rtype: None
") SetOrder;
		void SetOrder (const Standard_Integer Order);
		%feature("compactdefaultargs") Order;
		%feature("autodoc", "	* Returns the order of constraint: G0, G1, and G2, controlled respectively by G0Criterion G1Criterion and G2Criterion.

	:rtype: int
") Order;
		Standard_Integer Order ();
		%feature("compactdefaultargs") SetG0Criterion;
		%feature("autodoc", "	* Allows you to set the G0 criterion. This is the law defining the greatest distance allowed between the constraint and the target surface. If this criterion is not set, {TolDist, the distance tolerance from the constructor, is used

	:param TolDist:
	:type TolDist: float
	:rtype: None
") SetG0Criterion;
		void SetG0Criterion (const Standard_Real TolDist);
		%feature("compactdefaultargs") SetG1Criterion;
		%feature("autodoc", "	* Allows you to set the G1 criterion. This is the law defining the greatest angle allowed between the constraint and the target surface. If this criterion is not set, TolAng, the angular tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface

	:param TolAng:
	:type TolAng: float
	:rtype: None
") SetG1Criterion;
		void SetG1Criterion (const Standard_Real TolAng);
		%feature("compactdefaultargs") SetG2Criterion;
		%feature("autodoc", "	* Allows you to set the G2 criterion. This is the law defining the greatest difference in curvature allowed between the constraint and the target surface. If this criterion is not set, TolCurv, the curvature tolerance from the constructor, is used. Raises ConstructionError if the point is not on the surface

	:param TolCurv:
	:type TolCurv: float
	:rtype: None
") SetG2Criterion;
		void SetG2Criterion (const Standard_Real TolCurv);
		%feature("compactdefaultargs") G0Criterion;
		%feature("autodoc", "	* Returns the G0 criterion. This is the greatest distance allowed between the constraint and the target surface.

	:rtype: float
") G0Criterion;
		Standard_Real G0Criterion ();
		%feature("compactdefaultargs") G1Criterion;
		%feature("autodoc", "	* Returns the G1 criterion. This is the greatest angle allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface.

	:rtype: float
") G1Criterion;
		Standard_Real G1Criterion ();
		%feature("compactdefaultargs") G2Criterion;
		%feature("autodoc", "	* Returns the G2 criterion. This is the greatest difference in curvature allowed between the constraint and the target surface. Raises ConstructionError if the point is not on the surface

	:rtype: float
") G2Criterion;
		Standard_Real G2Criterion ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D1;
		void D1 (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param P:
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
	:rtype: None
") D2;
		void D2 (gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3,gp_Vec & V4,gp_Vec & V5);
		%feature("compactdefaultargs") HasPnt2dOnSurf;
		%feature("autodoc", "	:rtype: bool
") HasPnt2dOnSurf;
		Standard_Boolean HasPnt2dOnSurf ();
		%feature("compactdefaultargs") SetPnt2dOnSurf;
		%feature("autodoc", "	:param Pnt:
	:type Pnt: gp_Pnt2d
	:rtype: None
") SetPnt2dOnSurf;
		void SetPnt2dOnSurf (const gp_Pnt2d & Pnt);
		%feature("compactdefaultargs") Pnt2dOnSurf;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Pnt2dOnSurf;
		gp_Pnt2d Pnt2dOnSurf ();
		%feature("compactdefaultargs") LPropSurf;
		%feature("autodoc", "	:rtype: GeomLProp_SLProps
") LPropSurf;
		GeomLProp_SLProps & LPropSurf ();
};


%extend GeomPlate_PointConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_PointConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_PointConstraint::Handle_GeomPlate_PointConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_PointConstraint;
class Handle_GeomPlate_PointConstraint : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GeomPlate_PointConstraint();
        Handle_GeomPlate_PointConstraint(const Handle_GeomPlate_PointConstraint &aHandle);
        Handle_GeomPlate_PointConstraint(const GeomPlate_PointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_PointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_PointConstraint {
    GeomPlate_PointConstraint* _get_reference() {
    return (GeomPlate_PointConstraint*)$self->Access();
    }
};

%extend Handle_GeomPlate_PointConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_PointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_SequenceNodeOfSequenceOfAij;
class GeomPlate_SequenceNodeOfSequenceOfAij : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") GeomPlate_SequenceNodeOfSequenceOfAij;
		%feature("autodoc", "	:param I:
	:type I: GeomPlate_Aij &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") GeomPlate_SequenceNodeOfSequenceOfAij;
		 GeomPlate_SequenceNodeOfSequenceOfAij (const GeomPlate_Aij & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: GeomPlate_Aij
") Value;
		GeomPlate_Aij & Value ();
};


%extend GeomPlate_SequenceNodeOfSequenceOfAij {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_SequenceNodeOfSequenceOfAij(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_SequenceNodeOfSequenceOfAij::Handle_GeomPlate_SequenceNodeOfSequenceOfAij %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_SequenceNodeOfSequenceOfAij;
class Handle_GeomPlate_SequenceNodeOfSequenceOfAij : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomPlate_SequenceNodeOfSequenceOfAij();
        Handle_GeomPlate_SequenceNodeOfSequenceOfAij(const Handle_GeomPlate_SequenceNodeOfSequenceOfAij &aHandle);
        Handle_GeomPlate_SequenceNodeOfSequenceOfAij(const GeomPlate_SequenceNodeOfSequenceOfAij *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_SequenceNodeOfSequenceOfAij DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_SequenceNodeOfSequenceOfAij {
    GeomPlate_SequenceNodeOfSequenceOfAij* _get_reference() {
    return (GeomPlate_SequenceNodeOfSequenceOfAij*)$self->Access();
    }
};

%extend Handle_GeomPlate_SequenceNodeOfSequenceOfAij {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_SequenceNodeOfSequenceOfAij {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
class GeomPlate_SequenceNodeOfSequenceOfCurveConstraint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
		%feature("autodoc", "	:param I:
	:type I: Handle_GeomPlate_CurveConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
		 GeomPlate_SequenceNodeOfSequenceOfCurveConstraint (const Handle_GeomPlate_CurveConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_GeomPlate_CurveConstraint
") Value;
		Handle_GeomPlate_CurveConstraint Value ();
};


%extend GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint::Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint;
class Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint();
        Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint(const Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint &aHandle);
        Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint(const GeomPlate_SequenceNodeOfSequenceOfCurveConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
    GeomPlate_SequenceNodeOfSequenceOfCurveConstraint* _get_reference() {
    return (GeomPlate_SequenceNodeOfSequenceOfCurveConstraint*)$self->Access();
    }
};

%extend Handle_GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_SequenceNodeOfSequenceOfCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
class GeomPlate_SequenceNodeOfSequenceOfPointConstraint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
		%feature("autodoc", "	:param I:
	:type I: Handle_GeomPlate_PointConstraint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
		 GeomPlate_SequenceNodeOfSequenceOfPointConstraint (const Handle_GeomPlate_PointConstraint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_GeomPlate_PointConstraint
") Value;
		Handle_GeomPlate_PointConstraint Value ();
};


%extend GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint::Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint;
class Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint();
        Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint(const Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint &aHandle);
        Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint(const GeomPlate_SequenceNodeOfSequenceOfPointConstraint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
    GeomPlate_SequenceNodeOfSequenceOfPointConstraint* _get_reference() {
    return (GeomPlate_SequenceNodeOfSequenceOfPointConstraint*)$self->Access();
    }
};

%extend Handle_GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_SequenceNodeOfSequenceOfPointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_SequenceOfAij;
class GeomPlate_SequenceOfAij : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") GeomPlate_SequenceOfAij;
		%feature("autodoc", "	:rtype: None
") GeomPlate_SequenceOfAij;
		 GeomPlate_SequenceOfAij ();
		%feature("compactdefaultargs") GeomPlate_SequenceOfAij;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfAij &
	:rtype: None
") GeomPlate_SequenceOfAij;
		 GeomPlate_SequenceOfAij (const GeomPlate_SequenceOfAij & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfAij &
	:rtype: GeomPlate_SequenceOfAij
") Assign;
		const GeomPlate_SequenceOfAij & Assign (const GeomPlate_SequenceOfAij & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfAij &
	:rtype: GeomPlate_SequenceOfAij
") operator =;
		const GeomPlate_SequenceOfAij & operator = (const GeomPlate_SequenceOfAij & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: GeomPlate_Aij &
	:rtype: None
") Append;
		void Append (const GeomPlate_Aij & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: GeomPlate_SequenceOfAij &
	:rtype: None
") Append;
		void Append (GeomPlate_SequenceOfAij & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: GeomPlate_Aij &
	:rtype: None
") Prepend;
		void Prepend (const GeomPlate_Aij & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: GeomPlate_SequenceOfAij &
	:rtype: None
") Prepend;
		void Prepend (GeomPlate_SequenceOfAij & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: GeomPlate_Aij &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const GeomPlate_Aij & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomPlate_SequenceOfAij &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomPlate_SequenceOfAij & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: GeomPlate_Aij &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const GeomPlate_Aij & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomPlate_SequenceOfAij &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomPlate_SequenceOfAij & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: GeomPlate_Aij
") First;
		const GeomPlate_Aij & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: GeomPlate_Aij
") Last;
		const GeomPlate_Aij & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: GeomPlate_SequenceOfAij &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,GeomPlate_SequenceOfAij & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: GeomPlate_Aij
") Value;
		const GeomPlate_Aij & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: GeomPlate_Aij &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const GeomPlate_Aij & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: GeomPlate_Aij
") ChangeValue;
		GeomPlate_Aij & ChangeValue (const Standard_Integer Index);
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


%extend GeomPlate_SequenceOfAij {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_SequenceOfCurveConstraint;
class GeomPlate_SequenceOfCurveConstraint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") GeomPlate_SequenceOfCurveConstraint;
		%feature("autodoc", "	:rtype: None
") GeomPlate_SequenceOfCurveConstraint;
		 GeomPlate_SequenceOfCurveConstraint ();
		%feature("compactdefaultargs") GeomPlate_SequenceOfCurveConstraint;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfCurveConstraint &
	:rtype: None
") GeomPlate_SequenceOfCurveConstraint;
		 GeomPlate_SequenceOfCurveConstraint (const GeomPlate_SequenceOfCurveConstraint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfCurveConstraint &
	:rtype: GeomPlate_SequenceOfCurveConstraint
") Assign;
		const GeomPlate_SequenceOfCurveConstraint & Assign (const GeomPlate_SequenceOfCurveConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfCurveConstraint &
	:rtype: GeomPlate_SequenceOfCurveConstraint
") operator =;
		const GeomPlate_SequenceOfCurveConstraint & operator = (const GeomPlate_SequenceOfCurveConstraint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") Append;
		void Append (const Handle_GeomPlate_CurveConstraint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: GeomPlate_SequenceOfCurveConstraint &
	:rtype: None
") Append;
		void Append (GeomPlate_SequenceOfCurveConstraint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GeomPlate_CurveConstraint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: GeomPlate_SequenceOfCurveConstraint &
	:rtype: None
") Prepend;
		void Prepend (GeomPlate_SequenceOfCurveConstraint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_GeomPlate_CurveConstraint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomPlate_SequenceOfCurveConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomPlate_SequenceOfCurveConstraint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_GeomPlate_CurveConstraint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomPlate_SequenceOfCurveConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomPlate_SequenceOfCurveConstraint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_GeomPlate_CurveConstraint
") First;
		Handle_GeomPlate_CurveConstraint First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_GeomPlate_CurveConstraint
") Last;
		Handle_GeomPlate_CurveConstraint Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: GeomPlate_SequenceOfCurveConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,GeomPlate_SequenceOfCurveConstraint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_GeomPlate_CurveConstraint
") Value;
		Handle_GeomPlate_CurveConstraint Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_GeomPlate_CurveConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_GeomPlate_CurveConstraint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_GeomPlate_CurveConstraint
") ChangeValue;
		Handle_GeomPlate_CurveConstraint ChangeValue (const Standard_Integer Index);
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


%extend GeomPlate_SequenceOfCurveConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_SequenceOfPointConstraint;
class GeomPlate_SequenceOfPointConstraint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") GeomPlate_SequenceOfPointConstraint;
		%feature("autodoc", "	:rtype: None
") GeomPlate_SequenceOfPointConstraint;
		 GeomPlate_SequenceOfPointConstraint ();
		%feature("compactdefaultargs") GeomPlate_SequenceOfPointConstraint;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfPointConstraint &
	:rtype: None
") GeomPlate_SequenceOfPointConstraint;
		 GeomPlate_SequenceOfPointConstraint (const GeomPlate_SequenceOfPointConstraint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfPointConstraint &
	:rtype: GeomPlate_SequenceOfPointConstraint
") Assign;
		const GeomPlate_SequenceOfPointConstraint & Assign (const GeomPlate_SequenceOfPointConstraint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: GeomPlate_SequenceOfPointConstraint &
	:rtype: GeomPlate_SequenceOfPointConstraint
") operator =;
		const GeomPlate_SequenceOfPointConstraint & operator = (const GeomPlate_SequenceOfPointConstraint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_GeomPlate_PointConstraint &
	:rtype: None
") Append;
		void Append (const Handle_GeomPlate_PointConstraint & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: GeomPlate_SequenceOfPointConstraint &
	:rtype: None
") Append;
		void Append (GeomPlate_SequenceOfPointConstraint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_GeomPlate_PointConstraint &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GeomPlate_PointConstraint & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: GeomPlate_SequenceOfPointConstraint &
	:rtype: None
") Prepend;
		void Prepend (GeomPlate_SequenceOfPointConstraint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_GeomPlate_PointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_GeomPlate_PointConstraint & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomPlate_SequenceOfPointConstraint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,GeomPlate_SequenceOfPointConstraint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_GeomPlate_PointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_GeomPlate_PointConstraint & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: GeomPlate_SequenceOfPointConstraint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,GeomPlate_SequenceOfPointConstraint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_GeomPlate_PointConstraint
") First;
		Handle_GeomPlate_PointConstraint First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_GeomPlate_PointConstraint
") Last;
		Handle_GeomPlate_PointConstraint Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: GeomPlate_SequenceOfPointConstraint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,GeomPlate_SequenceOfPointConstraint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_GeomPlate_PointConstraint
") Value;
		Handle_GeomPlate_PointConstraint Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_GeomPlate_PointConstraint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_GeomPlate_PointConstraint & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_GeomPlate_PointConstraint
") ChangeValue;
		Handle_GeomPlate_PointConstraint ChangeValue (const Standard_Integer Index);
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


%extend GeomPlate_SequenceOfPointConstraint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomPlate_Surface;
class GeomPlate_Surface : public Geom_Surface {
	public:
		%feature("compactdefaultargs") GeomPlate_Surface;
		%feature("autodoc", "	:param Surfinit:
	:type Surfinit: Handle_Geom_Surface &
	:param Surfinter:
	:type Surfinter: Plate_Plate &
	:rtype: None
") GeomPlate_Surface;
		 GeomPlate_Surface (const Handle_Geom_Surface & Surfinit,const Plate_Plate & Surfinter);
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "	* Reverses the U direction of parametrization of <self>. The bounds of the surface are not modified.

	:rtype: None
") UReverse;
		void UReverse ();
		%feature("compactdefaultargs") UReversedParameter;
		%feature("autodoc", "	* Return the parameter on the Ureversed surface for the point of parameter U on <self>. //! me->UReversed()->Value(me->UReversedParameter(U),V) //! is the same point as //! me->Value(U,V)

	:param U:
	:type U: float
	:rtype: float
") UReversedParameter;
		Standard_Real UReversedParameter (const Standard_Real U);
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "	* Reverses the V direction of parametrization of <self>. The bounds of the surface are not modified.

	:rtype: None
") VReverse;
		void VReverse ();
		%feature("compactdefaultargs") VReversedParameter;
		%feature("autodoc", "	* Return the parameter on the Vreversed surface for the point of parameter V on <self>. //! me->VReversed()->Value(U,me->VReversedParameter(V)) //! is the same point as //! me->Value(U,V)

	:param V:
	:type V: float
	:rtype: float
") VReversedParameter;
		Standard_Real VReversedParameter (const Standard_Real V);
		%feature("compactdefaultargs") TransformParameters;
		%feature("autodoc", "	* Computes the parameters on the transformed surface for the transform of the point of parameters U,V on <self>. //! me->Transformed(T)->Value(U',V') //! is the same point as //! me->Value(U,V).Transformed(T) //! Where U',V' are the new values of U,V after calling //! me->TranformParameters(U,V,T) //! This methods does not change <U> and <V> //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.

	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:param T:
	:type T: gp_Trsf
	:rtype: void
") TransformParameters;
		virtual void TransformParameters (Standard_Real &OutValue,Standard_Real &OutValue,const gp_Trsf & T);
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "	* Returns a 2d transformation used to find the new parameters of a point on the transformed surface. //! me->Transformed(T)->Value(U',V') //! is the same point as //! me->Value(U,V).Transformed(T) //! Where U',V' are obtained by transforming U,V with th 2d transformation returned by //! me->ParametricTransformation(T) //! This methods returns an identity transformation //! It can be redefined. For example on the Plane, Cylinder, Cone, Revolved and Extruded surfaces.

	:param T:
	:type T: gp_Trsf
	:rtype: gp_GTrsf2d
") ParametricTransformation;
		virtual gp_GTrsf2d ParametricTransformation (const gp_Trsf & T);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:param V1:
	:type V1: float &
	:param V2:
	:type V2: float &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	* Is the surface closed in the parametric direction U ? Returns True if for each parameter V the distance between the point P (UFirst, V) and P (ULast, V) is lower or equal to Resolution from gp. UFirst and ULast are the parametric bounds in the U direction.

	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	* Is the surface closed in the parametric direction V ? Returns True if for each parameter U the distance between the point P (U, VFirst) and P (U, VLast) is lower or equal to Resolution from gp. VFirst and VLast are the parametric bounds in the V direction.

	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	* Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied : for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.

	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	* returns the Uperiod. raises if the surface is not uperiodic.

	:rtype: float
") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	* Is the parametrization of a surface periodic in the direction U ? It is possible only if the surface is closed in this parametric direction and if the following relation is satisfied : for each parameter V the distance between the point P (U, V) and the point P (U + T, V) is lower or equal to Resolution from package gp. T is the parametric period and must be a constant.

	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	* returns the Vperiod. raises if the surface is not vperiodic.

	:rtype: float
") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("compactdefaultargs") UIso;
		%feature("autodoc", "	* Computes the U isoparametric curve.

	:param U:
	:type U: float
	:rtype: Handle_Geom_Curve
") UIso;
		Handle_Geom_Curve UIso (const Standard_Real U);
		%feature("compactdefaultargs") VIso;
		%feature("autodoc", "	* Computes the V isoparametric curve.

	:param V:
	:type V: float
	:rtype: Handle_Geom_Curve
") VIso;
		Handle_Geom_Curve VIso (const Standard_Real V);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Global Continuity of the surface in direction U and V : C0 : only geometric continuity, C1 : continuity of the first derivative all along the surface, C2 : continuity of the second derivative all along the surface, C3 : continuity of the third derivative all along the surface, G1 : tangency continuity all along the surface, G2 : curvature continuity all along the surface, CN : the order of continuity is infinite. Example : If the surface is C1 in the V parametric direction and C2 in the U parametric direction Shape = C1.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") IsCNu;
		%feature("autodoc", "	* Returns the order of continuity of the surface in the U parametric direction. Raised if N < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCNu;
		Standard_Boolean IsCNu (const Standard_Integer N);
		%feature("compactdefaultargs") IsCNv;
		%feature("autodoc", "	* Returns the order of continuity of the surface in the V parametric direction. Raised if N < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCNv;
		Standard_Boolean IsCNv (const Standard_Integer N);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U,V on the surface. //! Raised only for an 'OffsetSurface' if it is not possible to compute the current point.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point P and the first derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C1.

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
	:rtype: None
") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point P, the first and the second derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.

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
	:rtype: None
") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Computes the point P, the first,the second and the third derivatives in the directions U and V at this point. Raised if the continuity of the surface is not C2.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* ---Purpose ; Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). //! Raised if the continuity of the surface is not CNu in the U direction or not CNv in the V direction. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: Handle_Geom_Geometry
") Copy;
		Handle_Geom_Geometry Copy ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Transformation of a geometric object. This tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class Transformation of the package Geom).

	:param T:
	:type T: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & T);
		%feature("compactdefaultargs") CallSurfinit;
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") CallSurfinit;
		Handle_Geom_Surface CallSurfinit ();
		%feature("compactdefaultargs") SetBounds;
		%feature("autodoc", "	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: None
") SetBounds;
		void SetBounds (const Standard_Real Umin,const Standard_Real Umax,const Standard_Real Vmin,const Standard_Real Vmax);
		%feature("compactdefaultargs") RealBounds;
		%feature("autodoc", "	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:param V1:
	:type V1: float &
	:param V2:
	:type V2: float &
	:rtype: None
") RealBounds;
		void RealBounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Constraints;
		%feature("autodoc", "	:param Seq:
	:type Seq: TColgp_SequenceOfXY
	:rtype: None
") Constraints;
		void Constraints (TColgp_SequenceOfXY & Seq);
};


%extend GeomPlate_Surface {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_GeomPlate_Surface(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_GeomPlate_Surface::Handle_GeomPlate_Surface %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_GeomPlate_Surface;
class Handle_GeomPlate_Surface : public Handle_Geom_Surface {

    public:
        // constructors
        Handle_GeomPlate_Surface();
        Handle_GeomPlate_Surface(const Handle_GeomPlate_Surface &aHandle);
        Handle_GeomPlate_Surface(const GeomPlate_Surface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomPlate_Surface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomPlate_Surface {
    GeomPlate_Surface* _get_reference() {
    return (GeomPlate_Surface*)$self->Access();
    }
};

%extend Handle_GeomPlate_Surface {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend GeomPlate_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
