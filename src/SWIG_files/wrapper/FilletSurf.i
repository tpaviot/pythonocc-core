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
%define FILLETSURFDOCSTRING
"FilletSurf module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_filletsurf.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<IntSurf_module.hxx>
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
enum FilletSurf_ErrorTypeStatus {
	FilletSurf_EmptyList = 0,
	FilletSurf_EdgeNotG1 = 1,
	FilletSurf_FacesNotG1 = 2,
	FilletSurf_EdgeNotOnShape = 3,
	FilletSurf_NotSharpEdge = 4,
	FilletSurf_PbFilletCompute = 5,
};

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

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

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
		/****** FilletSurf_Builder::FilletSurf_Builder ******/
		/****** md5 signature: 23de7183d83e7d7d3ee8864518f4ed6f ******/
		%feature("compactdefaultargs") FilletSurf_Builder;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
E: TopTools_ListOfShape
R: double
Ta: double (optional, default to 1.0e-2)
Tapp3d: double (optional, default to 1.0e-4)
Tapp2d: double (optional, default to 1.0e-5)

Return
-------
None

Description
-----------
initialize of the information necessary for the computation of the fillet on the Shape S from a list of edges E and a radius R. //! Ta is the angular tolerance Tapp3d is the 3d approximation tolerance Tapp2d is the 2d approximation tolerance.
") FilletSurf_Builder;
		 FilletSurf_Builder(const TopoDS_Shape & S, const TopTools_ListOfShape & E, const double R, const double Ta = 1.0e-2, const double Tapp3d = 1.0e-4, const double Tapp2d = 1.0e-5);

		/****** FilletSurf_Builder::CurveOnFace1 ******/
		/****** md5 signature: 51f2abc0c2227189add087172cf7b0eb ******/
		%feature("compactdefaultargs") CurveOnFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
gives the 3d curve of SurfaceFillet(Index) on SupportFace1(Index).
") CurveOnFace1;
		const opencascade::handle<Geom_Curve> & CurveOnFace1(const int Index);

		/****** FilletSurf_Builder::CurveOnFace2 ******/
		/****** md5 signature: 2e7497073f93c9f42cc9465932481abe ******/
		%feature("compactdefaultargs") CurveOnFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
gives the 3d curve of SurfaceFillet(Index) on SupportFace2(Index).
") CurveOnFace2;
		const opencascade::handle<Geom_Curve> & CurveOnFace2(const int Index);

		/****** FilletSurf_Builder::EndSectionStatus ******/
		/****** md5 signature: cbcb6a2427b18dd39891e15bca5f255b ******/
		%feature("compactdefaultargs") EndSectionStatus;
		%feature("autodoc", "Return
-------
FilletSurf_StatusType

Description
-----------
No available documentation.
") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus();

		/****** FilletSurf_Builder::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
gives the parameter of the fillet on the first edge.
") FirstParameter;
		double FirstParameter();

		/****** FilletSurf_Builder::IsDone ******/
		/****** md5 signature: 92d7a8cfe6d398ee725e94e6b7921ea2 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
FilletSurf_StatusDone

Description
-----------
gives the status about the computation of the fillet returns: IsOK :no problem during the computation IsNotOk: no result is produced IsPartial: the result is partial.
") IsDone;
		FilletSurf_StatusDone IsDone();

		/****** FilletSurf_Builder::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
gives the parameter of the fillet on the last edge.
") LastParameter;
		double LastParameter();

		/****** FilletSurf_Builder::NbSection ******/
		/****** md5 signature: ee1a9ef6b0d1b7c3d5f1f625d50de534 ******/
		%feature("compactdefaultargs") NbSection;
		%feature("autodoc", "
Parameters
----------
IndexSurf: int

Return
-------
int

Description
-----------
No available documentation.
") NbSection;
		int NbSection(const int IndexSurf);

		/****** FilletSurf_Builder::NbSurface ******/
		/****** md5 signature: 6742e3e416ad0dc5eaa559b4cc81126f ******/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives the number of NUBS surfaces of the Fillet.
") NbSurface;
		int NbSurface();

		/****** FilletSurf_Builder::PCurve1OnFillet ******/
		/****** md5 signature: 1ba98cfbea91b9ca83237579e12d1b19 ******/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnFace1(Index) on the Fillet.
") PCurve1OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve1OnFillet(const int Index);

		/****** FilletSurf_Builder::PCurve2OnFillet ******/
		/****** md5 signature: e5e26bea5172254552331a76190ba816 ******/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnSup2(Index) on the fillet.
") PCurve2OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve2OnFillet(const int Index);

		/****** FilletSurf_Builder::PCurveOnFace1 ******/
		/****** md5 signature: f4da02ae970a4638816a5cb35927651e ******/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurvOnSup1(Index) on the support face.
") PCurveOnFace1;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace1(const int Index);

		/****** FilletSurf_Builder::PCurveOnFace2 ******/
		/****** md5 signature: 0fd6c3efddc5e823509467ebd9329fb0 ******/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnSup2(Index) on the support face.
") PCurveOnFace2;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace2(const int Index);

		/****** FilletSurf_Builder::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
---Purpose computation of the fillet (list of NUBS).
") Perform;
		void Perform();

		/****** FilletSurf_Builder::Section ******/
		/****** md5 signature: 34370f9391f8bdfae3c33d0abe2f81dd ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
IndexSurf: int
IndexSec: int

Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the arc of the section of index IndexSec of surface of index IndexSurf. The basis curve of the trimmed curve is a Geom_Circle. 
Input parameter: IndexSurf 1-based surface index 
Input parameter: IndexSec 1-based section index 
Return: the section as a trimmed circular arc.
") Section;
		opencascade::handle<Geom_TrimmedCurve> Section(const int IndexSurf, const int IndexSec);

		/****** FilletSurf_Builder::Section ******/
		/****** md5 signature: ff89a1df5bbc210cbc2da8523e65c3c2 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
IndexSurf: int
IndexSec: int
Circ: Geom_TrimmedCurve

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const int IndexSurf, const int IndexSec, opencascade::handle<Geom_TrimmedCurve> & Circ);

		/****** FilletSurf_Builder::Simulate ******/
		/****** md5 signature: 9676554fe6894b29846ee30e6ab9491e ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Simulate;
		void Simulate();

		/****** FilletSurf_Builder::StartSectionStatus ******/
		/****** md5 signature: 44600984cf9e0d8a17bf00b703f45d7d ******/
		%feature("compactdefaultargs") StartSectionStatus;
		%feature("autodoc", "Return
-------
FilletSurf_StatusType

Description
-----------
No available documentation.
") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus();

		/****** FilletSurf_Builder::StatusError ******/
		/****** md5 signature: 5167445f2539889d85097497988c0fab ******/
		%feature("compactdefaultargs") StatusError;
		%feature("autodoc", "Return
-------
FilletSurf_ErrorTypeStatus

Description
-----------
gives information about error status if IsDone=IsNotOk returns EdgeNotG1: the edges are not G1 FacesNotG1: two connected faces on a same support are not G1 EdgeNotOnShape: the edge is not on shape NotSharpEdge: the edge is not sharp PbFilletCompute: problem during the computation of the fillet.
") StatusError;
		FilletSurf_ErrorTypeStatus StatusError();

		/****** FilletSurf_Builder::SupportFace1 ******/
		/****** md5 signature: 00a16dca5fc7c2a8474725138be5c11b ******/
		%feature("compactdefaultargs") SupportFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Face

Description
-----------
gives the first support face relative to SurfaceFillet(Index);.
") SupportFace1;
		const TopoDS_Face SupportFace1(const int Index);

		/****** FilletSurf_Builder::SupportFace2 ******/
		/****** md5 signature: 887e2c234a1a06929d818f32e7d20114 ******/
		%feature("compactdefaultargs") SupportFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Face

Description
-----------
gives the second support face relative to SurfaceFillet(Index);.
") SupportFace2;
		const TopoDS_Face SupportFace2(const int Index);

		/****** FilletSurf_Builder::SurfaceFillet ******/
		/****** md5 signature: 01f68a5e23c126a2585d08299747e6df ******/
		%feature("compactdefaultargs") SurfaceFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
gives the NUBS surface of index Index.
") SurfaceFillet;
		const opencascade::handle<Geom_Surface> & SurfaceFillet(const int Index);

		/****** FilletSurf_Builder::TolApp3d ******/
		/****** md5 signature: ada6fc8b3d1862f2544e832e8805a8cd ******/
		%feature("compactdefaultargs") TolApp3d;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
gives the 3d tolerance reached during approximation of surface of index Index.
") TolApp3d;
		double TolApp3d(const int Index);

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
		/****** FilletSurf_InternalBuilder::FilletSurf_InternalBuilder ******/
		/****** md5 signature: 188c616e7abe9a10b93e491e7b6f7bf4 ******/
		%feature("compactdefaultargs") FilletSurf_InternalBuilder;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FShape: ChFi3d_FilletShape (optional, default to ChFi3d_Polynomial)
Ta: double (optional, default to 1.0e-2)
Tapp3d: double (optional, default to 1.0e-4)
Tapp2d: double (optional, default to 1.0e-5)

Return
-------
None

Description
-----------
No available documentation.
") FilletSurf_InternalBuilder;
		 FilletSurf_InternalBuilder(const TopoDS_Shape & S, const ChFi3d_FilletShape FShape = ChFi3d_Polynomial, const double Ta = 1.0e-2, const double Tapp3d = 1.0e-4, const double Tapp2d = 1.0e-5);

		/****** FilletSurf_InternalBuilder::Add ******/
		/****** md5 signature: bed982e871873b96f38a580ee4bf5958 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopTools_ListOfShape
R: double

Return
-------
int

Description
-----------
Initializes the contour with a list of Edges 0: no problem 1: empty list 2: the edges are not G1 3: two connected faces on a same support are not G1 4: the edge is not on shape 5: NotSharpEdge: the edge is not sharp.
") Add;
		int Add(const TopTools_ListOfShape & E, const double R);

		/****** FilletSurf_InternalBuilder::CurveOnFace1 ******/
		/****** md5 signature: 51f2abc0c2227189add087172cf7b0eb ******/
		%feature("compactdefaultargs") CurveOnFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
gives the 3d curve of SurfaceFillet(Index) on SupportFace1(Index).
") CurveOnFace1;
		const opencascade::handle<Geom_Curve> & CurveOnFace1(const int Index);

		/****** FilletSurf_InternalBuilder::CurveOnFace2 ******/
		/****** md5 signature: 2e7497073f93c9f42cc9465932481abe ******/
		%feature("compactdefaultargs") CurveOnFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
gives the 3d curve of SurfaceFillet(Index) on SupportFace2(Index).
") CurveOnFace2;
		const opencascade::handle<Geom_Curve> & CurveOnFace2(const int Index);

		/****** FilletSurf_InternalBuilder::Done ******/
		/****** md5 signature: dfe3643b0372f67c18c423ae8350dbe0 ******/
		%feature("compactdefaultargs") Done;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Done;
		bool Done();

		/****** FilletSurf_InternalBuilder::EndSectionStatus ******/
		/****** md5 signature: cbcb6a2427b18dd39891e15bca5f255b ******/
		%feature("compactdefaultargs") EndSectionStatus;
		%feature("autodoc", "Return
-------
FilletSurf_StatusType

Description
-----------
No available documentation.
") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus();

		/****** FilletSurf_InternalBuilder::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
gives the parameter of the fillet on the first edge.
") FirstParameter;
		double FirstParameter();

		/****** FilletSurf_InternalBuilder::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
gives the parameter of the fillet on the last edge.
") LastParameter;
		double LastParameter();

		/****** FilletSurf_InternalBuilder::NbSection ******/
		/****** md5 signature: ee1a9ef6b0d1b7c3d5f1f625d50de534 ******/
		%feature("compactdefaultargs") NbSection;
		%feature("autodoc", "
Parameters
----------
IndexSurf: int

Return
-------
int

Description
-----------
No available documentation.
") NbSection;
		int NbSection(const int IndexSurf);

		/****** FilletSurf_InternalBuilder::NbSurface ******/
		/****** md5 signature: 6742e3e416ad0dc5eaa559b4cc81126f ******/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "Return
-------
int

Description
-----------
gives the number of NUBS surfaces of the Fillet.
") NbSurface;
		int NbSurface();

		/****** FilletSurf_InternalBuilder::PCurve1OnFillet ******/
		/****** md5 signature: 1ba98cfbea91b9ca83237579e12d1b19 ******/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnFace1(Index) on the Fillet.
") PCurve1OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve1OnFillet(const int Index);

		/****** FilletSurf_InternalBuilder::PCurve2OnFillet ******/
		/****** md5 signature: e5e26bea5172254552331a76190ba816 ******/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnSup2(Index) on the fillet.
") PCurve2OnFillet;
		const opencascade::handle<Geom2d_Curve> & PCurve2OnFillet(const int Index);

		/****** FilletSurf_InternalBuilder::PCurveOnFace1 ******/
		/****** md5 signature: f4da02ae970a4638816a5cb35927651e ******/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurvOnSup1(Index) on the support face.
") PCurveOnFace1;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace1(const int Index);

		/****** FilletSurf_InternalBuilder::PCurveOnFace2 ******/
		/****** md5 signature: 0fd6c3efddc5e823509467ebd9329fb0 ******/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnSup2(Index) on the support face.
") PCurveOnFace2;
		const opencascade::handle<Geom2d_Curve> & PCurveOnFace2(const int Index);

		/****** FilletSurf_InternalBuilder::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** FilletSurf_InternalBuilder::Section ******/
		/****** md5 signature: 34370f9391f8bdfae3c33d0abe2f81dd ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
IndexSurf: int
IndexSec: int

Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
Returns the arc of the section of index IndexSec of surface of index IndexSurf. The basis curve of the trimmed curve is a Geom_Circle. 
Input parameter: IndexSurf 1-based surface index 
Input parameter: IndexSec 1-based section index 
Return: the section as a trimmed circular arc.
") Section;
		opencascade::handle<Geom_TrimmedCurve> Section(const int IndexSurf, const int IndexSec);

		/****** FilletSurf_InternalBuilder::Section ******/
		/****** md5 signature: ff89a1df5bbc210cbc2da8523e65c3c2 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
IndexSurf: int
IndexSec: int
Circ: Geom_TrimmedCurve

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const int IndexSurf, const int IndexSec, opencascade::handle<Geom_TrimmedCurve> & Circ);

		/****** FilletSurf_InternalBuilder::Simulate ******/
		/****** md5 signature: 9676554fe6894b29846ee30e6ab9491e ******/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Simulate;
		void Simulate();

		/****** FilletSurf_InternalBuilder::StartSectionStatus ******/
		/****** md5 signature: 44600984cf9e0d8a17bf00b703f45d7d ******/
		%feature("compactdefaultargs") StartSectionStatus;
		%feature("autodoc", "Return
-------
FilletSurf_StatusType

Description
-----------
No available documentation.
") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus();

		/****** FilletSurf_InternalBuilder::SupportFace1 ******/
		/****** md5 signature: 00a16dca5fc7c2a8474725138be5c11b ******/
		%feature("compactdefaultargs") SupportFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Face

Description
-----------
gives the first support face relative to SurfaceFillet(Index);.
") SupportFace1;
		const TopoDS_Face SupportFace1(const int Index);

		/****** FilletSurf_InternalBuilder::SupportFace2 ******/
		/****** md5 signature: 887e2c234a1a06929d818f32e7d20114 ******/
		%feature("compactdefaultargs") SupportFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Face

Description
-----------
gives the second support face relative to SurfaceFillet(Index);.
") SupportFace2;
		const TopoDS_Face SupportFace2(const int Index);

		/****** FilletSurf_InternalBuilder::SurfaceFillet ******/
		/****** md5 signature: 01f68a5e23c126a2585d08299747e6df ******/
		%feature("compactdefaultargs") SurfaceFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
gives the NUBS surface of index Index.
") SurfaceFillet;
		const opencascade::handle<Geom_Surface> & SurfaceFillet(const int Index);

		/****** FilletSurf_InternalBuilder::TolApp3d ******/
		/****** md5 signature: ada6fc8b3d1862f2544e832e8805a8cd ******/
		%feature("compactdefaultargs") TolApp3d;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
gives the 3d tolerance reached during approximation of the surface of index Index.
") TolApp3d;
		double TolApp3d(const int Index);

};


%extend FilletSurf_InternalBuilder {
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
