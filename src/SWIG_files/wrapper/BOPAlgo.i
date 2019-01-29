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
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BOPALGODOCSTRING) BOPAlgo

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include BOPAlgo_headers.i

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


%nodefaultctor BOPAlgo_CheckResult;
class BOPAlgo_CheckResult {
	public:
		%feature("compactdefaultargs") AddFaultyShape1;
		%feature("autodoc", "	* adds faulty sub-shapes from object to a list

	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:rtype: None
") AddFaultyShape1;
		void AddFaultyShape1 (const TopoDS_Shape & TheShape);
		%feature("compactdefaultargs") AddFaultyShape2;
		%feature("autodoc", "	* adds faulty sub-shapes from tool to a list

	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:rtype: None
") AddFaultyShape2;
		void AddFaultyShape2 (const TopoDS_Shape & TheShape);
		%feature("compactdefaultargs") BOPAlgo_CheckResult;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") BOPAlgo_CheckResult;
		 BOPAlgo_CheckResult ();
		%feature("compactdefaultargs") GetCheckStatus;
		%feature("autodoc", "	* gets status of faulty

	:rtype: BOPAlgo_CheckStatus
") GetCheckStatus;
		BOPAlgo_CheckStatus GetCheckStatus ();
		%feature("compactdefaultargs") GetFaultyShapes1;
		%feature("autodoc", "	* returns list of faulty shapes for object

	:rtype: BOPCol_ListOfShape
") GetFaultyShapes1;
		const BOPCol_ListOfShape & GetFaultyShapes1 ();
		%feature("compactdefaultargs") GetFaultyShapes2;
		%feature("autodoc", "	* returns list of faulty shapes for tool

	:rtype: BOPCol_ListOfShape
") GetFaultyShapes2;
		const BOPCol_ListOfShape & GetFaultyShapes2 ();
		%feature("compactdefaultargs") GetMaxDistance1;
		%feature("autodoc", "	* Returns the distance for the first shape

	:rtype: float
") GetMaxDistance1;
		Standard_Real GetMaxDistance1 ();
		%feature("compactdefaultargs") GetMaxDistance2;
		%feature("autodoc", "	* Returns the distance for the second shape

	:rtype: float
") GetMaxDistance2;
		Standard_Real GetMaxDistance2 ();
		%feature("compactdefaultargs") GetMaxParameter1;
		%feature("autodoc", "	* Returns the parameter for the fircst shape

	:rtype: float
") GetMaxParameter1;
		Standard_Real GetMaxParameter1 ();
		%feature("compactdefaultargs") GetMaxParameter2;
		%feature("autodoc", "	* Returns the parameter for the second shape

	:rtype: float
") GetMaxParameter2;
		Standard_Real GetMaxParameter2 ();
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "	* returns ancestor shape (object) for faulties

	:rtype: TopoDS_Shape
") GetShape1;
		const TopoDS_Shape  GetShape1 ();
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "	* returns ancestor shape (tool) for faulties

	:rtype: TopoDS_Shape
") GetShape2;
		const TopoDS_Shape  GetShape2 ();
		%feature("compactdefaultargs") SetCheckStatus;
		%feature("autodoc", "	* set status of faulty

	:param TheStatus:
	:type TheStatus: BOPAlgo_CheckStatus
	:rtype: None
") SetCheckStatus;
		void SetCheckStatus (const BOPAlgo_CheckStatus TheStatus);
		%feature("compactdefaultargs") SetMaxDistance1;
		%feature("autodoc", "	* Sets max distance for the first shape

	:param theDist:
	:type theDist: float
	:rtype: None
") SetMaxDistance1;
		void SetMaxDistance1 (const Standard_Real theDist);
		%feature("compactdefaultargs") SetMaxDistance2;
		%feature("autodoc", "	* Sets max distance for the second shape

	:param theDist:
	:type theDist: float
	:rtype: None
") SetMaxDistance2;
		void SetMaxDistance2 (const Standard_Real theDist);
		%feature("compactdefaultargs") SetMaxParameter1;
		%feature("autodoc", "	* Sets the parameter for the first shape

	:param thePar:
	:type thePar: float
	:rtype: None
") SetMaxParameter1;
		void SetMaxParameter1 (const Standard_Real thePar);
		%feature("compactdefaultargs") SetMaxParameter2;
		%feature("autodoc", "	* Sets the parameter for the second shape

	:param thePar:
	:type thePar: float
	:rtype: None
") SetMaxParameter2;
		void SetMaxParameter2 (const Standard_Real thePar);
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "	* sets ancestor shape (object) for faulty sub-shapes

	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:rtype: None
") SetShape1;
		void SetShape1 (const TopoDS_Shape & TheShape);
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "	* sets ancestor shape (tool) for faulty sub-shapes

	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:rtype: None
") SetShape2;
		void SetShape2 (const TopoDS_Shape & TheShape);
};


%extend BOPAlgo_CheckResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_Options;
class BOPAlgo_Options {
	public:
		%feature("compactdefaultargs") AddError;
		%feature("autodoc", "	* //!@name Error reporting mechanism Adds the alert as error (fail)

	:param theAlert:
	:type theAlert: Handle_Message_Alert &
	:rtype: None
") AddError;
		void AddError (const Handle_Message_Alert & theAlert);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Adds the alert as warning

	:param theAlert:
	:type theAlert: Handle_Message_Alert &
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Message_Alert & theAlert);
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	* Returns allocator

	:rtype: BOPCol_BaseAllocator
") Allocator;
		const BOPCol_BaseAllocator & Allocator ();
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BOPAlgo_Options;
		 BOPAlgo_Options ();
		%feature("compactdefaultargs") BOPAlgo_Options;
		%feature("autodoc", "	* Constructor with allocator

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_Options;
		 BOPAlgo_Options (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears all warnings and errors, and any data cached by the algorithm. User defined options are not cleared.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ClearWarnings;
		%feature("autodoc", "	* Clears the warnings of the algorithm

	:rtype: None
") ClearWarnings;
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
        		%feature("compactdefaultargs") FuzzyValue;
		%feature("autodoc", "	* Returns the additional tolerance

	:rtype: float
") FuzzyValue;
		Standard_Real FuzzyValue ();
		%feature("compactdefaultargs") GetParallelMode;
		%feature("autodoc", "	* //!@name Parallel processing mode Gets the global parallel mode

	:rtype: bool
") GetParallelMode;
		static Standard_Boolean GetParallelMode ();
		%feature("compactdefaultargs") GetReport;
		%feature("autodoc", "	* Returns report collecting all errors and warnings

	:rtype: Handle_Message_Report
") GetReport;
		Handle_Message_Report GetReport ();
		%feature("compactdefaultargs") HasError;
		%feature("autodoc", "	* Returns true if algorithm has generated error of specified type

	:param theType:
	:type theType: Handle_Standard_Type &
	:rtype: bool
") HasError;
		Standard_Boolean HasError (const Handle_Standard_Type & theType);
		%feature("compactdefaultargs") HasErrors;
		%feature("autodoc", "	* Returns true if algorithm has failed

	:rtype: bool
") HasErrors;
		Standard_Boolean HasErrors ();
		%feature("compactdefaultargs") HasWarning;
		%feature("autodoc", "	* Returns true if algorithm has generated warning of specified type

	:param theType:
	:type theType: Handle_Standard_Type &
	:rtype: bool
") HasWarning;
		Standard_Boolean HasWarning (const Handle_Standard_Type & theType);
		%feature("compactdefaultargs") HasWarnings;
		%feature("autodoc", "	* Returns true if algorithm has generated some warning alerts

	:rtype: bool
") HasWarnings;
		Standard_Boolean HasWarnings ();
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "	* Returns the flag of parallel processing

	:rtype: bool
") RunParallel;
		Standard_Boolean RunParallel ();
		%feature("compactdefaultargs") SetFuzzyValue;
		%feature("autodoc", "	* //!@name Fuzzy tolerance Sets the additional tolerance

	:param theFuzz:
	:type theFuzz: float
	:rtype: None
") SetFuzzyValue;
		void SetFuzzyValue (const Standard_Real theFuzz);
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "	* Sets the global parallel mode

	:param theNewMode:
	:type theNewMode: bool
	:rtype: void
") SetParallelMode;
		static void SetParallelMode (const Standard_Boolean theNewMode);
		%feature("compactdefaultargs") SetProgressIndicator;
		%feature("autodoc", "	* //!@name Progress indicator Set the Progress Indicator object.

	:param theObj:
	:type theObj: Handle_Message_ProgressIndicator &
	:rtype: None
") SetProgressIndicator;
		void SetProgressIndicator (const Handle_Message_ProgressIndicator & theObj);
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "	* Set the flag of parallel processing if <theFlag> is true the parallel processing is switched on if <theFlag> is false the parallel processing is switched off

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetRunParallel;
		void SetRunParallel (const Standard_Boolean theFlag);
};


%extend BOPAlgo_Options {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_SectionAttribute;
class BOPAlgo_SectionAttribute {
	public:
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	* Modifier

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") Approximation;
		void Approximation (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "	* Selector

	:rtype: bool
") Approximation;
		Standard_Boolean Approximation ();
		%feature("compactdefaultargs") BOPAlgo_SectionAttribute;
		%feature("autodoc", "	* Initializes me by flags

	:param Aproximation: default value is Standard_True
	:type Aproximation: bool
	:param PCurveOnS1: default value is Standard_True
	:type PCurveOnS1: bool
	:param PCurveOnS2: default value is Standard_True
	:type PCurveOnS2: bool
	:rtype: None
") BOPAlgo_SectionAttribute;
		 BOPAlgo_SectionAttribute (const Standard_Boolean Aproximation = Standard_True,const Standard_Boolean PCurveOnS1 = Standard_True,const Standard_Boolean PCurveOnS2 = Standard_True);
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "	* Modifier

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") PCurveOnS1;
		void PCurveOnS1 (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") PCurveOnS1;
		%feature("autodoc", "	* Selector

	:rtype: bool
") PCurveOnS1;
		Standard_Boolean PCurveOnS1 ();
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "	* Modifier

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") PCurveOnS2;
		void PCurveOnS2 (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") PCurveOnS2;
		%feature("autodoc", "	* Selector

	:rtype: bool
") PCurveOnS2;
		Standard_Boolean PCurveOnS2 ();
};


%extend BOPAlgo_SectionAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_Tools;
class BOPAlgo_Tools {
	public:
		%feature("compactdefaultargs") ComputeToleranceOfCB;
		%feature("autodoc", "	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:param theDS:
	:type theDS: BOPDS_PDS
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: float
") ComputeToleranceOfCB;
		static Standard_Real ComputeToleranceOfCB (const Handle_BOPDS_CommonBlock & theCB,const BOPDS_PDS theDS,const Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") EdgesToWires;
		%feature("autodoc", "	* Creates planar wires from the given edges. The input edges are expected to be planar. And for the performance sake the method does not check if the edges are really planar. Thus, the result wires will also be not planar if the input edges are not planar. The edges may be not shared, but the resulting wires will be sharing the coinciding parts and intersecting parts. The output wires may be non-manifold and contain free and multi-connected vertices. Parameters: <theEdges> - input edges; <theWires> - output wires; <theShared> - boolean flag which defines whether the input edges are already shared or have to be intersected; <theAngTol> - the angular tolerance which will be used for distinguishing the planes in which the edges are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns the following error statuses: 0 - in case of success (at least one wire has been built); 1 - in case there are no edges in the given shape; 2 - sharing of the edges has failed.

	:param theEdges:
	:type theEdges: TopoDS_Shape &
	:param theWires:
	:type theWires: TopoDS_Shape &
	:param theShared: default value is Standard_False
	:type theShared: bool
	:param theAngTol: default value is 1e-8
	:type theAngTol: float
	:rtype: int
") EdgesToWires;
		static Standard_Integer EdgesToWires (const TopoDS_Shape & theEdges,TopoDS_Shape & theWires,const Standard_Boolean theShared = Standard_False,const Standard_Real theAngTol = 1e-8);
		%feature("compactdefaultargs") IntersectVertices;
		%feature("autodoc", "	* Finds chains of intersecting vertices

	:param theVertices:
	:type theVertices: BOPCol_IndexedDataMapOfShapeReal &
	:param theRunParallel:
	:type theRunParallel: bool
	:param theFuzzyValue:
	:type theFuzzyValue: float
	:param theChains:
	:type theChains: BOPCol_ListOfListOfShape &
	:rtype: void
") IntersectVertices;
		static void IntersectVertices (const BOPCol_IndexedDataMapOfShapeReal & theVertices,const Standard_Boolean theRunParallel,const Standard_Real theFuzzyValue,BOPCol_ListOfListOfShape & theChains);
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "	:param theMBlocks:
	:type theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock &
	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:param theDS:
	:type theDS: BOPDS_PDS &
	:rtype: void
") PerformCommonBlocks;
		static void PerformCommonBlocks (BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock & theMBlocks,const BOPCol_BaseAllocator & theAllocator,BOPDS_PDS & theDS);
		%feature("compactdefaultargs") PerformCommonBlocks;
		%feature("autodoc", "	:param theMBlocks:
	:type theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfInteger &
	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:param pDS:
	:type pDS: BOPDS_PDS &
	:rtype: void
") PerformCommonBlocks;
		static void PerformCommonBlocks (const BOPDS_IndexedDataMapOfPaveBlockListOfInteger & theMBlocks,const BOPCol_BaseAllocator & theAllocator,BOPDS_PDS & pDS);
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "	* Creates planar faces from given planar wires. The method does not check if the wires are really planar. The input wires may be non-manifold but should be shared. The wires located in the same planes and included into other wires will create holes in the faces built from outer wires. The tolerance values of the input shapes may be modified during the operation due to projection of the edges on the planes for creation of 2D curves. Parameters: <theWires> - the given wires; <theFaces> - the output faces; <theAngTol> - the angular tolerance for distinguishing the planes in which the wires are located. Default value is 1.e-8 which is used for intersection of planes in IntTools_FaceFace. Method returns True in case of success, i.e. at least one face has been built.

	:param theWires:
	:type theWires: TopoDS_Shape &
	:param theFaces:
	:type theFaces: TopoDS_Shape &
	:param theAngTol: default value is 1e-8
	:type theAngTol: float
	:rtype: bool
") WiresToFaces;
		static Standard_Boolean WiresToFaces (const TopoDS_Shape & theWires,TopoDS_Shape & theFaces,const Standard_Real theAngTol = 1e-8);
};


%extend BOPAlgo_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_WireEdgeSet;
class BOPAlgo_WireEdgeSet {
	public:
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	:param sS:
	:type sS: TopoDS_Shape &
	:rtype: None
") AddShape;
		void AddShape (const TopoDS_Shape & sS);
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "	:param sS:
	:type sS: TopoDS_Shape &
	:rtype: None
") AddStartElement;
		void AddStartElement (const TopoDS_Shape & sS);
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet ();
		%feature("compactdefaultargs") BOPAlgo_WireEdgeSet;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_WireEdgeSet;
		 BOPAlgo_WireEdgeSet (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "	:param aF:
	:type aF: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & aF);
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") Shapes;
		const BOPCol_ListOfShape & Shapes ();
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") StartElements;
		const BOPCol_ListOfShape & StartElements ();
};


%extend BOPAlgo_WireEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_Algo;
%ignore BOPAlgo_Algo::~BOPAlgo_Algo();
class BOPAlgo_Algo : public BOPAlgo_Options {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
};


%extend BOPAlgo_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_ArgumentAnalyzer;
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
                void SetArgumentTypeMode(Standard_Boolean value ) {
                $self->ArgumentTypeMode()=value;
                }
            };
            		%feature("compactdefaultargs") BOPAlgo_ArgumentAnalyzer;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") BOPAlgo_ArgumentAnalyzer;
		 BOPAlgo_ArgumentAnalyzer ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetContinuityMode() {
                return (Standard_Boolean) $self->ContinuityMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetContinuityMode(Standard_Boolean value ) {
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
                void SetCurveOnSurfaceMode(Standard_Boolean value ) {
                $self->CurveOnSurfaceMode()=value;
                }
            };
            		%feature("compactdefaultargs") GetCheckResult;
		%feature("autodoc", "	* returns a result of test

	:rtype: BOPAlgo_ListOfCheckResult
") GetCheckResult;
		const BOPAlgo_ListOfCheckResult & GetCheckResult ();
		%feature("compactdefaultargs") GetShape1;
		%feature("autodoc", "	* returns object shape;

	:rtype: TopoDS_Shape
") GetShape1;
		const TopoDS_Shape  GetShape1 ();
		%feature("compactdefaultargs") GetShape2;
		%feature("autodoc", "	* returns tool shape

	:rtype: TopoDS_Shape
") GetShape2;
		const TopoDS_Shape  GetShape2 ();
		%feature("compactdefaultargs") HasFaulty;
		%feature("autodoc", "	* result of test

	:rtype: bool
") HasFaulty;
		Standard_Boolean HasFaulty ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetMergeEdgeMode() {
                return (Standard_Boolean) $self->MergeEdgeMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetMergeEdgeMode(Standard_Boolean value ) {
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
                void SetMergeVertexMode(Standard_Boolean value ) {
                $self->MergeVertexMode()=value;
                }
            };
            		%feature("compactdefaultargs") OperationType;
		%feature("autodoc", "	* returns ref

	:rtype: BOPAlgo_Operation
") OperationType;
		BOPAlgo_Operation  OperationType ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* performs analysis

	:rtype: None
") Perform;
		void Perform ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetRebuildFaceMode() {
                return (Standard_Boolean) $self->RebuildFaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetRebuildFaceMode(Standard_Boolean value ) {
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
                void SetSelfInterMode(Standard_Boolean value ) {
                $self->SelfInterMode()=value;
                }
            };
            		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "	* sets object shape

	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:rtype: None
") SetShape1;
		void SetShape1 (const TopoDS_Shape & TheShape);
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "	* sets tool shape

	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:rtype: None
") SetShape2;
		void SetShape2 (const TopoDS_Shape & TheShape);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetSmallEdgeMode() {
                return (Standard_Boolean) $self->SmallEdgeMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetSmallEdgeMode(Standard_Boolean value ) {
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
                void SetStopOnFirstFaulty(Standard_Boolean value ) {
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
                void SetTangentMode(Standard_Boolean value ) {
                $self->TangentMode()=value;
                }
            };
            };


%extend BOPAlgo_ArgumentAnalyzer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_BuilderArea;
%ignore BOPAlgo_BuilderArea::~BOPAlgo_BuilderArea();
class BOPAlgo_BuilderArea : public BOPAlgo_Algo {
	public:
		%feature("compactdefaultargs") Areas;
		%feature("autodoc", "	* Returns the found areas

	:rtype: BOPCol_ListOfShape
") Areas;
		const BOPCol_ListOfShape & Areas ();
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "	* Returns the AvoidInternalShapes flag

	:rtype: bool
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes ();
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "	* Returns the found loops

	:rtype: BOPCol_ListOfShape
") Loops;
		const BOPCol_ListOfShape & Loops ();
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "	* Defines the preventing of addition of internal parts into result. The default value is False, i.e. the internal parts are added into result.

	:param theAvoidInternal:
	:type theAvoidInternal: bool
	:rtype: None
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes (const Standard_Boolean theAvoidInternal);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets the context for the algorithms

	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: None
") SetContext;
		void SetContext (const Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "	* Sets the shapes for building areas

	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") SetShapes;
		void SetShapes (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	* Returns the input shapes

	:rtype: BOPCol_ListOfShape
") Shapes;
		const BOPCol_ListOfShape & Shapes ();
};


%extend BOPAlgo_BuilderArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_BuilderShape;
%ignore BOPAlgo_BuilderShape::~BOPAlgo_BuilderShape();
class BOPAlgo_BuilderShape : public BOPAlgo_Algo {
	public:
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape theS.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") HasDeleted;
		%feature("autodoc", "	* Returns true if the at least one shape(or subshape) of arguments has been deleted.

	:rtype: bool
") HasDeleted;
		Standard_Boolean HasDeleted ();
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "	* Returns true if the at least one shape(or subshape) of arguments has generated shapes.

	:rtype: bool
") HasGenerated;
		Standard_Boolean HasGenerated ();
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "	* Returns true if the at least one shape(or subshape) of arguments has modified shapes.

	:rtype: bool
") HasModified;
		Standard_Boolean HasModified ();
		%feature("compactdefaultargs") ImagesResult;
		%feature("autodoc", "	:rtype: BOPCol_IndexedDataMapOfShapeListOfShape
") ImagesResult;
		const BOPCol_IndexedDataMapOfShapeListOfShape & ImagesResult ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns true if the shape theS has been deleted.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape theS.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the result of algorithm

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
};


%extend BOPAlgo_BuilderShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_PaveFiller;
class BOPAlgo_PaveFiller : public BOPAlgo_Algo {
	public:
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") Arguments;
		const BOPCol_ListOfShape & Arguments ();
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller ();
		%feature("compactdefaultargs") BOPAlgo_PaveFiller;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_PaveFiller;
		 BOPAlgo_PaveFiller (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	:rtype: Handle_IntTools_Context
") Context;
		Handle_IntTools_Context Context ();
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "	:rtype: BOPDS_DS
") DS;
		const BOPDS_DS & DS ();
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "	* Returns the glue option of the algorithm

	:rtype: BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue ();
		%feature("compactdefaultargs") IsAvoidBuildPCurve;
		%feature("autodoc", "	* Returns the flag to avoid building of p-curves of edges on faces

	:rtype: bool
") IsAvoidBuildPCurve;
		Standard_Boolean IsAvoidBuildPCurve ();
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "	* Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.

	:rtype: bool
") NonDestructive;
		Standard_Boolean NonDestructive ();
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "	:rtype: BOPDS_PDS
") PDS;
		BOPDS_PDS PDS ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") SetArguments;
		void SetArguments (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") SetAvoidBuildPCurve;
		%feature("autodoc", "	* Sets the flag to avoid building of p-curves of edges on faces

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetAvoidBuildPCurve;
		void SetAvoidBuildPCurve (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "	* Sets the glue option for the algorithm

	:param theGlue:
	:type theGlue: BOPAlgo_GlueEnum
	:rtype: None
") SetGlue;
		void SetGlue (const BOPAlgo_GlueEnum theGlue);
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "	* Sets the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetNonDestructive;
		void SetNonDestructive (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") SetSectionAttribute;
		%feature("autodoc", "	:param theSecAttr:
	:type theSecAttr: BOPAlgo_SectionAttribute &
	:rtype: None
") SetSectionAttribute;
		void SetSectionAttribute (const BOPAlgo_SectionAttribute & theSecAttr);
};


%extend BOPAlgo_PaveFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_ShellSplitter;
class BOPAlgo_ShellSplitter : public BOPAlgo_Algo {
	public:
		%feature("compactdefaultargs") AddStartElement;
		%feature("autodoc", "	* adds a face <theS> to process

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: None
") AddStartElement;
		void AddStartElement (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter ();
		%feature("compactdefaultargs") BOPAlgo_ShellSplitter;
		%feature("autodoc", "	* constructor

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_ShellSplitter;
		 BOPAlgo_ShellSplitter (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* performs the algorithm

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "	* returns the loops

	:rtype: BOPCol_ListOfShape
") Shells;
		const BOPCol_ListOfShape & Shells ();
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "	:param theCB:
	:type theCB: BOPTools_ConnexityBlock &
	:rtype: void
") SplitBlock;
		static void SplitBlock (BOPTools_ConnexityBlock & theCB);
		%feature("compactdefaultargs") StartElements;
		%feature("autodoc", "	* return the faces to process

	:rtype: BOPCol_ListOfShape
") StartElements;
		const BOPCol_ListOfShape & StartElements ();
};


%extend BOPAlgo_ShellSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_WireSplitter;
class BOPAlgo_WireSplitter : public BOPAlgo_Algo {
	public:
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter ();
		%feature("compactdefaultargs") BOPAlgo_WireSplitter;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_WireSplitter;
		 BOPAlgo_WireSplitter (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns the context

	:rtype: Handle_IntTools_Context
") Context;
		Handle_IntTools_Context Context ();
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	:param theLE:
	:type theLE: BOPCol_ListOfShape &
	:param theW:
	:type theW: TopoDS_Wire &
	:rtype: void
") MakeWire;
		static void MakeWire (BOPCol_ListOfShape & theLE,TopoDS_Wire & theW);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets the context for the algorithm

	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: None
") SetContext;
		void SetContext (const Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") SetWES;
		%feature("autodoc", "	:param theWES:
	:type theWES: BOPAlgo_WireEdgeSet &
	:rtype: None
") SetWES;
		void SetWES (const BOPAlgo_WireEdgeSet & theWES);
		%feature("compactdefaultargs") SplitBlock;
		%feature("autodoc", "	:param theF:
	:type theF: TopoDS_Face &
	:param theCB:
	:type theCB: BOPTools_ConnexityBlock &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: void
") SplitBlock;
		static void SplitBlock (const TopoDS_Face & theF,BOPTools_ConnexityBlock & theCB,const Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") WES;
		%feature("autodoc", "	:rtype: BOPAlgo_WireEdgeSet
") WES;
		BOPAlgo_WireEdgeSet & WES ();
};


%extend BOPAlgo_WireSplitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_Builder;
class BOPAlgo_Builder : public BOPAlgo_BuilderShape {
	public:
		%feature("compactdefaultargs") AddArgument;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: void
") AddArgument;
		virtual void AddArgument (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") Arguments;
		const BOPCol_ListOfShape & Arguments ();
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_Builder;
		 BOPAlgo_Builder ();
		%feature("compactdefaultargs") BOPAlgo_Builder;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_Builder;
		 BOPAlgo_Builder (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape theS.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Glue;
		%feature("autodoc", "	* Returns the glue option of the algorithm

	:rtype: BOPAlgo_GlueEnum
") Glue;
		BOPAlgo_GlueEnum Glue ();
		%feature("compactdefaultargs") Images;
		%feature("autodoc", "	:rtype: BOPCol_DataMapOfShapeListOfShape
") Images;
		const BOPCol_DataMapOfShapeListOfShape & Images ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns true if the shape theS has been deleted.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") IsInterferred;
		%feature("autodoc", "	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: bool
") IsInterferred;
		Standard_Boolean IsInterferred (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes modified from the shape theS.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") NonDestructive;
		%feature("autodoc", "	* Returns the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated.

	:rtype: bool
") NonDestructive;
		Standard_Boolean NonDestructive ();
		%feature("compactdefaultargs") Origins;
		%feature("autodoc", "	* Returns myOrigins.

	:rtype: BOPCol_DataMapOfShapeListOfShape
") Origins;
		const BOPCol_DataMapOfShapeListOfShape & Origins ();
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "	:rtype: BOPDS_PDS
") PDS;
		BOPDS_PDS PDS ();
		%feature("compactdefaultargs") PPaveFiller;
		%feature("autodoc", "	:rtype: BOPAlgo_PPaveFiller
") PPaveFiller;
		BOPAlgo_PPaveFiller PPaveFiller ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") PerformWithFiller;
		%feature("autodoc", "	:param theFiller:
	:type theFiller: BOPAlgo_PaveFiller &
	:rtype: void
") PerformWithFiller;
		virtual void PerformWithFiller (const BOPAlgo_PaveFiller & theFiller);
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: void
") SetArguments;
		virtual void SetArguments (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") SetGlue;
		%feature("autodoc", "	* Sets the glue option for the algorithm

	:param theGlue:
	:type theGlue: BOPAlgo_GlueEnum
	:rtype: None
") SetGlue;
		void SetGlue (const BOPAlgo_GlueEnum theGlue);
		%feature("compactdefaultargs") SetNonDestructive;
		%feature("autodoc", "	* Sets the flag that defines the mode of treatment. In non-destructive mode the argument shapes are not modified. Instead a copy of a sub-shape is created in the result if it is needed to be updated. This flag is taken into account if internal PaveFiller is used only. In the case of calling PerformWithFiller the corresponding flag of that PaveFiller is in force.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetNonDestructive;
		void SetNonDestructive (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "	* Returns myShapesSD.

	:rtype: BOPCol_DataMapOfShapeShape
") ShapesSD;
		const BOPCol_DataMapOfShapeShape & ShapesSD ();
		%feature("compactdefaultargs") Splits;
		%feature("autodoc", "	* Returns mySplits.

	:rtype: BOPCol_DataMapOfShapeListOfShape
") Splits;
		const BOPCol_DataMapOfShapeListOfShape & Splits ();
};


%extend BOPAlgo_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_BuilderFace;
class BOPAlgo_BuilderFace : public BOPAlgo_BuilderArea {
	public:
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace ();
		%feature("compactdefaultargs") BOPAlgo_BuilderFace;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_BuilderFace;
		 BOPAlgo_BuilderFace (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the face generatix

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the algorithm

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "	* Sets the face generatix

	:param theFace:
	:type theFace: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & theFace);
};


%extend BOPAlgo_BuilderFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_BuilderSolid;
class BOPAlgo_BuilderSolid : public BOPAlgo_BuilderArea {
	public:
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid ();
		%feature("compactdefaultargs") BOPAlgo_BuilderSolid;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_BuilderSolid;
		 BOPAlgo_BuilderSolid (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the algorithm

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetSolid;
		%feature("autodoc", "	* Sets the source solid <theSolid>

	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:rtype: None
") SetSolid;
		void SetSolid (const TopoDS_Solid & theSolid);
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	* Returns the source solid

	:rtype: TopoDS_Solid
") Solid;
		const TopoDS_Solid  Solid ();
};


%extend BOPAlgo_BuilderSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_CheckerSI;
class BOPAlgo_CheckerSI : public BOPAlgo_PaveFiller {
	public:
		%feature("compactdefaultargs") BOPAlgo_CheckerSI;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_CheckerSI;
		 BOPAlgo_CheckerSI ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetLevelOfCheck;
		%feature("autodoc", "	* Sets the level of checking shape on self-interference. It defines which interferences will be checked: 0 - only V/V; 1 - V/V and V/E; 2 - V/V, V/E and E/E; 3 - V/V, V/E, E/E and V/F; 4 - V/V, V/E, E/E, V/F and E/F; 5 - V/V, V/E, E/E, V/F, E/F and F/F; 6 - V/V, V/E, E/E, V/F, E/F, F/F and V/S; 7 - V/V, V/E, E/E, V/F, E/F, F/F, V/S and E/S; 8 - V/V, V/E, E/E, V/F, E/F, F/F, V/S, E/S and F/S; 9 - V/V, V/E, E/E, V/F, E/F, F/F, V/S, E/S, F/S and S/S - all interferences (Default value)

	:param theLevel:
	:type theLevel: int
	:rtype: None
") SetLevelOfCheck;
		void SetLevelOfCheck (const Standard_Integer theLevel);
};


%extend BOPAlgo_CheckerSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_BOP;
class BOPAlgo_BOP : public BOPAlgo_Builder {
	public:
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "	* Adds Tool argument of the operation

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: void
") AddTool;
		virtual void AddTool (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BOPAlgo_BOP;
		 BOPAlgo_BOP ();
		%feature("compactdefaultargs") BOPAlgo_BOP;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_BOP;
		 BOPAlgo_BOP (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears internal fields and arguments

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Operation;
		%feature("autodoc", "	:rtype: BOPAlgo_Operation
") Operation;
		BOPAlgo_Operation Operation ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetOperation;
		%feature("autodoc", "	:param theOperation:
	:type theOperation: BOPAlgo_Operation
	:rtype: None
") SetOperation;
		void SetOperation (const BOPAlgo_Operation theOperation);
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "	:param theShapes:
	:type theShapes: BOPCol_ListOfShape &
	:rtype: void
") SetTools;
		virtual void SetTools (const BOPCol_ListOfShape & theShapes);
};


%extend BOPAlgo_BOP {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_CellsBuilder;
class BOPAlgo_CellsBuilder : public BOPAlgo_Builder {
	public:
		%feature("compactdefaultargs") AddAllToResult;
		%feature("autodoc", "	* Add all split parts to result. <theMaterial> defines the removal of internal boundaries; <theUpdate> parameter defines whether to remove boundaries now or not.

	:param theMaterial: default value is 0
	:type theMaterial: int
	:param theUpdate: default value is Standard_False
	:type theUpdate: bool
	:rtype: None
") AddAllToResult;
		void AddAllToResult (const Standard_Integer theMaterial = 0,const Standard_Boolean theUpdate = Standard_False);
		%feature("compactdefaultargs") AddToResult;
		%feature("autodoc", "	* Adding the parts to result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be taken into result; <theLSToAvoid> defines the arguments which parts should not be taken into result; To be taken into result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>. To remove internal boundaries between any cells in the result <theMaterial> variable should be used. The boundaries between cells with the same material will be removed. Default value is 0. Thus, to remove any boundary the value of this variable should not be equal to 0. <theUpdate> parameter defines whether to remove boundaries now or not.

	:param theLSToTake:
	:type theLSToTake: BOPCol_ListOfShape &
	:param theLSToAvoid:
	:type theLSToAvoid: BOPCol_ListOfShape &
	:param theMaterial: default value is 0
	:type theMaterial: int
	:param theUpdate: default value is Standard_False
	:type theUpdate: bool
	:rtype: None
") AddToResult;
		void AddToResult (const BOPCol_ListOfShape & theLSToTake,const BOPCol_ListOfShape & theLSToAvoid,const Standard_Integer theMaterial = 0,const Standard_Boolean theUpdate = Standard_False);
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "	:rtype: None
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder ();
		%feature("compactdefaultargs") BOPAlgo_CellsBuilder;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPAlgo_CellsBuilder;
		 BOPAlgo_CellsBuilder (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Redefined method Clear - clears the contents.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") GetAllParts;
		%feature("autodoc", "	* Get all split parts.

	:rtype: TopoDS_Shape
") GetAllParts;
		const TopoDS_Shape  GetAllParts ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns true if the shape theS has been deleted.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") MakeContainers;
		%feature("autodoc", "	* Makes the Containers of proper type from the parts added to result.

	:rtype: None
") MakeContainers;
		void MakeContainers ();
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape theS.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") RemoveAllFromResult;
		%feature("autodoc", "	* Remove all parts from result.

	:rtype: None
") RemoveAllFromResult;
		void RemoveAllFromResult ();
		%feature("compactdefaultargs") RemoveFromResult;
		%feature("autodoc", "	* Removing the parts from result. The parts are defined by two lists of shapes: <theLSToTake> defines the arguments which parts should be removed from result; <theLSToAvoid> defines the arguments which parts should not be removed from result. To be removed from the result the part must be IN for all shapes from the list <theLSToTake> and must be OUT of all shapes from the list <theLSToAvoid>.

	:param theLSToTake:
	:type theLSToTake: BOPCol_ListOfShape &
	:param theLSToAvoid:
	:type theLSToAvoid: BOPCol_ListOfShape &
	:rtype: None
") RemoveFromResult;
		void RemoveFromResult (const BOPCol_ListOfShape & theLSToTake,const BOPCol_ListOfShape & theLSToAvoid);
		%feature("compactdefaultargs") RemoveInternalBoundaries;
		%feature("autodoc", "	* Removes internal boundaries between cells with the same material. If the result contains the cells with same material but of different dimension the removal of internal boundaries between these cells will not be performed. In case of some errors during the removal the method will set the appropriate warning status - use GetReport() to access them.

	:rtype: None
") RemoveInternalBoundaries;
		void RemoveInternalBoundaries ();
};


%extend BOPAlgo_CellsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_MakerVolume;
class BOPAlgo_MakerVolume : public BOPAlgo_Builder {
	public:
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "	* Empty contructor.

	:rtype: None
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume ();
		%feature("compactdefaultargs") BOPAlgo_MakerVolume;
		%feature("autodoc", "	* Empty contructor.

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_MakerVolume;
		 BOPAlgo_MakerVolume (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns the solid box <mySBox>.

	:rtype: TopoDS_Solid
") Box;
		const TopoDS_Solid  Box ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the data.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "	* Returns the processed faces <myFaces>.

	:rtype: BOPCol_ListOfShape
") Faces;
		const BOPCol_ListOfShape & Faces ();
		%feature("compactdefaultargs") IsAvoidInternalShapes;
		%feature("autodoc", "	* Returns the AvoidInternalShapes flag

	:rtype: bool
") IsAvoidInternalShapes;
		Standard_Boolean IsAvoidInternalShapes ();
		%feature("compactdefaultargs") IsIntersect;
		%feature("autodoc", "	* Returns the flag <myIntersect>.

	:rtype: bool
") IsIntersect;
		Standard_Boolean IsIntersect ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the operation.

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetAvoidInternalShapes;
		%feature("autodoc", "	* Defines the preventing of addition of internal for solid parts into the result. By default the internal parts are added into result.

	:param theAvoidInternal:
	:type theAvoidInternal: bool
	:rtype: None
") SetAvoidInternalShapes;
		void SetAvoidInternalShapes (const Standard_Boolean theAvoidInternal);
		%feature("compactdefaultargs") SetIntersect;
		%feature("autodoc", "	* Sets the flag myIntersect: if <bIntersect> is True the shapes from <myArguments> will be intersected. if <bIntersect> is False no intersection will be done.

	:param bIntersect:
	:type bIntersect: bool
	:rtype: None
") SetIntersect;
		void SetIntersect (const Standard_Boolean bIntersect);
};


%extend BOPAlgo_MakerVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_Section;
class BOPAlgo_Section : public BOPAlgo_Builder {
	public:
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BOPAlgo_Section;
		 BOPAlgo_Section ();
		%feature("compactdefaultargs") BOPAlgo_Section;
		%feature("autodoc", "	* Empty constructor //! protected methods

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_Section;
		 BOPAlgo_Section (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") BuildSection;
		%feature("autodoc", "	:rtype: void
") BuildSection;
		virtual void BuildSection ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returns the list of shapes generated from the shape theS.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & theS);
};


%extend BOPAlgo_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPAlgo_Splitter;
class BOPAlgo_Splitter : public BOPAlgo_Builder {
	public:
		%feature("compactdefaultargs") AddTool;
		%feature("autodoc", "	* Adds Tool argument of the operation

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: void
") AddTool;
		virtual void AddTool (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter ();
		%feature("compactdefaultargs") BOPAlgo_Splitter;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPAlgo_Splitter;
		 BOPAlgo_Splitter (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears internal fields and arguments

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the operation

	:rtype: void
") Perform;
		virtual void Perform ();
		%feature("compactdefaultargs") SetTools;
		%feature("autodoc", "	* Adds the Tool arguments of the operation

	:param theShapes:
	:type theShapes: BOPCol_ListOfShape &
	:rtype: void
") SetTools;
		virtual void SetTools (const BOPCol_ListOfShape & theShapes);
		%feature("compactdefaultargs") Tools;
		%feature("autodoc", "	* Returns the Tool arguments of the operation

	:rtype: BOPCol_ListOfShape
") Tools;
		const BOPCol_ListOfShape & Tools ();
};


%extend BOPAlgo_Splitter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
