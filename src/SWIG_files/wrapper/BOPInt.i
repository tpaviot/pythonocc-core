/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BOPInt_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BOPInt_Context;
class BOPInt_Context : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") BOPInt_Context;
		%feature("autodoc", "	:rtype: None
") BOPInt_Context;
		 BOPInt_Context ();
		%feature("compactdefaultargs") BOPInt_Context;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPInt_Context;
		 BOPInt_Context (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") FClass2d;
		%feature("autodoc", "	* Returns a reference to point classifier for given face

	:param aF:
	:type aF: TopoDS_Face &
	:rtype: IntTools_FClass2d
") FClass2d;
		IntTools_FClass2d & FClass2d (const TopoDS_Face & aF);
		%feature("compactdefaultargs") ProjPS;
		%feature("autodoc", "	* Returns a reference to point projector for given face

	:param aF:
	:type aF: TopoDS_Face &
	:rtype: GeomAPI_ProjectPointOnSurf
") ProjPS;
		GeomAPI_ProjectPointOnSurf & ProjPS (const TopoDS_Face & aF);
		%feature("compactdefaultargs") ProjPC;
		%feature("autodoc", "	* Returns a reference to point projector for given edge

	:param aE:
	:type aE: TopoDS_Edge &
	:rtype: GeomAPI_ProjectPointOnCurve
") ProjPC;
		GeomAPI_ProjectPointOnCurve & ProjPC (const TopoDS_Edge & aE);
		%feature("compactdefaultargs") ProjPT;
		%feature("autodoc", "	* Returns a reference to point projector for given curve

	:param aC:
	:type aC: Handle_Geom_Curve &
	:rtype: GeomAPI_ProjectPointOnCurve
") ProjPT;
		GeomAPI_ProjectPointOnCurve & ProjPT (const Handle_Geom_Curve & aC);
		%feature("compactdefaultargs") SurfaceData;
		%feature("autodoc", "	* Returns a reference to surface localization data for given face

	:param aF:
	:type aF: TopoDS_Face &
	:rtype: IntTools_SurfaceRangeLocalizeData
") SurfaceData;
		IntTools_SurfaceRangeLocalizeData & SurfaceData (const TopoDS_Face & aF);
		%feature("compactdefaultargs") SolidClassifier;
		%feature("autodoc", "	* Returns a reference to solid classifier for given solid

	:param aSolid:
	:type aSolid: TopoDS_Solid &
	:rtype: BRepClass3d_SolidClassifier
") SolidClassifier;
		BRepClass3d_SolidClassifier & SolidClassifier (const TopoDS_Solid & aSolid);
		%feature("compactdefaultargs") Hatcher;
		%feature("autodoc", "	* Returns a reference to 2D hatcher for given face

	:param aF:
	:type aF: TopoDS_Face &
	:rtype: Geom2dHatch_Hatcher
") Hatcher;
		Geom2dHatch_Hatcher & Hatcher (const TopoDS_Face & aF);
		%feature("compactdefaultargs") ComputePE;
		%feature("autodoc", "	* Computes parameter of the Point theP on the edge aE. Returns zero if the distance between point and edge is less than sum of tolerance value of edge and theTopP, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3)

	:param theP:
	:type theP: gp_Pnt
	:param theTolP:
	:type theTolP: float
	:param theE:
	:type theE: TopoDS_Edge &
	:param theT:
	:type theT: float &
	:rtype: int
") ComputePE;
		Standard_Integer ComputePE (const gp_Pnt & theP,const Standard_Real theTolP,const TopoDS_Edge & theE,Standard_Real &OutValue);
		%feature("compactdefaultargs") ComputeVE;
		%feature("autodoc", "	* Computes parameter of the vertex aV on the edge aE. Returns zero if the distance between vertex and edge is less than sum of tolerances, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3) Computes parameter aT of the vertex aV on the edge aE. Returns zero if the distance between vertex and edge is less than sum of tolerances, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3) Output parameters bToUpdateVertex - the flag that indicates whether the vertex tolerance should be modified or not aDist - the value of the distance between the vertex and the edge

	:param aV:
	:type aV: TopoDS_Vertex &
	:param aE:
	:type aE: TopoDS_Edge &
	:param aT:
	:type aT: float &
	:rtype: int
") ComputeVE;
		Standard_Integer ComputeVE (const TopoDS_Vertex & aV,const TopoDS_Edge & aE,Standard_Real &OutValue);
		%feature("compactdefaultargs") ComputeVF;
		%feature("autodoc", "	* Computes UV parameters of the vertex aV on face aF Returns zero if the distance between vertex and face is less than or equal the sum of tolerances and the projection point lays inside boundaries of the face. For following conditions returns negative value 1. projection algorithm failed (-1) 2. distance is more than sum of tolerances (-2) 3. projection point out or on the boundaries of face (-3)

	:param aV:
	:type aV: TopoDS_Vertex &
	:param aF:
	:type aF: TopoDS_Face &
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: int
") ComputeVF;
		Standard_Integer ComputeVF (const TopoDS_Vertex & aV,const TopoDS_Face & aF,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") StatePointFace;
		%feature("autodoc", "	* Returns the state of the point aP2D relative to face aF

	:param aF:
	:type aF: TopoDS_Face &
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:rtype: TopAbs_State
") StatePointFace;
		TopAbs_State StatePointFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "	* Returns true if the point aP2D is inside the boundaries of the face aF, otherwise returns false

	:param aF:
	:type aF: TopoDS_Face &
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:rtype: bool
") IsPointInFace;
		Standard_Boolean IsPointInFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);
		%feature("compactdefaultargs") IsPointInOnFace;
		%feature("autodoc", "	* Returns true if the point aP2D is inside or on the boundaries of aF

	:param aF:
	:type aF: TopoDS_Face &
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:rtype: bool
") IsPointInOnFace;
		Standard_Boolean IsPointInOnFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);
		%feature("compactdefaultargs") IsValidPointForFace;
		%feature("autodoc", "	* Returns true if the distance between point aP3D and face aF is less or equal to tolerance aTol and projection point is inside or on the boundaries of the face aF

	:param aP3D:
	:type aP3D: gp_Pnt
	:param aF:
	:type aF: TopoDS_Face &
	:param aTol:
	:type aTol: float
	:rtype: bool
") IsValidPointForFace;
		Standard_Boolean IsValidPointForFace (const gp_Pnt & aP3D,const TopoDS_Face & aF,const Standard_Real aTol);
		%feature("compactdefaultargs") IsValidPointForFaces;
		%feature("autodoc", "	* Returns true if IsValidPointForFace returns true for both face aF1 and aF2

	:param aP3D:
	:type aP3D: gp_Pnt
	:param aF1:
	:type aF1: TopoDS_Face &
	:param aF2:
	:type aF2: TopoDS_Face &
	:param aTol:
	:type aTol: float
	:rtype: bool
") IsValidPointForFaces;
		Standard_Boolean IsValidPointForFaces (const gp_Pnt & aP3D,const TopoDS_Face & aF1,const TopoDS_Face & aF2,const Standard_Real aTol);
		%feature("compactdefaultargs") IsValidBlockForFace;
		%feature("autodoc", "	* Returns true if IsValidPointForFace returns true for some 3d point that lay on the curve aIC bounded by parameters aT1 and aT2

	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aIC:
	:type aIC: IntTools_Curve &
	:param aF:
	:type aF: TopoDS_Face &
	:param aTol:
	:type aTol: float
	:rtype: bool
") IsValidBlockForFace;
		Standard_Boolean IsValidBlockForFace (const Standard_Real aT1,const Standard_Real aT2,const IntTools_Curve & aIC,const TopoDS_Face & aF,const Standard_Real aTol);
		%feature("compactdefaultargs") IsValidBlockForFaces;
		%feature("autodoc", "	* Returns true if IsValidBlockForFace returns true for both faces aF1 and aF2

	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aIC:
	:type aIC: IntTools_Curve &
	:param aF1:
	:type aF1: TopoDS_Face &
	:param aF2:
	:type aF2: TopoDS_Face &
	:param aTol:
	:type aTol: float
	:rtype: bool
") IsValidBlockForFaces;
		Standard_Boolean IsValidBlockForFaces (const Standard_Real aT1,const Standard_Real aT2,const IntTools_Curve & aIC,const TopoDS_Face & aF1,const TopoDS_Face & aF2,const Standard_Real aTol);
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "	* Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant)

	:param aV:
	:type aV: TopoDS_Vertex &
	:param aIC:
	:type aIC: IntTools_Curve &
	:param aTolC:
	:type aTolC: float
	:param aT:
	:type aT: float &
	:rtype: bool
") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine (const TopoDS_Vertex & aV,const IntTools_Curve & aIC,const Standard_Real aTolC,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "	* Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant)

	:param aV:
	:type aV: TopoDS_Vertex &
	:param aTolV:
	:type aTolV: float
	:param aIC:
	:type aIC: IntTools_Curve &
	:param aTolC:
	:type aTolC: float
	:param aT:
	:type aT: float &
	:rtype: bool
") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine (const TopoDS_Vertex & aV,const Standard_Real aTolV,const IntTools_Curve & aIC,const Standard_Real aTolC,Standard_Real &OutValue);
		%feature("compactdefaultargs") ProjectPointOnEdge;
		%feature("autodoc", "	* Computes parameter of the point aP on the edge aE. Returns false if projection algorithm failed other wiese returns true.

	:param aP:
	:type aP: gp_Pnt
	:param aE:
	:type aE: TopoDS_Edge &
	:param aT:
	:type aT: float &
	:rtype: bool
") ProjectPointOnEdge;
		Standard_Boolean ProjectPointOnEdge (const gp_Pnt & aP,const TopoDS_Edge & aE,Standard_Real &OutValue);
};


%extend BOPInt_Context {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BOPInt_Context(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BOPInt_Context::Handle_BOPInt_Context %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor BOPInt_ShrunkRange;
class BOPInt_ShrunkRange {
	public:
		%feature("compactdefaultargs") BOPInt_ShrunkRange;
		%feature("autodoc", "	:rtype: None
") BOPInt_ShrunkRange;
		 BOPInt_ShrunkRange ();
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	:param aE:
	:type aE: TopoDS_Edge &
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aV1:
	:type aV1: TopoDS_Vertex &
	:param aV2:
	:type aV2: TopoDS_Vertex &
	:rtype: None
") SetData;
		void SetData (const TopoDS_Edge & aE,const Standard_Real aT1,const Standard_Real aT2,const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	:param aCtx:
	:type aCtx: Handle_BOPInt_Context &
	:rtype: None
") SetContext;
		void SetContext (const Handle_BOPInt_Context & aCtx);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	:rtype: Handle_BOPInt_Context
") Context;
		Handle_BOPInt_Context Context ();
		%feature("compactdefaultargs") SetShrunkRange;
		%feature("autodoc", "	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None
") SetShrunkRange;
		void SetShrunkRange (const Standard_Real aT1,const Standard_Real aT2);
		%feature("compactdefaultargs") ShrunkRange;
		%feature("autodoc", "	:param aT1:
	:type aT1: float &
	:param aT2:
	:type aT2: float &
	:rtype: None
") ShrunkRange;
		void ShrunkRange (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", "	:rtype: Bnd_Box
") BndBox;
		const Bnd_Box & BndBox ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "	* Returns code of computing shrunk range completion 0 - means successful completion 1 - nothing has been done 2 - initial range is out of edge's range 3 - first boundary of initial range is more than last boundary 4 - projection of first vertex failed 5 - projection of second vertex failed 6 - shrunk range can not be computed shrunk range is setted to initial range

	:rtype: int
") ErrorStatus;
		Standard_Integer ErrorStatus ();
};


class BOPInt_Tools {
	public:
		%feature("compactdefaultargs") CheckCurve;
		%feature("autodoc", "	:param theC:
	:type theC: Handle_Geom_Curve &
	:param theTol:
	:type theTol: float
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: bool
") CheckCurve;
		static Standard_Boolean CheckCurve (const Handle_Geom_Curve & theC,const Standard_Real theTol,Bnd_Box & theBox);
		%feature("compactdefaultargs") IsOnPave;
		%feature("autodoc", "	:param theT:
	:type theT: float
	:param theRange:
	:type theRange: IntTools_Range &
	:param theTol:
	:type theTol: float
	:rtype: bool
") IsOnPave;
		static Standard_Boolean IsOnPave (const Standard_Real theT,const IntTools_Range & theRange,const Standard_Real theTol);
		%feature("compactdefaultargs") VertexParameters;
		%feature("autodoc", "	:param theCP:
	:type theCP: IntTools_CommonPrt &
	:param theT1:
	:type theT1: float &
	:param theT2:
	:type theT2: float &
	:rtype: void
") VertexParameters;
		static void VertexParameters (const IntTools_CommonPrt & theCP,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexParameter;
		%feature("autodoc", "	:param theCP:
	:type theCP: IntTools_CommonPrt &
	:param theT:
	:type theT: float &
	:rtype: void
") VertexParameter;
		static void VertexParameter (const IntTools_CommonPrt & theCP,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsOnPave1;
		%feature("autodoc", "	:param theT:
	:type theT: float
	:param theRange:
	:type theRange: IntTools_Range &
	:param theTol:
	:type theTol: float
	:rtype: bool
") IsOnPave1;
		static Standard_Boolean IsOnPave1 (const Standard_Real theT,const IntTools_Range & theRange,const Standard_Real theTol);
		%feature("compactdefaultargs") IsInRange;
		%feature("autodoc", "	* Checks if the range <theR> interfere with the range <theRRef>

	:param theRRef:
	:type theRRef: IntTools_Range &
	:param theR:
	:type theR: IntTools_Range &
	:param theTol:
	:type theTol: float
	:rtype: bool
") IsInRange;
		static Standard_Boolean IsInRange (const IntTools_Range & theRRef,const IntTools_Range & theR,const Standard_Real theTol);
		%feature("compactdefaultargs") SegPln;
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param theTLin1:
	:type theTLin1: float
	:param theTLin2:
	:type theTLin2: float
	:param theTolLin:
	:type theTolLin: float
	:param thePln:
	:type thePln: gp_Pln
	:param theTolPln:
	:type theTolPln: float
	:param theP:
	:type theP: gp_Pnt
	:param theT:
	:type theT: float &
	:param theTolP:
	:type theTolP: float &
	:param theTmin:
	:type theTmin: float &
	:param theTmax:
	:type theTmax: float &
	:rtype: int
") SegPln;
		static Standard_Integer SegPln (const gp_Lin & theLin,const Standard_Real theTLin1,const Standard_Real theTLin2,const Standard_Real theTolLin,const gp_Pln & thePln,const Standard_Real theTolPln,gp_Pnt & theP,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


