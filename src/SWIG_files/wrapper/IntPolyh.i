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
%define INTPOLYHDOCSTRING
"IntPolyh module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intpolyh.html"
%enddef
%module (package="OCC.Core", docstring=INTPOLYHDOCSTRING) IntPolyh


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
#include<IntPolyh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import TColStd.i
%import Bnd.i

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
/* end handles declaration */

/* templates */
%template(IntPolyh_ListOfCouples) NCollection_List<IntPolyh_Couple>;

%extend NCollection_List<IntPolyh_Couple> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPolyh_SeqOfStartPoints) NCollection_Sequence<IntPolyh_StartPoint>;

%extend NCollection_Sequence<IntPolyh_StartPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef IntPolyh_Array<IntPolyh_Edge> IntPolyh_ArrayOfEdges;
typedef IntPolyh_Array<IntPolyh_PointNormal> IntPolyh_ArrayOfPointNormal;
typedef IntPolyh_Array<IntPolyh_Point> IntPolyh_ArrayOfPoints;
typedef IntPolyh_Array<IntPolyh_SectionLine> IntPolyh_ArrayOfSectionLines;
typedef IntPolyh_Array<IntPolyh_StartPoint> IntPolyh_ArrayOfTangentZones;
typedef IntPolyh_Array<IntPolyh_Triangle> IntPolyh_ArrayOfTriangles;
typedef IntPolyh_ListOfCouples::Iterator IntPolyh_ListIteratorOfListOfCouples;
typedef NCollection_List<IntPolyh_Couple> IntPolyh_ListOfCouples;
typedef IntPolyh_MaillageAffinage * IntPolyh_PMaillageAffinage;
typedef NCollection_Sequence<IntPolyh_StartPoint> IntPolyh_SeqOfStartPoints;
/* end typedefs declaration */

/***********************
* class IntPolyh_Array *
***********************/
/************************
* class IntPolyh_Couple *
************************/
class IntPolyh_Couple {
	public:
		/****************** IntPolyh_Couple ******************/
		/**** md5 signature: 4905c4bc961aef0240459f6c6c349da3 ****/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Couple;
		 IntPolyh_Couple();

		/****************** IntPolyh_Couple ******************/
		/**** md5 signature: 2ad54cd045a228f75ac9a719fd4ad546 ****/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "Constructor.

Parameters
----------
theTriangle1: int
theTriangle2: int
theAngle: float,optional
	default value is -2.0

Returns
-------
None
") IntPolyh_Couple;
		 IntPolyh_Couple(const Standard_Integer theTriangle1, const Standard_Integer theTriangle2, const Standard_Real theAngle = -2.0);

		/****************** Angle ******************/
		/**** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the angle.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Dump ******************/
		/**** md5 signature: 110c93028fb8130e272d294a2869a993 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer v);

		/****************** FirstValue ******************/
		/**** md5 signature: 74f8032a34f70f7e51a37a08a02625c8 ****/
		%feature("compactdefaultargs") FirstValue;
		%feature("autodoc", "Returns the first index.

Returns
-------
int
") FirstValue;
		Standard_Integer FirstValue();

		/****************** HashCode ******************/
		/**** md5 signature: 72f7d6afdc2f4b2c860a8e39d683afaf ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for this couple, in the range [1, theupperbound] @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** IsAnalyzed ******************/
		/**** md5 signature: d6b39f513274b640bd7a5567aecc3da1 ****/
		%feature("compactdefaultargs") IsAnalyzed;
		%feature("autodoc", "Returns true if the couple has been analyzed.

Returns
-------
bool
") IsAnalyzed;
		Standard_Boolean IsAnalyzed();

		/****************** IsEqual ******************/
		/**** md5 signature: 15b5800bdd5cfd6453c13b9e097cb415 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the couple is equal to <theother>.

Parameters
----------
theOther: IntPolyh_Couple

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const IntPolyh_Couple & theOther);

		/****************** SecondValue ******************/
		/**** md5 signature: e2699fc080f4ac7ae7e3aea3abc58618 ****/
		%feature("compactdefaultargs") SecondValue;
		%feature("autodoc", "Returns the second index.

Returns
-------
int
") SecondValue;
		Standard_Integer SecondValue();

		/****************** SetAnalyzed ******************/
		/**** md5 signature: b7b5baf90ace0ca7154ebea6af13f72b ****/
		%feature("compactdefaultargs") SetAnalyzed;
		%feature("autodoc", "Sets the analyzed flag.

Parameters
----------
theAnalyzed: bool

Returns
-------
None
") SetAnalyzed;
		void SetAnalyzed(const Standard_Boolean theAnalyzed);

		/****************** SetAngle ******************/
		/**** md5 signature: 76a49ca25a7aa0cf5ba05b3c533fe78e ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Sets the angle.

Parameters
----------
theAngle: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real theAngle);

		/****************** SetCoupleValue ******************/
		/**** md5 signature: 90f3b87a3f65afded7632970de851c70 ****/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "Sets the triangles.

Parameters
----------
theInd1: int
theInd2: int

Returns
-------
None
") SetCoupleValue;
		void SetCoupleValue(const Standard_Integer theInd1, const Standard_Integer theInd2);

};


%extend IntPolyh_Couple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPolyh_CoupleMapHasher *
*********************************/
class IntPolyh_CoupleMapHasher {
	public:
		/****************** HashCode ******************/
		/**** md5 signature: 00744901424dd820a90397dcc6763723 ****/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given couple, in the range [1, theupperbound] @param thecouple the couple which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theCouple: IntPolyh_Couple
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const IntPolyh_Couple & theCouple, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		/**** md5 signature: 554f371024af7c975216fab50c200abe ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCouple1: IntPolyh_Couple
theCouple2: IntPolyh_Couple

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const IntPolyh_Couple & theCouple1, const IntPolyh_Couple & theCouple2);

};


%extend IntPolyh_CoupleMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntPolyh_Edge *
**********************/
class IntPolyh_Edge {
	public:
		/****************** IntPolyh_Edge ******************/
		/**** md5 signature: 5075b69dd8ac9ff9cb3f7c222b7adb4e ****/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Edge;
		 IntPolyh_Edge();

		/****************** IntPolyh_Edge ******************/
		/**** md5 signature: 546354eae7a42255ee366566dccf8437 ****/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "Constructor.

Parameters
----------
thePoint1: int
thePoint2: int
theTriangle1: int
theTriangle2: int

Returns
-------
None
") IntPolyh_Edge;
		 IntPolyh_Edge(const Standard_Integer thePoint1, const Standard_Integer thePoint2, const Standard_Integer theTriangle1, const Standard_Integer theTriangle2);

		/****************** Dump ******************/
		/**** md5 signature: 110c93028fb8130e272d294a2869a993 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
v: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer v);

		/****************** FirstPoint ******************/
		/**** md5 signature: a96e582923b6d3c6eaa1f60febc5fe6c ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
int
") FirstPoint;
		Standard_Integer FirstPoint();

		/****************** FirstTriangle ******************/
		/**** md5 signature: 243ce0ddc4d583e71bfc180291f2c74d ****/
		%feature("compactdefaultargs") FirstTriangle;
		%feature("autodoc", "Returns the first triangle.

Returns
-------
int
") FirstTriangle;
		Standard_Integer FirstTriangle();

		/****************** SecondPoint ******************/
		/**** md5 signature: 72a7379dccfa5bce46bd84d12acec99b ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns the second point.

Returns
-------
int
") SecondPoint;
		Standard_Integer SecondPoint();

		/****************** SecondTriangle ******************/
		/**** md5 signature: f1d8d361be7d166e270edeea48f873f0 ****/
		%feature("compactdefaultargs") SecondTriangle;
		%feature("autodoc", "Returns the second triangle.

Returns
-------
int
") SecondTriangle;
		Standard_Integer SecondTriangle();

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 083b09fcfbdd1fc3d0e79515942eca68 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer thePoint);

		/****************** SetFirstTriangle ******************/
		/**** md5 signature: 8339725513bfad649ea2c41ee13b65ca ****/
		%feature("compactdefaultargs") SetFirstTriangle;
		%feature("autodoc", "Sets the first triangle.

Parameters
----------
theTriangle: int

Returns
-------
None
") SetFirstTriangle;
		void SetFirstTriangle(const Standard_Integer theTriangle);

		/****************** SetSecondPoint ******************/
		/**** md5 signature: 30ecd94c48d0a5d89ca894a21ecac9ff ****/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Sets the second point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetSecondPoint;
		void SetSecondPoint(const Standard_Integer thePoint);

		/****************** SetSecondTriangle ******************/
		/**** md5 signature: c87e8a57291fb8d5c78ffcc4956e7732 ****/
		%feature("compactdefaultargs") SetSecondTriangle;
		%feature("autodoc", "Sets the second triangle.

Parameters
----------
theTriangle: int

Returns
-------
None
") SetSecondTriangle;
		void SetSecondTriangle(const Standard_Integer theTriangle);

};


%extend IntPolyh_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPolyh_Intersection *
******************************/
class IntPolyh_Intersection {
	public:
		/****************** IntPolyh_Intersection ******************/
		/**** md5 signature: f18d9fbcd433488558ef7a008a739917 ****/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "Constructor for intersection of two surfaces with default parameters. performs intersection.

Parameters
----------
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface

Returns
-------
None
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2);

		/****************** IntPolyh_Intersection ******************/
		/**** md5 signature: 94052d037a4896b938be5a6b8fcb526b ****/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "Constructor for intersection of two surfaces with the given size of the sampling nets: - <thenbsu1> x <thenbsv1> - for the first surface <thes1>; - <thenbsu2> x <thenbsv2> - for the second surface <thes2>. performs intersection.

Parameters
----------
theS1: Adaptor3d_HSurface
theNbSU1: int
theNbSV1: int
theS2: Adaptor3d_HSurface
theNbSU2: int
theNbSV2: int

Returns
-------
None
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_HSurface> & theS1, const Standard_Integer theNbSU1, const Standard_Integer theNbSV1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const Standard_Integer theNbSU2, const Standard_Integer theNbSV2);

		/****************** IntPolyh_Intersection ******************/
		/**** md5 signature: 93e9167bc900d310c3498d954ecf3183 ****/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "Constructor for intersection of two surfaces with the precomputed sampling. performs intersection.

Parameters
----------
theS1: Adaptor3d_HSurface
theUPars1: TColStd_Array1OfReal
theVPars1: TColStd_Array1OfReal
theS2: Adaptor3d_HSurface
theUPars2: TColStd_Array1OfReal
theVPars2: TColStd_Array1OfReal

Returns
-------
None
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_HSurface> & theS1, const TColStd_Array1OfReal & theUPars1, const TColStd_Array1OfReal & theVPars1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const TColStd_Array1OfReal & theUPars2, const TColStd_Array1OfReal & theVPars2);

		/****************** GetLinePoint ******************/
		/**** md5 signature: 1d6e9a1fe8c96c912dec520f27020a75 ****/
		%feature("compactdefaultargs") GetLinePoint;
		%feature("autodoc", "Gets the parameters of the point in section line.

Parameters
----------
IndexLine: int
IndexPoint: int

Returns
-------
x: float
y: float
z: float
u1: float
v1: float
u2: float
v2: float
incidence: float
") GetLinePoint;
		void GetLinePoint(const Standard_Integer IndexLine, const Standard_Integer IndexPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetTangentZonePoint ******************/
		/**** md5 signature: 88ecf410b364d690380833373fef4840 ****/
		%feature("compactdefaultargs") GetTangentZonePoint;
		%feature("autodoc", "Gets the parameters of the point in tangent zone.

Parameters
----------
IndexLine: int
IndexPoint: int

Returns
-------
x: float
y: float
z: float
u1: float
v1: float
u2: float
v2: float
") GetTangentZonePoint;
		void GetTangentZonePoint(const Standard_Integer IndexLine, const Standard_Integer IndexPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns state of the operation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPointsInLine ******************/
		/**** md5 signature: f3ec11eec3cea5651932d4048586f83f ****/
		%feature("compactdefaultargs") NbPointsInLine;
		%feature("autodoc", "Returns the number of points in the given line.

Parameters
----------
IndexLine: int

Returns
-------
int
") NbPointsInLine;
		Standard_Integer NbPointsInLine(const Standard_Integer IndexLine);

		/****************** NbPointsInTangentZone ******************/
		/**** md5 signature: b4e1b98ce7333f7e498d4f2883a85dcb ****/
		%feature("compactdefaultargs") NbPointsInTangentZone;
		%feature("autodoc", "Returns number of points in tangent zone.

Parameters
----------
Standard_Integer: 

Returns
-------
int
") NbPointsInTangentZone;
		Standard_Integer NbPointsInTangentZone(const Standard_Integer);

		/****************** NbSectionLines ******************/
		/**** md5 signature: 4ef07884a98a730b09f648f9f8ad34eb ****/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "Returns the number of section lines.

Returns
-------
int
") NbSectionLines;
		Standard_Integer NbSectionLines();

		/****************** NbTangentZones ******************/
		/**** md5 signature: bd37574252f98e4fea4043ef0036c47e ****/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbTangentZones;
		Standard_Integer NbTangentZones();

};


%extend IntPolyh_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntPolyh_MaillageAffinage *
**********************************/
/***********************
* class IntPolyh_Point *
***********************/
class IntPolyh_Point {
	public:
		/****************** IntPolyh_Point ******************/
		/**** md5 signature: c8496207698f85ff16b4fb6e16ae4771 ****/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Point;
		 IntPolyh_Point();

		/****************** IntPolyh_Point ******************/
		/**** md5 signature: 0dad2edb2770898af34a7ca0fc080236 ****/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "Constructor.

Parameters
----------
x: float
y: float
z: float
u: float
v: float

Returns
-------
None
") IntPolyh_Point;
		 IntPolyh_Point(const Standard_Real x, const Standard_Real y, const Standard_Real z, const Standard_Real u, const Standard_Real v);

		/****************** Add ******************/
		/**** md5 signature: 5e4cb7b51f6648df0782f9601e2b2f67 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Addition.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") Add;
		IntPolyh_Point Add(const IntPolyh_Point & P1);

		/****************** Cross ******************/
		/**** md5 signature: f15f478e400dd87650d551d688bde9eb ****/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "Cross.

Parameters
----------
P1: IntPolyh_Point
P2: IntPolyh_Point

Returns
-------
None
") Cross;
		void Cross(const IntPolyh_Point & P1, const IntPolyh_Point & P2);

		/****************** Degenerated ******************/
		/**** md5 signature: 7b22888241bd7da5f52ede8bce0e69f7 ****/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Returns the degenerated flag.

Returns
-------
bool
") Degenerated;
		Standard_Boolean Degenerated();

		/****************** Divide ******************/
		/**** md5 signature: ace8843482a5d6b8313f113db19c5955 ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Division.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") Divide;
		IntPolyh_Point Divide(const Standard_Real rr);

		/****************** Dot ******************/
		/**** md5 signature: 1967f04538b501dbf41bde7bb58346b5 ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Dot.

Parameters
----------
P2: IntPolyh_Point

Returns
-------
float
") Dot;
		Standard_Real Dot(const IntPolyh_Point & P2);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Dump ******************/
		/**** md5 signature: 76c1e871500c0f93b485d18107c5c977 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump.

Parameters
----------
i: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer i);

		/****************** Equal ******************/
		/**** md5 signature: 2c8a7c7f5154d381a4c26aad79ea1ea7 ****/
		%feature("compactdefaultargs") Equal;
		%feature("autodoc", "Assignment operator.

Parameters
----------
Pt: IntPolyh_Point

Returns
-------
None
") Equal;
		void Equal(const IntPolyh_Point & Pt);

		/****************** Middle ******************/
		/**** md5 signature: cc93526ee2db8e570c321c6f93164d0f ****/
		%feature("compactdefaultargs") Middle;
		%feature("autodoc", "Creates middle point from p1 and p2 and stores it to this.

Parameters
----------
MySurface: Adaptor3d_HSurface
P1: IntPolyh_Point
P2: IntPolyh_Point

Returns
-------
None
") Middle;
		void Middle(const opencascade::handle<Adaptor3d_HSurface> & MySurface, const IntPolyh_Point & P1, const IntPolyh_Point & P2);

		/****************** Multiplication ******************/
		/**** md5 signature: 5a6c10891abd815fe7f286827a7694e3 ****/
		%feature("compactdefaultargs") Multiplication;
		%feature("autodoc", "Multiplication.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") Multiplication;
		IntPolyh_Point Multiplication(const Standard_Real rr);

		/****************** PartOfCommon ******************/
		/**** md5 signature: 60db777cf4f2f0d9f60698c0ec033d5c ****/
		%feature("compactdefaultargs") PartOfCommon;
		%feature("autodoc", "Returns 0 if the point is not common with the other surface.

Returns
-------
int
") PartOfCommon;
		Standard_Integer PartOfCommon();

		/****************** Set ******************/
		/**** md5 signature: b27fa39f2c422cf1396ccd75f5e8328b ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the point.

Parameters
----------
x: float
y: float
z: float
u: float
v: float
II: int,optional
	default value is 1

Returns
-------
None
") Set;
		void Set(const Standard_Real x, const Standard_Real y, const Standard_Real z, const Standard_Real u, const Standard_Real v, const Standard_Integer II = 1);

		/****************** SetDegenerated ******************/
		/**** md5 signature: fc4b00c785fe897cdfa5ea3ca33dff73 ****/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "Sets the degenerated flag.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetDegenerated;
		void SetDegenerated(const Standard_Boolean theFlag);

		/****************** SetPartOfCommon ******************/
		/**** md5 signature: f1a70454f64c7bd9610af21997b5a83e ****/
		%feature("compactdefaultargs") SetPartOfCommon;
		%feature("autodoc", "Sets the part of common.

Parameters
----------
ii: int

Returns
-------
None
") SetPartOfCommon;
		void SetPartOfCommon(const Standard_Integer ii);

		/****************** SetU ******************/
		/**** md5 signature: db5db2c50aff6626a7e1f03a96fce52c ****/
		%feature("compactdefaultargs") SetU;
		%feature("autodoc", "Sets the u coordinate for the 2d point.

Parameters
----------
u: float

Returns
-------
None
") SetU;
		void SetU(const Standard_Real u);

		/****************** SetV ******************/
		/**** md5 signature: 245af6edcdd12761fd501416fd5f53ae ****/
		%feature("compactdefaultargs") SetV;
		%feature("autodoc", "Sets the v coordinate for the 2d point.

Parameters
----------
v: float

Returns
-------
None
") SetV;
		void SetV(const Standard_Real v);

		/****************** SetX ******************/
		/**** md5 signature: ac4a0be0a06e8b57ecc84f9fb760ea3b ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Sets the x coordinate for the 3d point.

Parameters
----------
x: float

Returns
-------
None
") SetX;
		void SetX(const Standard_Real x);

		/****************** SetY ******************/
		/**** md5 signature: 17ba29692eecda22f97e3e2852418a54 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Sets the y coordinate for the 3d point.

Parameters
----------
y: float

Returns
-------
None
") SetY;
		void SetY(const Standard_Real y);

		/****************** SetZ ******************/
		/**** md5 signature: b04395a80dcced2a11b2d48ca0985762 ****/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "Sets the z coordinate for the 3d point.

Parameters
----------
z: float

Returns
-------
None
") SetZ;
		void SetZ(const Standard_Real z);

		/****************** SquareDistance ******************/
		/**** md5 signature: e18788ed62dd08151daedaf87cddb1bb ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Square distance to the other point.

Parameters
----------
P2: IntPolyh_Point

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const IntPolyh_Point & P2);

		/****************** SquareModulus ******************/
		/**** md5 signature: e568dbeb039e9e13533b9c14cc54c454 ****/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Square modulus.

Returns
-------
float
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Sub ******************/
		/**** md5 signature: bd76a5f8c74e94ab3162c2671a17bc4c ****/
		%feature("compactdefaultargs") Sub;
		%feature("autodoc", "Subtraction.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") Sub;
		IntPolyh_Point Sub(const IntPolyh_Point & P1);

		/****************** U ******************/
		/**** md5 signature: cc4bae97855a9f22a96c46784375ec6b ****/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns the u coordinate of the 2d point.

Returns
-------
float
") U;
		Standard_Real U();

		/****************** V ******************/
		/**** md5 signature: ee0b5a184192e1fe834b88f93a7072c6 ****/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns the v coordinate of the 2d point.

Returns
-------
float
") V;
		Standard_Real V();

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns x coordinate of the 3d point.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns y coordinate of the 3d point.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 786e228d2eeaf64f99dd51d3ab338f77 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate of the 3d point.

Returns
-------
float
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: ea19ca798303740c132cee442c6a73e5 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "No available documentation.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") operator *;
		IntPolyh_Point operator *(const Standard_Real rr);

		/****************** operator + ******************/
		/**** md5 signature: 841cff434eca6d0d0659001a7df30cf5 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") operator +;
		IntPolyh_Point operator +(const IntPolyh_Point & P1);

		/****************** operator - ******************/
		/**** md5 signature: 08ecd36ff809e04db98f500db739e4f5 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntPolyh_Point

Returns
-------
IntPolyh_Point
") operator -;
		IntPolyh_Point operator -(const IntPolyh_Point & P1);

		/****************** operator / ******************/
		/**** md5 signature: b26720f1579bb496b4062ffcfc88e10e ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "No available documentation.

Parameters
----------
rr: float

Returns
-------
IntPolyh_Point
") operator /;
		IntPolyh_Point operator /(const Standard_Real rr);

};


%extend IntPolyh_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPolyh_PointNormal *
*****************************/
class IntPolyh_PointNormal {
	public:
		gp_Pnt Point;
		gp_Vec Normal;
};


%extend IntPolyh_PointNormal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPolyh_SectionLine *
*****************************/
class IntPolyh_SectionLine {
	public:
		/****************** IntPolyh_SectionLine ******************/
		/**** md5 signature: 1c0a10a798fc36fa5207bf9b09cd3759 ****/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine();

		/****************** IntPolyh_SectionLine ******************/
		/**** md5 signature: 989391575d0e946fd51e438b94ec4c3a ****/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
None
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine(const Standard_Integer nn);

		/****************** ChangeValue ******************/
		/**** md5 signature: 7107f0e7ad6356869980a743b544f7da ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
IntPolyh_StartPoint
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue(const Standard_Integer nn);

		/****************** Copy ******************/
		/**** md5 signature: b67c5399d470327d03c3fb0ba898503e ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: IntPolyh_SectionLine

Returns
-------
IntPolyh_SectionLine
") Copy;
		IntPolyh_SectionLine & Copy(const IntPolyh_SectionLine & Other);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** GetN ******************/
		/**** md5 signature: 5fb9f4b3874f795a7a815fab85aea7d0 ****/
		%feature("compactdefaultargs") GetN;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetN;
		Standard_Integer GetN();

		/****************** IncrementNbStartPoints ******************/
		/**** md5 signature: 22d610daf3f0535b3b5755ba147b5daf ****/
		%feature("compactdefaultargs") IncrementNbStartPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IncrementNbStartPoints;
		void IncrementNbStartPoints();

		/****************** Init ******************/
		/**** md5 signature: 672da0aed6232515e23b52be8c42d935 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer nn);

		/****************** NbStartPoints ******************/
		/**** md5 signature: 1bf73c1a8fe268cf42d764fcf8ea8c32 ****/
		%feature("compactdefaultargs") NbStartPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbStartPoints;
		Standard_Integer NbStartPoints();

		/****************** Prepend ******************/
		/**** md5 signature: af0ffcb4b68f31c5509f72fef525cce7 ****/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: IntPolyh_StartPoint

Returns
-------
None
") Prepend;
		void Prepend(const IntPolyh_StartPoint & SP);

		/****************** Value ******************/
		/**** md5 signature: e636beb39aadea778f4226984bd7f1ea ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
nn: int

Returns
-------
IntPolyh_StartPoint
") Value;
		const IntPolyh_StartPoint & Value(const Standard_Integer nn);

};


%extend IntPolyh_SectionLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPolyh_StartPoint *
****************************/
class IntPolyh_StartPoint {
	public:
		/****************** IntPolyh_StartPoint ******************/
		/**** md5 signature: 27e2c4de499969621371ab2b47ca9f70 ****/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint();

		/****************** IntPolyh_StartPoint ******************/
		/**** md5 signature: 05946fa5bbacb9f47b1ed9bfc8040d64 ****/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
xx: float
yy: float
zz: float
uu1: float
vv1: float
uu2: float
vv2: float
T1: int
E1: int
LAM1: float
T2: int
E2: int
LAM2: float
List: int

Returns
-------
None
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint(const Standard_Real xx, const Standard_Real yy, const Standard_Real zz, const Standard_Real uu1, const Standard_Real vv1, const Standard_Real uu2, const Standard_Real vv2, const Standard_Integer T1, const Standard_Integer E1, const Standard_Real LAM1, const Standard_Integer T2, const Standard_Integer E2, const Standard_Real LAM2, const Standard_Integer List);

		/****************** ChainList ******************/
		/**** md5 signature: 1c0b4fb6f76ec9018ad0ab27c00c627c ****/
		%feature("compactdefaultargs") ChainList;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ChainList;
		Standard_Integer ChainList();

		/****************** CheckSameSP ******************/
		/**** md5 signature: df2c758195df1da70c4bd2d489232571 ****/
		%feature("compactdefaultargs") CheckSameSP;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: IntPolyh_StartPoint

Returns
-------
int
") CheckSameSP;
		Standard_Integer CheckSameSP(const IntPolyh_StartPoint & SP);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Dump ******************/
		/**** md5 signature: 76c1e871500c0f93b485d18107c5c977 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
i: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer i);

		/****************** E1 ******************/
		/**** md5 signature: bbded0f6b595435125aefc3d7cc4347c ****/
		%feature("compactdefaultargs") E1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") E1;
		Standard_Integer E1();

		/****************** E2 ******************/
		/**** md5 signature: 97ebb9b696146cfd15fba68f3c19b34f ****/
		%feature("compactdefaultargs") E2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") E2;
		Standard_Integer E2();

		/****************** GetAngle ******************/
		/**** md5 signature: 471f6054d76102bd99c47a5db9707ccb ****/
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") GetAngle;
		Standard_Real GetAngle();

		/****************** GetEdgePoints ******************/
		/**** md5 signature: 1c18921c6159ff0c48a16735f9352ece ****/
		%feature("compactdefaultargs") GetEdgePoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
Triangle: IntPolyh_Triangle

Returns
-------
FirstEdgePoint: int
SecondEdgePoint: int
LastPoint: int
") GetEdgePoints;
		Standard_Integer GetEdgePoints(const IntPolyh_Triangle & Triangle, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Lambda1 ******************/
		/**** md5 signature: 89d04a78455fc185e01e8d05fed81c94 ****/
		%feature("compactdefaultargs") Lambda1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Lambda1;
		Standard_Real Lambda1();

		/****************** Lambda2 ******************/
		/**** md5 signature: f343ae8f6725434339d3f2cd0f721d98 ****/
		%feature("compactdefaultargs") Lambda2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Lambda2;
		Standard_Real Lambda2();

		/****************** SetAngle ******************/
		/**** md5 signature: 99d77a1582b439ff5868a61b2489ddee ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "No available documentation.

Parameters
----------
ang: float

Returns
-------
None
") SetAngle;
		void SetAngle(const Standard_Real ang);

		/****************** SetChainList ******************/
		/**** md5 signature: bb7bddbb5865101b6b5e9fc1b4a92c73 ****/
		%feature("compactdefaultargs") SetChainList;
		%feature("autodoc", "No available documentation.

Parameters
----------
ChList: int

Returns
-------
None
") SetChainList;
		void SetChainList(const Standard_Integer ChList);

		/****************** SetCoupleValue ******************/
		/**** md5 signature: 7e2d16f77ee447488d9de31bc4c359ac ****/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
IT1: int
IT2: int

Returns
-------
None
") SetCoupleValue;
		void SetCoupleValue(const Standard_Integer IT1, const Standard_Integer IT2);

		/****************** SetEdge1 ******************/
		/**** md5 signature: bfe76e7f7279c77db3c3d6d3cdf5ec82 ****/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "No available documentation.

Parameters
----------
IE1: int

Returns
-------
None
") SetEdge1;
		void SetEdge1(const Standard_Integer IE1);

		/****************** SetEdge2 ******************/
		/**** md5 signature: c9975bdad4db8aa3b718d5cf7b56c34d ****/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "No available documentation.

Parameters
----------
IE2: int

Returns
-------
None
") SetEdge2;
		void SetEdge2(const Standard_Integer IE2);

		/****************** SetLambda1 ******************/
		/**** md5 signature: 907e759b09edddf55c008e3413fa5264 ****/
		%feature("compactdefaultargs") SetLambda1;
		%feature("autodoc", "No available documentation.

Parameters
----------
LAM1: float

Returns
-------
None
") SetLambda1;
		void SetLambda1(const Standard_Real LAM1);

		/****************** SetLambda2 ******************/
		/**** md5 signature: 3d750d100043ff6f77a92302d47c0fa2 ****/
		%feature("compactdefaultargs") SetLambda2;
		%feature("autodoc", "No available documentation.

Parameters
----------
LAM2: float

Returns
-------
None
") SetLambda2;
		void SetLambda2(const Standard_Real LAM2);

		/****************** SetUV1 ******************/
		/**** md5 signature: 5d9c58a5127c203b26492da15a66e750 ****/
		%feature("compactdefaultargs") SetUV1;
		%feature("autodoc", "No available documentation.

Parameters
----------
UU1: float
VV1: float

Returns
-------
None
") SetUV1;
		void SetUV1(const Standard_Real UU1, const Standard_Real VV1);

		/****************** SetUV2 ******************/
		/**** md5 signature: eb7a24497d6e1d8b85b2aa46436478ee ****/
		%feature("compactdefaultargs") SetUV2;
		%feature("autodoc", "No available documentation.

Parameters
----------
UU2: float
VV2: float

Returns
-------
None
") SetUV2;
		void SetUV2(const Standard_Real UU2, const Standard_Real VV2);

		/****************** SetXYZ ******************/
		/**** md5 signature: 759f91004ddd84489a1bb3ed01aaa8d3 ****/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "No available documentation.

Parameters
----------
XX: float
YY: float
ZZ: float

Returns
-------
None
") SetXYZ;
		void SetXYZ(const Standard_Real XX, const Standard_Real YY, const Standard_Real ZZ);

		/****************** T1 ******************/
		/**** md5 signature: cc0e68757e11b26f4fa9b446ac2bc56d ****/
		%feature("compactdefaultargs") T1;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") T1;
		Standard_Integer T1();

		/****************** T2 ******************/
		/**** md5 signature: 77699ddd71989ac62490c57824df0b16 ****/
		%feature("compactdefaultargs") T2;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") T2;
		Standard_Integer T2();

		/****************** U1 ******************/
		/**** md5 signature: dc11e0157513dfb2ced295d3b3c19ebf ****/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U1;
		Standard_Real U1();

		/****************** U2 ******************/
		/**** md5 signature: 4730f1ce213775f0185223b0deaa41a3 ****/
		%feature("compactdefaultargs") U2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U2;
		Standard_Real U2();

		/****************** V1 ******************/
		/**** md5 signature: 4690fe5b6fc46d61802a6f0d508c99e5 ****/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V1;
		Standard_Real V1();

		/****************** V2 ******************/
		/**** md5 signature: 17961d7c3a50f3016cdb7368fdec1877 ****/
		%feature("compactdefaultargs") V2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V2;
		Standard_Real V2();

		/****************** X ******************/
		/**** md5 signature: 2dbf42f7dc56303f104fb0fa585dc6e6 ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 7fd17991f11a9702e525c7070ce7cec6 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 87b89b9e016f37b0146cf52868684676 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Z;
		Standard_Real Z();

};


%extend IntPolyh_StartPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPolyh_Tools *
***********************/
class IntPolyh_Tools {
	public:
		/****************** ComputeDeflection ******************/
		/**** md5 signature: 10b204e084b5a0096f453c31fa80dfb1 ****/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes the deflection tolerance on the surface for the given sampling.

Parameters
----------
theSurf: Adaptor3d_HSurface
theUPars: TColStd_Array1OfReal
theVPars: TColStd_Array1OfReal

Returns
-------
float
") ComputeDeflection;
		static Standard_Real ComputeDeflection(const opencascade::handle<Adaptor3d_HSurface> & theSurf, const TColStd_Array1OfReal & theUPars, const TColStd_Array1OfReal & theVPars);

		/****************** FillArrayOfPointNormal ******************/
		/**** md5 signature: 34516749f675f2c90dfd624fa3345954 ****/
		%feature("compactdefaultargs") FillArrayOfPointNormal;
		%feature("autodoc", "Fills the array <thepoints> with the points (triangulation nodes) on the surface and normal directions of the surface in these points.

Parameters
----------
theSurf: Adaptor3d_HSurface
theUPars: TColStd_Array1OfReal
theVPars: TColStd_Array1OfReal
thePoints: IntPolyh_ArrayOfPointNormal

Returns
-------
None
") FillArrayOfPointNormal;
		static void FillArrayOfPointNormal(const opencascade::handle<Adaptor3d_HSurface> & theSurf, const TColStd_Array1OfReal & theUPars, const TColStd_Array1OfReal & theVPars, IntPolyh_ArrayOfPointNormal & thePoints);

		/****************** IsEnlargePossible ******************/
		/**** md5 signature: 440671813562fb10706e466fec369a98 ****/
		%feature("compactdefaultargs") IsEnlargePossible;
		%feature("autodoc", "Checks if the surface can be enlarged in u or v direction.

Parameters
----------
theSurf: Adaptor3d_HSurface

Returns
-------
theUEnlarge: bool
theVEnlarge: bool
") IsEnlargePossible;
		static void IsEnlargePossible(const opencascade::handle<Adaptor3d_HSurface> & theSurf, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** MakeSampling ******************/
		/**** md5 signature: a5db612cc5a535de56e16106b36c0dc4 ****/
		%feature("compactdefaultargs") MakeSampling;
		%feature("autodoc", "Makes the sampling of the given surface <thesurf> making the net of <thenbsu> x <thenbsv> sampling points. the flag <theenlargezone> controls the enlargement of the sampling zone on the surface. the parameters of the sampling points are stored into <theupars> and <thevpars> arrays.

Parameters
----------
theSurf: Adaptor3d_HSurface
theNbSU: int
theNbSV: int
theEnlargeZone: bool
theUPars: TColStd_Array1OfReal
theVPars: TColStd_Array1OfReal

Returns
-------
None
") MakeSampling;
		static void MakeSampling(const opencascade::handle<Adaptor3d_HSurface> & theSurf, const Standard_Integer theNbSU, const Standard_Integer theNbSV, const Standard_Boolean theEnlargeZone, TColStd_Array1OfReal & theUPars, TColStd_Array1OfReal & theVPars);

};


%extend IntPolyh_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntPolyh_Triangle *
**************************/
class IntPolyh_Triangle {
	public:
		/****************** IntPolyh_Triangle ******************/
		/**** md5 signature: 9a631a4c34468bd2d2f6e7ff36d74f04 ****/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "Constructor.

Returns
-------
None
") IntPolyh_Triangle;
		 IntPolyh_Triangle();

		/****************** IntPolyh_Triangle ******************/
		/**** md5 signature: d9dae26ef6c441c84cc9c185b45673cc ****/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "Constructor.

Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int

Returns
-------
None
") IntPolyh_Triangle;
		 IntPolyh_Triangle(const Standard_Integer thePoint1, const Standard_Integer thePoint2, const Standard_Integer thePoint3);

		/****************** BoundingBox ******************/
		/**** md5 signature: ee96b168b7ff96a0829f7b13933d22c1 ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns the bounding box of the triangle.

Parameters
----------
thePoints: IntPolyh_ArrayOfPoints

Returns
-------
Bnd_Box
") BoundingBox;
		const Bnd_Box & BoundingBox(const IntPolyh_ArrayOfPoints & thePoints);

		/****************** ComputeDeflection ******************/
		/**** md5 signature: 39d69f8f43a6bb0e49b5e2c0e12281f0 ****/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "Computes the deflection for the triangle.

Parameters
----------
theSurface: Adaptor3d_HSurface
thePoints: IntPolyh_ArrayOfPoints

Returns
-------
float
") ComputeDeflection;
		Standard_Real ComputeDeflection(const opencascade::handle<Adaptor3d_HSurface> & theSurface, const IntPolyh_ArrayOfPoints & thePoints);

		/****************** Deflection ******************/
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of the triangle.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Dump ******************/
		/**** md5 signature: 110c93028fb8130e272d294a2869a993 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps the contents of the triangle.

Parameters
----------
v: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer v);

		/****************** FirstEdge ******************/
		/**** md5 signature: 467a40aae538a09fbd07f57b1550a4dd ****/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "Returns the first edge.

Returns
-------
int
") FirstEdge;
		Standard_Integer FirstEdge();

		/****************** FirstEdgeOrientation ******************/
		/**** md5 signature: 63fec8812a634740f4958500172c7542 ****/
		%feature("compactdefaultargs") FirstEdgeOrientation;
		%feature("autodoc", "Returns the orientation of the first edge.

Returns
-------
int
") FirstEdgeOrientation;
		Standard_Integer FirstEdgeOrientation();

		/****************** FirstPoint ******************/
		/**** md5 signature: a96e582923b6d3c6eaa1f60febc5fe6c ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
int
") FirstPoint;
		Standard_Integer FirstPoint();

		/****************** GetEdgeNumber ******************/
		/**** md5 signature: 355e2c5eb6aae26e9646df9f52c7f8d4 ****/
		%feature("compactdefaultargs") GetEdgeNumber;
		%feature("autodoc", "Gets the edge number by the index.

Parameters
----------
theEdgeIndex: int

Returns
-------
int
") GetEdgeNumber;
		Standard_Integer GetEdgeNumber(const Standard_Integer theEdgeIndex);

		/****************** GetEdgeOrientation ******************/
		/**** md5 signature: e31739be22099a0824cdcfef23383bae ****/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "Gets the edges orientation by the index.

Parameters
----------
theEdgeIndex: int

Returns
-------
int
") GetEdgeOrientation;
		Standard_Integer GetEdgeOrientation(const Standard_Integer theEdgeIndex);

		/****************** GetNextTriangle ******************/
		/**** md5 signature: fa495ec0085898ceb9cde6d6b7a03726 ****/
		%feature("compactdefaultargs") GetNextTriangle;
		%feature("autodoc", "Gets the adjacent triangle.

Parameters
----------
theTriangle: int
theEdgeNum: int
TEdges: IntPolyh_ArrayOfEdges

Returns
-------
int
") GetNextTriangle;
		Standard_Integer GetNextTriangle(const Standard_Integer theTriangle, const Standard_Integer theEdgeNum, const IntPolyh_ArrayOfEdges & TEdges);

		/****************** HasIntersection ******************/
		/**** md5 signature: 55f070fe51c559b5db20d742c7f46730 ****/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "Returns true if the triangle has interfered the other triangle.

Returns
-------
bool
") HasIntersection;
		Standard_Boolean HasIntersection();

		/****************** IsDegenerated ******************/
		/**** md5 signature: 8ad6b1a35fb6f8c9d08e99a7c18cd60e ****/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Returns the degenerated flag.

Returns
-------
bool
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****************** IsIntersectionPossible ******************/
		/**** md5 signature: e808bda296bf9e48992461ce72fb0cd8 ****/
		%feature("compactdefaultargs") IsIntersectionPossible;
		%feature("autodoc", "Returns possibility of the intersection.

Returns
-------
bool
") IsIntersectionPossible;
		Standard_Boolean IsIntersectionPossible();

		/****************** LinkEdges2Triangle ******************/
		/**** md5 signature: b549ca2d62ffa16c5479e204bb5a97cb ****/
		%feature("compactdefaultargs") LinkEdges2Triangle;
		%feature("autodoc", "Links edges to triangle.

Parameters
----------
TEdges: IntPolyh_ArrayOfEdges
theEdge1: int
theEdge2: int
theEdge3: int

Returns
-------
None
") LinkEdges2Triangle;
		void LinkEdges2Triangle(const IntPolyh_ArrayOfEdges & TEdges, const Standard_Integer theEdge1, const Standard_Integer theEdge2, const Standard_Integer theEdge3);

		/****************** MiddleRefinement ******************/
		/**** md5 signature: 04f14607f9b83383d5d87e61fdfe7ae6 ****/
		%feature("compactdefaultargs") MiddleRefinement;
		%feature("autodoc", "Splits the triangle on two to decrease its deflection.

Parameters
----------
theTriangleNumber: int
theSurface: Adaptor3d_HSurface
TPoints: IntPolyh_ArrayOfPoints
TTriangles: IntPolyh_ArrayOfTriangles
TEdges: IntPolyh_ArrayOfEdges

Returns
-------
None
") MiddleRefinement;
		void MiddleRefinement(const Standard_Integer theTriangleNumber, const opencascade::handle<Adaptor3d_HSurface> & theSurface, IntPolyh_ArrayOfPoints & TPoints, IntPolyh_ArrayOfTriangles & TTriangles, IntPolyh_ArrayOfEdges & TEdges);

		/****************** MultipleMiddleRefinement ******************/
		/**** md5 signature: 881b3b985aa940def7a3c568440ff6a8 ****/
		%feature("compactdefaultargs") MultipleMiddleRefinement;
		%feature("autodoc", "Splits the current triangle and new triangles until the refinement criterion is not achieved.

Parameters
----------
theRefineCriterion: float
theBox: Bnd_Box
theTriangleNumber: int
theSurface: Adaptor3d_HSurface
TPoints: IntPolyh_ArrayOfPoints
TTriangles: IntPolyh_ArrayOfTriangles
TEdges: IntPolyh_ArrayOfEdges

Returns
-------
None
") MultipleMiddleRefinement;
		void MultipleMiddleRefinement(const Standard_Real theRefineCriterion, const Bnd_Box & theBox, const Standard_Integer theTriangleNumber, const opencascade::handle<Adaptor3d_HSurface> & theSurface, IntPolyh_ArrayOfPoints & TPoints, IntPolyh_ArrayOfTriangles & TTriangles, IntPolyh_ArrayOfEdges & TEdges);

		/****************** SecondEdge ******************/
		/**** md5 signature: 472cb748b92b2789c125a4969bbacbcb ****/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "Returns the second edge.

Returns
-------
int
") SecondEdge;
		Standard_Integer SecondEdge();

		/****************** SecondEdgeOrientation ******************/
		/**** md5 signature: 43d5c8f7035ede7da0c5cb45f25ab3a8 ****/
		%feature("compactdefaultargs") SecondEdgeOrientation;
		%feature("autodoc", "Returns the orientation of the second edge.

Returns
-------
int
") SecondEdgeOrientation;
		Standard_Integer SecondEdgeOrientation();

		/****************** SecondPoint ******************/
		/**** md5 signature: 72a7379dccfa5bce46bd84d12acec99b ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Returns the second point.

Returns
-------
int
") SecondPoint;
		Standard_Integer SecondPoint();

		/****************** SetDeflection ******************/
		/**** md5 signature: ef17e8202a75f8963ebbbf02897eb710 ****/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "Sets the deflection.

Parameters
----------
theDeflection: float

Returns
-------
None
") SetDeflection;
		void SetDeflection(const Standard_Real theDeflection);

		/****************** SetDegenerated ******************/
		/**** md5 signature: 2eb13d0635ab2d27abe48b356f7b8c57 ****/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "Sets the degenerated flag.

Parameters
----------
theDegFlag: bool

Returns
-------
None
") SetDegenerated;
		void SetDegenerated(const Standard_Boolean theDegFlag);

		/****************** SetEdge ******************/
		/**** md5 signature: 45ce46febddd0f70ff8fba70c2effdec ****/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "Sets the edge by the index.

Parameters
----------
theEdgeIndex: int
theEdgeNumber: int

Returns
-------
None
") SetEdge;
		void SetEdge(const Standard_Integer theEdgeIndex, const Standard_Integer theEdgeNumber);

		/****************** SetEdgeAndOrientation ******************/
		/**** md5 signature: 4d9bcdfacea3a906672df30a22db3ec2 ****/
		%feature("compactdefaultargs") SetEdgeAndOrientation;
		%feature("autodoc", "Sets the appropriate edge and orientation for the triangle.

Parameters
----------
theEdge: IntPolyh_Edge
theEdgeIndex: int

Returns
-------
None
") SetEdgeAndOrientation;
		void SetEdgeAndOrientation(const IntPolyh_Edge & theEdge, const Standard_Integer theEdgeIndex);

		/****************** SetEdgeOrientation ******************/
		/**** md5 signature: 4c46548c23a84d5c7b7bc033268a1c59 ****/
		%feature("compactdefaultargs") SetEdgeOrientation;
		%feature("autodoc", "Sets the edges orientation by the index.

Parameters
----------
theEdgeIndex: int
theEdgeOrientation: int

Returns
-------
None
") SetEdgeOrientation;
		void SetEdgeOrientation(const Standard_Integer theEdgeIndex, const Standard_Integer theEdgeOrientation);

		/****************** SetFirstEdge ******************/
		/**** md5 signature: cd8ab5fc84b382c8f9341ff5a1bee0e4 ****/
		%feature("compactdefaultargs") SetFirstEdge;
		%feature("autodoc", "Sets the first edge.

Parameters
----------
theEdge: int
theEdgeOrientation: int

Returns
-------
None
") SetFirstEdge;
		void SetFirstEdge(const Standard_Integer theEdge, const Standard_Integer theEdgeOrientation);

		/****************** SetFirstPoint ******************/
		/**** md5 signature: 083b09fcfbdd1fc3d0e79515942eca68 ****/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "Sets the first point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer thePoint);

		/****************** SetIntersection ******************/
		/**** md5 signature: bf4a98cca40c72ad9a676c94ac89833b ****/
		%feature("compactdefaultargs") SetIntersection;
		%feature("autodoc", "Sets the flag of intersection.

Parameters
----------
theInt: bool

Returns
-------
None
") SetIntersection;
		void SetIntersection(const Standard_Boolean theInt);

		/****************** SetIntersectionPossible ******************/
		/**** md5 signature: 52ac32c4e613c89aa8c493d9d9a93c96 ****/
		%feature("compactdefaultargs") SetIntersectionPossible;
		%feature("autodoc", "Sets the flag of possibility of intersection.

Parameters
----------
theIP: bool

Returns
-------
None
") SetIntersectionPossible;
		void SetIntersectionPossible(const Standard_Boolean theIP);

		/****************** SetSecondEdge ******************/
		/**** md5 signature: 8236634aa32ab6ce341587949769d1b0 ****/
		%feature("compactdefaultargs") SetSecondEdge;
		%feature("autodoc", "Sets the second edge.

Parameters
----------
theEdge: int
theEdgeOrientation: int

Returns
-------
None
") SetSecondEdge;
		void SetSecondEdge(const Standard_Integer theEdge, const Standard_Integer theEdgeOrientation);

		/****************** SetSecondPoint ******************/
		/**** md5 signature: 30ecd94c48d0a5d89ca894a21ecac9ff ****/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "Sets the second point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetSecondPoint;
		void SetSecondPoint(const Standard_Integer thePoint);

		/****************** SetThirdEdge ******************/
		/**** md5 signature: e08225cdcb1da5834aba548228715747 ****/
		%feature("compactdefaultargs") SetThirdEdge;
		%feature("autodoc", "Sets the third edge.

Parameters
----------
theEdge: int
theEdgeOrientation: int

Returns
-------
None
") SetThirdEdge;
		void SetThirdEdge(const Standard_Integer theEdge, const Standard_Integer theEdgeOrientation);

		/****************** SetThirdPoint ******************/
		/**** md5 signature: 5f93dfa17668654844e49e0d36fe169e ****/
		%feature("compactdefaultargs") SetThirdPoint;
		%feature("autodoc", "Sets the third point.

Parameters
----------
thePoint: int

Returns
-------
None
") SetThirdPoint;
		void SetThirdPoint(const Standard_Integer thePoint);

		/****************** ThirdEdge ******************/
		/**** md5 signature: e84977332005f00d178ee7a969c85308 ****/
		%feature("compactdefaultargs") ThirdEdge;
		%feature("autodoc", "Returns the third edge.

Returns
-------
int
") ThirdEdge;
		Standard_Integer ThirdEdge();

		/****************** ThirdEdgeOrientation ******************/
		/**** md5 signature: 247f29dd6cec81c6ffac8dbbb396edcb ****/
		%feature("compactdefaultargs") ThirdEdgeOrientation;
		%feature("autodoc", "Returns the orientation of the third edge.

Returns
-------
int
") ThirdEdgeOrientation;
		Standard_Integer ThirdEdgeOrientation();

		/****************** ThirdPoint ******************/
		/**** md5 signature: 5764723d339a8e1924bb9059befea79f ****/
		%feature("compactdefaultargs") ThirdPoint;
		%feature("autodoc", "Returns the third point.

Returns
-------
int
") ThirdPoint;
		Standard_Integer ThirdPoint();

};


%extend IntPolyh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetNextChainTriangle(self):
		pass
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntPolyh_Array:
	pass

@classnotwrapped
class IntPolyh_MaillageAffinage:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
