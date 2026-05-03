/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intpolyh.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IntPolyh_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
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
%import Bnd.i

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
/* end handles declaration */

/* templates */
%template(IntPolyh_ListIteratorOfListOfCouples) NCollection_TListIterator<IntPolyh_Couple>;
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
typedef NCollection_List<IntPolyh_Couple>::Iterator IntPolyh_ListIteratorOfListOfCouples;
typedef NCollection_List<IntPolyh_Couple> IntPolyh_ListOfCouples;
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
		/****** IntPolyh_Couple::IntPolyh_Couple ******/
		/****** md5 signature: 4905c4bc961aef0240459f6c6c349da3 ******/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Couple;
		 IntPolyh_Couple();

		/****** IntPolyh_Couple::IntPolyh_Couple ******/
		/****** md5 signature: ea56ddc32f07acb1f4dd7ba4ea23df31 ******/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "
Parameters
----------
theTriangle1: int
theTriangle2: int
theAngle: double (optional, default to -2.0)

Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Couple;
		 IntPolyh_Couple(const int theTriangle1, const int theTriangle2, const double theAngle = -2.0);

		/****** IntPolyh_Couple::Angle ******/
		/****** md5 signature: 38aa389a84e64daaf9f12a8184465316 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the angle.
") Angle;
		double Angle();

		/****** IntPolyh_Couple::Dump ******/
		/****** md5 signature: 37de731f10fd777be98163f336102f62 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
v: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const int v);

		/****** IntPolyh_Couple::FirstValue ******/
		/****** md5 signature: ec857332c6a1803690dc248985ebfd47 ******/
		%feature("compactdefaultargs") FirstValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the first index.
") FirstValue;
		int FirstValue();

		/****** IntPolyh_Couple::IsAnalyzed ******/
		/****** md5 signature: a951213edccd0dac9296625b197b29cf ******/
		%feature("compactdefaultargs") IsAnalyzed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the couple has been analyzed.
") IsAnalyzed;
		bool IsAnalyzed();

		/****** IntPolyh_Couple::IsEqual ******/
		/****** md5 signature: 2928127feda0b89e4ca16177a98fcb94 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: IntPolyh_Couple

Return
-------
bool

Description
-----------
Returns true if the Couple is equal to <theOther>.
") IsEqual;
		bool IsEqual(const IntPolyh_Couple & theOther);

		/****** IntPolyh_Couple::SecondValue ******/
		/****** md5 signature: 7a90dcb1b6f65b9d5c11cf233179d58a ******/
		%feature("compactdefaultargs") SecondValue;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the second index.
") SecondValue;
		int SecondValue();

		/****** IntPolyh_Couple::SetAnalyzed ******/
		/****** md5 signature: c06d62660201ced92e2a3d32fc3fc7e0 ******/
		%feature("compactdefaultargs") SetAnalyzed;
		%feature("autodoc", "
Parameters
----------
theAnalyzed: bool

Return
-------
None

Description
-----------
Sets the analyzed flag.
") SetAnalyzed;
		void SetAnalyzed(const bool theAnalyzed);

		/****** IntPolyh_Couple::SetAngle ******/
		/****** md5 signature: e785312fe18bcd9a7632ff8b78ce5a0f ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: double

Return
-------
None

Description
-----------
Sets the angle.
") SetAngle;
		void SetAngle(const double theAngle);

		/****** IntPolyh_Couple::SetCoupleValue ******/
		/****** md5 signature: 295d23f89abf5a4b1162e275fbb86cd3 ******/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "
Parameters
----------
theInd1: int
theInd2: int

Return
-------
None

Description
-----------
Sets the triangles.
") SetCoupleValue;
		void SetCoupleValue(const int theInd1, const int theInd2);


%extend{
    bool __eq_wrapper__(const IntPolyh_Couple other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};


%extend IntPolyh_Couple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntPolyh_Edge *
**********************/
class IntPolyh_Edge {
	public:
		/****** IntPolyh_Edge::IntPolyh_Edge ******/
		/****** md5 signature: 5075b69dd8ac9ff9cb3f7c222b7adb4e ******/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Edge;
		 IntPolyh_Edge();

		/****** IntPolyh_Edge::IntPolyh_Edge ******/
		/****** md5 signature: bdf3ffdbfeb098ab2f7f69df2ae914b0 ******/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "
Parameters
----------
thePoint1: int
thePoint2: int
theTriangle1: int
theTriangle2: int

Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Edge;
		 IntPolyh_Edge(const int thePoint1, const int thePoint2, const int theTriangle1, const int theTriangle2);

		/****** IntPolyh_Edge::Dump ******/
		/****** md5 signature: 37de731f10fd777be98163f336102f62 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
v: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const int v);

		/****** IntPolyh_Edge::FirstPoint ******/
		/****** md5 signature: c05fb4442ea1c5a200b564a266eabd5b ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the first point.
") FirstPoint;
		int FirstPoint();

		/****** IntPolyh_Edge::FirstTriangle ******/
		/****** md5 signature: 9c782e397ec22aabb102208c26a8f271 ******/
		%feature("compactdefaultargs") FirstTriangle;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the first triangle.
") FirstTriangle;
		int FirstTriangle();

		/****** IntPolyh_Edge::SecondPoint ******/
		/****** md5 signature: 11a332f59a7deffa9e04bd13881209ec ******/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the second point.
") SecondPoint;
		int SecondPoint();

		/****** IntPolyh_Edge::SecondTriangle ******/
		/****** md5 signature: 3adbf9f8827ad0d12729d3ea917da2a3 ******/
		%feature("compactdefaultargs") SecondTriangle;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the second triangle.
") SecondTriangle;
		int SecondTriangle();

		/****** IntPolyh_Edge::SetFirstPoint ******/
		/****** md5 signature: bc0831d73df54adbbd961a44ca93e579 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: int

Return
-------
None

Description
-----------
Sets the first point.
") SetFirstPoint;
		void SetFirstPoint(const int thePoint);

		/****** IntPolyh_Edge::SetFirstTriangle ******/
		/****** md5 signature: 11675d2890fab55ccb0f5306c0adbcbc ******/
		%feature("compactdefaultargs") SetFirstTriangle;
		%feature("autodoc", "
Parameters
----------
theTriangle: int

Return
-------
None

Description
-----------
Sets the first triangle.
") SetFirstTriangle;
		void SetFirstTriangle(const int theTriangle);

		/****** IntPolyh_Edge::SetSecondPoint ******/
		/****** md5 signature: f1574fbbf6ff0e19c176e5ee3dbc9552 ******/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: int

Return
-------
None

Description
-----------
Sets the second point.
") SetSecondPoint;
		void SetSecondPoint(const int thePoint);

		/****** IntPolyh_Edge::SetSecondTriangle ******/
		/****** md5 signature: 5538e041104cff111f08514508d4e8d9 ******/
		%feature("compactdefaultargs") SetSecondTriangle;
		%feature("autodoc", "
Parameters
----------
theTriangle: int

Return
-------
None

Description
-----------
Sets the second triangle.
") SetSecondTriangle;
		void SetSecondTriangle(const int theTriangle);

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
		/****** IntPolyh_Intersection::IntPolyh_Intersection ******/
		/****** md5 signature: d8f94c58cfea4bdf03f2258e8edaf528 ******/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface

Return
-------
None

Description
-----------
Constructor for intersection of two surfaces with default parameters. Performs intersection.
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2);

		/****** IntPolyh_Intersection::IntPolyh_Intersection ******/
		/****** md5 signature: ee2bfabf21051fb4f9562bcd195ca12c ******/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theNbSU1: int
theNbSV1: int
theS2: Adaptor3d_Surface
theNbSU2: int
theNbSV2: int

Return
-------
None

Description
-----------
Constructor for intersection of two surfaces with the given size of the sampling nets: - <theNbSU1> x <theNbSV1> - for the first surface <theS1>; - <theNbSU2> x <theNbSV2> - for the second surface <theS2>. Performs intersection.
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_Surface> & theS1, const int theNbSU1, const int theNbSV1, const opencascade::handle<Adaptor3d_Surface> & theS2, const int theNbSU2, const int theNbSV2);

		/****** IntPolyh_Intersection::IntPolyh_Intersection ******/
		/****** md5 signature: ad00e307fb7217288d9b2ca8a57eb74a ******/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theUPars1: NCollection_Array1<double>
theVPars1: NCollection_Array1<double>
theS2: Adaptor3d_Surface
theUPars2: NCollection_Array1<double>
theVPars2: NCollection_Array1<double>

Return
-------
None

Description
-----------
Constructor for intersection of two surfaces with the precomputed sampling. Performs intersection.
") IntPolyh_Intersection;
		 IntPolyh_Intersection(const opencascade::handle<Adaptor3d_Surface> & theS1, const NCollection_Array1<double> & theUPars1, const NCollection_Array1<double> & theVPars1, const opencascade::handle<Adaptor3d_Surface> & theS2, const NCollection_Array1<double> & theUPars2, const NCollection_Array1<double> & theVPars2);

		/****** IntPolyh_Intersection::GetLinePoint ******/
		/****** md5 signature: 267a43dfbc3a6a887e0345e3c00e0c51 ******/
		%feature("compactdefaultargs") GetLinePoint;
		%feature("autodoc", "
Parameters
----------
IndexLine: int
IndexPoint: int

Return
-------
x: double
y: double
z: double
u1: double
v1: double
u2: double
v2: double
incidence: double

Description
-----------
Gets the parameters of the point in section line.
") GetLinePoint;
		void GetLinePoint(const int IndexLine, const int IndexPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPolyh_Intersection::GetTangentZonePoint ******/
		/****** md5 signature: ea942a42d14ac186111136a7af89bbff ******/
		%feature("compactdefaultargs") GetTangentZonePoint;
		%feature("autodoc", "
Parameters
----------
IndexLine: int
IndexPoint: int

Return
-------
x: double
y: double
z: double
u1: double
v1: double
u2: double
v2: double

Description
-----------
Gets the parameters of the point in tangent zone.
") GetTangentZonePoint;
		void GetTangentZonePoint(const int IndexLine, const int IndexPoint, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPolyh_Intersection::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns state of the operation.
") IsDone;
		bool IsDone();

		/****** IntPolyh_Intersection::IsParallel ******/
		/****** md5 signature: 7046a6b3b457e744360b84ad9c060428 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns state of the operation.
") IsParallel;
		bool IsParallel();

		/****** IntPolyh_Intersection::NbPointsInLine ******/
		/****** md5 signature: 8f2101837d5e8226719ffa7f6faa2aeb ******/
		%feature("compactdefaultargs") NbPointsInLine;
		%feature("autodoc", "
Parameters
----------
IndexLine: int

Return
-------
int

Description
-----------
Returns the number of points in the given line.
") NbPointsInLine;
		int NbPointsInLine(const int IndexLine);

		/****** IntPolyh_Intersection::NbPointsInTangentZone ******/
		/****** md5 signature: d4afcb5d806f7d1d502fc9678d0797cf ******/
		%feature("compactdefaultargs") NbPointsInTangentZone;
		%feature("autodoc", "
Parameters
----------
: int

Return
-------
int

Description
-----------
Returns number of points in tangent zone.
") NbPointsInTangentZone;
		int NbPointsInTangentZone(const int );

		/****** IntPolyh_Intersection::NbSectionLines ******/
		/****** md5 signature: 9c5cf9d6d40603c6e7c04e7a5e468bce ******/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of section lines.
") NbSectionLines;
		int NbSectionLines();

		/****** IntPolyh_Intersection::NbTangentZones ******/
		/****** md5 signature: f9a15d4bbad300c3dfb77d73287d82e2 ******/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTangentZones;
		int NbTangentZones();

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
		/****** IntPolyh_Point::IntPolyh_Point ******/
		/****** md5 signature: c8496207698f85ff16b4fb6e16ae4771 ******/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Point;
		 IntPolyh_Point();

		/****** IntPolyh_Point::IntPolyh_Point ******/
		/****** md5 signature: b83e24b39deac85ce5ce63008911a81b ******/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "
Parameters
----------
x: double
y: double
z: double
u: double
v: double

Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Point;
		 IntPolyh_Point(const double x, const double y, const double z, const double u, const double v);

		/****** IntPolyh_Point::Add ******/
		/****** md5 signature: 5e4cb7b51f6648df0782f9601e2b2f67 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P1: IntPolyh_Point

Return
-------
IntPolyh_Point

Description
-----------
Addition.
") Add;
		IntPolyh_Point Add(const IntPolyh_Point & P1);

		/****** IntPolyh_Point::Cross ******/
		/****** md5 signature: f15f478e400dd87650d551d688bde9eb ******/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
P1: IntPolyh_Point
P2: IntPolyh_Point

Return
-------
None

Description
-----------
Cross.
") Cross;
		void Cross(const IntPolyh_Point & P1, const IntPolyh_Point & P2);

		/****** IntPolyh_Point::Degenerated ******/
		/****** md5 signature: f255cc3db46328e92cfeeb338b9791be ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the degenerated flag.
") Degenerated;
		bool Degenerated();

		/****** IntPolyh_Point::Divide ******/
		/****** md5 signature: 8bbdbc1d401fe656c208aa92821dd68b ******/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
rr: double

Return
-------
IntPolyh_Point

Description
-----------
Division.
") Divide;
		IntPolyh_Point Divide(const double rr);

		/****** IntPolyh_Point::Dot ******/
		/****** md5 signature: e382793f07fbf672a31ebf6e271a6401 ******/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
P2: IntPolyh_Point

Return
-------
double

Description
-----------
Dot.
") Dot;
		double Dot(const IntPolyh_Point & P2);

		/****** IntPolyh_Point::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump.
") Dump;
		void Dump();

		/****** IntPolyh_Point::Dump ******/
		/****** md5 signature: 8d857d8e4767f88f6dae5d702f3ee6b5 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
None

Description
-----------
Dump.
") Dump;
		void Dump(const int i);

		/****** IntPolyh_Point::Middle ******/
		/****** md5 signature: d69a1e6fd4244709afb4adc77b42cd7b ******/
		%feature("compactdefaultargs") Middle;
		%feature("autodoc", "
Parameters
----------
MySurface: Adaptor3d_Surface
P1: IntPolyh_Point
P2: IntPolyh_Point

Return
-------
None

Description
-----------
Creates middle point from P1 and P2 and stores it to this.
") Middle;
		void Middle(const opencascade::handle<Adaptor3d_Surface> & MySurface, const IntPolyh_Point & P1, const IntPolyh_Point & P2);

		/****** IntPolyh_Point::Multiplication ******/
		/****** md5 signature: 0358b0adddcf15dafa34c81f1fbd1425 ******/
		%feature("compactdefaultargs") Multiplication;
		%feature("autodoc", "
Parameters
----------
rr: double

Return
-------
IntPolyh_Point

Description
-----------
Multiplication.
") Multiplication;
		IntPolyh_Point Multiplication(const double rr);

		/****** IntPolyh_Point::PartOfCommon ******/
		/****** md5 signature: 023fa879f5b6e76fd2fabfb2cac21b74 ******/
		%feature("compactdefaultargs") PartOfCommon;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the point is not common with the other surface.
") PartOfCommon;
		int PartOfCommon();

		/****** IntPolyh_Point::Set ******/
		/****** md5 signature: 1632a75390354424aac5c27b5bdb5095 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
x: double
y: double
z: double
u: double
v: double
II: int (optional, default to 1)

Return
-------
None

Description
-----------
Sets the point.
") Set;
		void Set(const double x, const double y, const double z, const double u, const double v, const int II = 1);

		/****** IntPolyh_Point::SetDegenerated ******/
		/****** md5 signature: a4481353a47c8c98e3addcf823c55bf2 ******/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Sets the degenerated flag.
") SetDegenerated;
		void SetDegenerated(const bool theFlag);

		/****** IntPolyh_Point::SetPartOfCommon ******/
		/****** md5 signature: 482f46168f115162447011a93d9cb51c ******/
		%feature("compactdefaultargs") SetPartOfCommon;
		%feature("autodoc", "
Parameters
----------
ii: int

Return
-------
None

Description
-----------
Sets the part of common.
") SetPartOfCommon;
		void SetPartOfCommon(const int ii);

		/****** IntPolyh_Point::SetU ******/
		/****** md5 signature: 616497531765ed61c8bcda9a5c1776b5 ******/
		%feature("compactdefaultargs") SetU;
		%feature("autodoc", "
Parameters
----------
u: double

Return
-------
None

Description
-----------
Sets the U coordinate for the 2D point.
") SetU;
		void SetU(const double u);

		/****** IntPolyh_Point::SetV ******/
		/****** md5 signature: 32d75889ac1a53e2fe60f3b0f85b8285 ******/
		%feature("compactdefaultargs") SetV;
		%feature("autodoc", "
Parameters
----------
v: double

Return
-------
None

Description
-----------
Sets the V coordinate for the 2D point.
") SetV;
		void SetV(const double v);

		/****** IntPolyh_Point::SetX ******/
		/****** md5 signature: 1e98d646d0853ebee977ef3d603c2e8e ******/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
x: double

Return
-------
None

Description
-----------
Sets the X coordinate for the 3D point.
") SetX;
		void SetX(const double x);

		/****** IntPolyh_Point::SetY ******/
		/****** md5 signature: e61fa0064ea16cb5a90168f348233daf ******/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
y: double

Return
-------
None

Description
-----------
Sets the Y coordinate for the 3D point.
") SetY;
		void SetY(const double y);

		/****** IntPolyh_Point::SetZ ******/
		/****** md5 signature: a3234cc7fc086437dac1ffbb95f87d6d ******/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
z: double

Return
-------
None

Description
-----------
Sets the Z coordinate for the 3D point.
") SetZ;
		void SetZ(const double z);

		/****** IntPolyh_Point::SquareDistance ******/
		/****** md5 signature: bcd121dc2d12f6249dfeb308c843b225 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
P2: IntPolyh_Point

Return
-------
double

Description
-----------
Square distance to the other point.
") SquareDistance;
		double SquareDistance(const IntPolyh_Point & P2);

		/****** IntPolyh_Point::SquareModulus ******/
		/****** md5 signature: 809fdaf6a3c1ba38cd2512c7396981aa ******/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Square modulus.
") SquareModulus;
		double SquareModulus();

		/****** IntPolyh_Point::Sub ******/
		/****** md5 signature: bd76a5f8c74e94ab3162c2671a17bc4c ******/
		%feature("compactdefaultargs") Sub;
		%feature("autodoc", "
Parameters
----------
P1: IntPolyh_Point

Return
-------
IntPolyh_Point

Description
-----------
Subtraction.
") Sub;
		IntPolyh_Point Sub(const IntPolyh_Point & P1);

		/****** IntPolyh_Point::U ******/
		/****** md5 signature: d5ca450930df7bccdde5ad8e8b7351f8 ******/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the U coordinate of the 2D point.
") U;
		double U();

		/****** IntPolyh_Point::V ******/
		/****** md5 signature: f0c84ae562f4ed08f73c10a7ed78f7a6 ******/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the V coordinate of the 2D point.
") V;
		double V();

		/****** IntPolyh_Point::X ******/
		/****** md5 signature: efd6f1a2cc14bc043dd77138d400bbb4 ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns X coordinate of the 3D point.
") X;
		double X();

		/****** IntPolyh_Point::Y ******/
		/****** md5 signature: 160f13e9041e0052ec067eecd98ac130 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns Y coordinate of the 3D point.
") Y;
		double Y();

		/****** IntPolyh_Point::Z ******/
		/****** md5 signature: db34145c012a7388029856eca0ed69b7 ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Z coordinate of the 3D point.
") Z;
		double Z();

		/****** IntPolyh_Point::operator * ******/
		/****** md5 signature: 4a54505da3fc53a74bf14e25bbbd7442 ******/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
rr: double

Return
-------
IntPolyh_Point

Description
-----------
No available documentation.
") operator *;
		IntPolyh_Point operator *(const double rr);

		/****** IntPolyh_Point::operator + ******/
		/****** md5 signature: 841cff434eca6d0d0659001a7df30cf5 ******/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
P1: IntPolyh_Point

Return
-------
IntPolyh_Point

Description
-----------
No available documentation.
") operator +;
		IntPolyh_Point operator +(const IntPolyh_Point & P1);

		/****** IntPolyh_Point::operator - ******/
		/****** md5 signature: 08ecd36ff809e04db98f500db739e4f5 ******/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
P1: IntPolyh_Point

Return
-------
IntPolyh_Point

Description
-----------
No available documentation.
") operator -;
		IntPolyh_Point operator -(const IntPolyh_Point & P1);

		/****** IntPolyh_Point::operator / ******/
		/****** md5 signature: f91d804ace034d2588763f89d32ce821 ******/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
rr: double

Return
-------
IntPolyh_Point

Description
-----------
No available documentation.
") operator /;
		IntPolyh_Point operator /(const double rr);

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
		/****** IntPolyh_SectionLine::IntPolyh_SectionLine ******/
		/****** md5 signature: 1c0a10a798fc36fa5207bf9b09cd3759 ******/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine();

		/****** IntPolyh_SectionLine::IntPolyh_SectionLine ******/
		/****** md5 signature: 6cedbdfaca1af40304884c872a4eafc3 ******/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "
Parameters
----------
nn: int

Return
-------
None

Description
-----------
No available documentation.
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine(const int nn);

		/****** IntPolyh_SectionLine::IntPolyh_SectionLine ******/
		/****** md5 signature: e7391118f138d629612227fec24a238d ******/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", "
Parameters
----------
theOther: IntPolyh_SectionLine

Return
-------
None

Description
-----------
No available documentation.
") IntPolyh_SectionLine;
		 IntPolyh_SectionLine(const IntPolyh_SectionLine & theOther);

		/****** IntPolyh_SectionLine::ChangeValue ******/
		/****** md5 signature: 66aab7400b4dd1bb3a76ac95ff3fe87d ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
nn: int

Return
-------
IntPolyh_StartPoint

Description
-----------
No available documentation.
") ChangeValue;
		IntPolyh_StartPoint & ChangeValue(const int nn);

		/****** IntPolyh_SectionLine::Copy ******/
		/****** md5 signature: b67c5399d470327d03c3fb0ba898503e ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
Other: IntPolyh_SectionLine

Return
-------
IntPolyh_SectionLine

Description
-----------
No available documentation.
") Copy;
		IntPolyh_SectionLine & Copy(const IntPolyh_SectionLine & Other);

		/****** IntPolyh_SectionLine::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** IntPolyh_SectionLine::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntPolyh_SectionLine::GetN ******/
		/****** md5 signature: fa5761010f983bb0937b81bd10b3381a ******/
		%feature("compactdefaultargs") GetN;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetN;
		int GetN();

		/****** IntPolyh_SectionLine::IncrementNbStartPoints ******/
		/****** md5 signature: 22d610daf3f0535b3b5755ba147b5daf ******/
		%feature("compactdefaultargs") IncrementNbStartPoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IncrementNbStartPoints;
		void IncrementNbStartPoints();

		/****** IntPolyh_SectionLine::Init ******/
		/****** md5 signature: a95a4dc844fa8ea2657a193f52158de3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
nn: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const int nn);

		/****** IntPolyh_SectionLine::NbStartPoints ******/
		/****** md5 signature: ce7cae8d6d3129f0fa93a1e70c20d55b ******/
		%feature("compactdefaultargs") NbStartPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbStartPoints;
		int NbStartPoints();

		/****** IntPolyh_SectionLine::Prepend ******/
		/****** md5 signature: af0ffcb4b68f31c5509f72fef525cce7 ******/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "
Parameters
----------
SP: IntPolyh_StartPoint

Return
-------
None

Description
-----------
No available documentation.
") Prepend;
		void Prepend(const IntPolyh_StartPoint & SP);

		/****** IntPolyh_SectionLine::Value ******/
		/****** md5 signature: b3f0888f1e28d2cb3cddec70842930fe ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
nn: int

Return
-------
IntPolyh_StartPoint

Description
-----------
No available documentation.
") Value;
		const IntPolyh_StartPoint & Value(const int nn);

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
		/****** IntPolyh_StartPoint::IntPolyh_StartPoint ******/
		/****** md5 signature: 27e2c4de499969621371ab2b47ca9f70 ******/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint();

		/****** IntPolyh_StartPoint::IntPolyh_StartPoint ******/
		/****** md5 signature: 7bc1d2fccd36531c3ed249bdba4a11ee ******/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", "
Parameters
----------
xx: double
yy: double
zz: double
uu1: double
vv1: double
uu2: double
vv2: double
T1: int
E1: int
LAM1: double
T2: int
E2: int
LAM2: double
List: int

Return
-------
None

Description
-----------
No available documentation.
") IntPolyh_StartPoint;
		 IntPolyh_StartPoint(const double xx, const double yy, const double zz, const double uu1, const double vv1, const double uu2, const double vv2, const int T1, const int E1, const double LAM1, const int T2, const int E2, const double LAM2, const int List);

		/****** IntPolyh_StartPoint::ChainList ******/
		/****** md5 signature: 43082a3b0bad5db8c6f6e99b02054e07 ******/
		%feature("compactdefaultargs") ChainList;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ChainList;
		int ChainList();

		/****** IntPolyh_StartPoint::CheckSameSP ******/
		/****** md5 signature: a0cf8fa4d64c537c124e88459889a21b ******/
		%feature("compactdefaultargs") CheckSameSP;
		%feature("autodoc", "
Parameters
----------
SP: IntPolyh_StartPoint

Return
-------
int

Description
-----------
No available documentation.
") CheckSameSP;
		int CheckSameSP(const IntPolyh_StartPoint & SP);

		/****** IntPolyh_StartPoint::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntPolyh_StartPoint::Dump ******/
		/****** md5 signature: 8d857d8e4767f88f6dae5d702f3ee6b5 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const int i);

		/****** IntPolyh_StartPoint::E1 ******/
		/****** md5 signature: b61578d3981ad29fe73f3dce39bdffea ******/
		%feature("compactdefaultargs") E1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") E1;
		int E1();

		/****** IntPolyh_StartPoint::E2 ******/
		/****** md5 signature: 22f27ffcb53d104c77f78942286e9bf6 ******/
		%feature("compactdefaultargs") E2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") E2;
		int E2();

		/****** IntPolyh_StartPoint::GetAngle ******/
		/****** md5 signature: 484efb81a36de43577575531adbfdc2c ******/
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") GetAngle;
		double GetAngle();

		/****** IntPolyh_StartPoint::GetEdgePoints ******/
		/****** md5 signature: 48347b1083029c2da7a647d5dbc7e0a6 ******/
		%feature("compactdefaultargs") GetEdgePoints;
		%feature("autodoc", "
Parameters
----------
Triangle: IntPolyh_Triangle

Return
-------
FirstEdgePoint: int
SecondEdgePoint: int
LastPoint: int

Description
-----------
No available documentation.
") GetEdgePoints;
		int GetEdgePoints(const IntPolyh_Triangle & Triangle, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPolyh_StartPoint::Lambda1 ******/
		/****** md5 signature: 98053f85100784254aba20bcd451f42e ******/
		%feature("compactdefaultargs") Lambda1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Lambda1;
		double Lambda1();

		/****** IntPolyh_StartPoint::Lambda2 ******/
		/****** md5 signature: f8730d2c7a89b6acfdaea81ec88deef4 ******/
		%feature("compactdefaultargs") Lambda2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Lambda2;
		double Lambda2();

		/****** IntPolyh_StartPoint::SetAngle ******/
		/****** md5 signature: 188a26155b6928954c9b00ccc9c73032 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
ang: double

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const double ang);

		/****** IntPolyh_StartPoint::SetChainList ******/
		/****** md5 signature: 3d869e961a8a8850264d3cc2887b3749 ******/
		%feature("compactdefaultargs") SetChainList;
		%feature("autodoc", "
Parameters
----------
ChList: int

Return
-------
None

Description
-----------
No available documentation.
") SetChainList;
		void SetChainList(const int ChList);

		/****** IntPolyh_StartPoint::SetCoupleValue ******/
		/****** md5 signature: 864575cb9503339d2b90cb5f5d8ee5e9 ******/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "
Parameters
----------
IT1: int
IT2: int

Return
-------
None

Description
-----------
No available documentation.
") SetCoupleValue;
		void SetCoupleValue(const int IT1, const int IT2);

		/****** IntPolyh_StartPoint::SetEdge1 ******/
		/****** md5 signature: e48926e210696f61104b00b9ec7729a0 ******/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "
Parameters
----------
IE1: int

Return
-------
None

Description
-----------
No available documentation.
") SetEdge1;
		void SetEdge1(const int IE1);

		/****** IntPolyh_StartPoint::SetEdge2 ******/
		/****** md5 signature: 1eb911bccda6ddff2bb25c752b978c16 ******/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "
Parameters
----------
IE2: int

Return
-------
None

Description
-----------
No available documentation.
") SetEdge2;
		void SetEdge2(const int IE2);

		/****** IntPolyh_StartPoint::SetLambda1 ******/
		/****** md5 signature: d6eccf4bbfa334c046af9b8f9ee6873e ******/
		%feature("compactdefaultargs") SetLambda1;
		%feature("autodoc", "
Parameters
----------
LAM1: double

Return
-------
None

Description
-----------
No available documentation.
") SetLambda1;
		void SetLambda1(const double LAM1);

		/****** IntPolyh_StartPoint::SetLambda2 ******/
		/****** md5 signature: 17ebdf632323765145d888e48192a225 ******/
		%feature("compactdefaultargs") SetLambda2;
		%feature("autodoc", "
Parameters
----------
LAM2: double

Return
-------
None

Description
-----------
No available documentation.
") SetLambda2;
		void SetLambda2(const double LAM2);

		/****** IntPolyh_StartPoint::SetUV1 ******/
		/****** md5 signature: 383a7e3cd7c2e9aad1cc7d6f49d8f6de ******/
		%feature("compactdefaultargs") SetUV1;
		%feature("autodoc", "
Parameters
----------
UU1: double
VV1: double

Return
-------
None

Description
-----------
No available documentation.
") SetUV1;
		void SetUV1(const double UU1, const double VV1);

		/****** IntPolyh_StartPoint::SetUV2 ******/
		/****** md5 signature: fdca431f4616b96f93dffcd909c09585 ******/
		%feature("compactdefaultargs") SetUV2;
		%feature("autodoc", "
Parameters
----------
UU2: double
VV2: double

Return
-------
None

Description
-----------
No available documentation.
") SetUV2;
		void SetUV2(const double UU2, const double VV2);

		/****** IntPolyh_StartPoint::SetXYZ ******/
		/****** md5 signature: 99b04007adc97c1ed485d3153e8bbba5 ******/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
XX: double
YY: double
ZZ: double

Return
-------
None

Description
-----------
No available documentation.
") SetXYZ;
		void SetXYZ(const double XX, const double YY, const double ZZ);

		/****** IntPolyh_StartPoint::T1 ******/
		/****** md5 signature: de3b22a22bd8a6278bc07bb11e05f1c5 ******/
		%feature("compactdefaultargs") T1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") T1;
		int T1();

		/****** IntPolyh_StartPoint::T2 ******/
		/****** md5 signature: 796411be4a086b02dd57f78bda56bfbe ******/
		%feature("compactdefaultargs") T2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") T2;
		int T2();

		/****** IntPolyh_StartPoint::U1 ******/
		/****** md5 signature: 070c473a14c10a26b7ab54c5fbc40e8d ******/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U1;
		double U1();

		/****** IntPolyh_StartPoint::U2 ******/
		/****** md5 signature: 4e15fb6b4b406d3553d770418e89a883 ******/
		%feature("compactdefaultargs") U2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U2;
		double U2();

		/****** IntPolyh_StartPoint::V1 ******/
		/****** md5 signature: c5f7a687b57e1de44b0be2372cc617fd ******/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V1;
		double V1();

		/****** IntPolyh_StartPoint::V2 ******/
		/****** md5 signature: 9adf93c07e3be00363edd1a79cb47c70 ******/
		%feature("compactdefaultargs") V2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V2;
		double V2();

		/****** IntPolyh_StartPoint::X ******/
		/****** md5 signature: d1cd5c739a5e638da850f6d4184da84c ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") X;
		double X();

		/****** IntPolyh_StartPoint::Y ******/
		/****** md5 signature: a8645c42b76f8d7a4895271f99de6d50 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Y;
		double Y();

		/****** IntPolyh_StartPoint::Z ******/
		/****** md5 signature: 0f93794bcb3e7aa1261f56c7c023b4aa ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Z;
		double Z();

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
		/****** IntPolyh_Tools::ComputeDeflection ******/
		/****** md5 signature: 668d119178becaeaf6929f8477b7a43e ******/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theUPars: NCollection_Array1<double>
theVPars: NCollection_Array1<double>

Return
-------
double

Description
-----------
Computes the deflection tolerance on the surface for the given sampling.
") ComputeDeflection;
		static double ComputeDeflection(const opencascade::handle<Adaptor3d_Surface> & theSurf, const NCollection_Array1<double> & theUPars, const NCollection_Array1<double> & theVPars);

		/****** IntPolyh_Tools::FillArrayOfPointNormal ******/
		/****** md5 signature: 2aceb5a42339a233bbafe0d8a4a3afa0 ******/
		%feature("compactdefaultargs") FillArrayOfPointNormal;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theUPars: NCollection_Array1<double>
theVPars: NCollection_Array1<double>
thePoints: IntPolyh_ArrayOfPointNormal

Return
-------
None

Description
-----------
Fills the array <thePoints> with the points (triangulation nodes) on the surface and normal directions of the surface in these points.
") FillArrayOfPointNormal;
		static void FillArrayOfPointNormal(const opencascade::handle<Adaptor3d_Surface> & theSurf, const NCollection_Array1<double> & theUPars, const NCollection_Array1<double> & theVPars, IntPolyh_ArrayOfPointNormal & thePoints);

		/****** IntPolyh_Tools::IsEnlargePossible ******/
		/****** md5 signature: 63a5e556d32de05e89f2a5edba6ab1ff ******/
		%feature("compactdefaultargs") IsEnlargePossible;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
theUEnlarge: bool
theVEnlarge: bool

Description
-----------
Checks if the surface can be enlarged in U or V direction.
") IsEnlargePossible;
		static void IsEnlargePossible(const opencascade::handle<Adaptor3d_Surface> & theSurf, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** IntPolyh_Tools::MakeSampling ******/
		/****** md5 signature: 09e82804c382b7aa9f0901d577411cb8 ******/
		%feature("compactdefaultargs") MakeSampling;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theNbSU: int
theNbSV: int
theEnlargeZone: bool
theUPars: NCollection_Array1<double>
theVPars: NCollection_Array1<double>

Return
-------
None

Description
-----------
Makes the sampling of the given surface <theSurf> making the net of <theNbSU> x <theNbSV> sampling points. The flag <theEnlargeZone> controls the enlargement of the sampling zone on the surface. The parameters of the sampling points are stored into <theUPars> and <theVPars> arrays.
") MakeSampling;
		static void MakeSampling(const opencascade::handle<Adaptor3d_Surface> & theSurf, const int theNbSU, const int theNbSV, const bool theEnlargeZone, NCollection_Array1<double> & theUPars, NCollection_Array1<double> & theVPars);

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
		/****** IntPolyh_Triangle::IntPolyh_Triangle ******/
		/****** md5 signature: 9a631a4c34468bd2d2f6e7ff36d74f04 ******/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Triangle;
		 IntPolyh_Triangle();

		/****** IntPolyh_Triangle::IntPolyh_Triangle ******/
		/****** md5 signature: 6f9cc2b36c29d774a5c6a1d3b5975b41 ******/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "
Parameters
----------
thePoint1: int
thePoint2: int
thePoint3: int

Return
-------
None

Description
-----------
Constructor.
") IntPolyh_Triangle;
		 IntPolyh_Triangle(const int thePoint1, const int thePoint2, const int thePoint3);

		/****** IntPolyh_Triangle::BoundingBox ******/
		/****** md5 signature: ee96b168b7ff96a0829f7b13933d22c1 ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "
Parameters
----------
thePoints: IntPolyh_ArrayOfPoints

Return
-------
Bnd_Box

Description
-----------
Returns the bounding box of the triangle.
") BoundingBox;
		const Bnd_Box & BoundingBox(const IntPolyh_ArrayOfPoints & thePoints);

		/****** IntPolyh_Triangle::ComputeDeflection ******/
		/****** md5 signature: c0ff9ca6d0c1b9b1e143226b22dc72a4 ******/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "
Parameters
----------
theSurface: Adaptor3d_Surface
thePoints: IntPolyh_ArrayOfPoints

Return
-------
double

Description
-----------
Computes the deflection for the triangle.
") ComputeDeflection;
		double ComputeDeflection(const opencascade::handle<Adaptor3d_Surface> & theSurface, const IntPolyh_ArrayOfPoints & thePoints);

		/****** IntPolyh_Triangle::Deflection ******/
		/****** md5 signature: e7bafce0869e6419d801f7a7f285ba00 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the deflection of the triangle.
") Deflection;
		double Deflection();

		/****** IntPolyh_Triangle::Dump ******/
		/****** md5 signature: 37de731f10fd777be98163f336102f62 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
v: int

Return
-------
None

Description
-----------
Dumps the contents of the triangle.
") Dump;
		void Dump(const int v);

		/****** IntPolyh_Triangle::FirstEdge ******/
		/****** md5 signature: 0e65b9ae7956cdc44fc9fea0d0248f6c ******/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the first edge.
") FirstEdge;
		int FirstEdge();

		/****** IntPolyh_Triangle::FirstEdgeOrientation ******/
		/****** md5 signature: 2eda76f126f50634816f8ecb3f85505f ******/
		%feature("compactdefaultargs") FirstEdgeOrientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the orientation of the first edge.
") FirstEdgeOrientation;
		int FirstEdgeOrientation();

		/****** IntPolyh_Triangle::FirstPoint ******/
		/****** md5 signature: c05fb4442ea1c5a200b564a266eabd5b ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the first point.
") FirstPoint;
		int FirstPoint();

		/****** IntPolyh_Triangle::GetEdgeNumber ******/
		/****** md5 signature: 6b37edd9d33e9da71605b7ff3de79bf6 ******/
		%feature("compactdefaultargs") GetEdgeNumber;
		%feature("autodoc", "
Parameters
----------
theEdgeIndex: int

Return
-------
int

Description
-----------
Gets the edge number by the index.
") GetEdgeNumber;
		int GetEdgeNumber(const int theEdgeIndex);

		/****** IntPolyh_Triangle::GetEdgeOrientation ******/
		/****** md5 signature: 64aa4191369046538f698ca9703bef8e ******/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "
Parameters
----------
theEdgeIndex: int

Return
-------
int

Description
-----------
Gets the edges orientation by the index.
") GetEdgeOrientation;
		int GetEdgeOrientation(const int theEdgeIndex);

		/****** IntPolyh_Triangle::GetNextTriangle ******/
		/****** md5 signature: e9c207876694b0acc3fdf0fbc548ccf2 ******/
		%feature("compactdefaultargs") GetNextTriangle;
		%feature("autodoc", "
Parameters
----------
theTriangle: int
theEdgeNum: int
TEdges: IntPolyh_ArrayOfEdges

Return
-------
int

Description
-----------
Gets the adjacent triangle.
") GetNextTriangle;
		int GetNextTriangle(const int theTriangle, const int theEdgeNum, const IntPolyh_ArrayOfEdges & TEdges);

		/****** IntPolyh_Triangle::HasIntersection ******/
		/****** md5 signature: 0056685440f56dba8f3b35f7970dc2c9 ******/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the triangle has interfered the other triangle.
") HasIntersection;
		bool HasIntersection();

		/****** IntPolyh_Triangle::IsDegenerated ******/
		/****** md5 signature: bc9cd84cecdefb39f2de514cde6b7d4d ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Degenerated flag.
") IsDegenerated;
		bool IsDegenerated();

		/****** IntPolyh_Triangle::IsIntersectionPossible ******/
		/****** md5 signature: 3b5c4078755ef0a3026cc54f74196b90 ******/
		%feature("compactdefaultargs") IsIntersectionPossible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns possibility of the intersection.
") IsIntersectionPossible;
		bool IsIntersectionPossible();

		/****** IntPolyh_Triangle::LinkEdges2Triangle ******/
		/****** md5 signature: 2596fab3f9f974da355e7c44b48adba7 ******/
		%feature("compactdefaultargs") LinkEdges2Triangle;
		%feature("autodoc", "
Parameters
----------
TEdges: IntPolyh_ArrayOfEdges
theEdge1: int
theEdge2: int
theEdge3: int

Return
-------
None

Description
-----------
Links edges to triangle.
") LinkEdges2Triangle;
		void LinkEdges2Triangle(const IntPolyh_ArrayOfEdges & TEdges, const int theEdge1, const int theEdge2, const int theEdge3);

		/****** IntPolyh_Triangle::MiddleRefinement ******/
		/****** md5 signature: 82a1541879591f4f46daf88b16c74e61 ******/
		%feature("compactdefaultargs") MiddleRefinement;
		%feature("autodoc", "
Parameters
----------
theTriangleNumber: int
theSurface: Adaptor3d_Surface
TPoints: IntPolyh_ArrayOfPoints
TTriangles: IntPolyh_ArrayOfTriangles
TEdges: IntPolyh_ArrayOfEdges

Return
-------
None

Description
-----------
Splits the triangle on two to decrease its deflection.
") MiddleRefinement;
		void MiddleRefinement(const int theTriangleNumber, const opencascade::handle<Adaptor3d_Surface> & theSurface, IntPolyh_ArrayOfPoints & TPoints, IntPolyh_ArrayOfTriangles & TTriangles, IntPolyh_ArrayOfEdges & TEdges);

		/****** IntPolyh_Triangle::MultipleMiddleRefinement ******/
		/****** md5 signature: 5787e264b9807aa6d3123843bf32317f ******/
		%feature("compactdefaultargs") MultipleMiddleRefinement;
		%feature("autodoc", "
Parameters
----------
theRefineCriterion: double
theBox: Bnd_Box
theTriangleNumber: int
theSurface: Adaptor3d_Surface
TPoints: IntPolyh_ArrayOfPoints
TTriangles: IntPolyh_ArrayOfTriangles
TEdges: IntPolyh_ArrayOfEdges

Return
-------
None

Description
-----------
Splits the current triangle and new triangles until the refinement criterion is not achieved.
") MultipleMiddleRefinement;
		void MultipleMiddleRefinement(const double theRefineCriterion, const Bnd_Box & theBox, const int theTriangleNumber, const opencascade::handle<Adaptor3d_Surface> & theSurface, IntPolyh_ArrayOfPoints & TPoints, IntPolyh_ArrayOfTriangles & TTriangles, IntPolyh_ArrayOfEdges & TEdges);

		/****** IntPolyh_Triangle::SecondEdge ******/
		/****** md5 signature: fc88dd47eb4e4bc3ffbde4d68d3f192d ******/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the second edge.
") SecondEdge;
		int SecondEdge();

		/****** IntPolyh_Triangle::SecondEdgeOrientation ******/
		/****** md5 signature: 58db592336eb3f4aa547fa52f507cce1 ******/
		%feature("compactdefaultargs") SecondEdgeOrientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the orientation of the second edge.
") SecondEdgeOrientation;
		int SecondEdgeOrientation();

		/****** IntPolyh_Triangle::SecondPoint ******/
		/****** md5 signature: 11a332f59a7deffa9e04bd13881209ec ******/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the second point.
") SecondPoint;
		int SecondPoint();

		/****** IntPolyh_Triangle::SetDeflection ******/
		/****** md5 signature: 4ffc3b2c2f617266ffb800b5de7b581b ******/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: double

Return
-------
None

Description
-----------
Sets the deflection.
") SetDeflection;
		void SetDeflection(const double theDeflection);

		/****** IntPolyh_Triangle::SetDegenerated ******/
		/****** md5 signature: 16e82b058066aff5f65c296031a377ea ******/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "
Parameters
----------
theDegFlag: bool

Return
-------
None

Description
-----------
Sets the degenerated flag.
") SetDegenerated;
		void SetDegenerated(const bool theDegFlag);

		/****** IntPolyh_Triangle::SetEdge ******/
		/****** md5 signature: 1a53eed7caa8d5cd8a3678f6e5369339 ******/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "
Parameters
----------
theEdgeIndex: int
theEdgeNumber: int

Return
-------
None

Description
-----------
Sets the edge by the index.
") SetEdge;
		void SetEdge(const int theEdgeIndex, const int theEdgeNumber);

		/****** IntPolyh_Triangle::SetEdgeAndOrientation ******/
		/****** md5 signature: 4fa8bf795008eb73887c4deca136331c ******/
		%feature("compactdefaultargs") SetEdgeAndOrientation;
		%feature("autodoc", "
Parameters
----------
theEdge: IntPolyh_Edge
theEdgeIndex: int

Return
-------
None

Description
-----------
Sets the appropriate edge and orientation for the triangle.
") SetEdgeAndOrientation;
		void SetEdgeAndOrientation(const IntPolyh_Edge & theEdge, const int theEdgeIndex);

		/****** IntPolyh_Triangle::SetEdgeOrientation ******/
		/****** md5 signature: 33bb439bef4f03748f3a31d513986f0a ******/
		%feature("compactdefaultargs") SetEdgeOrientation;
		%feature("autodoc", "
Parameters
----------
theEdgeIndex: int
theEdgeOrientation: int

Return
-------
None

Description
-----------
Sets the edges orientation by the index.
") SetEdgeOrientation;
		void SetEdgeOrientation(const int theEdgeIndex, const int theEdgeOrientation);

		/****** IntPolyh_Triangle::SetFirstEdge ******/
		/****** md5 signature: f056efafd900958275d3ae32f497e412 ******/
		%feature("compactdefaultargs") SetFirstEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int
theEdgeOrientation: int

Return
-------
None

Description
-----------
Sets the first edge.
") SetFirstEdge;
		void SetFirstEdge(const int theEdge, const int theEdgeOrientation);

		/****** IntPolyh_Triangle::SetFirstPoint ******/
		/****** md5 signature: bc0831d73df54adbbd961a44ca93e579 ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: int

Return
-------
None

Description
-----------
Sets the first point.
") SetFirstPoint;
		void SetFirstPoint(const int thePoint);

		/****** IntPolyh_Triangle::SetIntersection ******/
		/****** md5 signature: b737ca793412fe14eb9831eb0a482a33 ******/
		%feature("compactdefaultargs") SetIntersection;
		%feature("autodoc", "
Parameters
----------
theInt: bool

Return
-------
None

Description
-----------
Sets the flag of intersection.
") SetIntersection;
		void SetIntersection(const bool theInt);

		/****** IntPolyh_Triangle::SetIntersectionPossible ******/
		/****** md5 signature: c4c19d920b0225a9bd69b15963f3fd03 ******/
		%feature("compactdefaultargs") SetIntersectionPossible;
		%feature("autodoc", "
Parameters
----------
theIP: bool

Return
-------
None

Description
-----------
Sets the flag of possibility of intersection.
") SetIntersectionPossible;
		void SetIntersectionPossible(const bool theIP);

		/****** IntPolyh_Triangle::SetSecondEdge ******/
		/****** md5 signature: 896c5cad99207cc7e5f6c67925d20274 ******/
		%feature("compactdefaultargs") SetSecondEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int
theEdgeOrientation: int

Return
-------
None

Description
-----------
Sets the second edge.
") SetSecondEdge;
		void SetSecondEdge(const int theEdge, const int theEdgeOrientation);

		/****** IntPolyh_Triangle::SetSecondPoint ******/
		/****** md5 signature: f1574fbbf6ff0e19c176e5ee3dbc9552 ******/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: int

Return
-------
None

Description
-----------
Sets the second point.
") SetSecondPoint;
		void SetSecondPoint(const int thePoint);

		/****** IntPolyh_Triangle::SetThirdEdge ******/
		/****** md5 signature: 4ae36c6d7255edc8d1fadebedc9b2bde ******/
		%feature("compactdefaultargs") SetThirdEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int
theEdgeOrientation: int

Return
-------
None

Description
-----------
Sets the third edge.
") SetThirdEdge;
		void SetThirdEdge(const int theEdge, const int theEdgeOrientation);

		/****** IntPolyh_Triangle::SetThirdPoint ******/
		/****** md5 signature: b062e916ba45b47986e6018ad38236b9 ******/
		%feature("compactdefaultargs") SetThirdPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: int

Return
-------
None

Description
-----------
Sets the third point.
") SetThirdPoint;
		void SetThirdPoint(const int thePoint);

		/****** IntPolyh_Triangle::ThirdEdge ******/
		/****** md5 signature: 99e1abb2d9656121a48f99db0a409a1c ******/
		%feature("compactdefaultargs") ThirdEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the third edge.
") ThirdEdge;
		int ThirdEdge();

		/****** IntPolyh_Triangle::ThirdEdgeOrientation ******/
		/****** md5 signature: f352e8a8fd3eea796daa800b7fe7d400 ******/
		%feature("compactdefaultargs") ThirdEdgeOrientation;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the orientation of the third edge.
") ThirdEdgeOrientation;
		int ThirdEdgeOrientation();

		/****** IntPolyh_Triangle::ThirdPoint ******/
		/****** md5 signature: f4297accdeb8fa1f2d143134b531c3e6 ******/
		%feature("compactdefaultargs") ThirdPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the third point.
") ThirdPoint;
		int ThirdPoint();

};


%extend IntPolyh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetNextChainTriangle(self):
		pass
	}
};

/******************************
* class hash<IntPolyh_Couple> *
******************************/
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def IntPolyh_Tools_ComputeDeflection(*args):
	return IntPolyh_Tools.ComputeDeflection(*args)

@deprecated
def IntPolyh_Tools_FillArrayOfPointNormal(*args):
	return IntPolyh_Tools.FillArrayOfPointNormal(*args)

@deprecated
def IntPolyh_Tools_IsEnlargePossible(*args):
	return IntPolyh_Tools.IsEnlargePossible(*args)

@deprecated
def IntPolyh_Tools_MakeSampling(*args):
	return IntPolyh_Tools.MakeSampling(*args)

}
