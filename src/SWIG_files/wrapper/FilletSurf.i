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
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	E(TopTools_ListOfShape)
	R(Standard_Real)
	Ta(Standard_Real)=1.0e-2
	Tapp3d(Standard_Real)=1.0e-4
	Tapp2d(Standard_Real)=1.0e-5

Returns:
	None

initialize  of the informations necessary for  the  
         computation of  the fillet on the  
         Shape S from a list of edges E and a radius R.  
 
          Ta is the angular tolerance  
//!		 Tapp3d is the 3d approximation tolerance  
//!		 Tapp2d is the 2d approximation tolerance") FilletSurf_Builder;
		 FilletSurf_Builder (const TopoDS_Shape & S,const TopTools_ListOfShape & E,const Standard_Real R,const Standard_Real Ta = 1.0e-2,const Standard_Real Tapp3d = 1.0e-4,const Standard_Real Tapp2d = 1.0e-5);
		%feature("autodoc", "Args:
	None
Returns:
	None

//!---Purpose computation  of the fillet (list of NUBS)") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Simulate;
		void Simulate ();
		%feature("autodoc", "Args:
	None
Returns:
	FilletSurf_StatusDone

gives the status about the computation of the fillet  
         returns:  
         IsOK :no problem during the computation  
         IsNotOk: no result is produced  
         IsPartial: the result is partial") IsDone;
		FilletSurf_StatusDone IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	FilletSurf_ErrorTypeStatus

gives    informations     about  error   status     if  
         IsDone=IsNotOk  
         returns  
         EdgeNotG1: the edges are not G1  
         FacesNotG1 : two connected faces on a same support are  
         not  G1  
         EdgeNotOnShape: the  edge   is  not on  shape  
         NotSharpEdge: the  edge is not sharp  
         PbFilletCompute: problem during the computation of the fillet") StatusError;
		FilletSurf_ErrorTypeStatus StatusError ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

gives the number of NUBS surfaces  of the Fillet.") NbSurface;
		Standard_Integer NbSurface ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

gives the NUBS surface of index Index.") SurfaceFillet;
		const Handle_Geom_Surface & SurfaceFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

gives  the  3d  tolerance reached during approximation  
         of surface of index Index") TolApp3d;
		Standard_Real TolApp3d (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Face

//!gives the first support  face relative to SurfaceFillet(Index);") SupportFace1;
		const TopoDS_Face & SupportFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Face

//!gives the second support  face relative to SurfaceFillet(Index);") SupportFace2;
		const TopoDS_Face & SupportFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

gives  the 3d curve  of SurfaceFillet(Index)  on SupportFace1(Index)") CurveOnFace1;
		const Handle_Geom_Curve & CurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

gives the     3d  curve of  SurfaceFillet(Index) on SupportFace2(Index)") CurveOnFace2;
		const Handle_Geom_Curve & CurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

//!gives the  PCurve associated to CurvOnSup1(Index)  on the support face") PCurveOnFace1;
		const Handle_Geom2d_Curve & PCurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve associated to CurveOnFace1(Index) on the Fillet") PCurve1OnFillet;
		const Handle_Geom2d_Curve & PCurve1OnFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve  associated to CurveOnSup2(Index) on  the  support face") PCurveOnFace2;
		const Handle_Geom2d_Curve & PCurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve  associated to CurveOnSup2(Index) on  the  fillet") PCurve2OnFillet;
		const Handle_Geom2d_Curve & PCurve2OnFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

//!gives the parameter of the fillet  on the first edge.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

gives the  parameter of the fillet  on the last edge") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	FilletSurf_StatusType

No detailed docstring for this function.") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	FilletSurf_StatusType

No detailed docstring for this function.") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus ();
		%feature("autodoc", "Args:
	IndexSurf(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbSection;
		Standard_Integer NbSection (const Standard_Integer IndexSurf);
		%feature("autodoc", "Args:
	IndexSurf(Standard_Integer)
	IndexSec(Standard_Integer)
	Circ(Handle_Geom_TrimmedCurve)

Returns:
	None

No detailed docstring for this function.") Section;
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
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FShape(ChFi3d_FilletShape)=ChFi3d_Polynomial
	Ta(Standard_Real)=1.0e-2
	Tapp3d(Standard_Real)=1.0e-4
	Tapp2d(Standard_Real)=1.0e-5

Returns:
	None

No detailed docstring for this function.") FilletSurf_InternalBuilder;
		 FilletSurf_InternalBuilder (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Polynomial,const Standard_Real Ta = 1.0e-2,const Standard_Real Tapp3d = 1.0e-4,const Standard_Real Tapp2d = 1.0e-5);
		%feature("autodoc", "Args:
	E(TopTools_ListOfShape)
	R(Standard_Real)

Returns:
	Standard_Integer

Initializes the contour with a list of Edges  
0 : no problem  
1 : empty list  
2 : the edges are not G1  
3 : two connected faces on a same support are not G1  
4 : the  edge   is  not on  shape  
5 :  NotSharpEdge: the  edge is not sharp") Add;
		Standard_Integer Add (const TopTools_ListOfShape & E,const Standard_Real R);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Done;
		Standard_Boolean Done ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

gives the number of NUBS surfaces  of the Fillet.") NbSurface;
		Standard_Integer NbSurface ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

gives the NUBS surface of index Index.") SurfaceFillet;
		const Handle_Geom_Surface & SurfaceFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

gives  the  3d  tolerance reached during approximation  
         of the surface of index Index") TolApp3d;
		Standard_Real TolApp3d (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Face

//!gives the first support  face relative to SurfaceFillet(Index);") SupportFace1;
		const TopoDS_Face & SupportFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Face

//!gives the second support  face relative to SurfaceFillet(Index);") SupportFace2;
		const TopoDS_Face & SupportFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

gives  the 3d curve  of SurfaceFillet(Index)  on SupportFace1(Index)") CurveOnFace1;
		const Handle_Geom_Curve & CurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

gives the     3d  curve of  SurfaceFillet(Index) on SupportFace2(Index)") CurveOnFace2;
		const Handle_Geom_Curve & CurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

//!gives the  PCurve associated to CurvOnSup1(Index)  on the support face") PCurveOnFace1;
		const Handle_Geom2d_Curve & PCurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve associated to CurveOnFace1(Index) on the Fillet") PCurve1OnFillet;
		const Handle_Geom2d_Curve & PCurve1OnFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve  associated to CurveOnSup2(Index) on  the  support face") PCurveOnFace2;
		const Handle_Geom2d_Curve & PCurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve  associated to CurveOnSup2(Index) on  the  fillet") PCurve2OnFillet;
		const Handle_Geom2d_Curve & PCurve2OnFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

//!gives the parameter of the fillet  on the first edge.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

gives the  parameter of the fillet  on the last edge") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	FilletSurf_StatusType

No detailed docstring for this function.") StartSectionStatus;
		FilletSurf_StatusType StartSectionStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	FilletSurf_StatusType

No detailed docstring for this function.") EndSectionStatus;
		FilletSurf_StatusType EndSectionStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Simulate;
		void Simulate ();
		%feature("autodoc", "Args:
	IndexSurf(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbSection;
		Standard_Integer NbSection (const Standard_Integer IndexSurf);
		%feature("autodoc", "Args:
	IndexSurf(Standard_Integer)
	IndexSec(Standard_Integer)
	Circ(Handle_Geom_TrimmedCurve)

Returns:
	None

No detailed docstring for this function.") Section;
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
