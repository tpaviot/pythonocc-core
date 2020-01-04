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
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(IntPolyh_SeqOfStartPoints) NCollection_Sequence <IntPolyh_StartPoint>;
%template(IntPolyh_ListOfCouples) NCollection_List <IntPolyh_Couple>;
/* end templates declaration */

/* typedefs */
typedef IntPolyh_Array <IntPolyh_Triangle> IntPolyh_ArrayOfTriangles;
typedef NCollection_Sequence <IntPolyh_StartPoint> IntPolyh_SeqOfStartPoints;
typedef IntPolyh_Array <IntPolyh_Edge> IntPolyh_ArrayOfEdges;
typedef IntPolyh_MaillageAffinage * IntPolyh_PMaillageAffinage;
typedef IntPolyh_Array <IntPolyh_StartPoint> IntPolyh_ArrayOfTangentZones;
typedef IntPolyh_Array <IntPolyh_PointNormal> IntPolyh_ArrayOfPointNormal;
typedef IntPolyh_Array <IntPolyh_SectionLine> IntPolyh_ArrayOfSectionLines;
typedef NCollection_List <IntPolyh_Couple> IntPolyh_ListOfCouples;
typedef IntPolyh_ListOfCouples::Iterator IntPolyh_ListIteratorOfListOfCouples;
typedef IntPolyh_Array <IntPolyh_Point> IntPolyh_ArrayOfPoints;
/* end typedefs declaration */

/***********************
* class IntPolyh_Array *
***********************/
/************************
* class IntPolyh_Couple *
************************/
class IntPolyh_Couple {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* Returns the angle
	:rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param v:
	:type v: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer v);

		/****************** FirstValue ******************/
		%feature("compactdefaultargs") FirstValue;
		%feature("autodoc", "* Returns the first index
	:rtype: int") FirstValue;
		Standard_Integer FirstValue ();

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for this couple, in the range [1, theUpperBound] @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        
		/****************** IntPolyh_Couple ******************/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "* Constructor
	:rtype: None") IntPolyh_Couple;
		 IntPolyh_Couple ();

		/****************** IntPolyh_Couple ******************/
		%feature("compactdefaultargs") IntPolyh_Couple;
		%feature("autodoc", "* Constructor
	:param theTriangle1:
	:type theTriangle1: int
	:param theTriangle2:
	:type theTriangle2: int
	:param theAngle: default value is -2.0
	:type theAngle: float
	:rtype: None") IntPolyh_Couple;
		 IntPolyh_Couple (const Standard_Integer theTriangle1,const Standard_Integer theTriangle2,const Standard_Real theAngle = -2.0);

		/****************** IsAnalyzed ******************/
		%feature("compactdefaultargs") IsAnalyzed;
		%feature("autodoc", "* Returns True if the couple has been analyzed
	:rtype: bool") IsAnalyzed;
		Standard_Boolean IsAnalyzed ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns true if the Couple is equal to <theOther>
	:param theOther:
	:type theOther: IntPolyh_Couple
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const IntPolyh_Couple & theOther);

		/****************** SecondValue ******************/
		%feature("compactdefaultargs") SecondValue;
		%feature("autodoc", "* Returns the second index
	:rtype: int") SecondValue;
		Standard_Integer SecondValue ();

		/****************** SetAnalyzed ******************/
		%feature("compactdefaultargs") SetAnalyzed;
		%feature("autodoc", "* Sets the analyzed flag
	:param theAnalyzed:
	:type theAnalyzed: bool
	:rtype: None") SetAnalyzed;
		void SetAnalyzed (const Standard_Boolean theAnalyzed);

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* Sets the angle
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real theAngle);

		/****************** SetCoupleValue ******************/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", "* Sets the triangles
	:param theInd1:
	:type theInd1: int
	:param theInd2:
	:type theInd2: int
	:rtype: None") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer theInd1,const Standard_Integer theInd2);

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
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given couple, in the range [1, theUpperBound] @param theCouple the couple which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theCouple:
	:type theCouple: IntPolyh_Couple
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const IntPolyh_Couple & theCouple,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param theCouple1:
	:type theCouple1: IntPolyh_Couple
	:param theCouple2:
	:type theCouple2: IntPolyh_Couple
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const IntPolyh_Couple & theCouple1,const IntPolyh_Couple & theCouple2);

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
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param v:
	:type v: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer v);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point
	:rtype: int") FirstPoint;
		Standard_Integer FirstPoint ();

		/****************** FirstTriangle ******************/
		%feature("compactdefaultargs") FirstTriangle;
		%feature("autodoc", "* Returns the first triangle
	:rtype: int") FirstTriangle;
		Standard_Integer FirstTriangle ();

		/****************** IntPolyh_Edge ******************/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "* Constructor
	:rtype: None") IntPolyh_Edge;
		 IntPolyh_Edge ();

		/****************** IntPolyh_Edge ******************/
		%feature("compactdefaultargs") IntPolyh_Edge;
		%feature("autodoc", "* Constructor
	:param thePoint1:
	:type thePoint1: int
	:param thePoint2:
	:type thePoint2: int
	:param theTriangle1:
	:type theTriangle1: int
	:param theTriangle2:
	:type theTriangle2: int
	:rtype: None") IntPolyh_Edge;
		 IntPolyh_Edge (const Standard_Integer thePoint1,const Standard_Integer thePoint2,const Standard_Integer theTriangle1,const Standard_Integer theTriangle2);

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "* Returns the second point
	:rtype: int") SecondPoint;
		Standard_Integer SecondPoint ();

		/****************** SecondTriangle ******************/
		%feature("compactdefaultargs") SecondTriangle;
		%feature("autodoc", "* Returns the second triangle
	:rtype: int") SecondTriangle;
		Standard_Integer SecondTriangle ();

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "* Sets the first point
	:param thePoint:
	:type thePoint: int
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer thePoint);

		/****************** SetFirstTriangle ******************/
		%feature("compactdefaultargs") SetFirstTriangle;
		%feature("autodoc", "* Sets the first triangle
	:param theTriangle:
	:type theTriangle: int
	:rtype: None") SetFirstTriangle;
		void SetFirstTriangle (const Standard_Integer theTriangle);

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "* Sets the second point
	:param thePoint:
	:type thePoint: int
	:rtype: None") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer thePoint);

		/****************** SetSecondTriangle ******************/
		%feature("compactdefaultargs") SetSecondTriangle;
		%feature("autodoc", "* Sets the second triangle
	:param theTriangle:
	:type theTriangle: int
	:rtype: None") SetSecondTriangle;
		void SetSecondTriangle (const Standard_Integer theTriangle);

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
		/****************** GetLinePoint ******************/
		%feature("compactdefaultargs") GetLinePoint;
		%feature("autodoc", "* Gets the parameters of the point in section line
	:param IndexLine:
	:type IndexLine: int
	:param IndexPoint:
	:type IndexPoint: int
	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param incidence:
	:type incidence: float
	:rtype: None") GetLinePoint;
		void GetLinePoint (const Standard_Integer IndexLine,const Standard_Integer IndexPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetTangentZonePoint ******************/
		%feature("compactdefaultargs") GetTangentZonePoint;
		%feature("autodoc", "* Gets the parameters of the point in tangent zone
	:param IndexLine:
	:type IndexLine: int
	:param IndexPoint:
	:type IndexPoint: int
	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:rtype: None") GetTangentZonePoint;
		void GetTangentZonePoint (const Standard_Integer IndexLine,const Standard_Integer IndexPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IntPolyh_Intersection ******************/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "* @name Constructors Constructor for intersection of two surfaces with default parameters. Performs intersection.
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:rtype: None") IntPolyh_Intersection;
		 IntPolyh_Intersection (const opencascade::handle<Adaptor3d_HSurface> & theS1,const opencascade::handle<Adaptor3d_HSurface> & theS2);

		/****************** IntPolyh_Intersection ******************/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "* Constructor for intersection of two surfaces with the given size of the sampling nets: - <theNbSU1> x <theNbSV1> - for the first surface <theS1>; - <theNbSU2> x <theNbSV2> - for the second surface <theS2>. Performs intersection.
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theNbSU1:
	:type theNbSU1: int
	:param theNbSV1:
	:type theNbSV1: int
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theNbSU2:
	:type theNbSU2: int
	:param theNbSV2:
	:type theNbSV2: int
	:rtype: None") IntPolyh_Intersection;
		 IntPolyh_Intersection (const opencascade::handle<Adaptor3d_HSurface> & theS1,const Standard_Integer theNbSU1,const Standard_Integer theNbSV1,const opencascade::handle<Adaptor3d_HSurface> & theS2,const Standard_Integer theNbSU2,const Standard_Integer theNbSV2);

		/****************** IntPolyh_Intersection ******************/
		%feature("compactdefaultargs") IntPolyh_Intersection;
		%feature("autodoc", "* Constructor for intersection of two surfaces with the precomputed sampling. Performs intersection.
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theUPars1:
	:type theUPars1: TColStd_Array1OfReal
	:param theVPars1:
	:type theVPars1: TColStd_Array1OfReal
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theUPars2:
	:type theUPars2: TColStd_Array1OfReal
	:param theVPars2:
	:type theVPars2: TColStd_Array1OfReal
	:rtype: None") IntPolyh_Intersection;
		 IntPolyh_Intersection (const opencascade::handle<Adaptor3d_HSurface> & theS1,const TColStd_Array1OfReal & theUPars1,const TColStd_Array1OfReal & theVPars1,const opencascade::handle<Adaptor3d_HSurface> & theS2,const TColStd_Array1OfReal & theUPars2,const TColStd_Array1OfReal & theVPars2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* @name Getting the results Returns state of the operation
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbPointsInLine ******************/
		%feature("compactdefaultargs") NbPointsInLine;
		%feature("autodoc", "* Returns the number of points in the given line
	:param IndexLine:
	:type IndexLine: int
	:rtype: int") NbPointsInLine;
		Standard_Integer NbPointsInLine (const Standard_Integer IndexLine);

		/****************** NbPointsInTangentZone ******************/
		%feature("compactdefaultargs") NbPointsInTangentZone;
		%feature("autodoc", "* Returns number of points in tangent zone
	:param Standard_Integer:
	:type Standard_Integer: 
	:rtype: int") NbPointsInTangentZone;
		Standard_Integer NbPointsInTangentZone (const Standard_Integer);

		/****************** NbSectionLines ******************/
		%feature("compactdefaultargs") NbSectionLines;
		%feature("autodoc", "* Returns the number of section lines
	:rtype: int") NbSectionLines;
		Standard_Integer NbSectionLines ();

		/****************** NbTangentZones ******************/
		%feature("compactdefaultargs") NbTangentZones;
		%feature("autodoc", ":rtype: int") NbTangentZones;
		Standard_Integer NbTangentZones ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Addition
	:param P1:
	:type P1: IntPolyh_Point
	:rtype: IntPolyh_Point") Add;
		IntPolyh_Point Add (const IntPolyh_Point & P1);

		/****************** Cross ******************/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "* Cross
	:param P1:
	:type P1: IntPolyh_Point
	:param P2:
	:type P2: IntPolyh_Point
	:rtype: None") Cross;
		void Cross (const IntPolyh_Point & P1,const IntPolyh_Point & P2);

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "* Returns the degenerated flag
	:rtype: bool") Degenerated;
		Standard_Boolean Degenerated ();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "* Division
	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point") Divide;
		IntPolyh_Point Divide (const Standard_Real rr);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "* Dot
	:param P2:
	:type P2: IntPolyh_Point
	:rtype: float") Dot;
		Standard_Real Dot (const IntPolyh_Point & P2);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump
	:rtype: None") Dump;
		void Dump ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump
	:param i:
	:type i: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer i);

		/****************** Equal ******************/
		%feature("compactdefaultargs") Equal;
		%feature("autodoc", "* Assignment operator
	:param Pt:
	:type Pt: IntPolyh_Point
	:rtype: None") Equal;
		void Equal (const IntPolyh_Point & Pt);

		/****************** IntPolyh_Point ******************/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "* Constructor
	:rtype: None") IntPolyh_Point;
		 IntPolyh_Point ();

		/****************** IntPolyh_Point ******************/
		%feature("compactdefaultargs") IntPolyh_Point;
		%feature("autodoc", "* Constructor
	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: None") IntPolyh_Point;
		 IntPolyh_Point (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real u,const Standard_Real v);

		/****************** Middle ******************/
		%feature("compactdefaultargs") Middle;
		%feature("autodoc", "* Creates middle point from P1 and P2 and stores it to this
	:param MySurface:
	:type MySurface: Adaptor3d_HSurface
	:param P1:
	:type P1: IntPolyh_Point
	:param P2:
	:type P2: IntPolyh_Point
	:rtype: None") Middle;
		void Middle (const opencascade::handle<Adaptor3d_HSurface> & MySurface,const IntPolyh_Point & P1,const IntPolyh_Point & P2);

		/****************** Multiplication ******************/
		%feature("compactdefaultargs") Multiplication;
		%feature("autodoc", "* Multiplication
	:param rr:
	:type rr: float
	:rtype: IntPolyh_Point") Multiplication;
		IntPolyh_Point Multiplication (const Standard_Real rr);

		/****************** PartOfCommon ******************/
		%feature("compactdefaultargs") PartOfCommon;
		%feature("autodoc", "* Returns 0 if the point is not common with the other surface
	:rtype: int") PartOfCommon;
		Standard_Integer PartOfCommon ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the point
	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param II: default value is 1
	:type II: int
	:rtype: None") Set;
		void Set (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real u,const Standard_Real v,const Standard_Integer II = 1);

		/****************** SetDegenerated ******************/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "* Sets the degenerated flag
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetDegenerated;
		void SetDegenerated (const Standard_Boolean theFlag);

		/****************** SetPartOfCommon ******************/
		%feature("compactdefaultargs") SetPartOfCommon;
		%feature("autodoc", "* Sets the part of common
	:param ii:
	:type ii: int
	:rtype: None") SetPartOfCommon;
		void SetPartOfCommon (const Standard_Integer ii);

		/****************** SetU ******************/
		%feature("compactdefaultargs") SetU;
		%feature("autodoc", "* Sets the U coordinate for the 2D point
	:param u:
	:type u: float
	:rtype: None") SetU;
		void SetU (const Standard_Real u);

		/****************** SetV ******************/
		%feature("compactdefaultargs") SetV;
		%feature("autodoc", "* Sets the V coordinate for the 2D point
	:param v:
	:type v: float
	:rtype: None") SetV;
		void SetV (const Standard_Real v);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "* Sets the X coordinate for the 3D point
	:param x:
	:type x: float
	:rtype: None") SetX;
		void SetX (const Standard_Real x);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "* Sets the Y coordinate for the 3D point
	:param y:
	:type y: float
	:rtype: None") SetY;
		void SetY (const Standard_Real y);

		/****************** SetZ ******************/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "* Sets the Z coordinate for the 3D point
	:param z:
	:type z: float
	:rtype: None") SetZ;
		void SetZ (const Standard_Real z);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Square distance to the other point
	:param P2:
	:type P2: IntPolyh_Point
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const IntPolyh_Point & P2);

		/****************** SquareModulus ******************/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "* Square modulus
	:rtype: float") SquareModulus;
		Standard_Real SquareModulus ();

		/****************** Sub ******************/
		%feature("compactdefaultargs") Sub;
		%feature("autodoc", "* Subtraction
	:param P1:
	:type P1: IntPolyh_Point
	:rtype: IntPolyh_Point") Sub;
		IntPolyh_Point Sub (const IntPolyh_Point & P1);

		/****************** U ******************/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "* Returns the U coordinate of the 2D point
	:rtype: float") U;
		Standard_Real U ();

		/****************** V ******************/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "* Returns the V coordinate of the 2D point
	:rtype: float") V;
		Standard_Real V ();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* Returns X coordinate of the 3D point
	:rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* Returns Y coordinate of the 3D point
	:rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* Returns the Z coordinate of the 3D point
	:rtype: float") Z;
		Standard_Real Z ();

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", ":param rr:
	:type rr: float
	:rtype: IntPolyh_Point") operator *;
		IntPolyh_Point operator * (const Standard_Real rr);

		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", ":param P1:
	:type P1: IntPolyh_Point
	:rtype: IntPolyh_Point") operator +;
		IntPolyh_Point operator + (const IntPolyh_Point & P1);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", ":param P1:
	:type P1: IntPolyh_Point
	:rtype: IntPolyh_Point") operator -;
		IntPolyh_Point operator - (const IntPolyh_Point & P1);

		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", ":param rr:
	:type rr: float
	:rtype: IntPolyh_Point") operator /;
		IntPolyh_Point operator / (const Standard_Real rr);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Pt:
	:type Pt: IntPolyh_Point
	:rtype: None") operator =;
		void operator = (const IntPolyh_Point & Pt);

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
		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", ":param nn:
	:type nn: int
	:rtype: IntPolyh_StartPoint") ChangeValue;
		IntPolyh_StartPoint & ChangeValue (const Standard_Integer nn);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", ":param Other:
	:type Other: IntPolyh_SectionLine
	:rtype: IntPolyh_SectionLine") Copy;
		IntPolyh_SectionLine & Copy (const IntPolyh_SectionLine & Other);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** GetN ******************/
		%feature("compactdefaultargs") GetN;
		%feature("autodoc", ":rtype: int") GetN;
		Standard_Integer GetN ();

		/****************** IncrementNbStartPoints ******************/
		%feature("compactdefaultargs") IncrementNbStartPoints;
		%feature("autodoc", ":rtype: None") IncrementNbStartPoints;
		void IncrementNbStartPoints ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param nn:
	:type nn: int
	:rtype: None") Init;
		void Init (const Standard_Integer nn);

		/****************** IntPolyh_SectionLine ******************/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", ":rtype: None") IntPolyh_SectionLine;
		 IntPolyh_SectionLine ();

		/****************** IntPolyh_SectionLine ******************/
		%feature("compactdefaultargs") IntPolyh_SectionLine;
		%feature("autodoc", ":param nn:
	:type nn: int
	:rtype: None") IntPolyh_SectionLine;
		 IntPolyh_SectionLine (const Standard_Integer nn);

		/****************** NbStartPoints ******************/
		%feature("compactdefaultargs") NbStartPoints;
		%feature("autodoc", ":rtype: int") NbStartPoints;
		Standard_Integer NbStartPoints ();

		/****************** Prepend ******************/
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", ":param SP:
	:type SP: IntPolyh_StartPoint
	:rtype: None") Prepend;
		void Prepend (const IntPolyh_StartPoint & SP);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param nn:
	:type nn: int
	:rtype: IntPolyh_StartPoint") Value;
		const IntPolyh_StartPoint & Value (const Standard_Integer nn);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: IntPolyh_SectionLine
	:rtype: IntPolyh_SectionLine") operator =;
		IntPolyh_SectionLine & operator = (const IntPolyh_SectionLine & Other);

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
		/****************** ChainList ******************/
		%feature("compactdefaultargs") ChainList;
		%feature("autodoc", ":rtype: int") ChainList;
		Standard_Integer ChainList ();

		/****************** CheckSameSP ******************/
		%feature("compactdefaultargs") CheckSameSP;
		%feature("autodoc", ":param SP:
	:type SP: IntPolyh_StartPoint
	:rtype: int") CheckSameSP;
		Standard_Integer CheckSameSP (const IntPolyh_StartPoint & SP);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param i:
	:type i: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer i);

		/****************** E1 ******************/
		%feature("compactdefaultargs") E1;
		%feature("autodoc", ":rtype: int") E1;
		Standard_Integer E1 ();

		/****************** E2 ******************/
		%feature("compactdefaultargs") E2;
		%feature("autodoc", ":rtype: int") E2;
		Standard_Integer E2 ();

		/****************** GetAngle ******************/
		%feature("compactdefaultargs") GetAngle;
		%feature("autodoc", ":rtype: float") GetAngle;
		Standard_Real GetAngle ();

		/****************** GetEdgePoints ******************/
		%feature("compactdefaultargs") GetEdgePoints;
		%feature("autodoc", ":param Triangle:
	:type Triangle: IntPolyh_Triangle
	:param FirstEdgePoint:
	:type FirstEdgePoint: int
	:param SecondEdgePoint:
	:type SecondEdgePoint: int
	:param LastPoint:
	:type LastPoint: int
	:rtype: int") GetEdgePoints;
		Standard_Integer GetEdgePoints (const IntPolyh_Triangle & Triangle,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** IntPolyh_StartPoint ******************/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", ":rtype: None") IntPolyh_StartPoint;
		 IntPolyh_StartPoint ();

		/****************** IntPolyh_StartPoint ******************/
		%feature("compactdefaultargs") IntPolyh_StartPoint;
		%feature("autodoc", ":param xx:
	:type xx: float
	:param yy:
	:type yy: float
	:param zz:
	:type zz: float
	:param uu1:
	:type uu1: float
	:param vv1:
	:type vv1: float
	:param uu2:
	:type uu2: float
	:param vv2:
	:type vv2: float
	:param T1:
	:type T1: int
	:param E1:
	:type E1: int
	:param LAM1:
	:type LAM1: float
	:param T2:
	:type T2: int
	:param E2:
	:type E2: int
	:param LAM2:
	:type LAM2: float
	:param List:
	:type List: int
	:rtype: None") IntPolyh_StartPoint;
		 IntPolyh_StartPoint (const Standard_Real xx,const Standard_Real yy,const Standard_Real zz,const Standard_Real uu1,const Standard_Real vv1,const Standard_Real uu2,const Standard_Real vv2,const Standard_Integer T1,const Standard_Integer E1,const Standard_Real LAM1,const Standard_Integer T2,const Standard_Integer E2,const Standard_Real LAM2,const Standard_Integer List);

		/****************** Lambda1 ******************/
		%feature("compactdefaultargs") Lambda1;
		%feature("autodoc", ":rtype: float") Lambda1;
		Standard_Real Lambda1 ();

		/****************** Lambda2 ******************/
		%feature("compactdefaultargs") Lambda2;
		%feature("autodoc", ":rtype: float") Lambda2;
		Standard_Real Lambda2 ();

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", ":param ang:
	:type ang: float
	:rtype: None") SetAngle;
		void SetAngle (const Standard_Real ang);

		/****************** SetChainList ******************/
		%feature("compactdefaultargs") SetChainList;
		%feature("autodoc", ":param ChList:
	:type ChList: int
	:rtype: None") SetChainList;
		void SetChainList (const Standard_Integer ChList);

		/****************** SetCoupleValue ******************/
		%feature("compactdefaultargs") SetCoupleValue;
		%feature("autodoc", ":param IT1:
	:type IT1: int
	:param IT2:
	:type IT2: int
	:rtype: None") SetCoupleValue;
		void SetCoupleValue (const Standard_Integer IT1,const Standard_Integer IT2);

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", ":param IE1:
	:type IE1: int
	:rtype: None") SetEdge1;
		void SetEdge1 (const Standard_Integer IE1);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", ":param IE2:
	:type IE2: int
	:rtype: None") SetEdge2;
		void SetEdge2 (const Standard_Integer IE2);

		/****************** SetLambda1 ******************/
		%feature("compactdefaultargs") SetLambda1;
		%feature("autodoc", ":param LAM1:
	:type LAM1: float
	:rtype: None") SetLambda1;
		void SetLambda1 (const Standard_Real LAM1);

		/****************** SetLambda2 ******************/
		%feature("compactdefaultargs") SetLambda2;
		%feature("autodoc", ":param LAM2:
	:type LAM2: float
	:rtype: None") SetLambda2;
		void SetLambda2 (const Standard_Real LAM2);

		/****************** SetUV1 ******************/
		%feature("compactdefaultargs") SetUV1;
		%feature("autodoc", ":param UU1:
	:type UU1: float
	:param VV1:
	:type VV1: float
	:rtype: None") SetUV1;
		void SetUV1 (const Standard_Real UU1,const Standard_Real VV1);

		/****************** SetUV2 ******************/
		%feature("compactdefaultargs") SetUV2;
		%feature("autodoc", ":param UU2:
	:type UU2: float
	:param VV2:
	:type VV2: float
	:rtype: None") SetUV2;
		void SetUV2 (const Standard_Real UU2,const Standard_Real VV2);

		/****************** SetXYZ ******************/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", ":param XX:
	:type XX: float
	:param YY:
	:type YY: float
	:param ZZ:
	:type ZZ: float
	:rtype: None") SetXYZ;
		void SetXYZ (const Standard_Real XX,const Standard_Real YY,const Standard_Real ZZ);

		/****************** T1 ******************/
		%feature("compactdefaultargs") T1;
		%feature("autodoc", ":rtype: int") T1;
		Standard_Integer T1 ();

		/****************** T2 ******************/
		%feature("compactdefaultargs") T2;
		%feature("autodoc", ":rtype: int") T2;
		Standard_Integer T2 ();

		/****************** U1 ******************/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", ":rtype: float") U1;
		Standard_Real U1 ();

		/****************** U2 ******************/
		%feature("compactdefaultargs") U2;
		%feature("autodoc", ":rtype: float") U2;
		Standard_Real U2 ();

		/****************** V1 ******************/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", ":rtype: float") V1;
		Standard_Real V1 ();

		/****************** V2 ******************/
		%feature("compactdefaultargs") V2;
		%feature("autodoc", ":rtype: float") V2;
		Standard_Real V2 ();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", ":rtype: float") X;
		Standard_Real X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", ":rtype: float") Y;
		Standard_Real Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", ":rtype: float") Z;
		Standard_Real Z ();

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
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "* Computes the deflection tolerance on the surface for the given sampling.
	:param theSurf:
	:type theSurf: Adaptor3d_HSurface
	:param theUPars:
	:type theUPars: TColStd_Array1OfReal
	:param theVPars:
	:type theVPars: TColStd_Array1OfReal
	:rtype: float") ComputeDeflection;
		static Standard_Real ComputeDeflection (const opencascade::handle<Adaptor3d_HSurface> & theSurf,const TColStd_Array1OfReal & theUPars,const TColStd_Array1OfReal & theVPars);

		/****************** FillArrayOfPointNormal ******************/
		%feature("compactdefaultargs") FillArrayOfPointNormal;
		%feature("autodoc", "* Fills the array <thePoints> with the points (triangulation nodes) on the surface and normal directions of the surface in these points.
	:param theSurf:
	:type theSurf: Adaptor3d_HSurface
	:param theUPars:
	:type theUPars: TColStd_Array1OfReal
	:param theVPars:
	:type theVPars: TColStd_Array1OfReal
	:param thePoints:
	:type thePoints: IntPolyh_ArrayOfPointNormal
	:rtype: void") FillArrayOfPointNormal;
		static void FillArrayOfPointNormal (const opencascade::handle<Adaptor3d_HSurface> & theSurf,const TColStd_Array1OfReal & theUPars,const TColStd_Array1OfReal & theVPars,IntPolyh_ArrayOfPointNormal & thePoints);

		/****************** IsEnlargePossible ******************/
		%feature("compactdefaultargs") IsEnlargePossible;
		%feature("autodoc", "* Checks if the surface can be enlarged in U or V direction.
	:param theSurf:
	:type theSurf: Adaptor3d_HSurface
	:param theUEnlarge:
	:type theUEnlarge: bool
	:param theVEnlarge:
	:type theVEnlarge: bool
	:rtype: void") IsEnlargePossible;
		static void IsEnlargePossible (const opencascade::handle<Adaptor3d_HSurface> & theSurf,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** MakeSampling ******************/
		%feature("compactdefaultargs") MakeSampling;
		%feature("autodoc", "* Makes the sampling of the given surface <theSurf> making the net of <theNbSU> x <theNbSV> sampling points. The flag <theEnlargeZone> controls the enlargement of the sampling zone on the surface. The parameters of the sampling points are stored into <theUPars> and <theVPars> arrays.
	:param theSurf:
	:type theSurf: Adaptor3d_HSurface
	:param theNbSU:
	:type theNbSU: int
	:param theNbSV:
	:type theNbSV: int
	:param theEnlargeZone:
	:type theEnlargeZone: bool
	:param theUPars:
	:type theUPars: TColStd_Array1OfReal
	:param theVPars:
	:type theVPars: TColStd_Array1OfReal
	:rtype: void") MakeSampling;
		static void MakeSampling (const opencascade::handle<Adaptor3d_HSurface> & theSurf,const Standard_Integer theNbSU,const Standard_Integer theNbSV,const Standard_Boolean theEnlargeZone,TColStd_Array1OfReal & theUPars,TColStd_Array1OfReal & theVPars);

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns the bounding box of the triangle.
	:param thePoints:
	:type thePoints: IntPolyh_ArrayOfPoints
	:rtype: Bnd_Box") BoundingBox;
		const Bnd_Box & BoundingBox (const IntPolyh_ArrayOfPoints & thePoints);

		/****************** ComputeDeflection ******************/
		%feature("compactdefaultargs") ComputeDeflection;
		%feature("autodoc", "* Computes the deflection for the triangle
	:param theSurface:
	:type theSurface: Adaptor3d_HSurface
	:param thePoints:
	:type thePoints: IntPolyh_ArrayOfPoints
	:rtype: float") ComputeDeflection;
		Standard_Real ComputeDeflection (const opencascade::handle<Adaptor3d_HSurface> & theSurface,const IntPolyh_ArrayOfPoints & thePoints);

		/****************** Deflection ******************/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "* Returns the deflection of the triangle
	:rtype: float") Deflection;
		Standard_Real Deflection ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dumps the contents of the triangle.
	:param v:
	:type v: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer v);

		/****************** FirstEdge ******************/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "* Returns the first edge
	:rtype: int") FirstEdge;
		Standard_Integer FirstEdge ();

		/****************** FirstEdgeOrientation ******************/
		%feature("compactdefaultargs") FirstEdgeOrientation;
		%feature("autodoc", "* Returns the orientation of the first edge
	:rtype: int") FirstEdgeOrientation;
		Standard_Integer FirstEdgeOrientation ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point
	:rtype: int") FirstPoint;
		Standard_Integer FirstPoint ();

		/****************** GetEdgeNumber ******************/
		%feature("compactdefaultargs") GetEdgeNumber;
		%feature("autodoc", "* Gets the edge number by the index
	:param theEdgeIndex:
	:type theEdgeIndex: int
	:rtype: int") GetEdgeNumber;
		Standard_Integer GetEdgeNumber (const Standard_Integer theEdgeIndex);

		/****************** GetEdgeOrientation ******************/
		%feature("compactdefaultargs") GetEdgeOrientation;
		%feature("autodoc", "* Gets the edges orientation by the index
	:param theEdgeIndex:
	:type theEdgeIndex: int
	:rtype: int") GetEdgeOrientation;
		Standard_Integer GetEdgeOrientation (const Standard_Integer theEdgeIndex);

		/****************** GetNextTriangle ******************/
		%feature("compactdefaultargs") GetNextTriangle;
		%feature("autodoc", "* Gets the adjacent triangle
	:param theTriangle:
	:type theTriangle: int
	:param theEdgeNum:
	:type theEdgeNum: int
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges
	:rtype: int") GetNextTriangle;
		Standard_Integer GetNextTriangle (const Standard_Integer theTriangle,const Standard_Integer theEdgeNum,const IntPolyh_ArrayOfEdges & TEdges);

		/****************** HasIntersection ******************/
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "* Returns true if the triangle has interfered the other triangle
	:rtype: bool") HasIntersection;
		Standard_Boolean HasIntersection ();

		/****************** IntPolyh_Triangle ******************/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "* Constructor
	:rtype: None") IntPolyh_Triangle;
		 IntPolyh_Triangle ();

		/****************** IntPolyh_Triangle ******************/
		%feature("compactdefaultargs") IntPolyh_Triangle;
		%feature("autodoc", "* Constructor
	:param thePoint1:
	:type thePoint1: int
	:param thePoint2:
	:type thePoint2: int
	:param thePoint3:
	:type thePoint3: int
	:rtype: None") IntPolyh_Triangle;
		 IntPolyh_Triangle (const Standard_Integer thePoint1,const Standard_Integer thePoint2,const Standard_Integer thePoint3);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "* Returns the Degenerated flag
	:rtype: bool") IsDegenerated;
		Standard_Boolean IsDegenerated ();

		/****************** IsIntersectionPossible ******************/
		%feature("compactdefaultargs") IsIntersectionPossible;
		%feature("autodoc", "* Returns possibility of the intersection
	:rtype: bool") IsIntersectionPossible;
		Standard_Boolean IsIntersectionPossible ();

		/****************** LinkEdges2Triangle ******************/
		%feature("compactdefaultargs") LinkEdges2Triangle;
		%feature("autodoc", "* Links edges to triangle
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges
	:param theEdge1:
	:type theEdge1: int
	:param theEdge2:
	:type theEdge2: int
	:param theEdge3:
	:type theEdge3: int
	:rtype: None") LinkEdges2Triangle;
		void LinkEdges2Triangle (const IntPolyh_ArrayOfEdges & TEdges,const Standard_Integer theEdge1,const Standard_Integer theEdge2,const Standard_Integer theEdge3);

		/****************** MiddleRefinement ******************/
		%feature("compactdefaultargs") MiddleRefinement;
		%feature("autodoc", "* Splits the triangle on two to decrease its deflection
	:param theTriangleNumber:
	:type theTriangleNumber: int
	:param theSurface:
	:type theSurface: Adaptor3d_HSurface
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges
	:rtype: None") MiddleRefinement;
		void MiddleRefinement (const Standard_Integer theTriangleNumber,const opencascade::handle<Adaptor3d_HSurface> & theSurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);

		/****************** MultipleMiddleRefinement ******************/
		%feature("compactdefaultargs") MultipleMiddleRefinement;
		%feature("autodoc", "* Splits the current triangle and new triangles until the refinement criterion is not achieved
	:param theRefineCriterion:
	:type theRefineCriterion: float
	:param theBox:
	:type theBox: Bnd_Box
	:param theTriangleNumber:
	:type theTriangleNumber: int
	:param theSurface:
	:type theSurface: Adaptor3d_HSurface
	:param TPoints:
	:type TPoints: IntPolyh_ArrayOfPoints
	:param TTriangles:
	:type TTriangles: IntPolyh_ArrayOfTriangles
	:param TEdges:
	:type TEdges: IntPolyh_ArrayOfEdges
	:rtype: None") MultipleMiddleRefinement;
		void MultipleMiddleRefinement (const Standard_Real theRefineCriterion,const Bnd_Box & theBox,const Standard_Integer theTriangleNumber,const opencascade::handle<Adaptor3d_HSurface> & theSurface,IntPolyh_ArrayOfPoints & TPoints,IntPolyh_ArrayOfTriangles & TTriangles,IntPolyh_ArrayOfEdges & TEdges);

		/****************** SecondEdge ******************/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "* Returns the second edge
	:rtype: int") SecondEdge;
		Standard_Integer SecondEdge ();

		/****************** SecondEdgeOrientation ******************/
		%feature("compactdefaultargs") SecondEdgeOrientation;
		%feature("autodoc", "* Returns the orientation of the second edge
	:rtype: int") SecondEdgeOrientation;
		Standard_Integer SecondEdgeOrientation ();

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "* Returns the second point
	:rtype: int") SecondPoint;
		Standard_Integer SecondPoint ();

		/****************** SetDeflection ******************/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "* Sets the deflection
	:param theDeflection:
	:type theDeflection: float
	:rtype: None") SetDeflection;
		void SetDeflection (const Standard_Real theDeflection);

		/****************** SetDegenerated ******************/
		%feature("compactdefaultargs") SetDegenerated;
		%feature("autodoc", "* Sets the degenerated flag
	:param theDegFlag:
	:type theDegFlag: bool
	:rtype: None") SetDegenerated;
		void SetDegenerated (const Standard_Boolean theDegFlag);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "* Sets the edge by the index
	:param theEdgeIndex:
	:type theEdgeIndex: int
	:param theEdgeNumber:
	:type theEdgeNumber: int
	:rtype: None") SetEdge;
		void SetEdge (const Standard_Integer theEdgeIndex,const Standard_Integer theEdgeNumber);

		/****************** SetEdgeAndOrientation ******************/
		%feature("compactdefaultargs") SetEdgeAndOrientation;
		%feature("autodoc", "* Sets the appropriate edge and orientation for the triangle.
	:param theEdge:
	:type theEdge: IntPolyh_Edge
	:param theEdgeIndex:
	:type theEdgeIndex: int
	:rtype: None") SetEdgeAndOrientation;
		void SetEdgeAndOrientation (const IntPolyh_Edge & theEdge,const Standard_Integer theEdgeIndex);

		/****************** SetEdgeOrientation ******************/
		%feature("compactdefaultargs") SetEdgeOrientation;
		%feature("autodoc", "* Sets the edges orientation by the index
	:param theEdgeIndex:
	:type theEdgeIndex: int
	:param theEdgeOrientation:
	:type theEdgeOrientation: int
	:rtype: None") SetEdgeOrientation;
		void SetEdgeOrientation (const Standard_Integer theEdgeIndex,const Standard_Integer theEdgeOrientation);

		/****************** SetFirstEdge ******************/
		%feature("compactdefaultargs") SetFirstEdge;
		%feature("autodoc", "* Sets the first edge
	:param theEdge:
	:type theEdge: int
	:param theEdgeOrientation:
	:type theEdgeOrientation: int
	:rtype: None") SetFirstEdge;
		void SetFirstEdge (const Standard_Integer theEdge,const Standard_Integer theEdgeOrientation);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "* Sets the first point
	:param thePoint:
	:type thePoint: int
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer thePoint);

		/****************** SetIntersection ******************/
		%feature("compactdefaultargs") SetIntersection;
		%feature("autodoc", "* Sets the flag of intersection
	:param theInt:
	:type theInt: bool
	:rtype: None") SetIntersection;
		void SetIntersection (const Standard_Boolean theInt);

		/****************** SetIntersectionPossible ******************/
		%feature("compactdefaultargs") SetIntersectionPossible;
		%feature("autodoc", "* Sets the flag of possibility of intersection
	:param theIP:
	:type theIP: bool
	:rtype: None") SetIntersectionPossible;
		void SetIntersectionPossible (const Standard_Boolean theIP);

		/****************** SetSecondEdge ******************/
		%feature("compactdefaultargs") SetSecondEdge;
		%feature("autodoc", "* Sets the second edge
	:param theEdge:
	:type theEdge: int
	:param theEdgeOrientation:
	:type theEdgeOrientation: int
	:rtype: None") SetSecondEdge;
		void SetSecondEdge (const Standard_Integer theEdge,const Standard_Integer theEdgeOrientation);

		/****************** SetSecondPoint ******************/
		%feature("compactdefaultargs") SetSecondPoint;
		%feature("autodoc", "* Sets the second point
	:param thePoint:
	:type thePoint: int
	:rtype: None") SetSecondPoint;
		void SetSecondPoint (const Standard_Integer thePoint);

		/****************** SetThirdEdge ******************/
		%feature("compactdefaultargs") SetThirdEdge;
		%feature("autodoc", "* Sets the third edge
	:param theEdge:
	:type theEdge: int
	:param theEdgeOrientation:
	:type theEdgeOrientation: int
	:rtype: None") SetThirdEdge;
		void SetThirdEdge (const Standard_Integer theEdge,const Standard_Integer theEdgeOrientation);

		/****************** SetThirdPoint ******************/
		%feature("compactdefaultargs") SetThirdPoint;
		%feature("autodoc", "* Sets the third point
	:param thePoint:
	:type thePoint: int
	:rtype: None") SetThirdPoint;
		void SetThirdPoint (const Standard_Integer thePoint);

		/****************** ThirdEdge ******************/
		%feature("compactdefaultargs") ThirdEdge;
		%feature("autodoc", "* Returns the third edge
	:rtype: int") ThirdEdge;
		Standard_Integer ThirdEdge ();

		/****************** ThirdEdgeOrientation ******************/
		%feature("compactdefaultargs") ThirdEdgeOrientation;
		%feature("autodoc", "* Returns the orientation of the third edge
	:rtype: int") ThirdEdgeOrientation;
		Standard_Integer ThirdEdgeOrientation ();

		/****************** ThirdPoint ******************/
		%feature("compactdefaultargs") ThirdPoint;
		%feature("autodoc", "* Returns the third point
	:rtype: int") ThirdPoint;
		Standard_Integer ThirdPoint ();

};


%extend IntPolyh_Triangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
