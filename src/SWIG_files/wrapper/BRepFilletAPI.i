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
%define BREPFILLETAPIDOCSTRING
"BRepFilletAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepfilletapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPFILLETAPIDOCSTRING) BRepFilletAPI


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
#include<BRepFilletAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<ChFi2d_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<ChFiDS_module.hxx>
#include<ChFi3d_module.hxx>
#include<Law_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomFill_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepTools_module.hxx>
#include<Approx_module.hxx>
#include<TopLoc_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Extrema_module.hxx>
#include<Approx_module.hxx>
#include<BRepBlend_module.hxx>
#include<Message_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TColGeom_module.hxx>
#include<TShort_module.hxx>
#include<IntSurf_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepBuilderAPI.i
%import TopoDS.i
%import Message.i
%import ChFi2d.i
%import TopOpeBRepBuild.i
%import ChFiDS.i
%import ChFi3d.i
%import Law.i
%import Geom.i
%import GeomAbs.i

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
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************************
* class BRepFilletAPI_LocalOperation *
*************************************/
%nodefaultctor BRepFilletAPI_LocalOperation;
class BRepFilletAPI_LocalOperation : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepFilletAPI_LocalOperation::Abscissa ******/
		/****** md5 signature: dd2ef98d1a90eda0b7309ac1446c28bf ******/
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
		virtual double Abscissa(const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_LocalOperation::Add ******/
		/****** md5 signature: fa4475fe7d476e3c0ff5b6872b6ef406 ******/
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
Adds a contour in the builder (builds a contour of tangent edges).
") Add;
		virtual void Add(const TopoDS_Edge & E);

		/****** BRepFilletAPI_LocalOperation::Closed ******/
		/****** md5 signature: 2808e1941e07bc69ce8940832a43b5c3 ******/
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
		virtual bool Closed(const int IC);

		/****** BRepFilletAPI_LocalOperation::ClosedAndTangent ******/
		/****** md5 signature: fa46dd19c3496a8df17ef7aad1acbec7 ******/
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
		virtual bool ClosedAndTangent(const int IC);

		/****** BRepFilletAPI_LocalOperation::Contour ******/
		/****** md5 signature: 4c1c7fb2e125567cba4e255ed1467f9a ******/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
int

Description
-----------
Returns the index of the contour containing the edge E, returns 0 if E doesn't belong to any contour.
") Contour;
		virtual int Contour(const TopoDS_Edge & E);

		/****** BRepFilletAPI_LocalOperation::Edge ******/
		/****** md5 signature: eb313502a1ae63475b5bfcca26b634e7 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
TopoDS_Edge

Description
-----------
Returns the Edge J in the contour I.
") Edge;
		virtual const TopoDS_Edge Edge(const int I, const int J);

		/****** BRepFilletAPI_LocalOperation::FirstVertex ******/
		/****** md5 signature: 0fa7bca860fcc38988ed75d2f05fe57b ******/
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
Returns the first Vertex of the contour of index IC.
") FirstVertex;
		virtual TopoDS_Vertex FirstVertex(const int IC);

		/****** BRepFilletAPI_LocalOperation::LastVertex ******/
		/****** md5 signature: 144865b0ca0b8e02276723e738fe3140 ******/
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
Returns the last Vertex of the contour of index IC.
") LastVertex;
		virtual TopoDS_Vertex LastVertex(const int IC);

		/****** BRepFilletAPI_LocalOperation::Length ******/
		/****** md5 signature: 051d6c4f6b128449f10c19571ee78972 ******/
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
returns the length the contour of index IC.
") Length;
		virtual double Length(const int IC);

		/****** BRepFilletAPI_LocalOperation::NbContours ******/
		/****** md5 signature: b59b068da7d515d016c165926b0cb440 ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of contours.
") NbContours;
		virtual int NbContours();

		/****** BRepFilletAPI_LocalOperation::NbEdges ******/
		/****** md5 signature: 666758df3bb604c2d44ae12be48cbb76 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Number of Edges in the contour I.
") NbEdges;
		virtual int NbEdges(const int I);

		/****** BRepFilletAPI_LocalOperation::NbSurf ******/
		/****** md5 signature: aff77ab51149d3d850e9fef34ca199ae ******/
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
		virtual int NbSurf(const int IC);

		/****** BRepFilletAPI_LocalOperation::RelativeAbscissa ******/
		/****** md5 signature: 104bdcfb624afc0fa46e6cbb43f064b3 ******/
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
		virtual double RelativeAbscissa(const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_LocalOperation::Remove ******/
		/****** md5 signature: 72f5f0c292d497568578946495770c65 ******/
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
remove the contour containing the Edge E.
") Remove;
		virtual void Remove(const TopoDS_Edge & E);

		/****** BRepFilletAPI_LocalOperation::Reset ******/
		/****** md5 signature: aae28a27b63a433889d7410d7f53fa36 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset all the fields updated by Build operation and leave the algorithm in the same state than before build call. It allows contours and radius modifications to build the result another time.
") Reset;
		virtual void Reset();

		/****** BRepFilletAPI_LocalOperation::ResetContour ******/
		/****** md5 signature: a5230f22b4fc785305c68fb5bd25e617 ******/
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
Reset the contour of index IC, there is nomore information in the contour.
") ResetContour;
		virtual void ResetContour(const int IC);

		/****** BRepFilletAPI_LocalOperation::Sect ******/
		/****** md5 signature: d7437dc8f29671d8ecbe0c1078c849f5 ******/
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
		virtual opencascade::handle<NCollection_HArray1<ChFiDS_CircSection>> Sect(const int IC, const int IS);

		/****** BRepFilletAPI_LocalOperation::Simulate ******/
		/****** md5 signature: 8cfffecef02fd7220fbbec95f427c0b4 ******/
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
		virtual void Simulate(const int IC);

};


%extend BRepFilletAPI_LocalOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepFilletAPI_MakeFillet2d *
***********************************/
class BRepFilletAPI_MakeFillet2d : public BRepBuilderAPI_MakeShape {
	public:
		/****** BRepFilletAPI_MakeFillet2d::BRepFilletAPI_MakeFillet2d ******/
		/****** md5 signature: 21c99b8730600fc6f2b7825df55cfd09 ******/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes an empty algorithm for computing fillets and chamfers. The face on which the fillets and chamfers are built is defined using the Init function. The vertices on which fillets or chamfers are built are defined using the AddFillet or AddChamfer function. Warning The status of the initialization, as given by the Status function, can be one of the following: - ChFi2d_Ready if the initialization is correct, - ChFi2d_NotPlanar if F is not planar, - ChFi2d_NoFace if F is a null face.
") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d();

		/****** BRepFilletAPI_MakeFillet2d::BRepFilletAPI_MakeFillet2d ******/
		/****** md5 signature: 04e9ad8a32ac3c41b5c80a5c2b17d511 ******/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes an algorithm for computing fillets and chamfers on the face F. The vertices on which fillets or chamfers are built are defined using the AddFillet or AddChamfer function. Warning The status of the initialization, as given by the Status function, can be one of the following: - ChFi2d_Ready if the initialization is correct, - ChFi2d_NotPlanar if F is not planar, - ChFi2d_NoFace if F is a null face.
") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d(const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeFillet2d::AddChamfer ******/
		/****** md5 signature: 42e494c55a6846ce97431b471aca6750 ******/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: double
D2: double

Return
-------
TopoDS_Edge

Description
-----------
Adds a chamfer on the face modified by this algorithm between the two adjacent edges E1 and E2, where the extremities of the chamfer are on E1 and E2 at distances D1 and D2 respectively In cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the chamfer and builds the resulting face.
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const double D1, const double D2);

		/****** BRepFilletAPI_MakeFillet2d::AddChamfer ******/
		/****** md5 signature: e954c3ee2da3fbde7b34714164e9d079 ******/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
D: double
Ang: double

Return
-------
TopoDS_Edge

Description
-----------
Adds a chamfer on the face modified by this algorithm between the two edges connected by the vertex V, where E is one of the two edges. The chamfer makes an angle Ang with E and one of its extremities is on E at distance D from V. In cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the chamfer and builds the resulting face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the chamfer is built, - ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero, - ChFi2d_ConnexionError if: - the edge E, E1 or E2 does not belong to the initial face, or - the edges E1 and E2 are not adjacent, or - the vertex V is not one of the limit points of the edge E, - ChFi2d_ComputationError if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - ChFi2d_NotAuthorized if: - the edge E1, E2 or one of the two edges connected to V is a fillet or chamfer, or - a curve other than a straight line or an arc of a circle is used as E, E1 or E2. Do not use the returned chamfer if the status of the construction is not ChFi2d_IsDone.
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E, const TopoDS_Vertex & V, const double D, const double Ang);

		/****** BRepFilletAPI_MakeFillet2d::AddFillet ******/
		/****** md5 signature: a84f2ecb37ce79fd9f012890b8a5db13 ******/
		%feature("compactdefaultargs") AddFillet;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Radius: double

Return
-------
TopoDS_Edge

Description
-----------
Adds a fillet of radius Radius between the two edges adjacent to the vertex V on the face modified by this algorithm. The two edges do not need to be rectilinear. This function returns the fillet and builds the resulting face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the fillet is built, - ChFi2d_ConnexionError if V does not belong to the initial face, - ChFi2d_ComputationError if Radius is too large to build a fillet between the two adjacent edges, - ChFi2d_NotAuthorized - if one of the two edges connected to V is a fillet or chamfer, or - if a curve other than a straight line or an arc of a circle is used as E, E1 or E2. Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone. Exceptions Standard_NegativeValue if Radius is less than or equal to zero.
") AddFillet;
		TopoDS_Edge AddFillet(const TopoDS_Vertex & V, const double Radius);

		/****** BRepFilletAPI_MakeFillet2d::BasisEdge ******/
		/****** md5 signature: c244b8627d4ba515112f85786021bf15 ******/
		%feature("compactdefaultargs") BasisEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopoDS_Edge

Description
-----------
Returns the basis edge on the face modified by this algorithm from which the chamfered or filleted edge E is built. If E has not been modified, this function returns E. Warning E is returned if it does not belong to the initial face.
") BasisEdge;
		const TopoDS_Edge BasisEdge(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet2d::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Update the result and set the Done flag.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFilletAPI_MakeFillet2d::ChamferEdges ******/
		/****** md5 signature: d035805a204108c266e9c5c5713d7853 ******/
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "Return
-------
NCollection_Sequence<TopoDS_Shape>

Description
-----------
Returns the table of chamfers on the face modified by this algorithm.
") ChamferEdges;
		const NCollection_Sequence<TopoDS_Shape> ChamferEdges();

		/****** BRepFilletAPI_MakeFillet2d::DescendantEdge ******/
		/****** md5 signature: aeb8944df5eff8bc10450ec6f2cf0e76 ******/
		%feature("compactdefaultargs") DescendantEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopoDS_Edge

Description
-----------
Returns the chamfered or filleted edge built from the edge E on the face modified by this algorithm. If E has not been modified, this function returns E. Exceptions Standard_NoSuchObject if the edge E does not belong to the initial face.
") DescendantEdge;
		const TopoDS_Edge DescendantEdge(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet2d::FilletEdges ******/
		/****** md5 signature: f48bb40e20f062fc2aa9d6328b83b716 ******/
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "Return
-------
NCollection_Sequence<TopoDS_Shape>

Description
-----------
Returns the table of fillets on the face modified by this algorithm.
") FilletEdges;
		const NCollection_Sequence<TopoDS_Shape> FilletEdges();

		/****** BRepFilletAPI_MakeFillet2d::HasDescendant ******/
		/****** md5 signature: 365b4df1a18354984e8758587033cb70 ******/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
") HasDescendant;
		bool HasDescendant(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet2d::Init ******/
		/****** md5 signature: a8dfaa68079e743e08190fe58d950a9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Initializes this algorithm for constructing fillets or chamfers with the face F. Warning The status of the initialization, as given by the Status function, can be one of the following: - ChFi2d_Ready if the initialization is correct, - ChFi2d_NotPlanar if F is not planar, - ChFi2d_NoFace if F is a null face.
") Init;
		void Init(const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeFillet2d::Init ******/
		/****** md5 signature: 7b460233038b2f415eaddf1e321fc705 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
RefFace: TopoDS_Face
ModFace: TopoDS_Face

Return
-------
None

Description
-----------
This initialize method allow to init the builder from a face RefFace and another face ModFace which derive from RefFace. This is useful to modify a fillet or a chamfer already created on ModFace.
") Init;
		void Init(const TopoDS_Face & RefFace, const TopoDS_Face & ModFace);

		/****** BRepFilletAPI_MakeFillet2d::IsModified ******/
		/****** md5 signature: 0eea89845d0c71c59c5430a4d07e48c8 ******/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns true if the edge E on the face modified by this algorithm is chamfered or filleted. Warning Returns false if E does not belong to the face modified by this algorithm.
") IsModified;
		bool IsModified(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet2d::Modified ******/
		/****** md5 signature: 097d00d6fefea57adcabdba041cb44ee ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & S);

		/****** BRepFilletAPI_MakeFillet2d::ModifyChamfer ******/
		/****** md5 signature: 48770fe1b90a246f42a86504f6052639 ******/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "
Parameters
----------
Chamfer: TopoDS_Edge
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: double
D2: double

Return
-------
TopoDS_Edge

Description
-----------
Modifies the chamfer Chamfer on the face modified by this algorithm, where: E1 and E2 are the two adjacent edges on which Chamfer is already built; the extremities of the new chamfer are on E1 and E2 at distances D1 and D2 respectively.
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E1, const TopoDS_Edge & E2, const double D1, const double D2);

		/****** BRepFilletAPI_MakeFillet2d::ModifyChamfer ******/
		/****** md5 signature: 88297be7ab4391875a8420e4f0462289 ******/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "
Parameters
----------
Chamfer: TopoDS_Edge
E: TopoDS_Edge
D: double
Ang: double

Return
-------
TopoDS_Edge

Description
-----------
Modifies the chamfer Chamfer on the face modified by this algorithm, where: E is one of the two adjacent edges on which Chamfer is already built; the new chamfer makes an angle Ang with E and one of its extremities is on E at distance D from the vertex on which the chamfer is built. In cases where the edges are not rectilinear, the distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the new chamfer and modifies the existing face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the chamfer is built, - ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero, - ChFi2d_ConnexionError if: - the edge E, E1, E2 or Chamfer does not belong to the existing face, or - the edges E1 and E2 are not adjacent, - ChFi2d_ComputationError if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - ChFi2d_NotAuthorized if E1 or E2 is a fillet or chamfer. Do not use the returned chamfer if the status of the construction is not ChFi2d_IsDone.
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E, const double D, const double Ang);

		/****** BRepFilletAPI_MakeFillet2d::ModifyFillet ******/
		/****** md5 signature: 310efa6f21b2095d8f0d06bbb6858c76 ******/
		%feature("compactdefaultargs") ModifyFillet;
		%feature("autodoc", "
Parameters
----------
Fillet: TopoDS_Edge
Radius: double

Return
-------
TopoDS_Edge

Description
-----------
Assigns the radius Radius to the fillet Fillet already built on the face modified by this algorithm. This function returns the new fillet and modifies the existing face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the new fillet is built, - ChFi2d_ConnexionError if Fillet does not belong to the existing face, - ChFi2d_ComputationError if Radius is too large to build a fillet between the two adjacent edges. Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone. Exceptions Standard_NegativeValue if Radius is less than or equal to zero.
") ModifyFillet;
		TopoDS_Edge ModifyFillet(const TopoDS_Edge & Fillet, const double Radius);

		/****** BRepFilletAPI_MakeFillet2d::NbChamfer ******/
		/****** md5 signature: da1616693b22233ebaa8e74f78c82b97 ******/
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of chamfers on the face modified by this algorithm.
") NbChamfer;
		int NbChamfer();

		/****** BRepFilletAPI_MakeFillet2d::NbCurves ******/
		/****** md5 signature: 99661be16aa6b87a1ba6043e7f8f9943 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of new curves after the shape creation.
") NbCurves;
		int NbCurves();

		/****** BRepFilletAPI_MakeFillet2d::NbFillet ******/
		/****** md5 signature: fa9a7e2ccec679d074641669f897d38b ******/
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of fillets on the face modified by this algorithm.
") NbFillet;
		int NbFillet();

		/****** BRepFilletAPI_MakeFillet2d::NewEdges ******/
		/****** md5 signature: ee299d8062fe9e6fdbe28c030e621659 ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Return the Edges created for curve I.
") NewEdges;
		const NCollection_List<TopoDS_Shape> NewEdges(const int I);

		/****** BRepFilletAPI_MakeFillet2d::RemoveChamfer ******/
		/****** md5 signature: e2fe904642b9955c8a660d5a9fc1f9db ******/
		%feature("compactdefaultargs") RemoveChamfer;
		%feature("autodoc", "
Parameters
----------
Chamfer: TopoDS_Edge

Return
-------
TopoDS_Vertex

Description
-----------
Removes the chamfer Chamfer already built on the face modified by this algorithm. This function returns the vertex connecting the two adjacent edges of Chamfer and modifies the existing face. Warning - The returned vertex is only valid if the Status function returns ChFi2d_IsDone. - A null vertex is returned if the edge Chamfer does not belong to the initial face.
") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer(const TopoDS_Edge & Chamfer);

		/****** BRepFilletAPI_MakeFillet2d::RemoveFillet ******/
		/****** md5 signature: c523feaddfccc8fecd7b796c40383670 ******/
		%feature("compactdefaultargs") RemoveFillet;
		%feature("autodoc", "
Parameters
----------
Fillet: TopoDS_Edge

Return
-------
TopoDS_Vertex

Description
-----------
Removes the fillet Fillet already built on the face modified by this algorithm. This function returns the vertex connecting the two adjacent edges of Fillet and modifies the existing face. Warning - The returned vertex is only valid if the Status function returns ChFi2d_IsDone. - A null vertex is returned if the edge Fillet does not belong to the initial face.
") RemoveFillet;
		TopoDS_Vertex RemoveFillet(const TopoDS_Edge & Fillet);

		/****** BRepFilletAPI_MakeFillet2d::Status ******/
		/****** md5 signature: d156d199c4dfd8fe1ae3da07b3861e60 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
ChFi2d_ConstructionError

Description
-----------
No available documentation.
") Status;
		ChFi2d_ConstructionError Status();

};


%extend BRepFilletAPI_MakeFillet2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepFilletAPI_MakeChamfer *
**********************************/
class BRepFilletAPI_MakeChamfer : public BRepFilletAPI_LocalOperation {
	public:
		/****** BRepFilletAPI_MakeChamfer::BRepFilletAPI_MakeChamfer ******/
		/****** md5 signature: 71d1fe71808ad8a56af47ed3fabdc3c6 ******/
		%feature("compactdefaultargs") BRepFilletAPI_MakeChamfer;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Initializes an algorithm for computing chamfers on the shape S. The edges on which chamfers are built are defined using the Add function.
") BRepFilletAPI_MakeChamfer;
		 BRepFilletAPI_MakeChamfer(const TopoDS_Shape & S);

		/****** BRepFilletAPI_MakeChamfer::Abscissa ******/
		/****** md5 signature: f83c1568604e5b1f1ed90cc6eb2a4ea3 ******/
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
Returns the curvilinear abscissa of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") Abscissa;
		double Abscissa(const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeChamfer::Add ******/
		/****** md5 signature: 7f8cf8a4f80c44d7309717c1abef344d ******/
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
Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer must be set after the.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeChamfer::Add ******/
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
Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the distance Dis (symmetric chamfer). The Add function results in a contour being built by propagation from the edge E (i.e. the contour contains at least this edge). This contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. Warning Nothing is done if edge E or the face F does not belong to the initial shape.
") Add;
		void Add(const double Dis, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeChamfer::Add ******/
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
Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the two distances Dis1 and Dis2; the face F identifies the side where Dis1 is measured. The Add function results in a contour being built by propagation from the edge E (i.e. the contour contains at least this edge). This contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. Warning Nothing is done if edge E or the face F does not belong to the initial shape.
") Add;
		void Add(const double Dis1, const double Dis2, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::AddDA ******/
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
Adds a fillet contour in the builder (builds a contour of tangent edges to <E> and sets the distance <Dis1> and angle <Angle> ( parameters of the chamfer ) ).
") AddDA;
		void AddDA(const double Dis, const double Angle, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the chamfers on all the contours in the internal data structure of this algorithm and constructs the resulting shape. Use the function IsDone to verify that the chamfered shape is built. Use the function Shape to retrieve the chamfered shape. Warning The construction of chamfers implements highly complex construction algorithms. Consequently, there may be instances where the algorithm fails, for example if the data defining the parameters of the chamfer is not compatible with the geometry of the initial shape. There is no initial analysis of errors and these only become evident at the construction stage. Additionally, in the current software release, the following cases are not handled: - the end point of the contour is the point of intersection of 4 or more edges of the shape, or - the intersection of the chamfer with a face which limits the contour is not fully contained in this face.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFilletAPI_MakeChamfer::Builder ******/
		/****** md5 signature: c97c63149316e999abd03e780cc959bf ******/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>

Description
-----------
Returns the internal filleting algorithm.
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****** BRepFilletAPI_MakeChamfer::Closed ******/
		/****** md5 signature: 216068a0a03e637eaf547da644dd443f ******/
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
Returns true if the contour of index IC in the internal data structure of this algorithm is closed. Warning Returns false if IC is outside the bounds of the table of contours.
") Closed;
		bool Closed(const int IC);

		/****** BRepFilletAPI_MakeChamfer::ClosedAndTangent ******/
		/****** md5 signature: e0a28a312eae430f891337ec5f78feed ******/
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
eturns true if the contour of index IC in the internal data structure of this algorithm is closed and tangential at the point of closure. Warning Returns false if IC is outside the bounds of the table of contours.
") ClosedAndTangent;
		bool ClosedAndTangent(const int IC);

		/****** BRepFilletAPI_MakeChamfer::Contour ******/
		/****** md5 signature: c9e0d1e33add75f83a92a1b442ac7adf ******/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
int

Description
-----------
Returns the index of the contour in the internal data structure of this algorithm, which contains the edge E of the shape. This function returns 0 if the edge E does not belong to any contour. Warning This index can change if a contour is removed from the internal data structure of this algorithm using the function Remove.
") Contour;
		int Contour(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeChamfer::Dists ******/
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
Returns the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC in the internal data structure of this algorithm. Warning -1. is returned if IC is outside the bounds of the table of contours.
") Dists;
		void Dists(const int IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFilletAPI_MakeChamfer::Edge ******/
		/****** md5 signature: ce6df1da6adbf3ea3a94b75d0b26833e ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge of index J in the contour of index I in the internal data structure of this algorithm. Warning Returns a null shape if: - I is outside the bounds of the table of contours, or - J is outside the bounds of the table of edges of the contour of index I.
") Edge;
		const TopoDS_Edge Edge(const int I, const int J);

		/****** BRepFilletAPI_MakeChamfer::FirstVertex ******/
		/****** md5 signature: 5d2c5f6e4c53af3f811bef71938c8a61 ******/
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
Returns the first vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
") FirstVertex;
		TopoDS_Vertex FirstVertex(const int IC);

		/****** BRepFilletAPI_MakeChamfer::Generated ******/
		/****** md5 signature: 599bb367b0d27bf0fb771e9bddf88254 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
EorV: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes generated from the shape <EorV>.
") Generated;
		const NCollection_List<TopoDS_Shape> Generated(const TopoDS_Shape & EorV);

		/****** BRepFilletAPI_MakeChamfer::GetDist ******/
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
No available documentation.
") GetDist;
		void GetDist(const int IC, Standard_Real &OutValue);

		/****** BRepFilletAPI_MakeChamfer::GetDistAngle ******/
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

		/****** BRepFilletAPI_MakeChamfer::IsDeleted ******/
		/****** md5 signature: 287418bb898b77dec0442680837578c0 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsDeleted;
		bool IsDeleted(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeChamfer::IsDistanceAngle ******/
		/****** md5 signature: 9a6128432a4e273f6688bc0ca3ec47d4 ******/
		%feature("compactdefaultargs") IsDistanceAngle;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
bool

Description
-----------
return True if chamfer is made with distance and angle false else.
") IsDistanceAngle;
		bool IsDistanceAngle(const int IC);

		/****** BRepFilletAPI_MakeChamfer::IsSymetric ******/
		/****** md5 signature: fbb1cb200156dbeef6a7bc171adf4c6c ******/
		%feature("compactdefaultargs") IsSymetric;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
bool

Description
-----------
return True if chamfer symmetric false else.
") IsSymetric;
		bool IsSymetric(const int IC);

		/****** BRepFilletAPI_MakeChamfer::IsTwoDistances ******/
		/****** md5 signature: 35e1b7fb0d59b480e138ed0af1175ee6 ******/
		%feature("compactdefaultargs") IsTwoDistances;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
bool

Description
-----------
return True if chamfer is made with two distances false else.
") IsTwoDistances;
		bool IsTwoDistances(const int IC);

		/****** BRepFilletAPI_MakeChamfer::LastVertex ******/
		/****** md5 signature: e8fc0cba331778d71793674618c11fd6 ******/
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
Returns the last vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
") LastVertex;
		TopoDS_Vertex LastVertex(const int IC);

		/****** BRepFilletAPI_MakeChamfer::Length ******/
		/****** md5 signature: fd8858fffb4b3d17f790d23b99fcea23 ******/
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
Returns the length of the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if IC is outside the bounds of the table of contours.
") Length;
		double Length(const int IC);

		/****** BRepFilletAPI_MakeChamfer::Modified ******/
		/****** md5 signature: 95d5c065993c1070bee9fdb9225954e4 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes modified from the shape <F>.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeChamfer::NbContours ******/
		/****** md5 signature: f8e44d3c13b70146476faf1a4da75633 ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours generated using the Add function in the internal data structure of this algorithm.
") NbContours;
		int NbContours();

		/****** BRepFilletAPI_MakeChamfer::NbEdges ******/
		/****** md5 signature: 9bc4955155f17d28fa8f3a6738304d43 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Returns the number of edges in the contour of index I in the internal data structure of this algorithm. Warning Returns 0 if I is outside the bounds of the table of contours.
") NbEdges;
		int NbEdges(const int I);

		/****** BRepFilletAPI_MakeChamfer::NbSurf ******/
		/****** md5 signature: dfc5e62fa554f0c5fc0f27685b035614 ******/
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

		/****** BRepFilletAPI_MakeChamfer::RelativeAbscissa ******/
		/****** md5 signature: 67003ef9a798cd7fcc1a28a069aaaed5 ******/
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
Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") RelativeAbscissa;
		double RelativeAbscissa(const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeChamfer::Remove ******/
		/****** md5 signature: 5ccd0fdd636b599493219e4cfcf43893 ******/
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
Removes the contour in the internal data structure of this algorithm which contains the edge E of the shape. Warning Nothing is done if the edge E does not belong to the contour in the internal data structure of this algorithm.
") Remove;
		void Remove(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeChamfer::Reset ******/
		/****** md5 signature: 04c18a4fdddaa731450cb6589411aa18 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reinitializes this algorithm, thus canceling the effects of the Build function. This function allows modifications to be made to the contours and chamfer parameters in order to rebuild the shape.
") Reset;
		void Reset();

		/****** BRepFilletAPI_MakeChamfer::ResetContour ******/
		/****** md5 signature: da100e956e78c2f3f66bbfd5533e4e38 ******/
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
Erases the chamfer parameters on the contour of index IC in the internal data structure of this algorithm. Use the SetDists function to reset this data. Warning Nothing is done if IC is outside the bounds of the table of contours.
") ResetContour;
		void ResetContour(const int IC);

		/****** BRepFilletAPI_MakeChamfer::Sect ******/
		/****** md5 signature: 4d7c3cc01e26958dfc3ab073fbaa82cf ******/
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

		/****** BRepFilletAPI_MakeChamfer::SetDist ******/
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
Sets the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC generated using the Add function in the internal data structure of this algorithm. The face F identifies the side where Dis1 is measured. Warning Nothing is done if either the edge E or the face F does not belong to the initial shape.
") SetDist;
		void SetDist(const double Dis, const int IC, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::SetDistAngle ******/
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

		/****** BRepFilletAPI_MakeChamfer::SetDists ******/
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
Sets the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC generated using the Add function in the internal data structure of this algorithm. The face F identifies the side where Dis1 is measured. Warning Nothing is done if either the edge E or the face F does not belong to the initial shape.
") SetDists;
		void SetDists(const double Dis1, const double Dis2, const int IC, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::SetMode ******/
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
Sets the mode of chamfer.
") SetMode;
		void SetMode(const ChFiDS_ChamfMode theMode);

		/****** BRepFilletAPI_MakeChamfer::Simulate ******/
		/****** md5 signature: b2c8a7cde020e0770778f56bb64bb6ee ******/
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


%extend BRepFilletAPI_MakeChamfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFilletAPI_MakeFillet *
*********************************/
class BRepFilletAPI_MakeFillet : public BRepFilletAPI_LocalOperation {
	public:
		/****** BRepFilletAPI_MakeFillet::BRepFilletAPI_MakeFillet ******/
		/****** md5 signature: 10078f81c5a13ef2eb4ab7d106d6b8da ******/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FShape: ChFi3d_FilletShape (optional, default to ChFi3d_Rational)

Return
-------
None

Description
-----------
Initializes the computation of the fillets. <FShape> sets the type of fillet surface. The default value is ChFi3d_Rational (classical nurbs representation of circles). ChFi3d_QuasiAngular corresponds to a nurbs representation of circles which parameterisation matches the circle one. ChFi3d_Polynomial corresponds to a polynomial representation of circles.
") BRepFilletAPI_MakeFillet;
		 BRepFilletAPI_MakeFillet(const TopoDS_Shape & S, const ChFi3d_FilletShape FShape = ChFi3d_Rational);

		/****** BRepFilletAPI_MakeFillet::Abscissa ******/
		/****** md5 signature: f83c1568604e5b1f1ed90cc6eb2a4ea3 ******/
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
Returns the curvilinear abscissa of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") Abscissa;
		double Abscissa(const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeFillet::Add ******/
		/****** md5 signature: 7f8cf8a4f80c44d7309717c1abef344d ******/
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
Adds a fillet contour in the builder (builds a contour of tangent edges). The Radius must be set after.
") Add;
		void Add(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Add ******/
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
Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius.
") Add;
		void Add(const double Radius, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Add ******/
		/****** md5 signature: f5d3f3d4b6a70f079ea3c4ab9cc92764 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds a fillet description in the builder - builds a contour of tangent edges, - sets a linear radius evolution law between the first and last vertex of the spine.
") Add;
		void Add(const double R1, const double R2, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Add ******/
		/****** md5 signature: 323e3737fe1d3ccf8c86d064e231c839 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: Law_Function
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds a fillet description in the builder - builds a contour of tangent edges, - sest the radius evolution law.
") Add;
		void Add(const opencascade::handle<Law_Function> & L, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Add ******/
		/****** md5 signature: 91f55ce104e1697a9f070274e3b60693 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
UandR: NCollection_Array1<gp_Pnt2d>
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius evolution law interpolating the values given in the array UandR: //! p2d.X() = relative parameter on the spine [0,1] p2d.Y() = value of the radius.
") Add;
		void Add(const NCollection_Array1<gp_Pnt2d> & UandR, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::BadShape ******/
		/****** md5 signature: bc4bc683dd2daee18cd73177f824f6ce ******/
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
if (HasResult()) returns the partial result.
") BadShape;
		TopoDS_Shape BadShape();

		/****** BRepFilletAPI_MakeFillet::Build ******/
		/****** md5 signature: f3b0074314a23751c5565edb1d5f04f5 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Builds the fillets on all the contours in the internal data structure of this algorithm and constructs the resulting shape. Use the function IsDone to verify that the filleted shape is built. Use the function Shape to retrieve the filleted shape. Warning The construction of fillets implements highly complex construction algorithms. Consequently, there may be instances where the algorithm fails, for example if the data defining the radius of the fillet is not compatible with the geometry of the initial shape. There is no initial analysis of errors and they only become evident at the construction stage. Additionally, in the current software release, the following cases are not handled: - the end point of the contour is the point of intersection of 4 or more edges of the shape, or - the intersection of the fillet with a face which limits the contour is not fully contained in this face.
") Build;
		void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFilletAPI_MakeFillet::Builder ******/
		/****** md5 signature: c97c63149316e999abd03e780cc959bf ******/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>

Description
-----------
Returns the internal topology building algorithm.
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****** BRepFilletAPI_MakeFillet::Closed ******/
		/****** md5 signature: 216068a0a03e637eaf547da644dd443f ******/
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
Returns true if the contour of index IC in the internal data structure of this algorithm is closed. Warning Returns false if IC is outside the bounds of the table of contours.
") Closed;
		bool Closed(const int IC);

		/****** BRepFilletAPI_MakeFillet::ClosedAndTangent ******/
		/****** md5 signature: e0a28a312eae430f891337ec5f78feed ******/
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
Returns true if the contour of index IC in the internal data structure of this algorithm is closed and tangential at the point of closure. Warning Returns false if IC is outside the bounds of the table of contours.
") ClosedAndTangent;
		bool ClosedAndTangent(const int IC);

		/****** BRepFilletAPI_MakeFillet::ComputedSurface ******/
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
returns the surface number IS concerning the contour IC.
") ComputedSurface;
		opencascade::handle<Geom_Surface> ComputedSurface(const int IC, const int IS);

		/****** BRepFilletAPI_MakeFillet::Contour ******/
		/****** md5 signature: c9e0d1e33add75f83a92a1b442ac7adf ******/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
int

Description
-----------
Returns the index of the contour in the internal data structure of this algorithm which contains the edge E of the shape. This function returns 0 if the edge E does not belong to any contour. Warning This index can change if a contour is removed from the internal data structure of this algorithm using the function Remove.
") Contour;
		int Contour(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Edge ******/
		/****** md5 signature: ce6df1da6adbf3ea3a94b75d0b26833e ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge of index J in the contour of index I in the internal data structure of this algorithm. Warning Returns a null shape if: - I is outside the bounds of the table of contours, or - J is outside the bounds of the table of edges of the index I contour.
") Edge;
		const TopoDS_Edge Edge(const int I, const int J);

		/****** BRepFilletAPI_MakeFillet::FaultyContour ******/
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
for each I in [1.. NbFaultyContours] returns the index IC of the contour where the computation of the fillet failed. the method NbEdges(IC) gives the number of edges in the contour IC the method Edge(IC,ie) gives the edge number ie of the contour IC.
") FaultyContour;
		int FaultyContour(const int I);

		/****** BRepFilletAPI_MakeFillet::FaultyVertex ******/
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
returns the vertex where the computation failed.
") FaultyVertex;
		TopoDS_Vertex FaultyVertex(const int IV);

		/****** BRepFilletAPI_MakeFillet::FirstVertex ******/
		/****** md5 signature: 5d2c5f6e4c53af3f811bef71938c8a61 ******/
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
Returns the first vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
") FirstVertex;
		TopoDS_Vertex FirstVertex(const int IC);

		/****** BRepFilletAPI_MakeFillet::Generated ******/
		/****** md5 signature: 599bb367b0d27bf0fb771e9bddf88254 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
EorV: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes generated from the shape <EorV>.
") Generated;
		const NCollection_List<TopoDS_Shape> Generated(const TopoDS_Shape & EorV);

		/****** BRepFilletAPI_MakeFillet::GetBounds ******/
		/****** md5 signature: 6074bc0a95d0dad129ffc96863913f3f ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
F: double
L: double

Description
-----------
No available documentation.
") GetBounds;
		bool GetBounds(const int IC, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFilletAPI_MakeFillet::GetFilletShape ******/
		/****** md5 signature: 20984b7354615dd8cd27c08187d0e0c2 ******/
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "Return
-------
ChFi3d_FilletShape

Description
-----------
Returns the type of fillet shape built by this algorithm.
") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape();

		/****** BRepFilletAPI_MakeFillet::GetLaw ******/
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
No available documentation.
") GetLaw;
		opencascade::handle<Law_Function> GetLaw(const int IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::HasResult ******/
		/****** md5 signature: 708adea9b732f6b7393066c26f957b86 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if a part of the result has been computed if the filling in a corner failed a shape with a hole is returned.
") HasResult;
		bool HasResult();

		/****** BRepFilletAPI_MakeFillet::IsConstant ******/
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
Returns true if the radius of the fillet along the contour of index IC in the internal data structure of this algorithm is constant, Warning False is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
") IsConstant;
		bool IsConstant(const int IC);

		/****** BRepFilletAPI_MakeFillet::IsConstant ******/
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
Returns true if the radius of the fillet along the edge E of the contour of index IC in the internal data structure of this algorithm is constant. Warning False is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
") IsConstant;
		bool IsConstant(const int IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::IsDeleted ******/
		/****** md5 signature: 287418bb898b77dec0442680837578c0 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsDeleted;
		bool IsDeleted(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeFillet::LastVertex ******/
		/****** md5 signature: e8fc0cba331778d71793674618c11fd6 ******/
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
Returns the last vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
") LastVertex;
		TopoDS_Vertex LastVertex(const int IC);

		/****** BRepFilletAPI_MakeFillet::Length ******/
		/****** md5 signature: fd8858fffb4b3d17f790d23b99fcea23 ******/
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
Returns the length of the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if IC is outside the bounds of the table of contours.
") Length;
		double Length(const int IC);

		/****** BRepFilletAPI_MakeFillet::Modified ******/
		/****** md5 signature: 95d5c065993c1070bee9fdb9225954e4 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Returns the list of shapes modified from the shape <F>.
") Modified;
		const NCollection_List<TopoDS_Shape> Modified(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeFillet::NbComputedSurfaces ******/
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
returns the number of surfaces which have been computed on the contour IC.
") NbComputedSurfaces;
		int NbComputedSurfaces(const int IC);

		/****** BRepFilletAPI_MakeFillet::NbContours ******/
		/****** md5 signature: f8e44d3c13b70146476faf1a4da75633 ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours generated using the Add function in the internal data structure of this algorithm.
") NbContours;
		int NbContours();

		/****** BRepFilletAPI_MakeFillet::NbEdges ******/
		/****** md5 signature: 9bc4955155f17d28fa8f3a6738304d43 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Returns the number of edges in the contour of index I in the internal data structure of this algorithm. Warning Returns 0 if I is outside the bounds of the table of contours.
") NbEdges;
		int NbEdges(const int I);

		/****** BRepFilletAPI_MakeFillet::NbFaultyContours ******/
		/****** md5 signature: bb216792196133a91f0f03474d19e9a2 ******/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours where the computation of the fillet failed.
") NbFaultyContours;
		int NbFaultyContours();

		/****** BRepFilletAPI_MakeFillet::NbFaultyVertices ******/
		/****** md5 signature: d910272c091a68da28c61a1d5c53f323 ******/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of vertices where the computation failed.
") NbFaultyVertices;
		int NbFaultyVertices();

		/****** BRepFilletAPI_MakeFillet::NbSurf ******/
		/****** md5 signature: dfc5e62fa554f0c5fc0f27685b035614 ******/
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

		/****** BRepFilletAPI_MakeFillet::NbSurfaces ******/
		/****** md5 signature: 7e22bdd58e61d1f35b25d270c1134651 ******/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of surfaces after the shape creation.
") NbSurfaces;
		int NbSurfaces();

		/****** BRepFilletAPI_MakeFillet::NewFaces ******/
		/****** md5 signature: dd60552bf40848ddb2fe32db4e76e4a2 ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
Return the faces created for surface <I>.
") NewFaces;
		const NCollection_List<TopoDS_Shape> NewFaces(const int I);

		/****** BRepFilletAPI_MakeFillet::Radius ******/
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
Returns the radius of the fillet along the contour of index IC in the internal data structure of this algorithm Warning - Use this function only if the radius is constant. - -1. is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
") Radius;
		double Radius(const int IC);

		/****** BRepFilletAPI_MakeFillet::Radius ******/
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
Returns the radius of the fillet along the edge E of the contour of index IC in the internal data structure of this algorithm. Warning - Use this function only if the radius is constant. - -1 is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
") Radius;
		double Radius(const int IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::RelativeAbscissa ******/
		/****** md5 signature: 67003ef9a798cd7fcc1a28a069aaaed5 ******/
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
Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") RelativeAbscissa;
		double RelativeAbscissa(const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeFillet::Remove ******/
		/****** md5 signature: 5ccd0fdd636b599493219e4cfcf43893 ******/
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
Removes the contour in the internal data structure of this algorithm which contains the edge E of the shape. Warning Nothing is done if the edge E does not belong to the contour in the internal data structure of this algorithm.
") Remove;
		void Remove(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Reset ******/
		/****** md5 signature: 04c18a4fdddaa731450cb6589411aa18 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reinitializes this algorithm, thus canceling the effects of the Build function. This function allows modifications to be made to the contours and fillet parameters in order to rebuild the shape.
") Reset;
		void Reset();

		/****** BRepFilletAPI_MakeFillet::ResetContour ******/
		/****** md5 signature: da100e956e78c2f3f66bbfd5533e4e38 ******/
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
Erases the radius information on the contour of index IC in the internal data structure of this algorithm. Use the SetRadius function to reset this data. Warning Nothing is done if IC is outside the bounds of the table of contours.
") ResetContour;
		void ResetContour(const int IC);

		/****** BRepFilletAPI_MakeFillet::Sect ******/
		/****** md5 signature: 4d7c3cc01e26958dfc3ab073fbaa82cf ******/
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

		/****** BRepFilletAPI_MakeFillet::SetContinuity ******/
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
Changes the parameters of continiuity InternalContinuity to produce fillet'surfaces with an continuity Ci (i=0,1 or 2). By defaultInternalContinuity = GeomAbs_C1. AngularTolerance is the G1 tolerance between fillet and support'faces.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape InternalContinuity, const double AngularTolerance);

		/****** BRepFilletAPI_MakeFillet::SetFilletShape ******/
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
Assigns FShape as the type of fillet shape built by this algorithm.
") SetFilletShape;
		void SetFilletShape(const ChFi3d_FilletShape FShape);

		/****** BRepFilletAPI_MakeFillet::SetLaw ******/
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
No available documentation.
") SetLaw;
		void SetLaw(const int IC, const TopoDS_Edge & E, const opencascade::handle<Law_Function> & L);

		/****** BRepFilletAPI_MakeFillet::SetParams ******/
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

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: da7556d97995754b718215bfe57679a9 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: double
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where Radius is the radius of the fillet.
") SetRadius;
		void SetRadius(const double Radius, const int IC, const int IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 83e781dbc460f00c23dad7d1a0f63f90 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R1: double
R2: double
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to a linear evolution law defined from R1 to R2, between the first and last vertices of the contour of index IC.
") SetRadius;
		void SetRadius(const double R1, const double R2, const int IC, const int IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 76fd31afc286bf71855f0d677cb0e417 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
L: Law_Function
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law L, between the first and last vertices of the contour of index IC.
") SetRadius;
		void SetRadius(const opencascade::handle<Law_Function> & L, const int IC, const int IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 4c690c5fa01c8ea1833d150430908236 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
UandR: NCollection_Array1<gp_Pnt2d>
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law which interpolates the set of parameter and radius pairs given in the array UandR as follows: - the X coordinate of a point in UandR defines a relative parameter on the contour (i.e. a parameter between 0 and 1), - the Y coordinate of a point in UandR gives the corresponding value of the radius, and the radius evolves between the first and last vertices of the contour of index IC.
") SetRadius;
		void SetRadius(const NCollection_Array1<gp_Pnt2d> & UandR, const int IC, const int IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
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
Assigns Radius as the radius of the fillet on the edge E.
") SetRadius;
		void SetRadius(const double Radius, const int IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
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
No available documentation.
") SetRadius;
		void SetRadius(const double Radius, const int IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeFillet::Simulate ******/
		/****** md5 signature: b2c8a7cde020e0770778f56bb64bb6ee ******/
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

		/****** BRepFilletAPI_MakeFillet::StripeStatus ******/
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
returns the status concerning the contour IC in case of error ChFiDS_Ok: the computation is Ok ChFiDS_StartsolFailure: the computation can't start, perhaps the the radius is too big ChFiDS_TwistedSurface: the computation failed because of a twisted surface ChFiDS_WalkingFailure: there is a problem in the walking ChFiDS_Error: other error different from above.
") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus(const int IC);

};


%extend BRepFilletAPI_MakeFillet {
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
