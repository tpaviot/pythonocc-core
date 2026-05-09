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
%define CHFI3DDOCSTRING
"ChFi3d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_chfi3d.html"
%enddef
%module (package="OCC.Core", docstring=CHFI3DDOCSTRING) ChFi3d


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
#include<ChFi3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<ChFiDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
#include<Adaptor3d_module.hxx>
#include<math_module.hxx>
#include<Law_module.hxx>
#include<gp_module.hxx>
#include<math_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<TColGeom_module.hxx>
#include<AppParCurves_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Geom2d_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<BRepBlend_module.hxx>
#include<IntSurf_module.hxx>
#include<GeomFill_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepAdaptor.i
%import TopoDS.i
%import TopAbs.i
%import ChFiDS.i
%import GeomAbs.i
%import TopOpeBRepBuild.i
%import Geom.i
%import TopTools.i
%import Adaptor3d.i
%import math.i
%import Law.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum ChFi3d_FilletShape {
	ChFi3d_Rational = 0,
	ChFi3d_QuasiAngular = 1,
	ChFi3d_Polynomial = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class ChFi3d_FilletShape(IntEnum):
	ChFi3d_Rational = 0
	ChFi3d_QuasiAngular = 1
	ChFi3d_Polynomial = 2
ChFi3d_Rational = ChFi3d_FilletShape.ChFi3d_Rational
ChFi3d_QuasiAngular = ChFi3d_FilletShape.ChFi3d_QuasiAngular
ChFi3d_Polynomial = ChFi3d_FilletShape.ChFi3d_Polynomial
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class ChFi3d *
***************/
%rename(chfi3d) ChFi3d;
class ChFi3d {
	public:
		/****** ChFi3d::ConcaveSide ******/
		/****** md5 signature: a69bbbece4285eaa59f625b50ef21efa ******/
		%feature("compactdefaultargs") ConcaveSide;
		%feature("autodoc", "
Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
E: TopoDS_Edge

Return
-------
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Description
-----------
Returns Reversed in Or1 and(or) Or2 if the concave edge defined by the interior of faces F1 and F2, in the neighbourhood of their boundary E is of the edge opposite to the normal of their surface support. The orientation of faces is not taken into consideration in the calculation. The function returns 0 if the calculation fails (tangence), if not, it returns the number of choice of the fillet or chamfer corresponding to the orientations calculated and to the tangent to the guide line read in E.
") ConcaveSide;
		static int ConcaveSide(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const TopoDS_Edge & E, TopAbs_Orientation &OutValue, TopAbs_Orientation &OutValue);

		/****** ChFi3d::DefineConnectType ******/
		/****** md5 signature: 1725482ffd9e9947e459aebb6ccc569a ******/
		%feature("compactdefaultargs") DefineConnectType;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
SinTol: double
CorrectPoint: bool

Return
-------
ChFiDS_TypeOfConcavity

Description
-----------
Defines the type of concavity in the edge of connection of two faces.
") DefineConnectType;
		static ChFiDS_TypeOfConcavity DefineConnectType(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const double SinTol, const bool CorrectPoint);

		/****** ChFi3d::IsTangentFaces ******/
		/****** md5 signature: 127ba64b9200a823f43602fae154c926 ******/
		%feature("compactdefaultargs") IsTangentFaces;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace1: TopoDS_Face
theFace2: TopoDS_Face
Order: GeomAbs_Shape (optional, default to GeomAbs_G1)

Return
-------
bool

Description
-----------
Returns true if theEdge between theFace1 and theFace2 is tangent.
") IsTangentFaces;
		static bool IsTangentFaces(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const GeomAbs_Shape Order = GeomAbs_G1);

		/****** ChFi3d::NextSide ******/
		/****** md5 signature: a95b9822076a5eeb80d0b5f4716897c2 ******/
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "
Parameters
----------
OrSave1: TopAbs_Orientation
OrSave2: TopAbs_Orientation
ChoixSauv: int

Return
-------
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Description
-----------
Same as ConcaveSide, but the orientations are logically deduced from the result of the call of ConcaveSide on the first pair of faces of the fillet or chamnfer.
") NextSide;
		static int NextSide(TopAbs_Orientation &OutValue, TopAbs_Orientation &OutValue, const TopAbs_Orientation OrSave1, const TopAbs_Orientation OrSave2, const int ChoixSauv);

		/****** ChFi3d::NextSide ******/
		/****** md5 signature: cdb55087e2f58002d8dd06337ade33f1 ******/
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "
Parameters
----------
OrSave: TopAbs_Orientation
OrFace: TopAbs_Orientation

Return
-------
Or: TopAbs_Orientation

Description
-----------
Same as the other NextSide, but the calculation is done on an edge only.
") NextSide;
		static void NextSide(TopAbs_Orientation &OutValue, const TopAbs_Orientation OrSave, const TopAbs_Orientation OrFace);

		/****** ChFi3d::SameSide ******/
		/****** md5 signature: 57f9a10471a4c59d580b4afe8c9d37eb ******/
		%feature("compactdefaultargs") SameSide;
		%feature("autodoc", "
Parameters
----------
Or: TopAbs_Orientation
OrSave1: TopAbs_Orientation
OrSave2: TopAbs_Orientation
OrFace1: TopAbs_Orientation
OrFace2: TopAbs_Orientation

Return
-------
bool

Description
-----------
Enables to determine while processing an angle, if two fillets or chamfers constituting a face have identic or opposed concave edges.
") SameSide;
		static bool SameSide(const TopAbs_Orientation Or, const TopAbs_Orientation OrSave1, const TopAbs_Orientation OrSave2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2);

};


%extend ChFi3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class ChFi3d_Builder *
***********************/
%nodefaultctor ChFi3d_Builder;
class ChFi3d_Builder {
	public:
		/****** ChFi3d_Builder::Abscissa ******/
		/****** md5 signature: f0d41facdddac9aa358be3fcb5d00820 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
double

Description
-----------
returns the abscissa of the vertex V on the contour of index IC.
") Abscissa;
		double Abscissa(const int IC, const TopoDS_Vertex & V);

		/****** ChFi3d_Builder::BadShape ******/
		/****** md5 signature: bc4bc683dd2daee18cd73177f824f6ce ******/
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
if (HasResult()) returns partial result if (!HasResult()).
") BadShape;
		TopoDS_Shape BadShape();

		/****** ChFi3d_Builder::Builder ******/
		/****** md5 signature: c97c63149316e999abd03e780cc959bf ******/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>

Description
-----------
Returns the Builder of topologic operations.
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****** ChFi3d_Builder::Closed ******/
		/****** md5 signature: e0ab3865b3d0833293cc34c81200a556 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
bool

Description
-----------
returns true if the contour of index IC is closed.
") Closed;
		bool Closed(const int IC);

		/****** ChFi3d_Builder::ClosedAndTangent ******/
		/****** md5 signature: d3b64c4a729f9fcebefc4244cce69436 ******/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
bool

Description
-----------
returns true if the contour of index IC is closed an tangent.
") ClosedAndTangent;
		bool ClosedAndTangent(const int IC);

		/****** ChFi3d_Builder::Compute ******/
		/****** md5 signature: 3472bca0870d21fcbdb4784495b49568 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
general calculation of geometry on all edges, topologic reconstruction.
") Compute;
		void Compute();

		/****** ChFi3d_Builder::ComputedSurface ******/
		/****** md5 signature: a15d4edbb744a0aa6f9d111e23c118e3 ******/
		%feature("compactdefaultargs") ComputedSurface;
		%feature("autodoc", "
Parameters
----------
IC: int
IS: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the IS'th surface calculated on the contour IC.
") ComputedSurface;
		opencascade::handle<Geom_Surface> ComputedSurface(const int IC, const int IS);

		/****** ChFi3d_Builder::Contains ******/
		/****** md5 signature: 5f426f4baeeac0db3e7441ed025b3055 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
int

Description
-----------
gives the number of the contour containing E or 0 if E does not belong to any contour.
") Contains;
		int Contains(const TopoDS_Edge & E);

		/****** ChFi3d_Builder::Contains ******/
		/****** md5 signature: 2892bb05da49d23313f27bf77840d7d9 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
IndexInSpine: int

Description
-----------
gives the number of the contour containing E or 0 if E does not belong to any contour. Sets in IndexInSpine the index of E in the contour if it's found.
") Contains;
		int Contains(const TopoDS_Edge & E, Standard_Integer &OutValue);

		/****** ChFi3d_Builder::FaultyContour ******/
		/****** md5 signature: 60cbd7eb311b7f659c2235f5ce7f52c5 ******/
		%feature("compactdefaultargs") FaultyContour;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Returns the number of I'th contour on which the calculation has failed.
") FaultyContour;
		int FaultyContour(const int I);

		/****** ChFi3d_Builder::FaultyVertex ******/
		/****** md5 signature: fea33f903493149b1c35ed61e4129047 ******/
		%feature("compactdefaultargs") FaultyVertex;
		%feature("autodoc", "
Parameters
----------
IV: int

Return
-------
TopoDS_Vertex

Description
-----------
Returns the IV'th vertex on which the calculation has failed.
") FaultyVertex;
		TopoDS_Vertex FaultyVertex(const int IV);

		/****** ChFi3d_Builder::FirstVertex ******/
		/****** md5 signature: 8ae5f72b8de12d3e15ff630566c51e3e ******/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
TopoDS_Vertex

Description
-----------
returns the First vertex V of the contour of index IC.
") FirstVertex;
		TopoDS_Vertex FirstVertex(const int IC);

		/****** ChFi3d_Builder::Generated ******/
		/****** md5 signature: f6d26e10a473d7146d97bf9bd4b93825 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
EouV: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Advanced function for the history.
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & EouV);

		/****** ChFi3d_Builder::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if a partial result has been calculated.
") HasResult;
		bool HasResult();

		/****** ChFi3d_Builder::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the computation is success.
") IsDone;
		bool IsDone();

		/****** ChFi3d_Builder::LastVertex ******/
		/****** md5 signature: 348ddc856e74109dfe986472f0de409c ******/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
TopoDS_Vertex

Description
-----------
returns the Last vertex V of the contour of index IC.
") LastVertex;
		TopoDS_Vertex LastVertex(const int IC);

		/****** ChFi3d_Builder::Length ******/
		/****** md5 signature: faee0a46598182dd16b362af33deea64 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
double

Description
-----------
returns the length of the contour of index IC.
") Length;
		double Length(const int IC);

		/****** ChFi3d_Builder::NbComputedSurfaces ******/
		/****** md5 signature: e48001905aea524ddac6966e32d0ada7 ******/
		%feature("compactdefaultargs") NbComputedSurfaces;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
int

Description
-----------
Returns the number of surfaces calculated on the contour IC.
") NbComputedSurfaces;
		int NbComputedSurfaces(const int IC);

		/****** ChFi3d_Builder::NbElements ******/
		/****** md5 signature: 936a04e4c43c96574b096e69196411e4 ******/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives the number of disjoint contours on which the fillets are calculated.
") NbElements;
		int NbElements();

		/****** ChFi3d_Builder::NbFaultyContours ******/
		/****** md5 signature: bb216792196133a91f0f03474d19e9a2 ******/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours on which the calculation has failed.
") NbFaultyContours;
		int NbFaultyContours();

		/****** ChFi3d_Builder::NbFaultyVertices ******/
		/****** md5 signature: d910272c091a68da28c61a1d5c53f323 ******/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of vertices on which the calculation has failed.
") NbFaultyVertices;
		int NbFaultyVertices();

		/****** ChFi3d_Builder::PerformTwoCornerbyInter ******/
		/****** md5 signature: c4d73a847a4c1ed20d07d14d2d01561c ******/
		%feature("compactdefaultargs") PerformTwoCornerbyInter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
No available documentation.
") PerformTwoCornerbyInter;
		bool PerformTwoCornerbyInter(const int Index);

		/****** ChFi3d_Builder::RelativeAbscissa ******/
		/****** md5 signature: c4269e2c73774bcb7b7b533d61135147 ******/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
double

Description
-----------
returns the relative abscissa([0.,1.]) of the vertex V on the contour of index IC.
") RelativeAbscissa;
		double RelativeAbscissa(const int IC, const TopoDS_Vertex & V);

		/****** ChFi3d_Builder::Remove ******/
		/****** md5 signature: aa3df62745888f577321042865e84120 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
extracts from the list the contour containing edge E.
") Remove;
		void Remove(const TopoDS_Edge & E);

		/****** ChFi3d_Builder::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset all results of compute and returns the algorithm in the state of the last acquisition to enable modification of contours or areas.
") Reset;
		void Reset();

		/****** ChFi3d_Builder::SetContinuity ******/
		/****** md5 signature: accf6ac0decfa75f8a6dc713e587d570 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
InternalContinuity: GeomAbs_Shape
AngularTolerance: double

Return
-------
None

Description
-----------
No available documentation.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape InternalContinuity, const double AngularTolerance);

		/****** ChFi3d_Builder::SetParams ******/
		/****** md5 signature: b166ea2517a96bd9771f0889e3eca4cd ******/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "
Parameters
----------
Tang: double
Tesp: double
T2d: double
TApp3d: double
TolApp2d: double
Fleche: double

Return
-------
None

Description
-----------
No available documentation.
") SetParams;
		void SetParams(const double Tang, const double Tesp, const double T2d, const double TApp3d, const double TolApp2d, const double Fleche);

		/****** ChFi3d_Builder::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
if (Isdone()) makes the result. if (!Isdone()).
") Shape;
		TopoDS_Shape Shape();

		/****** ChFi3d_Builder::SplitKPart ******/
		/****** md5 signature: 90ffe9bd1188212c67fb05bc86f78287 ******/
		%feature("compactdefaultargs") SplitKPart;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
SetData: ChFiDS_SurfData
Spine: ChFiDS_Spine
Iedge: int
S1: Adaptor3d_Surface
I1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
I2: Adaptor3d_TopolTool

Return
-------
Intf: bool
Intl: bool

Description
-----------
Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer).
") SplitKPart;
		bool SplitKPart(const opencascade::handle<ChFiDS_SurfData> & Data, NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> & SetData, const opencascade::handle<ChFiDS_Spine> & Spine, const int Iedge, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** ChFi3d_Builder::StripeStatus ******/
		/****** md5 signature: 6555865e90e352e8f5838e54359c66f4 ******/
		%feature("compactdefaultargs") StripeStatus;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
ChFiDS_ErrorStatus

Description
-----------
for the stripe IC ,indication on the cause of failure WalkingFailure,TwistedSurface,Error, Ok.
") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus(const int IC);

		/****** ChFi3d_Builder::Value ******/
		/****** md5 signature: cc746c04feda14061c2a242b105db4bc ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<ChFiDS_Spine>

Description
-----------
gives the n'th set of edges (contour) if I >NbElements().
") Value;
		opencascade::handle<ChFiDS_Spine> Value(const int I);

};


%extend ChFi3d_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFi3d_SearchSing *
**************************/
class ChFi3d_SearchSing : public math_FunctionWithDerivative {
	public:
		/****** ChFi3d_SearchSing::ChFi3d_SearchSing ******/
		/****** md5 signature: e24325a0ec023d7744e001f363a8c4b8 ******/
		%feature("compactdefaultargs") ChFi3d_SearchSing;
		%feature("autodoc", "
Parameters
----------
C1: Geom_Curve
C2: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") ChFi3d_SearchSing;
		 ChFi3d_SearchSing(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****** ChFi3d_SearchSing::Derivative ******/
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** ChFi3d_SearchSing::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
computes the value of the function <F> for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** ChFi3d_SearchSing::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend ChFi3d_SearchSing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class ChFi3d_ChBuilder *
*************************/
class ChFi3d_ChBuilder : public ChFi3d_Builder {
	public:
		/****** ChFi3d_ChBuilder::ChFi3d_ChBuilder ******/
		/****** md5 signature: e0f136344ca3e589ea03e8aa1e07f1bb ******/
		%feature("compactdefaultargs") ChFi3d_ChBuilder;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Ta: double (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
initializes the Builder with the Shape <S> for the computation of chamfers.
") ChFi3d_ChBuilder;
		 ChFi3d_ChBuilder(const TopoDS_Shape & S, const double Ta = 1.0e-2);

		/****** ChFi3d_ChBuilder::Add ******/
		/****** md5 signature: 2689ece383041802da1cd80a0167e44a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
initializes a contour with the edge <E> as first (the next are found by propagation ). The two distances (parameters of the chamfer) must be set after. if the edge <E> has more than 2 adjacent faces.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** ChFi3d_ChBuilder::Add ******/
		/****** md5 signature: d61d289eccb2a466263072c33bf0bad3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Dis: double
E: TopoDS_Edge

Return
-------
None

Description
-----------
initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis> if the edge <E> has more than 2 adjacent faces.
") Add;
		void Add(const double Dis, const TopoDS_Edge & E);

		/****** ChFi3d_ChBuilder::Add ******/
		/****** md5 signature: 884187a426c96977111ec350a671e210 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Dis1: double
Dis2: double
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis1> and <Dis2> if the edge <E> has more than 2 adjacent faces.
") Add;
		void Add(const double Dis1, const double Dis2, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ChFi3d_ChBuilder::AddDA ******/
		/****** md5 signature: 3b45415c51a8aec9f41e2181ba6639a6 ******/
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "
Parameters
----------
Dis: double
Angle: double
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
initializes a new contour with the edge <E> as first (the next are found by propagation ), and the distance <Dis1> and <Angle> if the edge <E> has more than 2 adjacent faces.
") AddDA;
		void AddDA(const double Dis, const double Angle, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** ChFi3d_ChBuilder::Dists ******/
		/****** md5 signature: 5c6dd3ea4fde635a9c2f8aea64fcdb09 ******/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
Dis1: double
Dis2: double

Description
-----------
gives the distances <Dis1> and <Dis2> of the fillet contour of index <IC> in the DS.
") Dists;
		void Dists(const int IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFi3d_ChBuilder::GetDist ******/
		/****** md5 signature: 7fd61b153d7190ea44e1ceb34110d3dd ******/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
Dis: double

Description
-----------
gives the distances <Dis> of the fillet contour of index <IC> in the DS.
") GetDist;
		void GetDist(const int IC, Standard_Real &OutValue);

		/****** ChFi3d_ChBuilder::GetDistAngle ******/
		/****** md5 signature: 0725e0d903035f0c7ad5f0eb109091c2 ******/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
Dis: double
Angle: double

Description
-----------
gives the distances <Dis> and <Angle> of the fillet contour of index <IC> in the DS.
") GetDistAngle;
		void GetDistAngle(const int IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFi3d_ChBuilder::IsChamfer ******/
		/****** md5 signature: 50adbe76dc6e37533eaa19ee36bab87c ******/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
ChFiDS_ChamfMethod

Description
-----------
renvoi la methode des chanfreins utilisee.
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer(const int IC);

		/****** ChFi3d_ChBuilder::Mode ******/
		/****** md5 signature: 646b757cb6ae4ed9f283015af34597e7 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
ChFiDS_ChamfMode

Description
-----------
returns the mode of chamfer used.
") Mode;
		ChFiDS_ChamfMode Mode();

		/****** ChFi3d_ChBuilder::NbSurf ******/
		/****** md5 signature: f851916ecfdad0a7043652d1aca071c7 ******/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
int

Description
-----------
No available documentation.
") NbSurf;
		int NbSurf(const int IC);

		/****** ChFi3d_ChBuilder::PerformSurf ******/
		/****** md5 signature: 38b25fc21e27daeb71d088d6e4868ba1 ******/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
MaxStep: double
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecOnS1: bool
RecOnS2: bool
Soldep: math_Vector

Return
-------
First: double
Last: double
Intf: int
Intl: int

Description
-----------
Methode, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer).
") PerformSurf;
		bool PerformSurf(NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const double MaxStep, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecOnS1, const bool RecOnS2, const math_Vector & Soldep, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** ChFi3d_ChBuilder::PerformSurf ******/
		/****** md5 signature: de32c6710e3dbba9edd570e2024930a7 ******/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_Curve2d
Sref1: BRepAdaptor_Surface
PCref1: BRepAdaptor_Curve2d
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
Or2: TopAbs_Orientation
MaxStep: double
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Return
-------
Decroch1: bool
First: double
Last: double

Description
-----------
Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.
") PerformSurf;
		void PerformSurf(NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_Curve2d> & PC1, const opencascade::handle<BRepAdaptor_Surface> & Sref1, const opencascade::handle<BRepAdaptor_Curve2d> & PCref1, Standard_Boolean &OutValue, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const TopAbs_Orientation Or2, const double MaxStep, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecP, const bool RecS, const bool RecRst, const math_Vector & Soldep);

		/****** ChFi3d_ChBuilder::PerformSurf ******/
		/****** md5 signature: 04f27727e62f4ee05258f22cc8f526d2 ******/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
Or1: TopAbs_Orientation
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_Curve2d
Sref2: BRepAdaptor_Surface
PCref2: BRepAdaptor_Curve2d
MaxStep: double
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Return
-------
Decroch2: bool
First: double
Last: double

Description
-----------
Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.
") PerformSurf;
		void PerformSurf(NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_Curve2d> & PC2, const opencascade::handle<BRepAdaptor_Surface> & Sref2, const opencascade::handle<BRepAdaptor_Curve2d> & PCref2, Standard_Boolean &OutValue, const double MaxStep, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecP, const bool RecS, const bool RecRst, const math_Vector & Soldep);

		/****** ChFi3d_ChBuilder::PerformSurf ******/
		/****** md5 signature: c464bcd977196b4e6883f1676500a93b ******/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_Curve2d
Sref1: BRepAdaptor_Surface
PCref1: BRepAdaptor_Curve2d
Or1: TopAbs_Orientation
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_Curve2d
Sref2: BRepAdaptor_Surface
PCref2: BRepAdaptor_Curve2d
Or2: TopAbs_Orientation
MaxStep: double
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecP1: bool
RecRst1: bool
RecP2: bool
RecRst2: bool
Soldep: math_Vector

Return
-------
Decroch1: bool
Decroch2: bool
First: double
Last: double

Description
-----------
Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/edge.
") PerformSurf;
		void PerformSurf(NCollection_Sequence<opencascade::handle<ChFiDS_SurfData>> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_Curve2d> & PC1, const opencascade::handle<BRepAdaptor_Surface> & Sref1, const opencascade::handle<BRepAdaptor_Curve2d> & PCref1, Standard_Boolean &OutValue, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_Curve2d> & PC2, const opencascade::handle<BRepAdaptor_Surface> & Sref2, const opencascade::handle<BRepAdaptor_Curve2d> & PCref2, Standard_Boolean &OutValue, const TopAbs_Orientation Or2, const double MaxStep, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecP1, const bool RecRst1, const bool RecP2, const bool RecRst2, const math_Vector & Soldep);

		/****** ChFi3d_ChBuilder::ResetContour ******/
		/****** md5 signature: 04d69710edabf0c1cadc743818bdf3a2 ******/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
None

Description
-----------
Reset tous rayons du contour IC.
") ResetContour;
		void ResetContour(const int IC);

		/****** ChFi3d_ChBuilder::Sect ******/
		/****** md5 signature: 6888ae0a8ecef39762309134d045ec97 ******/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "
Parameters
----------
IC: int
IS: int

Return
-------
opencascade::handle<NCollection_HArray1<ChFiDS_CircSection>>

Description
-----------
No available documentation.
") Sect;
		opencascade::handle<NCollection_HArray1<ChFiDS_CircSection>> Sect(const int IC, const int IS);

		/****** ChFi3d_ChBuilder::SetDist ******/
		/****** md5 signature: 5d16403abe1f9f0bcddccdbd9c3a101a ******/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "
Parameters
----------
Dis: double
IC: int
F: TopoDS_Face

Return
-------
None

Description
-----------
set the distance <Dis> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>.
") SetDist;
		void SetDist(const double Dis, const int IC, const TopoDS_Face & F);

		/****** ChFi3d_ChBuilder::SetDistAngle ******/
		/****** md5 signature: 71691603a7c39e10b1a2652ff703c003 ******/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "
Parameters
----------
Dis: double
Angle: double
IC: int
F: TopoDS_Face

Return
-------
None

Description
-----------
set the distance <Dis> and <Angle> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>.
") SetDistAngle;
		void SetDistAngle(const double Dis, const double Angle, const int IC, const TopoDS_Face & F);

		/****** ChFi3d_ChBuilder::SetDists ******/
		/****** md5 signature: 39755e46d08de96bfef984aae307a6e3 ******/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "
Parameters
----------
Dis1: double
Dis2: double
IC: int
F: TopoDS_Face

Return
-------
None

Description
-----------
set the distances <Dis1> and <Dis2> of the fillet contour of index <IC> in the DS with <Dis1> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>.
") SetDists;
		void SetDists(const double Dis1, const double Dis2, const int IC, const TopoDS_Face & F);

		/****** ChFi3d_ChBuilder::SetMode ******/
		/****** md5 signature: 85103d8a8712f2721bdad80918d54319 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
theMode: ChFiDS_ChamfMode

Return
-------
None

Description
-----------
set the mode of shamfer.
") SetMode;
		void SetMode(const ChFiDS_ChamfMode theMode);

		/****** ChFi3d_ChBuilder::SimulSurf ******/
		/****** md5 signature: de75c9554a3412348d9f61e72ad152c5 ******/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_Curve2d
Sref1: BRepAdaptor_Surface
PCref1: BRepAdaptor_Curve2d
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
Or2: TopAbs_Orientation
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Return
-------
Decroch1: bool
First: double
Last: double

Description
-----------
No available documentation.
") SimulSurf;
		void SimulSurf(opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_Curve2d> & PC1, const opencascade::handle<BRepAdaptor_Surface> & Sref1, const opencascade::handle<BRepAdaptor_Curve2d> & PCref1, Standard_Boolean &OutValue, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const TopAbs_Orientation Or2, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecP, const bool RecS, const bool RecRst, const math_Vector & Soldep);

		/****** ChFi3d_ChBuilder::SimulSurf ******/
		/****** md5 signature: 7b192778762a90292732b8ff4988ae13 ******/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
Or1: TopAbs_Orientation
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_Curve2d
Sref2: BRepAdaptor_Surface
PCref2: BRepAdaptor_Curve2d
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Return
-------
Decroch2: bool
First: double
Last: double

Description
-----------
No available documentation.
") SimulSurf;
		void SimulSurf(opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_Curve2d> & PC2, const opencascade::handle<BRepAdaptor_Surface> & Sref2, const opencascade::handle<BRepAdaptor_Curve2d> & PCref2, Standard_Boolean &OutValue, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecP, const bool RecS, const bool RecRst, const math_Vector & Soldep);

		/****** ChFi3d_ChBuilder::SimulSurf ******/
		/****** md5 signature: ac69f6e8ec45944340119ab1dd48a9e8 ******/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "
Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_ElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_Surface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_Curve2d
Sref1: BRepAdaptor_Surface
PCref1: BRepAdaptor_Curve2d
Or1: TopAbs_Orientation
S2: BRepAdaptor_Surface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_Curve2d
Sref2: BRepAdaptor_Surface
PCref2: BRepAdaptor_Curve2d
Or2: TopAbs_Orientation
Fleche: double
TolGuide: double
Inside: bool
Appro: bool
Forward: bool
RecP1: bool
RecRst1: bool
RecP2: bool
RecRst2: bool
Soldep: math_Vector

Return
-------
Decroch1: bool
Decroch2: bool
First: double
Last: double

Description
-----------
No available documentation.
") SimulSurf;
		void SimulSurf(opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<ChFiDS_ElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const int Choix, const opencascade::handle<BRepAdaptor_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_Curve2d> & PC1, const opencascade::handle<BRepAdaptor_Surface> & Sref1, const opencascade::handle<BRepAdaptor_Curve2d> & PCref1, Standard_Boolean &OutValue, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_Curve2d> & PC2, const opencascade::handle<BRepAdaptor_Surface> & Sref2, const opencascade::handle<BRepAdaptor_Curve2d> & PCref2, Standard_Boolean &OutValue, const TopAbs_Orientation Or2, const double Fleche, const double TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const bool Inside, const bool Appro, const bool Forward, const bool RecP1, const bool RecRst1, const bool RecP2, const bool RecRst2, const math_Vector & Soldep);

		/****** ChFi3d_ChBuilder::Simulate ******/
		/****** md5 signature: 9ff423306a1a78ca92326bd790fb7084 ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
None

Description
-----------
No available documentation.
") Simulate;
		void Simulate(const int IC);

};


%extend ChFi3d_ChBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ChFi3d_FilBuilder *
**************************/
class ChFi3d_FilBuilder : public ChFi3d_Builder {
	public:
		/****** ChFi3d_FilBuilder::ChFi3d_FilBuilder ******/
		/****** md5 signature: e20243a5c8d5392f0b5a0b344c517f77 ******/
		%feature("compactdefaultargs") ChFi3d_FilBuilder;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FShape: ChFi3d_FilletShape (optional, default to ChFi3d_Rational)
Ta: double (optional, default to 1.0e-2)

Return
-------
None

Description
-----------
No available documentation.
") ChFi3d_FilBuilder;
		 ChFi3d_FilBuilder(const TopoDS_Shape & S, const ChFi3d_FilletShape FShape = ChFi3d_Rational, const double Ta = 1.0e-2);

		/****** ChFi3d_FilBuilder::Add ******/
		/****** md5 signature: 2689ece383041802da1cd80a0167e44a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
initialisation of a contour with the first edge (the following are found by propagation). Attention, you need to start with SetRadius.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::Add ******/
		/****** md5 signature: 1e968b45fad02fba0133c174f66057d4 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Radius: double
E: TopoDS_Edge

Return
-------
None

Description
-----------
initialisation of the constant vector the corresponding 1st edge.
") Add;
		void Add(const double Radius, const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::GetBounds ******/
		/****** md5 signature: cbccacfbf93c43e343e932925173105c ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
First: double
Last: double

Description
-----------
Returns in First and Last extremities of the part of variable vector framing E, returns False if E is flagged as edge constant.
") GetBounds;
		bool GetBounds(const int IC, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** ChFi3d_FilBuilder::GetFilletShape ******/
		/****** md5 signature: 20984b7354615dd8cd27c08187d0e0c2 ******/
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "Return
-------
ChFi3d_FilletShape

Description
-----------
Returns the type of fillet surface.
") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape();

		/****** ChFi3d_FilBuilder::GetLaw ******/
		/****** md5 signature: dcfc73bee324d3f5ac9d8cfe79828bea ******/
		%feature("compactdefaultargs") GetLaw;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
opencascade::handle<Law_Function>

Description
-----------
Returns the rule of elementary evolution of the part to variable vector framing E, returns a rule zero if E is flagged as edge constant.
") GetLaw;
		opencascade::handle<Law_Function> GetLaw(const int IC, const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::IsConstant ******/
		/****** md5 signature: 4be22ce4ff62dec0afe9b62c79c631e5 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
bool

Description
-----------
Returns true the contour is flagged as edge constant.
") IsConstant;
		bool IsConstant(const int IC);

		/****** ChFi3d_FilBuilder::IsConstant ******/
		/****** md5 signature: 093c61f971956ab4ada3a3fcd27f90ae ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns true E is flagged as edge constant.
") IsConstant;
		bool IsConstant(const int IC, const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::NbSurf ******/
		/****** md5 signature: f851916ecfdad0a7043652d1aca071c7 ******/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
int

Description
-----------
No available documentation.
") NbSurf;
		int NbSurf(const int IC);

		/****** ChFi3d_FilBuilder::Radius ******/
		/****** md5 signature: 57aa4caaba33f42753e0de69d19c617b ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
double

Description
-----------
Returns the vector if the contour is flagged as edge constant.
") Radius;
		double Radius(const int IC);

		/****** ChFi3d_FilBuilder::Radius ******/
		/****** md5 signature: 99ec7544fc294073d86bf5b69dde8065 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
double

Description
-----------
Returns the vector if E is flagged as edge constant.
") Radius;
		double Radius(const int IC, const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::ResetContour ******/
		/****** md5 signature: 04d69710edabf0c1cadc743818bdf3a2 ******/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
None

Description
-----------
Reset all vectors of contour IC.
") ResetContour;
		void ResetContour(const int IC);

		/****** ChFi3d_FilBuilder::Sect ******/
		/****** md5 signature: 6888ae0a8ecef39762309134d045ec97 ******/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "
Parameters
----------
IC: int
IS: int

Return
-------
opencascade::handle<NCollection_HArray1<ChFiDS_CircSection>>

Description
-----------
No available documentation.
") Sect;
		opencascade::handle<NCollection_HArray1<ChFiDS_CircSection>> Sect(const int IC, const int IS);

		/****** ChFi3d_FilBuilder::SetFilletShape ******/
		/****** md5 signature: e06a9b29defc75fed749ac6b4289246e ******/
		%feature("compactdefaultargs") SetFilletShape;
		%feature("autodoc", "
Parameters
----------
FShape: ChFi3d_FilletShape

Return
-------
None

Description
-----------
Sets the type of fillet surface.
") SetFilletShape;
		void SetFilletShape(const ChFi3d_FilletShape FShape);

		/****** ChFi3d_FilBuilder::SetLaw ******/
		/****** md5 signature: 4c1121329c3c1fc0b2690d4783aaca23 ******/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge
L: Law_Function

Return
-------
None

Description
-----------
Sets the rule of elementary evolution of the part to variable vector framing E.
") SetLaw;
		void SetLaw(const int IC, const TopoDS_Edge & E, const opencascade::handle<Law_Function> & L);

		/****** ChFi3d_FilBuilder::SetRadius ******/
		/****** md5 signature: 4136f34cea642399bc8b867ffa17fa93 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
C: Law_Function
IC: int
IinC: int

Return
-------
None

Description
-----------
Set the radius of the contour of index IC.
") SetRadius;
		void SetRadius(const opencascade::handle<Law_Function> & C, const int IC, const int IinC);

		/****** ChFi3d_FilBuilder::SetRadius ******/
		/****** md5 signature: 96a61a863a28ba92c361af409cc20f91 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: double
IC: int
E: TopoDS_Edge

Return
-------
None

Description
-----------
Set a constant on edge E of the contour of index IC. Since then E is flagged as constant.
") SetRadius;
		void SetRadius(const double Radius, const int IC, const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::SetRadius ******/
		/****** md5 signature: 362bddd325cde161ef3c8dfd1fbd6813 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: double
IC: int
V: TopoDS_Vertex

Return
-------
None

Description
-----------
Set a vector on vertex V of the contour of index IC.
") SetRadius;
		void SetRadius(const double Radius, const int IC, const TopoDS_Vertex & V);

		/****** ChFi3d_FilBuilder::SetRadius ******/
		/****** md5 signature: e28047f6addaf07653cdf377cd552474 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
UandR: gp_XY
IC: int
IinC: int

Return
-------
None

Description
-----------
Set a vertex on the point of parameter U in the edge IinC of the contour of index IC.
") SetRadius;
		void SetRadius(const gp_XY & UandR, const int IC, const int IinC);

		/****** ChFi3d_FilBuilder::Simulate ******/
		/****** md5 signature: 9ff423306a1a78ca92326bd790fb7084 ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
None

Description
-----------
No available documentation.
") Simulate;
		void Simulate(const int IC);

		/****** ChFi3d_FilBuilder::UnSet ******/
		/****** md5 signature: b6ae7d82884954afc2b66019836cccb0 ******/
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
None

Description
-----------
Extracts the flag constant and the vector of edge E.
") UnSet;
		void UnSet(const int IC, const TopoDS_Edge & E);

		/****** ChFi3d_FilBuilder::UnSet ******/
		/****** md5 signature: 7a55969fbc567e52a4c97aa83e72b5be ******/
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
None

Description
-----------
Extracts the vector of the vertex V.
") UnSet;
		void UnSet(const int IC, const TopoDS_Vertex & V);

};


%extend ChFi3d_FilBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def chfi3d_ConcaveSide(*args):
	return chfi3d.ConcaveSide(*args)

@deprecated
def chfi3d_DefineConnectType(*args):
	return chfi3d.DefineConnectType(*args)

@deprecated
def chfi3d_IsTangentFaces(*args):
	return chfi3d.IsTangentFaces(*args)

@deprecated
def chfi3d_NextSide(*args):
	return chfi3d.NextSide(*args)

@deprecated
def chfi3d_NextSide(*args):
	return chfi3d.NextSide(*args)

@deprecated
def chfi3d_SameSide(*args):
	return chfi3d.SameSide(*args)

}
