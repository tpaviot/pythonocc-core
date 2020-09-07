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
%define FILLETSURFDOCSTRING
"FilletSurf module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_filletsurf.html"
%enddef
%module (package="OCC.Core", docstring=FILLETSURFDOCSTRING) FilletSurf


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
#include<FilletSurf_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<ChFi3d_module.hxx>
#include<TopoDS_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Extrema_module.hxx>
#include<Law_module.hxx>
#include<GeomFill_module.hxx>
#include<TopLoc_module.hxx>
#include<ChFiDS_module.hxx>
#include<BRepBlend_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Approx_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<TColGeom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopTools.i
%import Geom.i
%import Geom2d.i
%import ChFi3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum FilletSurf_StatusDone {
	FilletSurf_IsOk = 0,
	FilletSurf_IsNotOk = 1,
	FilletSurf_IsPartial = 2,
};

enum FilletSurf_StatusType {
	FilletSurf_TwoExtremityOnEdge = 0,
	FilletSurf_OneExtremityOnEdge = 1,
	FilletSurf_NoExtremityOnEdge = 2,
};

enum FilletSurf_ErrorTypeStatus {
	FilletSurf_EmptyList = 0,
	FilletSurf_EdgeNotG1 = 1,
	FilletSurf_FacesNotG1 = 2,
	FilletSurf_EdgeNotOnShape = 3,
	FilletSurf_NotSharpEdge = 4,
	FilletSurf_PbFilletCompute = 5,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class FilletSurf_StatusDone(IntEnum):
	FilletSurf_IsOk = 0
	FilletSurf_IsNotOk = 1
	FilletSurf_IsPartial = 2
FilletSurf_IsOk = FilletSurf_StatusDone.FilletSurf_IsOk
FilletSurf_IsNotOk = FilletSurf_StatusDone.FilletSurf_IsNotOk
FilletSurf_IsPartial = FilletSurf_StatusDone.FilletSurf_IsPartial

class FilletSurf_StatusType(IntEnum):
	FilletSurf_TwoExtremityOnEdge = 0
	FilletSurf_OneExtremityOnEdge = 1
	FilletSurf_NoExtremityOnEdge = 2
FilletSurf_TwoExtremityOnEdge = FilletSurf_StatusType.FilletSurf_TwoExtremityOnEdge
FilletSurf_OneExtremityOnEdge = FilletSurf_StatusType.FilletSurf_OneExtremityOnEdge
FilletSurf_NoExtremityOnEdge = FilletSurf_StatusType.FilletSurf_NoExtremityOnEdge

class FilletSurf_ErrorTypeStatus(IntEnum):
	FilletSurf_EmptyList = 0
	FilletSurf_EdgeNotG1 = 1
	FilletSurf_FacesNotG1 = 2
	FilletSurf_EdgeNotOnShape = 3
	FilletSurf_NotSharpEdge = 4
	FilletSurf_PbFilletCompute = 5
FilletSurf_EmptyList = FilletSurf_ErrorTypeStatus.FilletSurf_EmptyList
FilletSurf_EdgeNotG1 = FilletSurf_ErrorTypeStatus.FilletSurf_EdgeNotG1
FilletSurf_FacesNotG1 = FilletSurf_ErrorTypeStatus.FilletSurf_FacesNotG1
FilletSurf_EdgeNotOnShape = FilletSurf_ErrorTypeStatus.FilletSurf_EdgeNotOnShape
FilletSurf_NotSharpEdge = FilletSurf_ErrorTypeStatus.FilletSurf_NotSharpEdge
FilletSurf_PbFilletCompute = FilletSurf_ErrorTypeStatus.FilletSurf_PbFilletCompute
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************************
* class FilletSurf_Builder *
***************************/
class FilletSurf_Builder {
	public:
		/****************** FilletSurf_Builder ******************/
		/**** md5 signature: c321636a39909ce21004c881f9c9aefa ****/
		%feature("compactdefaultargs") FilletSurf_Builder;
		%feature("autodoc", "Initialize of the informations necessary for the computation of the fillet on the shape s from a list of edges e and a radius r. //! ta is the angular tolerance tapp3d is the 3d approximation tolerance tapp2d is the 2d approximation tolerance.

Parameters
----------
S: TopoDS_Shape
E: TopTools_ListOfShape
R: float
Ta: float,optional
	default value is 1.0e-2
Tapp3d: float,optional
	default value is 1.0e-4
Tapp2d: float,optional
	default value is 1.0e-5

Returns
-------
None
") FilletSurf_Builder;
		 FilletSurf_Builder(const TopoDS_Shape & S, const TopTools_ListOfShape & E, const Standard_Real R, const Standard_Real Ta = 1.0e-2, const Standard_Real Tapp3d = 1.0e-4, const Standard_Real Tapp2d = 1.0e-5);

		/****************** CurveOnFace1 ******************/
		/**** md5 signature: 5445bf9792da9fa587841585944e218e ****/
		%feature("compactdefaultargs") CurveOnFace1;
		%feature("autodoc", "Gives the 3d curve of surfacefillet(index) on supportface1(index).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") CurveOnFace1;
		const opencascade::handle<Geom_Curve> & CurveOnFace1(const Standard_Integer Index);

		/****************** CurveOnFace2 ******************/
		/**** md5 signature: 13c5e38bb71d885e22f2d30ac4e13bb8 ****/
		%feature("compactdefaultargs") CurveOnFace2;
		%feature("autodoc", "Gives the 3d curve of surfacefillet(index) on supportface2(index).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") CurveOnFace2;
		const opencascade::handle<Geom_Curve> & CurveOnFace2(const Standard_Integer Index);

		/****************** EndSectionStatus ******************/
		/**** md5 signature: cbcb6a2427b18dd39891e15bca5f255b ****/
		%feature("compactdefaultargs") EndSectionStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
FilletSurf_StatusType
") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Gives the parameter of the fillet on the first edge.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** IsDone ******************/
		/**** md5 signature: 92d7a8cfe6d398ee725e94e6b7921ea2 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Gives the status about the computation of the fillet returns: isok :no problem during the computation isnotok: no result is produced ispartial: the result is partial.

Returns
-------
FilletSurf_StatusDone
") IsDone;
		FilletSurf_StatusDone IsDone();

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Gives the parameter of the fillet on the last edge.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** NbSection ******************/
		/**** md5 signature: 99ee580399a7b9319ad347198b2956ec ****/
		%feature("compactdefaultargs") NbSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexSurf: int

Returns
-------
int
") NbSection;
		Standard_Integer NbSection(const Standard_Integer IndexSurf);

		/****************** NbSurface ******************/
		/**** md5 signature: 6446599441fe76e6ea2e79a625f17c4d ****/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "Gives the number of nubs surfaces of the fillet.

Returns
-------
int
") NbSurface;
		Standard_Integer NbSurface();

		/****************** PCurve1OnFillet ******************/
		/**** md5 signature: 9ca0705edcdde428b40c8d20bfce08a6 ****/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "Gives the pcurve associated to curveonface1(index) on the fillet.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve1OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve1OnFillet(const Standard_Integer Index);

		/****************** PCurve2OnFillet ******************/
		/**** md5 signature: ccada6c70d4b2e28f7d6892bb1ad31ac ****/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "Gives the pcurve associated to curveonsup2(index) on the fillet.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve2OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve2OnFillet(const Standard_Integer Index);

		/****************** PCurveOnFace1 ******************/
		/**** md5 signature: 159d8ccf583c25115cc5cb77c8f6a52e ****/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "Gives the pcurve associated to curvonsup1(index) on the support face.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace1;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace1(const Standard_Integer Index);

		/****************** PCurveOnFace2 ******************/
		/**** md5 signature: 78540fdd470849ffa161899134cc43a4 ****/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "Gives the pcurve associated to curveonsup2(index) on the support face.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace2;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace2(const Standard_Integer Index);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "---purpose computation of the fillet (list of nubs).

Returns
-------
None
") Perform;
		void Perform();

		/****************** Section ******************/
		/**** md5 signature: 929bbd79a6908ae08cf36ef4a533db53 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexSurf: int
IndexSec: int
Circ: Geom_TrimmedCurve

Returns
-------
None
") Section;
		void Section(const Standard_Integer IndexSurf, const Standard_Integer IndexSec, opencascade::handle<Geom_TrimmedCurve> & Circ);

		/****************** Simulate ******************/
		/**** md5 signature: 9676554fe6894b29846ee30e6ab9491e ****/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Simulate;
		void Simulate();

		/****************** StartSectionStatus ******************/
		/**** md5 signature: 44600984cf9e0d8a17bf00b703f45d7d ****/
		%feature("compactdefaultargs") StartSectionStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
FilletSurf_StatusType
") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus();

		/****************** StatusError ******************/
		/**** md5 signature: 5167445f2539889d85097497988c0fab ****/
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "Gives informations about error status if isdone=isnotok returns edgenotg1: the edges are not g1 facesnotg1 : two connected faces on a same support are not g1 edgenotonshape: the edge is not on shape notsharpedge: the edge is not sharp pbfilletcompute: problem during the computation of the fillet.

Returns
-------
FilletSurf_ErrorTypeStatus
") StatusError;
		FilletSurf_ErrorTypeStatus StatusError();

		/****************** SupportFace1 ******************/
		/**** md5 signature: 9ec300c946db55146ba1c9c3bb397e9a ****/
		%feature("compactdefaultargs") SupportFace1;
		%feature("autodoc", "Gives the first support face relative to surfacefillet(index);.

Parameters
----------
Index: int

Returns
-------
TopoDS_Face
") SupportFace1;
		const TopoDS_Face SupportFace1(const Standard_Integer Index);

		/****************** SupportFace2 ******************/
		/**** md5 signature: db7f267e13f2bc34123d3b0e30083068 ****/
		%feature("compactdefaultargs") SupportFace2;
		%feature("autodoc", "Gives the second support face relative to surfacefillet(index);.

Parameters
----------
Index: int

Returns
-------
TopoDS_Face
") SupportFace2;
		const TopoDS_Face SupportFace2(const Standard_Integer Index);

		/****************** SurfaceFillet ******************/
		/**** md5 signature: 84050020d30ed5ec3096fd3fcfa803fd ****/
		%feature("compactdefaultargs") SurfaceFillet;
		%feature("autodoc", "Gives the nubs surface of index index.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Surface>
") SurfaceFillet;
		const opencascade::handle<Geom_Surface> & SurfaceFillet(const Standard_Integer Index);

		/****************** TolApp3d ******************/
		/**** md5 signature: c848ce013cfe22b8b47535c612e0fc54 ****/
		%feature("compactdefaultargs") TolApp3d;
		%feature("autodoc", "Gives the 3d tolerance reached during approximation of surface of index index.

Parameters
----------
Index: int

Returns
-------
float
") TolApp3d;
		Standard_Real TolApp3d(const Standard_Integer Index);

};


%extend FilletSurf_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class FilletSurf_InternalBuilder *
***********************************/
class FilletSurf_InternalBuilder : public ChFi3d_FilBuilder {
	public:
		/****************** FilletSurf_InternalBuilder ******************/
		/**** md5 signature: 1cc870c5e52bfd03475b31ff2c15c7d0 ****/
		%feature("compactdefaultargs") FilletSurf_InternalBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
FShape: ChFi3d_FilletShape,optional
	default value is ChFi3d_Polynomial
Ta: float,optional
	default value is 1.0e-2
Tapp3d: float,optional
	default value is 1.0e-4
Tapp2d: float,optional
	default value is 1.0e-5

Returns
-------
None
") FilletSurf_InternalBuilder;
		 FilletSurf_InternalBuilder(const TopoDS_Shape & S, const ChFi3d_FilletShape FShape = ChFi3d_Polynomial, const Standard_Real Ta = 1.0e-2, const Standard_Real Tapp3d = 1.0e-4, const Standard_Real Tapp2d = 1.0e-5);

		/****************** Add ******************/
		/**** md5 signature: 00451ce1b932f1bab92a7ffea0a8f169 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Initializes the contour with a list of edges 0 : no problem 1 : empty list 2 : the edges are not g1 3 : two connected faces on a same support are not g1 4 : the edge is not on shape 5 : notsharpedge: the edge is not sharp.

Parameters
----------
E: TopTools_ListOfShape
R: float

Returns
-------
int
") Add;
		Standard_Integer Add(const TopTools_ListOfShape & E, const Standard_Real R);

		/****************** CurveOnFace1 ******************/
		/**** md5 signature: 5445bf9792da9fa587841585944e218e ****/
		%feature("compactdefaultargs") CurveOnFace1;
		%feature("autodoc", "Gives the 3d curve of surfacefillet(index) on supportface1(index).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") CurveOnFace1;
		const opencascade::handle<Geom_Curve> & CurveOnFace1(const Standard_Integer Index);

		/****************** CurveOnFace2 ******************/
		/**** md5 signature: 13c5e38bb71d885e22f2d30ac4e13bb8 ****/
		%feature("compactdefaultargs") CurveOnFace2;
		%feature("autodoc", "Gives the 3d curve of surfacefillet(index) on supportface2(index).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") CurveOnFace2;
		const opencascade::handle<Geom_Curve> & CurveOnFace2(const Standard_Integer Index);

		/****************** Done ******************/
		/**** md5 signature: 724727c7a05fccf5b11394f7ea28f04a ****/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Done;
		Standard_Boolean Done();

		/****************** EndSectionStatus ******************/
		/**** md5 signature: cbcb6a2427b18dd39891e15bca5f255b ****/
		%feature("compactdefaultargs") EndSectionStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
FilletSurf_StatusType
") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Gives the parameter of the fillet on the first edge.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Gives the parameter of the fillet on the last edge.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** NbSection ******************/
		/**** md5 signature: 99ee580399a7b9319ad347198b2956ec ****/
		%feature("compactdefaultargs") NbSection;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexSurf: int

Returns
-------
int
") NbSection;
		Standard_Integer NbSection(const Standard_Integer IndexSurf);

		/****************** NbSurface ******************/
		/**** md5 signature: 6446599441fe76e6ea2e79a625f17c4d ****/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "Gives the number of nubs surfaces of the fillet.

Returns
-------
int
") NbSurface;
		Standard_Integer NbSurface();

		/****************** PCurve1OnFillet ******************/
		/**** md5 signature: 9ca0705edcdde428b40c8d20bfce08a6 ****/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "Gives the pcurve associated to curveonface1(index) on the fillet.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve1OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve1OnFillet(const Standard_Integer Index);

		/****************** PCurve2OnFillet ******************/
		/**** md5 signature: ccada6c70d4b2e28f7d6892bb1ad31ac ****/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "Gives the pcurve associated to curveonsup2(index) on the fillet.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve2OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve2OnFillet(const Standard_Integer Index);

		/****************** PCurveOnFace1 ******************/
		/**** md5 signature: 159d8ccf583c25115cc5cb77c8f6a52e ****/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "Gives the pcurve associated to curvonsup1(index) on the support face.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace1;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace1(const Standard_Integer Index);

		/****************** PCurveOnFace2 ******************/
		/**** md5 signature: 78540fdd470849ffa161899134cc43a4 ****/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "Gives the pcurve associated to curveonsup2(index) on the support face.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace2;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace2(const Standard_Integer Index);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** Section ******************/
		/**** md5 signature: 929bbd79a6908ae08cf36ef4a533db53 ****/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexSurf: int
IndexSec: int
Circ: Geom_TrimmedCurve

Returns
-------
None
") Section;
		void Section(const Standard_Integer IndexSurf, const Standard_Integer IndexSec, opencascade::handle<Geom_TrimmedCurve> & Circ);

		/****************** Simulate ******************/
		/**** md5 signature: 9676554fe6894b29846ee30e6ab9491e ****/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Simulate;
		void Simulate();

		/****************** StartSectionStatus ******************/
		/**** md5 signature: 44600984cf9e0d8a17bf00b703f45d7d ****/
		%feature("compactdefaultargs") StartSectionStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
FilletSurf_StatusType
") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus();

		/****************** SupportFace1 ******************/
		/**** md5 signature: 9ec300c946db55146ba1c9c3bb397e9a ****/
		%feature("compactdefaultargs") SupportFace1;
		%feature("autodoc", "Gives the first support face relative to surfacefillet(index);.

Parameters
----------
Index: int

Returns
-------
TopoDS_Face
") SupportFace1;
		const TopoDS_Face SupportFace1(const Standard_Integer Index);

		/****************** SupportFace2 ******************/
		/**** md5 signature: db7f267e13f2bc34123d3b0e30083068 ****/
		%feature("compactdefaultargs") SupportFace2;
		%feature("autodoc", "Gives the second support face relative to surfacefillet(index);.

Parameters
----------
Index: int

Returns
-------
TopoDS_Face
") SupportFace2;
		const TopoDS_Face SupportFace2(const Standard_Integer Index);

		/****************** SurfaceFillet ******************/
		/**** md5 signature: 84050020d30ed5ec3096fd3fcfa803fd ****/
		%feature("compactdefaultargs") SurfaceFillet;
		%feature("autodoc", "Gives the nubs surface of index index.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Surface>
") SurfaceFillet;
		const opencascade::handle<Geom_Surface> & SurfaceFillet(const Standard_Integer Index);

		/****************** TolApp3d ******************/
		/**** md5 signature: c848ce013cfe22b8b47535c612e0fc54 ****/
		%feature("compactdefaultargs") TolApp3d;
		%feature("autodoc", "Gives the 3d tolerance reached during approximation of the surface of index index.

Parameters
----------
Index: int

Returns
-------
float
") TolApp3d;
		Standard_Real TolApp3d(const Standard_Integer Index);

};


%extend FilletSurf_InternalBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
