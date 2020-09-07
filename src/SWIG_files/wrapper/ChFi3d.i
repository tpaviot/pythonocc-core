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
%define CHFI3DDOCSTRING
"ChFi3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_chfi3d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<ChFi3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<Geom_module.hxx>
#include<TopTools_module.hxx>
#include<GeomAbs_module.hxx>
#include<ChFiDS_module.hxx>
#include<Adaptor3d_module.hxx>
#include<math_module.hxx>
#include<Law_module.hxx>
#include<gp_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Geom2d_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<BRepBlend_module.hxx>
#include<IntSurf_module.hxx>
#include<GeomFill_module.hxx>
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
%import TopOpeBRepBuild.i
%import Geom.i
%import TopTools.i
%import GeomAbs.i
%import ChFiDS.i
%import Adaptor3d.i
%import math.i
%import Law.i
%import gp.i
%import GeomAdaptor.i
%import TopOpeBRepDS.i
%import Geom2d.i
%import TColStd.i
%import Bnd.i
%import BRepBlend.i
%import IntSurf.i
%import GeomFill.i

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

/* python proy classes for enums */
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
		/****************** ConcaveSide ******************/
		/**** md5 signature: 7bec3b7502316353ebdd49b4cbee0996 ****/
		%feature("compactdefaultargs") ConcaveSide;
		%feature("autodoc", "Returns reversed in or1 and(or) or2 if the concave edge defined by the interior of faces f1 and f2, in the neighbourhood of their boundary e is of the edge opposite to the normal of their surface support. the orientation of faces is not taken into consideration in the calculation. the function returns 0 if the calculation fails (tangence), if not, it returns the number of choice of the fillet or chamfer corresponding to the orientations calculated and to the tangent to the guide line read in e.

Parameters
----------
S1: BRepAdaptor_Surface
S2: BRepAdaptor_Surface
E: TopoDS_Edge
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation

Returns
-------
int
") ConcaveSide;
		static Standard_Integer ConcaveSide(const BRepAdaptor_Surface & S1, const BRepAdaptor_Surface & S2, const TopoDS_Edge & E, TopAbs_Orientation & Or1, TopAbs_Orientation & Or2);

		/****************** NextSide ******************/
		/**** md5 signature: 14be854cdfa62a2c6440b8491c5042f8 ****/
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "Same as concaveside, but the orientations are logically deduced from the result of the call of concaveside on the first pair of faces of the fillet or chamnfer.

Parameters
----------
Or1: TopAbs_Orientation
Or2: TopAbs_Orientation
OrSave1: TopAbs_Orientation
OrSave2: TopAbs_Orientation
ChoixSauv: int

Returns
-------
int
") NextSide;
		static Standard_Integer NextSide(TopAbs_Orientation & Or1, TopAbs_Orientation & Or2, const TopAbs_Orientation OrSave1, const TopAbs_Orientation OrSave2, const Standard_Integer ChoixSauv);

		/****************** NextSide ******************/
		/**** md5 signature: cdb55087e2f58002d8dd06337ade33f1 ****/
		%feature("compactdefaultargs") NextSide;
		%feature("autodoc", "Same as the other nextside, but the calculation is done on an edge only.

Parameters
----------
Or: TopAbs_Orientation
OrSave: TopAbs_Orientation
OrFace: TopAbs_Orientation

Returns
-------
None
") NextSide;
		static void NextSide(TopAbs_Orientation & Or, const TopAbs_Orientation OrSave, const TopAbs_Orientation OrFace);

		/****************** SameSide ******************/
		/**** md5 signature: cb26ae9b069d0a97c5fa9e8f947264b7 ****/
		%feature("compactdefaultargs") SameSide;
		%feature("autodoc", "Enables to determine while processing an angle, if two fillets or chamfers constituting a face have identic or opposed concave edges.

Parameters
----------
Or: TopAbs_Orientation
OrSave1: TopAbs_Orientation
OrSave2: TopAbs_Orientation
OrFace1: TopAbs_Orientation
OrFace2: TopAbs_Orientation

Returns
-------
bool
") SameSide;
		static Standard_Boolean SameSide(const TopAbs_Orientation Or, const TopAbs_Orientation OrSave1, const TopAbs_Orientation OrSave2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2);

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
		/****************** Abscissa ******************/
		/**** md5 signature: 31f4e656f81ac45f0650f2aa0cf2b692 ****/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returns the abscissa of the vertex v on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** BadShape ******************/
		/**** md5 signature: bc4bc683dd2daee18cd73177f824f6ce ****/
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "If (hasresult()) returns partial result if (!hasresult()).

Returns
-------
TopoDS_Shape
") BadShape;
		TopoDS_Shape BadShape();

		/****************** Builder ******************/
		/**** md5 signature: c97c63149316e999abd03e780cc959bf ****/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Returns the builder of topologic operations.

Returns
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****************** Closed ******************/
		/**** md5 signature: 7ea06a053a6bd104436927e72ec2d7e1 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the contour of index ic is closed.

Parameters
----------
IC: int

Returns
-------
bool
") Closed;
		Standard_Boolean Closed(const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		/**** md5 signature: 012c335e427742eb278e7fcc80b2f309 ****/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "Returns true if the contour of index ic is closed an tangent.

Parameters
----------
IC: int

Returns
-------
bool
") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****************** Compute ******************/
		/**** md5 signature: 3472bca0870d21fcbdb4784495b49568 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "General calculation of geometry on all edges, topologic reconstruction.

Returns
-------
None
") Compute;
		void Compute();

		/****************** ComputedSurface ******************/
		/**** md5 signature: 96c489b28233f30f53d28540eaf6a6c2 ****/
		%feature("compactdefaultargs") ComputedSurface;
		%feature("autodoc", "Returns the is'th surface calculated on the contour ic.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<Geom_Surface>
") ComputedSurface;
		opencascade::handle<Geom_Surface> ComputedSurface(const Standard_Integer IC, const Standard_Integer IS);

		/****************** Contains ******************/
		/**** md5 signature: cfbf83d97f78344c872414bbe2cb7740 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Gives the number of the contour containing e or 0 if e does not belong to any contour.

Parameters
----------
E: TopoDS_Edge

Returns
-------
int
") Contains;
		Standard_Integer Contains(const TopoDS_Edge & E);

		/****************** Contains ******************/
		/**** md5 signature: 0aafac7e6ba54066fec64bc0173fc538 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Gives the number of the contour containing e or 0 if e does not belong to any contour. sets in indexinspine the index of e in the contour if it's found.

Parameters
----------
E: TopoDS_Edge

Returns
-------
IndexInSpine: int
") Contains;
		Standard_Integer Contains(const TopoDS_Edge & E, Standard_Integer &OutValue);

		/****************** FaultyContour ******************/
		/**** md5 signature: 21156686a769d644f96890ea34047e80 ****/
		%feature("compactdefaultargs") FaultyContour;
		%feature("autodoc", "Returns the number of i'th contour on which the calculation has failed.

Parameters
----------
I: int

Returns
-------
int
") FaultyContour;
		Standard_Integer FaultyContour(const Standard_Integer I);

		/****************** FaultyVertex ******************/
		/**** md5 signature: a045d17950f9e0d223a11a5a00a22d52 ****/
		%feature("compactdefaultargs") FaultyVertex;
		%feature("autodoc", "Returns the iv'th vertex on which the calculation has failed.

Parameters
----------
IV: int

Returns
-------
TopoDS_Vertex
") FaultyVertex;
		TopoDS_Vertex FaultyVertex(const Standard_Integer IV);

		/****************** FirstVertex ******************/
		/**** md5 signature: c5b47847648295bc6810b4445914591d ****/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the first vertex v of the contour of index ic.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****************** Generated ******************/
		/**** md5 signature: d0e5ef4174eea6373e77527c2c26c346 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Advanced function for the history.

Parameters
----------
EouV: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & EouV);

		/****************** HasResult ******************/
		/**** md5 signature: 345d4b0f7e88f528928167976d8256d5 ****/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a partial result has been calculated.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation is success.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LastVertex ******************/
		/**** md5 signature: 57e948c557679f9fdc9d75aa4466c614 ****/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the last vertex v of the contour of index ic.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****************** Length ******************/
		/**** md5 signature: ecc1081662dff3d3783bd541b86356db ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the contour of index ic.

Parameters
----------
IC: int

Returns
-------
float
") Length;
		Standard_Real Length(const Standard_Integer IC);

		/****************** NbComputedSurfaces ******************/
		/**** md5 signature: 164cfd056526b3a43cae9bf77f5c8661 ****/
		%feature("compactdefaultargs") NbComputedSurfaces;
		%feature("autodoc", "Returns the number of surfaces calculated on the contour ic.

Parameters
----------
IC: int

Returns
-------
int
") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces(const Standard_Integer IC);

		/****************** NbElements ******************/
		/**** md5 signature: bda4abdd1e5bc28bcadae491494177fe ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Gives the number of disjoint contours on which the fillets are calculated.

Returns
-------
int
") NbElements;
		Standard_Integer NbElements();

		/****************** NbFaultyContours ******************/
		/**** md5 signature: f1fb95ba8b7e9b0d24a588c92bfcc422 ****/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "Returns the number of contours on which the calculation has failed.

Returns
-------
int
") NbFaultyContours;
		Standard_Integer NbFaultyContours();

		/****************** NbFaultyVertices ******************/
		/**** md5 signature: e14cf31fcf2094c6ecb0e40d167aeb3c ****/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "Returns the number of vertices on which the calculation has failed.

Returns
-------
int
") NbFaultyVertices;
		Standard_Integer NbFaultyVertices();

		/****************** PerformTwoCornerbyInter ******************/
		/**** md5 signature: fac07bab468e6cb117f5f3b768bb2ff8 ****/
		%feature("compactdefaultargs") PerformTwoCornerbyInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
bool
") PerformTwoCornerbyInter;
		Standard_Boolean PerformTwoCornerbyInter(const Standard_Integer Index);

		/****************** RelativeAbscissa ******************/
		/**** md5 signature: cdfd6a6c8172a0c2723e1521a0997ef5 ****/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "Returns the relative abscissa([0.,1.]) of the vertex v on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") RelativeAbscissa;
		Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Remove ******************/
		/**** md5 signature: aa3df62745888f577321042865e84120 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Extracts from the list the contour containing edge e.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Edge & E);

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset all results of compute and returns the algorythm in the state of the last acquisition to enable modification of contours or areas.

Returns
-------
None
") Reset;
		void Reset();

		/****************** SetContinuity ******************/
		/**** md5 signature: c492356a15562b146506665d8c5d1b77 ****/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
InternalContinuity: GeomAbs_Shape
AngularTolerance: float

Returns
-------
None
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape InternalContinuity, const Standard_Real AngularTolerance);

		/****************** SetParams ******************/
		/**** md5 signature: dd3731c1527f95a9443df47a6b3a54d4 ****/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tang: float
Tesp: float
T2d: float
TApp3d: float
TolApp2d: float
Fleche: float

Returns
-------
None
") SetParams;
		void SetParams(const Standard_Real Tang, const Standard_Real Tesp, const Standard_Real T2d, const Standard_Real TApp3d, const Standard_Real TolApp2d, const Standard_Real Fleche);

		/****************** Shape ******************/
		/**** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "If (isdone()) makes the result. if (!isdone()).

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** SplitKPart ******************/
		/**** md5 signature: b91de28c62e74af7841164e8ad5d1b8a ****/
		%feature("compactdefaultargs") SplitKPart;
		%feature("autodoc", "Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer).

Parameters
----------
Data: ChFiDS_SurfData
SetData: ChFiDS_SequenceOfSurfData
Spine: ChFiDS_Spine
Iedge: int
S1: Adaptor3d_HSurface
I1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
I2: Adaptor3d_TopolTool

Returns
-------
Intf: bool
Intl: bool
") SplitKPart;
		Standard_Boolean SplitKPart(const opencascade::handle<ChFiDS_SurfData> & Data, ChFiDS_SequenceOfSurfData & SetData, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Iedge, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** StripeStatus ******************/
		/**** md5 signature: 7b8afd101ec5ebd9cd37e2bc2cfd73ff ****/
		%feature("compactdefaultargs") StripeStatus;
		%feature("autodoc", "For the stripe ic ,indication on the cause of failure walkingfailure,twistedsurface,error, ok.

Parameters
----------
IC: int

Returns
-------
ChFiDS_ErrorStatus
") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus(const Standard_Integer IC);

		/****************** Value ******************/
		/**** md5 signature: 73f8510698b95ab6280a8aadb140271b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Gives the n'th set of edges (contour) if i >nbelements().

Parameters
----------
I: int

Returns
-------
opencascade::handle<ChFiDS_Spine>
") Value;
		opencascade::handle<ChFiDS_Spine> Value(const Standard_Integer I);

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
		/****************** ChFi3d_SearchSing ******************/
		/**** md5 signature: e24325a0ec023d7744e001f363a8c4b8 ****/
		%feature("compactdefaultargs") ChFi3d_SearchSing;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Geom_Curve
C2: Geom_Curve

Returns
-------
None
") ChFi3d_SearchSing;
		 ChFi3d_SearchSing(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****************** Derivative ******************/
		/**** md5 signature: 95e91729f1fb548d9a62f690b302c323 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the function <f> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ****/
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
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** ChFi3d_ChBuilder ******************/
		/**** md5 signature: 7120384ca6dcfe48f81eab9aea9d69e2 ****/
		%feature("compactdefaultargs") ChFi3d_ChBuilder;
		%feature("autodoc", "Initializes the builder with the shape <s> for the computation of chamfers.

Parameters
----------
S: TopoDS_Shape
Ta: float,optional
	default value is 1.0e-2

Returns
-------
None
") ChFi3d_ChBuilder;
		 ChFi3d_ChBuilder(const TopoDS_Shape & S, const Standard_Real Ta = 1.0e-2);

		/****************** Add ******************/
		/**** md5 signature: 2689ece383041802da1cd80a0167e44a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Initializes a contour with the edge <e> as first (the next are found by propagation ). the two distances (parameters of the chamfer) must be set after. if the edge <e> has more than 2 adjacent faces.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: 5df832e06f6a2a3e7dd74bbc479baf92 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Initializes a new contour with the edge <e> as first (the next are found by propagation ), and the distance <dis> if the edge <e> has more than 2 adjacent faces.

Parameters
----------
Dis: float
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const Standard_Real Dis, const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: 3d413aacf4fbe519a69cb102312acd8a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Initializes a new contour with the edge <e> as first (the next are found by propagation ), and the distance <dis1> and <dis2> if the edge <e> has more than 2 adjacent faces.

Parameters
----------
Dis1: float
Dis2: float
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const Standard_Real Dis1, const Standard_Real Dis2, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** AddDA ******************/
		/**** md5 signature: b13fc907617fc4fffa48eb6ecc1c875f ****/
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "Initializes a new contour with the edge <e> as first (the next are found by propagation ), and the distance <dis1> and <angle> if the edge <e> has more than 2 adjacent faces.

Parameters
----------
Dis: float
Angle: float
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") AddDA;
		void AddDA(const Standard_Real Dis, const Standard_Real Angle, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Dists ******************/
		/**** md5 signature: 25b55d4bd35e93f2afa86c7ba6682d7e ****/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "Gives the distances <dis1> and <dis2> of the fillet contour of index <ic> in the ds.

Parameters
----------
IC: int

Returns
-------
Dis1: float
Dis2: float
") Dists;
		void Dists(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetDist ******************/
		/**** md5 signature: 84c7d3c61b94e48d768b0bb3c4924f47 ****/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "Gives the distances <dis> of the fillet contour of index <ic> in the ds.

Parameters
----------
IC: int

Returns
-------
Dis: float
") GetDist;
		void GetDist(const Standard_Integer IC, Standard_Real &OutValue);

		/****************** GetDistAngle ******************/
		/**** md5 signature: ccc047433212c6a4b18b05da6f614d32 ****/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "Gives the distances <dis> and <angle> of the fillet contour of index <ic> in the ds.

Parameters
----------
IC: int

Returns
-------
Dis: float
Angle: float
") GetDistAngle;
		void GetDistAngle(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsChamfer ******************/
		/**** md5 signature: 661b4ca5cdc6256cec105065329c70a1 ****/
		%feature("compactdefaultargs") IsChamfer;
		%feature("autodoc", "Renvoi la methode des chanfreins utilisee.

Parameters
----------
IC: int

Returns
-------
ChFiDS_ChamfMethod
") IsChamfer;
		ChFiDS_ChamfMethod IsChamfer(const Standard_Integer IC);

		/****************** Mode ******************/
		/**** md5 signature: 646b757cb6ae4ed9f283015af34597e7 ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Returns the mode of chamfer used.

Returns
-------
ChFiDS_ChamfMode
") Mode;
		ChFiDS_ChamfMode Mode();

		/****************** NbSurf ******************/
		/**** md5 signature: 3ba1e0286f267bc085d79a266b5090c0 ****/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
int
") NbSurf;
		Standard_Integer NbSurf(const Standard_Integer IC);

		/****************** PerformSurf ******************/
		/**** md5 signature: c9bcf31fa3ccdaf4183db60fab970ed3 ****/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "Methode, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer).

Parameters
----------
Data: ChFiDS_SequenceOfSurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
MaxStep: float
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecOnS1: bool
RecOnS2: bool
Soldep: math_Vector

Returns
-------
First: float
Last: float
Intf: int
Intl: int
") PerformSurf;
		virtual Standard_Boolean PerformSurf(ChFiDS_SequenceOfSurfData & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecOnS1, const Standard_Boolean RecOnS2, const math_Vector & Soldep, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** PerformSurf ******************/
		/**** md5 signature: 27aec34757cbc4ab749d221771aadf81 ****/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "Method, implemented in the inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.

Parameters
----------
Data: ChFiDS_SequenceOfSurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_HCurve2d
Sref1: BRepAdaptor_HSurface
PCref1: BRepAdaptor_HCurve2d
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
Or2: TopAbs_Orientation
MaxStep: float
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Returns
-------
Decroch1: bool
First: float
Last: float
") PerformSurf;
		virtual void PerformSurf(ChFiDS_SequenceOfSurfData & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_HCurve2d> & PC1, const opencascade::handle<BRepAdaptor_HSurface> & Sref1, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1, Standard_Boolean &OutValue, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const TopAbs_Orientation Or2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector & Soldep);

		/****************** PerformSurf ******************/
		/**** md5 signature: 2ecf40db521deb0a6b81881b4cb5cfc6 ****/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/face.

Parameters
----------
Data: ChFiDS_SequenceOfSurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
Or1: TopAbs_Orientation
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_HCurve2d
Sref2: BRepAdaptor_HSurface
PCref2: BRepAdaptor_HCurve2d
MaxStep: float
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Returns
-------
Decroch2: bool
First: float
Last: float
") PerformSurf;
		virtual void PerformSurf(ChFiDS_SequenceOfSurfData & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_HCurve2d> & PC2, const opencascade::handle<BRepAdaptor_HSurface> & Sref2, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2, Standard_Boolean &OutValue, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector & Soldep);

		/****************** PerformSurf ******************/
		/**** md5 signature: 219121b6b79237b657c5f6672a1d382e ****/
		%feature("compactdefaultargs") PerformSurf;
		%feature("autodoc", "Method, implemented in inheritants, calculates the elements of construction of the surface (fillet or chamfer) contact edge/edge.

Parameters
----------
Data: ChFiDS_SequenceOfSurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_HCurve2d
Sref1: BRepAdaptor_HSurface
PCref1: BRepAdaptor_HCurve2d
Or1: TopAbs_Orientation
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_HCurve2d
Sref2: BRepAdaptor_HSurface
PCref2: BRepAdaptor_HCurve2d
Or2: TopAbs_Orientation
MaxStep: float
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecP1: bool
RecRst1: bool
RecP2: bool
RecRst2: bool
Soldep: math_Vector

Returns
-------
Decroch1: bool
Decroch2: bool
First: float
Last: float
") PerformSurf;
		virtual void PerformSurf(ChFiDS_SequenceOfSurfData & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_HCurve2d> & PC1, const opencascade::handle<BRepAdaptor_HSurface> & Sref1, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1, Standard_Boolean &OutValue, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_HCurve2d> & PC2, const opencascade::handle<BRepAdaptor_HSurface> & Sref2, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2, Standard_Boolean &OutValue, const TopAbs_Orientation Or2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP1, const Standard_Boolean RecRst1, const Standard_Boolean RecP2, const Standard_Boolean RecRst2, const math_Vector & Soldep);

		/****************** ResetContour ******************/
		/**** md5 signature: 654a75a6070237897ac136e282153619 ****/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "Reset tous rayons du contour ic.

Parameters
----------
IC: int

Returns
-------
None
") ResetContour;
		void ResetContour(const Standard_Integer IC);

		/****************** Sect ******************/
		/**** md5 signature: 92e5ad2e9df2d2372c7f126adea80e1f ****/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<ChFiDS_SecHArray1>
") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****************** SetDist ******************/
		/**** md5 signature: 789e30011f188a91019292809e2bc8e3 ****/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "Set the distance <dis> of the fillet contour of index <ic> in the ds with <dis> on <f>. if the face <f> is not one of common faces of an edge of the contour <ic>.

Parameters
----------
Dis: float
IC: int
F: TopoDS_Face

Returns
-------
None
") SetDist;
		void SetDist(const Standard_Real Dis, const Standard_Integer IC, const TopoDS_Face & F);

		/****************** SetDistAngle ******************/
		/**** md5 signature: 9a08ff085bc7ed451624212f4387c5cd ****/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "Set the distance <dis> and <angle> of the fillet contour of index <ic> in the ds with <dis> on <f>. if the face <f> is not one of common faces of an edge of the contour <ic>.

Parameters
----------
Dis: float
Angle: float
IC: int
F: TopoDS_Face

Returns
-------
None
") SetDistAngle;
		void SetDistAngle(const Standard_Real Dis, const Standard_Real Angle, const Standard_Integer IC, const TopoDS_Face & F);

		/****************** SetDists ******************/
		/**** md5 signature: 74f8c6096ad0cd9495a44c102ab48955 ****/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "Set the distances <dis1> and <dis2> of the fillet contour of index <ic> in the ds with <dis1> on <f>. if the face <f> is not one of common faces of an edge of the contour <ic>.

Parameters
----------
Dis1: float
Dis2: float
IC: int
F: TopoDS_Face

Returns
-------
None
") SetDists;
		void SetDists(const Standard_Real Dis1, const Standard_Real Dis2, const Standard_Integer IC, const TopoDS_Face & F);

		/****************** SetMode ******************/
		/**** md5 signature: 85103d8a8712f2721bdad80918d54319 ****/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Set the mode of shamfer.

Parameters
----------
theMode: ChFiDS_ChamfMode

Returns
-------
None
") SetMode;
		void SetMode(const ChFiDS_ChamfMode theMode);

		/****************** SimulSurf ******************/
		/**** md5 signature: 5088d3a9669a5c493d09063dd6706572 ****/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_HCurve2d
Sref1: BRepAdaptor_HSurface
PCref1: BRepAdaptor_HCurve2d
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
Or2: TopAbs_Orientation
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Returns
-------
Decroch1: bool
First: float
Last: float
") SimulSurf;
		virtual void SimulSurf(opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_HCurve2d> & PC1, const opencascade::handle<BRepAdaptor_HSurface> & Sref1, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1, Standard_Boolean &OutValue, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const TopAbs_Orientation Or2, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector & Soldep);

		/****************** SimulSurf ******************/
		/**** md5 signature: 541412c797face5770a5481f0c414c50 ****/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
Or1: TopAbs_Orientation
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_HCurve2d
Sref2: BRepAdaptor_HSurface
PCref2: BRepAdaptor_HCurve2d
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecP: bool
RecS: bool
RecRst: bool
Soldep: math_Vector

Returns
-------
Decroch2: bool
First: float
Last: float
") SimulSurf;
		virtual void SimulSurf(opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_HCurve2d> & PC2, const opencascade::handle<BRepAdaptor_HSurface> & Sref2, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2, Standard_Boolean &OutValue, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector & Soldep);

		/****************** SimulSurf ******************/
		/**** md5 signature: ad1213ffe850aedc13a1d42010383f86 ****/
		%feature("compactdefaultargs") SimulSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Data: ChFiDS_SurfData
Guide: ChFiDS_HElSpine
Spine: ChFiDS_Spine
Choix: int
S1: BRepAdaptor_HSurface
I1: Adaptor3d_TopolTool
PC1: BRepAdaptor_HCurve2d
Sref1: BRepAdaptor_HSurface
PCref1: BRepAdaptor_HCurve2d
Or1: TopAbs_Orientation
S2: BRepAdaptor_HSurface
I2: Adaptor3d_TopolTool
PC2: BRepAdaptor_HCurve2d
Sref2: BRepAdaptor_HSurface
PCref2: BRepAdaptor_HCurve2d
Or2: TopAbs_Orientation
Fleche: float
TolGuide: float
Inside: bool
Appro: bool
Forward: bool
RecP1: bool
RecRst1: bool
RecP2: bool
RecRst2: bool
Soldep: math_Vector

Returns
-------
Decroch1: bool
Decroch2: bool
First: float
Last: float
") SimulSurf;
		virtual void SimulSurf(opencascade::handle<ChFiDS_SurfData> & Data, const opencascade::handle<ChFiDS_HElSpine> & Guide, const opencascade::handle<ChFiDS_Spine> & Spine, const Standard_Integer Choix, const opencascade::handle<BRepAdaptor_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & I1, const opencascade::handle<BRepAdaptor_HCurve2d> & PC1, const opencascade::handle<BRepAdaptor_HSurface> & Sref1, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref1, Standard_Boolean &OutValue, const TopAbs_Orientation Or1, const opencascade::handle<BRepAdaptor_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & I2, const opencascade::handle<BRepAdaptor_HCurve2d> & PC2, const opencascade::handle<BRepAdaptor_HSurface> & Sref2, const opencascade::handle<BRepAdaptor_HCurve2d> & PCref2, Standard_Boolean &OutValue, const TopAbs_Orientation Or2, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP1, const Standard_Boolean RecRst1, const Standard_Boolean RecP2, const Standard_Boolean RecRst2, const math_Vector & Soldep);

		/****************** Simulate ******************/
		/**** md5 signature: 2cd119960e597a9f622fcb1f996b7f10 ****/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
None
") Simulate;
		void Simulate(const Standard_Integer IC);

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
		/****************** ChFi3d_FilBuilder ******************/
		/**** md5 signature: bc0ee30d6b71dcd56f616701c06e9417 ****/
		%feature("compactdefaultargs") ChFi3d_FilBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
FShape: ChFi3d_FilletShape,optional
	default value is ChFi3d_Rational
Ta: float,optional
	default value is 1.0e-2

Returns
-------
None
") ChFi3d_FilBuilder;
		 ChFi3d_FilBuilder(const TopoDS_Shape & S, const ChFi3d_FilletShape FShape = ChFi3d_Rational, const Standard_Real Ta = 1.0e-2);

		/****************** Add ******************/
		/**** md5 signature: 2689ece383041802da1cd80a0167e44a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Initialisation of a contour with the first edge (the following are found by propagation). attention, you need to start with setradius.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: 76561d24a6bc7a4c8b9703f8ada723d1 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Initialisation of the constant vector the corresponding 1st edge.

Parameters
----------
Radius: float
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const Standard_Real Radius, const TopoDS_Edge & E);

		/****************** GetBounds ******************/
		/**** md5 signature: e9c8e7eca8571ba8660235024489488f ****/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "Returns in first and last les extremities of the part of variable vector framing e, returns false if e is flagged as edge constant.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
First: float
Last: float
") GetBounds;
		Standard_Boolean GetBounds(const Standard_Integer IC, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetFilletShape ******************/
		/**** md5 signature: 20984b7354615dd8cd27c08187d0e0c2 ****/
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "Returns the type of fillet surface.

Returns
-------
ChFi3d_FilletShape
") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape();

		/****************** GetLaw ******************/
		/**** md5 signature: ddf4e7699933a83df3959c22378f680c ****/
		%feature("compactdefaultargs") GetLaw;
		%feature("autodoc", "Returns the rule of elementary evolution of the part to variable vector framing e, returns a rule zero if e is flagged as edge constant.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
opencascade::handle<Law_Function>
") GetLaw;
		opencascade::handle<Law_Function> GetLaw(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** IsConstant ******************/
		/**** md5 signature: 524ff18247c3bd6dd3b77ea2fbe631ab ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true the contour is flaged as edge constant.

Parameters
----------
IC: int

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant(const Standard_Integer IC);

		/****************** IsConstant ******************/
		/**** md5 signature: 257d5c150f15059bb7c72ce611d410fc ****/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true e is flagged as edge constant.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** NbSurf ******************/
		/**** md5 signature: 3ba1e0286f267bc085d79a266b5090c0 ****/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
int
") NbSurf;
		Standard_Integer NbSurf(const Standard_Integer IC);

		/****************** Radius ******************/
		/**** md5 signature: fa1b61b1f5b63be2bd1c45ff84f2e774 ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the vector if the contour is flagged as edge constant.

Parameters
----------
IC: int

Returns
-------
float
") Radius;
		Standard_Real Radius(const Standard_Integer IC);

		/****************** Radius ******************/
		/**** md5 signature: f7159c67e3b0c71e38b6204368bc2c9e ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the vector if e is flagged as edge constant.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
float
") Radius;
		Standard_Real Radius(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** ResetContour ******************/
		/**** md5 signature: 654a75a6070237897ac136e282153619 ****/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "Reset all vectors of contour ic.

Parameters
----------
IC: int

Returns
-------
None
") ResetContour;
		void ResetContour(const Standard_Integer IC);

		/****************** Sect ******************/
		/**** md5 signature: 92e5ad2e9df2d2372c7f126adea80e1f ****/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<ChFiDS_SecHArray1>
") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****************** SetFilletShape ******************/
		/**** md5 signature: e06a9b29defc75fed749ac6b4289246e ****/
		%feature("compactdefaultargs") SetFilletShape;
		%feature("autodoc", "Sets the type of fillet surface.

Parameters
----------
FShape: ChFi3d_FilletShape

Returns
-------
None
") SetFilletShape;
		void SetFilletShape(const ChFi3d_FilletShape FShape);

		/****************** SetLaw ******************/
		/**** md5 signature: 6b759d0a0e31e3dac6b56c3c9951b79f ****/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "Sets the rule of elementary evolution of the part to variable vector framing e.

Parameters
----------
IC: int
E: TopoDS_Edge
L: Law_Function

Returns
-------
None
") SetLaw;
		void SetLaw(const Standard_Integer IC, const TopoDS_Edge & E, const opencascade::handle<Law_Function> & L);

		/****************** SetRadius ******************/
		/**** md5 signature: 21488f68e7c80ebbc1e1d896c4c61405 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Set the radius of the contour of index ic.

Parameters
----------
C: Law_Function
IC: int
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const opencascade::handle<Law_Function> & C, const Standard_Integer IC, const Standard_Integer IinC);

		/****************** SetRadius ******************/
		/**** md5 signature: 56cd0b711b7c7a0a5ac3f46e84fd6fe3 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Set a constant on edge e of the contour of index ic. since then e is flagged as constant.

Parameters
----------
Radius: float
IC: int
E: TopoDS_Edge

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** SetRadius ******************/
		/**** md5 signature: 8c455c2795828e4085759369fbb8b830 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Set a vector on vertex v of the contour of index ic.

Parameters
----------
Radius: float
IC: int
V: TopoDS_Vertex

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** SetRadius ******************/
		/**** md5 signature: e751199546621edad98f6bfbc943fbd8 ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Set a vertex on the point of parametre u in the edge iinc of the contour of index ic.

Parameters
----------
UandR: gp_XY
IC: int
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const gp_XY & UandR, const Standard_Integer IC, const Standard_Integer IinC);

		/****************** Simulate ******************/
		/**** md5 signature: 2cd119960e597a9f622fcb1f996b7f10 ****/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
None
") Simulate;
		void Simulate(const Standard_Integer IC);

		/****************** UnSet ******************/
		/**** md5 signature: 5bea14e65811e9d97ebe70e8d9051345 ****/
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "Extracts the flag constant and the vector of edge e.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
None
") UnSet;
		void UnSet(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** UnSet ******************/
		/**** md5 signature: 51b9d66d8fbc64376b2995567ecc007f ****/
		%feature("compactdefaultargs") UnSet;
		%feature("autodoc", "Extracts the vector of the vertex v.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
None
") UnSet;
		void UnSet(const Standard_Integer IC, const TopoDS_Vertex & V);

};


%extend ChFi3d_FilBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
