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
%module (package="OCC") BOPInt

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

%include BOPInt_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BOPInt_Context;
class BOPInt_Context : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPInt_Context;
		 BOPInt_Context ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BOPInt_Context;
		 BOPInt_Context (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)

Returns:
	IntTools_FClass2d

Returns a reference to point classifier  
for given face") FClass2d;
		IntTools_FClass2d & FClass2d (const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)

Returns:
	GeomAPI_ProjectPointOnSurf

Returns a reference to point projector  
for given face") ProjPS;
		GeomAPI_ProjectPointOnSurf & ProjPS (const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)

Returns:
	GeomAPI_ProjectPointOnCurve

Returns a reference to point projector  
for given edge") ProjPC;
		GeomAPI_ProjectPointOnCurve & ProjPC (const TopoDS_Edge & aE);
		%feature("autodoc", "Args:
	aC(Handle_Geom_Curve)

Returns:
	GeomAPI_ProjectPointOnCurve

Returns a reference to point projector  
for given curve") ProjPT;
		GeomAPI_ProjectPointOnCurve & ProjPT (const Handle_Geom_Curve & aC);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)

Returns:
	IntTools_SurfaceRangeLocalizeData

Returns a reference to surface localization data  
for given face") SurfaceData;
		IntTools_SurfaceRangeLocalizeData & SurfaceData (const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	aSolid(TopoDS_Solid)

Returns:
	BRepClass3d_SolidClassifier

Returns a reference to solid classifier  
for given solid") SolidClassifier;
		BRepClass3d_SolidClassifier & SolidClassifier (const TopoDS_Solid & aSolid);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)

Returns:
	Geom2dHatch_Hatcher

Returns a reference to 2D hatcher  
for given face") Hatcher;
		Geom2dHatch_Hatcher & Hatcher (const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	theP(gp_Pnt)
	theTolP(Standard_Real)
	theE(TopoDS_Edge)
	theT(Standard_Real)

Returns:
	Standard_Integer

Computes parameter of the Point theP on  
the edge aE.  
Returns zero if the distance between point  
and edge is less than sum of tolerance value of edge and theTopP,  
otherwise and for following conditions returns  
negative value  
1. the edge is degenerated (-1)  
2. the edge does not contain 3d curve and pcurves (-2)  
3. projection algorithm failed (-3)") ComputePE;
		Standard_Integer ComputePE (const gp_Pnt & theP,const Standard_Real theTolP,const TopoDS_Edge & theE,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aV(TopoDS_Vertex)
	aE(TopoDS_Edge)
	aT(Standard_Real)

Returns:
	Standard_Integer

Computes parameter of the vertex aV on  
the edge aE.  
Returns zero if the distance between vertex  
and edge is less than sum of tolerances,  
otherwise and for following conditions returns  
negative value  
1. the edge is degenerated (-1)  
2. the edge does not contain 3d curve and pcurves (-2)  
3. projection algorithm failed (-3)  
 
Computes parameter aT of the vertex aV on  
the edge aE.  
Returns zero if the distance between vertex  
and edge is less than sum of tolerances,  
otherwise and for following conditions returns  
negative value  
1. the edge is degenerated (-1)  
2. the edge does not contain 3d curve and pcurves (-2)  
3. projection algorithm failed (-3)  
 
Output parameters  
bToUpdateVertex - the flag that indicates whether the  
vertex tolerance should be modified or not  
aDist - the value of the distance between the vertex  
and the edge") ComputeVE;
		Standard_Integer ComputeVE (const TopoDS_Vertex & aV,const TopoDS_Edge & aE,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aV(TopoDS_Vertex)
	aF(TopoDS_Face)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	Standard_Integer

Computes UV parameters of the vertex aV on face aF  
Returns zero if the distance between vertex and face is  
less than or equal the sum of tolerances and the projection  
point lays inside boundaries of the face.  
For following conditions returns negative value  
1. projection algorithm failed (-1)  
2. distance is more than sum of tolerances (-2)  
3. projection point out or on the boundaries of face (-3)") ComputeVF;
		Standard_Integer ComputeVF (const TopoDS_Vertex & aV,const TopoDS_Face & aF,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	aP2D(gp_Pnt2d)

Returns:
	TopAbs_State

Returns the state of the point aP2D  
relative to face aF") StatePointFace;
		TopAbs_State StatePointFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	aP2D(gp_Pnt2d)

Returns:
	Standard_Boolean

Returns true if the point aP2D is  
inside the boundaries of the face aF,  
otherwise returns false") IsPointInFace;
		Standard_Boolean IsPointInFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	aP2D(gp_Pnt2d)

Returns:
	Standard_Boolean

Returns true if the point aP2D is  
inside or on the boundaries of aF") IsPointInOnFace;
		Standard_Boolean IsPointInOnFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);
		%feature("autodoc", "Args:
	aP3D(gp_Pnt)
	aF(TopoDS_Face)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the distance between point aP3D  
and face aF is less or equal to tolerance aTol  
and projection point is inside or on the boundaries  
of the face aF") IsValidPointForFace;
		Standard_Boolean IsValidPointForFace (const gp_Pnt & aP3D,const TopoDS_Face & aF,const Standard_Real aTol);
		%feature("autodoc", "Args:
	aP3D(gp_Pnt)
	aF1(TopoDS_Face)
	aF2(TopoDS_Face)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if IsValidPointForFace returns true  
for both face aF1 and aF2") IsValidPointForFaces;
		Standard_Boolean IsValidPointForFaces (const gp_Pnt & aP3D,const TopoDS_Face & aF1,const TopoDS_Face & aF2,const Standard_Real aTol);
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)
	aIC(IntTools_Curve)
	aF(TopoDS_Face)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if IsValidPointForFace returns true  
for some 3d point that lay on the curve aIC bounded by  
parameters aT1 and aT2") IsValidBlockForFace;
		Standard_Boolean IsValidBlockForFace (const Standard_Real aT1,const Standard_Real aT2,const IntTools_Curve & aIC,const TopoDS_Face & aF,const Standard_Real aTol);
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)
	aIC(IntTools_Curve)
	aF1(TopoDS_Face)
	aF2(TopoDS_Face)
	aTol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if IsValidBlockForFace returns true  
for both faces aF1 and aF2") IsValidBlockForFaces;
		Standard_Boolean IsValidBlockForFaces (const Standard_Real aT1,const Standard_Real aT2,const IntTools_Curve & aIC,const TopoDS_Face & aF1,const TopoDS_Face & aF2,const Standard_Real aTol);
		%feature("autodoc", "Args:
	aV(TopoDS_Vertex)
	aIC(IntTools_Curve)
	aTolC(Standard_Real)
	aT(Standard_Real)

Returns:
	Standard_Boolean

Computes parameter of the vertex aV on  
the curve aIC.  
Returns true if the distance between vertex and  
curve is less than sum of tolerance of aV and aTolC,  
otherwise or if projection algorithm failed  
returns false (in this case aT isn't significant)") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine (const TopoDS_Vertex & aV,const IntTools_Curve & aIC,const Standard_Real aTolC,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aV(TopoDS_Vertex)
	aTolV(Standard_Real)
	aIC(IntTools_Curve)
	aTolC(Standard_Real)
	aT(Standard_Real)

Returns:
	Standard_Boolean

Computes parameter of the vertex aV on  
the curve aIC.  
Returns true if the distance between vertex and  
curve is less than sum of tolerance of aV and aTolC,  
otherwise or if projection algorithm failed  
returns false (in this case aT isn't significant)") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine (const TopoDS_Vertex & aV,const Standard_Real aTolV,const IntTools_Curve & aIC,const Standard_Real aTolC,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aP(gp_Pnt)
	aE(TopoDS_Edge)
	aT(Standard_Real)

Returns:
	Standard_Boolean

Computes parameter of the point aP on  
the edge aE.  
Returns false if projection algorithm failed  
other wiese returns true.") ProjectPointOnEdge;
		Standard_Boolean ProjectPointOnEdge (const gp_Pnt & aP,const TopoDS_Edge & aE,Standard_Real &OutValue);
};


%feature("shadow") BOPInt_Context::~BOPInt_Context %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPInt_Context {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BOPInt_Context {
	Handle_BOPInt_Context GetHandle() {
	return *(Handle_BOPInt_Context*) &$self;
	}
};

%nodefaultctor Handle_BOPInt_Context;
class Handle_BOPInt_Context : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BOPInt_Context();
        Handle_BOPInt_Context(const Handle_BOPInt_Context &aHandle);
        Handle_BOPInt_Context(const BOPInt_Context *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BOPInt_Context DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BOPInt_Context {
    BOPInt_Context* GetObject() {
    return (BOPInt_Context*)$self->Access();
    }
};
%feature("shadow") Handle_BOPInt_Context::~Handle_BOPInt_Context %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BOPInt_Context {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BOPInt_ShrunkRange;
class BOPInt_ShrunkRange {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPInt_ShrunkRange;
		 BOPInt_ShrunkRange ();
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aT1(Standard_Real)
	aT2(Standard_Real)
	aV1(TopoDS_Vertex)
	aV2(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") SetData;
		void SetData (const TopoDS_Edge & aE,const Standard_Real aT1,const Standard_Real aT2,const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2);
		%feature("autodoc", "Args:
	aCtx(Handle_BOPInt_Context)

Returns:
	None

No detailed docstring for this function.") SetContext;
		void SetContext (const Handle_BOPInt_Context & aCtx);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPInt_Context

No detailed docstring for this function.") Context;
		const Handle_BOPInt_Context & Context ();
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetShrunkRange;
		void SetShrunkRange (const Standard_Real aT1,const Standard_Real aT2);
		%feature("autodoc", "Args:
	aT1(Standard_Real)
	aT2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ShrunkRange;
		void ShrunkRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") BndBox;
		const Bnd_Box & BndBox ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns code of computing shrunk range  
completion  
0 - means successful completion  
1 - nothing has been done  
2 - initial range is out of edge's range  
3 - first boundary of initial range is more than  
    last boundary  
4 - projection of first vertex failed  
5 - projection of second vertex failed  
6 - shrunk range can not be computed  
    shrunk range is setted to initial range") ErrorStatus;
		Standard_Integer ErrorStatus ();
};


%feature("shadow") BOPInt_ShrunkRange::~BOPInt_ShrunkRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPInt_ShrunkRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPInt_Tools;
class BOPInt_Tools {
	public:
		%feature("autodoc", "Args:
	theC(Handle_Geom_Curve)
	theTol(Standard_Real)
	theBox(Bnd_Box)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") CheckCurve;
		static Standard_Boolean CheckCurve (const Handle_Geom_Curve & theC,const Standard_Real theTol,Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theT(Standard_Real)
	theRange(IntTools_Range)
	theTol(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsOnPave;
		static Standard_Boolean IsOnPave (const Standard_Real theT,const IntTools_Range & theRange,const Standard_Real theTol);
		%feature("autodoc", "Args:
	theCP(IntTools_CommonPrt)
	theT1(Standard_Real)
	theT2(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") VertexParameters;
		static void VertexParameters (const IntTools_CommonPrt & theCP,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theCP(IntTools_CommonPrt)
	theT(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") VertexParameter;
		static void VertexParameter (const IntTools_CommonPrt & theCP,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theT(Standard_Real)
	theRange(IntTools_Range)
	theTol(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsOnPave1;
		static Standard_Boolean IsOnPave1 (const Standard_Real theT,const IntTools_Range & theRange,const Standard_Real theTol);
		%feature("autodoc", "Args:
	theRRef(IntTools_Range)
	theR(IntTools_Range)
	theTol(Standard_Real)

Returns:
	static Standard_Boolean

Checks if the range <theR> interfere with the range <theRRef>") IsInRange;
		static Standard_Boolean IsInRange (const IntTools_Range & theRRef,const IntTools_Range & theR,const Standard_Real theTol);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	theTLin1(Standard_Real)
	theTLin2(Standard_Real)
	theTolLin(Standard_Real)
	thePln(gp_Pln)
	theTolPln(Standard_Real)
	theP(gp_Pnt)
	theT(Standard_Real)
	theTolP(Standard_Real)
	theTmin(Standard_Real)
	theTmax(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") SegPln;
		static Standard_Integer SegPln (const gp_Lin & theLin,const Standard_Real theTLin1,const Standard_Real theTLin2,const Standard_Real theTolLin,const gp_Pln & thePln,const Standard_Real theTolPln,gp_Pnt & theP,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BOPInt_Tools::~BOPInt_Tools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPInt_Tools {
	void _kill_pointed() {
		delete $self;
	}
};
