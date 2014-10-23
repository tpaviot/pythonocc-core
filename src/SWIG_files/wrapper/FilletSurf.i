/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") FilletSurf

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include FilletSurf_headers.i

/* typedefs */
/* end typedefs declaration */

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

%nodefaultctor FilletSurf_Builder;
class FilletSurf_Builder {
	public:
		%feature("autodoc", "	* initialize of the informations necessary for the computation of the fillet on the Shape S from a list of edges E and a radius R. Ta is the angular tolerance //!		 Tapp3d is the 3d approximation tolerance //!		 Tapp2d is the 2d approximation tolerance

	:param S:
	:type S: TopoDS_Shape &
	:param E:
	:type E: TopTools_ListOfShape &
	:param R:
	:type R: float
	:param Ta: default value is 1.0e-2
	:type Ta: float
	:param Tapp3d: default value is 1.0e-4
	:type Tapp3d: float
	:param Tapp2d: default value is 1.0e-5
	:type Tapp2d: float
	:rtype: None
") FilletSurf_Builder;
		 FilletSurf_Builder (const TopoDS_Shape & S,const TopTools_ListOfShape & E,const Standard_Real R,const Standard_Real Ta = 1.0e-2,const Standard_Real Tapp3d = 1.0e-4,const Standard_Real Tapp2d = 1.0e-5);
		%feature("autodoc", "	* //!---Purpose computation of the fillet (list of NUBS)

	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: None
") Simulate;
		void Simulate ();
		%feature("autodoc", "	* gives the status about the computation of the fillet returns: IsOK :no problem during the computation IsNotOk: no result is produced IsPartial: the result is partial

	:rtype: FilletSurf_StatusDone
") IsDone;
		FilletSurf_StatusDone IsDone ();
		%feature("autodoc", "	* gives informations about error status if IsDone=IsNotOk returns EdgeNotG1: the edges are not G1 FacesNotG1 : two connected faces on a same support are not G1 EdgeNotOnShape: the edge is not on shape NotSharpEdge: the edge is not sharp PbFilletCompute: problem during the computation of the fillet

	:rtype: FilletSurf_ErrorTypeStatus
") StatusError;
		FilletSurf_ErrorTypeStatus StatusError ();
		%feature("autodoc", "	* gives the number of NUBS surfaces of the Fillet.

	:rtype: int
") NbSurface;
		Standard_Integer NbSurface ();
		%feature("autodoc", "	* gives the NUBS surface of index Index.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") SurfaceFillet;
		const Handle_Geom_Surface & SurfaceFillet (const Standard_Integer Index);
		%feature("autodoc", "	* gives the 3d tolerance reached during approximation of surface of index Index

	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") TolApp3d;
		Standard_Real TolApp3d (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the first support face relative to SurfaceFillet(Index);

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Face
") SupportFace1;
		const TopoDS_Face & SupportFace1 (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the second support face relative to SurfaceFillet(Index);

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Face
") SupportFace2;
		const TopoDS_Face & SupportFace2 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the 3d curve of SurfaceFillet(Index) on SupportFace1(Index)

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") CurveOnFace1;
		const Handle_Geom_Curve & CurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the 3d curve of SurfaceFillet(Index) on SupportFace2(Index)

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") CurveOnFace2;
		const Handle_Geom_Curve & CurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the PCurve associated to CurvOnSup1(Index) on the support face

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurveOnFace1;
		const Handle_Geom2d_Curve & PCurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the PCurve associated to CurveOnFace1(Index) on the Fillet

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurve1OnFillet;
		const Handle_Geom2d_Curve & PCurve1OnFillet (const Standard_Integer Index);
		%feature("autodoc", "	* gives the PCurve associated to CurveOnSup2(Index) on the support face

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurveOnFace2;
		const Handle_Geom2d_Curve & PCurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the PCurve associated to CurveOnSup2(Index) on the fillet

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurve2OnFillet;
		const Handle_Geom2d_Curve & PCurve2OnFillet (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the parameter of the fillet on the first edge.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	* gives the parameter of the fillet on the last edge

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: FilletSurf_StatusType
") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus ();
		%feature("autodoc", "	:rtype: FilletSurf_StatusType
") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus ();
		%feature("autodoc", "	:param IndexSurf:
	:type IndexSurf: Standard_Integer
	:rtype: int
") NbSection;
		Standard_Integer NbSection (const Standard_Integer IndexSurf);
		%feature("autodoc", "	:param IndexSurf:
	:type IndexSurf: Standard_Integer
	:param IndexSec:
	:type IndexSec: Standard_Integer
	:param Circ:
	:type Circ: Handle_Geom_TrimmedCurve &
	:rtype: None
") Section;
		void Section (const Standard_Integer IndexSurf,const Standard_Integer IndexSec,Handle_Geom_TrimmedCurve & Circ);
};


%feature("shadow") FilletSurf_Builder::~FilletSurf_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FilletSurf_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor FilletSurf_InternalBuilder;
class FilletSurf_InternalBuilder : public ChFi3d_FilBuilder {
	public:
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param FShape: default value is ChFi3d_Polynomial
	:type FShape: ChFi3d_FilletShape
	:param Ta: default value is 1.0e-2
	:type Ta: float
	:param Tapp3d: default value is 1.0e-4
	:type Tapp3d: float
	:param Tapp2d: default value is 1.0e-5
	:type Tapp2d: float
	:rtype: None
") FilletSurf_InternalBuilder;
		 FilletSurf_InternalBuilder (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Polynomial,const Standard_Real Ta = 1.0e-2,const Standard_Real Tapp3d = 1.0e-4,const Standard_Real Tapp2d = 1.0e-5);
		%feature("autodoc", "	* Initializes the contour with a list of Edges 0 : no problem 1 : empty list 2 : the edges are not G1 3 : two connected faces on a same support are not G1 4 : the edge is not on shape 5 : NotSharpEdge: the edge is not sharp

	:param E:
	:type E: TopTools_ListOfShape &
	:param R:
	:type R: float
	:rtype: int
") Add;
		Standard_Integer Add (const TopTools_ListOfShape & E,const Standard_Real R);
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("autodoc", "	:rtype: bool
") Done;
		Standard_Boolean Done ();
		%feature("autodoc", "	* gives the number of NUBS surfaces of the Fillet.

	:rtype: int
") NbSurface;
		Standard_Integer NbSurface ();
		%feature("autodoc", "	* gives the NUBS surface of index Index.

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Surface
") SurfaceFillet;
		const Handle_Geom_Surface & SurfaceFillet (const Standard_Integer Index);
		%feature("autodoc", "	* gives the 3d tolerance reached during approximation of the surface of index Index

	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") TolApp3d;
		Standard_Real TolApp3d (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the first support face relative to SurfaceFillet(Index);

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Face
") SupportFace1;
		const TopoDS_Face & SupportFace1 (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the second support face relative to SurfaceFillet(Index);

	:param Index:
	:type Index: Standard_Integer
	:rtype: TopoDS_Face
") SupportFace2;
		const TopoDS_Face & SupportFace2 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the 3d curve of SurfaceFillet(Index) on SupportFace1(Index)

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") CurveOnFace1;
		const Handle_Geom_Curve & CurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the 3d curve of SurfaceFillet(Index) on SupportFace2(Index)

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom_Curve
") CurveOnFace2;
		const Handle_Geom_Curve & CurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the PCurve associated to CurvOnSup1(Index) on the support face

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurveOnFace1;
		const Handle_Geom2d_Curve & PCurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the PCurve associated to CurveOnFace1(Index) on the Fillet

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurve1OnFillet;
		const Handle_Geom2d_Curve & PCurve1OnFillet (const Standard_Integer Index);
		%feature("autodoc", "	* gives the PCurve associated to CurveOnSup2(Index) on the support face

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurveOnFace2;
		const Handle_Geom2d_Curve & PCurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "	* gives the PCurve associated to CurveOnSup2(Index) on the fillet

	:param Index:
	:type Index: Standard_Integer
	:rtype: Handle_Geom2d_Curve
") PCurve2OnFillet;
		const Handle_Geom2d_Curve & PCurve2OnFillet (const Standard_Integer Index);
		%feature("autodoc", "	* //!gives the parameter of the fillet on the first edge.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	* gives the parameter of the fillet on the last edge

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: FilletSurf_StatusType
") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus ();
		%feature("autodoc", "	:rtype: FilletSurf_StatusType
") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus ();
		%feature("autodoc", "	:rtype: None
") Simulate;
		void Simulate ();
		%feature("autodoc", "	:param IndexSurf:
	:type IndexSurf: Standard_Integer
	:rtype: int
") NbSection;
		Standard_Integer NbSection (const Standard_Integer IndexSurf);
		%feature("autodoc", "	:param IndexSurf:
	:type IndexSurf: Standard_Integer
	:param IndexSec:
	:type IndexSec: Standard_Integer
	:param Circ:
	:type Circ: Handle_Geom_TrimmedCurve &
	:rtype: None
") Section;
		void Section (const Standard_Integer IndexSurf,const Standard_Integer IndexSec,Handle_Geom_TrimmedCurve & Circ);
};


%feature("shadow") FilletSurf_InternalBuilder::~FilletSurf_InternalBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend FilletSurf_InternalBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
