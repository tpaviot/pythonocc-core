/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define IGESGEOMDOCSTRING
"IGESGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_igesgeom.html"
%enddef
%module (package="OCC.Core", docstring=IGESGEOMDOCSTRING) IGESGeom


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


%{
#include<IGESGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IGESData_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<IGESBasic_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IGESData.i
%import TColStd.i
%import TColgp.i
%import gp.i
%import IGESBasic.i
%import Interface.i

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
%wrap_handle(IGESGeom_BSplineCurve)
%wrap_handle(IGESGeom_BSplineSurface)
%wrap_handle(IGESGeom_Boundary)
%wrap_handle(IGESGeom_BoundedSurface)
%wrap_handle(IGESGeom_CircularArc)
%wrap_handle(IGESGeom_CompositeCurve)
%wrap_handle(IGESGeom_ConicArc)
%wrap_handle(IGESGeom_CopiousData)
%wrap_handle(IGESGeom_CurveOnSurface)
%wrap_handle(IGESGeom_Direction)
%wrap_handle(IGESGeom_Flash)
%wrap_handle(IGESGeom_GeneralModule)
%wrap_handle(IGESGeom_Line)
%wrap_handle(IGESGeom_OffsetCurve)
%wrap_handle(IGESGeom_OffsetSurface)
%wrap_handle(IGESGeom_Plane)
%wrap_handle(IGESGeom_Point)
%wrap_handle(IGESGeom_Protocol)
%wrap_handle(IGESGeom_ReadWriteModule)
%wrap_handle(IGESGeom_RuledSurface)
%wrap_handle(IGESGeom_SpecificModule)
%wrap_handle(IGESGeom_SplineCurve)
%wrap_handle(IGESGeom_SplineSurface)
%wrap_handle(IGESGeom_SurfaceOfRevolution)
%wrap_handle(IGESGeom_TabulatedCylinder)
%wrap_handle(IGESGeom_TransformationMatrix)
%wrap_handle(IGESGeom_TrimmedSurface)
%wrap_handle(IGESGeom_HArray1OfBoundary)
%wrap_handle(IGESGeom_HArray1OfCurveOnSurface)
%wrap_handle(IGESGeom_HArray1OfTransformationMatrix)
/* end handles declaration */

/* templates */
%template(IGESGeom_Array1OfBoundary) NCollection_Array1<opencascade::handle<IGESGeom_Boundary>>;

%extend NCollection_Array1<opencascade::handle<IGESGeom_Boundary>> {
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
%template(IGESGeom_Array1OfCurveOnSurface) NCollection_Array1<opencascade::handle<IGESGeom_CurveOnSurface>>;

%extend NCollection_Array1<opencascade::handle<IGESGeom_CurveOnSurface>> {
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
%template(IGESGeom_Array1OfTransformationMatrix) NCollection_Array1<opencascade::handle<IGESGeom_TransformationMatrix>>;

%extend NCollection_Array1<opencascade::handle<IGESGeom_TransformationMatrix>> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1 <opencascade::handle <IGESGeom_Boundary>> IGESGeom_Array1OfBoundary;
typedef NCollection_Array1 <opencascade::handle <IGESGeom_CurveOnSurface>> IGESGeom_Array1OfCurveOnSurface;
typedef NCollection_Array1 <opencascade::handle <IGESGeom_TransformationMatrix>> IGESGeom_Array1OfTransformationMatrix;
/* end typedefs declaration */

/*****************
* class IGESGeom *
*****************/
%rename(igesgeom) IGESGeom;
class IGESGeom {
	public:
		/****************** Init ******************/
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Prepares dymanic data (protocol, modules) for this package.

Returns
-------
void
") Init;
		static void Init();

		/****************** Protocol ******************/
		/**** md5 signature: 7ac46a031e39961beb9a0376c8685d27 ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol for this package.

Returns
-------
opencascade::handle<IGESGeom_Protocol>
") Protocol;
		static opencascade::handle<IGESGeom_Protocol> Protocol();

};


%extend IGESGeom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGeom_BSplineCurve *
******************************/
class IGESGeom_BSplineCurve : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_BSplineCurve ******************/
		/**** md5 signature: da14e303785d543144972727fcc86f97 ****/
		%feature("compactdefaultargs") IGESGeom_BSplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_BSplineCurve;
		 IGESGeom_BSplineCurve();

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of basis functions.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Init ******************/
		/**** md5 signature: d5cdf5dc3e7f38db9b9eab0d1289dc33 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class bsplinecurve. beware about indexation of arrays - anindex : upper index of the sum - adegree : degree of basis functions - aplanar : 0 = nonplanar curve, 1 = planar curve - aclosed : 0 = open curve, 1 = closed curve - apolynom : 0 = rational, 1 = polynomial - aperiodic : 0 = nonperiodic, 1 = periodic - allknots : knot sequence values [-degree,index+1] - allweights : array of weights [0,index] - allpoles : x, y, z coordinates of all control points [0,index] - aumin, aumax : starting and ending parameter values - anorm : unit normal (if the curve is planar) raises exception if allweights & allpoles are not of same size.

Parameters
----------
anIndex: int
aDegree: int
aPlanar: bool
aClosed: bool
aPolynom: bool
aPeriodic: bool
allKnots: TColStd_HArray1OfReal
allWeights: TColStd_HArray1OfReal
allPoles: TColgp_HArray1OfXYZ
aUmin: float
aUmax: float
aNorm: gp_XYZ

Returns
-------
None
") Init;
		void Init(const Standard_Integer anIndex, const Standard_Integer aDegree, const Standard_Boolean aPlanar, const Standard_Boolean aClosed, const Standard_Boolean aPolynom, const Standard_Boolean aPeriodic, const opencascade::handle<TColStd_HArray1OfReal> & allKnots, const opencascade::handle<TColStd_HArray1OfReal> & allWeights, const opencascade::handle<TColgp_HArray1OfXYZ> & allPoles, const Standard_Real aUmin, const Standard_Real aUmax, const gp_XYZ & aNorm);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the curve is closed, false if open.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the curve is periodic, false otherwise.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsPlanar ******************/
		/**** md5 signature: c4cb6ad82acdd7a7d12e9af1bea21482 ****/
		%feature("compactdefaultargs") IsPlanar;
		%feature("autodoc", "Returns true if the curve is planar, false if non-planar.

Returns
-------
bool
") IsPlanar;
		Standard_Boolean IsPlanar();

		/****************** IsPolynomial ******************/
		/**** md5 signature: 1e2ec9d8e4fa147a1d40b3a2c6fedc7a ****/
		%feature("compactdefaultargs") IsPolynomial;
		%feature("autodoc", "Returns true if the curve is polynomial, false if rational <flag> false (d) : computed from the list of weights (all must be equal) <flag> true : as recorded.

Parameters
----------
flag: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsPolynomial;
		Standard_Boolean IsPolynomial(const Standard_Boolean flag = Standard_False);

		/****************** Knot ******************/
		/**** md5 signature: c654f69b85079bd7f47f1167c65f69b1 ****/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "Returns the knot referred to by anindex, inside the range [-degree,upperindex+1] raises exception if anindex < -degree() or anindex > (nbknots() - degree()) note : knots are numbered from -degree (not from 1).

Parameters
----------
anIndex: int

Returns
-------
float
") Knot;
		Standard_Real Knot(const Standard_Integer anIndex);

		/****************** NbKnots ******************/
		/**** md5 signature: ccda669299f8eba1ba0d3387af4c950e ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Returns the number of knots (i.e. degree + upperindex + 2).

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns number of poles (i.e. upperindex + 1).

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Normal ******************/
		/**** md5 signature: 8ca22893b80ddddf1b376e28307bf535 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "If the curve is nonplanar then (0, 0, 0) is returned.

Returns
-------
gp_XYZ
") Normal;
		gp_XYZ Normal();

		/****************** Pole ******************/
		/**** md5 signature: 91ae2bde7a2897f335c5322796cf821d ****/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole referred to by anindex, in [0,upperindex] raises exception if anindex < 0 or anindex > upperindex().

Parameters
----------
anIndex: int

Returns
-------
gp_Pnt
") Pole;
		gp_Pnt Pole(const Standard_Integer anIndex);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the shape of the curve) error if not in range [0-5].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** TransformedPole ******************/
		/**** md5 signature: 10cf75508f52a86271cc1e18a3ed4a7f ****/
		%feature("compactdefaultargs") TransformedPole;
		%feature("autodoc", "Returns the anindex'th pole after applying transf. matrix raises exception if an index < 0 or an index > upperindex().

Parameters
----------
anIndex: int

Returns
-------
gp_Pnt
") TransformedPole;
		gp_Pnt TransformedPole(const Standard_Integer anIndex);

		/****************** UMax ******************/
		/**** md5 signature: d67ae1d1678f5d09bfa5b3cb2c1fdd51 ****/
		%feature("compactdefaultargs") UMax;
		%feature("autodoc", "Returns ending parameter value.

Returns
-------
float
") UMax;
		Standard_Real UMax();

		/****************** UMin ******************/
		/**** md5 signature: 4c80dbd047d4a4d83e6f071174384bac ****/
		%feature("compactdefaultargs") UMin;
		%feature("autodoc", "Returns starting parameter value.

Returns
-------
float
") UMin;
		Standard_Real UMin();

		/****************** UpperIndex ******************/
		/**** md5 signature: 914943f67f6644ce7943275e536f0b3d ****/
		%feature("compactdefaultargs") UpperIndex;
		%feature("autodoc", "Returns the upper index of the sum (see knots,poles).

Returns
-------
int
") UpperIndex;
		Standard_Integer UpperIndex();

		/****************** Weight ******************/
		/**** md5 signature: 4712fd2fb024ddd66df6049bc52f3f74 ****/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight referred to by anindex, in [0,upperindex] raises exception if anindex < 0 or anindex > upperindex().

Parameters
----------
anIndex: int

Returns
-------
float
") Weight;
		Standard_Real Weight(const Standard_Integer anIndex);

};


%make_alias(IGESGeom_BSplineCurve)

%extend IGESGeom_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGeom_BSplineSurface *
********************************/
class IGESGeom_BSplineSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_BSplineSurface ******************/
		/**** md5 signature: 055a3a1be7bda603c236af5d67f2b584 ****/
		%feature("compactdefaultargs") IGESGeom_BSplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_BSplineSurface;
		 IGESGeom_BSplineSurface();

		/****************** DegreeU ******************/
		/**** md5 signature: 3f52065d4ce8ac8ed5da3f2b01be8bd3 ****/
		%feature("compactdefaultargs") DegreeU;
		%feature("autodoc", "Returns degree of first set of basis functions.

Returns
-------
int
") DegreeU;
		Standard_Integer DegreeU();

		/****************** DegreeV ******************/
		/**** md5 signature: d3f3843606cfbf0d0a0fe89267fa32d7 ****/
		%feature("compactdefaultargs") DegreeV;
		%feature("autodoc", "Returns degree of second set of basis functions.

Returns
-------
int
") DegreeV;
		Standard_Integer DegreeV();

		/****************** Init ******************/
		/**** md5 signature: 6ed295c505b91f75281f656ba155bae6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class bsplinesurface - anindexu : upper index of first sum - anindexv : upper index of second sum - adegu, adegv : degrees of first and second sets of basis functions - acloseu, aclosev : 1 = closed in u, v directions 0 = open in u, v directions - apolynom : 0 = rational, 1 = polynomial - aperiodu, aperiodv : 0 = non periodic in u or v direction 1 = periodic in u or v direction - allknotsu, allknotsv : knots in u and v directions - allweights  : array of weights - allpoles : xyz coordinates of all control points - aumin : starting value of u direction - aumax : ending value of u direction - avmin : starting value of v direction - avmax : ending value of v direction raises exception if allweights & allpoles are not of same size.

Parameters
----------
anIndexU: int
anIndexV: int
aDegU: int
aDegV: int
aCloseU: bool
aCloseV: bool
aPolynom: bool
aPeriodU: bool
aPeriodV: bool
allKnotsU: TColStd_HArray1OfReal
allKnotsV: TColStd_HArray1OfReal
allWeights: TColStd_HArray2OfReal
allPoles: TColgp_HArray2OfXYZ
aUmin: float
aUmax: float
aVmin: float
aVmax: float

Returns
-------
None
") Init;
		void Init(const Standard_Integer anIndexU, const Standard_Integer anIndexV, const Standard_Integer aDegU, const Standard_Integer aDegV, const Standard_Boolean aCloseU, const Standard_Boolean aCloseV, const Standard_Boolean aPolynom, const Standard_Boolean aPeriodU, const Standard_Boolean aPeriodV, const opencascade::handle<TColStd_HArray1OfReal> & allKnotsU, const opencascade::handle<TColStd_HArray1OfReal> & allKnotsV, const opencascade::handle<TColStd_HArray2OfReal> & allWeights, const opencascade::handle<TColgp_HArray2OfXYZ> & allPoles, const Standard_Real aUmin, const Standard_Real aUmax, const Standard_Real aVmin, const Standard_Real aVmax);

		/****************** IsClosedU ******************/
		/**** md5 signature: 6cd6666c8b0a28a3d9d296f5fb5d831b ****/
		%feature("compactdefaultargs") IsClosedU;
		%feature("autodoc", "True if closed in u direction else false.

Returns
-------
bool
") IsClosedU;
		Standard_Boolean IsClosedU();

		/****************** IsClosedV ******************/
		/**** md5 signature: 6f1fdd7ee5dc0fc4a4631f68bd1f84d6 ****/
		%feature("compactdefaultargs") IsClosedV;
		%feature("autodoc", "True if closed in v direction else false.

Returns
-------
bool
") IsClosedV;
		Standard_Boolean IsClosedV();

		/****************** IsPeriodicU ******************/
		/**** md5 signature: 1e598d9c8af634fbf3edb843882cc34d ****/
		%feature("compactdefaultargs") IsPeriodicU;
		%feature("autodoc", "True if periodic in u direction else false.

Returns
-------
bool
") IsPeriodicU;
		Standard_Boolean IsPeriodicU();

		/****************** IsPeriodicV ******************/
		/**** md5 signature: 0813e1dd9e559d0e67896ceed920e167 ****/
		%feature("compactdefaultargs") IsPeriodicV;
		%feature("autodoc", "True if periodic in v direction else false.

Returns
-------
bool
") IsPeriodicV;
		Standard_Boolean IsPeriodicV();

		/****************** IsPolynomial ******************/
		/**** md5 signature: 1e2ec9d8e4fa147a1d40b3a2c6fedc7a ****/
		%feature("compactdefaultargs") IsPolynomial;
		%feature("autodoc", "True if polynomial, false if rational <flag> false (d) : computed from weights <flag> true : recorded.

Parameters
----------
flag: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsPolynomial;
		Standard_Boolean IsPolynomial(const Standard_Boolean flag = Standard_False);

		/****************** KnotU ******************/
		/**** md5 signature: e9ab818e6895d4ca7c55cb531be959c8 ****/
		%feature("compactdefaultargs") KnotU;
		%feature("autodoc", "Returns the value of knot referred to by anindex in u direction raises exception if anindex < -degreeu() or anindex > (nbknotsu() - degreeu()).

Parameters
----------
anIndex: int

Returns
-------
float
") KnotU;
		Standard_Real KnotU(const Standard_Integer anIndex);

		/****************** KnotV ******************/
		/**** md5 signature: 0375050e87406fac73faaf970cd6d9e4 ****/
		%feature("compactdefaultargs") KnotV;
		%feature("autodoc", "Returns the value of knot referred to by anindex in v direction raises exception if anindex < -degreev() or anindex > (nbknotsv() - degreev()).

Parameters
----------
anIndex: int

Returns
-------
float
") KnotV;
		Standard_Real KnotV(const Standard_Integer anIndex);

		/****************** NbKnotsU ******************/
		/**** md5 signature: c47d5e0a029948396c8605c005ed6699 ****/
		%feature("compactdefaultargs") NbKnotsU;
		%feature("autodoc", "Returns number of knots in u direction knotsu are numbered from -degreeu.

Returns
-------
int
") NbKnotsU;
		Standard_Integer NbKnotsU();

		/****************** NbKnotsV ******************/
		/**** md5 signature: b16cc9409213cbe0bdb86668bf0b98a0 ****/
		%feature("compactdefaultargs") NbKnotsV;
		%feature("autodoc", "Returns number of knots in v direction knotsv are numbered from -degreev.

Returns
-------
int
") NbKnotsV;
		Standard_Integer NbKnotsV();

		/****************** NbPolesU ******************/
		/**** md5 signature: cc64a193aa4f501df2f637127f23d67d ****/
		%feature("compactdefaultargs") NbPolesU;
		%feature("autodoc", "Returns number of poles in u direction.

Returns
-------
int
") NbPolesU;
		Standard_Integer NbPolesU();

		/****************** NbPolesV ******************/
		/**** md5 signature: cbd23d576122a8ae3071165be64f7404 ****/
		%feature("compactdefaultargs") NbPolesV;
		%feature("autodoc", "Returns number of poles in v direction.

Returns
-------
int
") NbPolesV;
		Standard_Integer NbPolesV();

		/****************** Pole ******************/
		/**** md5 signature: c5f797194ee5db65f5495f5f2709aeae ****/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the control point referenced by anindex1, anindex2 raises exception if anindex1 <= 0 or anindex1 > nbpolesu() or if anindex2 <= 0 or anindex2 > nbpolesv().

Parameters
----------
anIndex1: int
anIndex2: int

Returns
-------
gp_Pnt
") Pole;
		gp_Pnt Pole(const Standard_Integer anIndex1, const Standard_Integer anIndex2);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the shape of the surface) error if not in range [0-9].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** TransformedPole ******************/
		/**** md5 signature: 87cfa0d90b059665fadb1f6c5505df25 ****/
		%feature("compactdefaultargs") TransformedPole;
		%feature("autodoc", "Returns the control point referenced by anindex1, anindex2 after applying the transf.matrix raises exception if anindex1 <= 0 or anindex1 > nbpolesu() or if anindex2 <= 0 or anindex2 > nbpolesv().

Parameters
----------
anIndex1: int
anIndex2: int

Returns
-------
gp_Pnt
") TransformedPole;
		gp_Pnt TransformedPole(const Standard_Integer anIndex1, const Standard_Integer anIndex2);

		/****************** UMax ******************/
		/**** md5 signature: d67ae1d1678f5d09bfa5b3cb2c1fdd51 ****/
		%feature("compactdefaultargs") UMax;
		%feature("autodoc", "Returns ending value in the u direction.

Returns
-------
float
") UMax;
		Standard_Real UMax();

		/****************** UMin ******************/
		/**** md5 signature: 4c80dbd047d4a4d83e6f071174384bac ****/
		%feature("compactdefaultargs") UMin;
		%feature("autodoc", "Returns starting value in the u direction.

Returns
-------
float
") UMin;
		Standard_Real UMin();

		/****************** UpperIndexU ******************/
		/**** md5 signature: b24395c7dfc0a12554af5c95b338a908 ****/
		%feature("compactdefaultargs") UpperIndexU;
		%feature("autodoc", "Returns the upper index of the first sum (u).

Returns
-------
int
") UpperIndexU;
		Standard_Integer UpperIndexU();

		/****************** UpperIndexV ******************/
		/**** md5 signature: 5169cd7ae7373bb73c95fb93fdf4042c ****/
		%feature("compactdefaultargs") UpperIndexV;
		%feature("autodoc", "Returns the upper index of the second sum (v).

Returns
-------
int
") UpperIndexV;
		Standard_Integer UpperIndexV();

		/****************** VMax ******************/
		/**** md5 signature: 6ba449f1673839cb57aa34cf35972dc8 ****/
		%feature("compactdefaultargs") VMax;
		%feature("autodoc", "Returns ending value in the v direction.

Returns
-------
float
") VMax;
		Standard_Real VMax();

		/****************** VMin ******************/
		/**** md5 signature: 040bbb0b02e9760bd9cc365baf132106 ****/
		%feature("compactdefaultargs") VMin;
		%feature("autodoc", "Returns starting value in the v direction.

Returns
-------
float
") VMin;
		Standard_Real VMin();

		/****************** Weight ******************/
		/**** md5 signature: 644dadf77770df55c0a8e6f1ae882b70 ****/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight referred to by anindex1, anindex2 raises exception if anindex1 <= 0 or anindex1 > nbpolesu() or if anindex2 <= 0 or anindex2 > nbpolesv().

Parameters
----------
anIndex1: int
anIndex2: int

Returns
-------
float
") Weight;
		Standard_Real Weight(const Standard_Integer anIndex1, const Standard_Integer anIndex2);

};


%make_alias(IGESGeom_BSplineSurface)

%extend IGESGeom_BSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESGeom_Boundary *
**************************/
class IGESGeom_Boundary : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_Boundary ******************/
		/**** md5 signature: 69c4cf0eb47bafc5f5be9b1c86178f73 ****/
		%feature("compactdefaultargs") IGESGeom_Boundary;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Boundary;
		 IGESGeom_Boundary();

		/****************** BoundaryType ******************/
		/**** md5 signature: 418a20b1c843639f154af4478b0b32cb ****/
		%feature("compactdefaultargs") BoundaryType;
		%feature("autodoc", "Returns type of bounded surface representation 0 = boundary entities may only reference model space trimming curves. associated surface representation may be parametric 1 = boundary entities must reference model space curves and associated parameter space curve collections. associated surface must be a parametric representation.

Returns
-------
int
") BoundaryType;
		Standard_Integer BoundaryType();

		/****************** Init ******************/
		/**** md5 signature: bff030ee5b723911abf3d7fbefb6a7b3 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class boundary - atype  : type of bounded surface representation - apreference : preferred representation of trimming curve - asurface  : untrimmed surface to be bounded - allmodelcurves : model space curves - allsenses : orientation flags of all model space curves - allparametercurves : parameter space curves raises exception if allsenses, allmodelcurves and allparametercurves do not have same dimensions.

Parameters
----------
aType: int
aPreference: int
aSurface: IGESData_IGESEntity
allModelCurves: IGESData_HArray1OfIGESEntity
allSenses: TColStd_HArray1OfInteger
allParameterCurves: IGESBasic_HArray1OfHArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const Standard_Integer aType, const Standard_Integer aPreference, const opencascade::handle<IGESData_IGESEntity> & aSurface, const opencascade::handle<IGESData_HArray1OfIGESEntity> & allModelCurves, const opencascade::handle<TColStd_HArray1OfInteger> & allSenses, const opencascade::handle<IGESBasic_HArray1OfHArray1OfIGESEntity> & allParameterCurves);

		/****************** ModelSpaceCurve ******************/
		/**** md5 signature: 37f8dff59948f0a7eb657b06ae6b0109 ****/
		%feature("compactdefaultargs") ModelSpaceCurve;
		%feature("autodoc", "Returns model space curve raises exception if index <= 0 or index > nbmodelspacecurves().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ModelSpaceCurve;
		opencascade::handle<IGESData_IGESEntity> ModelSpaceCurve(const Standard_Integer Index);

		/****************** NbModelSpaceCurves ******************/
		/**** md5 signature: c690c877f876afe768a9e44b7fdcf468 ****/
		%feature("compactdefaultargs") NbModelSpaceCurves;
		%feature("autodoc", "Returns the number of model space curves.

Returns
-------
int
") NbModelSpaceCurves;
		Standard_Integer NbModelSpaceCurves();

		/****************** NbParameterCurves ******************/
		/**** md5 signature: 53c45e7658a234132e123042f2e66ff5 ****/
		%feature("compactdefaultargs") NbParameterCurves;
		%feature("autodoc", "Returns the number of parameter curves associated with one model space curve referred to by index raises exception if index <= 0 or index > nbmodelspacecurves().

Parameters
----------
Index: int

Returns
-------
int
") NbParameterCurves;
		Standard_Integer NbParameterCurves(const Standard_Integer Index);

		/****************** ParameterCurve ******************/
		/**** md5 signature: 6a9fce2f471c41096cf3581ee5a3eebd ****/
		%feature("compactdefaultargs") ParameterCurve;
		%feature("autodoc", "Returns an individual parameter curve raises exception if index or num is out of range.

Parameters
----------
Index: int
Num: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ParameterCurve;
		opencascade::handle<IGESData_IGESEntity> ParameterCurve(const Standard_Integer Index, const Standard_Integer Num);

		/****************** ParameterCurves ******************/
		/**** md5 signature: 5b0fb29c8f599e5c9c947a27b8089471 ****/
		%feature("compactdefaultargs") ParameterCurves;
		%feature("autodoc", "Returns an array of parameter space curves associated with a model space curve referred to by the index raises exception if index <= 0 or index > nbmodelspacecurves().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_HArray1OfIGESEntity>
") ParameterCurves;
		opencascade::handle<IGESData_HArray1OfIGESEntity> ParameterCurves(const Standard_Integer Index);

		/****************** PreferenceType ******************/
		/**** md5 signature: 04cde7fa123dae07106ecc3bd0e8e4eb ****/
		%feature("compactdefaultargs") PreferenceType;
		%feature("autodoc", "Returns preferred representation of trimming curves 0 = unspecified 1 = model space 2 = parameter space 3 = representations are of equal preference.

Returns
-------
int
") PreferenceType;
		Standard_Integer PreferenceType();

		/****************** Sense ******************/
		/**** md5 signature: d895823fe7d0d9d5f4f1d80d4d2bf383 ****/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "Returns the sense of a particular model space curve 1 = model curve direction does not need reversal 2 = model curve direction needs to be reversed raises exception if index <= 0 or index > nbmodelspacecurves().

Parameters
----------
Index: int

Returns
-------
int
") Sense;
		Standard_Integer Sense(const Standard_Integer Index);

		/****************** Surface ******************/
		/**** md5 signature: 21224d36ecde9943682f882d2d37c893 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface to be bounded.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Surface;
		opencascade::handle<IGESData_IGESEntity> Surface();

};


%make_alias(IGESGeom_Boundary)

%extend IGESGeom_Boundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGeom_BoundedSurface *
********************************/
class IGESGeom_BoundedSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_BoundedSurface ******************/
		/**** md5 signature: 756d19ea3e7ca1b75ff17758149f7e3c ****/
		%feature("compactdefaultargs") IGESGeom_BoundedSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_BoundedSurface;
		 IGESGeom_BoundedSurface();

		/****************** Boundary ******************/
		/**** md5 signature: 90b6b3636399214c91d9e17ec822d3b8 ****/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "Returns boundary entity raises exception if index <= 0 or index > nbboundaries().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGeom_Boundary>
") Boundary;
		opencascade::handle<IGESGeom_Boundary> Boundary(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: eb9ed34aa5aa46661ba55d4d081faaba ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class boundedsurface - atype : type of bounded surface representation - asurface : surface entity to be bounded - allbounds : array of boundary entities.

Parameters
----------
aType: int
aSurface: IGESData_IGESEntity
allBounds: IGESGeom_HArray1OfBoundary

Returns
-------
None
") Init;
		void Init(const Standard_Integer aType, const opencascade::handle<IGESData_IGESEntity> & aSurface, const opencascade::handle<IGESGeom_HArray1OfBoundary> & allBounds);

		/****************** NbBoundaries ******************/
		/**** md5 signature: 323b6e26295515e892919c1c737b3943 ****/
		%feature("compactdefaultargs") NbBoundaries;
		%feature("autodoc", "Returns the number of boundaries.

Returns
-------
int
") NbBoundaries;
		Standard_Integer NbBoundaries();

		/****************** RepresentationType ******************/
		/**** md5 signature: d2a4a972923c1f5b2c9455cd055ce26f ****/
		%feature("compactdefaultargs") RepresentationType;
		%feature("autodoc", "Returns the type of bounded surface representation 0 = the boundary entities may only reference model space curves 1 = the boundary entities may reference both model space curves and associated parameter space curve representations.

Returns
-------
int
") RepresentationType;
		Standard_Integer RepresentationType();

		/****************** Surface ******************/
		/**** md5 signature: 21224d36ecde9943682f882d2d37c893 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bounded surface.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Surface;
		opencascade::handle<IGESData_IGESEntity> Surface();

};


%make_alias(IGESGeom_BoundedSurface)

%extend IGESGeom_BoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESGeom_CircularArc *
*****************************/
class IGESGeom_CircularArc : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_CircularArc ******************/
		/**** md5 signature: 382bc3b5f8bb4fa1ef9ed63a70be2ddf ****/
		%feature("compactdefaultargs") IGESGeom_CircularArc;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_CircularArc;
		 IGESGeom_CircularArc();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle subtended by the arc at the center in radians.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Axis ******************/
		/**** md5 signature: aaa2fda5c52a82f447c01991d32ce52e ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Z-axis of circle (i.e. [0,0,1]).

Returns
-------
gp_Dir
") Axis;
		gp_Dir Axis();

		/****************** Center ******************/
		/**** md5 signature: d391c25a397769ea5062a9d76f265423 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns the center of the circle of which arc forms a part.

Returns
-------
gp_Pnt2d
") Center;
		gp_Pnt2d Center();

		/****************** EndPoint ******************/
		/**** md5 signature: da59cd71c2648b4e343d3a81a4d4c9a3 ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of the arc.

Returns
-------
gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** Init ******************/
		/**** md5 signature: 301ee98a3135a83dc4c3f79fbfa9d200 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class circulararc - azt : shift above the z plane - acenter : center of the circle of which the arc forms a part - astart : starting point of the circular arc - anend : ending point of the circular arc.

Parameters
----------
aZT: float
aCenter: gp_XY
aStart: gp_XY
anEnd: gp_XY

Returns
-------
None
") Init;
		void Init(const Standard_Real aZT, const gp_XY & aCenter, const gp_XY & aStart, const gp_XY & anEnd);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "True if startpoint = endpoint.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** Radius ******************/
		/**** md5 signature: 506a8dc1140a54bd4146c24bb5357fbf ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the circle of which arc forms a part.

Returns
-------
float
") Radius;
		Standard_Real Radius();

		/****************** StartPoint ******************/
		/**** md5 signature: e8af2ccdba4294cfb4e4f0a3965d5380 ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the arc.

Returns
-------
gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** TransformedAxis ******************/
		/**** md5 signature: 988bb846dc3a9d88e859e39c1d608827 ****/
		%feature("compactdefaultargs") TransformedAxis;
		%feature("autodoc", "Z-axis after applying trans. matrix.

Returns
-------
gp_Dir
") TransformedAxis;
		gp_Dir TransformedAxis();

		/****************** TransformedCenter ******************/
		/**** md5 signature: 5d09d843a8d98dff53df916007422526 ****/
		%feature("compactdefaultargs") TransformedCenter;
		%feature("autodoc", "Returns the center of the circle of which arc forms a part after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedCenter;
		gp_Pnt TransformedCenter();

		/****************** TransformedEndPoint ******************/
		/**** md5 signature: cf99fc5a43b0bbe4c838148e46465f03 ****/
		%feature("compactdefaultargs") TransformedEndPoint;
		%feature("autodoc", "Returns the end point of the arc after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedEndPoint;
		gp_Pnt TransformedEndPoint();

		/****************** TransformedStartPoint ******************/
		/**** md5 signature: 52891d9ea33eb64a30c21d9eca4b46e7 ****/
		%feature("compactdefaultargs") TransformedStartPoint;
		%feature("autodoc", "Returns the start point of the arc after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedStartPoint;
		gp_Pnt TransformedStartPoint();

		/****************** ZPlane ******************/
		/**** md5 signature: 0af14e11d287fcdce1314860bbee171a ****/
		%feature("compactdefaultargs") ZPlane;
		%feature("autodoc", "Returns the parallel displacement of the plane containing the arc from the xt, yt plane.

Returns
-------
float
") ZPlane;
		Standard_Real ZPlane();

};


%make_alias(IGESGeom_CircularArc)

%extend IGESGeom_CircularArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGeom_CompositeCurve *
********************************/
class IGESGeom_CompositeCurve : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_CompositeCurve ******************/
		/**** md5 signature: 9bd657ab56d62e93e1de556737b108bf ****/
		%feature("compactdefaultargs") IGESGeom_CompositeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_CompositeCurve;
		 IGESGeom_CompositeCurve();

		/****************** Curve ******************/
		/**** md5 signature: 49777174251a8921d23b37946ce12613 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns component of the compositecurve (a curve or a point) raises exception if index <= 0 or index > nbcurves().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Curve;
		opencascade::handle<IGESData_IGESEntity> Curve(const Standard_Integer Index);

		/****************** Init ******************/
		/**** md5 signature: ec47c5bf17ea714b5fca1a83b15f48db ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class compositecurve - allentities : constituent entities of the composite curve.

Parameters
----------
allEntities: IGESData_HArray1OfIGESEntity

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_HArray1OfIGESEntity> & allEntities);

		/****************** NbCurves ******************/
		/**** md5 signature: f7f6dbd981df076443155a5a87b5c223 ****/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the number of curves contained in the compositecurve.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

};


%make_alias(IGESGeom_CompositeCurve)

%extend IGESGeom_CompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESGeom_ConicArc *
**************************/
class IGESGeom_ConicArc : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_ConicArc ******************/
		/**** md5 signature: a7d50586b6021ed98d34f6cf9d6c36e9 ****/
		%feature("compactdefaultargs") IGESGeom_ConicArc;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_ConicArc;
		 IGESGeom_ConicArc();

		/****************** Axis ******************/
		/**** md5 signature: aaa2fda5c52a82f447c01991d32ce52e ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Z-axis of conic (i.e. [0,0,1]).

Returns
-------
gp_Dir
") Axis;
		gp_Dir Axis();

		/****************** ComputedDefinition ******************/
		/**** md5 signature: 4ca53e499670bf5a685b0c5a741bc6ef ****/
		%feature("compactdefaultargs") ComputedDefinition;
		%feature("autodoc", "Computes and returns the coordinates of the definition of a comic from its equation. used by definition & transformeddefinition, or may be called directly if needed.

Parameters
----------

Returns
-------
Xcen: float
Ycen: float
Xax: float
Yax: float
Rmin: float
Rmax: float
") ComputedDefinition;
		void ComputedDefinition(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ComputedFormNumber ******************/
		/**** md5 signature: a05e326ae4fd2dbb10d681362ccec261 ****/
		%feature("compactdefaultargs") ComputedFormNumber;
		%feature("autodoc", "Computes the form number according to the equation 1 for ellipse, 2 for hyperbola, 3 for parabola.

Returns
-------
int
") ComputedFormNumber;
		Standard_Integer ComputedFormNumber();

		/****************** Definition ******************/
		/**** md5 signature: ce4ac56e1067f81e4f054527ed6dd6e8 ****/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns a definition computed from equation, easier to use <center> : the center of the conic (meaningless for a parabola) (defined with z displacement) <mainaxis> : the main axis of the conic (for a circle, arbitrary the x axis) <rmin,rmax> : minor and major radii of the conic for a circle, rmin = rmax, for a parabola, rmin = rmax = the focal warning : the basic definition (by equation) is not very stable, limit cases may be approximative.

Parameters
----------
Center: gp_Pnt
MainAxis: gp_Dir

Returns
-------
rmin: float
rmax: float
") Definition;
		void Definition(gp_Pnt & Center, gp_Dir & MainAxis, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EndPoint ******************/
		/**** md5 signature: da59cd71c2648b4e343d3a81a4d4c9a3 ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of the arc.

Returns
-------
gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** Equation ******************/
		/**** md5 signature: 2380c54785346dcadbfe757c4852b5fd ****/
		%feature("compactdefaultargs") Equation;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
E: float
F: float
") Equation;
		void Equation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 9614361194ad8e1f81b7647a9f0c5fb6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class conicalarc - a, b, c, d, e, f : coefficients of the equation defining conic arc - zt : parallel zt displacement of the arc from xt, yt plane. - astart  : starting point of the conic arc - anend : end point of the conic arc.

Parameters
----------
A: float
B: float
C: float
D: float
E: float
F: float
ZT: float
aStart: gp_XY
anEnd: gp_XY

Returns
-------
None
") Init;
		void Init(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E, const Standard_Real F, const Standard_Real ZT, const gp_XY & aStart, const gp_XY & anEnd);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if startpoint = endpoint.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsFromEllipse ******************/
		/**** md5 signature: 7f251c2b4e10345d3a31ad2e5d961a38 ****/
		%feature("compactdefaultargs") IsFromEllipse;
		%feature("autodoc", "Returns true if parent conic curve is an ellipse.

Returns
-------
bool
") IsFromEllipse;
		Standard_Boolean IsFromEllipse();

		/****************** IsFromHyperbola ******************/
		/**** md5 signature: 57371787df1636aa024be707593d6521 ****/
		%feature("compactdefaultargs") IsFromHyperbola;
		%feature("autodoc", "Returns true if parent conic curve is a hyperbola.

Returns
-------
bool
") IsFromHyperbola;
		Standard_Boolean IsFromHyperbola();

		/****************** IsFromParabola ******************/
		/**** md5 signature: 242f48ed3eb74a898176090756165cf7 ****/
		%feature("compactdefaultargs") IsFromParabola;
		%feature("autodoc", "Returns true if parent conic curve is a parabola.

Returns
-------
bool
") IsFromParabola;
		Standard_Boolean IsFromParabola();

		/****************** OwnCorrect ******************/
		/**** md5 signature: a9e45b136fcf07e4905e0211d63ffaf6 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets the form number equal to computedformnumber, returns true if changed.

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect();

		/****************** StartPoint ******************/
		/**** md5 signature: e8af2ccdba4294cfb4e4f0a3965d5380 ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the starting point of the arc.

Returns
-------
gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** TransformedAxis ******************/
		/**** md5 signature: 988bb846dc3a9d88e859e39c1d608827 ****/
		%feature("compactdefaultargs") TransformedAxis;
		%feature("autodoc", "Z-axis after applying trans. matrix.

Returns
-------
gp_Dir
") TransformedAxis;
		gp_Dir TransformedAxis();

		/****************** TransformedDefinition ******************/
		/**** md5 signature: 02f12a519ae3cfad00bb4e59fce31ce6 ****/
		%feature("compactdefaultargs") TransformedDefinition;
		%feature("autodoc", "Same as definition, but the location is applied on the center and the mainaxis.

Parameters
----------
Center: gp_Pnt
MainAxis: gp_Dir

Returns
-------
rmin: float
rmax: float
") TransformedDefinition;
		void TransformedDefinition(gp_Pnt & Center, gp_Dir & MainAxis, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TransformedEndPoint ******************/
		/**** md5 signature: cf99fc5a43b0bbe4c838148e46465f03 ****/
		%feature("compactdefaultargs") TransformedEndPoint;
		%feature("autodoc", "Returns the end point of the arc after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedEndPoint;
		gp_Pnt TransformedEndPoint();

		/****************** TransformedStartPoint ******************/
		/**** md5 signature: 52891d9ea33eb64a30c21d9eca4b46e7 ****/
		%feature("compactdefaultargs") TransformedStartPoint;
		%feature("autodoc", "Returns the starting point of the arc after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedStartPoint;
		gp_Pnt TransformedStartPoint();

		/****************** ZPlane ******************/
		/**** md5 signature: 0af14e11d287fcdce1314860bbee171a ****/
		%feature("compactdefaultargs") ZPlane;
		%feature("autodoc", "Returns the z displacement of the arc from xt, yt plane.

Returns
-------
float
") ZPlane;
		Standard_Real ZPlane();

};


%make_alias(IGESGeom_ConicArc)

%extend IGESGeom_ConicArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESGeom_CopiousData *
*****************************/
class IGESGeom_CopiousData : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_CopiousData ******************/
		/**** md5 signature: b4e2d5fa7a637638ebf79f936f641ab4 ****/
		%feature("compactdefaultargs") IGESGeom_CopiousData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_CopiousData;
		 IGESGeom_CopiousData();

		/****************** Data ******************/
		/**** md5 signature: 1e58ce07b3a263a4c17a073b9e126b0b ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns an individual data, given the n0 of the point and the b0 of the coordinate (according datatype).

Parameters
----------
NumPoint: int
NumData: int

Returns
-------
float
") Data;
		Standard_Real Data(const Standard_Integer NumPoint, const Standard_Integer NumData);

		/****************** DataType ******************/
		/**** md5 signature: 6635b41a6e7c415ffe018ddf92784b58 ****/
		%feature("compactdefaultargs") DataType;
		%feature("autodoc", "Returns data type 1 = xy ( with common z given by plane) 2 = xyz ( point) 3 = xyz + vec(xyz) (point + normal vector).

Returns
-------
int
") DataType;
		Standard_Integer DataType();

		/****************** Init ******************/
		/**** md5 signature: 1b730f7e4dcb28f8aacdcca9cdac7642 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class copiousdata - adatatype : specifies whether data is a pair or a triple or a sextuple. - azplane : common z value for all points if datatype = 1 - alldata : data to be read in groups of 2, 3 or 6.

Parameters
----------
aDataType: int
aZPlane: float
allData: TColStd_HArray1OfReal

Returns
-------
None
") Init;
		void Init(const Standard_Integer aDataType, const Standard_Real aZPlane, const opencascade::handle<TColStd_HArray1OfReal> & allData);

		/****************** IsClosedPath2D ******************/
		/**** md5 signature: 836bc2e8ab67029f9330e14555436b61 ****/
		%feature("compactdefaultargs") IsClosedPath2D;
		%feature("autodoc", "Returns true if <self> is a closed path 2d (form 63).

Returns
-------
bool
") IsClosedPath2D;
		Standard_Boolean IsClosedPath2D();

		/****************** IsPointSet ******************/
		/**** md5 signature: 3ce93517ceca56dff486167c1c82a97c ****/
		%feature("compactdefaultargs") IsPointSet;
		%feature("autodoc", "Returns true if <self> is a set of points (form 1-2-3).

Returns
-------
bool
") IsPointSet;
		Standard_Boolean IsPointSet();

		/****************** IsPolyline ******************/
		/**** md5 signature: 7b725a810acbed92eb83a3eb2339a4f0 ****/
		%feature("compactdefaultargs") IsPolyline;
		%feature("autodoc", "Returns true if <self> is a polyline (form 11-12-13).

Returns
-------
bool
") IsPolyline;
		Standard_Boolean IsPolyline();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of tuples.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: 839ed049b8193272d692193951617241 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the coordinates of the point specified by the anindex raises exception if anindex <= 0 or anindex > nbpoints().

Parameters
----------
anIndex: int

Returns
-------
gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer anIndex);

		/****************** SetClosedPath2D ******************/
		/**** md5 signature: aa0b40fafbc248de10ccd7ecb37ac1be ****/
		%feature("compactdefaultargs") SetClosedPath2D;
		%feature("autodoc", "Sets copious data to be a closed path 2d (form 63) warning : datatype is not checked and must be set to one by init.

Returns
-------
None
") SetClosedPath2D;
		void SetClosedPath2D();

		/****************** SetPolyline ******************/
		/**** md5 signature: 5a17e9771ff17e0b0fdf95d79172fe99 ****/
		%feature("compactdefaultargs") SetPolyline;
		%feature("autodoc", "Sets copious data to be a polyline if <mode> is true (form = 11-12-13) or a set of points else (form 1-2-3).

Parameters
----------
mode: bool

Returns
-------
None
") SetPolyline;
		void SetPolyline(const Standard_Boolean mode);

		/****************** TransformedPoint ******************/
		/**** md5 signature: 7442fd62f826e9219da87edf0e1b6af2 ****/
		%feature("compactdefaultargs") TransformedPoint;
		%feature("autodoc", "Returns the coordinates of the point specified by the anindex after applying transf. matrix raises exception if anindex <= 0 or anindex > nbpoints().

Parameters
----------
anIndex: int

Returns
-------
gp_Pnt
") TransformedPoint;
		gp_Pnt TransformedPoint(const Standard_Integer anIndex);

		/****************** TransformedVector ******************/
		/**** md5 signature: 83e1c3202aa221f8d69a3a7b197a28d3 ****/
		%feature("compactdefaultargs") TransformedVector;
		%feature("autodoc", "Returns transformed vector if 3-tuple else returns (0, 0, 0) raises exception if anindex <= 0 or anindex > nbpoints().

Parameters
----------
anIndex: int

Returns
-------
gp_Vec
") TransformedVector;
		gp_Vec TransformedVector(const Standard_Integer anIndex);

		/****************** Vector ******************/
		/**** md5 signature: 06f6e3fa7fba53c470f6397deeb2ead4 ****/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Returns i, j, k values if 3-tuple else returns (0, 0, 0) raises exception if anindex <= 0 or anindex > nbpoints().

Parameters
----------
anIndex: int

Returns
-------
gp_Vec
") Vector;
		gp_Vec Vector(const Standard_Integer anIndex);

		/****************** ZPlane ******************/
		/**** md5 signature: 0af14e11d287fcdce1314860bbee171a ****/
		%feature("compactdefaultargs") ZPlane;
		%feature("autodoc", "If datatype = 1, then returns common z value for all data else returns 0.

Returns
-------
float
") ZPlane;
		Standard_Real ZPlane();

};


%make_alias(IGESGeom_CopiousData)

%extend IGESGeom_CopiousData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGeom_CurveOnSurface *
********************************/
class IGESGeom_CurveOnSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_CurveOnSurface ******************/
		/**** md5 signature: caad4ae7f73ee03a60ab5be2b3f10e54 ****/
		%feature("compactdefaultargs") IGESGeom_CurveOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_CurveOnSurface;
		 IGESGeom_CurveOnSurface();

		/****************** CreationMode ******************/
		/**** md5 signature: 76968838702ebe8c9ef1f4c001e47e32 ****/
		%feature("compactdefaultargs") CreationMode;
		%feature("autodoc", "Returns the mode in which the curve is created on the surface 0 = unspecified 1 = projection of a given curve on the surface 2 = intersection of two surfaces 3 = isoparametric curve, i.e:- either a `u` parametric or a `v` parametric curve.

Returns
-------
int
") CreationMode;
		Standard_Integer CreationMode();

		/****************** Curve3D ******************/
		/**** md5 signature: f5fd84fefb7b7673e405112502e29a30 ****/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "Returns curve c.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Curve3D;
		opencascade::handle<IGESData_IGESEntity> Curve3D();

		/****************** CurveUV ******************/
		/**** md5 signature: 7773e49990c24e9972ec082eca552dbf ****/
		%feature("compactdefaultargs") CurveUV;
		%feature("autodoc", "Returns curve s.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") CurveUV;
		opencascade::handle<IGESData_IGESEntity> CurveUV();

		/****************** Init ******************/
		/**** md5 signature: bc796a66ca85a68b09fbf3ea95f316ce ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class curveonsurface - amode : way the curve on the surface has been created - asurface : surface on which the curve lies - acurveuv : curve s (uv) - acurve3d : curve c (3d) - apreference : 0 = unspecified 1 = s o b is preferred 2 = c is preferred 3 = c and s o b are equally preferred.

Parameters
----------
aMode: int
aSurface: IGESData_IGESEntity
aCurveUV: IGESData_IGESEntity
aCurve3D: IGESData_IGESEntity
aPreference: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer aMode, const opencascade::handle<IGESData_IGESEntity> & aSurface, const opencascade::handle<IGESData_IGESEntity> & aCurveUV, const opencascade::handle<IGESData_IGESEntity> & aCurve3D, const Standard_Integer aPreference);

		/****************** PreferenceMode ******************/
		/**** md5 signature: 8fde1b1c3222ad491656386ad8c6e6e6 ****/
		%feature("compactdefaultargs") PreferenceMode;
		%feature("autodoc", "Returns preference mode 0 = unspecified 1 = s o b is preferred 2 = c is preferred 3 = c and s o b are equally preferred.

Returns
-------
int
") PreferenceMode;
		Standard_Integer PreferenceMode();

		/****************** Surface ******************/
		/**** md5 signature: 21224d36ecde9943682f882d2d37c893 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface on which the curve lies.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Surface;
		opencascade::handle<IGESData_IGESEntity> Surface();

};


%make_alias(IGESGeom_CurveOnSurface)

%extend IGESGeom_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESGeom_Direction *
***************************/
class IGESGeom_Direction : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_Direction ******************/
		/**** md5 signature: 3ef601e14059e4458b871a34626155e3 ****/
		%feature("compactdefaultargs") IGESGeom_Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Direction;
		 IGESGeom_Direction();

		/****************** Init ******************/
		/**** md5 signature: 379f151e4bfeedbf5797821d8bcc1566 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class direction - adirection : direction ratios, z is 0 by default.

Parameters
----------
aDirection: gp_XYZ

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aDirection);

		/****************** TransformedValue ******************/
		/**** md5 signature: 5e4c5881bc8037894b0546154a52217b ****/
		%feature("compactdefaultargs") TransformedValue;
		%feature("autodoc", "Returns the direction value after applying transformation matrix.

Returns
-------
gp_Vec
") TransformedValue;
		gp_Vec TransformedValue();

		/****************** Value ******************/
		/**** md5 signature: bf1ff191989adecddd0973234b3b1d47 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Value;
		gp_Vec Value();

};


%make_alias(IGESGeom_Direction)

%extend IGESGeom_Direction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESGeom_Flash *
***********************/
class IGESGeom_Flash : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_Flash ******************/
		/**** md5 signature: fbfe56ce4624b18390b6acc0430b40b5 ****/
		%feature("compactdefaultargs") IGESGeom_Flash;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Flash;
		 IGESGeom_Flash();

		/****************** Dimension1 ******************/
		/**** md5 signature: 22b0a9bb11648d02e6a54f54dc1f5b6a ****/
		%feature("compactdefaultargs") Dimension1;
		%feature("autodoc", "Returns first flash sizing parameter.

Returns
-------
float
") Dimension1;
		Standard_Real Dimension1();

		/****************** Dimension2 ******************/
		/**** md5 signature: 2a1d294da9e4f98fc153d15bf13bc879 ****/
		%feature("compactdefaultargs") Dimension2;
		%feature("autodoc", "Returns second flash sizing parameter.

Returns
-------
float
") Dimension2;
		Standard_Real Dimension2();

		/****************** HasReferenceEntity ******************/
		/**** md5 signature: d8996ebf9828a242cd90044b98109386 ****/
		%feature("compactdefaultargs") HasReferenceEntity;
		%feature("autodoc", "Returns true if referenced entity is present.

Returns
-------
bool
") HasReferenceEntity;
		Standard_Boolean HasReferenceEntity();

		/****************** Init ******************/
		/**** md5 signature: bdeb43df65f8c02f9f581b911da78a0f ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class flash - apoint : reference of flash - adim : first flash sizing parameter - anotherdim : second flash sizing parameter - arotation : rotation of flash about reference point in radians - areference : pointer to the referenced entity or null.

Parameters
----------
aPoint: gp_XY
aDim: float
anotherDim: float
aRotation: float
aReference: IGESData_IGESEntity

Returns
-------
None
") Init;
		void Init(const gp_XY & aPoint, const Standard_Real aDim, const Standard_Real anotherDim, const Standard_Real aRotation, const opencascade::handle<IGESData_IGESEntity> & aReference);

		/****************** ReferenceEntity ******************/
		/**** md5 signature: 48d09e75afa410dda9af5cde889d6496 ****/
		%feature("compactdefaultargs") ReferenceEntity;
		%feature("autodoc", "Returns the referenced entity or null handle.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") ReferenceEntity;
		opencascade::handle<IGESData_IGESEntity> ReferenceEntity();

		/****************** ReferencePoint ******************/
		/**** md5 signature: c68fb51bc24312ba4ac8e957480de6ed ****/
		%feature("compactdefaultargs") ReferencePoint;
		%feature("autodoc", "Returns the referenced point, z = 0 always.

Returns
-------
gp_Pnt2d
") ReferencePoint;
		gp_Pnt2d ReferencePoint();

		/****************** Rotation ******************/
		/**** md5 signature: 88f76ec12684cd0cd3209460634d1bdf ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Returns the angle in radians of the rotation of flash about the reference point.

Returns
-------
float
") Rotation;
		Standard_Real Rotation();

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the nature of the flash : 0 unspecified, then given by reference, 1->4 various specialisations (circle,rectangle, etc...) ) error if not in range [0-4].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** TransformedReferencePoint ******************/
		/**** md5 signature: b4dcc51f7df1af966e2aeb4f8b412d65 ****/
		%feature("compactdefaultargs") TransformedReferencePoint;
		%feature("autodoc", "Returns the referenced point after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedReferencePoint;
		gp_Pnt TransformedReferencePoint();

};


%make_alias(IGESGeom_Flash)

%extend IGESGeom_Flash {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESGeom_GeneralModule *
*******************************/
class IGESGeom_GeneralModule : public IGESData_GeneralModule {
	public:
		/****************** IGESGeom_GeneralModule ******************/
		/**** md5 signature: 3f14a3971993536a359b475025fb0472 ****/
		%feature("compactdefaultargs") IGESGeom_GeneralModule;
		%feature("autodoc", "Creates a generalmodule from igesgeom and puts it into generallib.

Returns
-------
None
") IGESGeom_GeneralModule;
		 IGESGeom_GeneralModule();

		/****************** CategoryNumber ******************/
		/**** md5 signature: d812efe400e2084fa824301d3c147806 ****/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns a category number which characterizes an entity shape for all, but drawing for : flash; point with a symbol; plane with a symbol.

Parameters
----------
CN: int
ent: Standard_Transient
shares: Interface_ShareTool

Returns
-------
int
") CategoryNumber;
		virtual Standard_Integer CategoryNumber(const Standard_Integer CN, const opencascade::handle<Standard_Transient> & ent, const Interface_ShareTool & shares);

		/****************** DirChecker ******************/
		/**** md5 signature: 06ffbfa1e4d88543cc06fdf7c67993ee ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns a dirchecker, specific for each type of entity (identified by its case number) : this dirchecker defines constraints which must be respected by the directorypart.

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** NewVoid ******************/
		/**** md5 signature: 8e184c5622d3823d145bc2105790b57a ****/
		%feature("compactdefaultargs") NewVoid;
		%feature("autodoc", "Specific creation of a new void entity.

Parameters
----------
CN: int
entto: Standard_Transient

Returns
-------
bool
") NewVoid;
		Standard_Boolean NewVoid(const Standard_Integer CN, opencascade::handle<Standard_Transient> & entto);

		/****************** OwnCheckCase ******************/
		/**** md5 signature: a04fd9a5e3c5ef0e136832f7ce57363b ****/
		%feature("compactdefaultargs") OwnCheckCase;
		%feature("autodoc", "Performs specific semantic check for each type of entity.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheckCase;
		void OwnCheckCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopyCase ******************/
		/**** md5 signature: 5c0289b7b5a5ec08bef5e9dac3d445b7 ****/
		%feature("compactdefaultargs") OwnCopyCase;
		%feature("autodoc", "Copies parameters which are specific of each type of entity.

Parameters
----------
CN: int
entfrom: IGESData_IGESEntity
entto: IGESData_IGESEntity
TC: Interface_CopyTool

Returns
-------
None
") OwnCopyCase;
		void OwnCopyCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & entfrom, const opencascade::handle<IGESData_IGESEntity> & entto, Interface_CopyTool & TC);

		/****************** OwnSharedCase ******************/
		/**** md5 signature: 1d978dfb0f38035ed4292cc342ee187f ****/
		%feature("compactdefaultargs") OwnSharedCase;
		%feature("autodoc", "Lists the entities shared by a given igesentity <ent>, from its specific parameters : specific for each type.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
iter: Interface_EntityIterator

Returns
-------
None
") OwnSharedCase;
		void OwnSharedCase(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, Interface_EntityIterator & iter);

};


%make_alias(IGESGeom_GeneralModule)

%extend IGESGeom_GeneralModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IGESGeom_Line *
**********************/
class IGESGeom_Line : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_Line ******************/
		/**** md5 signature: da8b7ae6c46e909ab2cb5c594462be8e ****/
		%feature("compactdefaultargs") IGESGeom_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Line;
		 IGESGeom_Line();

		/****************** EndPoint ******************/
		/**** md5 signature: c57ea612ee9ec9a4548616a115433b1b ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of the line.

Returns
-------
gp_Pnt
") EndPoint;
		gp_Pnt EndPoint();

		/****************** Infinite ******************/
		/**** md5 signature: b29a09fa6bdd5c3656158c9591287fcb ****/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns the infinite status i.e. the form number : 0 1 2.

Returns
-------
int
") Infinite;
		Standard_Integer Infinite();

		/****************** Init ******************/
		/**** md5 signature: 5e4c53d67529df3b2184ff0bee6fa4e9 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class line - astart : start point of the line - anend : end point of the line.

Parameters
----------
aStart: gp_XYZ
anEnd: gp_XYZ

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aStart, const gp_XYZ & anEnd);

		/****************** SetInfinite ******************/
		/**** md5 signature: 14e6ecb7f6a80336bdaaf2e2505e7985 ****/
		%feature("compactdefaultargs") SetInfinite;
		%feature("autodoc", "Sets the infinite status does nothing if <status> is not 0 1 or 2.

Parameters
----------
status: int

Returns
-------
None
") SetInfinite;
		void SetInfinite(const Standard_Integer status);

		/****************** StartPoint ******************/
		/**** md5 signature: 6f2ee6612c78b9399249ac4637647182 ****/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the line.

Returns
-------
gp_Pnt
") StartPoint;
		gp_Pnt StartPoint();

		/****************** TransformedEndPoint ******************/
		/**** md5 signature: cf99fc5a43b0bbe4c838148e46465f03 ****/
		%feature("compactdefaultargs") TransformedEndPoint;
		%feature("autodoc", "Returns the end point of the line after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedEndPoint;
		gp_Pnt TransformedEndPoint();

		/****************** TransformedStartPoint ******************/
		/**** md5 signature: 52891d9ea33eb64a30c21d9eca4b46e7 ****/
		%feature("compactdefaultargs") TransformedStartPoint;
		%feature("autodoc", "Returns the start point of the line after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedStartPoint;
		gp_Pnt TransformedStartPoint();

};


%make_alias(IGESGeom_Line)

%extend IGESGeom_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESGeom_OffsetCurve *
*****************************/
class IGESGeom_OffsetCurve : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_OffsetCurve ******************/
		/**** md5 signature: 9d48ae600477e293f29876aee0ffee7d ****/
		%feature("compactdefaultargs") IGESGeom_OffsetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_OffsetCurve;
		 IGESGeom_OffsetCurve();

		/****************** ArcLength1 ******************/
		/**** md5 signature: 64dbb808dfbef0da439ba1c42c699b7e ****/
		%feature("compactdefaultargs") ArcLength1;
		%feature("autodoc", "Returns arc length or parameter value (depending on value of offset distance flag) of first offset distance (only used if offsettype() = 2).

Returns
-------
float
") ArcLength1;
		Standard_Real ArcLength1();

		/****************** ArcLength2 ******************/
		/**** md5 signature: fee3278117e5c153a4d139ed6c66e184 ****/
		%feature("compactdefaultargs") ArcLength2;
		%feature("autodoc", "Returns arc length or parameter value (depending on value of offset distance flag) of second offset distance (only used if offsettype() = 2).

Returns
-------
float
") ArcLength2;
		Standard_Real ArcLength2();

		/****************** BaseCurve ******************/
		/**** md5 signature: dcbffe5e75ea351032fa55ed826e86cf ****/
		%feature("compactdefaultargs") BaseCurve;
		%feature("autodoc", "Returns the curve to be offset.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") BaseCurve;
		opencascade::handle<IGESData_IGESEntity> BaseCurve();

		/****************** EndParameter ******************/
		/**** md5 signature: 9ef1ae3b83cd6f3ce8a9ebc39eefe62c ****/
		%feature("compactdefaultargs") EndParameter;
		%feature("autodoc", "Returns end parameter value of the offset curve.

Returns
-------
float
") EndParameter;
		Standard_Real EndParameter();

		/****************** FirstOffsetDistance ******************/
		/**** md5 signature: 052a4b955389797b05496bc947b043fb ****/
		%feature("compactdefaultargs") FirstOffsetDistance;
		%feature("autodoc", "Returns first offset distance (only used if offsettype() = 1 or 2).

Returns
-------
float
") FirstOffsetDistance;
		Standard_Real FirstOffsetDistance();

		/****************** Function ******************/
		/**** md5 signature: c584ec74d81c6feae4d11abd408dcbc0 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Returns the function defining the offset if at all the offset is described as a function or null handle.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Function;
		opencascade::handle<IGESData_IGESEntity> Function();

		/****************** FunctionParameter ******************/
		/**** md5 signature: 2553fc307db0c59696b9435dc2aa43af ****/
		%feature("compactdefaultargs") FunctionParameter;
		%feature("autodoc", "Returns particular coordinate of the curve which describes offset as a function of its parameters. (only used if offsettype() = 3).

Returns
-------
int
") FunctionParameter;
		Standard_Integer FunctionParameter();

		/****************** HasFunction ******************/
		/**** md5 signature: 65280d3be8323a053bc75aacf55eeacd ****/
		%feature("compactdefaultargs") HasFunction;
		%feature("autodoc", "Returns true if function defining the offset is present.

Returns
-------
bool
") HasFunction;
		Standard_Boolean HasFunction();

		/****************** Init ******************/
		/**** md5 signature: 00ebfad30fe1a136cc3eec7b39ed19a4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class offsetcurve - abasecurve : the curve entity to be offset - anoffsettype : offset distance flag 1 = single value, uniform distance 2 = varying linearly 3 = as a specified function - afunction : curve entity, one coordinate of which describes offset as a function of its parameter (0 unless offsettype = 3) - afunctioncoord : particular coordinate of curve describing offset as function of its parameters. (used if offsettype = 3) - ataperedoffsettype : tapered offset type flag 1 = function of arc length 2 = function of parameter (only used if offsettype = 2 or 3) - offdistance1 : first offset distance (only used if offsettype = 1 or 2) - arclength1 : arc length or parameter value of first offset distance (only used if offsettype = 2) - offdistance2 : second offset distance - arclength2 : arc length or parameter value of second offset distance (only used if offsettype = 2) - anormalvec : unit vector normal to plane containing curve to be offset - anoffsetparam : start parameter value of offset curve - anotheroffsetparam : end parameter value of offset curve.

Parameters
----------
aBaseCurve: IGESData_IGESEntity
anOffsetType: int
aFunction: IGESData_IGESEntity
aFunctionCoord: int
aTaperedOffsetType: int
offDistance1: float
arcLength1: float
offDistance2: float
arcLength2: float
aNormalVec: gp_XYZ
anOffsetParam: float
anotherOffsetParam: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aBaseCurve, const Standard_Integer anOffsetType, const opencascade::handle<IGESData_IGESEntity> & aFunction, const Standard_Integer aFunctionCoord, const Standard_Integer aTaperedOffsetType, const Standard_Real offDistance1, const Standard_Real arcLength1, const Standard_Real offDistance2, const Standard_Real arcLength2, const gp_XYZ & aNormalVec, const Standard_Real anOffsetParam, const Standard_Real anotherOffsetParam);

		/****************** NormalVector ******************/
		/**** md5 signature: c92f72b362fb8f493a0b79218dbc4f62 ****/
		%feature("compactdefaultargs") NormalVector;
		%feature("autodoc", "Returns unit vector normal to plane containing curve to be offset.

Returns
-------
gp_Vec
") NormalVector;
		gp_Vec NormalVector();

		/****************** OffsetType ******************/
		/**** md5 signature: 5bbd7e8daab9c7ba12cfcc22fdaeb502 ****/
		%feature("compactdefaultargs") OffsetType;
		%feature("autodoc", "Returns the offset distance flag 1 = single value offset (uniform distance) 2 = offset distance varying linearly 3 = offset distance specified as a function.

Returns
-------
int
") OffsetType;
		Standard_Integer OffsetType();

		/****************** Parameters ******************/
		/**** md5 signature: 7853ee093b73629d6a2ffb7e2f095ba9 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
StartParam: float
EndParam: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SecondOffsetDistance ******************/
		/**** md5 signature: 8cc6b5c3d2ddc4ee23855ba901de8d32 ****/
		%feature("compactdefaultargs") SecondOffsetDistance;
		%feature("autodoc", "Returns the second offset distance.

Returns
-------
float
") SecondOffsetDistance;
		Standard_Real SecondOffsetDistance();

		/****************** StartParameter ******************/
		/**** md5 signature: a949b97f3a51968c70f4ebfbac21ee08 ****/
		%feature("compactdefaultargs") StartParameter;
		%feature("autodoc", "Returns start parameter value of the offset curve.

Returns
-------
float
") StartParameter;
		Standard_Real StartParameter();

		/****************** TaperedOffsetType ******************/
		/**** md5 signature: 69f07dfe3dac45caeca64ccf5d425cbf ****/
		%feature("compactdefaultargs") TaperedOffsetType;
		%feature("autodoc", "Returns tapered offset type flag (only used if offsettype() = 2 or 3) 1 = function of arc length 2 = function of parameter.

Returns
-------
int
") TaperedOffsetType;
		Standard_Integer TaperedOffsetType();

		/****************** TransformedNormalVector ******************/
		/**** md5 signature: e19b8d19f67fa497bba934eb17ee264b ****/
		%feature("compactdefaultargs") TransformedNormalVector;
		%feature("autodoc", "Returns unit vector normal to plane containing curve to be offset after applying transf. matrix.

Returns
-------
gp_Vec
") TransformedNormalVector;
		gp_Vec TransformedNormalVector();

};


%make_alias(IGESGeom_OffsetCurve)

%extend IGESGeom_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESGeom_OffsetSurface *
*******************************/
class IGESGeom_OffsetSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_OffsetSurface ******************/
		/**** md5 signature: a12d68bbf44b23f7ebc40b7bb90d7b3a ****/
		%feature("compactdefaultargs") IGESGeom_OffsetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_OffsetSurface;
		 IGESGeom_OffsetSurface();

		/****************** Distance ******************/
		/**** md5 signature: c054352e1b604c83d759bc4ccf6c526d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance by which surface is offset.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Init ******************/
		/**** md5 signature: d5a4a310effd330082c260dfa2600ab4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class offsetsurface - anindicator : offset indicator - adistance : offset distance - asurface : surface that is offset.

Parameters
----------
anIndicatoR: gp_XYZ
aDistance: float
aSurface: IGESData_IGESEntity

Returns
-------
None
") Init;
		void Init(const gp_XYZ & anIndicatoR, const Standard_Real aDistance, const opencascade::handle<IGESData_IGESEntity> & aSurface);

		/****************** OffsetIndicator ******************/
		/**** md5 signature: 3528e7f128900de8c093044bae1319ba ****/
		%feature("compactdefaultargs") OffsetIndicator;
		%feature("autodoc", "Returns the offset indicator.

Returns
-------
gp_Vec
") OffsetIndicator;
		gp_Vec OffsetIndicator();

		/****************** Surface ******************/
		/**** md5 signature: 21224d36ecde9943682f882d2d37c893 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface that has been offset.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Surface;
		opencascade::handle<IGESData_IGESEntity> Surface();

		/****************** TransformedOffsetIndicator ******************/
		/**** md5 signature: d382302fecf5c44df7ff181d187b2ceb ****/
		%feature("compactdefaultargs") TransformedOffsetIndicator;
		%feature("autodoc", "Returns the offset indicator after applying transf. matrix.

Returns
-------
gp_Vec
") TransformedOffsetIndicator;
		gp_Vec TransformedOffsetIndicator();

};


%make_alias(IGESGeom_OffsetSurface)

%extend IGESGeom_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESGeom_Plane *
***********************/
class IGESGeom_Plane : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_Plane ******************/
		/**** md5 signature: 5f4d83328859d300330ab248441d24dc ****/
		%feature("compactdefaultargs") IGESGeom_Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Plane;
		 IGESGeom_Plane();

		/****************** BoundingCurve ******************/
		/**** md5 signature: d65919cbdee3ca3bc6a94d2974e28394 ****/
		%feature("compactdefaultargs") BoundingCurve;
		%feature("autodoc", "Returns optional bounding curve, can be positive (normal clipping) or negative (hole) according to form number.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") BoundingCurve;
		opencascade::handle<IGESData_IGESEntity> BoundingCurve();

		/****************** Equation ******************/
		/**** md5 signature: 79a2678fccd43049fa54c80d5726db55 ****/
		%feature("compactdefaultargs") Equation;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
") Equation;
		void Equation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasBoundingCurve ******************/
		/**** md5 signature: 7003cfec56e8efa09b867dbce6a7b6a0 ****/
		%feature("compactdefaultargs") HasBoundingCurve;
		%feature("autodoc", "Returns true if there exists a bounding curve.

Returns
-------
bool
") HasBoundingCurve;
		Standard_Boolean HasBoundingCurve();

		/****************** HasBoundingCurveHole ******************/
		/**** md5 signature: 4cee81dff356c1aa2c067b020c039fff ****/
		%feature("compactdefaultargs") HasBoundingCurveHole;
		%feature("autodoc", "Returns true if bounding curve exists and bounded portion is negative.

Returns
-------
bool
") HasBoundingCurveHole;
		Standard_Boolean HasBoundingCurveHole();

		/****************** HasSymbolAttach ******************/
		/**** md5 signature: 2fd963d8ef38eaf4ec8e946f1577a7f9 ****/
		%feature("compactdefaultargs") HasSymbolAttach;
		%feature("autodoc", "Returns true if symbolsize() > 0, false if symbolsize() = 0.

Returns
-------
bool
") HasSymbolAttach;
		Standard_Boolean HasSymbolAttach();

		/****************** Init ******************/
		/**** md5 signature: 937ab8e4a9521883fd6a1b1d414ad07d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: float
B: float
C: float
D: float
aCurve: IGESData_IGESEntity
attach: gp_XYZ
aSize: float

Returns
-------
None
") Init;
		void Init(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const opencascade::handle<IGESData_IGESEntity> & aCurve, const gp_XYZ & attach, const Standard_Real aSize);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the type of bound : 0 no bound, 1 (external) bound, -1 hole) remark that init keeps this value and must be consistent : acurve null if formnumber = 0, non-null else error if not in ranges [0-1] or [10-12].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** SymbolAttach ******************/
		/**** md5 signature: a286f41dc1e56e42c9355de16778b5fc ****/
		%feature("compactdefaultargs") SymbolAttach;
		%feature("autodoc", "Returns (x, y, z) if symbol exists else returns (0, 0, 0).

Returns
-------
gp_Pnt
") SymbolAttach;
		gp_Pnt SymbolAttach();

		/****************** SymbolSize ******************/
		/**** md5 signature: a59c8fd8c6877b94eb607aa75830a0c0 ****/
		%feature("compactdefaultargs") SymbolSize;
		%feature("autodoc", "Size of optional display symbol.

Returns
-------
float
") SymbolSize;
		Standard_Real SymbolSize();

		/****************** TransformedEquation ******************/
		/**** md5 signature: 3b17da71864aa922e81ba4ee75e7f025 ****/
		%feature("compactdefaultargs") TransformedEquation;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
A: float
B: float
C: float
D: float
") TransformedEquation;
		void TransformedEquation(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TransformedSymbolAttach ******************/
		/**** md5 signature: 43a619dfe4efaf9424f05aad76b95e0a ****/
		%feature("compactdefaultargs") TransformedSymbolAttach;
		%feature("autodoc", "Returns (x, y, z) if symbol exists after applying transf. matrix else returns (0, 0, 0).

Returns
-------
gp_Pnt
") TransformedSymbolAttach;
		gp_Pnt TransformedSymbolAttach();

};


%make_alias(IGESGeom_Plane)

%extend IGESGeom_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IGESGeom_Point *
***********************/
class IGESGeom_Point : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_Point ******************/
		/**** md5 signature: bd9a8d3ce0ff7f08a2bb0a33191391ef ****/
		%feature("compactdefaultargs") IGESGeom_Point;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Point;
		 IGESGeom_Point();

		/****************** DisplaySymbol ******************/
		/**** md5 signature: 49c4392cb25c821fedd324400969c66e ****/
		%feature("compactdefaultargs") DisplaySymbol;
		%feature("autodoc", "Returns display symbol entity if it exists.

Returns
-------
opencascade::handle<IGESBasic_SubfigureDef>
") DisplaySymbol;
		opencascade::handle<IGESBasic_SubfigureDef> DisplaySymbol();

		/****************** HasDisplaySymbol ******************/
		/**** md5 signature: f40724959005e7013808e4094af71351 ****/
		%feature("compactdefaultargs") HasDisplaySymbol;
		%feature("autodoc", "Returns true if symbol exists.

Returns
-------
bool
") HasDisplaySymbol;
		Standard_Boolean HasDisplaySymbol();

		/****************** Init ******************/
		/**** md5 signature: 2459643fa3768e05dac23a99c2905642 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class point - apoint : coordinates of point - asymbol : subfiguredefinition entity specifying the display symbol if there exists one, or zero.

Parameters
----------
aPoint: gp_XYZ
aSymbol: IGESBasic_SubfigureDef

Returns
-------
None
") Init;
		void Init(const gp_XYZ & aPoint, const opencascade::handle<IGESBasic_SubfigureDef> & aSymbol);

		/****************** TransformedValue ******************/
		/**** md5 signature: b9c3413f7be26fdacf9fd49f74268f41 ****/
		%feature("compactdefaultargs") TransformedValue;
		%feature("autodoc", "Returns coordinates of the point after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedValue;
		gp_Pnt TransformedValue();

		/****************** Value ******************/
		/**** md5 signature: 1d429a229b77b32713aab235505e93c2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns coordinates of the point.

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value();

};


%make_alias(IGESGeom_Point)

%extend IGESGeom_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESGeom_Protocol *
**************************/
class IGESGeom_Protocol : public IGESData_Protocol {
	public:
		/****************** IGESGeom_Protocol ******************/
		/**** md5 signature: 8402264bd683c935a5debf66ea0879c9 ****/
		%feature("compactdefaultargs") IGESGeom_Protocol;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_Protocol;
		 IGESGeom_Protocol();

		/****************** NbResources ******************/
		/**** md5 signature: cd524335b33aeb6eb83cc80f6b7e5681 ****/
		%feature("compactdefaultargs") NbResources;
		%feature("autodoc", "Gives the count of resource protocol. here, one (protocol from igesbasic).

Returns
-------
int
") NbResources;
		virtual Standard_Integer NbResources();

		/****************** Resource ******************/
		/**** md5 signature: 26597e9d8db9fc70530508f766cf0d70 ****/
		%feature("compactdefaultargs") Resource;
		%feature("autodoc", "Returns a resource, given a rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_Protocol>
") Resource;
		virtual opencascade::handle<Interface_Protocol> Resource(const Standard_Integer num);

		/****************** TypeNumber ******************/
		/**** md5 signature: f4ed4f2e12d80f3bd752f6dd34ed84b4 ****/
		%feature("compactdefaultargs") TypeNumber;
		%feature("autodoc", "Returns a case number, specific of each recognized type this case number is then used in libraries : the various modules attached to this class of protocol must use them in accordance (for a given value of typenumber, they must consider the same type as the protocol defines).

Parameters
----------
atype: Standard_Type

Returns
-------
int
") TypeNumber;
		virtual Standard_Integer TypeNumber(const opencascade::handle<Standard_Type> & atype);

};


%make_alias(IGESGeom_Protocol)

%extend IGESGeom_Protocol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESGeom_ReadWriteModule *
*********************************/
class IGESGeom_ReadWriteModule : public IGESData_ReadWriteModule {
	public:
		/****************** IGESGeom_ReadWriteModule ******************/
		/**** md5 signature: 863140f87b2071c0ff6fa715985bedd9 ****/
		%feature("compactdefaultargs") IGESGeom_ReadWriteModule;
		%feature("autodoc", "Creates a readwritemodule & puts it into readerlib & writerlib.

Returns
-------
None
") IGESGeom_ReadWriteModule;
		 IGESGeom_ReadWriteModule();

		/****************** CaseIGES ******************/
		/**** md5 signature: de66f0948cefad4e0218511df612ee48 ****/
		%feature("compactdefaultargs") CaseIGES;
		%feature("autodoc", "Defines case numbers for entities of igesgeom.

Parameters
----------
typenum: int
formnum: int

Returns
-------
int
") CaseIGES;
		Standard_Integer CaseIGES(const Standard_Integer typenum, const Standard_Integer formnum);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 0815b93d39da58d4605233b1d8695dc9 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file for an entity of igesgeom.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2eb05a73fea84c5ff17867b597f1ca7d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
CN: int
ent: IGESData_IGESEntity
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent, IGESData_IGESWriter & IW);

};


%make_alias(IGESGeom_ReadWriteModule)

%extend IGESGeom_ReadWriteModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGeom_RuledSurface *
******************************/
class IGESGeom_RuledSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_RuledSurface ******************/
		/**** md5 signature: 76caa5034076effa6fb3751fc2b41211 ****/
		%feature("compactdefaultargs") IGESGeom_RuledSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_RuledSurface;
		 IGESGeom_RuledSurface();

		/****************** DirectionFlag ******************/
		/**** md5 signature: b6082757579c31c7416d08c7bcea6cdf ****/
		%feature("compactdefaultargs") DirectionFlag;
		%feature("autodoc", "Return the sense of direction 0 = join first to first, last to last 1 = join first to last, last to first.

Returns
-------
int
") DirectionFlag;
		Standard_Integer DirectionFlag();

		/****************** FirstCurve ******************/
		/**** md5 signature: d8d16c4d8569f177ff8472d4e9f812e2 ****/
		%feature("compactdefaultargs") FirstCurve;
		%feature("autodoc", "Returns the first curve.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") FirstCurve;
		opencascade::handle<IGESData_IGESEntity> FirstCurve();

		/****************** Init ******************/
		/**** md5 signature: e6f6520dc7553dd42dea639cc7cb4328 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class ruledsurface - acurve : first parametric curve - anothercurve : second parametric curve - adirflag : direction flag 0 = join first to first, last to last 1 = join first to last, last to first - adevflag : developable surface flag 1 = developable 0 = possibly not.

Parameters
----------
aCurve: IGESData_IGESEntity
anotherCurve: IGESData_IGESEntity
aDirFlag: int
aDevFlag: int

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aCurve, const opencascade::handle<IGESData_IGESEntity> & anotherCurve, const Standard_Integer aDirFlag, const Standard_Integer aDevFlag);

		/****************** IsDevelopable ******************/
		/**** md5 signature: 0e7515e23f499f3ff491a1b4de0d4331 ****/
		%feature("compactdefaultargs") IsDevelopable;
		%feature("autodoc", "Returns true if developable else false.

Returns
-------
bool
") IsDevelopable;
		Standard_Boolean IsDevelopable();

		/****************** IsRuledByParameter ******************/
		/**** md5 signature: 26f9ca26ba8c9d29ae48e5c75bc7b93c ****/
		%feature("compactdefaultargs") IsRuledByParameter;
		%feature("autodoc", "Returns true if form is 1.

Returns
-------
bool
") IsRuledByParameter;
		Standard_Boolean IsRuledByParameter();

		/****************** SecondCurve ******************/
		/**** md5 signature: e311635ef09481fc793c3160750e93b1 ****/
		%feature("compactdefaultargs") SecondCurve;
		%feature("autodoc", "Returns the second curve.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") SecondCurve;
		opencascade::handle<IGESData_IGESEntity> SecondCurve();

		/****************** SetRuledByParameter ******************/
		/**** md5 signature: 3ade94b6bd032e4a4b7bff4e49c0563e ****/
		%feature("compactdefaultargs") SetRuledByParameter;
		%feature("autodoc", "Sets <self> to be ruled by parameter (form 1) if <mode> is true, or ruled by length (form 0) else.

Parameters
----------
mode: bool

Returns
-------
None
") SetRuledByParameter;
		void SetRuledByParameter(const Standard_Boolean mode);

};


%make_alias(IGESGeom_RuledSurface)

%extend IGESGeom_RuledSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGeom_SpecificModule *
********************************/
class IGESGeom_SpecificModule : public IGESData_SpecificModule {
	public:
		/****************** IGESGeom_SpecificModule ******************/
		/**** md5 signature: f54ac97bda7acf205ec51b3d93529c2c ****/
		%feature("compactdefaultargs") IGESGeom_SpecificModule;
		%feature("autodoc", "Creates a specificmodule from igesgeom & puts it into specificlib.

Returns
-------
None
") IGESGeom_SpecificModule;
		 IGESGeom_SpecificModule();

		/****************** OwnCorrect ******************/
		/**** md5 signature: bbaa7e58769f5cc28e757e0612cf4245 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Performs non-ambiguous correction on entities which support them (boundary,conicarc,flash,offsetcurve,transformationmatrix).

Parameters
----------
CN: int
ent: IGESData_IGESEntity

Returns
-------
bool
") OwnCorrect;
		virtual Standard_Boolean OwnCorrect(const Standard_Integer CN, const opencascade::handle<IGESData_IGESEntity> & ent);

};


%make_alias(IGESGeom_SpecificModule)

%extend IGESGeom_SpecificModule {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IGESGeom_SplineCurve *
*****************************/
class IGESGeom_SplineCurve : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_SplineCurve ******************/
		/**** md5 signature: 0d9e20be30b4fe8ce39c9fb30c9572f8 ****/
		%feature("compactdefaultargs") IGESGeom_SplineCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_SplineCurve;
		 IGESGeom_SplineCurve();

		/****************** BreakPoint ******************/
		/**** md5 signature: 760ffc657c915cb0b216024dc5232186 ****/
		%feature("compactdefaultargs") BreakPoint;
		%feature("autodoc", "Returns breakpoint of piecewise polynomial raises exception if index <= 0 or index > nbsegments() + 1.

Parameters
----------
Index: int

Returns
-------
float
") BreakPoint;
		Standard_Real BreakPoint(const Standard_Integer Index);

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of the curve.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Init ******************/
		/**** md5 signature: d1edc8b25e3a81c7914568607952db66 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class splinecurve - atype  : spline type 1 = linear 2 = quadratic 3 = cubic 4 = wilson-fowler 5 = modified wilson-fowler 6 = b spline - adegree : degree of continuity w.r.t. arc length - nbdimensions : number of dimensions 2 = planar 3 = non-planar - allbreakpoints : array of break points - allxpolynomials : x coordinate polynomials of segments - allypolynomials : y coordinate polynomials of segments - allzpolynomials : z coordinate polynomials of segments - allxvalues : values of 1st, 2nd, 3rd derivatives of x polynomials at the terminate point and values of x at terminate point - allyvalues : values of 1st, 2nd, 3rd derivatives of y polynomials at the terminate point and values of y at terminate point - allzvalues : values of 1st, 2nd, 3rd derivatives of z polynomials at the terminate point and values of z at terminate point raises exception if allxpolynomials, allypolynomials & allzpolynomials are not of same size or allxvalues, allyvalues & allzvalues are not of size 4.

Parameters
----------
aType: int
aDegree: int
nbDimensions: int
allBreakPoints: TColStd_HArray1OfReal
allXPolynomials: TColStd_HArray2OfReal
allYPolynomials: TColStd_HArray2OfReal
allZPolynomials: TColStd_HArray2OfReal
allXvalues: TColStd_HArray1OfReal
allYvalues: TColStd_HArray1OfReal
allZvalues: TColStd_HArray1OfReal

Returns
-------
None
") Init;
		void Init(const Standard_Integer aType, const Standard_Integer aDegree, const Standard_Integer nbDimensions, const opencascade::handle<TColStd_HArray1OfReal> & allBreakPoints, const opencascade::handle<TColStd_HArray2OfReal> & allXPolynomials, const opencascade::handle<TColStd_HArray2OfReal> & allYPolynomials, const opencascade::handle<TColStd_HArray2OfReal> & allZPolynomials, const opencascade::handle<TColStd_HArray1OfReal> & allXvalues, const opencascade::handle<TColStd_HArray1OfReal> & allYvalues, const opencascade::handle<TColStd_HArray1OfReal> & allZvalues);

		/****************** NbDimensions ******************/
		/**** md5 signature: efd2367bff643c79aae9144f3f9c2e33 ****/
		%feature("compactdefaultargs") NbDimensions;
		%feature("autodoc", "Returns the number of dimensions 2 = planar 3 = non-planar.

Returns
-------
int
") NbDimensions;
		Standard_Integer NbDimensions();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of segments.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SplineType ******************/
		/**** md5 signature: faa1602c81e2321a31fa14c56db02f7d ****/
		%feature("compactdefaultargs") SplineType;
		%feature("autodoc", "Returns the type of spline curve.

Returns
-------
int
") SplineType;
		Standard_Integer SplineType();

		/****************** XCoordPolynomial ******************/
		/**** md5 signature: 45150b4c54f74f0a4064457bdf65031e ****/
		%feature("compactdefaultargs") XCoordPolynomial;
		%feature("autodoc", "Returns x coordinate polynomial for segment referred to by index raises exception if index <= 0 or index > nbsegments().

Parameters
----------
Index: int

Returns
-------
AX: float
BX: float
CX: float
DX: float
") XCoordPolynomial;
		void XCoordPolynomial(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** XValues ******************/
		/**** md5 signature: 411ed23d8c1fdebafdce2c8c2cc6ad4f ****/
		%feature("compactdefaultargs") XValues;
		%feature("autodoc", "Returns the value of x polynomial, the values of 1st, 2nd and 3rd derivatives of the x polynomial at the terminate point.

Parameters
----------

Returns
-------
TPX0: float
TPX1: float
TPX2: float
TPX3: float
") XValues;
		void XValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** YCoordPolynomial ******************/
		/**** md5 signature: a26213cf831a802b64cd97e3b63de64c ****/
		%feature("compactdefaultargs") YCoordPolynomial;
		%feature("autodoc", "Returns y coordinate polynomial for segment referred to by index raises exception if index <= 0 or index > nbsegments().

Parameters
----------
Index: int

Returns
-------
AY: float
BY: float
CY: float
DY: float
") YCoordPolynomial;
		void YCoordPolynomial(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** YValues ******************/
		/**** md5 signature: d6bda50427e208735c98fa9a21296d8c ****/
		%feature("compactdefaultargs") YValues;
		%feature("autodoc", "Returns the value of y polynomial, the values of 1st, 2nd and 3rd derivatives of the y polynomial at the termminate point.

Parameters
----------

Returns
-------
TPY0: float
TPY1: float
TPY2: float
TPY3: float
") YValues;
		void YValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ZCoordPolynomial ******************/
		/**** md5 signature: dddb6bd202a361cc334c66f9d7510e8f ****/
		%feature("compactdefaultargs") ZCoordPolynomial;
		%feature("autodoc", "Returns z coordinate polynomial for segment referred to by index raises exception if index <= 0 or index > nbsegments().

Parameters
----------
Index: int

Returns
-------
AZ: float
BZ: float
CZ: float
DZ: float
") ZCoordPolynomial;
		void ZCoordPolynomial(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ZValues ******************/
		/**** md5 signature: 6925bfe97d652800398546cb1b540178 ****/
		%feature("compactdefaultargs") ZValues;
		%feature("autodoc", "Returns the value of z polynomial, the values of 1st, 2nd and 3rd derivatives of the z polynomial at the termminate point.

Parameters
----------

Returns
-------
TPZ0: float
TPZ1: float
TPZ2: float
TPZ3: float
") ZValues;
		void ZValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

};


%make_alias(IGESGeom_SplineCurve)

%extend IGESGeom_SplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESGeom_SplineSurface *
*******************************/
class IGESGeom_SplineSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_SplineSurface ******************/
		/**** md5 signature: 9be629c25ec9818db0372255f763e37f ****/
		%feature("compactdefaultargs") IGESGeom_SplineSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_SplineSurface;
		 IGESGeom_SplineSurface();

		/****************** BoundaryType ******************/
		/**** md5 signature: 418a20b1c843639f154af4478b0b32cb ****/
		%feature("compactdefaultargs") BoundaryType;
		%feature("autodoc", "Returns boundary type.

Returns
-------
int
") BoundaryType;
		Standard_Integer BoundaryType();

		/****************** Init ******************/
		/**** md5 signature: 34f75e8f4b2a00406dd45809459c66c4 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class splinesurface - aboundarytype : type of spline boundary 1 = linear 2 = quadratic 3 = cubic 4 = wilson-fowler 5 = modified wilson-fowler 6 = b-spline - apatchtype : type of patch contained in the grid 1 = cartesian product 0 = unspecified - allubreakpoints : u values of grid lines - allvbreakpoints : v values of grid lines - allxcoeffs : x coefficients of m x n patches - allycoeffs : y coefficients of m x n patches - allzcoeffs : z coefficients of m x n patches raises exception if allxcoeffs, allycoeffs & allzcoeffs are not of the same size. or if the size of each element of the double array is not 16.

Parameters
----------
aBoundaryType: int
aPatchType: int
allUBreakpoints: TColStd_HArray1OfReal
allVBreakpoints: TColStd_HArray1OfReal
allXCoeffs: IGESBasic_HArray2OfHArray1OfReal
allYCoeffs: IGESBasic_HArray2OfHArray1OfReal
allZCoeffs: IGESBasic_HArray2OfHArray1OfReal

Returns
-------
None
") Init;
		void Init(const Standard_Integer aBoundaryType, const Standard_Integer aPatchType, const opencascade::handle<TColStd_HArray1OfReal> & allUBreakpoints, const opencascade::handle<TColStd_HArray1OfReal> & allVBreakpoints, const opencascade::handle<IGESBasic_HArray2OfHArray1OfReal> & allXCoeffs, const opencascade::handle<IGESBasic_HArray2OfHArray1OfReal> & allYCoeffs, const opencascade::handle<IGESBasic_HArray2OfHArray1OfReal> & allZCoeffs);

		/****************** NbUSegments ******************/
		/**** md5 signature: 9ec210ab5b2984552ff54964f2877557 ****/
		%feature("compactdefaultargs") NbUSegments;
		%feature("autodoc", "Returns the number of u segments.

Returns
-------
int
") NbUSegments;
		Standard_Integer NbUSegments();

		/****************** NbVSegments ******************/
		/**** md5 signature: 1066db4be0bfd8636d4cbb9e3ccbdc93 ****/
		%feature("compactdefaultargs") NbVSegments;
		%feature("autodoc", "Returns the number of v segments.

Returns
-------
int
") NbVSegments;
		Standard_Integer NbVSegments();

		/****************** PatchType ******************/
		/**** md5 signature: 7e9320a1b2d62ede79989470845e540c ****/
		%feature("compactdefaultargs") PatchType;
		%feature("autodoc", "Returns patch type.

Returns
-------
int
") PatchType;
		Standard_Integer PatchType();

		/****************** Polynomials ******************/
		/**** md5 signature: 3bd96c7584bd72b1fec3b2300da83ed5 ****/
		%feature("compactdefaultargs") Polynomials;
		%feature("autodoc", "Returns in one all the polynomial values 'in bulk' useful for massive treatments.

Parameters
----------
XCoef: IGESBasic_HArray2OfHArray1OfReal
YCoef: IGESBasic_HArray2OfHArray1OfReal
ZCoef: IGESBasic_HArray2OfHArray1OfReal

Returns
-------
None
") Polynomials;
		void Polynomials(opencascade::handle<IGESBasic_HArray2OfHArray1OfReal> & XCoef, opencascade::handle<IGESBasic_HArray2OfHArray1OfReal> & YCoef, opencascade::handle<IGESBasic_HArray2OfHArray1OfReal> & ZCoef);

		/****************** UBreakPoint ******************/
		/**** md5 signature: 1a1e36268d71237422f9b8224127e3f8 ****/
		%feature("compactdefaultargs") UBreakPoint;
		%feature("autodoc", "Returns u break point of the grid line referred to by anindex raises exception if anindex <= 0 or anindex > nbusegments() + 1.

Parameters
----------
anIndex: int

Returns
-------
float
") UBreakPoint;
		Standard_Real UBreakPoint(const Standard_Integer anIndex);

		/****************** VBreakPoint ******************/
		/**** md5 signature: c16cbf4736c3a9c8807508436f7b8360 ****/
		%feature("compactdefaultargs") VBreakPoint;
		%feature("autodoc", "Returns v break point of the grid line referred to by anindex raises exception if anindex <= 0 or anindex > nbvsegments() + 1.

Parameters
----------
anIndex: int

Returns
-------
float
") VBreakPoint;
		Standard_Real VBreakPoint(const Standard_Integer anIndex);

		/****************** XPolynomial ******************/
		/**** md5 signature: 185d1d385682609303b9d1a97f6e1b17 ****/
		%feature("compactdefaultargs") XPolynomial;
		%feature("autodoc", "Returns x polynomial of patch referred to by anindex1, anindex2 raises exception if anindex1 <= 0 or anindex1 > nbusegments() or anindex2 <= 0 or anindex2 > nbvsegments().

Parameters
----------
anIndex1: int
anIndex2: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") XPolynomial;
		opencascade::handle<TColStd_HArray1OfReal> XPolynomial(const Standard_Integer anIndex1, const Standard_Integer anIndex2);

		/****************** YPolynomial ******************/
		/**** md5 signature: 7cf7accd88c1adf91851c8b8272d0d35 ****/
		%feature("compactdefaultargs") YPolynomial;
		%feature("autodoc", "Returns y polynomial of patch referred to by anindex1, anindex2 raises exception if anindex1 <= 0 or anindex1 > nbusegments() or anindex2 <= 0 or anindex2 > nbvsegments().

Parameters
----------
anIndex1: int
anIndex2: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") YPolynomial;
		opencascade::handle<TColStd_HArray1OfReal> YPolynomial(const Standard_Integer anIndex1, const Standard_Integer anIndex2);

		/****************** ZPolynomial ******************/
		/**** md5 signature: 76718d092db021da4612fbb551c92431 ****/
		%feature("compactdefaultargs") ZPolynomial;
		%feature("autodoc", "Returns z polynomial of patch referred to by anindex1, anindex2 raises exception if anindex1 <= 0 or anindex1 > nbusegments() or anindex2 <= 0 or anindex2 > nbvsegments().

Parameters
----------
anIndex1: int
anIndex2: int

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") ZPolynomial;
		opencascade::handle<TColStd_HArray1OfReal> ZPolynomial(const Standard_Integer anIndex1, const Standard_Integer anIndex2);

};


%make_alias(IGESGeom_SplineSurface)

%extend IGESGeom_SplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IGESGeom_SurfaceOfRevolution *
*************************************/
class IGESGeom_SurfaceOfRevolution : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_SurfaceOfRevolution ******************/
		/**** md5 signature: 331ffe56a9601d6e793facf6cd102bb8 ****/
		%feature("compactdefaultargs") IGESGeom_SurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_SurfaceOfRevolution;
		 IGESGeom_SurfaceOfRevolution();

		/****************** AxisOfRevolution ******************/
		/**** md5 signature: bf44b244ab291c320f0f25ec770f5563 ****/
		%feature("compactdefaultargs") AxisOfRevolution;
		%feature("autodoc", "Returns the axis of revolution.

Returns
-------
opencascade::handle<IGESGeom_Line>
") AxisOfRevolution;
		opencascade::handle<IGESGeom_Line> AxisOfRevolution();

		/****************** EndAngle ******************/
		/**** md5 signature: 7a83364b0d0a7c52879e912a6cb37b1a ****/
		%feature("compactdefaultargs") EndAngle;
		%feature("autodoc", "Returns end angle of revolution.

Returns
-------
float
") EndAngle;
		Standard_Real EndAngle();

		/****************** Generatrix ******************/
		/**** md5 signature: a976d18786b649cb473ade3460e49233 ****/
		%feature("compactdefaultargs") Generatrix;
		%feature("autodoc", "Returns the curve which is revolved about the axis.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Generatrix;
		opencascade::handle<IGESData_IGESEntity> Generatrix();

		/****************** Init ******************/
		/**** md5 signature: 8adc641f08a956e9b0fb98b800114427 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class line - anaxis : axis of revolution - ageneratrix : the curve which is revolved about the axis - astartangle : start angle of the surface of revolution - anendangle : end angle of the surface of revolution.

Parameters
----------
anAxis: IGESGeom_Line
aGeneratrix: IGESData_IGESEntity
aStartAngle: float
anEndAngle: float

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESGeom_Line> & anAxis, const opencascade::handle<IGESData_IGESEntity> & aGeneratrix, const Standard_Real aStartAngle, const Standard_Real anEndAngle);

		/****************** StartAngle ******************/
		/**** md5 signature: beed97f7ae4354ab8403de8b4c4314bc ****/
		%feature("compactdefaultargs") StartAngle;
		%feature("autodoc", "Returns start angle of revolution.

Returns
-------
float
") StartAngle;
		Standard_Real StartAngle();

};


%make_alias(IGESGeom_SurfaceOfRevolution)

%extend IGESGeom_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESGeom_TabulatedCylinder *
***********************************/
class IGESGeom_TabulatedCylinder : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_TabulatedCylinder ******************/
		/**** md5 signature: 868e6f85480b7e37424bbeb68b133a89 ****/
		%feature("compactdefaultargs") IGESGeom_TabulatedCylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_TabulatedCylinder;
		 IGESGeom_TabulatedCylinder();

		/****************** Directrix ******************/
		/**** md5 signature: 15f97871f0b9273ee81090458e9f871d ****/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Returns the directrix curve of the tabulated cylinder.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Directrix;
		opencascade::handle<IGESData_IGESEntity> Directrix();

		/****************** EndPoint ******************/
		/**** md5 signature: c57ea612ee9ec9a4548616a115433b1b ****/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns end point of generatrix of the tabulated cylinder.

Returns
-------
gp_Pnt
") EndPoint;
		gp_Pnt EndPoint();

		/****************** Init ******************/
		/**** md5 signature: db7f7249ddb2177f3a95b8cd7828ba2d ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class tabulatedcylinder - adirectrix : directrix curve of the tabulated cylinder - anend : coordinates of the terminate point of the generatrix the start point of the directrix is identical to the start point of the generatrix.

Parameters
----------
aDirectrix: IGESData_IGESEntity
anEnd: gp_XYZ

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aDirectrix, const gp_XYZ & anEnd);

		/****************** TransformedEndPoint ******************/
		/**** md5 signature: cf99fc5a43b0bbe4c838148e46465f03 ****/
		%feature("compactdefaultargs") TransformedEndPoint;
		%feature("autodoc", "Returns end point of generatrix of the tabulated cylinder after applying transf. matrix.

Returns
-------
gp_Pnt
") TransformedEndPoint;
		gp_Pnt TransformedEndPoint();

};


%make_alias(IGESGeom_TabulatedCylinder)

%extend IGESGeom_TabulatedCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGeom_ToolBSplineCurve *
**********************************/
class IGESGeom_ToolBSplineCurve {
	public:
		/****************** IGESGeom_ToolBSplineCurve ******************/
		/**** md5 signature: 194e6adc3c879ca4a0b631550e690a9a ****/
		%feature("compactdefaultargs") IGESGeom_ToolBSplineCurve;
		%feature("autodoc", "Returns a toolbsplinecurve, ready to work.

Returns
-------
None
") IGESGeom_ToolBSplineCurve;
		 IGESGeom_ToolBSplineCurve();

		/****************** DirChecker ******************/
		/**** md5 signature: 69958ac5c071bff473f586f3263865ad ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_BSplineCurve

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_BSplineCurve> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: dcdb85b140f1922b5b2b6286ea51335b ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_BSplineCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_BSplineCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 9e13b86ee2708fb59f7a473cf378dacf ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_BSplineCurve
entto: IGESGeom_BSplineCurve
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_BSplineCurve> & entfrom, const opencascade::handle<IGESGeom_BSplineCurve> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 57250932023d5d45899be2837df294a1 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a bsplinecurve <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_BSplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_BSplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5602372bd8480baf97838b6fe87cf4fc ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_BSplineCurve
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_BSplineCurve> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 7ca846cb1b0645249edca622bd742430 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_BSplineCurve
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_BSplineCurve> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESGeom_ToolBSplineSurface *
************************************/
class IGESGeom_ToolBSplineSurface {
	public:
		/****************** IGESGeom_ToolBSplineSurface ******************/
		/**** md5 signature: 7c029742e7191195dc1608157f9e5eee ****/
		%feature("compactdefaultargs") IGESGeom_ToolBSplineSurface;
		%feature("autodoc", "Returns a toolbsplinesurface, ready to work.

Returns
-------
None
") IGESGeom_ToolBSplineSurface;
		 IGESGeom_ToolBSplineSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: e84de29780ffaac743587e069de601fe ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_BSplineSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_BSplineSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0b3efb729a61f1fdb394a4575d9d2050 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_BSplineSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_BSplineSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 891a526d35e0cba79fea8553feffeb81 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_BSplineSurface
entto: IGESGeom_BSplineSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_BSplineSurface> & entfrom, const opencascade::handle<IGESGeom_BSplineSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: f1cbe7af428f92754ef6fcded535f8e5 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a bsplinesurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_BSplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_BSplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: c70f3bc719169f5abe6731c7604fe31b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_BSplineSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_BSplineSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: dbc795db791723319cc2a0c91be26969 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_BSplineSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_BSplineSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGeom_ToolBoundary *
******************************/
class IGESGeom_ToolBoundary {
	public:
		/****************** IGESGeom_ToolBoundary ******************/
		/**** md5 signature: 077793d2c6151dc96949a127b4bc27e9 ****/
		%feature("compactdefaultargs") IGESGeom_ToolBoundary;
		%feature("autodoc", "Returns a toolboundary, ready to work.

Returns
-------
None
") IGESGeom_ToolBoundary;
		 IGESGeom_ToolBoundary();

		/****************** DirChecker ******************/
		/**** md5 signature: b0e8483b5cb79d29cb97ff713bd569fa ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_Boundary

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_Boundary> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3abeffe54f5e72c15b1fb23e8f1ba5b3 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_Boundary
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_Boundary> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4abe6ec94e97d882f1bfd684fb2c65b3 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_Boundary
entto: IGESGeom_Boundary
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_Boundary> & entfrom, const opencascade::handle<IGESGeom_Boundary> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 7452938d12f25d2698a688fff53b061a ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a boundary (if boundarytype = 0, nullify all parametercurves).

Parameters
----------
ent: IGESGeom_Boundary

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGeom_Boundary> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: fdca8b3450519712d0a71d852953e125 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a boundary <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_Boundary
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_Boundary> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 6d57d589831c7d1c689439b2ef16114c ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_Boundary
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_Boundary> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 853c5d2e0490f7cc0d62de9b4eb8e7d9 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_Boundary
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_Boundary> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESGeom_ToolBoundedSurface *
************************************/
class IGESGeom_ToolBoundedSurface {
	public:
		/****************** IGESGeom_ToolBoundedSurface ******************/
		/**** md5 signature: 149c9d9431e6a54f6cae9e0eef8701c9 ****/
		%feature("compactdefaultargs") IGESGeom_ToolBoundedSurface;
		%feature("autodoc", "Returns a toolboundedsurface, ready to work.

Returns
-------
None
") IGESGeom_ToolBoundedSurface;
		 IGESGeom_ToolBoundedSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 21c0c5ff7d16ca4292e0803046707f5e ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_BoundedSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_BoundedSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 91d99678ce78865ff560921f30b1081e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_BoundedSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_BoundedSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 0417689a5153cae4d3c975acf8c57320 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_BoundedSurface
entto: IGESGeom_BoundedSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_BoundedSurface> & entfrom, const opencascade::handle<IGESGeom_BoundedSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5352936a94a8170805c09a3469a77c1e ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a boundedsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_BoundedSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_BoundedSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d41add314627b6584b3e1df118375d9b ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_BoundedSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_BoundedSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: ff1ca6c3a1c3d29c7bc5d73b14323cd4 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_BoundedSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_BoundedSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESGeom_ToolCircularArc *
*********************************/
class IGESGeom_ToolCircularArc {
	public:
		/****************** IGESGeom_ToolCircularArc ******************/
		/**** md5 signature: a7997b38889e5c451e2ca9e9c56a85e8 ****/
		%feature("compactdefaultargs") IGESGeom_ToolCircularArc;
		%feature("autodoc", "Returns a toolcirculararc, ready to work.

Returns
-------
None
") IGESGeom_ToolCircularArc;
		 IGESGeom_ToolCircularArc();

		/****************** DirChecker ******************/
		/**** md5 signature: c6ea974e9ae36101a0018bff8fc2c4c5 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_CircularArc

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_CircularArc> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 7f9acc3ac31b373cbbcbccfe994834ff ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_CircularArc
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_CircularArc> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d659497b8f58ac1ae14f4f6007d58775 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_CircularArc
entto: IGESGeom_CircularArc
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_CircularArc> & entfrom, const opencascade::handle<IGESGeom_CircularArc> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5fa8caf8b7b9ccf65d4ad4d72d008542 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a circulararc <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_CircularArc
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_CircularArc> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 7128b743ea910f9cfed287d21b487b0a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_CircularArc
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_CircularArc> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: d4de6f90addfb0aeeef888ebd55686e3 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_CircularArc
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_CircularArc> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolCircularArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESGeom_ToolCompositeCurve *
************************************/
class IGESGeom_ToolCompositeCurve {
	public:
		/****************** IGESGeom_ToolCompositeCurve ******************/
		/**** md5 signature: 559b9b641658f642adfb6215bfa43ff5 ****/
		%feature("compactdefaultargs") IGESGeom_ToolCompositeCurve;
		%feature("autodoc", "Returns a toolcompositecurve, ready to work.

Returns
-------
None
") IGESGeom_ToolCompositeCurve;
		 IGESGeom_ToolCompositeCurve();

		/****************** DirChecker ******************/
		/**** md5 signature: 95642259cbc8885d9ccdc03efe61a880 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_CompositeCurve

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_CompositeCurve> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 6fa2500eb4afc95b328fd5487e956214 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_CompositeCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_CompositeCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: a1c297e8968b25dd9a9cd4a632a36811 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_CompositeCurve
entto: IGESGeom_CompositeCurve
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_CompositeCurve> & entfrom, const opencascade::handle<IGESGeom_CompositeCurve> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 783f1c97055f88ab31171322271c17df ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a compositecurve <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_CompositeCurve
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_CompositeCurve> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 443b8e6471860bc3e895877c02d4924e ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_CompositeCurve
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_CompositeCurve> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 6ae54ce575282fee997534f673be33da ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_CompositeCurve
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_CompositeCurve> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolCompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESGeom_ToolConicArc *
******************************/
class IGESGeom_ToolConicArc {
	public:
		/****************** IGESGeom_ToolConicArc ******************/
		/**** md5 signature: 8ebcacd17c263674ecb70f4edc86dba2 ****/
		%feature("compactdefaultargs") IGESGeom_ToolConicArc;
		%feature("autodoc", "Returns a toolconicarc, ready to work.

Returns
-------
None
") IGESGeom_ToolConicArc;
		 IGESGeom_ToolConicArc();

		/****************** DirChecker ******************/
		/**** md5 signature: 396d069bf25692e30227ea2003c5d907 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_ConicArc

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_ConicArc> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3545164afc2a3f9bb3325704cca0dc77 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_ConicArc
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_ConicArc> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4da3efb3891c18e0a534c4de89d55f91 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_ConicArc
entto: IGESGeom_ConicArc
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_ConicArc> & entfrom, const opencascade::handle<IGESGeom_ConicArc> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: ac8037caee663e98a1935070181fbc78 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a conicarc (formnumber recomputed according case ellips-parab-hyperb).

Parameters
----------
ent: IGESGeom_ConicArc

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGeom_ConicArc> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 4e561029fb850c83cb30254ac5c838c8 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a conicarc <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_ConicArc
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_ConicArc> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 8297bcbfee7fdcba79ce4a1a7615d2d7 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_ConicArc
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_ConicArc> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: f2f068a005203bc3424b3774251396a5 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_ConicArc
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_ConicArc> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolConicArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESGeom_ToolCopiousData *
*********************************/
class IGESGeom_ToolCopiousData {
	public:
		/****************** IGESGeom_ToolCopiousData ******************/
		/**** md5 signature: d345465196b1f4160281b1862a8eb1a9 ****/
		%feature("compactdefaultargs") IGESGeom_ToolCopiousData;
		%feature("autodoc", "Returns a toolcopiousdata, ready to work.

Returns
-------
None
") IGESGeom_ToolCopiousData;
		 IGESGeom_ToolCopiousData();

		/****************** DirChecker ******************/
		/**** md5 signature: 5ff861b8b51de57ff62e4ce422caa94a ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_CopiousData

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_CopiousData> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 386a1592a49f2b56236253e95a2ac37e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_CopiousData
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_CopiousData> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f5bf70cfda90bf11707378772c4f8c6c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_CopiousData
entto: IGESGeom_CopiousData
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_CopiousData> & entfrom, const opencascade::handle<IGESGeom_CopiousData> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 998b5217ff2852a955d7b708829fb62c ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a copiousdata <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_CopiousData
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_CopiousData> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 9208d79ed8a9517fddd449dd288e2efc ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_CopiousData
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_CopiousData> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 3f34f9353fe07eaf3f4d9ecca7e386b9 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_CopiousData
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_CopiousData> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolCopiousData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESGeom_ToolCurveOnSurface *
************************************/
class IGESGeom_ToolCurveOnSurface {
	public:
		/****************** IGESGeom_ToolCurveOnSurface ******************/
		/**** md5 signature: b81ba4e3d9b6859f22c6a117fab0a185 ****/
		%feature("compactdefaultargs") IGESGeom_ToolCurveOnSurface;
		%feature("autodoc", "Returns a toolcurveonsurface, ready to work.

Returns
-------
None
") IGESGeom_ToolCurveOnSurface;
		 IGESGeom_ToolCurveOnSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 4b191b8794824f2263e29841ae44afa1 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_CurveOnSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_CurveOnSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: b9e21f4b445e2cbbd69a37c081136672 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_CurveOnSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_CurveOnSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d129f85970f94849e0ef0342c6879dab ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_CurveOnSurface
entto: IGESGeom_CurveOnSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_CurveOnSurface> & entfrom, const opencascade::handle<IGESGeom_CurveOnSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: e41de1930f7e8471c9c36802eded91ff ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a curveonsurface (its curveuv must have useflag at 5).

Parameters
----------
ent: IGESGeom_CurveOnSurface

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGeom_CurveOnSurface> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 1cca3a92d5f5d7004df4f4c4c7feb8a4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a curveonsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_CurveOnSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_CurveOnSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 8715a2237d62be4506a2a0bfcf9bef60 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_CurveOnSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_CurveOnSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 74c263ccefadf15ab730b85447df264a ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_CurveOnSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_CurveOnSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESGeom_ToolDirection *
*******************************/
class IGESGeom_ToolDirection {
	public:
		/****************** IGESGeom_ToolDirection ******************/
		/**** md5 signature: 81d259c6e6da870f4ecba15ea5bc1844 ****/
		%feature("compactdefaultargs") IGESGeom_ToolDirection;
		%feature("autodoc", "Returns a tooldirection, ready to work.

Returns
-------
None
") IGESGeom_ToolDirection;
		 IGESGeom_ToolDirection();

		/****************** DirChecker ******************/
		/**** md5 signature: 30ea5b1c04087de78de3a19897499d71 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_Direction

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_Direction> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 0b778f1ff7cd6e6c9f3abe64c4f51a31 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_Direction
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_Direction> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 603f4be7186fe9f96c7dba1826906908 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_Direction
entto: IGESGeom_Direction
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_Direction> & entfrom, const opencascade::handle<IGESGeom_Direction> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: d2c67d59888afd99e7a798cbbb2eae27 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a direction <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_Direction
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_Direction> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 078cd38d6f97c4fdd5db143ad80cb5fc ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_Direction
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_Direction> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 39804fc2249de4feab1890a076749156 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_Direction
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_Direction> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESGeom_ToolFlash *
***************************/
class IGESGeom_ToolFlash {
	public:
		/****************** IGESGeom_ToolFlash ******************/
		/**** md5 signature: 5575dc03e414b348feb006c7d15723d4 ****/
		%feature("compactdefaultargs") IGESGeom_ToolFlash;
		%feature("autodoc", "Returns a toolflash, ready to work.

Returns
-------
None
") IGESGeom_ToolFlash;
		 IGESGeom_ToolFlash();

		/****************** DirChecker ******************/
		/**** md5 signature: 94f7cc1b4db70d71d352e5bb5d7c40b6 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_Flash

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_Flash> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: d7a9345a7adcf7981986dcd929c111ff ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_Flash
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_Flash> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4830d55c3c6b772f7c843c4965647d5e ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_Flash
entto: IGESGeom_Flash
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_Flash> & entfrom, const opencascade::handle<IGESGeom_Flash> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: e8d9d2a57445c5b76bedb2e7bb812c17 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a flash (linefont in directory entry forced to rank = 1).

Parameters
----------
ent: IGESGeom_Flash

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGeom_Flash> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 1b12deb0a4c3452be12e6bf3eedc8ad4 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a flash <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_Flash
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_Flash> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 79cb66e5ab830470e0090a04df826c95 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_Flash
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_Flash> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 0074f3bc315c41cf773e7e0e16c83355 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_Flash
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_Flash> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolFlash {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IGESGeom_ToolLine *
**************************/
class IGESGeom_ToolLine {
	public:
		/****************** IGESGeom_ToolLine ******************/
		/**** md5 signature: 365e1d3470ffbfae8381f1be01b51691 ****/
		%feature("compactdefaultargs") IGESGeom_ToolLine;
		%feature("autodoc", "Returns a toolline, ready to work.

Returns
-------
None
") IGESGeom_ToolLine;
		 IGESGeom_ToolLine();

		/****************** DirChecker ******************/
		/**** md5 signature: ad45b5295a594d68cdd417132249dac9 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_Line

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_Line> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 83406660d98577482275a6c3e650f601 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_Line
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_Line> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 4c04091d0fbc85732cc904edd0fd941a ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_Line
entto: IGESGeom_Line
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_Line> & entfrom, const opencascade::handle<IGESGeom_Line> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: b78a39eaa3b564fc6fdf49246f5ca930 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a line <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_Line
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_Line> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 078a39484c6cd7871440de15d9c85413 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_Line
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_Line> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: af8de1d2f7d5192c92cb72f7398862ea ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_Line
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_Line> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESGeom_ToolOffsetCurve *
*********************************/
class IGESGeom_ToolOffsetCurve {
	public:
		/****************** IGESGeom_ToolOffsetCurve ******************/
		/**** md5 signature: 535babce45ad5eff91c365145273d89a ****/
		%feature("compactdefaultargs") IGESGeom_ToolOffsetCurve;
		%feature("autodoc", "Returns a tooloffsetcurve, ready to work.

Returns
-------
None
") IGESGeom_ToolOffsetCurve;
		 IGESGeom_ToolOffsetCurve();

		/****************** DirChecker ******************/
		/**** md5 signature: f7227942b6fb4d2f9ee8db34973d9f89 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_OffsetCurve

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_OffsetCurve> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 660b152458ef097bc262c43d952494f2 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_OffsetCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_OffsetCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 845582c9f156ff832ab09111a486f86c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_OffsetCurve
entto: IGESGeom_OffsetCurve
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_OffsetCurve> & entfrom, const opencascade::handle<IGESGeom_OffsetCurve> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: 321d33b46fa6774f8fde12f7dfef9832 ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a offsetcurve (if offsettype is not 3, offsetfunction is cleared).

Parameters
----------
ent: IGESGeom_OffsetCurve

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGeom_OffsetCurve> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: ceec431cbf68a16d45973b3bfafaf3ec ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a offsetcurve <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_OffsetCurve
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_OffsetCurve> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: bb13074813bb87a40f008262adcfc084 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_OffsetCurve
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_OffsetCurve> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 9e41339e56fb9eec98434f03367cb8e6 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_OffsetCurve
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_OffsetCurve> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolOffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESGeom_ToolOffsetSurface *
***********************************/
class IGESGeom_ToolOffsetSurface {
	public:
		/****************** IGESGeom_ToolOffsetSurface ******************/
		/**** md5 signature: 04e6df89642ea06e428a0af46e960ac5 ****/
		%feature("compactdefaultargs") IGESGeom_ToolOffsetSurface;
		%feature("autodoc", "Returns a tooloffsetsurface, ready to work.

Returns
-------
None
") IGESGeom_ToolOffsetSurface;
		 IGESGeom_ToolOffsetSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 52d086c17dea6d7322a0d621920c4c87 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_OffsetSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_OffsetSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 029bf074c314cb5b9a27b2f9072199f3 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_OffsetSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_OffsetSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: f08b7e665ee350ac314a366b7fe103d9 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_OffsetSurface
entto: IGESGeom_OffsetSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_OffsetSurface> & entfrom, const opencascade::handle<IGESGeom_OffsetSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 5a59ed4d6b9165370e4556ab9258cb60 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a offsetsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_OffsetSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_OffsetSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: c9ad46fbdb99cbfbea0fe900538105b7 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_OffsetSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_OffsetSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 3fc4cb1138d285122f54a9449a846973 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_OffsetSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_OffsetSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolOffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESGeom_ToolPlane *
***************************/
class IGESGeom_ToolPlane {
	public:
		/****************** IGESGeom_ToolPlane ******************/
		/**** md5 signature: 1a0be37027a25c6e5d2c081575f0f235 ****/
		%feature("compactdefaultargs") IGESGeom_ToolPlane;
		%feature("autodoc", "Returns a toolplane, ready to work.

Returns
-------
None
") IGESGeom_ToolPlane;
		 IGESGeom_ToolPlane();

		/****************** DirChecker ******************/
		/**** md5 signature: 9c6e0fc693d44051a844e4dcf8809364 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_Plane

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_Plane> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: c8a341d1ec0c9082fe73afe503014758 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_Plane
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_Plane> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 6bdb1b40f41d68fa9ba51c87142a1340 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_Plane
entto: IGESGeom_Plane
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_Plane> & entfrom, const opencascade::handle<IGESGeom_Plane> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: cc04e12cc3434e3185afe496b4935d04 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a plane <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_Plane
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_Plane> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 26f2e501c2e7d17c85aa54d7df329a64 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_Plane
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_Plane> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: da45f07f88116da1e2b3ad690c9f6473 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_Plane
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_Plane> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESGeom_ToolPoint *
***************************/
class IGESGeom_ToolPoint {
	public:
		/****************** IGESGeom_ToolPoint ******************/
		/**** md5 signature: 90458bf95fae24053e543e93b8c59532 ****/
		%feature("compactdefaultargs") IGESGeom_ToolPoint;
		%feature("autodoc", "Returns a toolpoint, ready to work.

Returns
-------
None
") IGESGeom_ToolPoint;
		 IGESGeom_ToolPoint();

		/****************** DirChecker ******************/
		/**** md5 signature: 4408b1f542d986b2bd8ac439e54c7cdf ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_Point

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_Point> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: b731aa6a5b444c6a2171fba571b96802 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_Point
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_Point> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 00f9a1759ada529f73bd87ea2068fe78 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_Point
entto: IGESGeom_Point
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_Point> & entfrom, const opencascade::handle<IGESGeom_Point> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 810b28dc8452c8af3895ba3fa012706c ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a point <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_Point
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_Point> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: d1ae0e930a87ccc5d85b93784ba6a695 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_Point
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_Point> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 495700cd13ab3641de2fe17d858fc791 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_Point
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_Point> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESGeom_ToolRuledSurface *
**********************************/
class IGESGeom_ToolRuledSurface {
	public:
		/****************** IGESGeom_ToolRuledSurface ******************/
		/**** md5 signature: 65fa137ea2ddda711519a25543670767 ****/
		%feature("compactdefaultargs") IGESGeom_ToolRuledSurface;
		%feature("autodoc", "Returns a toolruledsurface, ready to work.

Returns
-------
None
") IGESGeom_ToolRuledSurface;
		 IGESGeom_ToolRuledSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: ba9005163c8644c8b146377cf028eb23 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_RuledSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_RuledSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3496ebb34113126b2a953a239287101c ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_RuledSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_RuledSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 53e016191b17022050694c07f2f5fd6a ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_RuledSurface
entto: IGESGeom_RuledSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_RuledSurface> & entfrom, const opencascade::handle<IGESGeom_RuledSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: fd707e53d2b822e2e0a393f4cd6ab435 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a ruledsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_RuledSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_RuledSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 6950176953a858f70ce41d2b2b61e778 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_RuledSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_RuledSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 6c904befdd22176391d635a4db2a519d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_RuledSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_RuledSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolRuledSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESGeom_ToolSplineCurve *
*********************************/
class IGESGeom_ToolSplineCurve {
	public:
		/****************** IGESGeom_ToolSplineCurve ******************/
		/**** md5 signature: 102ce5ccb99d5f9b213654ab9135fb54 ****/
		%feature("compactdefaultargs") IGESGeom_ToolSplineCurve;
		%feature("autodoc", "Returns a toolsplinecurve, ready to work.

Returns
-------
None
") IGESGeom_ToolSplineCurve;
		 IGESGeom_ToolSplineCurve();

		/****************** DirChecker ******************/
		/**** md5 signature: 1d32ff5bc3b957ecef784d8ee6ad76f8 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_SplineCurve

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_SplineCurve> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 511d2eab2515333014bfc818de2d794e ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_SplineCurve
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_SplineCurve> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 37ffcd921d0cb72869318b432ec68703 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_SplineCurve
entto: IGESGeom_SplineCurve
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_SplineCurve> & entfrom, const opencascade::handle<IGESGeom_SplineCurve> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 03112e9d28cffc03a43267804fd26938 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a splinecurve <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_SplineCurve
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_SplineCurve> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: f702411ea962a507d47ef2b6ac2c5126 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_SplineCurve
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_SplineCurve> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: a3c560c619a7fb25d945fe57c09b71a8 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_SplineCurve
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_SplineCurve> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IGESGeom_ToolSplineSurface *
***********************************/
class IGESGeom_ToolSplineSurface {
	public:
		/****************** IGESGeom_ToolSplineSurface ******************/
		/**** md5 signature: dc3180aed714d899cb3af07cb84abcad ****/
		%feature("compactdefaultargs") IGESGeom_ToolSplineSurface;
		%feature("autodoc", "Returns a toolsplinesurface, ready to work.

Returns
-------
None
") IGESGeom_ToolSplineSurface;
		 IGESGeom_ToolSplineSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: 29a7f2060f6e2d8ff892797c790dbad8 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_SplineSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_SplineSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: c0711daedde0490b94dbea5a027dd858 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_SplineSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_SplineSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: d1594c1fe467692f047b93b1cd65bcae ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_SplineSurface
entto: IGESGeom_SplineSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_SplineSurface> & entfrom, const opencascade::handle<IGESGeom_SplineSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 0d55d4a60009f4b776e2763a852596e3 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a splinesurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_SplineSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_SplineSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 3f249e0b04cb4f8062e37d9b9611c451 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_SplineSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_SplineSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 048ee5a903412cfae3e4b0e042301d88 ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_SplineSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_SplineSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class IGESGeom_ToolSurfaceOfRevolution *
*****************************************/
class IGESGeom_ToolSurfaceOfRevolution {
	public:
		/****************** IGESGeom_ToolSurfaceOfRevolution ******************/
		/**** md5 signature: be8414f6911173af294a86882d523613 ****/
		%feature("compactdefaultargs") IGESGeom_ToolSurfaceOfRevolution;
		%feature("autodoc", "Returns a toolsurfaceofrevolution, ready to work.

Returns
-------
None
") IGESGeom_ToolSurfaceOfRevolution;
		 IGESGeom_ToolSurfaceOfRevolution();

		/****************** DirChecker ******************/
		/**** md5 signature: 1c5ff5a1d2cb30bce97c5cf3cd75a89c ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_SurfaceOfRevolution

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: f34c4daeb5db408f7ff95f6251bb9cbf ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_SurfaceOfRevolution
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 76441cece65fa52c3a570cb86dc2315c ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_SurfaceOfRevolution
entto: IGESGeom_SurfaceOfRevolution
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & entfrom, const opencascade::handle<IGESGeom_SurfaceOfRevolution> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 85f6f97cc5d4e8ccb3c2f55d8f63e66f ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a surfaceofrevolution <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_SurfaceOfRevolution
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5eb31c1804f0858aac74a7883a3aed26 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_SurfaceOfRevolution
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: fc19f14ae2aa9cd01d11ee8058e2e71f ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_SurfaceOfRevolution
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_SurfaceOfRevolution> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IGESGeom_ToolTabulatedCylinder *
***************************************/
class IGESGeom_ToolTabulatedCylinder {
	public:
		/****************** IGESGeom_ToolTabulatedCylinder ******************/
		/**** md5 signature: 4b488324ca582c381bb2351dbcd4d7be ****/
		%feature("compactdefaultargs") IGESGeom_ToolTabulatedCylinder;
		%feature("autodoc", "Returns a tooltabulatedcylinder, ready to work.

Returns
-------
None
") IGESGeom_ToolTabulatedCylinder;
		 IGESGeom_ToolTabulatedCylinder();

		/****************** DirChecker ******************/
		/**** md5 signature: 4cf146b075f2e7b76bd5870e6c04bb21 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_TabulatedCylinder

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_TabulatedCylinder> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 1201f6921788e14c69368436fd29fbaf ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_TabulatedCylinder
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_TabulatedCylinder> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 56a9fd4738b331ec77d87c512295dff7 ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_TabulatedCylinder
entto: IGESGeom_TabulatedCylinder
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_TabulatedCylinder> & entfrom, const opencascade::handle<IGESGeom_TabulatedCylinder> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 71680d2624809b413dc0c2309760ee51 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a tabulatedcylinder <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_TabulatedCylinder
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_TabulatedCylinder> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 5d967ef64ed2b5ac3d9451774aa6b10a ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_TabulatedCylinder
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_TabulatedCylinder> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 5c71dd0acf1d3ada109d07fbdf45762d ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_TabulatedCylinder
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_TabulatedCylinder> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolTabulatedCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IGESGeom_ToolTransformationMatrix *
******************************************/
class IGESGeom_ToolTransformationMatrix {
	public:
		/****************** IGESGeom_ToolTransformationMatrix ******************/
		/**** md5 signature: 514a50defdbbc201a00ccf7a6d65ef08 ****/
		%feature("compactdefaultargs") IGESGeom_ToolTransformationMatrix;
		%feature("autodoc", "Returns a tooltransformationmatrix, ready to work.

Returns
-------
None
") IGESGeom_ToolTransformationMatrix;
		 IGESGeom_ToolTransformationMatrix();

		/****************** DirChecker ******************/
		/**** md5 signature: 389b4d67af12b1028ab17e0fbde8eb4b ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_TransformationMatrix

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_TransformationMatrix> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: 3c09ed14dedd1dfcf4bae08f712f1aa7 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_TransformationMatrix
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_TransformationMatrix> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: 07269ac5e782face88dc11717bc86eeb ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_TransformationMatrix
entto: IGESGeom_TransformationMatrix
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_TransformationMatrix> & entfrom, const opencascade::handle<IGESGeom_TransformationMatrix> & entto, Interface_CopyTool & TC);

		/****************** OwnCorrect ******************/
		/**** md5 signature: a176904e6e06a98c3f69a31751048aea ****/
		%feature("compactdefaultargs") OwnCorrect;
		%feature("autodoc", "Sets automatic unambiguous correction on a transformationmatrix (formnumber if 0 or 1, recomputed according positive/negative).

Parameters
----------
ent: IGESGeom_TransformationMatrix

Returns
-------
bool
") OwnCorrect;
		Standard_Boolean OwnCorrect(const opencascade::handle<IGESGeom_TransformationMatrix> & ent);

		/****************** OwnShared ******************/
		/**** md5 signature: 229a13b497da203dae03d5207f3e8469 ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a transformationmatrix <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_TransformationMatrix
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_TransformationMatrix> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: bb3db5c994dd90433b8e36904da3c5cf ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_TransformationMatrix
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_TransformationMatrix> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 2f0caa8108919c194dc1f12df8d1dd0a ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_TransformationMatrix
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_TransformationMatrix> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolTransformationMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IGESGeom_ToolTrimmedSurface *
************************************/
class IGESGeom_ToolTrimmedSurface {
	public:
		/****************** IGESGeom_ToolTrimmedSurface ******************/
		/**** md5 signature: 678d98335fec4b4af3eb619784bccca4 ****/
		%feature("compactdefaultargs") IGESGeom_ToolTrimmedSurface;
		%feature("autodoc", "Returns a tooltrimmedsurface, ready to work.

Returns
-------
None
") IGESGeom_ToolTrimmedSurface;
		 IGESGeom_ToolTrimmedSurface();

		/****************** DirChecker ******************/
		/**** md5 signature: a80ba0d78906a99c38943f5b9d9e7eb6 ****/
		%feature("compactdefaultargs") DirChecker;
		%feature("autodoc", "Returns specific dirchecker.

Parameters
----------
ent: IGESGeom_TrimmedSurface

Returns
-------
IGESData_DirChecker
") DirChecker;
		IGESData_DirChecker DirChecker(const opencascade::handle<IGESGeom_TrimmedSurface> & ent);

		/****************** OwnCheck ******************/
		/**** md5 signature: e7f1d7a6e4a86e82959756eb0877ed10 ****/
		%feature("compactdefaultargs") OwnCheck;
		%feature("autodoc", "Performs specific semantic check.

Parameters
----------
ent: IGESGeom_TrimmedSurface
shares: Interface_ShareTool
ach: Interface_Check

Returns
-------
None
") OwnCheck;
		void OwnCheck(const opencascade::handle<IGESGeom_TrimmedSurface> & ent, const Interface_ShareTool & shares, opencascade::handle<Interface_Check> & ach);

		/****************** OwnCopy ******************/
		/**** md5 signature: de2ed67f7f2ae68d9ecaf7f857dfb0ab ****/
		%feature("compactdefaultargs") OwnCopy;
		%feature("autodoc", "Copies specific parameters.

Parameters
----------
entfrom: IGESGeom_TrimmedSurface
entto: IGESGeom_TrimmedSurface
TC: Interface_CopyTool

Returns
-------
None
") OwnCopy;
		void OwnCopy(const opencascade::handle<IGESGeom_TrimmedSurface> & entfrom, const opencascade::handle<IGESGeom_TrimmedSurface> & entto, Interface_CopyTool & TC);

		/****************** OwnShared ******************/
		/**** md5 signature: 6fa1fe61491431e55933e8c3e546f6eb ****/
		%feature("compactdefaultargs") OwnShared;
		%feature("autodoc", "Lists the entities shared by a trimmedsurface <ent>, from its specific (own) parameters.

Parameters
----------
ent: IGESGeom_TrimmedSurface
iter: Interface_EntityIterator

Returns
-------
None
") OwnShared;
		void OwnShared(const opencascade::handle<IGESGeom_TrimmedSurface> & ent, Interface_EntityIterator & iter);

		/****************** ReadOwnParams ******************/
		/**** md5 signature: 0d62a69178d25a130c7530a2082fe1c0 ****/
		%feature("compactdefaultargs") ReadOwnParams;
		%feature("autodoc", "Reads own parameters from file. <pr> gives access to them, <ir> detains parameter types and values.

Parameters
----------
ent: IGESGeom_TrimmedSurface
IR: IGESData_IGESReaderData
PR: IGESData_ParamReader

Returns
-------
None
") ReadOwnParams;
		void ReadOwnParams(const opencascade::handle<IGESGeom_TrimmedSurface> & ent, const opencascade::handle<IGESData_IGESReaderData> & IR, IGESData_ParamReader & PR);

		/****************** WriteOwnParams ******************/
		/**** md5 signature: 7aec6ad3f2adf345ce6e8739a350363e ****/
		%feature("compactdefaultargs") WriteOwnParams;
		%feature("autodoc", "Writes own parameters to igeswriter.

Parameters
----------
ent: IGESGeom_TrimmedSurface
IW: IGESData_IGESWriter

Returns
-------
None
") WriteOwnParams;
		void WriteOwnParams(const opencascade::handle<IGESGeom_TrimmedSurface> & ent, IGESData_IGESWriter & IW);

};


%extend IGESGeom_ToolTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IGESGeom_TransformationMatrix *
**************************************/
class IGESGeom_TransformationMatrix : public IGESData_TransfEntity {
	public:
		/****************** IGESGeom_TransformationMatrix ******************/
		/**** md5 signature: f03e4e0a30c9b80fdd8ca76a22c99fb1 ****/
		%feature("compactdefaultargs") IGESGeom_TransformationMatrix;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_TransformationMatrix;
		 IGESGeom_TransformationMatrix();

		/****************** Data ******************/
		/**** md5 signature: e09e662eaa3357d23d687f197b71b900 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns individual data error if i not in [1-3] or j not in [1-4].

Parameters
----------
I: int
J: int

Returns
-------
float
") Data;
		Standard_Real Data(const Standard_Integer I, const Standard_Integer J);

		/****************** Init ******************/
		/**** md5 signature: 2b97e9bc3b0c51a3ec4b195b8be02388 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class transformationmatrix - amatrix : 3 x 4 array containing elements of the transformation matrix raises exception if amatrix is not 3 x 4 array.

Parameters
----------
aMatrix: TColStd_HArray2OfReal

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TColStd_HArray2OfReal> & aMatrix);

		/****************** SetFormNumber ******************/
		/**** md5 signature: 3324cf0241d76f0464eb1226a9a0994f ****/
		%feature("compactdefaultargs") SetFormNumber;
		%feature("autodoc", "Changes formnumber (indicates the type of transf : transformation 0-1 or coordinate system 10-11-12) error if not in ranges [0-1] or [10-12].

Parameters
----------
form: int

Returns
-------
None
") SetFormNumber;
		void SetFormNumber(const Standard_Integer form);

		/****************** Value ******************/
		/**** md5 signature: 66e40ffde2d60f6fbdb8c4ff485ec1f0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the transformation matrix 4th row elements of gtrsf will always be 0, 0, 0, 1 (not defined).

Returns
-------
gp_GTrsf
") Value;
		gp_GTrsf Value();

};


%make_alias(IGESGeom_TransformationMatrix)

%extend IGESGeom_TransformationMatrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IGESGeom_TrimmedSurface *
********************************/
class IGESGeom_TrimmedSurface : public IGESData_IGESEntity {
	public:
		/****************** IGESGeom_TrimmedSurface ******************/
		/**** md5 signature: 5515b12165e1efe47ff65ece6ce9baf1 ****/
		%feature("compactdefaultargs") IGESGeom_TrimmedSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESGeom_TrimmedSurface;
		 IGESGeom_TrimmedSurface();

		/****************** HasOuterContour ******************/
		/**** md5 signature: 79c993119532bb847cc4f2d006f3d958 ****/
		%feature("compactdefaultargs") HasOuterContour;
		%feature("autodoc", "Returns true if outer contour exists.

Returns
-------
bool
") HasOuterContour;
		Standard_Boolean HasOuterContour();

		/****************** Init ******************/
		/**** md5 signature: 3141f1d77295058e9a04bfa1a19a120a ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This method is used to set the fields of the class trimmedsurface - asurface : surface to be trimmed - aflag : outer boundary type false = the outer boundary is the boundary of rectangle d which is the domain of the surface to be trimmed true = otherwise - anouter : closed curve which constitutes outer boundary - allinners : array of closed curves which constitute the inner boundary.

Parameters
----------
aSurface: IGESData_IGESEntity
aFlag: int
anOuter: IGESGeom_CurveOnSurface
allInners: IGESGeom_HArray1OfCurveOnSurface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<IGESData_IGESEntity> & aSurface, const Standard_Integer aFlag, const opencascade::handle<IGESGeom_CurveOnSurface> & anOuter, const opencascade::handle<IGESGeom_HArray1OfCurveOnSurface> & allInners);

		/****************** InnerContour ******************/
		/**** md5 signature: 5c53d9b7d60e0af38a23931b6d591c0d ****/
		%feature("compactdefaultargs") InnerContour;
		%feature("autodoc", "Returns the index'th inner contour raises exception if index <= 0 or index > nbinnercontours().

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IGESGeom_CurveOnSurface>
") InnerContour;
		opencascade::handle<IGESGeom_CurveOnSurface> InnerContour(const Standard_Integer Index);

		/****************** NbInnerContours ******************/
		/**** md5 signature: 6da2f321fbc67b895324317a450bfe39 ****/
		%feature("compactdefaultargs") NbInnerContours;
		%feature("autodoc", "Returns the number of inner boundaries.

Returns
-------
int
") NbInnerContours;
		Standard_Integer NbInnerContours();

		/****************** OuterBoundaryType ******************/
		/**** md5 signature: 076125e1a6a67163971970dec0918a40 ****/
		%feature("compactdefaultargs") OuterBoundaryType;
		%feature("autodoc", "Returns the outer contour type of the trimmed surface 0 : the outer boundary is the boundary of d 1 : otherwise.

Returns
-------
int
") OuterBoundaryType;
		Standard_Integer OuterBoundaryType();

		/****************** OuterContour ******************/
		/**** md5 signature: 09953ac2ea636163abf8763e43bab5c2 ****/
		%feature("compactdefaultargs") OuterContour;
		%feature("autodoc", "Returns the outer contour of the trimmed surface.

Returns
-------
opencascade::handle<IGESGeom_CurveOnSurface>
") OuterContour;
		opencascade::handle<IGESGeom_CurveOnSurface> OuterContour();

		/****************** Surface ******************/
		/**** md5 signature: 21224d36ecde9943682f882d2d37c893 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface to be trimmed.

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") Surface;
		opencascade::handle<IGESData_IGESEntity> Surface();

};


%make_alias(IGESGeom_TrimmedSurface)

%extend IGESGeom_TrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class IGESGeom_HArray1OfBoundary : public IGESGeom_Array1OfBoundary, public Standard_Transient {
  public:
    IGESGeom_HArray1OfBoundary(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESGeom_HArray1OfBoundary(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESGeom_Array1OfBoundary::value_type& theValue);
    IGESGeom_HArray1OfBoundary(const IGESGeom_Array1OfBoundary& theOther);
    const IGESGeom_Array1OfBoundary& Array1();
    IGESGeom_Array1OfBoundary& ChangeArray1();
};
%make_alias(IGESGeom_HArray1OfBoundary)


class IGESGeom_HArray1OfCurveOnSurface : public IGESGeom_Array1OfCurveOnSurface, public Standard_Transient {
  public:
    IGESGeom_HArray1OfCurveOnSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESGeom_HArray1OfCurveOnSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESGeom_Array1OfCurveOnSurface::value_type& theValue);
    IGESGeom_HArray1OfCurveOnSurface(const IGESGeom_Array1OfCurveOnSurface& theOther);
    const IGESGeom_Array1OfCurveOnSurface& Array1();
    IGESGeom_Array1OfCurveOnSurface& ChangeArray1();
};
%make_alias(IGESGeom_HArray1OfCurveOnSurface)


class IGESGeom_HArray1OfTransformationMatrix : public IGESGeom_Array1OfTransformationMatrix, public Standard_Transient {
  public:
    IGESGeom_HArray1OfTransformationMatrix(const Standard_Integer theLower, const Standard_Integer theUpper);
    IGESGeom_HArray1OfTransformationMatrix(const Standard_Integer theLower, const Standard_Integer theUpper, const IGESGeom_Array1OfTransformationMatrix::value_type& theValue);
    IGESGeom_HArray1OfTransformationMatrix(const IGESGeom_Array1OfTransformationMatrix& theOther);
    const IGESGeom_Array1OfTransformationMatrix& Array1();
    IGESGeom_Array1OfTransformationMatrix& ChangeArray1();
};
%make_alias(IGESGeom_HArray1OfTransformationMatrix)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
