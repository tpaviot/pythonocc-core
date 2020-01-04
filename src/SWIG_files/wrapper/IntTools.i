/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define INTTOOLSDOCSTRING
"IntTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_inttools.html"
%enddef
%module (package="OCC.Core", docstring=INTTOOLSDOCSTRING) IntTools


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
#include<IntTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<GeomAPI_module.hxx>
#include<BRepClass3d_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<IntSurf_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<IntPatch_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<GeomInt_module.hxx>
#include<AppParCurves_module.hxx>
#include<IntRes2d_module.hxx>
#include<Geom2dInt_module.hxx>
#include<Adaptor3d_module.hxx>
#include<FEmTool_module.hxx>
#include<Extrema_module.hxx>
#include<IntAna_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Quantity_module.hxx>
#include<HatchGen_module.hxx>
#include<TopLoc_module.hxx>
#include<Approx_module.hxx>
#include<BRepClass3d_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepAdaptor.i
%import TopoDS.i
%import gp.i
%import Geom.i
%import TopAbs.i
%import Bnd.i
%import Geom2dHatch.i
%import GeomAPI.i
%import BRepClass3d.i
%import Geom2d.i
%import GeomAbs.i
%import IntSurf.i
%import TColStd.i
%import Adaptor3d.i
%import IntPatch.i
%import GeomAdaptor.i
%import GeomInt.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(IntTools_Context)
%wrap_handle(IntTools_TopolTool)
/* end handles declaration */

/* templates */
%template(IntTools_DataMapOfSurfaceSampleBox) NCollection_DataMap <IntTools_SurfaceRangeSample , Bnd_Box , IntTools_SurfaceRangeSampleMapHasher>;
%template(IntTools_SequenceOfCommonPrts) NCollection_Sequence <IntTools_CommonPrt>;
%template(IntTools_Array1OfRoots) NCollection_Array1 <IntTools_Root>;

%extend NCollection_Array1 <IntTools_Root> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IntTools_MapOfCurveSample) NCollection_Map <IntTools_CurveRangeSample , IntTools_CurveRangeSampleMapHasher>;
%template(IntTools_SequenceOfCurves) NCollection_Sequence <IntTools_Curve>;
%template(IntTools_ListOfSurfaceRangeSample) NCollection_List <IntTools_SurfaceRangeSample>;
%template(IntTools_ListIteratorOfListOfSurfaceRangeSample) NCollection_TListIterator<IntTools_SurfaceRangeSample>;
%template(IntTools_ListOfCurveRangeSample) NCollection_List <IntTools_CurveRangeSample>;
%template(IntTools_ListIteratorOfListOfCurveRangeSample) NCollection_TListIterator<IntTools_CurveRangeSample>;
%template(IntTools_Array1OfRange) NCollection_Array1 <IntTools_Range>;

%extend NCollection_Array1 <IntTools_Range> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(IntTools_ListOfBox) NCollection_List <Bnd_Box>;
%template(IntTools_ListIteratorOfListOfBox) NCollection_TListIterator<Bnd_Box>;
%template(IntTools_MapOfSurfaceSample) NCollection_Map <IntTools_SurfaceRangeSample , IntTools_SurfaceRangeSampleMapHasher>;
%template(IntTools_SequenceOfRanges) NCollection_Sequence <IntTools_Range>;
%template(IntTools_SequenceOfRoots) NCollection_Sequence <IntTools_Root>;
%template(IntTools_SequenceOfPntOn2Faces) NCollection_Sequence <IntTools_PntOn2Faces>;
%template(IntTools_DataMapOfCurveSampleBox) NCollection_DataMap <IntTools_CurveRangeSample , Bnd_Box , IntTools_CurveRangeSampleMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <IntTools_SurfaceRangeSample , Bnd_Box , IntTools_SurfaceRangeSampleMapHasher> IntTools_DataMapOfSurfaceSampleBox;
typedef NCollection_DataMap <IntTools_SurfaceRangeSample , Bnd_Box , IntTools_SurfaceRangeSampleMapHasher>::Iterator IntTools_DataMapIteratorOfDataMapOfSurfaceSampleBox;
typedef NCollection_Sequence <IntTools_CommonPrt> IntTools_SequenceOfCommonPrts;
typedef NCollection_Array1 <IntTools_Root> IntTools_Array1OfRoots;
typedef NCollection_Map <IntTools_CurveRangeSample , IntTools_CurveRangeSampleMapHasher> IntTools_MapOfCurveSample;
typedef NCollection_Map <IntTools_CurveRangeSample , IntTools_CurveRangeSampleMapHasher>::Iterator IntTools_MapIteratorOfMapOfCurveSample;
typedef NCollection_Sequence <IntTools_Curve> IntTools_SequenceOfCurves;
typedef NCollection_List <IntTools_SurfaceRangeSample> IntTools_ListOfSurfaceRangeSample;
typedef NCollection_List <IntTools_SurfaceRangeSample>::Iterator IntTools_ListIteratorOfListOfSurfaceRangeSample;
typedef NCollection_List <IntTools_CurveRangeSample> IntTools_ListOfCurveRangeSample;
typedef NCollection_List <IntTools_CurveRangeSample>::Iterator IntTools_ListIteratorOfListOfCurveRangeSample;
typedef NCollection_Array1 <IntTools_Range> IntTools_Array1OfRange;
typedef NCollection_List <Bnd_Box> IntTools_ListOfBox;
typedef NCollection_List <Bnd_Box>::Iterator IntTools_ListIteratorOfListOfBox;
typedef NCollection_Map <IntTools_SurfaceRangeSample , IntTools_SurfaceRangeSampleMapHasher> IntTools_MapOfSurfaceSample;
typedef NCollection_Map <IntTools_SurfaceRangeSample , IntTools_SurfaceRangeSampleMapHasher>::Iterator IntTools_MapIteratorOfMapOfSurfaceSample;
typedef NCollection_Sequence <IntTools_Range> IntTools_SequenceOfRanges;
typedef NCollection_Sequence <IntTools_Root> IntTools_SequenceOfRoots;
typedef NCollection_Sequence <IntTools_PntOn2Faces> IntTools_SequenceOfPntOn2Faces;
typedef NCollection_DataMap <IntTools_CurveRangeSample , Bnd_Box , IntTools_CurveRangeSampleMapHasher> IntTools_DataMapOfCurveSampleBox;
typedef NCollection_DataMap <IntTools_CurveRangeSample , Bnd_Box , IntTools_CurveRangeSampleMapHasher>::Iterator IntTools_DataMapIteratorOfDataMapOfCurveSampleBox;
/* end typedefs declaration */

/*****************
* class IntTools *
*****************/
%rename(inttools) IntTools;
class IntTools {
	public:
		/****************** FindRootStates ******************/
		%feature("compactdefaultargs") FindRootStates;
		%feature("autodoc", "* Find the states (before and after) for each Root from the sequence aSeq
	:param aSeq:
	:type aSeq: IntTools_SequenceOfRoots
	:param anEpsNull:
	:type anEpsNull: float
	:rtype: void") FindRootStates;
		static void FindRootStates (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsNull);

		/****************** GetRadius ******************/
		%feature("compactdefaultargs") GetRadius;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:param t1:
	:type t1: float
	:param t3:
	:type t3: float
	:param R:
	:type R: float
	:rtype: int") GetRadius;
		static Standard_Integer GetRadius (const BRepAdaptor_Curve & C,const Standard_Real t1,const Standard_Real t3,Standard_Real &OutValue);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* returns the length of the edge;
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") Length;
		static Standard_Real Length (const TopoDS_Edge & E);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Geom_Curve
	:param aParm:
	:type aParm: float
	:rtype: int") Parameter;
		static Standard_Integer Parameter (const gp_Pnt & P,const opencascade::handle<Geom_Curve> & Curve,Standard_Real &OutValue);

		/****************** PrepareArgs ******************/
		%feature("compactdefaultargs") PrepareArgs;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:param tMax:
	:type tMax: float
	:param tMin:
	:type tMin: float
	:param Discret:
	:type Discret: int
	:param Deflect:
	:type Deflect: float
	:param anArgs:
	:type anArgs: IntTools_CArray1OfReal
	:rtype: int") PrepareArgs;
		static Standard_Integer PrepareArgs (BRepAdaptor_Curve & C,const Standard_Real tMax,const Standard_Real tMin,const Standard_Integer Discret,const Standard_Real Deflect,IntTools_CArray1OfReal & anArgs);

		/****************** RemoveIdenticalRoots ******************/
		%feature("compactdefaultargs") RemoveIdenticalRoots;
		%feature("autodoc", "* Remove from the sequence aSeq the Roots that have values ti and tj such as |ti-tj] < anEpsT.
	:param aSeq:
	:type aSeq: IntTools_SequenceOfRoots
	:param anEpsT:
	:type anEpsT: float
	:rtype: void") RemoveIdenticalRoots;
		static void RemoveIdenticalRoots (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsT);

		/****************** SortRoots ******************/
		%feature("compactdefaultargs") SortRoots;
		%feature("autodoc", "* Sort the sequence aSeq of the Roots to arrange the Roons in increasing order
	:param aSeq:
	:type aSeq: IntTools_SequenceOfRoots
	:param anEpsT:
	:type anEpsT: float
	:rtype: void") SortRoots;
		static void SortRoots (IntTools_SequenceOfRoots & aSeq,const Standard_Real anEpsT);

};


%extend IntTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntTools_BaseRangeSample *
*********************************/
class IntTools_BaseRangeSample {
	public:
		/****************** GetDepth ******************/
		%feature("compactdefaultargs") GetDepth;
		%feature("autodoc", ":rtype: int") GetDepth;
		Standard_Integer GetDepth ();

		/****************** IntTools_BaseRangeSample ******************/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", ":rtype: None") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample ();

		/****************** IntTools_BaseRangeSample ******************/
		%feature("compactdefaultargs") IntTools_BaseRangeSample;
		%feature("autodoc", ":param theDepth:
	:type theDepth: int
	:rtype: None") IntTools_BaseRangeSample;
		 IntTools_BaseRangeSample (const Standard_Integer theDepth);

		/****************** SetDepth ******************/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", ":param theDepth:
	:type theDepth: int
	:rtype: None") SetDepth;
		void SetDepth (const Standard_Integer theDepth);

};


%extend IntTools_BaseRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IntTools_BeanFaceIntersector *
*************************************/
class IntTools_BeanFaceIntersector {
	public:
		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Gets the intersecton context
	:rtype: opencascade::handle<IntTools_Context>") Context;
		const opencascade::handle<IntTools_Context> & Context ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the algorithm //! Warning: The parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the algorithm
	:param theCurve:
	:type theCurve: BRepAdaptor_Curve
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None") Init;
		void Init (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the algorithm theUMinParameter, ... are used for optimization purposes
	:param theCurve:
	:type theCurve: BRepAdaptor_Curve
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface
	:param theFirstParOnCurve:
	:type theFirstParOnCurve: float
	:param theLastParOnCurve:
	:type theLastParOnCurve: float
	:param theUMinParameter:
	:type theUMinParameter: float
	:param theUMaxParameter:
	:type theUMaxParameter: float
	:param theVMinParameter:
	:type theVMinParameter: float
	:param theVMaxParameter:
	:type theVMaxParameter: float
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None") Init;
		void Init (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve,const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", ":rtype: None") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector ();

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "* Initializes the algorithm //! Warning: The parts of the edge which are on the surface of the face and belong to the whole in the face (if there is) is considered as result
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace);

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "* Initializes the algorithm
	:param theCurve:
	:type theCurve: BRepAdaptor_Curve
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);

		/****************** IntTools_BeanFaceIntersector ******************/
		%feature("compactdefaultargs") IntTools_BeanFaceIntersector;
		%feature("autodoc", "* Initializes the algorithm theUMinParameter, ... are used for optimization purposes
	:param theCurve:
	:type theCurve: BRepAdaptor_Curve
	:param theSurface:
	:type theSurface: BRepAdaptor_Surface
	:param theFirstParOnCurve:
	:type theFirstParOnCurve: float
	:param theLastParOnCurve:
	:type theLastParOnCurve: float
	:param theUMinParameter:
	:type theUMinParameter: float
	:param theUMaxParameter:
	:type theUMaxParameter: float
	:param theVMinParameter:
	:type theVMinParameter: float
	:param theVMaxParameter:
	:type theVMaxParameter: float
	:param theBeanTolerance:
	:type theBeanTolerance: float
	:param theFaceTolerance:
	:type theFaceTolerance: float
	:rtype: None") IntTools_BeanFaceIntersector;
		 IntTools_BeanFaceIntersector (const BRepAdaptor_Curve & theCurve,const BRepAdaptor_Surface & theSurface,const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve,const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter,const Standard_Real theBeanTolerance,const Standard_Real theFaceTolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns Done/NotDone state of the algorithm.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Launches the algorithm
	:rtype: None") Perform;
		void Perform ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", ":rtype: IntTools_SequenceOfRanges") Result;
		const IntTools_SequenceOfRanges & Result ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", ":param theResults:
	:type theResults: IntTools_SequenceOfRanges
	:rtype: None") Result;
		void Result (IntTools_SequenceOfRanges & theResults);

		/****************** SetBeanParameters ******************/
		%feature("compactdefaultargs") SetBeanParameters;
		%feature("autodoc", "* Set restrictions for curve
	:param theFirstParOnCurve:
	:type theFirstParOnCurve: float
	:param theLastParOnCurve:
	:type theLastParOnCurve: float
	:rtype: None") SetBeanParameters;
		void SetBeanParameters (const Standard_Real theFirstParOnCurve,const Standard_Real theLastParOnCurve);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets the intersecton context
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetSurfaceParameters ******************/
		%feature("compactdefaultargs") SetSurfaceParameters;
		%feature("autodoc", "* Set restrictions for surface
	:param theUMinParameter:
	:type theUMinParameter: float
	:param theUMaxParameter:
	:type theUMaxParameter: float
	:param theVMinParameter:
	:type theVMinParameter: float
	:param theVMaxParameter:
	:type theVMaxParameter: float
	:rtype: None") SetSurfaceParameters;
		void SetSurfaceParameters (const Standard_Real theUMinParameter,const Standard_Real theUMaxParameter,const Standard_Real theVMinParameter,const Standard_Real theVMaxParameter);

};


%extend IntTools_BeanFaceIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntTools_CArray1OfInteger *
**********************************/
/*******************************
* class IntTools_CArray1OfReal *
*******************************/
/***************************
* class IntTools_CommonPrt *
***************************/
class IntTools_CommonPrt {
	public:
		/****************** AllNullFlag ******************/
		%feature("compactdefaultargs") AllNullFlag;
		%feature("autodoc", "* Modifier
	:rtype: bool") AllNullFlag;
		Standard_Boolean AllNullFlag ();

		/****************** AppendRange2 ******************/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "* Appends the range of second edge.
	:param aR:
	:type aR: IntTools_Range
	:rtype: None") AppendRange2;
		void AppendRange2 (const IntTools_Range & aR);

		/****************** AppendRange2 ******************/
		%feature("compactdefaultargs") AppendRange2;
		%feature("autodoc", "* Appends the range of second edge.
	:param tf:
	:type tf: float
	:param tl:
	:type tl: float
	:rtype: None") AppendRange2;
		void AppendRange2 (const Standard_Real tf,const Standard_Real tl);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_CommonPrt
	:rtype: IntTools_CommonPrt") Assign;
		IntTools_CommonPrt & Assign (const IntTools_CommonPrt & Other);

		/****************** BoundingPoints ******************/
		%feature("compactdefaultargs") BoundingPoints;
		%feature("autodoc", "* Selector
	:param aP1:
	:type aP1: gp_Pnt
	:param aP2:
	:type aP2: gp_Pnt
	:rtype: None") BoundingPoints;
		void BoundingPoints (gp_Pnt & aP1,gp_Pnt & aP2);

		/****************** ChangeRanges2 ******************/
		%feature("compactdefaultargs") ChangeRanges2;
		%feature("autodoc", "* Returns the ranges of second edge.
	:rtype: IntTools_SequenceOfRanges") ChangeRanges2;
		IntTools_SequenceOfRanges & ChangeRanges2 ();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copies me to anOther
	:param anOther:
	:type anOther: IntTools_CommonPrt
	:rtype: None") Copy;
		void Copy (IntTools_CommonPrt & anOther);

		/****************** Edge1 ******************/
		%feature("compactdefaultargs") Edge1;
		%feature("autodoc", "* Returns the first edge.
	:rtype: TopoDS_Edge") Edge1;
		const TopoDS_Edge  Edge1 ();

		/****************** Edge2 ******************/
		%feature("compactdefaultargs") Edge2;
		%feature("autodoc", "* Returns the second edge
	:rtype: TopoDS_Edge") Edge2;
		const TopoDS_Edge  Edge2 ();

		/****************** IntTools_CommonPrt ******************/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_CommonPrt;
		 IntTools_CommonPrt ();

		/****************** IntTools_CommonPrt ******************/
		%feature("compactdefaultargs") IntTools_CommonPrt;
		%feature("autodoc", "* Copy constructor
	:param aCPrt:
	:type aCPrt: IntTools_CommonPrt
	:rtype: None") IntTools_CommonPrt;
		 IntTools_CommonPrt (const IntTools_CommonPrt & aCPrt);

		/****************** Range1 ******************/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "* Returns the range of first edge
	:rtype: IntTools_Range") Range1;
		const IntTools_Range & Range1 ();

		/****************** Range1 ******************/
		%feature("compactdefaultargs") Range1;
		%feature("autodoc", "* Returns the range of first edge.
	:param tf:
	:type tf: float
	:param tl:
	:type tl: float
	:rtype: None") Range1;
		void Range1 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Ranges2 ******************/
		%feature("compactdefaultargs") Ranges2;
		%feature("autodoc", "* Returns the ranges of second edge.
	:rtype: IntTools_SequenceOfRanges") Ranges2;
		const IntTools_SequenceOfRanges & Ranges2 ();

		/****************** SetAllNullFlag ******************/
		%feature("compactdefaultargs") SetAllNullFlag;
		%feature("autodoc", "* Selector
	:param aFlag:
	:type aFlag: bool
	:rtype: None") SetAllNullFlag;
		void SetAllNullFlag (const Standard_Boolean aFlag);

		/****************** SetBoundingPoints ******************/
		%feature("compactdefaultargs") SetBoundingPoints;
		%feature("autodoc", "* Modifier
	:param aP1:
	:type aP1: gp_Pnt
	:param aP2:
	:type aP2: gp_Pnt
	:rtype: None") SetBoundingPoints;
		void SetBoundingPoints (const gp_Pnt & aP1,const gp_Pnt & aP2);

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "* Sets the first edge.
	:param anE:
	:type anE: TopoDS_Edge
	:rtype: None") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & anE);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "* Sets the second edge.
	:param anE:
	:type anE: TopoDS_Edge
	:rtype: None") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & anE);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "* Sets the range of first edge.
	:param aR:
	:type aR: IntTools_Range
	:rtype: None") SetRange1;
		void SetRange1 (const IntTools_Range & aR);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "* Sets the range of first edge.
	:param tf:
	:type tf: float
	:param tl:
	:type tl: float
	:rtype: None") SetRange1;
		void SetRange1 (const Standard_Real tf,const Standard_Real tl);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets the type of the common part Vertex or Edge
	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None") SetType;
		void SetType (const TopAbs_ShapeEnum aType);

		/****************** SetVertexParameter1 ******************/
		%feature("compactdefaultargs") SetVertexParameter1;
		%feature("autodoc", "* Sets a parameter of first vertex
	:param tV:
	:type tV: float
	:rtype: None") SetVertexParameter1;
		void SetVertexParameter1 (const Standard_Real tV);

		/****************** SetVertexParameter2 ******************/
		%feature("compactdefaultargs") SetVertexParameter2;
		%feature("autodoc", "* Sets a parameter of second vertex
	:param tV:
	:type tV: float
	:rtype: None") SetVertexParameter2;
		void SetVertexParameter2 (const Standard_Real tV);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of the common part
	:rtype: TopAbs_ShapeEnum") Type;
		TopAbs_ShapeEnum Type ();

		/****************** VertexParameter1 ******************/
		%feature("compactdefaultargs") VertexParameter1;
		%feature("autodoc", "* Returns parameter of first vertex
	:rtype: float") VertexParameter1;
		Standard_Real VertexParameter1 ();

		/****************** VertexParameter2 ******************/
		%feature("compactdefaultargs") VertexParameter2;
		%feature("autodoc", "* Returns parameter of second vertex
	:rtype: float") VertexParameter2;
		Standard_Real VertexParameter2 ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_CommonPrt
	:rtype: IntTools_CommonPrt") operator =;
		IntTools_CommonPrt & operator = (const IntTools_CommonPrt & Other);

};


%extend IntTools_CommonPrt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntTools_Context *
*************************/
class IntTools_Context : public Standard_Transient {
	public:
		/****************** BndBox ******************/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", ":param theS:
	:type theS: TopoDS_Shape
	:rtype: Bnd_Box") BndBox;
		Bnd_Box & BndBox (const TopoDS_Shape & theS);

		/****************** ComputePE ******************/
		%feature("compactdefaultargs") ComputePE;
		%feature("autodoc", "* Computes parameter of the Point theP on the edge aE. Returns zero if the distance between point and edge is less than sum of tolerance value of edge and theTopP, otherwise and for following conditions returns negative value 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3)
	:param theP:
	:type theP: gp_Pnt
	:param theTolP:
	:type theTolP: float
	:param theE:
	:type theE: TopoDS_Edge
	:param theT:
	:type theT: float
	:param theDist:
	:type theDist: float
	:rtype: int") ComputePE;
		Standard_Integer ComputePE (const gp_Pnt & theP,const Standard_Real theTolP,const TopoDS_Edge & theE,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ComputeVE ******************/
		%feature("compactdefaultargs") ComputeVE;
		%feature("autodoc", "* Computes parameter of the vertex aV on the edge aE and correct tolerance value for the vertex on the edge. Returns zero if the distance between vertex and edge is less than sum of tolerances and the fuzzy value, otherwise and for following conditions returns negative value: 1. the edge is degenerated (-1) 2. the edge does not contain 3d curve and pcurves (-2) 3. projection algorithm failed (-3)
	:param theV:
	:type theV: TopoDS_Vertex
	:param theE:
	:type theE: TopoDS_Edge
	:param theT:
	:type theT: float
	:param theTol:
	:type theTol: float
	:param theFuzz: default value is Precision::Confusion()
	:type theFuzz: float
	:rtype: int") ComputeVE;
		Standard_Integer ComputeVE (const TopoDS_Vertex & theV,const TopoDS_Edge & theE,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real theFuzz = Precision::Confusion());

		/****************** ComputeVF ******************/
		%feature("compactdefaultargs") ComputeVF;
		%feature("autodoc", "* Computes UV parameters of the vertex aV on face aF and correct tolerance value for the vertex on the face. Returns zero if the distance between vertex and face is less than or equal the sum of tolerances and the fuzzy value and the projection point lays inside boundaries of the face. For following conditions returns negative value 1. projection algorithm failed (-1) 2. distance is more than sum of tolerances (-2) 3. projection point out or on the boundaries of face (-3)
	:param theVertex:
	:type theVertex: TopoDS_Vertex
	:param theFace:
	:type theFace: TopoDS_Face
	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:param theTol:
	:type theTol: float
	:param theFuzz: default value is Precision::Confusion()
	:type theFuzz: float
	:rtype: int") ComputeVF;
		Standard_Integer ComputeVF (const TopoDS_Vertex & theVertex,const TopoDS_Face & theFace,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real theFuzz = Precision::Confusion());

		/****************** FClass2d ******************/
		%feature("compactdefaultargs") FClass2d;
		%feature("autodoc", "* Returns a reference to point classifier for given face
	:param aF:
	:type aF: TopoDS_Face
	:rtype: IntTools_FClass2d") FClass2d;
		IntTools_FClass2d & FClass2d (const TopoDS_Face & aF);

		/****************** Hatcher ******************/
		%feature("compactdefaultargs") Hatcher;
		%feature("autodoc", "* Returns a reference to 2D hatcher for given face
	:param aF:
	:type aF: TopoDS_Face
	:rtype: Geom2dHatch_Hatcher") Hatcher;
		Geom2dHatch_Hatcher & Hatcher (const TopoDS_Face & aF);

		/****************** IntTools_Context ******************/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", ":rtype: None") IntTools_Context;
		 IntTools_Context ();

		/****************** IntTools_Context ******************/
		%feature("compactdefaultargs") IntTools_Context;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") IntTools_Context;
		 IntTools_Context (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** IsInfiniteFace ******************/
		%feature("compactdefaultargs") IsInfiniteFace;
		%feature("autodoc", "* Returns true if the solid <theFace> has infinite bounds
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: bool") IsInfiniteFace;
		Standard_Boolean IsInfiniteFace (const TopoDS_Face & theFace);

		/****************** IsPointInFace ******************/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "* Returns true if the point aP2D is inside the boundaries of the face aF, otherwise returns false
	:param aF:
	:type aF: TopoDS_Face
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:rtype: bool") IsPointInFace;
		Standard_Boolean IsPointInFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);

		/****************** IsPointInFace ******************/
		%feature("compactdefaultargs") IsPointInFace;
		%feature("autodoc", "* Returns true if the point aP2D is inside the boundaries of the face aF, otherwise returns false
	:param aP3D:
	:type aP3D: gp_Pnt
	:param aF:
	:type aF: TopoDS_Face
	:param aTol:
	:type aTol: float
	:rtype: bool") IsPointInFace;
		Standard_Boolean IsPointInFace (const gp_Pnt & aP3D,const TopoDS_Face & aF,const Standard_Real aTol);

		/****************** IsPointInOnFace ******************/
		%feature("compactdefaultargs") IsPointInOnFace;
		%feature("autodoc", "* Returns true if the point aP2D is inside or on the boundaries of aF
	:param aF:
	:type aF: TopoDS_Face
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:rtype: bool") IsPointInOnFace;
		Standard_Boolean IsPointInOnFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);

		/****************** IsValidBlockForFace ******************/
		%feature("compactdefaultargs") IsValidBlockForFace;
		%feature("autodoc", "* Returns true if IsValidPointForFace returns true for some 3d point that lay on the curve aIC bounded by parameters aT1 and aT2
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aIC:
	:type aIC: IntTools_Curve
	:param aF:
	:type aF: TopoDS_Face
	:param aTol:
	:type aTol: float
	:rtype: bool") IsValidBlockForFace;
		Standard_Boolean IsValidBlockForFace (const Standard_Real aT1,const Standard_Real aT2,const IntTools_Curve & aIC,const TopoDS_Face & aF,const Standard_Real aTol);

		/****************** IsValidBlockForFaces ******************/
		%feature("compactdefaultargs") IsValidBlockForFaces;
		%feature("autodoc", "* Returns true if IsValidBlockForFace returns true for both faces aF1 and aF2
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aIC:
	:type aIC: IntTools_Curve
	:param aF1:
	:type aF1: TopoDS_Face
	:param aF2:
	:type aF2: TopoDS_Face
	:param aTol:
	:type aTol: float
	:rtype: bool") IsValidBlockForFaces;
		Standard_Boolean IsValidBlockForFaces (const Standard_Real aT1,const Standard_Real aT2,const IntTools_Curve & aIC,const TopoDS_Face & aF1,const TopoDS_Face & aF2,const Standard_Real aTol);

		/****************** IsValidPointForFace ******************/
		%feature("compactdefaultargs") IsValidPointForFace;
		%feature("autodoc", "* Returns true if the distance between point aP3D and face aF is less or equal to tolerance aTol and projection point is inside or on the boundaries of the face aF
	:param aP3D:
	:type aP3D: gp_Pnt
	:param aF:
	:type aF: TopoDS_Face
	:param aTol:
	:type aTol: float
	:rtype: bool") IsValidPointForFace;
		Standard_Boolean IsValidPointForFace (const gp_Pnt & aP3D,const TopoDS_Face & aF,const Standard_Real aTol);

		/****************** IsValidPointForFaces ******************/
		%feature("compactdefaultargs") IsValidPointForFaces;
		%feature("autodoc", "* Returns true if IsValidPointForFace returns true for both face aF1 and aF2
	:param aP3D:
	:type aP3D: gp_Pnt
	:param aF1:
	:type aF1: TopoDS_Face
	:param aF2:
	:type aF2: TopoDS_Face
	:param aTol:
	:type aTol: float
	:rtype: bool") IsValidPointForFaces;
		Standard_Boolean IsValidPointForFaces (const gp_Pnt & aP3D,const TopoDS_Face & aF1,const TopoDS_Face & aF2,const Standard_Real aTol);

		/****************** IsVertexOnLine ******************/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "* Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant)
	:param aV:
	:type aV: TopoDS_Vertex
	:param aIC:
	:type aIC: IntTools_Curve
	:param aTolC:
	:type aTolC: float
	:param aT:
	:type aT: float
	:rtype: bool") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine (const TopoDS_Vertex & aV,const IntTools_Curve & aIC,const Standard_Real aTolC,Standard_Real &OutValue);

		/****************** IsVertexOnLine ******************/
		%feature("compactdefaultargs") IsVertexOnLine;
		%feature("autodoc", "* Computes parameter of the vertex aV on the curve aIC. Returns true if the distance between vertex and curve is less than sum of tolerance of aV and aTolC, otherwise or if projection algorithm failed returns false (in this case aT isn't significant)
	:param aV:
	:type aV: TopoDS_Vertex
	:param aTolV:
	:type aTolV: float
	:param aIC:
	:type aIC: IntTools_Curve
	:param aTolC:
	:type aTolC: float
	:param aT:
	:type aT: float
	:rtype: bool") IsVertexOnLine;
		Standard_Boolean IsVertexOnLine (const TopoDS_Vertex & aV,const Standard_Real aTolV,const IntTools_Curve & aIC,const Standard_Real aTolC,Standard_Real &OutValue);

		/****************** OBB ******************/
		%feature("compactdefaultargs") OBB;
		%feature("autodoc", "* Builds and stores an Oriented Bounding Box for the shape. Returns a reference to OBB.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theFuzzyValue: default value is Precision::Confusion()
	:type theFuzzyValue: float
	:rtype: Bnd_OBB") OBB;
		Bnd_OBB & OBB (const TopoDS_Shape & theShape,const Standard_Real theFuzzyValue = Precision::Confusion());

		/****************** ProjPC ******************/
		%feature("compactdefaultargs") ProjPC;
		%feature("autodoc", "* Returns a reference to point projector for given edge
	:param aE:
	:type aE: TopoDS_Edge
	:rtype: GeomAPI_ProjectPointOnCurve") ProjPC;
		GeomAPI_ProjectPointOnCurve & ProjPC (const TopoDS_Edge & aE);

		/****************** ProjPS ******************/
		%feature("compactdefaultargs") ProjPS;
		%feature("autodoc", "* Returns a reference to point projector for given face
	:param aF:
	:type aF: TopoDS_Face
	:rtype: GeomAPI_ProjectPointOnSurf") ProjPS;
		GeomAPI_ProjectPointOnSurf & ProjPS (const TopoDS_Face & aF);

		/****************** ProjPT ******************/
		%feature("compactdefaultargs") ProjPT;
		%feature("autodoc", "* Returns a reference to point projector for given curve
	:param aC:
	:type aC: Geom_Curve
	:rtype: GeomAPI_ProjectPointOnCurve") ProjPT;
		GeomAPI_ProjectPointOnCurve & ProjPT (const opencascade::handle<Geom_Curve> & aC);

		/****************** ProjectPointOnEdge ******************/
		%feature("compactdefaultargs") ProjectPointOnEdge;
		%feature("autodoc", "* Computes parameter of the point aP on the edge aE. Returns false if projection algorithm failed other wiese returns true.
	:param aP:
	:type aP: gp_Pnt
	:param aE:
	:type aE: TopoDS_Edge
	:param aT:
	:type aT: float
	:rtype: bool") ProjectPointOnEdge;
		Standard_Boolean ProjectPointOnEdge (const gp_Pnt & aP,const TopoDS_Edge & aE,Standard_Real &OutValue);

		/****************** SetPOnSProjectionTolerance ******************/
		%feature("compactdefaultargs") SetPOnSProjectionTolerance;
		%feature("autodoc", "* Sets tolerance to be used for projection of point on surface. Clears map of already cached projectors in order to maintain correct value for all projectors
	:param theValue:
	:type theValue: float
	:rtype: None") SetPOnSProjectionTolerance;
		void SetPOnSProjectionTolerance (const Standard_Real theValue);

		/****************** SolidClassifier ******************/
		%feature("compactdefaultargs") SolidClassifier;
		%feature("autodoc", "* Returns a reference to solid classifier for given solid
	:param aSolid:
	:type aSolid: TopoDS_Solid
	:rtype: BRepClass3d_SolidClassifier") SolidClassifier;
		BRepClass3d_SolidClassifier & SolidClassifier (const TopoDS_Solid & aSolid);

		/****************** StatePointFace ******************/
		%feature("compactdefaultargs") StatePointFace;
		%feature("autodoc", "* Returns the state of the point aP2D relative to face aF
	:param aF:
	:type aF: TopoDS_Face
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:rtype: TopAbs_State") StatePointFace;
		TopAbs_State StatePointFace (const TopoDS_Face & aF,const gp_Pnt2d & aP2D);

		/****************** SurfaceAdaptor ******************/
		%feature("compactdefaultargs") SurfaceAdaptor;
		%feature("autodoc", "* Returns a reference to surface adaptor for given face
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: BRepAdaptor_Surface") SurfaceAdaptor;
		BRepAdaptor_Surface & SurfaceAdaptor (const TopoDS_Face & theFace);

		/****************** SurfaceData ******************/
		%feature("compactdefaultargs") SurfaceData;
		%feature("autodoc", "* Returns a reference to surface localization data for given face
	:param aF:
	:type aF: TopoDS_Face
	:rtype: IntTools_SurfaceRangeLocalizeData") SurfaceData;
		IntTools_SurfaceRangeLocalizeData & SurfaceData (const TopoDS_Face & aF);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "* Computes the boundaries of the face using surface adaptor
	:param theFace:
	:type theFace: TopoDS_Face
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None") UVBounds;
		void UVBounds (const TopoDS_Face & theFace,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

};


%make_alias(IntTools_Context)

%extend IntTools_Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntTools_Curve *
***********************/
class IntTools_Curve {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* If the 3d curve is bounded curve the method will return True and modify the output parameters with boundary parameters of the curve and corresponded 3d points. If the curve does not have bounds, the method will return false and the output parameters will stay untouched.
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: bool") Bounds;
		Standard_Boolean Bounds (Standard_Real &OutValue,Standard_Real &OutValue,gp_Pnt & theFirstPnt,gp_Pnt & theLastPnt);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns 3d curve
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		const opencascade::handle<Geom_Curve> & Curve ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes 3d point corresponded to the given parameter if this parameter is inside the boundaries of the curve. Returns True in this case. Otherwise, the point will not be computed and the method will return False.
	:param thePar:
	:type thePar: float
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: bool") D0;
		Standard_Boolean D0 (const Standard_Real & thePar,gp_Pnt & thePnt);

		/****************** FirstCurve2d ******************/
		%feature("compactdefaultargs") FirstCurve2d;
		%feature("autodoc", "* Returns first 2d curve
	:rtype: opencascade::handle<Geom2d_Curve>") FirstCurve2d;
		const opencascade::handle<Geom2d_Curve> & FirstCurve2d ();

		/****************** HasBounds ******************/
		%feature("compactdefaultargs") HasBounds;
		%feature("autodoc", "* Returns True if 3d curve is BoundedCurve
	:rtype: bool") HasBounds;
		Standard_Boolean HasBounds ();

		/****************** IntTools_Curve ******************/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_Curve;
		 IntTools_Curve ();

		/****************** IntTools_Curve ******************/
		%feature("compactdefaultargs") IntTools_Curve;
		%feature("autodoc", "* Constructor taking 3d curve, two 2d curves and two tolerance values
	:param the3dCurve3d:
	:type the3dCurve3d: Geom_Curve
	:param the2dCurve1:
	:type the2dCurve1: Geom2d_Curve
	:param the2dCurve2:
	:type the2dCurve2: Geom2d_Curve
	:param theTolerance: default value is 0.0
	:type theTolerance: float
	:param theTangentialTolerance: default value is 0.0
	:type theTangentialTolerance: float
	:rtype: None") IntTools_Curve;
		 IntTools_Curve (const opencascade::handle<Geom_Curve> & the3dCurve3d,const opencascade::handle<Geom2d_Curve> & the2dCurve1,const opencascade::handle<Geom2d_Curve> & the2dCurve2,const Standard_Real theTolerance = 0.0,const Standard_Real theTangentialTolerance = 0.0);

		/****************** SecondCurve2d ******************/
		%feature("compactdefaultargs") SecondCurve2d;
		%feature("autodoc", "* Returns second 2d curve
	:rtype: opencascade::handle<Geom2d_Curve>") SecondCurve2d;
		const opencascade::handle<Geom2d_Curve> & SecondCurve2d ();

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "* Sets the 3d curve
	:param the3dCurve:
	:type the3dCurve: Geom_Curve
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<Geom_Curve> & the3dCurve);

		/****************** SetCurves ******************/
		%feature("compactdefaultargs") SetCurves;
		%feature("autodoc", "* Sets the curves
	:param the3dCurve:
	:type the3dCurve: Geom_Curve
	:param the2dCurve1:
	:type the2dCurve1: Geom2d_Curve
	:param the2dCurve2:
	:type the2dCurve2: Geom2d_Curve
	:rtype: None") SetCurves;
		void SetCurves (const opencascade::handle<Geom_Curve> & the3dCurve,const opencascade::handle<Geom2d_Curve> & the2dCurve1,const opencascade::handle<Geom2d_Curve> & the2dCurve2);

		/****************** SetFirstCurve2d ******************/
		%feature("compactdefaultargs") SetFirstCurve2d;
		%feature("autodoc", "* Sets the first 2d curve
	:param the2dCurve1:
	:type the2dCurve1: Geom2d_Curve
	:rtype: None") SetFirstCurve2d;
		void SetFirstCurve2d (const opencascade::handle<Geom2d_Curve> & the2dCurve1);

		/****************** SetSecondCurve2d ******************/
		%feature("compactdefaultargs") SetSecondCurve2d;
		%feature("autodoc", "* Sets the second 2d curve
	:param the2dCurve2:
	:type the2dCurve2: Geom2d_Curve
	:rtype: None") SetSecondCurve2d;
		void SetSecondCurve2d (const opencascade::handle<Geom2d_Curve> & the2dCurve2);

		/****************** SetTangentialTolerance ******************/
		%feature("compactdefaultargs") SetTangentialTolerance;
		%feature("autodoc", "* Sets the tangential tolerance
	:param theTangentialTolerance:
	:type theTangentialTolerance: float
	:rtype: None") SetTangentialTolerance;
		void SetTangentialTolerance (const Standard_Real theTangentialTolerance);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets the tolerance for the curve
	:param theTolerance:
	:type theTolerance: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real theTolerance);

		/****************** TangentialTolerance ******************/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "* Returns the tangential tolerance
	:rtype: float") TangentialTolerance;
		Standard_Real TangentialTolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the tolerance
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of the 3d curve
	:rtype: GeomAbs_CurveType") Type;
		GeomAbs_CurveType Type ();

};


%extend IntTools_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntTools_CurveRangeLocalizeData *
****************************************/
class IntTools_CurveRangeLocalizeData {
	public:
		/****************** AddBox ******************/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_CurveRangeSample
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: None") AddBox;
		void AddBox (const IntTools_CurveRangeSample & theRange,const Bnd_Box & theBox);

		/****************** AddOutRange ******************/
		%feature("compactdefaultargs") AddOutRange;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_CurveRangeSample
	:rtype: None") AddOutRange;
		void AddOutRange (const IntTools_CurveRangeSample & theRange);

		/****************** FindBox ******************/
		%feature("compactdefaultargs") FindBox;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_CurveRangeSample
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: bool") FindBox;
		Standard_Boolean FindBox (const IntTools_CurveRangeSample & theRange,Bnd_Box & theBox);

		/****************** GetMinRange ******************/
		%feature("compactdefaultargs") GetMinRange;
		%feature("autodoc", ":rtype: float") GetMinRange;
		Standard_Real GetMinRange ();

		/****************** GetNbSample ******************/
		%feature("compactdefaultargs") GetNbSample;
		%feature("autodoc", ":rtype: int") GetNbSample;
		Standard_Integer GetNbSample ();

		/****************** IntTools_CurveRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_CurveRangeLocalizeData;
		%feature("autodoc", ":param theNbSample:
	:type theNbSample: int
	:param theMinRange:
	:type theMinRange: float
	:rtype: None") IntTools_CurveRangeLocalizeData;
		 IntTools_CurveRangeLocalizeData (const Standard_Integer theNbSample,const Standard_Real theMinRange);

		/****************** IsRangeOut ******************/
		%feature("compactdefaultargs") IsRangeOut;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_CurveRangeSample
	:rtype: bool") IsRangeOut;
		Standard_Boolean IsRangeOut (const IntTools_CurveRangeSample & theRange);

		/****************** ListRangeOut ******************/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", ":param theList:
	:type theList: IntTools_ListOfCurveRangeSample
	:rtype: None") ListRangeOut;
		void ListRangeOut (IntTools_ListOfCurveRangeSample & theList);

};


%extend IntTools_CurveRangeLocalizeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IntTools_CurveRangeSampleMapHasher *
*******************************************/
class IntTools_CurveRangeSampleMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given key, in the range [1, theUpperBound] @param theKey the key which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theKey:
	:type theKey: IntTools_CurveRangeSample
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const IntTools_CurveRangeSample & theKey,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.
	:param S1:
	:type S1: IntTools_CurveRangeSample
	:param S2:
	:type S2: IntTools_CurveRangeSample
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const IntTools_CurveRangeSample & S1,const IntTools_CurveRangeSample & S2);

};


%extend IntTools_CurveRangeSampleMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_EdgeEdge *
**************************/
class IntTools_EdgeEdge {
	public:
		/****************** CommonParts ******************/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "* Returns common parts
	:rtype: IntTools_SequenceOfCommonPrts") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts ();

		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "* Returns Fuzzy value
	:rtype: float") FuzzyValue;
		Standard_Real FuzzyValue ();

		/****************** IntTools_EdgeEdge ******************/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "* Empty contructor
	:rtype: None") IntTools_EdgeEdge;
		 IntTools_EdgeEdge ();

		/****************** IntTools_EdgeEdge ******************/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "* Contructor
	:param theEdge1:
	:type theEdge1: TopoDS_Edge
	:param theEdge2:
	:type theEdge2: TopoDS_Edge
	:rtype: None") IntTools_EdgeEdge;
		 IntTools_EdgeEdge (const TopoDS_Edge & theEdge1,const TopoDS_Edge & theEdge2);

		/****************** IntTools_EdgeEdge ******************/
		%feature("compactdefaultargs") IntTools_EdgeEdge;
		%feature("autodoc", "* Contructor
	:param theEdge1:
	:type theEdge1: TopoDS_Edge
	:param aT11:
	:type aT11: float
	:param aT12:
	:type aT12: float
	:param theEdge2:
	:type theEdge2: TopoDS_Edge
	:param aT21:
	:type aT21: float
	:param aT22:
	:type aT22: float
	:rtype: None") IntTools_EdgeEdge;
		 IntTools_EdgeEdge (const TopoDS_Edge & theEdge1,const Standard_Real aT11,const Standard_Real aT12,const TopoDS_Edge & theEdge2,const Standard_Real aT21,const Standard_Real aT22);

		/****************** IsCoincidenceCheckedQuickly ******************/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "* Returns the flag myQuickCoincidenceCheck
	:rtype: bool") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if common part(s) is(are) found
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between edges
	:rtype: None") Perform;
		void Perform ();

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "* Sets the first edge
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: None") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & theEdge);

		/****************** SetEdge1 ******************/
		%feature("compactdefaultargs") SetEdge1;
		%feature("autodoc", "* Sets the first edge and its range
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None") SetEdge1;
		void SetEdge1 (const TopoDS_Edge & theEdge,const Standard_Real aT1,const Standard_Real aT2);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "* Sets the second edge
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: None") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & theEdge);

		/****************** SetEdge2 ******************/
		%feature("compactdefaultargs") SetEdge2;
		%feature("autodoc", "* Sets the first edge and its range
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None") SetEdge2;
		void SetEdge2 (const TopoDS_Edge & theEdge,const Standard_Real aT1,const Standard_Real aT2);

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "* Sets the Fuzzy value
	:param theFuzz:
	:type theFuzz: float
	:rtype: None") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "* Sets the range for the first edge
	:param theRange1:
	:type theRange1: IntTools_Range
	:rtype: None") SetRange1;
		void SetRange1 (const IntTools_Range & theRange1);

		/****************** SetRange1 ******************/
		%feature("compactdefaultargs") SetRange1;
		%feature("autodoc", "* Sets the range for the first edge
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None") SetRange1;
		void SetRange1 (const Standard_Real aT1,const Standard_Real aT2);

		/****************** SetRange2 ******************/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "* Sets the range for the second edge
	:param theRange:
	:type theRange: IntTools_Range
	:rtype: None") SetRange2;
		void SetRange2 (const IntTools_Range & theRange);

		/****************** SetRange2 ******************/
		%feature("compactdefaultargs") SetRange2;
		%feature("autodoc", "* Sets the range for the second edge
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None") SetRange2;
		void SetRange2 (const Standard_Real aT1,const Standard_Real aT2);

		/****************** UseQuickCoincidenceCheck ******************/
		%feature("compactdefaultargs") UseQuickCoincidenceCheck;
		%feature("autodoc", "* Sets the flag myQuickCoincidenceCheck
	:param bFlag:
	:type bFlag: bool
	:rtype: None") UseQuickCoincidenceCheck;
		void UseQuickCoincidenceCheck (const Standard_Boolean bFlag);

};


%extend IntTools_EdgeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_EdgeFace *
**************************/
class IntTools_EdgeFace {
	public:
		/****************** CommonParts ******************/
		%feature("compactdefaultargs") CommonParts;
		%feature("autodoc", "* @name Obtaining results Returns resulting common parts
	:rtype: IntTools_SequenceOfCommonPrts") CommonParts;
		const IntTools_SequenceOfCommonPrts & CommonParts ();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns the intersection context
	:rtype: opencascade::handle<IntTools_Context>") Context;
		const opencascade::handle<IntTools_Context> & Context ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the edge
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "* Returns the code of completion: 0 - means successful completion; 1 - the process was not started; 2,3 - invalid source data for the algorithm; 4 - projection failed.
	:rtype: int") ErrorStatus;
		Standard_Integer ErrorStatus ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the face
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "* Returns the Fuzzy value
	:rtype: float") FuzzyValue;
		Standard_Real FuzzyValue ();

		/****************** IntTools_EdgeFace ******************/
		%feature("compactdefaultargs") IntTools_EdgeFace;
		%feature("autodoc", "* @name Constructors Empty Constructor
	:rtype: None") IntTools_EdgeFace;
		 IntTools_EdgeFace ();

		/****************** IsCoincidenceCheckedQuickly ******************/
		%feature("compactdefaultargs") IsCoincidenceCheckedQuickly;
		%feature("autodoc", "* Returns the flag myQuickCoincidenceCheck
	:rtype: bool") IsCoincidenceCheckedQuickly;
		Standard_Boolean IsCoincidenceCheckedQuickly ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* @name Checking validity of the intersection Returns True if computation was successful. Otherwise returns False.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* @name Performing the operation Launches the process
	:rtype: None") Perform;
		void Perform ();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Returns intersection range of the edge
	:rtype: IntTools_Range") Range;
		const IntTools_Range & Range ();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets the intersection context
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "* @name Setters/Getters Sets the edge for intersection
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: None") SetEdge;
		void SetEdge (const TopoDS_Edge & theEdge);

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Sets the face for intersection
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & theFace);

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "* Sets the Fuzzy value
	:param theFuzz:
	:type theFuzz: float
	:rtype: None") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "* Sets the boundaries for the edge. The algorithm processes edge inside these boundaries.
	:param theRange:
	:type theRange: IntTools_Range
	:rtype: None") SetRange;
		void SetRange (const IntTools_Range & theRange);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "* Sets the boundaries for the edge. The algorithm processes edge inside these boundaries.
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:rtype: None") SetRange;
		void SetRange (const Standard_Real theFirst,const Standard_Real theLast);

		/****************** UseQuickCoincidenceCheck ******************/
		%feature("compactdefaultargs") UseQuickCoincidenceCheck;
		%feature("autodoc", "* Sets the flag for quick coincidence check. It is safe to use the quick check for coincidence only if both of the following conditions are met: - The vertices of edge are lying on the face; - The edge does not intersect the boundaries of the face on the given range.
	:param theFlag:
	:type theFlag: bool
	:rtype: None") UseQuickCoincidenceCheck;
		void UseQuickCoincidenceCheck (const Standard_Boolean theFlag);

};


%extend IntTools_EdgeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_FClass2d *
**************************/
class IntTools_FClass2d {
	public:
		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "* Destructor
	:rtype: None") Destroy;
		void Destroy ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes algorithm by the face F and tolerance Tol
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") Init;
		void Init (const TopoDS_Face & F,const Standard_Real Tol);

		/****************** IntTools_FClass2d ******************/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_FClass2d;
		 IntTools_FClass2d ();

		/****************** IntTools_FClass2d ******************/
		%feature("compactdefaultargs") IntTools_FClass2d;
		%feature("autodoc", "* Initializes algorithm by the face F and tolerance Tol
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") IntTools_FClass2d;
		 IntTools_FClass2d (const TopoDS_Face & F,const Standard_Real Tol);

		/****************** IsHole ******************/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", ":rtype: bool") IsHole;
		Standard_Boolean IsHole ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Returns state of the 2d point Puv. If RecadreOnPeriodic is true (defalut value), for the periodic surface 2d point, adjusted to period, is classified.
	:param Puv:
	:type Puv: gp_Pnt2d
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State") Perform;
		TopAbs_State Perform (const gp_Pnt2d & Puv,const Standard_Boolean RecadreOnPeriodic = Standard_True);

		/****************** PerformInfinitePoint ******************/
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "* Returns state of infinite 2d point relatively to (0, 0)
	:rtype: TopAbs_State") PerformInfinitePoint;
		TopAbs_State PerformInfinitePoint ();

		/****************** TestOnRestriction ******************/
		%feature("compactdefaultargs") TestOnRestriction;
		%feature("autodoc", "* Test a point with +- an offset (Tol) and returns On if some points are OUT an some are IN (Caution: Internal use . see the code for more details)
	:param Puv:
	:type Puv: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param RecadreOnPeriodic: default value is Standard_True
	:type RecadreOnPeriodic: bool
	:rtype: TopAbs_State") TestOnRestriction;
		TopAbs_State TestOnRestriction (const gp_Pnt2d & Puv,const Standard_Real Tol,const Standard_Boolean RecadreOnPeriodic = Standard_True);

};


%extend IntTools_FClass2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntTools_FaceFace *
**************************/
class IntTools_FaceFace {
	public:
		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Gets the intersecton context
	:rtype: opencascade::handle<IntTools_Context>") Context;
		const opencascade::handle<IntTools_Context> & Context ();

		/****************** Face1 ******************/
		%feature("compactdefaultargs") Face1;
		%feature("autodoc", "* Returns first of processed faces
	:rtype: TopoDS_Face") Face1;
		const TopoDS_Face  Face1 ();

		/****************** Face2 ******************/
		%feature("compactdefaultargs") Face2;
		%feature("autodoc", "* Returns second of processed faces
	:rtype: TopoDS_Face") Face2;
		const TopoDS_Face  Face2 ();

		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "* Returns Fuzzy value
	:rtype: float") FuzzyValue;
		Standard_Real FuzzyValue ();

		/****************** IntTools_FaceFace ******************/
		%feature("compactdefaultargs") IntTools_FaceFace;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntTools_FaceFace;
		 IntTools_FaceFace ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the intersection was successful
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Lines ******************/
		%feature("compactdefaultargs") Lines;
		%feature("autodoc", "* Returns sequence of 3d curves as result of intersection
	:rtype: IntTools_SequenceOfCurves") Lines;
		const IntTools_SequenceOfCurves & Lines ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersects underliing surfaces of F1 and F2 Use sum of tolerance of F1 and F2 as intersection criteria
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:rtype: None") Perform;
		void Perform (const TopoDS_Face & F1,const TopoDS_Face & F2);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "* Returns sequence of 3d curves as result of intersection
	:rtype: IntTools_SequenceOfPntOn2Faces") Points;
		const IntTools_SequenceOfPntOn2Faces & Points ();

		/****************** PrepareLines3D ******************/
		%feature("compactdefaultargs") PrepareLines3D;
		%feature("autodoc", "* Provides post-processing the result lines. <bToSplit> - the flag. In case of <bToSplit> is true the closed 3D-curves will be splitted on parts. In case of <bToSplit> is false the closed 3D-curves remain untouched.
	:param bToSplit: default value is Standard_True
	:type bToSplit: bool
	:rtype: None") PrepareLines3D;
		void PrepareLines3D (const Standard_Boolean bToSplit = Standard_True);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets the intersecton context
	:param aContext:
	:type aContext: IntTools_Context
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<IntTools_Context> & aContext);

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "* Sets the Fuzzy value
	:param theFuzz:
	:type theFuzz: float
	:rtype: None") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", ":param ListOfPnts:
	:type ListOfPnts: IntSurf_ListOfPntOn2S
	:rtype: None") SetList;
		void SetList (IntSurf_ListOfPntOn2S & ListOfPnts);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* Modifier
	:param ApproxCurves:
	:type ApproxCurves: bool
	:param ComputeCurveOnS1:
	:type ComputeCurveOnS1: bool
	:param ComputeCurveOnS2:
	:type ComputeCurveOnS2: bool
	:param ApproximationTolerance:
	:type ApproximationTolerance: float
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Boolean ApproxCurves,const Standard_Boolean ComputeCurveOnS1,const Standard_Boolean ComputeCurveOnS2,const Standard_Real ApproximationTolerance);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "* Returns True if faces are tangent
	:rtype: bool") TangentFaces;
		Standard_Boolean TangentFaces ();

};


%extend IntTools_FaceFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IntTools_MarkedRangeSet *
********************************/
class IntTools_MarkedRangeSet {
	public:
		/****************** Flag ******************/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "* Returns flag of the range with index theIndex
	:param theIndex:
	:type theIndex: int
	:rtype: int") Flag;
		Standard_Integer Flag (const Standard_Integer theIndex);

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "* Returns index of range which contains theValue. If theValue do not belong any range returns 0.
	:param theValue:
	:type theValue: float
	:rtype: int") GetIndex;
		Standard_Integer GetIndex (const Standard_Real theValue);

		/****************** GetIndex ******************/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "* Returns index of range which contains theValue If theValue do not belong any range returns 0. If UseLower is Standard_True then lower boundary of the range can be equal to theValue, otherwise upper boundary of the range can be equal to theValue.
	:param theValue:
	:type theValue: float
	:param UseLower:
	:type UseLower: bool
	:rtype: int") GetIndex;
		Standard_Integer GetIndex (const Standard_Real theValue,const Standard_Boolean UseLower);

		/****************** GetIndices ******************/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", ":param theValue:
	:type theValue: float
	:rtype: TColStd_SequenceOfInteger") GetIndices;
		const TColStd_SequenceOfInteger & GetIndices (const Standard_Real theValue);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False
	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theFlag:
	:type theFlag: int
	:rtype: bool") InsertRange;
		Standard_Boolean InsertRange (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theFlag);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False
	:param theRange:
	:type theRange: IntTools_Range
	:param theFlag:
	:type theFlag: int
	:rtype: bool") InsertRange;
		Standard_Boolean InsertRange (const IntTools_Range & theRange,const Standard_Integer theFlag);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False
	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theFlag:
	:type theFlag: int
	:param theIndex:
	:type theIndex: int
	:rtype: bool") InsertRange;
		Standard_Boolean InsertRange (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theFlag,const Standard_Integer theIndex);

		/****************** InsertRange ******************/
		%feature("compactdefaultargs") InsertRange;
		%feature("autodoc", "* Inserts a new range marked with flag theFlag It replace the existing ranges or parts of ranges and their flags. The index theIndex is a position where the range will be inserted. Returns True if the range is inside the initial boundaries, otherwise or in case of some error returns False
	:param theRange:
	:type theRange: IntTools_Range
	:param theFlag:
	:type theFlag: int
	:param theIndex:
	:type theIndex: int
	:rtype: bool") InsertRange;
		Standard_Boolean InsertRange (const IntTools_Range & theRange,const Standard_Integer theFlag,const Standard_Integer theIndex);

		/****************** IntTools_MarkedRangeSet ******************/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet ();

		/****************** IntTools_MarkedRangeSet ******************/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "* build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary
	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theInitFlag:
	:type theInitFlag: int
	:rtype: None") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theInitFlag);

		/****************** IntTools_MarkedRangeSet ******************/
		%feature("compactdefaultargs") IntTools_MarkedRangeSet;
		%feature("autodoc", "* Build set of ranges based on the array of progressive sorted values //! Warning: The constructor do not check if the values of array are not sorted It should be checked before function invocation
	:param theSortedArray:
	:type theSortedArray: IntTools_CArray1OfReal
	:param theInitFlag:
	:type theInitFlag: int
	:rtype: None") IntTools_MarkedRangeSet;
		 IntTools_MarkedRangeSet (const IntTools_CArray1OfReal & theSortedArray,const Standard_Integer theInitFlag);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Returns number of ranges
	:rtype: int") Length;
		Standard_Integer Length ();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Returns the range with index theIndex. the Index can be from 1 to Length()
	:param theIndex:
	:type theIndex: int
	:rtype: IntTools_Range") Range;
		IntTools_Range Range (const Standard_Integer theIndex);

		/****************** SetBoundaries ******************/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "* build set of ranges which consists of one range with boundary values theFirstBoundary and theLastBoundary
	:param theFirstBoundary:
	:type theFirstBoundary: float
	:param theLastBoundary:
	:type theLastBoundary: float
	:param theInitFlag:
	:type theInitFlag: int
	:rtype: None") SetBoundaries;
		void SetBoundaries (const Standard_Real theFirstBoundary,const Standard_Real theLastBoundary,const Standard_Integer theInitFlag);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "* Set flag theFlag for range with index theIndex
	:param theIndex:
	:type theIndex: int
	:param theFlag:
	:type theFlag: int
	:rtype: None") SetFlag;
		void SetFlag (const Standard_Integer theIndex,const Standard_Integer theFlag);

		/****************** SetRanges ******************/
		%feature("compactdefaultargs") SetRanges;
		%feature("autodoc", "* Build set of ranges based on the array of progressive sorted values //! Warning: The function do not check if the values of array are not sorted It should be checked before function invocation
	:param theSortedArray:
	:type theSortedArray: IntTools_CArray1OfReal
	:param theInitFlag:
	:type theInitFlag: int
	:rtype: None") SetRanges;
		void SetRanges (const IntTools_CArray1OfReal & theSortedArray,const Standard_Integer theInitFlag);

};


%extend IntTools_MarkedRangeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntTools_PntOn2Faces *
*****************************/
class IntTools_PntOn2Faces {
	public:
		/****************** IntTools_PntOn2Faces ******************/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces ();

		/****************** IntTools_PntOn2Faces ******************/
		%feature("compactdefaultargs") IntTools_PntOn2Faces;
		%feature("autodoc", "* Initializes me by two points aP1 and aP2
	:param aP1:
	:type aP1: IntTools_PntOnFace
	:param aP2:
	:type aP2: IntTools_PntOnFace
	:rtype: None") IntTools_PntOn2Faces;
		 IntTools_PntOn2Faces (const IntTools_PntOnFace & aP1,const IntTools_PntOnFace & aP2);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Selector
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** P1 ******************/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "* Selector
	:rtype: IntTools_PntOnFace") P1;
		const IntTools_PntOnFace & P1 ();

		/****************** P2 ******************/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "* Selector
	:rtype: IntTools_PntOnFace") P2;
		const IntTools_PntOnFace & P2 ();

		/****************** SetP1 ******************/
		%feature("compactdefaultargs") SetP1;
		%feature("autodoc", "* Modifier
	:param aP1:
	:type aP1: IntTools_PntOnFace
	:rtype: None") SetP1;
		void SetP1 (const IntTools_PntOnFace & aP1);

		/****************** SetP2 ******************/
		%feature("compactdefaultargs") SetP2;
		%feature("autodoc", "* Modifier
	:param aP2:
	:type aP2: IntTools_PntOnFace
	:rtype: None") SetP2;
		void SetP2 (const IntTools_PntOnFace & aP2);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "* Modifier
	:param bF:
	:type bF: bool
	:rtype: None") SetValid;
		void SetValid (const Standard_Boolean bF);

};


%extend IntTools_PntOn2Faces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_PntOnFace *
***************************/
class IntTools_PntOnFace {
	public:
		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Selector
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes me by aFace, a 3d point and it's UV parameters on face
	:param aF:
	:type aF: TopoDS_Face
	:param aP:
	:type aP: gp_Pnt
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Init;
		void Init (const TopoDS_Face & aF,const gp_Pnt & aP,const Standard_Real U,const Standard_Real V);

		/****************** IntTools_PntOnFace ******************/
		%feature("compactdefaultargs") IntTools_PntOnFace;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_PntOnFace;
		 IntTools_PntOnFace ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Selector
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "* Selector
	:rtype: gp_Pnt") Pnt;
		const gp_Pnt  Pnt ();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Modifier
	:param aF:
	:type aF: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & aF);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* Modifier
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "* Modifier
	:param aP:
	:type aP: gp_Pnt
	:rtype: None") SetPnt;
		void SetPnt (const gp_Pnt & aP);

		/****************** SetValid ******************/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "* Modifier
	:param bF:
	:type bF: bool
	:rtype: None") SetValid;
		void SetValid (const Standard_Boolean bF);

};


%extend IntTools_PntOnFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntTools_Range *
***********************/
class IntTools_Range {
	public:
		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "* Selector
	:rtype: float") First;
		Standard_Real First ();

		/****************** IntTools_Range ******************/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_Range;
		 IntTools_Range ();

		/****************** IntTools_Range ******************/
		%feature("compactdefaultargs") IntTools_Range;
		%feature("autodoc", "* Initialize me by range boundaries
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: None") IntTools_Range;
		 IntTools_Range (const Standard_Real aFirst,const Standard_Real aLast);

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "* Selector
	:rtype: float") Last;
		Standard_Real Last ();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Selector
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: None") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetFirst ******************/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "* Modifier
	:param aFirst:
	:type aFirst: float
	:rtype: None") SetFirst;
		void SetFirst (const Standard_Real aFirst);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "* Modifier
	:param aLast:
	:type aLast: float
	:rtype: None") SetLast;
		void SetLast (const Standard_Real aLast);

};


%extend IntTools_Range {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntTools_Root *
**********************/
class IntTools_Root {
	public:
		/****************** IntTools_Root ******************/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_Root;
		 IntTools_Root ();

		/****************** IntTools_Root ******************/
		%feature("compactdefaultargs") IntTools_Root;
		%feature("autodoc", "* Initializes my by range of parameters and type of root
	:param aRoot:
	:type aRoot: float
	:param aType:
	:type aType: int
	:rtype: None") IntTools_Root;
		 IntTools_Root (const Standard_Real aRoot,const Standard_Integer aType);

		/****************** Interval ******************/
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "* Returns the values of interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).
	:param t1:
	:type t1: float
	:param t2:
	:type t2: float
	:param f1:
	:type f1: float
	:param f2:
	:type f2: float
	:rtype: None") Interval;
		void Interval (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Returns the validity flag for the root, True if myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_IN or myStateBefore==TopAbs_OUT && myStateAfter==TopAbs_ON or myStateBefore==TopAbs_ON && myStateAfter==TopAbs_OUT or myStateBefore==TopAbs_IN && myStateAfter==TopAbs_OUT . For other cases it returns False.
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** LayerHeight ******************/
		%feature("compactdefaultargs") LayerHeight;
		%feature("autodoc", "* Not used in Edge/Edge algorithm
	:rtype: float") LayerHeight;
		Standard_Real LayerHeight ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Returns the Root value
	:rtype: float") Root;
		Standard_Real Root ();

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "* Sets the interval from which the Root was found [t1,t2] and the corresponding values of the function on the bounds f(t1), f(t2).
	:param t1:
	:type t1: float
	:param t2:
	:type t2: float
	:param f1:
	:type f1: float
	:param f2:
	:type f2: float
	:rtype: None") SetInterval;
		void SetInterval (const Standard_Real t1,const Standard_Real t2,const Standard_Real f1,const Standard_Real f2);

		/****************** SetLayerHeight ******************/
		%feature("compactdefaultargs") SetLayerHeight;
		%feature("autodoc", "* Not used in Edge/Edge algorithm
	:param aHeight:
	:type aHeight: float
	:rtype: None") SetLayerHeight;
		void SetLayerHeight (const Standard_Real aHeight);

		/****************** SetRoot ******************/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", "* Sets the Root's value
	:param aRoot:
	:type aRoot: float
	:rtype: None") SetRoot;
		void SetRoot (const Standard_Real aRoot);

		/****************** SetStateAfter ******************/
		%feature("compactdefaultargs") SetStateAfter;
		%feature("autodoc", "* Set the value of the state after the root (at t=Root-dt)
	:param aState:
	:type aState: TopAbs_State
	:rtype: None") SetStateAfter;
		void SetStateAfter (const TopAbs_State aState);

		/****************** SetStateBefore ******************/
		%feature("compactdefaultargs") SetStateBefore;
		%feature("autodoc", "* Set the value of the state before the root (at t=Root-dt)
	:param aState:
	:type aState: TopAbs_State
	:rtype: None") SetStateBefore;
		void SetStateBefore (const TopAbs_State aState);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets the Root's Type
	:param aType:
	:type aType: int
	:rtype: None") SetType;
		void SetType (const Standard_Integer aType);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "* Returns the state after the root
	:rtype: TopAbs_State") StateAfter;
		TopAbs_State StateAfter ();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "* Returns the state before the root
	:rtype: TopAbs_State") StateBefore;
		TopAbs_State StateBefore ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of the root =0 - Simple (was found by bisection method); =2 - Smart when f1=0, f2!=0 or vice versa (was found by Fibbonacci method); =1 - Pure (pure zero for all t [t1,t2] );
	:rtype: int") Type;
		Standard_Integer Type ();

};


%extend IntTools_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntTools_ShrunkRange *
*****************************/
class IntTools_ShrunkRange {
	public:
		/****************** BndBox ******************/
		%feature("compactdefaultargs") BndBox;
		%feature("autodoc", ":rtype: Bnd_Box") BndBox;
		const Bnd_Box & BndBox ();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", ":rtype: opencascade::handle<IntTools_Context>") Context;
		const opencascade::handle<IntTools_Context> & Context ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** IntTools_ShrunkRange ******************/
		%feature("compactdefaultargs") IntTools_ShrunkRange;
		%feature("autodoc", ":rtype: None") IntTools_ShrunkRange;
		 IntTools_ShrunkRange ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True in case the shrunk range is computed
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsSplittable ******************/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "* Returns False in case the shrunk range is too short and the edge cannot be split, otherwise returns True
	:rtype: bool") IsSplittable;
		Standard_Boolean IsSplittable ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Returns the length of the edge if computed.
	:rtype: float") Length;
		Standard_Real Length ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", ":param aCtx:
	:type aCtx: IntTools_Context
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<IntTools_Context> & aCtx);

		/****************** SetData ******************/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", ":param aE:
	:type aE: TopoDS_Edge
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aV1:
	:type aV1: TopoDS_Vertex
	:param aV2:
	:type aV2: TopoDS_Vertex
	:rtype: None") SetData;
		void SetData (const TopoDS_Edge & aE,const Standard_Real aT1,const Standard_Real aT2,const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2);

		/****************** SetShrunkRange ******************/
		%feature("compactdefaultargs") SetShrunkRange;
		%feature("autodoc", ":param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None") SetShrunkRange;
		void SetShrunkRange (const Standard_Real aT1,const Standard_Real aT2);

		/****************** ShrunkRange ******************/
		%feature("compactdefaultargs") ShrunkRange;
		%feature("autodoc", ":param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:rtype: None") ShrunkRange;
		void ShrunkRange (Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend IntTools_ShrunkRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IntTools_SurfaceRangeLocalizeData *
******************************************/
class IntTools_SurfaceRangeLocalizeData {
	public:
		/****************** AddBox ******************/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_SurfaceRangeSample
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: None") AddBox;
		void AddBox (const IntTools_SurfaceRangeSample & theRange,const Bnd_Box & theBox);

		/****************** AddOutRange ******************/
		%feature("compactdefaultargs") AddOutRange;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_SurfaceRangeSample
	:rtype: None") AddOutRange;
		void AddOutRange (const IntTools_SurfaceRangeSample & theRange);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeLocalizeData
	:rtype: IntTools_SurfaceRangeLocalizeData") Assign;
		IntTools_SurfaceRangeLocalizeData & Assign (const IntTools_SurfaceRangeLocalizeData & Other);

		/****************** ClearGrid ******************/
		%feature("compactdefaultargs") ClearGrid;
		%feature("autodoc", "* Clears the grid of points.
	:rtype: None") ClearGrid;
		void ClearGrid ();

		/****************** FindBox ******************/
		%feature("compactdefaultargs") FindBox;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_SurfaceRangeSample
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: bool") FindBox;
		Standard_Boolean FindBox (const IntTools_SurfaceRangeSample & theRange,Bnd_Box & theBox);

		/****************** GetGridDeflection ******************/
		%feature("compactdefaultargs") GetGridDeflection;
		%feature("autodoc", "* Query the grid deflection.
	:rtype: float") GetGridDeflection;
		Standard_Real GetGridDeflection ();

		/****************** GetGridPoint ******************/
		%feature("compactdefaultargs") GetGridPoint;
		%feature("autodoc", "* Set the grid point.
	:param theUIndex:
	:type theUIndex: int
	:param theVIndex:
	:type theVIndex: int
	:rtype: gp_Pnt") GetGridPoint;
		const gp_Pnt  GetGridPoint (const Standard_Integer theUIndex,const Standard_Integer theVIndex);

		/****************** GetMinRangeU ******************/
		%feature("compactdefaultargs") GetMinRangeU;
		%feature("autodoc", ":rtype: float") GetMinRangeU;
		Standard_Real GetMinRangeU ();

		/****************** GetMinRangeV ******************/
		%feature("compactdefaultargs") GetMinRangeV;
		%feature("autodoc", ":rtype: float") GetMinRangeV;
		Standard_Real GetMinRangeV ();

		/****************** GetNBUPointsInFrame ******************/
		%feature("compactdefaultargs") GetNBUPointsInFrame;
		%feature("autodoc", "* Returns the number of grid points on U direction in frame.
	:rtype: int") GetNBUPointsInFrame;
		Standard_Integer GetNBUPointsInFrame ();

		/****************** GetNBVPointsInFrame ******************/
		%feature("compactdefaultargs") GetNBVPointsInFrame;
		%feature("autodoc", "* Returns the number of grid points on V direction in frame.
	:rtype: int") GetNBVPointsInFrame;
		Standard_Integer GetNBVPointsInFrame ();

		/****************** GetNbSampleU ******************/
		%feature("compactdefaultargs") GetNbSampleU;
		%feature("autodoc", ":rtype: int") GetNbSampleU;
		Standard_Integer GetNbSampleU ();

		/****************** GetNbSampleV ******************/
		%feature("compactdefaultargs") GetNbSampleV;
		%feature("autodoc", ":rtype: int") GetNbSampleV;
		Standard_Integer GetNbSampleV ();

		/****************** GetPointInFrame ******************/
		%feature("compactdefaultargs") GetPointInFrame;
		%feature("autodoc", "* Returns the grid point in frame.
	:param theUIndex:
	:type theUIndex: int
	:param theVIndex:
	:type theVIndex: int
	:rtype: gp_Pnt") GetPointInFrame;
		const gp_Pnt  GetPointInFrame (const Standard_Integer theUIndex,const Standard_Integer theVIndex);

		/****************** GetRangeUGrid ******************/
		%feature("compactdefaultargs") GetRangeUGrid;
		%feature("autodoc", "* Query the range U of the grid of points.
	:rtype: int") GetRangeUGrid;
		Standard_Integer GetRangeUGrid ();

		/****************** GetRangeVGrid ******************/
		%feature("compactdefaultargs") GetRangeVGrid;
		%feature("autodoc", "* Query the range V of the grid of points.
	:rtype: int") GetRangeVGrid;
		Standard_Integer GetRangeVGrid ();

		/****************** GetUParam ******************/
		%feature("compactdefaultargs") GetUParam;
		%feature("autodoc", "* Query the U parameter of the grid points at that index.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetUParam;
		Standard_Real GetUParam (const Standard_Integer theIndex);

		/****************** GetUParamInFrame ******************/
		%feature("compactdefaultargs") GetUParamInFrame;
		%feature("autodoc", "* Query the U parameter of the grid points at that index in frame.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetUParamInFrame;
		Standard_Real GetUParamInFrame (const Standard_Integer theIndex);

		/****************** GetVParam ******************/
		%feature("compactdefaultargs") GetVParam;
		%feature("autodoc", "* Query the V parameter of the grid points at that index.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetVParam;
		Standard_Real GetVParam (const Standard_Integer theIndex);

		/****************** GetVParamInFrame ******************/
		%feature("compactdefaultargs") GetVParamInFrame;
		%feature("autodoc", "* Query the V parameter of the grid points at that index in frame.
	:param theIndex:
	:type theIndex: int
	:rtype: float") GetVParamInFrame;
		Standard_Real GetVParamInFrame (const Standard_Integer theIndex);

		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", ":rtype: None") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData ();

		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", ":param theNbSampleU:
	:type theNbSampleU: int
	:param theNbSampleV:
	:type theNbSampleV: int
	:param theMinRangeU:
	:type theMinRangeU: float
	:param theMinRangeV:
	:type theMinRangeV: float
	:rtype: None") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData (const Standard_Integer theNbSampleU,const Standard_Integer theNbSampleV,const Standard_Real theMinRangeU,const Standard_Real theMinRangeV);

		/****************** IntTools_SurfaceRangeLocalizeData ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeLocalizeData;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeLocalizeData
	:rtype: None") IntTools_SurfaceRangeLocalizeData;
		 IntTools_SurfaceRangeLocalizeData (const IntTools_SurfaceRangeLocalizeData & Other);

		/****************** IsRangeOut ******************/
		%feature("compactdefaultargs") IsRangeOut;
		%feature("autodoc", ":param theRange:
	:type theRange: IntTools_SurfaceRangeSample
	:rtype: bool") IsRangeOut;
		Standard_Boolean IsRangeOut (const IntTools_SurfaceRangeSample & theRange);

		/****************** ListRangeOut ******************/
		%feature("compactdefaultargs") ListRangeOut;
		%feature("autodoc", ":param theList:
	:type theList: IntTools_ListOfSurfaceRangeSample
	:rtype: None") ListRangeOut;
		void ListRangeOut (IntTools_ListOfSurfaceRangeSample & theList);

		/****************** RemoveRangeOutAll ******************/
		%feature("compactdefaultargs") RemoveRangeOutAll;
		%feature("autodoc", ":rtype: None") RemoveRangeOutAll;
		void RemoveRangeOutAll ();

		/****************** SetFrame ******************/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "* Sets the frame area. Used to work with grid points.
	:param theUMin:
	:type theUMin: float
	:param theUMax:
	:type theUMax: float
	:param theVMin:
	:type theVMin: float
	:param theVMax:
	:type theVMax: float
	:rtype: None") SetFrame;
		void SetFrame (const Standard_Real theUMin,const Standard_Real theUMax,const Standard_Real theVMin,const Standard_Real theVMax);

		/****************** SetGridDeflection ******************/
		%feature("compactdefaultargs") SetGridDeflection;
		%feature("autodoc", "* Set the grid deflection.
	:param theDeflection:
	:type theDeflection: float
	:rtype: None") SetGridDeflection;
		void SetGridDeflection (const Standard_Real theDeflection);

		/****************** SetGridPoint ******************/
		%feature("compactdefaultargs") SetGridPoint;
		%feature("autodoc", "* Set the grid point.
	:param theUIndex:
	:type theUIndex: int
	:param theVIndex:
	:type theVIndex: int
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None") SetGridPoint;
		void SetGridPoint (const Standard_Integer theUIndex,const Standard_Integer theVIndex,const gp_Pnt & thePoint);

		/****************** SetRangeUGrid ******************/
		%feature("compactdefaultargs") SetRangeUGrid;
		%feature("autodoc", "* Set the range U of the grid of points.
	:param theNbUGrid:
	:type theNbUGrid: int
	:rtype: None") SetRangeUGrid;
		void SetRangeUGrid (const Standard_Integer theNbUGrid);

		/****************** SetRangeVGrid ******************/
		%feature("compactdefaultargs") SetRangeVGrid;
		%feature("autodoc", "* Set the range V of the grid of points.
	:param theNbVGrid:
	:type theNbVGrid: int
	:rtype: None") SetRangeVGrid;
		void SetRangeVGrid (const Standard_Integer theNbVGrid);

		/****************** SetUParam ******************/
		%feature("compactdefaultargs") SetUParam;
		%feature("autodoc", "* Set the U parameter of the grid points at that index.
	:param theIndex:
	:type theIndex: int
	:param theUParam:
	:type theUParam: float
	:rtype: None") SetUParam;
		void SetUParam (const Standard_Integer theIndex,const Standard_Real theUParam);

		/****************** SetVParam ******************/
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "* Set the V parameter of the grid points at that index.
	:param theIndex:
	:type theIndex: int
	:param theVParam:
	:type theVParam: float
	:rtype: None") SetVParam;
		void SetVParam (const Standard_Integer theIndex,const Standard_Real theVParam);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeLocalizeData
	:rtype: IntTools_SurfaceRangeLocalizeData") operator =;
		IntTools_SurfaceRangeLocalizeData & operator = (const IntTools_SurfaceRangeLocalizeData & Other);

};


%extend IntTools_SurfaceRangeLocalizeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntTools_SurfaceRangeSample *
************************************/
class IntTools_SurfaceRangeSample {
	public:
		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeSample
	:rtype: IntTools_SurfaceRangeSample") Assign;
		IntTools_SurfaceRangeSample & Assign (const IntTools_SurfaceRangeSample & Other);

		/****************** GetDepthU ******************/
		%feature("compactdefaultargs") GetDepthU;
		%feature("autodoc", ":rtype: int") GetDepthU;
		Standard_Integer GetDepthU ();

		/****************** GetDepthV ******************/
		%feature("compactdefaultargs") GetDepthV;
		%feature("autodoc", ":rtype: int") GetDepthV;
		Standard_Integer GetDepthV ();

		/****************** GetDepths ******************/
		%feature("compactdefaultargs") GetDepths;
		%feature("autodoc", ":param theDepthU:
	:type theDepthU: int
	:param theDepthV:
	:type theDepthV: int
	:rtype: None") GetDepths;
		void GetDepths (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** GetIndexU ******************/
		%feature("compactdefaultargs") GetIndexU;
		%feature("autodoc", ":rtype: int") GetIndexU;
		Standard_Integer GetIndexU ();

		/****************** GetIndexV ******************/
		%feature("compactdefaultargs") GetIndexV;
		%feature("autodoc", ":rtype: int") GetIndexV;
		Standard_Integer GetIndexV ();

		/****************** GetIndexes ******************/
		%feature("compactdefaultargs") GetIndexes;
		%feature("autodoc", ":param theIndexU:
	:type theIndexU: int
	:param theIndexV:
	:type theIndexV: int
	:rtype: None") GetIndexes;
		void GetIndexes (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** GetRangeIndexUDeeper ******************/
		%feature("compactdefaultargs") GetRangeIndexUDeeper;
		%feature("autodoc", ":param theNbSampleU:
	:type theNbSampleU: int
	:rtype: int") GetRangeIndexUDeeper;
		Standard_Integer GetRangeIndexUDeeper (const Standard_Integer theNbSampleU);

		/****************** GetRangeIndexVDeeper ******************/
		%feature("compactdefaultargs") GetRangeIndexVDeeper;
		%feature("autodoc", ":param theNbSampleV:
	:type theNbSampleV: int
	:rtype: int") GetRangeIndexVDeeper;
		Standard_Integer GetRangeIndexVDeeper (const Standard_Integer theNbSampleV);

		/****************** GetRangeU ******************/
		%feature("compactdefaultargs") GetRangeU;
		%feature("autodoc", ":param theFirstU:
	:type theFirstU: float
	:param theLastU:
	:type theLastU: float
	:param theNbSampleU:
	:type theNbSampleU: int
	:rtype: IntTools_Range") GetRangeU;
		IntTools_Range GetRangeU (const Standard_Real theFirstU,const Standard_Real theLastU,const Standard_Integer theNbSampleU);

		/****************** GetRangeV ******************/
		%feature("compactdefaultargs") GetRangeV;
		%feature("autodoc", ":param theFirstV:
	:type theFirstV: float
	:param theLastV:
	:type theLastV: float
	:param theNbSampleV:
	:type theNbSampleV: int
	:rtype: IntTools_Range") GetRangeV;
		IntTools_Range GetRangeV (const Standard_Real theFirstV,const Standard_Real theLastV,const Standard_Integer theNbSampleV);

		/****************** GetRanges ******************/
		%feature("compactdefaultargs") GetRanges;
		%feature("autodoc", ":param theRangeU:
	:type theRangeU: IntTools_CurveRangeSample
	:param theRangeV:
	:type theRangeV: IntTools_CurveRangeSample
	:rtype: None") GetRanges;
		void GetRanges (IntTools_CurveRangeSample & theRangeU,IntTools_CurveRangeSample & theRangeV);

		/****************** GetSampleRangeU ******************/
		%feature("compactdefaultargs") GetSampleRangeU;
		%feature("autodoc", ":rtype: IntTools_CurveRangeSample") GetSampleRangeU;
		const IntTools_CurveRangeSample & GetSampleRangeU ();

		/****************** GetSampleRangeV ******************/
		%feature("compactdefaultargs") GetSampleRangeV;
		%feature("autodoc", ":rtype: IntTools_CurveRangeSample") GetSampleRangeV;
		const IntTools_CurveRangeSample & GetSampleRangeV ();

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", ":rtype: None") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample ();

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", ":param theIndexU:
	:type theIndexU: int
	:param theDepthU:
	:type theDepthU: int
	:param theIndexV:
	:type theIndexV: int
	:param theDepthV:
	:type theDepthV: int
	:rtype: None") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const Standard_Integer theIndexU,const Standard_Integer theDepthU,const Standard_Integer theIndexV,const Standard_Integer theDepthV);

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", ":param theRangeU:
	:type theRangeU: IntTools_CurveRangeSample
	:param theRangeV:
	:type theRangeV: IntTools_CurveRangeSample
	:rtype: None") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const IntTools_CurveRangeSample & theRangeU,const IntTools_CurveRangeSample & theRangeV);

		/****************** IntTools_SurfaceRangeSample ******************/
		%feature("compactdefaultargs") IntTools_SurfaceRangeSample;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeSample
	:rtype: None") IntTools_SurfaceRangeSample;
		 IntTools_SurfaceRangeSample (const IntTools_SurfaceRangeSample & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeSample
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const IntTools_SurfaceRangeSample & Other);

		/****************** SetDepthU ******************/
		%feature("compactdefaultargs") SetDepthU;
		%feature("autodoc", ":param theDepthU:
	:type theDepthU: int
	:rtype: None") SetDepthU;
		void SetDepthU (const Standard_Integer theDepthU);

		/****************** SetDepthV ******************/
		%feature("compactdefaultargs") SetDepthV;
		%feature("autodoc", ":param theDepthV:
	:type theDepthV: int
	:rtype: None") SetDepthV;
		void SetDepthV (const Standard_Integer theDepthV);

		/****************** SetIndexU ******************/
		%feature("compactdefaultargs") SetIndexU;
		%feature("autodoc", ":param theIndexU:
	:type theIndexU: int
	:rtype: None") SetIndexU;
		void SetIndexU (const Standard_Integer theIndexU);

		/****************** SetIndexV ******************/
		%feature("compactdefaultargs") SetIndexV;
		%feature("autodoc", ":param theIndexV:
	:type theIndexV: int
	:rtype: None") SetIndexV;
		void SetIndexV (const Standard_Integer theIndexV);

		/****************** SetIndexes ******************/
		%feature("compactdefaultargs") SetIndexes;
		%feature("autodoc", ":param theIndexU:
	:type theIndexU: int
	:param theIndexV:
	:type theIndexV: int
	:rtype: None") SetIndexes;
		void SetIndexes (const Standard_Integer theIndexU,const Standard_Integer theIndexV);

		/****************** SetRanges ******************/
		%feature("compactdefaultargs") SetRanges;
		%feature("autodoc", ":param theRangeU:
	:type theRangeU: IntTools_CurveRangeSample
	:param theRangeV:
	:type theRangeV: IntTools_CurveRangeSample
	:rtype: None") SetRanges;
		void SetRanges (const IntTools_CurveRangeSample & theRangeU,const IntTools_CurveRangeSample & theRangeV);

		/****************** SetSampleRangeU ******************/
		%feature("compactdefaultargs") SetSampleRangeU;
		%feature("autodoc", ":param theRangeSampleU:
	:type theRangeSampleU: IntTools_CurveRangeSample
	:rtype: None") SetSampleRangeU;
		void SetSampleRangeU (const IntTools_CurveRangeSample & theRangeSampleU);

		/****************** SetSampleRangeV ******************/
		%feature("compactdefaultargs") SetSampleRangeV;
		%feature("autodoc", ":param theRangeSampleV:
	:type theRangeSampleV: IntTools_CurveRangeSample
	:rtype: None") SetSampleRangeV;
		void SetSampleRangeV (const IntTools_CurveRangeSample & theRangeSampleV);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_SurfaceRangeSample
	:rtype: IntTools_SurfaceRangeSample") operator =;
		IntTools_SurfaceRangeSample & operator = (const IntTools_SurfaceRangeSample & Other);

};


%extend IntTools_SurfaceRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class IntTools_SurfaceRangeSampleMapHasher *
*********************************************/
class IntTools_SurfaceRangeSampleMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given key, in the range [1, theUpperBound] @param theKey the key which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theKey:
	:type theKey: IntTools_SurfaceRangeSample
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const IntTools_SurfaceRangeSample & theKey,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True when the two keys are the same. Two same keys must have the same hashcode, the contrary is not necessary.
	:param S1:
	:type S1: IntTools_SurfaceRangeSample
	:param S2:
	:type S2: IntTools_SurfaceRangeSample
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const IntTools_SurfaceRangeSample & S1,const IntTools_SurfaceRangeSample & S2);

};


%extend IntTools_SurfaceRangeSampleMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntTools_Tools *
***********************/
class IntTools_Tools {
	public:
		/****************** CheckCurve ******************/
		%feature("compactdefaultargs") CheckCurve;
		%feature("autodoc", "* Checks if the curve is not covered by the default tolerance (confusion). Builds bounding box for the curve and stores it into <theBox>.
	:param theCurve:
	:type theCurve: IntTools_Curve
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: bool") CheckCurve;
		static Standard_Boolean CheckCurve (const IntTools_Curve & theCurve,Bnd_Box & theBox);

		/****************** ClassifyPointByFace ******************/
		%feature("compactdefaultargs") ClassifyPointByFace;
		%feature("autodoc", ":param aF:
	:type aF: TopoDS_Face
	:param P:
	:type P: gp_Pnt2d
	:rtype: TopAbs_State") ClassifyPointByFace;
		static TopAbs_State ClassifyPointByFace (const TopoDS_Face & aF,const gp_Pnt2d & P);

		/****************** ComputeIntRange ******************/
		%feature("compactdefaultargs") ComputeIntRange;
		%feature("autodoc", "* Computes the correct Intersection range for Line/Line, Line/Plane and Plane/Plane intersections
	:param theTol1:
	:type theTol1: float
	:param theTol2:
	:type theTol2: float
	:param theAngle:
	:type theAngle: float
	:rtype: float") ComputeIntRange;
		static Standard_Real ComputeIntRange (const Standard_Real theTol1,const Standard_Real theTol2,const Standard_Real theAngle);

		/****************** ComputeTolerance ******************/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "* Computes the max distance between points taken from 3D and 2D curves by the same parameter
	:param theCurve3D:
	:type theCurve3D: Geom_Curve
	:param theCurve2D:
	:type theCurve2D: Geom2d_Curve
	:param theSurf:
	:type theSurf: Geom_Surface
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:param theMaxDist:
	:type theMaxDist: float
	:param theMaxPar:
	:type theMaxPar: float
	:param theTolRange: default value is Precision::Confusion()
	:type theTolRange: float
	:rtype: bool") ComputeTolerance;
		static Standard_Boolean ComputeTolerance (const opencascade::handle<Geom_Curve> & theCurve3D,const opencascade::handle<Geom2d_Curve> & theCurve2D,const opencascade::handle<Geom_Surface> & theSurf,const Standard_Real theFirst,const Standard_Real theLast,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real theTolRange = Precision::Confusion());

		/****************** ComputeVV ******************/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "* Computes distance between vertex V1 and vertex V2, if the distance is less than sum of vertex tolerances returns zero, otherwise returns negative value
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: int") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);

		/****************** CurveTolerance ******************/
		%feature("compactdefaultargs") CurveTolerance;
		%feature("autodoc", "* Returns adaptive tolerance for given aTolBase if aC is trimmed curve and basis curve is parabola, otherwise returns value of aTolBase
	:param aC:
	:type aC: Geom_Curve
	:param aTolBase:
	:type aTolBase: float
	:rtype: float") CurveTolerance;
		static Standard_Real CurveTolerance (const opencascade::handle<Geom_Curve> & aC,const Standard_Real aTolBase);

		/****************** HasInternalEdge ******************/
		%feature("compactdefaultargs") HasInternalEdge;
		%feature("autodoc", "* Returns True if wire aW contains edges with INTERNAL orientation
	:param aW:
	:type aW: TopoDS_Wire
	:rtype: bool") HasInternalEdge;
		static Standard_Boolean HasInternalEdge (const TopoDS_Wire & aW);

		/****************** IntermediatePoint ******************/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "* Returns some value between aFirst and aLast
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: float") IntermediatePoint;
		static Standard_Real IntermediatePoint (const Standard_Real aFirst,const Standard_Real aLast);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if aC is BoundedCurve from Geom and the distance between first point of the curve aC and last point is less than 1.e-12
	:param aC:
	:type aC: Geom_Curve
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const opencascade::handle<Geom_Curve> & aC);

		/****************** IsDirsCoinside ******************/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "* Returns True if D1 and D2 coinside
	:param D1:
	:type D1: gp_Dir
	:param D2:
	:type D2: gp_Dir
	:rtype: bool") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside (const gp_Dir & D1,const gp_Dir & D2);

		/****************** IsDirsCoinside ******************/
		%feature("compactdefaultargs") IsDirsCoinside;
		%feature("autodoc", "* Returns True if D1 and D2 coinside with given tolerance
	:param D1:
	:type D1: gp_Dir
	:param D2:
	:type D2: gp_Dir
	:param aTol:
	:type aTol: float
	:rtype: bool") IsDirsCoinside;
		static Standard_Boolean IsDirsCoinside (const gp_Dir & D1,const gp_Dir & D2,const Standard_Real aTol);

		/****************** IsInRange ******************/
		%feature("compactdefaultargs") IsInRange;
		%feature("autodoc", "* Checks if the range <theR> interfere with the range <theRRef>
	:param theRRef:
	:type theRRef: IntTools_Range
	:param theR:
	:type theR: IntTools_Range
	:param theTol:
	:type theTol: float
	:rtype: bool") IsInRange;
		static Standard_Boolean IsInRange (const IntTools_Range & theRRef,const IntTools_Range & theR,const Standard_Real theTol);

		/****************** IsMiddlePointsEqual ******************/
		%feature("compactdefaultargs") IsMiddlePointsEqual;
		%feature("autodoc", "* Gets boundary of parameters of E1 and E2. Computes 3d points on each corresponded to average parameters. Returns True if distance between computed points is less than sum of edge tolerance, otherwise returns False.
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: bool") IsMiddlePointsEqual;
		static Standard_Boolean IsMiddlePointsEqual (const TopoDS_Edge & E1,const TopoDS_Edge & E2);

		/****************** IsOnPave ******************/
		%feature("compactdefaultargs") IsOnPave;
		%feature("autodoc", ":param theT:
	:type theT: float
	:param theRange:
	:type theRange: IntTools_Range
	:param theTol:
	:type theTol: float
	:rtype: bool") IsOnPave;
		static Standard_Boolean IsOnPave (const Standard_Real theT,const IntTools_Range & theRange,const Standard_Real theTol);

		/****************** IsOnPave1 ******************/
		%feature("compactdefaultargs") IsOnPave1;
		%feature("autodoc", ":param theT:
	:type theT: float
	:param theRange:
	:type theRange: IntTools_Range
	:param theTol:
	:type theTol: float
	:rtype: bool") IsOnPave1;
		static Standard_Boolean IsOnPave1 (const Standard_Real theT,const IntTools_Range & theRange,const Standard_Real theTol);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Computes square distance between a point on the edge E corresponded to parameter t and vertices of edge E. Returns True if this distance is less than square tolerance of vertex, otherwise returns false.
	:param E:
	:type E: TopoDS_Edge
	:param t:
	:type t: float
	:rtype: bool") IsVertex;
		static Standard_Boolean IsVertex (const TopoDS_Edge & E,const Standard_Real t);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if square distance between vertex V and a point on the edge E corresponded to parameter t is less than square tolerance of V
	:param E:
	:type E: TopoDS_Edge
	:param V:
	:type V: TopoDS_Vertex
	:param t:
	:type t: float
	:rtype: bool") IsVertex;
		static Standard_Boolean IsVertex (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real t);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if IsVertx for middle parameter of fist range and first edge returns True and if IsVertex for middle parameter of second range and second range returns True, otherwise returns False
	:param aCmnPrt:
	:type aCmnPrt: IntTools_CommonPrt
	:rtype: bool") IsVertex;
		static Standard_Boolean IsVertex (const IntTools_CommonPrt & aCmnPrt);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if the distance between point aP and vertex aV is less or equal to sum of aTolPV and vertex tolerance, otherwise returns False
	:param aP:
	:type aP: gp_Pnt
	:param aTolPV:
	:type aTolPV: float
	:param aV:
	:type aV: TopoDS_Vertex
	:rtype: bool") IsVertex;
		static Standard_Boolean IsVertex (const gp_Pnt & aP,const Standard_Real aTolPV,const TopoDS_Vertex & aV);

		/****************** MakeFaceFromWireAndFace ******************/
		%feature("compactdefaultargs") MakeFaceFromWireAndFace;
		%feature("autodoc", "* Build a face based on surface of given face aF and bounded by wire aW
	:param aW:
	:type aW: TopoDS_Wire
	:param aF:
	:type aF: TopoDS_Face
	:param aFNew:
	:type aFNew: TopoDS_Face
	:rtype: void") MakeFaceFromWireAndFace;
		static void MakeFaceFromWireAndFace (const TopoDS_Wire & aW,const TopoDS_Face & aF,TopoDS_Face & aFNew);

		/****************** RejectLines ******************/
		%feature("compactdefaultargs") RejectLines;
		%feature("autodoc", "* Puts curves from aSIn to aSOut except those curves that are coincide with first curve from aSIn.
	:param aSIn:
	:type aSIn: IntTools_SequenceOfCurves
	:param aSOut:
	:type aSOut: IntTools_SequenceOfCurves
	:rtype: void") RejectLines;
		static void RejectLines (const IntTools_SequenceOfCurves & aSIn,IntTools_SequenceOfCurves & aSOut);

		/****************** SegPln ******************/
		%feature("compactdefaultargs") SegPln;
		%feature("autodoc", ":param theLin:
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
	:type theT: float
	:param theTolP:
	:type theTolP: float
	:param theTmin:
	:type theTmin: float
	:param theTmax:
	:type theTmax: float
	:rtype: int") SegPln;
		static Standard_Integer SegPln (const gp_Lin & theLin,const Standard_Real theTLin1,const Standard_Real theTLin2,const Standard_Real theTolLin,const gp_Pln & thePln,const Standard_Real theTolPln,gp_Pnt & theP,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SplitCurve ******************/
		%feature("compactdefaultargs") SplitCurve;
		%feature("autodoc", "* Split aC by average parameter if aC is closed in 3D. Returns positive value if splitting has been done, otherwise returns zero.
	:param aC:
	:type aC: IntTools_Curve
	:param aS:
	:type aS: IntTools_SequenceOfCurves
	:rtype: int") SplitCurve;
		static Standard_Integer SplitCurve (const IntTools_Curve & aC,IntTools_SequenceOfCurves & aS);

		/****************** VertexParameter ******************/
		%feature("compactdefaultargs") VertexParameter;
		%feature("autodoc", ":param theCP:
	:type theCP: IntTools_CommonPrt
	:param theT:
	:type theT: float
	:rtype: void") VertexParameter;
		static void VertexParameter (const IntTools_CommonPrt & theCP,Standard_Real &OutValue);

		/****************** VertexParameters ******************/
		%feature("compactdefaultargs") VertexParameters;
		%feature("autodoc", ":param theCP:
	:type theCP: IntTools_CommonPrt
	:param theT1:
	:type theT1: float
	:param theT2:
	:type theT2: float
	:rtype: void") VertexParameters;
		static void VertexParameters (const IntTools_CommonPrt & theCP,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend IntTools_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_TopolTool *
***************************/
class IntTools_TopolTool : public Adaptor3d_TopolTool {
	public:
		/****************** ComputeSamplePoints ******************/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", ":rtype: void") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Redefined empty initializer //! Warning: Raises the exception NotImplemented
	:rtype: void") Initialize;
		virtual void Initialize ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initializes me by surface
	:param theSurface:
	:type theSurface: Adaptor3d_HSurface
	:rtype: void") Initialize;
		virtual void Initialize (const opencascade::handle<Adaptor3d_HSurface> & theSurface);

		/****************** IntTools_TopolTool ******************/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IntTools_TopolTool;
		 IntTools_TopolTool ();

		/****************** IntTools_TopolTool ******************/
		%feature("compactdefaultargs") IntTools_TopolTool;
		%feature("autodoc", "* Initializes me by surface
	:param theSurface:
	:type theSurface: Adaptor3d_HSurface
	:rtype: None") IntTools_TopolTool;
		 IntTools_TopolTool (const opencascade::handle<Adaptor3d_HSurface> & theSurface);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "* Computes the sample-points for the intersections algorithms
	:rtype: int") NbSamples;
		virtual Standard_Integer NbSamples ();

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "* Computes the sample-points for the intersections algorithms
	:rtype: int") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "* Computes the sample-points for the intersections algorithms
	:rtype: int") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();

		/****************** SamplePnts ******************/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "* compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; theDefl is a requred deflection theNUmin, theNVmin are minimal nb points for U and V.
	:param theDefl:
	:type theDefl: float
	:param theNUmin:
	:type theNUmin: int
	:param theNVmin:
	:type theNVmin: int
	:rtype: void") SamplePnts;
		virtual void SamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "* Returns a 2d point from surface myS and a corresponded 3d point for given index. The index should be from 1 to NbSamples()
	:param Index:
	:type Index: int
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);

};


%make_alias(IntTools_TopolTool)

%extend IntTools_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntTools_WLineTool *
***************************/
class IntTools_WLineTool {
	public:
		/****************** DecompositionOfWLine ******************/
		%feature("compactdefaultargs") DecompositionOfWLine;
		%feature("autodoc", ":param theWLine:
	:type theWLine: IntPatch_WLine
	:param theSurface1:
	:type theSurface1: GeomAdaptor_HSurface
	:param theSurface2:
	:type theSurface2: GeomAdaptor_HSurface
	:param theFace1:
	:type theFace1: TopoDS_Face
	:param theFace2:
	:type theFace2: TopoDS_Face
	:param theLConstructor:
	:type theLConstructor: GeomInt_LineConstructor
	:param theAvoidLConstructor:
	:type theAvoidLConstructor: bool
	:param theTol:
	:type theTol: float
	:param theNewLines:
	:type theNewLines: IntPatch_SequenceOfLine
	:param theReachedTol3d:
	:type theReachedTol3d: float
	:param &:
	:type &: IntTools_Context
	:rtype: bool") DecompositionOfWLine;
		static Standard_Boolean DecompositionOfWLine (const opencascade::handle<IntPatch_WLine> & theWLine,const opencascade::handle<GeomAdaptor_HSurface> & theSurface1,const opencascade::handle<GeomAdaptor_HSurface> & theSurface2,const TopoDS_Face & theFace1,const TopoDS_Face & theFace2,const GeomInt_LineConstructor & theLConstructor,const Standard_Boolean theAvoidLConstructor,const Standard_Real theTol,IntPatch_SequenceOfLine & theNewLines,Standard_Real &OutValue,const opencascade::handle<IntTools_Context> &);

		/****************** NotUseSurfacesForApprox ******************/
		%feature("compactdefaultargs") NotUseSurfacesForApprox;
		%feature("autodoc", ":param aF1:
	:type aF1: TopoDS_Face
	:param aF2:
	:type aF2: TopoDS_Face
	:param WL:
	:type WL: IntPatch_WLine
	:param ifprm:
	:type ifprm: int
	:param ilprm:
	:type ilprm: int
	:rtype: bool") NotUseSurfacesForApprox;
		static Standard_Boolean NotUseSurfacesForApprox (const TopoDS_Face & aF1,const TopoDS_Face & aF2,const opencascade::handle<IntPatch_WLine> & WL,const Standard_Integer ifprm,const Standard_Integer ilprm);

};


%extend IntTools_WLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IntTools_CurveRangeSample *
**********************************/
class IntTools_CurveRangeSample : public IntTools_BaseRangeSample {
	public:
		/****************** GetRange ******************/
		%feature("compactdefaultargs") GetRange;
		%feature("autodoc", ":param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:param theNbSample:
	:type theNbSample: int
	:rtype: IntTools_Range") GetRange;
		IntTools_Range GetRange (const Standard_Real theFirst,const Standard_Real theLast,const Standard_Integer theNbSample);

		/****************** GetRangeIndex ******************/
		%feature("compactdefaultargs") GetRangeIndex;
		%feature("autodoc", ":rtype: int") GetRangeIndex;
		Standard_Integer GetRangeIndex ();

		/****************** GetRangeIndexDeeper ******************/
		%feature("compactdefaultargs") GetRangeIndexDeeper;
		%feature("autodoc", ":param theNbSample:
	:type theNbSample: int
	:rtype: int") GetRangeIndexDeeper;
		Standard_Integer GetRangeIndexDeeper (const Standard_Integer theNbSample);

		/****************** IntTools_CurveRangeSample ******************/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", ":rtype: None") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample ();

		/****************** IntTools_CurveRangeSample ******************/
		%feature("compactdefaultargs") IntTools_CurveRangeSample;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: None") IntTools_CurveRangeSample;
		 IntTools_CurveRangeSample (const Standard_Integer theIndex);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param Other:
	:type Other: IntTools_CurveRangeSample
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const IntTools_CurveRangeSample & Other);

		/****************** SetRangeIndex ******************/
		%feature("compactdefaultargs") SetRangeIndex;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: None") SetRangeIndex;
		void SetRangeIndex (const Standard_Integer theIndex);

};


%extend IntTools_CurveRangeSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
