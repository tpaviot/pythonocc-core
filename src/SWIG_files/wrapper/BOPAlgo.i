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
%define BOPALGODOCSTRING
"BOPAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bopalgo.html"
%enddef
%module (package="OCC.Core", docstring=BOPALGODOCSTRING) BOPAlgo


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
#include<BOPAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<IntTools_module.hxx>
#include<BOPDS_module.hxx>
#include<BRepTools_module.hxx>
#include<BOPTools_module.hxx>
#include<TopAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Extrema_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Approx_module.hxx>
#include<IntPatch_module.hxx>
#include<Geom_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<IntTools_module.hxx>
#include<BRep_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopTools.i
%import Message.i
%import IntTools.i
%import BOPDS.i
%import BRepTools.i
%import BOPTools.i
%import TopAbs.i
/* public enums */
enum BOPAlgo_CheckStatus {
	BOPAlgo_CheckUnknown = 0,
	BOPAlgo_BadType = 1,
	BOPAlgo_SelfIntersect = 2,
	BOPAlgo_TooSmallEdge = 3,
	BOPAlgo_NonRecoverableFace = 4,
	BOPAlgo_IncompatibilityOfVertex = 5,
	BOPAlgo_IncompatibilityOfEdge = 6,
	BOPAlgo_IncompatibilityOfFace = 7,
	BOPAlgo_OperationAborted = 8,
	BOPAlgo_GeomAbs_C0 = 9,
	BOPAlgo_InvalidCurveOnSurface = 10,
	BOPAlgo_NotValid = 11,
};

enum BOPAlgo_Operation {
	BOPAlgo_COMMON = 0,
	BOPAlgo_FUSE = 1,
	BOPAlgo_CUT = 2,
	BOPAlgo_CUT21 = 3,
	BOPAlgo_SECTION = 4,
	BOPAlgo_UNKNOWN = 5,
};

enum BOPAlgo_GlueEnum {
	BOPAlgo_GlueOff = 0,
	BOPAlgo_GlueShift = 1,
	BOPAlgo_GlueFull = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(BOPAlgo_ListOfCheckResult) NCollection_List <BOPAlgo_CheckResult>;
/* end templates declaration */

/* typedefs */
typedef BOPAlgo_Builder * BOPAlgo_PBuilder;
typedef BOPAlgo_WireEdgeSet * BOPAlgo_PWireEdgeSet;
typedef BOPAlgo_PaveFiller * BOPAlgo_PPaveFiller;
typedef NCollection_List <BOPAlgo_CheckResult> BOPAlgo_ListOfCheckResult;
typedef BOPAlgo_ListOfCheckResult::Iterator BOPAlgo_ListIteratorOfListOfCheckResult;
typedef BOPAlgo_Section * BOPAlgo_PSection;
typedef BOPAlgo_ArgumentAnalyzer * BOPAlgo_PArgumentAnalyzer;
typedef BOPAlgo_BOP * BOPAlgo_PBOP;
/* end typedefs declaration */

/****************************
* class BOPAlgo_CheckResult *
****************************/
class BOPAlgo_CheckResult {
	public:
		/****************** AddFaultyShape1 ******************/
		%feature("compactdefaultargs") AddFaultyShape1;
		%feature("autodoc", "* adds faulty sub-shapes from object to a list
	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None") AddFaultyShape1;
		void AddFaultyShape1 (const TopoDS_Shape & TheShape);

		/****************** AddFaultyShape2 ******************/
		%feature("compactdefaultargs") AddFaultyShape2;
		%feature("autodoc", "* adds faulty sub-shapes from tool to a list
	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None") AddFaultyShape2;
		void AddFaultyShape2 (const TopoDS_Shape & TheShape);

		/****************** BOPAlgo_CheckResult ******************/
		%feature("compactdefaultargs") BOPAlgo_CheckResult;
		%feature("autodoc", "* empty constructor
	:rtype: None") BOPAlgo_CheckResult;
		 BOPAlgo_CheckResult ();

		/****************** GetCheckStatus ******************/
		%feature("compactdefaultargs") GetCheckStatus;
		%feature("autodoc", "* gets status of faulty
	:rtype: BOPAlgo_CheckStatus") GetCheckStatus;
		BOPAlgo_CheckStatus GetCheckStatus ();

		/****************** GetFaultyShapes1 ******************/
		%feature("compactdefaultargs") GetFaultyShapes1;
		%feature("autodoc", "* returns list of faulty shapes for object
	:rtype: TopTools_ListOfShape") GetFaultyShapes1;
		const TopTools_ListOfShape & GetFaultyShapes1 ();

		/****************** GetFaultyShapes2 ******************/
		%feature("compactdefaultargs") GetFaultyShapes2;
		%feature("autodoc", "* returns list of faulty shapes for tool
	:rtype: TopTools_ListOfShape") GetFaultyShapes2;
		const TopTools_ListOfShape & GetFaultyShapes2 ();

		/****************** GetMaxDistance1 ******************/
		%feature("compactdefaultargs") GetMaxDistance1;
		%feature("autodoc", "* Returns the distance for the first shape
	:rtype: float") GetMaxDistance1;
		Standard_Real GetMaxDistance1 ();

		/****************** GetMaxDistance2 ******************/
		%feature("compactdefaultargs") GetMaxDistance2;
		%feature("autodoc", "* Returns the distance for the second shape
	:rtype: float") GetMaxDistance2;
		Standard_Real GetMaxDistance2 ();

		/****************** GetMaxParameter1 ******************/
		%feature("compactdefaultargs") GetMaxParameter1;
		%feature("autodoc", "* Returns the parameter for the fircst shape
	:rtype: float") GetMaxParameter1;
		Standard_Real GetMaxParameter1 ();

		/****************** GetMaxParameter2 ******************/
		%feature("compactdefaultargs") GetMaxParameter2;
		%feature("autodoc", "* Returns the parameter for the second shape
	:rtype: float") GetMaxParameter2;
		Standard_Real GetMaxParameter2 ();

		/****************** GetShape1 ******************/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "* returns ancestor shape (object) for faulties
	:rtype: TopoDS_Shape") GetShape1;
		const TopoDS_Shape  GetShape1 ();

		/****************** GetShape2 ******************/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "* returns ancestor shape (tool) for faulties
	:rtype: TopoDS_Shape") GetShape2;
		const TopoDS_Shape  GetShape2 ();

		/****************** SetCheckStatus ******************/
		%feature("compactdefaultargs") SetCheckStatus;
		%feature("autodoc", "* set status of faulty
	:param TheStatus:
	:type TheStatus: BOPAlgo_CheckStatus
	:rtype: None") SetCheckStatus;
		void SetCheckStatus (const BOPAlgo_CheckStatus TheStatus);

		/****************** SetMaxDistance1 ******************/
		%feature("compactdefaultargs") SetMaxDistance1;
		%feature("autodoc", "* Sets max distance for the first shape
	:param theDist:
	:type theDist: float
	:rtype: None") SetMaxDistance1;
		void SetMaxDistance1 (const Standard_Real theDist);

		/****************** SetMaxDistance2 ******************/
		%feature("compactdefaultargs") SetMaxDistance2;
		%feature("autodoc", "* Sets max distance for the second shape
	:param theDist:
	:type theDist: float
	:rtype: None") SetMaxDistance2;
		void SetMaxDistance2 (const Standard_Real theDist);

		/****************** SetMaxParameter1 ******************/
		%feature("compactdefaultargs") SetMaxParameter1;
		%feature("autodoc", "* Sets the parameter for the first shape
	:param thePar:
	:type thePar: float
	:rtype: None") SetMaxParameter1;
		void SetMaxParameter1 (const Standard_Real thePar);

		/****************** SetMaxParameter2 ******************/
		%feature("compactdefaultargs") SetMaxParameter2;
		%feature("autodoc", "* Sets the parameter for the second shape
	:param thePar:
	:type thePar: float
	:rtype: None") SetMaxParameter2;
		void SetMaxParameter2 (const Standard_Real thePar);

		/****************** SetShape1 ******************/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "* sets ancestor shape (object) for faulty sub-shapes
	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None") SetShape1;
		void SetShape1 (const TopoDS_Shape & TheShape);

		/****************** SetShape2 ******************/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "* sets ancestor shape (tool) for faulty sub-shapes
	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None") SetShape2;
		void SetShape2 (const TopoDS_Shape & TheShape);

};


%extend BOPAlgo_CheckResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_Options *
************************/
class BOPAlgo_Options {
	public:
		/****************** AddError ******************/
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "* //!@name Error reporting mechanism Adds the alert as error (fail)
	:param theAlert:
	:type theAlert: Message_Alert
	:rtype: None") AddError;
		void AddError (const opencascade::handle<Message_Alert> & theAlert);

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* Adds the alert as warning
	:param theAlert:
	:type theAlert: Message_Alert
	:rtype: None") AddWarning;
		void AddWarning (const opencascade::handle<Message_Alert> & theAlert);

		/****************** Allocator ******************/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "* Returns allocator
	:rtype: opencascade::handle<NCollection_BaseAllocator>") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator ();

		/****************** BOPAlgo_Options ******************/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "* Empty constructor
	:rtype: None") BOPAlgo_Options;
		 BOPAlgo_Options ();

		/****************** BOPAlgo_Options ******************/
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "* Constructor with allocator
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_Options;
		 BOPAlgo_Options (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears all warnings and errors, and any data cached by the algorithm. User defined options are not cleared.
	:rtype: None") Clear;
		void Clear ();

		/****************** ClearWarnings ******************/
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "* Clears the warnings of the algorithm
	:rtype: None") ClearWarnings;
		void ClearWarnings ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpErrorsToString() {
            std::stringstream s;
            self->DumpErrors(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string DumpWarningsToString() {
            std::stringstream s;
            self->DumpWarnings(s);
            return s.str();}
        };
        		/****************** FuzzyValue ******************/
		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "* Returns the additional tolerance
	:rtype: float") FuzzyValue;
		Standard_Real FuzzyValue ();

		/****************** GetParallelMode ******************/
		%feature("compactdefaultargs") GetParallelMode;
		%feature("autodoc", "* //!@name Parallel processing mode Gets the global parallel mode
	:rtype: bool") GetParallelMode;
		static Standard_Boolean GetParallelMode ();

		/****************** GetReport ******************/
		%feature("compactdefaultargs") GetReport;
		%feature("autodoc", "* Returns report collecting all errors and warnings
	:rtype: opencascade::handle<Message_Report>") GetReport;
		const opencascade::handle<Message_Report> & GetReport ();

		/****************** HasError ******************/
		%feature("compactdefaultargs") HasError;
		%feature("autodoc", "* Returns true if algorithm has generated error of specified type
	:param theType:
	:type theType: Standard_Type
	:rtype: bool") HasError;
		Standard_Boolean HasError (const opencascade::handle<Standard_Type> & theType);

		/****************** HasErrors ******************/
		%feature("compactdefaultargs") HasErrors;
		%feature("autodoc", "* Returns true if algorithm has failed
	:rtype: bool") HasErrors;
		Standard_Boolean HasErrors ();

		/****************** HasWarning ******************/
		%feature("compactdefaultargs") HasWarning;
		%feature("autodoc", "* Returns true if algorithm has generated warning of specified type
	:param theType:
	:type theType: Standard_Type
	:rtype: bool") HasWarning;
		Standard_Boolean HasWarning (const opencascade::handle<Standard_Type> & theType);

		/****************** HasWarnings ******************/
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "* Returns true if algorithm has generated some warning alerts
	:rtype: bool") HasWarnings;
		Standard_Boolean HasWarnings ();

		/****************** RunParallel ******************/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "* Returns the flag of parallel processing
	:rtype: bool") RunParallel;
		Standard_Boolean RunParallel ();

		/****************** SetFuzzyValue ******************/
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "* //!@name Fuzzy tolerance Sets the additional tolerance
	:param theFuzz:
	:type theFuzz: float
	:rtype: None") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);

		/****************** SetParallelMode ******************/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "* Sets the global parallel mode
	:param theNewMode:
	:type theNewMode: bool
	:rtype: void") SetParallelMode;
		static void SetParallelMode (const Standard_Boolean theNewMode);

		/****************** SetProgressIndicator ******************/
		%feature("compactdefaultargs") SetProgressIndicator;
		%feature("autodoc", "* //!@name Progress indicator Set the Progress Indicator object.
	:param theObj:
	:type theObj: Message_ProgressIndicator
	:rtype: None") SetProgressIndicator;
		void SetProgressIndicator (const opencascade::handle<Message_ProgressIndicator> & theObj);

		/****************** SetRunParallel ******************/
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "* Set the flag of parallel processing if <theFlag> is true the parallel processing is switched on if <theFlag> is false the parallel processing is switched off
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetRunParallel;
		void SetRunParallel (const Standard_Boolean theFlag);

		/****************** SetUseOBB ******************/
		%feature("compactdefaultargs") SetUseOBB;
		%feature("autodoc", "* //!@name Usage of Oriented Bounding boxes Enables/Disables the usage of OBB
	:param theUseOBB:
	:type theUseOBB: bool
	:rtype: None") SetUseOBB;
		void SetUseOBB (const Standard_Boolean theUseOBB);

		/****************** UseOBB ******************/
		%feature("compactdefaultargs") UseOBB;
		%feature("autodoc", "* Returns the flag defining usage of OBB
	:rtype: bool") UseOBB;
		Standard_Boolean UseOBB ();

};


%extend BOPAlgo_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BOPAlgo_SectionAttribute *
*********************************/
class BOPAlgo_SectionAttribute {
	public:
		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "* Sets the Approximation flag
	:param theApprox:
	:type theApprox: bool
	:rtype: None") Approximation;
		void Approximation (const Standard_Boolean theApprox);

		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "* Returns the Approximation flag
	:rtype: bool") Approximation;
		Standard_Boolean Approximation ();

		/****************** BOPAlgo_SectionAttribute ******************/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "* Default constructor
	:rtype: None") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute ();

		/****************** BOPAlgo_SectionAttribute ******************/
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "* Constructor
	:param theAproximation:
	:type theAproximation: bool
	:param thePCurveOnS1:
	:type thePCurveOnS1: bool
	:param thePCurveOnS2:
	:type thePCurveOnS2: bool
	:rtype: None") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute (const Standard_Boolean theAproximation,const Standard_Boolean thePCurveOnS1,const Standard_Boolean thePCurveOnS2);

		/****************** PCurveOnS1 ******************/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "* Sets the PCurveOnS1 flag
	:param thePCurveOnS1:
	:type thePCurveOnS1: bool
	:rtype: None") PCurveOnS1;
		void PCurveOnS1 (const Standard_Boolean thePCurveOnS1);

		/****************** PCurveOnS1 ******************/
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "* Returns the PCurveOnS1 flag
	:rtype: bool") PCurveOnS1;
		Standard_Boolean PCurveOnS1 ();

		/****************** PCurveOnS2 ******************/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "* Sets the PCurveOnS2 flag
	:param thePCurveOnS2:
	:type thePCurveOnS2: bool
	:rtype: None") PCurveOnS2;
		void PCurveOnS2 (const Standard_Boolean thePCurveOnS2);

		/****************** PCurveOnS2 ******************/
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "* Returns the PCurveOnS2 flag
	:rtype: bool") PCurveOnS2;
		Standard_Boolean PCurveOnS2 ();

};


%extend BOPAlgo_SectionAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BOPAlgo_Tools *
**********************/
class BOPAlgo_Tools {
	public:
		/****************** ClassifyFaces ******************/
		%feature("compactdefaultargs") ClassifyFaces;
		%feature("autodoc", "* Classifies the faces <theFaces> relatively solids <theSolids>. The IN faces for solids are stored into output data map <theInParts>. //! The map <theSolidsIF> contains INTERNAL faces of the solids, to avoid their additional classification. //! Firstly, it checks the intersection of bounding boxes of the shapes. If the Box is not stored in the <theShapeBoxMap> map, it builds the box. If the bounding boxes of solid and face are interfering the classification is performed. //! It is assumed that all faces and solids are already intersected and do not have any geometrically coinciding parts without topological sharing of these parts
	:param theFaces:
	:type theFaces: TopTools_ListOfShape
	:param theSolids:
	:type theSolids: TopTools_ListOfShape
	:param theRunParallel:
	:type theRunParallel: bool
	:param theContext:
	:type theContext: IntTools_Context
	:param theInParts:
	:type theInParts: TopTools_IndexedDataMapOfShapeListOfShape
	:param theShapeBoxMap: default value is TopTools_DataMapOfShapeBox()
	:type theShapeBoxMap: TopTools_DataMapOfShapeBox
	:param theSolidsIF: default value is TopTools_DataMapOfShapeListOfShape()
	:type theSolidsIF: TopTools_DataMapOfShapeListOfShape
	:rtype: void") ClassifyFaces;
		static void ClassifyFaces (const TopTools_ListOfShape & theFaces,const TopTools_ListOfShape & theSolids,const Standard_Boolean theRunParallel,opencascade::handle<IntTools_Context> & theContext,TopTools_IndexedDataMapOfShapeListOfShape & theInParts,const TopTools_DataMapOfShapeBox & theShapeBoxMap = TopTools_DataMapOfShapeBox(),const TopTools_DataMapOfShapeListOfShape & theSolidsIF = TopTools_DataMapOfShapeListOfShape());

		/****************** ComputeToleranceOfCB ******************/
		%feature("compactdefaultargs") ComputeToleranceOfCB;
		%feature("autodoc", ":param theCB:
	:type theCB: BOPDS_CommonBlock
	:param theDS:
	:type theDS: BOPDS_PDS
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: float") ComputeToleranceOfCB;
		static Standard_Real ComputeToleranceOfCB (const opencascade::handle<BOPDS_CommonBlock> & theCB,const BOPDS_PDS theDS,const opencascade::handle<IntTools_Context> & theContext);

		/****************** EdgesToWires ******************/
		%feature("compactdefaultargs") EdgesToWires;
		%feature("autodoc", "* Creates planar wires from the given edges. The input edges are expected to be planar. And for the performance sake the method does not check if the edges are really planar. Thus, the result wires will also be not planar if the input edges are not planar. The edges may be not shared, but the resulting wires will be sharing the coinciding parts and intersecting parts. The output wires may be non-manifold and contain free and multi-connected vertices. Parameters: <theEdges> - input edges; <theWires> - output wires; <theShared> - boolean flag which defines whether the input edges are already shared or have to be intersected; <theAngTol> - the angular tolerance which will be used for distinguishing the planes in which the edges are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns the following error statuses: 0 - in case of success (at least one wire has been built); 1 - in case there are no edges in the given shape; 2 - sharing of the edges has failed.
	:param theEdges:
	:type theEdges: TopoDS_Shape
	:param theWires:
	:type theWires: TopoDS_Shape
	:param theShared: default value is Standard_False
	:type theShared: bool
	:param theAngTol: default value is 1e-8
	:type theAngTol: float
	:rtype: int") EdgesToWires;
		static Standard_Integer EdgesToWires (const TopoDS_Shape & theEdges,TopoDS_Shape & theWires,const Standard_Boolean theShared = Standard_False,const Standard_Real theAngTol = 1e-8);

		/****************** FillInternals ******************/
		%feature("compactdefaultargs") FillInternals;
		%feature("autodoc", "* Classifies the given parts relatively the given solids and fills the solids with the parts classified as INTERNAL. //! @param theSolids - The solids to put internals to @param theParts - The parts to classify relatively solids @param theImages - Possible images of the parts that has to be classified @param theContext - Cashed geometrical tools to speed-up classifications
	:param theSolids:
	:type theSolids: TopTools_ListOfShape
	:param theParts:
	:type theParts: TopTools_ListOfShape
	:param theImages:
	:type theImages: TopTools_DataMapOfShapeListOfShape
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: void") FillInternals;
		static void FillInternals (const TopTools_ListOfShape & theSolids,const TopTools_ListOfShape & theParts,const TopTools_DataMapOfShapeListOfShape & theImages,const opencascade::handle<IntTools_Context> & theContext);

		/****************** IntersectVertices ******************/
		%feature("compactdefaultargs") IntersectVertices;
		%feature("autodoc", "* Finds chains of intersecting vertices
	:param theVertices:
	:type theVertices: TopTools_IndexedDataMapOfShapeReal
	:param theFuzzyValue:
	:type theFuzzyValue: float
	:param theChains:
	:type theChains: TopTools_ListOfListOfShape
	:rtype: void") IntersectVertices;
		static void IntersectVertices (const TopTools_IndexedDataMapOfShapeReal & theVertices,const Standard_Real theFuzzyValue,TopTools_ListOfListOfShape & theChains);

		/****************** PerformCommonBlocks ******************/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "* Create Common Blocks from the groups of pave blocks of <theMBlocks> connection map.
	:param theMBlocks:
	:type theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:param theDS:
	:type theDS: BOPDS_PDS
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") PerformCommonBlocks;
		static void PerformCommonBlocks (BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock & theMBlocks,const opencascade::handle<NCollection_BaseAllocator> & theAllocator,BOPDS_PDS & theDS,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** PerformCommonBlocks ******************/
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "* Create Common Blocks on faces using the PB->Faces connection map <theMBlocks>.
	:param theMBlocks:
	:type theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfInteger
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:param pDS:
	:type pDS: BOPDS_PDS
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") PerformCommonBlocks;
		static void PerformCommonBlocks (const BOPDS_IndexedDataMapOfPaveBlockListOfInteger & theMBlocks,const opencascade::handle<NCollection_BaseAllocator> & theAllocator,BOPDS_PDS & pDS,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** TreatCompound ******************/
		%feature("compactdefaultargs") TreatCompound;
		%feature("autodoc", "* Collect in the output list recursively all non-compound subshapes of the first level of the given shape theS. If a shape presents in the map theMFence it is skipped. All shapes put in the output are also added into theMFence.
	:param theS:
	:type theS: TopoDS_Shape
	:param theMFence:
	:type theMFence: TopTools_MapOfShape
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: void") TreatCompound;
		static void TreatCompound (const TopoDS_Shape & theS,TopTools_MapOfShape & theMFence,TopTools_ListOfShape & theLS);

		/****************** WiresToFaces ******************/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "* Creates planar faces from given planar wires. The method does not check if the wires are really planar. The input wires may be non-manifold but should be shared. The wires located in the same planes and included into other wires will create holes in the faces built from outer wires. The tolerance values of the input shapes may be modified during the operation due to projection of the edges on the planes for creation of 2D curves. Parameters: <theWires> - the given wires; <theFaces> - the output faces; <theAngTol> - the angular tolerance for distinguishing the planes in which the wires are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns True in case of success, i.e. at least one face has been built.
	:param theWires:
	:type theWires: TopoDS_Shape
	:param theFaces:
	:type theFaces: TopoDS_Shape
	:param theAngTol: default value is 1e-8
	:type theAngTol: float
	:rtype: bool") WiresToFaces;
		static Standard_Boolean WiresToFaces (const TopoDS_Shape & theWires,TopoDS_Shape & theFaces,const Standard_Real theAngTol = 1e-8);

};


%extend BOPAlgo_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_WireEdgeSet *
****************************/
class BOPAlgo_WireEdgeSet {
	public:
		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", ":param sS:
	:type sS: TopoDS_Shape
	:rtype: None") AddShape;
		void AddShape (const TopoDS_Shape & sS);

		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", ":param sS:
	:type sS: TopoDS_Shape
	:rtype: None") AddStartElement;
		void AddStartElement (const TopoDS_Shape & sS);

		/****************** BOPAlgo_WireEdgeSet ******************/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", ":rtype: None") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet ();

		/****************** BOPAlgo_WireEdgeSet ******************/
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", ":param aF:
	:type aF: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & aF);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes ();

		/****************** StartElements ******************/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") StartElements;
		const TopTools_ListOfShape & StartElements ();

};


%extend BOPAlgo_WireEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BOPAlgo_Algo *
*********************/
%nodefaultctor BOPAlgo_Algo;
%ignore BOPAlgo_Algo::~BOPAlgo_Algo();
class BOPAlgo_Algo : public BOPAlgo_Options {
	public:
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: void") Perform;
		virtual void Perform ();

};


%extend BOPAlgo_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPAlgo_MakeConnected *
******************************/
class BOPAlgo_MakeConnected : public BOPAlgo_Options {
	public:
		/****************** AddArgument ******************/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "* Adds the shape to the arguments. @param theS [in] One of the argument shapes.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: None") AddArgument;
		void AddArgument (const TopoDS_Shape & theS);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "* Returns the list of arguments of the operation.
	:rtype: TopTools_ListOfShape") Arguments;
		const TopTools_ListOfShape & Arguments ();

		/****************** BOPAlgo_MakeConnected ******************/
		%feature("compactdefaultargs") BOPAlgo_MakeConnected;
		%feature("autodoc", "* @name Constructor Empty constructor
	:rtype: None") BOPAlgo_MakeConnected;
		 BOPAlgo_MakeConnected ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* @name Clearing the contents of the algorithm from previous runs Clears the contents of the algorithm.
	:rtype: None") Clear;
		void Clear ();

		/****************** ClearRepetitions ******************/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "* Clears the repetitions performed on the periodic shape, keeping the shape periodic.
	:rtype: None") ClearRepetitions;
		void ClearRepetitions ();

		/****************** GetModified ******************/
		%feature("compactdefaultargs") GetModified;
		%feature("autodoc", "* Returns the list of shapes modified from the given shape. @param theS [in] The shape for which the modified shapes are necessary.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") GetModified;
		const TopTools_ListOfShape & GetModified (const TopoDS_Shape & theS);

		/****************** GetOrigins ******************/
		%feature("compactdefaultargs") GetOrigins;
		%feature("autodoc", "* Returns the list of original shapes from which the current shape has been created. @param theS [in] The shape for which the origins are necessary.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") GetOrigins;
		const TopTools_ListOfShape & GetOrigins (const TopoDS_Shape & theS);

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "* @name History methods Returns the history of operations
	:rtype: opencascade::handle<BRepTools_History>") History;
		const opencascade::handle<BRepTools_History> & History ();

		/****************** MakePeriodic ******************/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "* @name Shape periodicity & repetition Makes the connected shape periodic. Repeated calls of this method overwrite the previous calls working with the basis connected shape. @param theParams [in] Periodic options.
	:param theParams:
	:type theParams: BOPAlgo_MakePeriodic::PeriodicityParams
	:rtype: None") MakePeriodic;
		void MakePeriodic (const BOPAlgo_MakePeriodic::PeriodicityParams & theParams);

		/****************** MaterialsOnNegativeSide ******************/
		%feature("compactdefaultargs") MaterialsOnNegativeSide;
		%feature("autodoc", "* Returns the original shapes which images contain the the given shape with REVERSED orientation. @param theS [in] The shape for which the materials are necessary.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") MaterialsOnNegativeSide;
		const TopTools_ListOfShape & MaterialsOnNegativeSide (const TopoDS_Shape & theS);

		/****************** MaterialsOnPositiveSide ******************/
		%feature("compactdefaultargs") MaterialsOnPositiveSide;
		%feature("autodoc", "* @name Material transitions Returns the original shapes which images contain the the given shape with FORWARD orientation. @param theS [in] The shape for which the materials are necessary.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") MaterialsOnPositiveSide;
		const TopTools_ListOfShape & MaterialsOnPositiveSide (const TopoDS_Shape & theS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* @name Performing the operations Performs the operation, i.e. makes the input shapes connected.
	:rtype: None") Perform;
		void Perform ();

		/****************** PeriodicShape ******************/
		%feature("compactdefaultargs") PeriodicShape;
		%feature("autodoc", "* Returns the resulting periodic & repeated shape
	:rtype: TopoDS_Shape") PeriodicShape;
		const TopoDS_Shape  PeriodicShape ();

		/****************** PeriodicityTool ******************/
		%feature("compactdefaultargs") PeriodicityTool;
		%feature("autodoc", "* Returns the periodicity tool.
	:rtype: BOPAlgo_MakePeriodic") PeriodicityTool;
		const BOPAlgo_MakePeriodic & PeriodicityTool ();

		/****************** RepeatShape ******************/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "* Performs repetition of the periodic shape in specified direction required number of times. @param theDirectionID [in] The direction's ID (0 for X, 1 for Y, 2 for Z); @param theTimes [in] Requested number of repetitions (sign of the value defines  the side of the repetition direction (positive or negative)).
	:param theDirectionID:
	:type theDirectionID: int
	:param theTimes:
	:type theTimes: int
	:rtype: None") RepeatShape;
		void RepeatShape (const Standard_Integer theDirectionID,const Standard_Integer theTimes);

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "* @name Setters for the shapes to make connected Sets the shape for making them connected. @param theArgs [in] The arguments for the operation.
	:param theArgs:
	:type theArgs: TopTools_ListOfShape
	:rtype: None") SetArguments;
		void SetArguments (const TopTools_ListOfShape & theArgs);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* @name Getting the result shapes Returns the resulting connected shape
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

};


%extend BOPAlgo_MakeConnected {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_MakePeriodic *
*****************************/
class BOPAlgo_MakePeriodic : public BOPAlgo_Options {
	public:
		class PeriodicityParams {};
		/****************** BOPAlgo_MakePeriodic ******************/
		%feature("compactdefaultargs") BOPAlgo_MakePeriodic;
		%feature("autodoc", "* @name Constructor Empty constructor
	:rtype: None") BOPAlgo_MakePeriodic;
		 BOPAlgo_MakePeriodic ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* @name Clearing the algorithm from previous runs Clears the algorithm from previous runs
	:rtype: None") Clear;
		void Clear ();

		/****************** ClearRepetitions ******************/
		%feature("compactdefaultargs") ClearRepetitions;
		%feature("autodoc", "* Clears all performed repetitions. The next repetition will be performed on the base shape.
	:rtype: None") ClearRepetitions;
		void ClearRepetitions ();

		/****************** GetTwins ******************/
		%feature("compactdefaultargs") GetTwins;
		%feature("autodoc", "* @name Getting the identical shapes Returns the identical shapes for the given shape located on the opposite periodic side. Returns empty list in case the shape has no twin. //! @param theS [in] Shape to get the twins for.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") GetTwins;
		const TopTools_ListOfShape & GetTwins (const TopoDS_Shape & theS);

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "* @name Getting the History of the algorithm Returns the History of the algorithm
	:rtype: opencascade::handle<BRepTools_History>") History;
		const opencascade::handle<BRepTools_History> & History ();

		/****************** IsInputTrimmed ******************/
		%feature("compactdefaultargs") IsInputTrimmed;
		%feature("autodoc", "* Returns whether the input shape was trimmed in the specified direction. @param theDirectionID [in] The direction's ID.
	:param theDirectionID:
	:type theDirectionID: int
	:rtype: bool") IsInputTrimmed;
		Standard_Boolean IsInputTrimmed (const Standard_Integer theDirectionID);

		/****************** IsInputXTrimmed ******************/
		%feature("compactdefaultargs") IsInputXTrimmed;
		%feature("autodoc", "* Returns whether the input shape was already trimmed for X period.
	:rtype: bool") IsInputXTrimmed;
		Standard_Boolean IsInputXTrimmed ();

		/****************** IsInputYTrimmed ******************/
		%feature("compactdefaultargs") IsInputYTrimmed;
		%feature("autodoc", "* Returns whether the input shape was already trimmed for Y period.
	:rtype: bool") IsInputYTrimmed;
		Standard_Boolean IsInputYTrimmed ();

		/****************** IsInputZTrimmed ******************/
		%feature("compactdefaultargs") IsInputZTrimmed;
		%feature("autodoc", "* Returns whether the input shape was already trimmed for Z period.
	:rtype: bool") IsInputZTrimmed;
		Standard_Boolean IsInputZTrimmed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "* Returns the info about Periodicity of the shape in specified direction. @param theDirectionID [in] The direction's ID.
	:param theDirectionID:
	:type theDirectionID: int
	:rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic (const Standard_Integer theDirectionID);

		/****************** IsXPeriodic ******************/
		%feature("compactdefaultargs") IsXPeriodic;
		%feature("autodoc", "* Returns the info about periodicity of the shape in X direction.
	:rtype: bool") IsXPeriodic;
		Standard_Boolean IsXPeriodic ();

		/****************** IsYPeriodic ******************/
		%feature("compactdefaultargs") IsYPeriodic;
		%feature("autodoc", "* Returns the info about periodicity of the shape in Y direction.
	:rtype: bool") IsYPeriodic;
		Standard_Boolean IsYPeriodic ();

		/****************** IsZPeriodic ******************/
		%feature("compactdefaultargs") IsZPeriodic;
		%feature("autodoc", "* Returns the info about periodicity of the shape in Z direction.
	:rtype: bool") IsZPeriodic;
		Standard_Boolean IsZPeriodic ();

		/****************** MakePeriodic ******************/
		%feature("compactdefaultargs") MakePeriodic;
		%feature("autodoc", "* @name Methods for setting/getting periodicity info using ID as a direction Sets the flag to make the shape periodic in specified direction: - 0 - X direction; - 1 - Y direction; - 2 - Z direction. //! @param theDirectionID [in] The direction's ID; @param theIsPeriodic [in] Flag defining periodicity in given direction; @param thePeriod [in] Required period in given direction.
	:param theDirectionID:
	:type theDirectionID: int
	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None") MakePeriodic;
		void MakePeriodic (const Standard_Integer theDirectionID,const Standard_Boolean theIsPeriodic,const Standard_Real thePeriod = 0.0);

		/****************** MakeXPeriodic ******************/
		%feature("compactdefaultargs") MakeXPeriodic;
		%feature("autodoc", "* @name Named methods for setting/getting info about shape's periodicity Sets the flag to make the shape periodic in X direction. @param theIsPeriodic [in] Flag defining periodicity in X direction; @param thePeriod [in] Required period in X direction.
	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None") MakeXPeriodic;
		void MakeXPeriodic (const Standard_Boolean theIsPeriodic,const Standard_Real thePeriod = 0.0);

		/****************** MakeYPeriodic ******************/
		%feature("compactdefaultargs") MakeYPeriodic;
		%feature("autodoc", "* Sets the flag to make the shape periodic in Y direction. @param theIsPeriodic [in] Flag defining periodicity in Y direction; @param thePeriod [in] Required period in Y direction.
	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None") MakeYPeriodic;
		void MakeYPeriodic (const Standard_Boolean theIsPeriodic,const Standard_Real thePeriod = 0.0);

		/****************** MakeZPeriodic ******************/
		%feature("compactdefaultargs") MakeZPeriodic;
		%feature("autodoc", "* Sets the flag to make the shape periodic in Z direction. @param theIsPeriodic [in] Flag defining periodicity in Z direction; @param thePeriod [in] Required period in Z direction.
	:param theIsPeriodic:
	:type theIsPeriodic: bool
	:param thePeriod: default value is 0.0
	:type thePeriod: float
	:rtype: None") MakeZPeriodic;
		void MakeZPeriodic (const Standard_Boolean theIsPeriodic,const Standard_Real thePeriod = 0.0);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* @name Performing the operation Makes the shape periodic in necessary directions
	:rtype: None") Perform;
		void Perform ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "* Returns the Period of the shape in specified direction. @param theDirectionID [in] The direction's ID.
	:param theDirectionID:
	:type theDirectionID: int
	:rtype: float") Period;
		Standard_Real Period (const Standard_Integer theDirectionID);

		/****************** PeriodFirst ******************/
		%feature("compactdefaultargs") PeriodFirst;
		%feature("autodoc", "* Returns the first periodic parameter in the specified direction. @param theDirectionID [in] The direction's ID.
	:param theDirectionID:
	:type theDirectionID: int
	:rtype: float") PeriodFirst;
		Standard_Real PeriodFirst (const Standard_Integer theDirectionID);

		/****************** PeriodicityParameters ******************/
		%feature("compactdefaultargs") PeriodicityParameters;
		%feature("autodoc", ":rtype: PeriodicityParams") PeriodicityParameters;
		const PeriodicityParams & PeriodicityParameters ();

		/****************** RepeatShape ******************/
		%feature("compactdefaultargs") RepeatShape;
		%feature("autodoc", "* @name Using the algorithm to repeat the shape Performs repetition of the shape in specified direction required number of times. Negative value of times means that the repetition should be perform in negative direction. Makes the repeated shape a base for following repetitions. //! @param theDirectionID [in] The direction's ID; @param theTimes [in] Requested number of repetitions.
	:param theDirectionID:
	:type theDirectionID: int
	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape") RepeatShape;
		const TopoDS_Shape  RepeatShape (const Standard_Integer theDirectionID,const Standard_Integer theTimes);

		/****************** RepeatedShape ******************/
		%feature("compactdefaultargs") RepeatedShape;
		%feature("autodoc", "* @name Starting the repetitions over Returns the repeated shape
	:rtype: TopoDS_Shape") RepeatedShape;
		const TopoDS_Shape  RepeatedShape ();

		/****************** SetPeriodicityParameters ******************/
		%feature("compactdefaultargs") SetPeriodicityParameters;
		%feature("autodoc", "* //!< Array of start parameters of the XYZ periods: required for trimming @name Setters/Getters for periodicity parameters structure Sets the periodicity parameters. @param theParams [in] Periodicity parameters
	:param theParams:
	:type theParams: PeriodicityParams
	:rtype: None") SetPeriodicityParameters;
		void SetPeriodicityParameters (const PeriodicityParams & theParams);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "* @name Setting the shape to make it periodic Sets the shape to make it periodic. @param theShape [in] The shape to make periodic.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") SetShape;
		void SetShape (const TopoDS_Shape & theShape);

		/****************** SetTrimmed ******************/
		%feature("compactdefaultargs") SetTrimmed;
		%feature("autodoc", "* @name Methods for setting/getting trimming info taking Direction ID as a parameter Defines whether the input shape is already trimmed in specified direction to fit the period in this direction. Direction is defined by an ID: - 0 - X direction; - 1 - Y direction; - 2 - Z direction. //! If the shape is not trimmed it is required to set the first parameter of the period in that direction. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! @param theDirectionID [in] The direction's ID; @param theIsTrimmed [in] The flag defining trimming of the shape in given direction; @param theFirst [in] The first periodic parameter in the given direction.
	:param theDirectionID:
	:type theDirectionID: int
	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: float
	:rtype: None") SetTrimmed;
		void SetTrimmed (const Standard_Integer theDirectionID,const Standard_Boolean theIsTrimmed,const Standard_Real theFirst = 0.0);

		/****************** SetXTrimmed ******************/
		%feature("compactdefaultargs") SetXTrimmed;
		%feature("autodoc", "* @name Named methods for setting/getting trimming info Defines whether the input shape is already trimmed in X direction to fit the X period. If the shape is not trimmed it is required to set the first parameter for the X period. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! @param theIsTrimmed [in] Flag defining whether the shape is already trimmed  in X direction to fit the X period; @param theFirst [in] The first X periodic parameter.
	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: bool
	:rtype: None") SetXTrimmed;
		void SetXTrimmed (const Standard_Boolean theIsTrimmed,const Standard_Boolean theFirst = 0.0);

		/****************** SetYTrimmed ******************/
		%feature("compactdefaultargs") SetYTrimmed;
		%feature("autodoc", "* Defines whether the input shape is already trimmed in Y direction to fit the Y period. If the shape is not trimmed it is required to set the first parameter for the Y period. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! @param theIsTrimmed [in] Flag defining whether the shape is already trimmed  in Y direction to fit the Y period; @param theFirst [in] The first Y periodic parameter.
	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: bool
	:rtype: None") SetYTrimmed;
		void SetYTrimmed (const Standard_Boolean theIsTrimmed,const Standard_Boolean theFirst = 0.0);

		/****************** SetZTrimmed ******************/
		%feature("compactdefaultargs") SetZTrimmed;
		%feature("autodoc", "* Defines whether the input shape is already trimmed in Z direction to fit the Z period. If the shape is not trimmed it is required to set the first parameter for the Z period. The algorithm will make the shape fit into the period. //! Before calling this method, the shape has to be set to be periodic in this direction. //! @param theIsTrimmed [in] Flag defining whether the shape is already trimmed  in Z direction to fit the Z period; @param theFirst [in] The first Z periodic parameter.
	:param theIsTrimmed:
	:type theIsTrimmed: bool
	:param theFirst: default value is 0.0
	:type theFirst: bool
	:rtype: None") SetZTrimmed;
		void SetZTrimmed (const Standard_Boolean theIsTrimmed,const Standard_Boolean theFirst = 0.0);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* @name Obtaining the result shape Returns the resulting periodic shape
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** ToDirectionID ******************/
		%feature("compactdefaultargs") ToDirectionID;
		%feature("autodoc", "* @name Conversion of the integer to ID of periodic direction Converts the integer to ID of periodic direction
	:param theDirectionID:
	:type theDirectionID: int
	:rtype: int") ToDirectionID;
		static Standard_Integer ToDirectionID (const Standard_Integer theDirectionID);

		/****************** XPeriod ******************/
		%feature("compactdefaultargs") XPeriod;
		%feature("autodoc", "* Returns the XPeriod of the shape
	:rtype: float") XPeriod;
		Standard_Real XPeriod ();

		/****************** XPeriodFirst ******************/
		%feature("compactdefaultargs") XPeriodFirst;
		%feature("autodoc", "* Returns the first parameter for the X period.
	:rtype: float") XPeriodFirst;
		Standard_Real XPeriodFirst ();

		/****************** XRepeat ******************/
		%feature("compactdefaultargs") XRepeat;
		%feature("autodoc", "* Repeats the shape in X direction specified number of times. Negative value of times means that the repetition should be perform in negative X direction. Makes the repeated shape a base for following repetitions. //! @param theTimes [in] Requested number of repetitions.
	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape") XRepeat;
		const TopoDS_Shape  XRepeat (const Standard_Integer theTimes);

		/****************** YPeriod ******************/
		%feature("compactdefaultargs") YPeriod;
		%feature("autodoc", "* Returns the YPeriod of the shape.
	:rtype: float") YPeriod;
		Standard_Real YPeriod ();

		/****************** YPeriodFirst ******************/
		%feature("compactdefaultargs") YPeriodFirst;
		%feature("autodoc", "* Returns the first parameter for the Y period.
	:rtype: float") YPeriodFirst;
		Standard_Real YPeriodFirst ();

		/****************** YRepeat ******************/
		%feature("compactdefaultargs") YRepeat;
		%feature("autodoc", "* Repeats the shape in Y direction specified number of times. Negative value of times means that the repetition should be perform in negative Y direction. Makes the repeated shape a base for following repetitions. //! @param theTimes [in] Requested number of repetitions.
	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape") YRepeat;
		const TopoDS_Shape  YRepeat (const Standard_Integer theTimes);

		/****************** ZPeriod ******************/
		%feature("compactdefaultargs") ZPeriod;
		%feature("autodoc", "* Returns the ZPeriod of the shape.
	:rtype: float") ZPeriod;
		Standard_Real ZPeriod ();

		/****************** ZPeriodFirst ******************/
		%feature("compactdefaultargs") ZPeriodFirst;
		%feature("autodoc", "* Returns the first parameter for the Z period.
	:rtype: float") ZPeriodFirst;
		Standard_Real ZPeriodFirst ();

		/****************** ZRepeat ******************/
		%feature("compactdefaultargs") ZRepeat;
		%feature("autodoc", "* Repeats the shape in Z direction specified number of times. Negative value of times means that the repetition should be perform in negative Z direction. Makes the repeated shape a base for following repetitions. //! @param theTimes [in] Requested number of repetitions.
	:param theTimes:
	:type theTimes: int
	:rtype: TopoDS_Shape") ZRepeat;
		const TopoDS_Shape  ZRepeat (const Standard_Integer theTimes);

};


%extend BOPAlgo_MakePeriodic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BOPAlgo_ArgumentAnalyzer *
*********************************/
class BOPAlgo_ArgumentAnalyzer : public BOPAlgo_Algo {
	public:

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetArgumentTypeMode() {
            return (Standard_Boolean) $self->ArgumentTypeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetArgumentTypeMode(Standard_Boolean value) {
            $self->ArgumentTypeMode()=value;
            }
        };
		/****************** BOPAlgo_ArgumentAnalyzer ******************/
		%feature("compactdefaultargs") BOPAlgo_ArgumentAnalyzer;
		%feature("autodoc", "* empty constructor
	:rtype: None") BOPAlgo_ArgumentAnalyzer;
		 BOPAlgo_ArgumentAnalyzer ();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetContinuityMode() {
            return (Standard_Boolean) $self->ContinuityMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetContinuityMode(Standard_Boolean value) {
            $self->ContinuityMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetCurveOnSurfaceMode() {
            return (Standard_Boolean) $self->CurveOnSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetCurveOnSurfaceMode(Standard_Boolean value) {
            $self->CurveOnSurfaceMode()=value;
            }
        };
		/****************** GetCheckResult ******************/
		%feature("compactdefaultargs") GetCheckResult;
		%feature("autodoc", "* returns a result of test
	:rtype: BOPAlgo_ListOfCheckResult") GetCheckResult;
		const BOPAlgo_ListOfCheckResult & GetCheckResult ();

		/****************** GetShape1 ******************/
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "* returns object shape;
	:rtype: TopoDS_Shape") GetShape1;
		const TopoDS_Shape  GetShape1 ();

		/****************** GetShape2 ******************/
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "* returns tool shape
	:rtype: TopoDS_Shape") GetShape2;
		const TopoDS_Shape  GetShape2 ();

		/****************** HasFaulty ******************/
		%feature("compactdefaultargs") HasFaulty;
		%feature("autodoc", "* result of test
	:rtype: bool") HasFaulty;
		Standard_Boolean HasFaulty ();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetMergeEdgeMode() {
            return (Standard_Boolean) $self->MergeEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMergeEdgeMode(Standard_Boolean value) {
            $self->MergeEdgeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetMergeVertexMode() {
            return (Standard_Boolean) $self->MergeVertexMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetMergeVertexMode(Standard_Boolean value) {
            $self->MergeVertexMode()=value;
            }
        };
		/****************** OperationType ******************/
		%feature("compactdefaultargs") OperationType;
		%feature("autodoc", "* returns ref
	:rtype: BOPAlgo_Operation") OperationType;
		BOPAlgo_Operation  OperationType ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* performs analysis
	:rtype: None") Perform;
		void Perform ();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetRebuildFaceMode() {
            return (Standard_Boolean) $self->RebuildFaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetRebuildFaceMode(Standard_Boolean value) {
            $self->RebuildFaceMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSelfInterMode() {
            return (Standard_Boolean) $self->SelfInterMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSelfInterMode(Standard_Boolean value) {
            $self->SelfInterMode()=value;
            }
        };
		/****************** SetShape1 ******************/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "* sets object shape
	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None") SetShape1;
		void SetShape1 (const TopoDS_Shape & TheShape);

		/****************** SetShape2 ******************/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "* sets tool shape
	:param TheShape:
	:type TheShape: TopoDS_Shape
	:rtype: None") SetShape2;
		void SetShape2 (const TopoDS_Shape & TheShape);


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSmallEdgeMode() {
            return (Standard_Boolean) $self->SmallEdgeMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSmallEdgeMode(Standard_Boolean value) {
            $self->SmallEdgeMode()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetStopOnFirstFaulty() {
            return (Standard_Boolean) $self->StopOnFirstFaulty();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetStopOnFirstFaulty(Standard_Boolean value) {
            $self->StopOnFirstFaulty()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetTangentMode() {
            return (Standard_Boolean) $self->TangentMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetTangentMode(Standard_Boolean value) {
            $self->TangentMode()=value;
            }
        };
};


%extend BOPAlgo_ArgumentAnalyzer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_BuilderArea *
****************************/
%nodefaultctor BOPAlgo_BuilderArea;
%ignore BOPAlgo_BuilderArea::~BOPAlgo_BuilderArea();
class BOPAlgo_BuilderArea : public BOPAlgo_Algo {
	public:
		/****************** Areas ******************/
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "* Returns the found areas
	:rtype: TopTools_ListOfShape") Areas;
		const TopTools_ListOfShape & Areas ();

		/****************** IsAvoidInternalShapes ******************/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "* Returns the AvoidInternalShapes flag
	:rtype: bool") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes ();

		/****************** Loops ******************/
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "* Returns the found loops
	:rtype: TopTools_ListOfShape") Loops;
		const TopTools_ListOfShape & Loops ();

		/****************** SetAvoidInternalShapes ******************/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "* Defines the preventing of addition of internal parts into result. The default value is False, i.e. the internal parts are added into result.
	:param theAvoidInternal:
	:type theAvoidInternal: bool
	:rtype: None") SetAvoidInternalShapes;
		void SetAvoidInternalShapes (const Standard_Boolean theAvoidInternal);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets the context for the algorithms
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetShapes ******************/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "* Sets the shapes for building areas
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: None") SetShapes;
		void SetShapes (const TopTools_ListOfShape & theLS);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "* Returns the input shapes
	:rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes ();

};


%extend BOPAlgo_BuilderArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_BuilderShape *
*****************************/
%nodefaultctor BOPAlgo_BuilderShape;
class BOPAlgo_BuilderShape : public BOPAlgo_Algo {
	public:
		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes Generated from the shape theS.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & theS);

		/****************** HasDeleted ******************/
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "* Returns true if any of the input shapes has been deleted during operation.
	:rtype: bool") HasDeleted;
		Standard_Boolean HasDeleted ();

		/****************** HasGenerated ******************/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "* Returns true if any of the input shapes has generated shapes during operation.
	:rtype: bool") HasGenerated;
		Standard_Boolean HasGenerated ();

		/****************** HasHistory ******************/
		%feature("compactdefaultargs") HasHistory;
		%feature("autodoc", "* Returns flag of history availability
	:rtype: bool") HasHistory;
		Standard_Boolean HasHistory ();

		/****************** HasModified ******************/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "* Returns true if any of the input shapes has been modified during operation.
	:rtype: bool") HasModified;
		Standard_Boolean HasModified ();

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "* History Tool
	:rtype: opencascade::handle<BRepTools_History>") History;
		opencascade::handle<BRepTools_History> History ();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns true if the shape theS has been deleted. In this case the shape will have no Modified elements, but can have Generated elements.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: bool") IsDeleted;
		Standard_Boolean IsDeleted (const TopoDS_Shape & theS);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* @name History methods Returns the list of shapes Modified from the shape theS.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		const TopTools_ListOfShape & Modified (const TopoDS_Shape & theS);

		/****************** SetToFillHistory ******************/
		%feature("compactdefaultargs") SetToFillHistory;
		%feature("autodoc", "* @name Enabling/Disabling the history collection. Allows disabling the history collection
	:param theHistFlag:
	:type theHistFlag: bool
	:rtype: None") SetToFillHistory;
		void SetToFillHistory (const Standard_Boolean theHistFlag);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* @name Getting the result Returns the result of algorithm
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

};


%extend BOPAlgo_BuilderShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BOPAlgo_PaveFiller *
***************************/
class BOPAlgo_PaveFiller : public BOPAlgo_Algo {
	public:
		/****************** AddArgument ******************/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "* Adds the argument for operation
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") AddArgument;
		void AddArgument (const TopoDS_Shape & theShape);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "* Returns the list of arguments
	:rtype: TopTools_ListOfShape") Arguments;
		const TopTools_ListOfShape & Arguments ();

		/****************** BOPAlgo_PaveFiller ******************/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", ":rtype: None") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller ();

		/****************** BOPAlgo_PaveFiller ******************/
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", ":rtype: opencascade::handle<IntTools_Context>") Context;
		const opencascade::handle<IntTools_Context> & Context ();

		/****************** DS ******************/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", ":rtype: BOPDS_DS") DS;
		const BOPDS_DS & DS ();

		/****************** Glue ******************/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "* Returns the glue option of the algorithm
	:rtype: BOPAlgo_GlueEnum") Glue;
		BOPAlgo_GlueEnum Glue ();

		/****************** IsAvoidBuildPCurve ******************/
		%feature("compactdefaultargs") IsAvoidBuildPCurve;
		%feature("autodoc", "* Returns the flag to avoid building of p-curves of edges on faces
	:rtype: bool") IsAvoidBuildPCurve;
		Standard_Boolean IsAvoidBuildPCurve ();

		/****************** NonDestructive ******************/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "* Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
	:rtype: bool") NonDestructive;
		Standard_Boolean NonDestructive ();

		/****************** PDS ******************/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", ":rtype: BOPDS_PDS") PDS;
		BOPDS_PDS PDS ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: void") Perform;
		virtual void Perform ();

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "* Sets the arguments for operation
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: None") SetArguments;
		void SetArguments (const TopTools_ListOfShape & theLS);

		/****************** SetAvoidBuildPCurve ******************/
		%feature("compactdefaultargs") SetAvoidBuildPCurve;
		%feature("autodoc", "* Sets the flag to avoid building of p-curves of edges on faces
	:param theValue:
	:type theValue: bool
	:rtype: None") SetAvoidBuildPCurve;
		void SetAvoidBuildPCurve (const Standard_Boolean theValue);

		/****************** SetGlue ******************/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "* Sets the glue option for the algorithm
	:param theGlue:
	:type theGlue: BOPAlgo_GlueEnum
	:rtype: None") SetGlue;
		void SetGlue (const BOPAlgo_GlueEnum theGlue);

		/****************** SetNonDestructive ******************/
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "* Sets the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetNonDestructive;
		void SetNonDestructive (const Standard_Boolean theFlag);

		/****************** SetSectionAttribute ******************/
		%feature("compactdefaultargs") SetSectionAttribute;
		%feature("autodoc", ":param theSecAttr:
	:type theSecAttr: BOPAlgo_SectionAttribute
	:rtype: None") SetSectionAttribute;
		void SetSectionAttribute (const BOPAlgo_SectionAttribute & theSecAttr);

};


%extend BOPAlgo_PaveFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPAlgo_ShellSplitter *
******************************/
class BOPAlgo_ShellSplitter : public BOPAlgo_Algo {
	public:
		/****************** AddStartElement ******************/
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "* adds a face <theS> to process
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: None") AddStartElement;
		void AddStartElement (const TopoDS_Shape & theS);

		/****************** BOPAlgo_ShellSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "* empty constructor
	:rtype: None") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter ();

		/****************** BOPAlgo_ShellSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "* constructor
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* performs the algorithm
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** Shells ******************/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "* returns the loops
	:rtype: TopTools_ListOfShape") Shells;
		const TopTools_ListOfShape & Shells ();

		/****************** SplitBlock ******************/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", ":param theCB:
	:type theCB: BOPTools_ConnexityBlock
	:rtype: void") SplitBlock;
		static void SplitBlock (BOPTools_ConnexityBlock & theCB);

		/****************** StartElements ******************/
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "* return the faces to process
	:rtype: TopTools_ListOfShape") StartElements;
		const TopTools_ListOfShape & StartElements ();

};


%extend BOPAlgo_ShellSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_WireSplitter *
*****************************/
class BOPAlgo_WireSplitter : public BOPAlgo_Algo {
	public:
		/****************** BOPAlgo_WireSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", ":rtype: None") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter ();

		/****************** BOPAlgo_WireSplitter ******************/
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns the context
	:rtype: opencascade::handle<IntTools_Context>") Context;
		const opencascade::handle<IntTools_Context> & Context ();

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", ":param theLE:
	:type theLE: TopTools_ListOfShape
	:param theW:
	:type theW: TopoDS_Wire
	:rtype: None") MakeWire;
		static void MakeWire (TopTools_ListOfShape & theLE,TopoDS_Wire & theW);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: void") Perform;
		virtual void Perform ();

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "* Sets the context for the algorithm
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: None") SetContext;
		void SetContext (const opencascade::handle<IntTools_Context> & theContext);

		/****************** SetWES ******************/
		%feature("compactdefaultargs") SetWES;
		%feature("autodoc", ":param theWES:
	:type theWES: BOPAlgo_WireEdgeSet
	:rtype: None") SetWES;
		void SetWES (const BOPAlgo_WireEdgeSet & theWES);

		/****************** SplitBlock ******************/
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", ":param theF:
	:type theF: TopoDS_Face
	:param theCB:
	:type theCB: BOPTools_ConnexityBlock
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: void") SplitBlock;
		static void SplitBlock (const TopoDS_Face & theF,BOPTools_ConnexityBlock & theCB,const opencascade::handle<IntTools_Context> & theContext);

		/****************** WES ******************/
		%feature("compactdefaultargs") WES;
		%feature("autodoc", ":rtype: BOPAlgo_WireEdgeSet") WES;
		BOPAlgo_WireEdgeSet & WES ();

};


%extend BOPAlgo_WireSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_Builder *
************************/
class BOPAlgo_Builder : public BOPAlgo_BuilderShape {
	public:
		/****************** AddArgument ******************/
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "* @name Arguments Adds the argument to the operation.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: void") AddArgument;
		virtual void AddArgument (const TopoDS_Shape & theShape);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "* Returns the list of arguments.
	:rtype: TopTools_ListOfShape") Arguments;
		const TopTools_ListOfShape & Arguments ();

		/****************** BOPAlgo_Builder ******************/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") BOPAlgo_Builder;
		 BOPAlgo_Builder ();

		/****************** BOPAlgo_Builder ******************/
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_Builder;
		 BOPAlgo_Builder (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** BuildBOP ******************/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "* @name BOPs on open solids Builds the result shape according to the given states for the objects and tools. These states can be unambiguously converted into the Boolean operation type. Thus, it performs the Boolean operation on the given groups of shapes. //! The result is built basing on the result of Builder operation (GF or any other). The only condition for the Builder is that the splits of faces should be created and classified relatively solids. //! The method uses classification approach for choosing the faces which will participate in building the result shape: - All faces from each group having the given state for the opposite group will be taken into result. //! Such approach shows better results (in comparison with BOPAlgo_BuilderSolid approach) when working with open solids. However, the result may not be always correct on such data (at least, not as expected) as the correct classification of the faces relatively open solids is not always possible and may vary depending on the chosen classification point on the face. //! History is not created for the solids in this method. //! To avoid pollution of the report of Builder algorithm, there is a possibility to pass the different report to collect the alerts of the method only. But, if the new report is not given, the Builder report will be used. So, even if Builder passed without any errors, but some error has been stored into its report in this method, for the following calls the Builder report must be cleared. //! The method may set the following errors: - BOPAlgo_AlertBuilderFailed - Building operation has not been performed yet or failed; - BOPAlgo_AlertBOPNotSet - invalid BOP type is given (COMMON/FUSE/CUT/CUT21 are supported); - BOPAlgo_AlertTooFewArguments - arguments are not given; - BOPAlgo_AlertUnknownShape - the shape is unknown for the operation. //! Parameters: @param theObjects - The group of Objects for BOP; @param theObjState - State for objects faces to pass into result; @param theTools - The group of Tools for BOP; @param theObjState - State for tools faces to pass into result; @param theReport - The alternative report to avoid pollution of the main one.
	:param theObjects:
	:type theObjects: TopTools_ListOfShape
	:param theObjState:
	:type theObjState: TopAbs_State
	:param theTools:
	:type theTools: TopTools_ListOfShape
	:param theToolsState:
	:type theToolsState: TopAbs_State
	:param theReport: default value is NULL
	:type theReport: Message_Report
	:rtype: void") BuildBOP;
		virtual void BuildBOP (const TopTools_ListOfShape & theObjects,const TopAbs_State theObjState,const TopTools_ListOfShape & theTools,const TopAbs_State theToolsState,opencascade::handle<Message_Report> theReport = NULL);

		/****************** BuildBOP ******************/
		%feature("compactdefaultargs") BuildBOP;
		%feature("autodoc", "* Builds the result of Boolean operation of given type basing on the result of Builder operation (GF or any other). //! The method converts the given type of operation into the states for the objects and tools required for their face to pass into result and performs the call to the same method, but with states instead of operation type. //! The conversion looks as follows: - COMMON is built from the faces of objects located IN any of the tools and vice versa. - FUSE is built from the faces OUT of all given shapes; - CUT is built from the faces of the objects OUT of the tools and faces of the tools located IN solids of the objects. //! @param theObjects - The group of Objects for BOP; @param theTools - The group of Tools for BOP; @param theOperation - The BOP type; @param theReport - The alternative report to avoid pollution of the global one.
	:param theObjects:
	:type theObjects: TopTools_ListOfShape
	:param theTools:
	:type theTools: TopTools_ListOfShape
	:param theOperation:
	:type theOperation: BOPAlgo_Operation
	:param theReport: default value is NULL
	:type theReport: Message_Report
	:rtype: None") BuildBOP;
		void BuildBOP (const TopTools_ListOfShape & theObjects,const TopTools_ListOfShape & theTools,const BOPAlgo_Operation theOperation,opencascade::handle<Message_Report> theReport = NULL);

		/****************** CheckInverted ******************/
		%feature("compactdefaultargs") CheckInverted;
		%feature("autodoc", "* Returns the flag defining whether the check for input solids on inverted status should be performed or not.
	:rtype: bool") CheckInverted;
		Standard_Boolean CheckInverted ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the content of the algorithm.
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "* Returns the Context, tool for cashing heavy algorithms.
	:rtype: opencascade::handle<IntTools_Context>") Context;
		opencascade::handle<IntTools_Context> Context ();

		/****************** Glue ******************/
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "* Returns the glue option of the algorithm
	:rtype: BOPAlgo_GlueEnum") Glue;
		BOPAlgo_GlueEnum Glue ();

		/****************** Images ******************/
		%feature("compactdefaultargs") Images;
		%feature("autodoc", "* @name Images/Origins Returns the map of images.
	:rtype: TopTools_DataMapOfShapeListOfShape") Images;
		const TopTools_DataMapOfShapeListOfShape & Images ();

		/****************** NonDestructive ******************/
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "* Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.
	:rtype: bool") NonDestructive;
		Standard_Boolean NonDestructive ();

		/****************** Origins ******************/
		%feature("compactdefaultargs") Origins;
		%feature("autodoc", "* Returns the map of origins.
	:rtype: TopTools_DataMapOfShapeListOfShape") Origins;
		const TopTools_DataMapOfShapeListOfShape & Origins ();

		/****************** PDS ******************/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "* Returns the Data Structure, holder of intersection information.
	:rtype: BOPDS_PDS") PDS;
		BOPDS_PDS PDS ();

		/****************** PPaveFiller ******************/
		%feature("compactdefaultargs") PPaveFiller;
		%feature("autodoc", "* Returns the PaveFiller, algorithm for sub-shapes intersection.
	:rtype: BOPAlgo_PPaveFiller") PPaveFiller;
		BOPAlgo_PPaveFiller PPaveFiller ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* @name Performing the operation Performs the operation. The intersection will be performed also.
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** PerformWithFiller ******************/
		%feature("compactdefaultargs") PerformWithFiller;
		%feature("autodoc", "* Performs the operation with the prepared filler. The intersection will not be performed in this case.
	:param theFiller:
	:type theFiller: BOPAlgo_PaveFiller
	:rtype: void") PerformWithFiller;
		virtual void PerformWithFiller (const BOPAlgo_PaveFiller & theFiller);

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "* Sets the list of arguments for the operation.
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:rtype: void") SetArguments;
		virtual void SetArguments (const TopTools_ListOfShape & theLS);

		/****************** SetCheckInverted ******************/
		%feature("compactdefaultargs") SetCheckInverted;
		%feature("autodoc", "* Enables/Disables the check of the input solids for inverted status
	:param theCheck:
	:type theCheck: bool
	:rtype: None") SetCheckInverted;
		void SetCheckInverted (const Standard_Boolean theCheck);

		/****************** SetGlue ******************/
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "* Sets the glue option for the algorithm
	:param theGlue:
	:type theGlue: BOPAlgo_GlueEnum
	:rtype: None") SetGlue;
		void SetGlue (const BOPAlgo_GlueEnum theGlue);

		/****************** SetNonDestructive ******************/
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "* @name Options Sets the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated. This flag is taken into account if internal PaveFiller is used only. In the case of calling PerformWithFiller the corresponding flag of that PaveFiller is in force.
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetNonDestructive;
		void SetNonDestructive (const Standard_Boolean theFlag);

		/****************** ShapesSD ******************/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "* Returns the map of Same Domain (SD) shapes - coinciding shapes from different arguments.
	:rtype: TopTools_DataMapOfShapeShape") ShapesSD;
		const TopTools_DataMapOfShapeShape & ShapesSD ();

};


%extend BOPAlgo_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_BuilderFace *
****************************/
class BOPAlgo_BuilderFace : public BOPAlgo_BuilderArea {
	public:
		/****************** BOPAlgo_BuilderFace ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", ":rtype: None") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace ();

		/****************** BOPAlgo_BuilderFace ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the face generatix
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the algorithm
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "* Sets the face generatix
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & theFace);

};


%extend BOPAlgo_BuilderFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_BuilderSolid *
*****************************/
class BOPAlgo_BuilderSolid : public BOPAlgo_BuilderArea {
	public:
		/****************** BOPAlgo_BuilderSolid ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "* @name Constructors Empty constructor
	:rtype: None") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid ();

		/****************** BOPAlgo_BuilderSolid ******************/
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "* Constructor with allocator
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** GetBoxesMap ******************/
		%feature("compactdefaultargs") GetBoxesMap;
		%feature("autodoc", "* @name Getting the bounding boxes of the created solids For classification purposes the algorithm builds the bounding boxes for all created solids. This method returns the data map of solid - box pairs.
	:rtype: TopTools_DataMapOfShapeBox") GetBoxesMap;
		const TopTools_DataMapOfShapeBox & GetBoxesMap ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* @name Performing the operation Performs the construction of the solids from the given faces
	:rtype: void") Perform;
		virtual void Perform ();

};


%extend BOPAlgo_BuilderSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BOPAlgo_CheckerSI *
**************************/
class BOPAlgo_CheckerSI : public BOPAlgo_PaveFiller {
	public:
		/****************** BOPAlgo_CheckerSI ******************/
		%feature("compactdefaultargs") BOPAlgo_CheckerSI;
		%feature("autodoc", ":rtype: None") BOPAlgo_CheckerSI;
		 BOPAlgo_CheckerSI ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: void") Perform;
		virtual void Perform ();

		/****************** SetLevelOfCheck ******************/
		%feature("compactdefaultargs") SetLevelOfCheck;
		%feature("autodoc", "* Sets the level of checking shape on self-interference. It defines which interferences will be checked: 0 - only V/V; 1 - V/V and V/E; 2 - V/V, V/E and E/E; 3 - V/V, V/E, E/E and V/F; 4 - V/V, V/E, E/E, V/F and E/F; 5 - V/V, V/E, E/E, V/F, E/F and F/F; 6 - V/V, V/E, E/E, V/F, E/F, F/F and V/S; 7 - V/V, V/E, E/E, V/F, E/F, F/F, V/S and E/S; 8 - V/V, V/E, E/E, V/F, E/F, F/F, V/S, E/S and F/S; 9 - V/V, V/E, E/E, V/F, E/F, F/F, V/S, E/S, F/S and S/S - all interferences (Default value)
	:param theLevel:
	:type theLevel: int
	:rtype: None") SetLevelOfCheck;
		void SetLevelOfCheck (const Standard_Integer theLevel);

};


%extend BOPAlgo_CheckerSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BOPAlgo_RemoveFeatures *
*******************************/
class BOPAlgo_RemoveFeatures : public BOPAlgo_BuilderShape {
	public:
		/****************** AddFaceToRemove ******************/
		%feature("compactdefaultargs") AddFaceToRemove;
		%feature("autodoc", "* Adds the face to remove from the input shape. @param theFace [in] The shape to extract the faces for removal.
	:param theFace:
	:type theFace: TopoDS_Shape
	:rtype: None") AddFaceToRemove;
		void AddFaceToRemove (const TopoDS_Shape & theFace);

		/****************** AddFacesToRemove ******************/
		%feature("compactdefaultargs") AddFacesToRemove;
		%feature("autodoc", "* Adds the faces to remove from the input shape. @param theFaces [in] The list of shapes to extract the faces for removal.
	:param theFaces:
	:type theFaces: TopTools_ListOfShape
	:rtype: None") AddFacesToRemove;
		void AddFacesToRemove (const TopTools_ListOfShape & theFaces);

		/****************** BOPAlgo_RemoveFeatures ******************/
		%feature("compactdefaultargs") BOPAlgo_RemoveFeatures;
		%feature("autodoc", "* @name Constructors Empty constructor
	:rtype: None") BOPAlgo_RemoveFeatures;
		 BOPAlgo_RemoveFeatures ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* @name Clearing the contents of the algorithm Clears the contents of the algorithm from previous run, allowing reusing it for following removals.
	:rtype: None") Clear;
		void Clear ();

		/****************** FacesToRemove ******************/
		%feature("compactdefaultargs") FacesToRemove;
		%feature("autodoc", "* Returns the list of faces which have been requested for removal from the input shape.
	:rtype: TopTools_ListOfShape") FacesToRemove;
		const TopTools_ListOfShape & FacesToRemove ();

		/****************** InputShape ******************/
		%feature("compactdefaultargs") InputShape;
		%feature("autodoc", "* Returns the input shape
	:rtype: TopoDS_Shape") InputShape;
		const TopoDS_Shape  InputShape ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* @name Performing the operation Performs the operation
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "* @name Setting input data for the algorithm Sets the shape for processing. @param theShape [in] The shape to remove the faces from.  It should either be the SOLID, COMPSOLID or COMPOUND of Solids.
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") SetShape;
		void SetShape (const TopoDS_Shape & theShape);

};


%extend BOPAlgo_RemoveFeatures {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPAlgo_CellsBuilder *
*****************************/
class BOPAlgo_CellsBuilder : public BOPAlgo_Builder {
	public:
		/****************** AddAllToResult ******************/
		%feature("compactdefaultargs") AddAllToResult;
		%feature("autodoc", "* Add all split parts to result. <theMaterial> defines the removal of internal boundaries; <theUpdate> parameter defines whether to remove boundaries now or not.
	:param theMaterial: default value is 0
	:type theMaterial: int
	:param theUpdate: default value is Standard_False
	:type theUpdate: bool
	:rtype: None") AddAllToResult;
		void AddAllToResult (const Standard_Integer theMaterial = 0,const Standard_Boolean theUpdate = Standard_False);

		/****************** AddToResult ******************/
		%feature("compactdefaultargs") AddToResult;
		%feature("autodoc", "* Adding the parts to result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be taken into result; <theLSToAvoid> defines the arguments which parts should not be taken into result; To be taken into result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>. To remove internal boundaries between any cells in the result <theMaterial> variable should be used. The boundaries between cells with the same material will be removed. Default value is 0. Thus, to remove any boundary the value of this variable should not be equal to 0. <theUpdate> parameter defines whether to remove boundaries now or not.
	:param theLSToTake:
	:type theLSToTake: TopTools_ListOfShape
	:param theLSToAvoid:
	:type theLSToAvoid: TopTools_ListOfShape
	:param theMaterial: default value is 0
	:type theMaterial: int
	:param theUpdate: default value is Standard_False
	:type theUpdate: bool
	:rtype: None") AddToResult;
		void AddToResult (const TopTools_ListOfShape & theLSToTake,const TopTools_ListOfShape & theLSToAvoid,const Standard_Integer theMaterial = 0,const Standard_Boolean theUpdate = Standard_False);

		/****************** BOPAlgo_CellsBuilder ******************/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", ":rtype: None") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder ();

		/****************** BOPAlgo_CellsBuilder ******************/
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Redefined method Clear - clears the contents.
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** GetAllParts ******************/
		%feature("compactdefaultargs") GetAllParts;
		%feature("autodoc", "* Get all split parts.
	:rtype: TopoDS_Shape") GetAllParts;
		const TopoDS_Shape  GetAllParts ();

		/****************** MakeContainers ******************/
		%feature("compactdefaultargs") MakeContainers;
		%feature("autodoc", "* Makes the Containers of proper type from the parts added to result.
	:rtype: None") MakeContainers;
		void MakeContainers ();

		/****************** RemoveAllFromResult ******************/
		%feature("compactdefaultargs") RemoveAllFromResult;
		%feature("autodoc", "* Remove all parts from result.
	:rtype: None") RemoveAllFromResult;
		void RemoveAllFromResult ();

		/****************** RemoveFromResult ******************/
		%feature("compactdefaultargs") RemoveFromResult;
		%feature("autodoc", "* Removing the parts from result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be removed from result; <theLSToAvoid> defines the arguments which parts should not be removed from result. To be removed from the result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>.
	:param theLSToTake:
	:type theLSToTake: TopTools_ListOfShape
	:param theLSToAvoid:
	:type theLSToAvoid: TopTools_ListOfShape
	:rtype: None") RemoveFromResult;
		void RemoveFromResult (const TopTools_ListOfShape & theLSToTake,const TopTools_ListOfShape & theLSToAvoid);

		/****************** RemoveInternalBoundaries ******************/
		%feature("compactdefaultargs") RemoveInternalBoundaries;
		%feature("autodoc", "* Removes internal boundaries between cells with the same material. If the result contains the cells with same material but of different dimension the removal of internal boundaries between these cells will not be performed. In case of some errors during the removal the method will set the appropriate warning status - use GetReport() to access them.
	:rtype: None") RemoveInternalBoundaries;
		void RemoveInternalBoundaries ();

};


%extend BOPAlgo_CellsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPAlgo_MakerVolume *
****************************/
class BOPAlgo_MakerVolume : public BOPAlgo_Builder {
	public:
		/****************** BOPAlgo_MakerVolume ******************/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "* Empty contructor.
	:rtype: None") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume ();

		/****************** BOPAlgo_MakerVolume ******************/
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "* Empty contructor.
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns the solid box <mySBox>.
	:rtype: TopoDS_Solid") Box;
		const TopoDS_Solid  Box ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the data.
	:rtype: None") Clear;
		void Clear ();

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "* Returns the processed faces <myFaces>.
	:rtype: TopTools_ListOfShape") Faces;
		const TopTools_ListOfShape & Faces ();

		/****************** IsAvoidInternalShapes ******************/
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "* Returns the AvoidInternalShapes flag
	:rtype: bool") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes ();

		/****************** IsIntersect ******************/
		%feature("compactdefaultargs") IsIntersect;
		%feature("autodoc", "* Returns the flag <myIntersect>.
	:rtype: bool") IsIntersect;
		Standard_Boolean IsIntersect ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the operation.
	:rtype: void") Perform;
		virtual void Perform ();

		/****************** SetAvoidInternalShapes ******************/
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "* Defines the preventing of addition of internal for solid parts into the result. By default the internal parts are added into result.
	:param theAvoidInternal:
	:type theAvoidInternal: bool
	:rtype: None") SetAvoidInternalShapes;
		void SetAvoidInternalShapes (const Standard_Boolean theAvoidInternal);

		/****************** SetIntersect ******************/
		%feature("compactdefaultargs") SetIntersect;
		%feature("autodoc", "* Sets the flag myIntersect: if <bIntersect> is True the shapes from <myArguments> will be intersected. if <bIntersect> is False no intersection will be done.
	:param bIntersect:
	:type bIntersect: bool
	:rtype: None") SetIntersect;
		void SetIntersect (const Standard_Boolean bIntersect);

};


%extend BOPAlgo_MakerVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPAlgo_Section *
************************/
class BOPAlgo_Section : public BOPAlgo_Builder {
	public:
		/****************** BOPAlgo_Section ******************/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "* Empty constructor
	:rtype: None") BOPAlgo_Section;
		 BOPAlgo_Section ();

		/****************** BOPAlgo_Section ******************/
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "* Constructor with allocator
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_Section;
		 BOPAlgo_Section (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPAlgo_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPAlgo_ToolsProvider *
******************************/
class BOPAlgo_ToolsProvider : public BOPAlgo_Builder {
	public:
		/****************** AddTool ******************/
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "* Adds Tool argument of the operation
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: void") AddTool;
		virtual void AddTool (const TopoDS_Shape & theShape);

		/****************** BOPAlgo_ToolsProvider ******************/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", "* Empty constructor
	:rtype: None") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider ();

		/****************** BOPAlgo_ToolsProvider ******************/
		%feature("compactdefaultargs") BOPAlgo_ToolsProvider;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_ToolsProvider;
		 BOPAlgo_ToolsProvider (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears internal fields and arguments
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** SetTools ******************/
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "* Adds the Tool arguments of the operation
	:param theShapes:
	:type theShapes: TopTools_ListOfShape
	:rtype: void") SetTools;
		virtual void SetTools (const TopTools_ListOfShape & theShapes);

		/****************** Tools ******************/
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "* Returns the Tool arguments of the operation
	:rtype: TopTools_ListOfShape") Tools;
		const TopTools_ListOfShape & Tools ();

};


%extend BOPAlgo_ToolsProvider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BOPAlgo_BOP *
********************/
class BOPAlgo_BOP : public BOPAlgo_ToolsProvider {
	public:
		/****************** BOPAlgo_BOP ******************/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "* Empty constructor
	:rtype: None") BOPAlgo_BOP;
		 BOPAlgo_BOP ();

		/****************** BOPAlgo_BOP ******************/
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_BOP;
		 BOPAlgo_BOP (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears internal fields and arguments
	:rtype: void") Clear;
		virtual void Clear ();

		/****************** Operation ******************/
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", ":rtype: BOPAlgo_Operation") Operation;
		BOPAlgo_Operation Operation ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: void") Perform;
		virtual void Perform ();

		/****************** SetOperation ******************/
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", ":param theOperation:
	:type theOperation: BOPAlgo_Operation
	:rtype: None") SetOperation;
		void SetOperation (const BOPAlgo_Operation theOperation);

};


%extend BOPAlgo_BOP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BOPAlgo_Splitter *
*************************/
class BOPAlgo_Splitter : public BOPAlgo_ToolsProvider {
	public:
		/****************** BOPAlgo_Splitter ******************/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "* Empty constructor
	:rtype: None") BOPAlgo_Splitter;
		 BOPAlgo_Splitter ();

		/****************** BOPAlgo_Splitter ******************/
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPAlgo_Splitter;
		 BOPAlgo_Splitter (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the operation
	:rtype: void") Perform;
		virtual void Perform ();

};


%extend BOPAlgo_Splitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
