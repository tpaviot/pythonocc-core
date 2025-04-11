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
#include<ChFiDS_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<ChFi2d_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<ChFi3d_module.hxx>
#include<Law_module.hxx>
#include<TColgp_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepBuilderAPI.i
%import TopoDS.i
%import ChFiDS.i
%import Message.i
%import TopTools.i
%import ChFi2d.i
%import TopOpeBRepBuild.i
%import ChFi3d.i
%import Law.i
%import TColgp.i
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
		/****** md5 signature: 685e083950278023fe2b9d91e626c310 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
float

Description
-----------
returns the abscissa of the vertex V on the contour of index IC.
") Abscissa;
		virtual Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

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
		/****** md5 signature: f2d784ec091d16f009d0d4abc551e18b ******/
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
		virtual Standard_Boolean Closed(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::ClosedAndTangent ******/
		/****** md5 signature: 1df34df9ea5699ae9fcdd7a0c6ab3c55 ******/
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
		virtual Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::Contour ******/
		/****** md5 signature: 1607262cdb3fdc43409df2c8a047c158 ******/
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
		virtual Standard_Integer Contour(const TopoDS_Edge & E);

		/****** BRepFilletAPI_LocalOperation::Edge ******/
		/****** md5 signature: 2a378aa85054fbc60ebbc3bdb4291706 ******/
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
		virtual const TopoDS_Edge Edge(const Standard_Integer I, const Standard_Integer J);

		/****** BRepFilletAPI_LocalOperation::FirstVertex ******/
		/****** md5 signature: edb62d0dca7e84966df1dbe4e0db231c ******/
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
		virtual TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::LastVertex ******/
		/****** md5 signature: 2e51a665fa486cdad69aedcddc5ea895 ******/
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
		virtual TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::Length ******/
		/****** md5 signature: 0f5990c23bfb7630f4521985cdc20661 ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
float

Description
-----------
returns the length the contour of index IC.
") Length;
		virtual Standard_Real Length(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::NbContours ******/
		/****** md5 signature: 216a86c7df03a7204f8e36c8397a6655 ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of contours.
") NbContours;
		virtual Standard_Integer NbContours();

		/****** BRepFilletAPI_LocalOperation::NbEdges ******/
		/****** md5 signature: ff08d209d81fcffcec0e93a4234fa2ef ******/
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
		virtual Standard_Integer NbEdges(const Standard_Integer I);

		/****** BRepFilletAPI_LocalOperation::NbSurf ******/
		/****** md5 signature: 94758173fa1bc551c9a4816d5c798655 ******/
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
		virtual Standard_Integer NbSurf(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::RelativeAbscissa ******/
		/****** md5 signature: 9ec2ec7fe6fa93a375ae95e6fb6df5c7 ******/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
float

Description
-----------
returns the relative abscissa([0.,1.]) of the vertex V on the contour of index IC.
") RelativeAbscissa;
		virtual Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

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
		/****** md5 signature: 3360e863d75166c0b2ec93eb0a91d780 ******/
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
		virtual void ResetContour(const Standard_Integer IC);

		/****** BRepFilletAPI_LocalOperation::Sect ******/
		/****** md5 signature: 588b4bb4aa019a8430a3bad93265ed84 ******/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "
Parameters
----------
IC: int
IS: int

Return
-------
opencascade::handle<ChFiDS_SecHArray1>

Description
-----------
No available documentation.
") Sect;
		virtual opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****** BRepFilletAPI_LocalOperation::Simulate ******/
		/****** md5 signature: b64707fafea4ebf580114b623febba83 ******/
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
		virtual void Simulate(const Standard_Integer IC);

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
		/****** md5 signature: 8ab56100a5f8fd93f4f3849863205ed2 ******/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: float
D2: float

Return
-------
TopoDS_Edge

Description
-----------
Adds a chamfer on the face modified by this algorithm between the two adjacent edges E1 and E2, where the extremities of the chamfer are on E1 and E2 at distances D1 and D2 respectively In cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the chamfer and builds the resulting face.
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real D1, const Standard_Real D2);

		/****** BRepFilletAPI_MakeFillet2d::AddChamfer ******/
		/****** md5 signature: 08ba1f2a5a80f3f12155f274e5ccf476 ******/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
D: float
Ang: float

Return
-------
TopoDS_Edge

Description
-----------
Adds a chamfer on the face modified by this algorithm between the two edges connected by the vertex V, where E is one of the two edges. The chamfer makes an angle Ang with E and one of its extremities is on E at distance D from V. In cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the chamfer and builds the resulting face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the chamfer is built, - ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero, - ChFi2d_ConnexionError if: - the edge E, E1 or E2 does not belong to the initial face, or - the edges E1 and E2 are not adjacent, or - the vertex V is not one of the limit points of the edge E, - ChFi2d_ComputationError if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - ChFi2d_NotAuthorized if: - the edge E1, E2 or one of the two edges connected to V is a fillet or chamfer, or - a curve other than a straight line or an arc of a circle is used as E, E1 or E2. Do not use the returned chamfer if the status of the construction is not ChFi2d_IsDone.
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real D, const Standard_Real Ang);

		/****** BRepFilletAPI_MakeFillet2d::AddFillet ******/
		/****** md5 signature: 0537608457b4aa5c0d47332a8668ac27 ******/
		%feature("compactdefaultargs") AddFillet;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Radius: float

Return
-------
TopoDS_Edge

Description
-----------
Adds a fillet of radius Radius between the two edges adjacent to the vertex V on the face modified by this algorithm. The two edges do not need to be rectilinear. This function returns the fillet and builds the resulting face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the fillet is built, - ChFi2d_ConnexionError if V does not belong to the initial face, - ChFi2d_ComputationError if Radius is too large to build a fillet between the two adjacent edges, - ChFi2d_NotAuthorized - if one of the two edges connected to V is a fillet or chamfer, or - if a curve other than a straight line or an arc of a circle is used as E, E1 or E2. Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone. Exceptions Standard_NegativeValue if Radius is less than or equal to zero.
") AddFillet;
		TopoDS_Edge AddFillet(const TopoDS_Vertex & V, const Standard_Real Radius);

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
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
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
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** BRepFilletAPI_MakeFillet2d::ChamferEdges ******/
		/****** md5 signature: 66edbe74780ce3ab689192aa27e7b595 ******/
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "Return
-------
TopTools_SequenceOfShape

Description
-----------
Returns the table of chamfers on the face modified by this algorithm.
") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges();

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
		/****** md5 signature: 937d4c9906e8077f48db789584514415 ******/
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "Return
-------
TopTools_SequenceOfShape

Description
-----------
Returns the table of fillets on the face modified by this algorithm.
") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges();

		/****** BRepFilletAPI_MakeFillet2d::HasDescendant ******/
		/****** md5 signature: 0541f95951f0773111d16c04ab78f51f ******/
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
		Standard_Boolean HasDescendant(const TopoDS_Edge & E);

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
		/****** md5 signature: 16d68e049352482fa8e513ef481ee475 ******/
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
		Standard_Boolean IsModified(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet2d::Modified ******/
		/****** md5 signature: 73ccfe97b4ed94547a190332224ffe23 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <S>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****** BRepFilletAPI_MakeFillet2d::ModifyChamfer ******/
		/****** md5 signature: f4b34f1306057c0cc8ca5f84d6421d3a ******/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "
Parameters
----------
Chamfer: TopoDS_Edge
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: float
D2: float

Return
-------
TopoDS_Edge

Description
-----------
Modifies the chamfer Chamfer on the face modified by this algorithm, where: E1 and E2 are the two adjacent edges on which Chamfer is already built; the extremities of the new chamfer are on E1 and E2 at distances D1 and D2 respectively.
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real D1, const Standard_Real D2);

		/****** BRepFilletAPI_MakeFillet2d::ModifyChamfer ******/
		/****** md5 signature: 5dc8140e76c07e7e78ad0bb92d51e1c8 ******/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "
Parameters
----------
Chamfer: TopoDS_Edge
E: TopoDS_Edge
D: float
Ang: float

Return
-------
TopoDS_Edge

Description
-----------
Modifies the chamfer Chamfer on the face modified by this algorithm, where: E is one of the two adjacent edges on which Chamfer is already built; the new chamfer makes an angle Ang with E and one of its extremities is on E at distance D from the vertex on which the chamfer is built. In cases where the edges are not rectilinear, the distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the new chamfer and modifies the existing face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the chamfer is built, - ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero, - ChFi2d_ConnexionError if: - the edge E, E1, E2 or Chamfer does not belong to the existing face, or - the edges E1 and E2 are not adjacent, - ChFi2d_ComputationError if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - ChFi2d_NotAuthorized if E1 or E2 is a fillet or chamfer. Do not use the returned chamfer if the status of the construction is not ChFi2d_IsDone.
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E, const Standard_Real D, const Standard_Real Ang);

		/****** BRepFilletAPI_MakeFillet2d::ModifyFillet ******/
		/****** md5 signature: 4ba37be14168b13373613def465683a2 ******/
		%feature("compactdefaultargs") ModifyFillet;
		%feature("autodoc", "
Parameters
----------
Fillet: TopoDS_Edge
Radius: float

Return
-------
TopoDS_Edge

Description
-----------
Assigns the radius Radius to the fillet Fillet already built on the face modified by this algorithm. This function returns the new fillet and modifies the existing face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the new fillet is built, - ChFi2d_ConnexionError if Fillet does not belong to the existing face, - ChFi2d_ComputationError if Radius is too large to build a fillet between the two adjacent edges. Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone. Exceptions Standard_NegativeValue if Radius is less than or equal to zero.
") ModifyFillet;
		TopoDS_Edge ModifyFillet(const TopoDS_Edge & Fillet, const Standard_Real Radius);

		/****** BRepFilletAPI_MakeFillet2d::NbChamfer ******/
		/****** md5 signature: 1531286606ef0261ac4850615d79f229 ******/
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of chamfers on the face modified by this algorithm.
") NbChamfer;
		Standard_Integer NbChamfer();

		/****** BRepFilletAPI_MakeFillet2d::NbCurves ******/
		/****** md5 signature: f7f6dbd981df076443155a5a87b5c223 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of new curves after the shape creation.
") NbCurves;
		Standard_Integer NbCurves();

		/****** BRepFilletAPI_MakeFillet2d::NbFillet ******/
		/****** md5 signature: 213e984e2e53209ba86769e63c780c6f ******/
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of fillets on the face modified by this algorithm.
") NbFillet;
		Standard_Integer NbFillet();

		/****** BRepFilletAPI_MakeFillet2d::NewEdges ******/
		/****** md5 signature: f5408bd77e64eab07f4d88d1d6f0f96e ******/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Return the Edges created for curve I.
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const Standard_Integer I);

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
		/****** md5 signature: c1272cd99453d3fe75c78a84b1ec93d1 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
float

Description
-----------
Returns the curvilinear abscissa of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeChamfer::Add ******/
		/****** md5 signature: 158dbe27a95f019f3e3e393c416defb6 ******/
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
		/****** md5 signature: 5df832e06f6a2a3e7dd74bbc479baf92 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Dis: float
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the distance Dis (symmetric chamfer). The Add function results in a contour being built by propagation from the edge E (i.e. the contour contains at least this edge). This contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. Warning Nothing is done if edge E or the face F does not belong to the initial shape.
") Add;
		void Add(const Standard_Real Dis, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeChamfer::Add ******/
		/****** md5 signature: 3d413aacf4fbe519a69cb102312acd8a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Dis1: float
Dis2: float
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the two distances Dis1 and Dis2; the face F identifies the side where Dis1 is measured. The Add function results in a contour being built by propagation from the edge E (i.e. the contour contains at least this edge). This contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. Warning Nothing is done if edge E or the face F does not belong to the initial shape.
") Add;
		void Add(const Standard_Real Dis1, const Standard_Real Dis2, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::AddDA ******/
		/****** md5 signature: b13fc907617fc4fffa48eb6ecc1c875f ******/
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "
Parameters
----------
Dis: float
Angle: float
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Adds a fillet contour in the builder (builds a contour of tangent edges to <E> and sets the distance <Dis1> and angle <Angle> ( parameters of the chamfer ) ).
") AddDA;
		void AddDA(const Standard_Real Dis, const Standard_Real Angle, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::Build ******/
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
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
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 02e6c60b8d9f01dfb5d5e38943449890 ******/
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
		Standard_Boolean Closed(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::ClosedAndTangent ******/
		/****** md5 signature: 6a080251cdf7f6c13ec7fa541b691f34 ******/
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
		Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::Contour ******/
		/****** md5 signature: 0012e08d6c558bf532f57f5b5c94b6f4 ******/
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
		Standard_Integer Contour(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeChamfer::Dists ******/
		/****** md5 signature: 25b55d4bd35e93f2afa86c7ba6682d7e ******/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
Dis1: float
Dis2: float

Description
-----------
Returns the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC in the internal data structure of this algorithm. Warning -1. is returned if IC is outside the bounds of the table of contours.
") Dists;
		void Dists(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFilletAPI_MakeChamfer::Edge ******/
		/****** md5 signature: ab0618f3051f6e1cc81d0a14c9610b1a ******/
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
		const TopoDS_Edge Edge(const Standard_Integer I, const Standard_Integer J);

		/****** BRepFilletAPI_MakeChamfer::FirstVertex ******/
		/****** md5 signature: a262ebc40fb5085f0b2791b9b6e04cb4 ******/
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
		TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::Generated ******/
		/****** md5 signature: 13e8506b1710abf403653a8e5186dd7b ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
EorV: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <EorV>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & EorV);

		/****** BRepFilletAPI_MakeChamfer::GetDist ******/
		/****** md5 signature: 84c7d3c61b94e48d768b0bb3c4924f47 ******/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
Dis: float

Description
-----------
No available documentation.
") GetDist;
		void GetDist(const Standard_Integer IC, Standard_Real &OutValue);

		/****** BRepFilletAPI_MakeChamfer::GetDistAngle ******/
		/****** md5 signature: ccc047433212c6a4b18b05da6f614d32 ******/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
Dis: float
Angle: float

Description
-----------
gives the distances <Dis> and <Angle> of the fillet contour of index <IC> in the DS.
") GetDistAngle;
		void GetDistAngle(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRepFilletAPI_MakeChamfer::IsDeleted ******/
		/****** md5 signature: 1a016772dc188bec4b890b93a447dc5d ******/
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
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeChamfer::IsDistanceAngle ******/
		/****** md5 signature: d91abadc207eb1a15585586c73ec6c95 ******/
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
		Standard_Boolean IsDistanceAngle(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::IsSymetric ******/
		/****** md5 signature: e834faba1d738c1f857cbe69bcf685bd ******/
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
		Standard_Boolean IsSymetric(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::IsTwoDistances ******/
		/****** md5 signature: 1fcaf0cb56b0e2d373cb7ba4451660a9 ******/
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
		Standard_Boolean IsTwoDistances(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::LastVertex ******/
		/****** md5 signature: b468acdc6948a696cfe4165f7db11707 ******/
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
		TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::Length ******/
		/****** md5 signature: 45912d0a5b273ecda386becc07851efe ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
float

Description
-----------
Returns the length of the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if IC is outside the bounds of the table of contours.
") Length;
		Standard_Real Length(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::Modified ******/
		/****** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <F>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeChamfer::NbContours ******/
		/****** md5 signature: 96cfb7456cba5a5f3d9829cc0a5d6cff ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours generated using the Add function in the internal data structure of this algorithm.
") NbContours;
		Standard_Integer NbContours();

		/****** BRepFilletAPI_MakeChamfer::NbEdges ******/
		/****** md5 signature: bcdcd6136c58b5ad06794eab61b25047 ******/
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
		Standard_Integer NbEdges(const Standard_Integer I);

		/****** BRepFilletAPI_MakeChamfer::NbSurf ******/
		/****** md5 signature: 19ca6ce4b38bdddfb7a66dc59f24630c ******/
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
		Standard_Integer NbSurf(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::RelativeAbscissa ******/
		/****** md5 signature: 026d361ab8f3164945f4338c5f2d9fa0 ******/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
float

Description
-----------
Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") RelativeAbscissa;
		Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeChamfer::Remove ******/
		/****** md5 signature: babf336eaca6f4d92baa94dc54d40636 ******/
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
		/****** md5 signature: cb8313136e29e24d2daa65a71dcb185d ******/
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
		/****** md5 signature: d313242387b63d0161ab68e3714287cc ******/
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
		void ResetContour(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeChamfer::Sect ******/
		/****** md5 signature: 4858fd2ad3b58a420ddec56998ee716c ******/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "
Parameters
----------
IC: int
IS: int

Return
-------
opencascade::handle<ChFiDS_SecHArray1>

Description
-----------
No available documentation.
") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****** BRepFilletAPI_MakeChamfer::SetDist ******/
		/****** md5 signature: 789e30011f188a91019292809e2bc8e3 ******/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "
Parameters
----------
Dis: float
IC: int
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC generated using the Add function in the internal data structure of this algorithm. The face F identifies the side where Dis1 is measured. Warning Nothing is done if either the edge E or the face F does not belong to the initial shape.
") SetDist;
		void SetDist(const Standard_Real Dis, const Standard_Integer IC, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::SetDistAngle ******/
		/****** md5 signature: 9a08ff085bc7ed451624212f4387c5cd ******/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "
Parameters
----------
Dis: float
Angle: float
IC: int
F: TopoDS_Face

Return
-------
None

Description
-----------
set the distance <Dis> and <Angle> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>.
") SetDistAngle;
		void SetDistAngle(const Standard_Real Dis, const Standard_Real Angle, const Standard_Integer IC, const TopoDS_Face & F);

		/****** BRepFilletAPI_MakeChamfer::SetDists ******/
		/****** md5 signature: 74f8c6096ad0cd9495a44c102ab48955 ******/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "
Parameters
----------
Dis1: float
Dis2: float
IC: int
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC generated using the Add function in the internal data structure of this algorithm. The face F identifies the side where Dis1 is measured. Warning Nothing is done if either the edge E or the face F does not belong to the initial shape.
") SetDists;
		void SetDists(const Standard_Real Dis1, const Standard_Real Dis2, const Standard_Integer IC, const TopoDS_Face & F);

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
		/****** md5 signature: 1ea1b1b8e2a939c9afdcc43cb9cc1b70 ******/
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
		void Simulate(const Standard_Integer IC);

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
		/****** md5 signature: c1272cd99453d3fe75c78a84b1ec93d1 ******/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
float

Description
-----------
Returns the curvilinear abscissa of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeFillet::Add ******/
		/****** md5 signature: 158dbe27a95f019f3e3e393c416defb6 ******/
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
		/****** md5 signature: 76561d24a6bc7a4c8b9703f8ada723d1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Radius: float
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius.
") Add;
		void Add(const Standard_Real Radius, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Add ******/
		/****** md5 signature: 12a5f893581949820526de05e3822fe9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
R1: float
R2: float
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds a fillet description in the builder - builds a contour of tangent edges, - sets a linear radius evolution law between the first and last vertex of the spine.
") Add;
		void Add(const Standard_Real R1, const Standard_Real R2, const TopoDS_Edge & E);

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
		/****** md5 signature: f2b501b589860daa800328e43cf6d72c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
UandR: TColgp_Array1OfPnt2d
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius evolution law interpolating the values given in the array UandR: //! p2d.X() = relative parameter on the spine [0,1] p2d.Y() = value of the radius.
") Add;
		void Add(const TColgp_Array1OfPnt2d & UandR, const TopoDS_Edge & E);

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
		/****** md5 signature: 58900897d55d51e349b2e40a091ec26f ******/
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
		virtual void Build(const Message_ProgressRange & theRange = Message_ProgressRange());

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
		/****** md5 signature: 02e6c60b8d9f01dfb5d5e38943449890 ******/
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
		Standard_Boolean Closed(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::ClosedAndTangent ******/
		/****** md5 signature: 6a080251cdf7f6c13ec7fa541b691f34 ******/
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
		Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::ComputedSurface ******/
		/****** md5 signature: 96c489b28233f30f53d28540eaf6a6c2 ******/
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
		opencascade::handle<Geom_Surface> ComputedSurface(const Standard_Integer IC, const Standard_Integer IS);

		/****** BRepFilletAPI_MakeFillet::Contour ******/
		/****** md5 signature: 0012e08d6c558bf532f57f5b5c94b6f4 ******/
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
		Standard_Integer Contour(const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::Edge ******/
		/****** md5 signature: ab0618f3051f6e1cc81d0a14c9610b1a ******/
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
		const TopoDS_Edge Edge(const Standard_Integer I, const Standard_Integer J);

		/****** BRepFilletAPI_MakeFillet::FaultyContour ******/
		/****** md5 signature: 21156686a769d644f96890ea34047e80 ******/
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
		Standard_Integer FaultyContour(const Standard_Integer I);

		/****** BRepFilletAPI_MakeFillet::FaultyVertex ******/
		/****** md5 signature: a045d17950f9e0d223a11a5a00a22d52 ******/
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
		TopoDS_Vertex FaultyVertex(const Standard_Integer IV);

		/****** BRepFilletAPI_MakeFillet::FirstVertex ******/
		/****** md5 signature: a262ebc40fb5085f0b2791b9b6e04cb4 ******/
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
		TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::Generated ******/
		/****** md5 signature: 13e8506b1710abf403653a8e5186dd7b ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
EorV: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes generated from the shape <EorV>.
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & EorV);

		/****** BRepFilletAPI_MakeFillet::GetBounds ******/
		/****** md5 signature: a514948d9789a32d7fd6a1f1678a9740 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
F: float
L: float

Description
-----------
No available documentation.
") GetBounds;
		Standard_Boolean GetBounds(const Standard_Integer IC, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: ddf4e7699933a83df3959c22378f680c ******/
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
		opencascade::handle<Law_Function> GetLaw(const Standard_Integer IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::HasResult ******/
		/****** md5 signature: 345d4b0f7e88f528928167976d8256d5 ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if a part of the result has been computed if the filling in a corner failed a shape with a hole is returned.
") HasResult;
		Standard_Boolean HasResult();

		/****** BRepFilletAPI_MakeFillet::IsConstant ******/
		/****** md5 signature: 524ff18247c3bd6dd3b77ea2fbe631ab ******/
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
		Standard_Boolean IsConstant(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::IsConstant ******/
		/****** md5 signature: 257d5c150f15059bb7c72ce611d410fc ******/
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
		Standard_Boolean IsConstant(const Standard_Integer IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::IsDeleted ******/
		/****** md5 signature: 1a016772dc188bec4b890b93a447dc5d ******/
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
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeFillet::LastVertex ******/
		/****** md5 signature: b468acdc6948a696cfe4165f7db11707 ******/
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
		TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::Length ******/
		/****** md5 signature: 45912d0a5b273ecda386becc07851efe ******/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
float

Description
-----------
Returns the length of the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if IC is outside the bounds of the table of contours.
") Length;
		Standard_Real Length(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::Modified ******/
		/****** md5 signature: d47f6d180f47cfcfacc0413e7ca407b6 ******/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of shapes modified from the shape <F>.
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****** BRepFilletAPI_MakeFillet::NbComputedSurfaces ******/
		/****** md5 signature: 164cfd056526b3a43cae9bf77f5c8661 ******/
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
		Standard_Integer NbComputedSurfaces(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::NbContours ******/
		/****** md5 signature: 96cfb7456cba5a5f3d9829cc0a5d6cff ******/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours generated using the Add function in the internal data structure of this algorithm.
") NbContours;
		Standard_Integer NbContours();

		/****** BRepFilletAPI_MakeFillet::NbEdges ******/
		/****** md5 signature: bcdcd6136c58b5ad06794eab61b25047 ******/
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
		Standard_Integer NbEdges(const Standard_Integer I);

		/****** BRepFilletAPI_MakeFillet::NbFaultyContours ******/
		/****** md5 signature: f1fb95ba8b7e9b0d24a588c92bfcc422 ******/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of contours where the computation of the fillet failed.
") NbFaultyContours;
		Standard_Integer NbFaultyContours();

		/****** BRepFilletAPI_MakeFillet::NbFaultyVertices ******/
		/****** md5 signature: e14cf31fcf2094c6ecb0e40d167aeb3c ******/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of vertices where the computation failed.
") NbFaultyVertices;
		Standard_Integer NbFaultyVertices();

		/****** BRepFilletAPI_MakeFillet::NbSurf ******/
		/****** md5 signature: 19ca6ce4b38bdddfb7a66dc59f24630c ******/
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
		Standard_Integer NbSurf(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::NbSurfaces ******/
		/****** md5 signature: fbc438e1ec12b28d849e6d0aeb23caaa ******/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of surfaces after the shape creation.
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****** BRepFilletAPI_MakeFillet::NewFaces ******/
		/****** md5 signature: 1dc1740674b05cd6d91d56cc7e21ab50 ******/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
Return the faces created for surface <I>.
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****** BRepFilletAPI_MakeFillet::Radius ******/
		/****** md5 signature: fa1b61b1f5b63be2bd1c45ff84f2e774 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
IC: int

Return
-------
float

Description
-----------
Returns the radius of the fillet along the contour of index IC in the internal data structure of this algorithm Warning - Use this function only if the radius is constant. - -1. is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
") Radius;
		Standard_Real Radius(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::Radius ******/
		/****** md5 signature: f7159c67e3b0c71e38b6204368bc2c9e ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "
Parameters
----------
IC: int
E: TopoDS_Edge

Return
-------
float

Description
-----------
Returns the radius of the fillet along the edge E of the contour of index IC in the internal data structure of this algorithm. Warning - Use this function only if the radius is constant. - -1 is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
") Radius;
		Standard_Real Radius(const Standard_Integer IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::RelativeAbscissa ******/
		/****** md5 signature: 026d361ab8f3164945f4338c5f2d9fa0 ******/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "
Parameters
----------
IC: int
V: TopoDS_Vertex

Return
-------
float

Description
-----------
Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
") RelativeAbscissa;
		Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeFillet::Remove ******/
		/****** md5 signature: babf336eaca6f4d92baa94dc54d40636 ******/
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
		/****** md5 signature: cb8313136e29e24d2daa65a71dcb185d ******/
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
		/****** md5 signature: d313242387b63d0161ab68e3714287cc ******/
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
		void ResetContour(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::Sect ******/
		/****** md5 signature: 4858fd2ad3b58a420ddec56998ee716c ******/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "
Parameters
----------
IC: int
IS: int

Return
-------
opencascade::handle<ChFiDS_SecHArray1>

Description
-----------
No available documentation.
") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****** BRepFilletAPI_MakeFillet::SetContinuity ******/
		/****** md5 signature: c492356a15562b146506665d8c5d1b77 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
InternalContinuity: GeomAbs_Shape
AngularTolerance: float

Return
-------
None

Description
-----------
Changes the parameters of continiuity InternalContinuity to produce fillet'surfaces with an continuity Ci (i=0,1 or 2). By defaultInternalContinuity = GeomAbs_C1. AngularTolerance is the G1 tolerance between fillet and support'faces.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape InternalContinuity, const Standard_Real AngularTolerance);

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
		/****** md5 signature: 6b759d0a0e31e3dac6b56c3c9951b79f ******/
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
		void SetLaw(const Standard_Integer IC, const TopoDS_Edge & E, const opencascade::handle<Law_Function> & L);

		/****** BRepFilletAPI_MakeFillet::SetParams ******/
		/****** md5 signature: dd3731c1527f95a9443df47a6b3a54d4 ******/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "
Parameters
----------
Tang: float
Tesp: float
T2d: float
TApp3d: float
TolApp2d: float
Fleche: float

Return
-------
None

Description
-----------
No available documentation.
") SetParams;
		void SetParams(const Standard_Real Tang, const Standard_Real Tesp, const Standard_Real T2d, const Standard_Real TApp3d, const Standard_Real TolApp2d, const Standard_Real Fleche);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: bfcf0db73a6fdec8f7b106f7dde09942 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: float
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where Radius is the radius of the fillet.
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const Standard_Integer IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 17b808e15085a3493392830537619fa3 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
R1: float
R2: float
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to a linear evolution law defined from R1 to R2, between the first and last vertices of the contour of index IC.
") SetRadius;
		void SetRadius(const Standard_Real R1, const Standard_Real R2, const Standard_Integer IC, const Standard_Integer IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 9b4b438ad3c91063001d4fb5371a7255 ******/
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
		void SetRadius(const opencascade::handle<Law_Function> & L, const Standard_Integer IC, const Standard_Integer IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 88fec8db529c6c83ce4223c86a27e33c ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
UandR: TColgp_Array1OfPnt2d
IC: int
IinC: int

Return
-------
None

Description
-----------
Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law which interpolates the set of parameter and radius pairs given in the array UandR as follows: - the X coordinate of a point in UandR defines a relative parameter on the contour (i.e. a parameter between 0 and 1), - the Y coordinate of a point in UandR gives the corresponding value of the radius, and the radius evolves between the first and last vertices of the contour of index IC.
") SetRadius;
		void SetRadius(const TColgp_Array1OfPnt2d & UandR, const Standard_Integer IC, const Standard_Integer IinC);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 56cd0b711b7c7a0a5ac3f46e84fd6fe3 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: float
IC: int
E: TopoDS_Edge

Return
-------
None

Description
-----------
Assigns Radius as the radius of the fillet on the edge E.
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Edge & E);

		/****** BRepFilletAPI_MakeFillet::SetRadius ******/
		/****** md5 signature: 8c455c2795828e4085759369fbb8b830 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
Radius: float
IC: int
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Vertex & V);

		/****** BRepFilletAPI_MakeFillet::Simulate ******/
		/****** md5 signature: 1ea1b1b8e2a939c9afdcc43cb9cc1b70 ******/
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
		void Simulate(const Standard_Integer IC);

		/****** BRepFilletAPI_MakeFillet::StripeStatus ******/
		/****** md5 signature: 7b8afd101ec5ebd9cd37e2bc2cfd73ff ******/
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
		ChFiDS_ErrorStatus StripeStatus(const Standard_Integer IC);

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
