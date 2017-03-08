/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") SMESH

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


%include SMESH_headers.i


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
typedef std::map <const SMDS_MeshElement * , std::list <const SMDS_MeshElement *>> TElemOfElemListMap;
typedef const SMDS_MeshElement * SMDS_MeshElementPtr;
typedef boost::shared_ptr <NumericalFunctor> SMESH::Controls::NumericalFunctorPtr;
typedef NCollection_IndexedMap <TopoDS_Shape> SMESH_IndexedMapOfShape;
typedef boost::shared_ptr <SMESH_ComputeError> SMESH_ComputeErrorPtr;
typedef boost::shared_ptr <SMESH_OctreeNodeIterator> SMESH_OctreeNodeIteratorPtr;
typedef NCollection_Sequence <SMDS_MeshElementPtr> SMESH_SequenceOfElemPtr;
typedef SMDS_Iterator <SMESH_OctreeNode *> SMESH_OctreeNodeIterator;
typedef boost::shared_ptr <Predicate> SMESH::Controls::PredicatePtr;
typedef boost::shared_ptr<SMDS_Iterator <SMESH_subMesh *>> SMESH_subMeshIteratorPtr;
typedef std::map <SMESH_TLink , const SMDS_MeshNode *> TLinkNodeMap;
typedef NCollection_IndexedDataMap <SMESH_IndexedMapOfShape , TopoDS_Shape> SMESH_IndexedDataMapOfShapeIndexedMapOfShape;
typedef std::map<double , TNodeColumn> TParam2ColumnMap;
typedef SMESH_Hypothesis::Hypothesis_Status TAlgoStateErrorName;
typedef SMESH_subMeshEventListener EventListener;
typedef pair<const SMDS_MeshNode * , const SMDS_MeshNode *> NLink;
typedef const SMDS_MeshNode * SMDS_MeshNodePtr;
typedef NCollection_Sequence <SMDS_MeshNodePtr> SMESH_SequenceOfNode;
typedef boost::shared_ptr <Functor> SMESH::Controls::FunctorPtr;
typedef SMESH_subMeshEventListenerData EventListenerData;
typedef std::map <SMESH_TLink , const SMDS_MeshNode *>::iterator ItTLinkNode;
typedef std::map <const SMDS_MeshNode * , const SMDS_MeshNode *> TNodeNodeMap;
typedef std::set <int> TSetOfInt;
typedef std::set<const SMDS_MeshElement * , TIDCompare> TIDSortedElemSet;
typedef std::vector <const SMDS_MeshNode *> TNodeColumn;
/* end typedefs declaration */

/* public enums */
enum SMESH_ComputeErrorName {
	COMPERR_OK = - 1,
	COMPERR_BAD_INPUT_MESH = - 2,
	COMPERR_STD_EXCEPTION = - 3,
	COMPERR_OCC_EXCEPTION = - 4,
	COMPERR_SLM_EXCEPTION = - 5,
	COMPERR_EXCEPTION = - 6,
	COMPERR_MEMORY_PB = - 7,
	COMPERR_ALGO_FAILED = - 8,
	COMPERR_BAD_SHAPE = - 9,
};

enum MeshDimension {
	MeshDim_0D = 0,
	MeshDim_1D = 1,
	MeshDim_2D = 2,
	MeshDim_3D = 3,
};

/* end public enums declaration */

%nodefaultctor SMESH_ElementSearcher;
class SMESH_ElementSearcher {
	public:
		%feature("compactdefaultargs") FindElementsByPoint;
		%feature("autodoc", "	:param point:
	:type point: gp_Pnt
	:param type:
	:type type: SMDSAbs_ElementType
	:param foundElems:
	:type foundElems: std::vector<  SMDS_MeshElement *> &
	:rtype: None
") FindElementsByPoint;
		void FindElementsByPoint (const gp_Pnt & point,SMDSAbs_ElementType type,std::vector< const SMDS_MeshElement *> & foundElems);
};


%extend SMESH_ElementSearcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_Exception;
class SMESH_Exception : public std::exception {
	public:
		%feature("compactdefaultargs") SMESH_Exception;
		%feature("autodoc", "	:param text:
	:type text: char *
	:param fileName: default value is 0
	:type fileName: char *
	:param lineNumber: default value is 0
	:type lineNumber: unsigned int
	:rtype: None
") SMESH_Exception;
		 SMESH_Exception (const char * text,const char * fileName = 0,const unsigned int lineNumber = 0);
		%feature("compactdefaultargs") SMESH_Exception;
		%feature("autodoc", "	:param ex:
	:type ex: SMESH_Exception &
	:rtype: None
") SMESH_Exception;
		 SMESH_Exception (const SMESH_Exception & ex);
		%feature("compactdefaultargs") what;
		%feature("autodoc", "	:param :
	:type : void
	:rtype: char *
") what;
		const char * what (void );
};


%extend SMESH_Exception {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_Gen;
class SMESH_Gen {
	public:
		%feature("compactdefaultargs") SMESH_Gen;
		%feature("autodoc", "	:rtype: None
") SMESH_Gen;
		 SMESH_Gen ();
		%feature("compactdefaultargs") CreateMesh;
		%feature("autodoc", "	:param theStudyId:
	:type theStudyId: int
	:param theIsEmbeddedMode:
	:type theIsEmbeddedMode: bool
	:rtype: SMESH_Mesh *
") CreateMesh;
		SMESH_Mesh * CreateMesh (int theStudyId,bool theIsEmbeddedMode);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* /*! * \brief Computes aMesh on aShape * \param anUpward - compute from vertices up to more complex shape (internal usage) * \param aDim - upper level dimension of the mesh computation * \param aShapesId - list of shapes with computed mesh entities (elements or nodes) * etval bool - true if none submesh failed to compute */

	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param anUpward: default value is false
	:type anUpward: bool
	:param aDim: default value is MeshDim_3D
	:type aDim: MeshDimension
	:param aShapesId: default value is 0
	:type aShapesId: TSetOfInt *
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,const bool anUpward = false,const MeshDimension aDim = MeshDim_3D,TSetOfInt * aShapesId = 0);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* /*! * \brief evaluates size of prospective mesh on a shape * \param aMesh - the mesh * \param aShape - the shape * \param aResMap - map for prospective numbers of elements * etval bool - is a success */

	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:param anUpward: default value is false
	:type anUpward: bool
	:param aShapesId: default value is 0
	:type aShapesId: TSetOfInt *
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap,const bool anUpward = false,TSetOfInt * aShapesId = 0);
		%feature("compactdefaultargs") CheckAlgoState;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") CheckAlgoState;
		bool CheckAlgoState (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") SetBoundaryBoxSegmentation;
		%feature("autodoc", "	* /*! * \brief Sets number of segments per diagonal of boundary box of geometry by which * default segment length of appropriate 1D hypotheses is defined */

	:param theNbSegments:
	:type theNbSegments: int
	:rtype: None
") SetBoundaryBoxSegmentation;
		void SetBoundaryBoxSegmentation (int theNbSegments);
		%feature("compactdefaultargs") GetBoundaryBoxSegmentation;
		%feature("autodoc", "	:rtype: int
") GetBoundaryBoxSegmentation;
		int GetBoundaryBoxSegmentation ();
		%feature("compactdefaultargs") SetDefaultNbSegments;
		%feature("autodoc", "	* /*! * \brief Sets default number of segments per edge */

	:param nb:
	:type nb: int
	:rtype: None
") SetDefaultNbSegments;
		void SetDefaultNbSegments (int nb);
		%feature("compactdefaultargs") GetDefaultNbSegments;
		%feature("autodoc", "	:rtype: int
") GetDefaultNbSegments;
		int GetDefaultNbSegments ();
		%feature("compactdefaultargs") GetAlgoState;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param theErrors:
	:type theErrors: std::list< SMESH_Gen::TAlgoStateError> &
	:rtype: bool
") GetAlgoState;
		bool GetAlgoState (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,std::list< SMESH_Gen::TAlgoStateError> & theErrors);
		%feature("compactdefaultargs") GetStudyContext;
		%feature("autodoc", "	:param studyId:
	:type studyId: int
	:rtype: StudyContextStruct *
") GetStudyContext;
		StudyContextStruct * GetStudyContext (int studyId);
		%feature("compactdefaultargs") GetShapeDim;
		%feature("autodoc", "	:param aShapeType:
	:type aShapeType: TopAbs_ShapeEnum &
	:rtype: int
") GetShapeDim;
		static int GetShapeDim (const TopAbs_ShapeEnum & aShapeType);
		%feature("compactdefaultargs") GetShapeDim;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: int
") GetShapeDim;
		static int GetShapeDim (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") GetAlgo;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param assignedTo: default value is 0
	:type assignedTo: TopoDS_Shape *
	:rtype: SMESH_Algo *
") GetAlgo;
		SMESH_Algo * GetAlgo (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,TopoDS_Shape * assignedTo = 0);
		%feature("compactdefaultargs") IsGlobalHypothesis;
		%feature("autodoc", "	:param theHyp:
	:type theHyp: SMESH_Hypothesis *
	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:rtype: bool
") IsGlobalHypothesis;
		static bool IsGlobalHypothesis (const SMESH_Hypothesis * theHyp,SMESH_Mesh & aMesh);
		%feature("compactdefaultargs") GetANewId;
		%feature("autodoc", "	:rtype: int
") GetANewId;
		int GetANewId ();
};


%extend SMESH_Gen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_Group;
class SMESH_Group {
	public:
		%feature("compactdefaultargs") SMESH_Group;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theType:
	:type theType: SMDSAbs_ElementType
	:param theName:
	:type theName: char *
	:param theShape: default value is TopoDS_Shape()
	:type theShape: TopoDS_Shape &
	:rtype: None
") SMESH_Group;
		 SMESH_Group (int theID,const SMESH_Mesh * theMesh,const SMDSAbs_ElementType theType,const char * theName,const TopoDS_Shape & theShape = TopoDS_Shape());
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theName:
	:type theName: char *
	:rtype: None
") SetName;
		void SetName (const char * theName);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: char *
") GetName;
		const char * GetName ();
		%feature("compactdefaultargs") GetGroupDS;
		%feature("autodoc", "	:rtype: SMESHDS_GroupBase *
") GetGroupDS;
		SMESHDS_GroupBase * GetGroupDS ();
};


%extend SMESH_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_Hypothesis;
class SMESH_Hypothesis : public SMESHDS_Hypothesis {
	public:
/* public enums */
enum Hypothesis_Status {
	HYP_OK = 0,
	HYP_MISSING = 1,
	HYP_CONCURENT = 2,
	HYP_BAD_PARAMETER = 3,
	HYP_HIDDEN_ALGO = 4,
	HYP_HIDING_ALGO = 5,
	HYP_UNKNOWN_FATAL = 6,
	HYP_INCOMPATIBLE = 7,
	HYP_NOTCONFORM = 8,
	HYP_ALREADY_EXIST = 9,
	HYP_BAD_DIM = 10,
	HYP_BAD_SUBSHAPE = 11,
	HYP_BAD_GEOMETRY = 12,
	HYP_NEED_SHAPE = 13,
};

/* end public enums declaration */

		%feature("compactdefaultargs") GetDim;
		%feature("autodoc", "	:rtype: int
") GetDim;
		int GetDim ();
		%feature("compactdefaultargs") GetStudyId;
		%feature("autodoc", "	:rtype: int
") GetStudyId;
		int GetStudyId ();
		%feature("compactdefaultargs") NotifySubMeshesHypothesisModification;
		%feature("autodoc", "	:rtype: None
") NotifySubMeshesHypothesisModification;
		void NotifySubMeshesHypothesisModification ();
		%feature("compactdefaultargs") GetShapeType;
		%feature("autodoc", "	:rtype: int
") GetShapeType;
		int GetShapeType ();
		%feature("compactdefaultargs") GetLibName;
		%feature("autodoc", "	:rtype: char *
") GetLibName;
		const char * GetLibName ();
		%feature("compactdefaultargs") SetLibName;
		%feature("autodoc", "	:param theLibName:
	:type theLibName: char *
	:rtype: None
") SetLibName;
		void SetLibName (const char * theLibName);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param theParameters:
	:type theParameters: char *
	:rtype: None
") SetParameters;
		void SetParameters (const char * theParameters);
		%feature("compactdefaultargs") GetParameters;
		%feature("autodoc", "	:rtype: char *
") GetParameters;
		char * GetParameters ();
		%feature("compactdefaultargs") SetLastParameters;
		%feature("autodoc", "	:param theParameters:
	:type theParameters: char *
	:rtype: None
") SetLastParameters;
		void SetLastParameters (const char * theParameters);
		%feature("compactdefaultargs") GetLastParameters;
		%feature("autodoc", "	:rtype: char *
") GetLastParameters;
		char * GetLastParameters ();
		%feature("compactdefaultargs") ClearParameters;
		%feature("autodoc", "	:rtype: None
") ClearParameters;
		void ClearParameters ();
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") SetParametersByMesh;
		bool SetParametersByMesh (const SMESH_Mesh * theMesh,const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetParametersByDefaults;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by default parameters. * etval bool - true if parameter values have been successfully defined */

	:param dflts:
	:type dflts: SMESH_0D_Algo::TDefaults &
	:param theMesh: default value is 0
	:type theMesh: SMESH_Mesh *
	:rtype: bool
") SetParametersByDefaults;
		bool SetParametersByDefaults (const SMESH_0D_Algo::TDefaults & dflts,const SMESH_Mesh * theMesh = 0);
		%feature("compactdefaultargs") IsAuxiliary;
		%feature("autodoc", "	* /*! * \brief Return true if me is an auxiliary hypothesis * etval bool - auxiliary or not * * An auxiliary hypothesis is optional, i.e. an algorithm * can work without it and another hypothesis of the same * dimention can be assigned to the shape */

	:rtype: bool
") IsAuxiliary;
		bool IsAuxiliary ();
};


%extend SMESH_Hypothesis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_Mesh;
class SMESH_Mesh {
	public:
typedef TopTools_IndexedDataMapOfShapeListOfShape TAncestorMap;
typedef boost::shared_ptr<SMDS_Iterator <SMESH_Group *>> GroupIteratorPtr;
		%feature("compactdefaultargs") SMESH_Mesh;
		%feature("autodoc", "	:param theLocalId:
	:type theLocalId: int
	:param theStudyId:
	:type theStudyId: int
	:param theGen:
	:type theGen: SMESH_Gen *
	:param theIsEmbeddedMode:
	:type theIsEmbeddedMode: bool
	:param theDocument:
	:type theDocument: SMESHDS_Document *
	:rtype: None
") SMESH_Mesh;
		 SMESH_Mesh (int theLocalId,int theStudyId,SMESH_Gen * theGen,bool theIsEmbeddedMode,SMESHDS_Document * theDocument);
		%feature("compactdefaultargs") ShapeToMesh;
		%feature("autodoc", "	* /*! * \brief Set geometry to be meshed */

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") ShapeToMesh;
		void ShapeToMesh (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") GetShapeToMesh;
		%feature("autodoc", "	* /*! * \brief Return geometry to be meshed. (It may be a PseudoShape()!) */

	:rtype: TopoDS_Shape
") GetShapeToMesh;
		TopoDS_Shape GetShapeToMesh ();
		%feature("compactdefaultargs") HasShapeToMesh;
		%feature("autodoc", "	* /*! * \brief Return true if there is a geometry to be meshed, not PseudoShape() */

	:rtype: bool
") HasShapeToMesh;
		bool HasShapeToMesh ();
		%feature("compactdefaultargs") GetShapeDiagonalSize;
		%feature("autodoc", "	* /*! * \brief Return diagonal size of bounding box of shape to mesh. */

	:rtype: double
") GetShapeDiagonalSize;
		double GetShapeDiagonalSize ();
		%feature("compactdefaultargs") GetShapeDiagonalSize;
		%feature("autodoc", "	* /*! * \brief Return diagonal size of bounding box of a shape. */

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: double
") GetShapeDiagonalSize;
		static double GetShapeDiagonalSize (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") PseudoShape;
		%feature("autodoc", "	* /*! * \brief Return a solid which is returned by GetShapeToMesh() if * a real geometry to be meshed was not set */

	:rtype: TopoDS_Solid
") PseudoShape;
		static const TopoDS_Solid  PseudoShape ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* /*! * \brief Remove all nodes and elements */

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ClearSubMesh;
		%feature("autodoc", "	* /*! * \brief Remove all nodes and elements of indicated shape */

	:param theShapeId:
	:type theShapeId: int
	:rtype: None
") ClearSubMesh;
		void ClearSubMesh (const int theShapeId);
		%feature("compactdefaultargs") UNVToMesh;
		%feature("autodoc", "	:param theFileName:
	:type theFileName: char *
	:rtype: int
") UNVToMesh;
		int UNVToMesh (const char * theFileName);
		%feature("compactdefaultargs") MEDToMesh;
		%feature("autodoc", "	* /*! * consult DriverMED_R_SMESHDS_Mesh::ReadStatus for returned value */

	:param theFileName:
	:type theFileName: char *
	:param theMeshName:
	:type theMeshName: char *
	:rtype: int
") MEDToMesh;
		int MEDToMesh (const char * theFileName,const char * theMeshName);
		%feature("compactdefaultargs") STLToMesh;
		%feature("autodoc", "	:param theFileName:
	:type theFileName: char *
	:rtype: int
") STLToMesh;
		int STLToMesh (const char * theFileName);
		%feature("compactdefaultargs") DATToMesh;
		%feature("autodoc", "	:param theFileName:
	:type theFileName: char *
	:rtype: int
") DATToMesh;
		int DATToMesh (const char * theFileName);
		%feature("compactdefaultargs") AddHypothesis;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:param anHypId:
	:type anHypId: int
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") AddHypothesis;
		SMESH_Hypothesis::Hypothesis_Status AddHypothesis (const TopoDS_Shape & aSubShape,int anHypId);
		%feature("compactdefaultargs") RemoveHypothesis;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:param anHypId:
	:type anHypId: int
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") RemoveHypothesis;
		SMESH_Hypothesis::Hypothesis_Status RemoveHypothesis (const TopoDS_Shape & aSubShape,int anHypId);
		%feature("compactdefaultargs") GetHypothesisList;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: std::list< SMESHDS_Hypothesis *>
") GetHypothesisList;
		const std::list<const SMESHDS_Hypothesis *> & GetHypothesisList (const TopoDS_Shape & aSubShape);
		%feature("compactdefaultargs") GetHypothesis;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:param aFilter:
	:type aFilter: SMESH_HypoFilter &
	:param andAncestors:
	:type andAncestors: bool
	:param assignedTo: default value is 0
	:type assignedTo: TopoDS_Shape *
	:rtype: SMESH_Hypothesis *
") GetHypothesis;
		const SMESH_Hypothesis * GetHypothesis (const TopoDS_Shape & aSubShape,const SMESH_HypoFilter & aFilter,const bool andAncestors,TopoDS_Shape * assignedTo = 0);
		%feature("compactdefaultargs") GetHypotheses;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:param aFilter:
	:type aFilter: SMESH_HypoFilter &
	:param aHypList:
	:type aHypList: std::list< SMESHDS_Hypothesis *> &
	:param andAncestors:
	:type andAncestors: bool
	:rtype: int
") GetHypotheses;
		int GetHypotheses (const TopoDS_Shape & aSubShape,const SMESH_HypoFilter & aFilter,std::list<const SMESHDS_Hypothesis *> & aHypList,const bool andAncestors);
		%feature("compactdefaultargs") GetLog;
		%feature("autodoc", "	:rtype: std::list<SMESHDS_Command *>
") GetLog;
		const std::list<SMESHDS_Command *> & GetLog ();
		%feature("compactdefaultargs") ClearLog;
		%feature("autodoc", "	:rtype: None
") ClearLog;
		void ClearLog ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	:rtype: int
") GetId;
		int GetId ();
		%feature("compactdefaultargs") GetMeshDS;
		%feature("autodoc", "	:rtype: SMESHDS_Mesh *
") GetMeshDS;
		SMESHDS_Mesh * GetMeshDS ();
		%feature("compactdefaultargs") GetGen;
		%feature("autodoc", "	:rtype: SMESH_Gen *
") GetGen;
		SMESH_Gen * GetGen ();
		%feature("compactdefaultargs") GetSubMesh;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: SMESH_subMesh *
") GetSubMesh;
		SMESH_subMesh * GetSubMesh (const TopoDS_Shape & aSubShape);
		%feature("compactdefaultargs") GetSubMeshContaining;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: SMESH_subMesh *
") GetSubMeshContaining;
		SMESH_subMesh * GetSubMeshContaining (const TopoDS_Shape & aSubShape);
		%feature("compactdefaultargs") GetSubMeshContaining;
		%feature("autodoc", "	:param aShapeID:
	:type aShapeID: int
	:rtype: SMESH_subMesh *
") GetSubMeshContaining;
		SMESH_subMesh * GetSubMeshContaining (const int aShapeID);
		%feature("compactdefaultargs") GetGroupSubMeshesContaining;
		%feature("autodoc", "	* /*! * \brief Return submeshes of groups containing the given subshape */

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: std::list<SMESH_subMesh *>
") GetGroupSubMeshesContaining;
		std::list<SMESH_subMesh *> GetGroupSubMeshesContaining (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") NotifySubMeshesHypothesisModification;
		%feature("autodoc", "	* /*! * \brief Say all submeshes that theChangedHyp has been modified */

	:param theChangedHyp:
	:type theChangedHyp: SMESH_Hypothesis *
	:rtype: None
") NotifySubMeshesHypothesisModification;
		void NotifySubMeshesHypothesisModification (const SMESH_Hypothesis * theChangedHyp);
		%feature("compactdefaultargs") GetSubMeshUsingHypothesis;
		%feature("autodoc", "	:param anHyp:
	:type anHyp: SMESHDS_Hypothesis *
	:rtype: std::list< SMESH_subMesh *>
") GetSubMeshUsingHypothesis;
		const std::list< SMESH_subMesh *> & GetSubMeshUsingHypothesis (SMESHDS_Hypothesis * anHyp);
		%feature("compactdefaultargs") IsUsedHypothesis;
		%feature("autodoc", "	* /*! * \brief Return True if anHyp is used to mesh aSubShape */

	:param anHyp:
	:type anHyp: SMESHDS_Hypothesis *
	:param aSubMesh:
	:type aSubMesh: SMESH_subMesh *
	:rtype: bool
") IsUsedHypothesis;
		bool IsUsedHypothesis (SMESHDS_Hypothesis * anHyp,const SMESH_subMesh * aSubMesh);
		%feature("compactdefaultargs") IsNotConformAllowed;
		%feature("autodoc", "	* /*! * \brief check if a hypothesis alowing notconform mesh is present */

	:rtype: bool
") IsNotConformAllowed;
		bool IsNotConformAllowed ();
		%feature("compactdefaultargs") IsMainShape;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsMainShape;
		bool IsMainShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") GetAncestors;
		%feature("autodoc", "	* /*! * \brief Return list of ancestors of theSubShape in the order * that lower dimention shapes come first */

	:param theSubShape:
	:type theSubShape: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GetAncestors;
		const TopTools_ListOfShape & GetAncestors (const TopoDS_Shape & theSubShape);
		%feature("compactdefaultargs") SetAutoColor;
		%feature("autodoc", "	:param theAutoColor:
	:type theAutoColor: bool
	:rtype: None
") SetAutoColor;
		void SetAutoColor (bool theAutoColor);
		%feature("compactdefaultargs") GetAutoColor;
		%feature("autodoc", "	:rtype: bool
") GetAutoColor;
		bool GetAutoColor ();
		%feature("compactdefaultargs") GetAncestorMap;
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") GetAncestorMap;
		const TopTools_IndexedDataMapOfShapeListOfShape & GetAncestorMap ();
		%feature("compactdefaultargs") HasDuplicatedGroupNamesMED;
		%feature("autodoc", "	* /*! * \brief Check group names for duplications. * Consider maximum group name length stored in MED file */

	:rtype: bool
") HasDuplicatedGroupNamesMED;
		bool HasDuplicatedGroupNamesMED ();
		%feature("compactdefaultargs") ExportMED;
		%feature("autodoc", "	:param file:
	:type file: char *
	:param theMeshName: default value is NULL
	:type theMeshName: char *
	:param theAutoGroups: default value is true
	:type theAutoGroups: bool
	:param theVersion: default value is 0
	:type theVersion: int
	:rtype: None
") ExportMED;
		void ExportMED (const char * file,const char * theMeshName = NULL,bool theAutoGroups = true,int theVersion = 0);
		%feature("compactdefaultargs") ExportDAT;
		%feature("autodoc", "	:param file:
	:type file: char *
	:rtype: None
") ExportDAT;
		void ExportDAT (const char * file);
		%feature("compactdefaultargs") ExportUNV;
		%feature("autodoc", "	:param file:
	:type file: char *
	:rtype: None
") ExportUNV;
		void ExportUNV (const char * file);
		%feature("compactdefaultargs") ExportSTL;
		%feature("autodoc", "	:param file:
	:type file: char *
	:param isascii:
	:type isascii: bool
	:rtype: None
") ExportSTL;
		void ExportSTL (const char * file,const bool isascii);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") Nb0DElements;
		%feature("autodoc", "	:rtype: int
") Nb0DElements;
		int Nb0DElements ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbEdges;
		int NbEdges (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbFaces;
		int NbFaces (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbTriangles;
		int NbTriangles (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbQuadrangles;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbQuadrangles;
		int NbQuadrangles (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbPolygons;
		%feature("autodoc", "	:rtype: int
") NbPolygons;
		int NbPolygons ();
		%feature("compactdefaultargs") NbVolumes;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbVolumes;
		int NbVolumes (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbTetras;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbTetras;
		int NbTetras (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbHexas;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbHexas;
		int NbHexas (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbPyramids;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbPyramids;
		int NbPyramids (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbPrisms;
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbPrisms;
		int NbPrisms (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("compactdefaultargs") NbPolyhedrons;
		%feature("autodoc", "	:rtype: int
") NbPolyhedrons;
		int NbPolyhedrons ();
		%feature("compactdefaultargs") NbSubMesh;
		%feature("autodoc", "	:rtype: int
") NbSubMesh;
		int NbSubMesh ();
		%feature("compactdefaultargs") NbGroup;
		%feature("autodoc", "	:rtype: int
") NbGroup;
		int NbGroup ();
		%feature("compactdefaultargs") AddGroup;
		%feature("autodoc", "	:param theType:
	:type theType: SMDSAbs_ElementType
	:param theName:
	:type theName: char *
	:param theId:
	:type theId: int &
	:param theShape: default value is TopoDS_Shape()
	:type theShape: TopoDS_Shape &
	:rtype: SMESH_Group *
") AddGroup;
		SMESH_Group * AddGroup (const SMDSAbs_ElementType theType,const char * theName,Standard_Integer &OutValue,const TopoDS_Shape & theShape = TopoDS_Shape());
		%feature("compactdefaultargs") GetGroupIds;
		%feature("autodoc", "	:rtype: std::list<int>
") GetGroupIds;
		std::list<int> GetGroupIds ();
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "	:param theGroupID:
	:type theGroupID: int
	:rtype: None
") RemoveGroup;
		void RemoveGroup (const int theGroupID);
		%feature("compactdefaultargs") ConvertToStandalone;
		%feature("autodoc", "	:param theGroupID:
	:type theGroupID: int
	:rtype: SMESH_Group *
") ConvertToStandalone;
		SMESH_Group * ConvertToStandalone (int theGroupID);
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "	:param id:
	:type id: int
	:param iselem:
	:type iselem: bool
	:rtype: SMDSAbs_ElementType
") GetElementType;
		SMDSAbs_ElementType GetElementType (const int id,const bool iselem);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param save:
	:type save: ostream &
	:rtype: ostream
") Dump;
		ostream & Dump (ostream & save);
};


%extend SMESH_Mesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_MeshEditor;
class SMESH_MeshEditor {
	public:
typedef std::auto_ptr<std::list <int>> PGroupIDs;
typedef std::list<std::list<const SMDS_MeshNode *>> TListOfListOfNodes;
typedef std::list<std::list<int>> TListOfListOfElementsID;
/* public enums */
enum SmoothMethod {
	LAPLACIAN = 0,
	CENTROIDAL = 1,
};

enum ExtrusionFlags {
	EXTRUSION_FLAG_BOUNDARY = 1,
	EXTRUSION_FLAG_SEW = 2,
};

enum Extrusion_Error {
	EXTR_OK = 0,
	EXTR_NO_ELEMENTS = 1,
	EXTR_PATH_NOT_EDGE = 2,
	EXTR_BAD_PATH_SHAPE = 3,
	EXTR_BAD_STARTING_NODE = 4,
	EXTR_BAD_ANGLES_NUMBER = 5,
	EXTR_CANT_GET_TANGENT = 6,
};

enum Sew_Error {
	SEW_OK = 0,
	SEW_BORDER1_NOT_FOUND = 1,
	SEW_BORDER2_NOT_FOUND = 2,
	SEW_BOTH_BORDERS_NOT_FOUND = 3,
	SEW_BAD_SIDE_NODES = 4,
	SEW_VOLUMES_TO_SPLIT = 5,
	SEW_DIFF_NB_OF_ELEMENTS = 6,
	SEW_TOPO_DIFF_SETS_OF_ELEMENTS = 7,
	SEW_BAD_SIDE1_NODES = 8,
	SEW_BAD_SIDE2_NODES = 9,
	SEW_INTERNAL_ERROR = 10,
};

/* end public enums declaration */

		%feature("compactdefaultargs") SMESH_MeshEditor;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:rtype: None
") SMESH_MeshEditor;
		 SMESH_MeshEditor (SMESH_Mesh * theMesh);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* /*! * \brief Add element */

	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *> &
	:param type:
	:type type: SMDSAbs_ElementType
	:param isPoly:
	:type isPoly: bool
	:param ID: default value is 0
	:type ID: int
	:rtype: SMDS_MeshElement *
") AddElement;
		SMDS_MeshElement * AddElement (const std::vector<const SMDS_MeshNode *> & nodes,const SMDSAbs_ElementType type,const bool isPoly,const int ID = 0);
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	* /*! * \brief Add element */

	:param nodeIDs:
	:type nodeIDs: std::vector<int> &
	:param type:
	:type type: SMDSAbs_ElementType
	:param isPoly:
	:type isPoly: bool
	:param ID: default value is 0
	:type ID: int
	:rtype: SMDS_MeshElement *
") AddElement;
		SMDS_MeshElement * AddElement (const std::vector<int> & nodeIDs,const SMDSAbs_ElementType type,const bool isPoly,const int ID = 0);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param theElemIDs:
	:type theElemIDs: std::list< int> &
	:param isNodes:
	:type isNodes: bool
	:rtype: bool
") Remove;
		bool Remove (const std::list< int> & theElemIDs,const bool isNodes);
		%feature("compactdefaultargs") InverseDiag;
		%feature("autodoc", "	:param theTria1:
	:type theTria1: SMDS_MeshElement *
	:param theTria2:
	:type theTria2: SMDS_MeshElement *
	:rtype: bool
") InverseDiag;
		bool InverseDiag (const SMDS_MeshElement * theTria1,const SMDS_MeshElement * theTria2);
		%feature("compactdefaultargs") InverseDiag;
		%feature("autodoc", "	:param theNode1:
	:type theNode1: SMDS_MeshNode *
	:param theNode2:
	:type theNode2: SMDS_MeshNode *
	:rtype: bool
") InverseDiag;
		bool InverseDiag (const SMDS_MeshNode * theNode1,const SMDS_MeshNode * theNode2);
		%feature("compactdefaultargs") DeleteDiag;
		%feature("autodoc", "	:param theNode1:
	:type theNode1: SMDS_MeshNode *
	:param theNode2:
	:type theNode2: SMDS_MeshNode *
	:rtype: bool
") DeleteDiag;
		bool DeleteDiag (const SMDS_MeshNode * theNode1,const SMDS_MeshNode * theNode2);
		%feature("compactdefaultargs") Reorient;
		%feature("autodoc", "	:param theElement:
	:type theElement: SMDS_MeshElement *
	:rtype: bool
") Reorient;
		bool Reorient (const SMDS_MeshElement * theElement);
		%feature("compactdefaultargs") TriToQuad;
		%feature("autodoc", "	* /*! * \brief Fuse neighbour triangles into quadrangles. * \param theElems - The triangles to be fused. * \param theCriterion - Is used to choose a neighbour to fuse with. * \param theMaxAngle - Is a max angle between element normals at which fusion *  is still performed; theMaxAngle is mesured in radians. * etval bool - Success or not. */

	:param theElems:
	:type theElems: TIDSortedElemSet &
	:param theCriterion:
	:type theCriterion: SMESH::Controls::NumericalFunctorPtr
	:param theMaxAngle:
	:type theMaxAngle: double
	:rtype: bool
") TriToQuad;
		bool TriToQuad (TIDSortedElemSet & theElems,SMESH::Controls::NumericalFunctorPtr theCriterion,const double theMaxAngle);
		%feature("compactdefaultargs") QuadToTri;
		%feature("autodoc", "	* /*! * \brief Split quadrangles into triangles. * \param theElems - The faces to be splitted. * \param theCriterion - Is used to choose a diagonal for splitting. * etval bool - Success or not. */

	:param theElems:
	:type theElems: TIDSortedElemSet &
	:param theCriterion:
	:type theCriterion: SMESH::Controls::NumericalFunctorPtr
	:rtype: bool
") QuadToTri;
		bool QuadToTri (TIDSortedElemSet & theElems,SMESH::Controls::NumericalFunctorPtr theCriterion);
		%feature("compactdefaultargs") QuadToTri;
		%feature("autodoc", "	* /*! * \brief Split quadrangles into triangles. * \param theElems - The faces to be splitted. * \param the13Diag - Is used to choose a diagonal for splitting. * etval bool - Success or not. */

	:param theElems:
	:type theElems: TIDSortedElemSet &
	:param the13Diag:
	:type the13Diag: bool
	:rtype: bool
") QuadToTri;
		bool QuadToTri (TIDSortedElemSet & theElems,const bool the13Diag);
		%feature("compactdefaultargs") BestSplit;
		%feature("autodoc", "	* /*! * \brief Find better diagonal for splitting. * \param theQuad - The face to find better splitting of. * \param theCriterion - Is used to choose a diagonal for splitting. * etval int - 1 for 1-3 diagonal, 2 for 2-4, -1 - for errors. */

	:param theQuad:
	:type theQuad: SMDS_MeshElement *
	:param theCriterion:
	:type theCriterion: SMESH::Controls::NumericalFunctorPtr
	:rtype: int
") BestSplit;
		int BestSplit (const SMDS_MeshElement * theQuad,SMESH::Controls::NumericalFunctorPtr theCriterion);
		%feature("compactdefaultargs") Smooth;
		%feature("autodoc", "	:param theElements:
	:type theElements: TIDSortedElemSet &
	:param theFixedNodes:
	:type theFixedNodes: std::set< SMDS_MeshNode *> &
	:param theSmoothMethod:
	:type theSmoothMethod: SmoothMethod
	:param theNbIterations:
	:type theNbIterations: int
	:param theTgtAspectRatio: default value is 1.0
	:type theTgtAspectRatio: double
	:param the2D: default value is true
	:type the2D: bool
	:rtype: None
") Smooth;
		void Smooth (TIDSortedElemSet & theElements,std::set<const SMDS_MeshNode *> & theFixedNodes,const SmoothMethod theSmoothMethod,const int theNbIterations,double theTgtAspectRatio = 1.0,const bool the2D = true);
		%feature("compactdefaultargs") CreateNode;
		%feature("autodoc", "	* /*! * Create new node in the mesh with given coordinates * (auxilary for advanced extrusion) */

	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:param tolnode:
	:type tolnode: double
	:param aNodes:
	:type aNodes: SMESH_SequenceOfNode &
	:rtype: SMDS_MeshNode *
") CreateNode;
		const SMDS_MeshNode * CreateNode (const double x,const double y,const double z,const double tolnode,SMESH_SequenceOfNode & aNodes);
		%feature("compactdefaultargs") ExtrusionAlongTrack;
		%feature("autodoc", "	:param theElements:
	:type theElements: TIDSortedElemSet &
	:param theTrackPattern:
	:type theTrackPattern: SMESH_subMesh *
	:param theNodeStart:
	:type theNodeStart: SMDS_MeshNode *
	:param theHasAngles:
	:type theHasAngles: bool
	:param theAngles:
	:type theAngles: std::list<double> &
	:param theLinearVariation:
	:type theLinearVariation: bool
	:param theHasRefPoint:
	:type theHasRefPoint: bool
	:param theRefPoint:
	:type theRefPoint: gp_Pnt
	:param theMakeGroups:
	:type theMakeGroups: bool
	:rtype: Extrusion_Error
") ExtrusionAlongTrack;
		Extrusion_Error ExtrusionAlongTrack (TIDSortedElemSet & theElements,SMESH_subMesh * theTrackPattern,const SMDS_MeshNode * theNodeStart,const bool theHasAngles,std::list<double> & theAngles,const bool theLinearVariation,const bool theHasRefPoint,const gp_Pnt & theRefPoint,const bool theMakeGroups);
		%feature("compactdefaultargs") ExtrusionAlongTrack;
		%feature("autodoc", "	:param theElements:
	:type theElements: TIDSortedElemSet &
	:param theTrackPattern:
	:type theTrackPattern: SMESH_Mesh *
	:param theNodeStart:
	:type theNodeStart: SMDS_MeshNode *
	:param theHasAngles:
	:type theHasAngles: bool
	:param theAngles:
	:type theAngles: std::list<double> &
	:param theLinearVariation:
	:type theLinearVariation: bool
	:param theHasRefPoint:
	:type theHasRefPoint: bool
	:param theRefPoint:
	:type theRefPoint: gp_Pnt
	:param theMakeGroups:
	:type theMakeGroups: bool
	:rtype: Extrusion_Error
") ExtrusionAlongTrack;
		Extrusion_Error ExtrusionAlongTrack (TIDSortedElemSet & theElements,SMESH_Mesh * theTrackPattern,const SMDS_MeshNode * theNodeStart,const bool theHasAngles,std::list<double> & theAngles,const bool theLinearVariation,const bool theHasRefPoint,const gp_Pnt & theRefPoint,const bool theMakeGroups);
		%feature("compactdefaultargs") FindCoincidentNodes;
		%feature("autodoc", "	:param theNodes:
	:type theNodes: std::set< SMDS_MeshNode *> &
	:param theTolerance:
	:type theTolerance: double
	:param theGroupsOfNodes:
	:type theGroupsOfNodes: TListOfListOfNodes &
	:rtype: None
") FindCoincidentNodes;
		void FindCoincidentNodes (std::set<const SMDS_MeshNode *> & theNodes,const double theTolerance,TListOfListOfNodes & theGroupsOfNodes);
		%feature("compactdefaultargs") GetNodeSearcher;
		%feature("autodoc", "	* /*! * \brief Return SMESH_NodeSearcher */

	:rtype: SMESH_NodeSearcher *
") GetNodeSearcher;
		SMESH_NodeSearcher * GetNodeSearcher ();
		%feature("compactdefaultargs") GetElementSearcher;
		%feature("autodoc", "	* /*! * \brief Return SMESH_ElementSearcher */

	:rtype: SMESH_ElementSearcher *
") GetElementSearcher;
		SMESH_ElementSearcher * GetElementSearcher ();
		%feature("compactdefaultargs") isOut;
		%feature("autodoc", "	* /*! * \brief Return true if the point is IN or ON of the element */

	:param element:
	:type element: SMDS_MeshElement *
	:param point:
	:type point: gp_Pnt
	:param tol:
	:type tol: double
	:rtype: bool
") isOut;
		static bool isOut (const SMDS_MeshElement * element,const gp_Pnt & point,double tol);
		%feature("compactdefaultargs") SimplifyFace;
		%feature("autodoc", "	:param faceNodes:
	:type faceNodes: std::vector< SMDS_MeshNode *>
	:param poly_nodes:
	:type poly_nodes: std::vector< SMDS_MeshNode *> &
	:param quantities:
	:type quantities: std::vector<int> &
	:rtype: int
") SimplifyFace;
		int SimplifyFace (const std::vector<const SMDS_MeshNode *> faceNodes,std::vector<const SMDS_MeshNode *> & poly_nodes,std::vector<int> & quantities);
		%feature("compactdefaultargs") MergeNodes;
		%feature("autodoc", "	:param theNodeGroups:
	:type theNodeGroups: TListOfListOfNodes &
	:rtype: None
") MergeNodes;
		void MergeNodes (TListOfListOfNodes & theNodeGroups);
		%feature("compactdefaultargs") FindEqualElements;
		%feature("autodoc", "	:param theElements:
	:type theElements: std::set< SMDS_MeshElement *> &
	:param theGroupsOfElementsID:
	:type theGroupsOfElementsID: TListOfListOfElementsID &
	:rtype: None
") FindEqualElements;
		void FindEqualElements (std::set<const SMDS_MeshElement *> & theElements,TListOfListOfElementsID & theGroupsOfElementsID);
		%feature("compactdefaultargs") MergeElements;
		%feature("autodoc", "	:param theGroupsOfElementsID:
	:type theGroupsOfElementsID: TListOfListOfElementsID &
	:rtype: None
") MergeElements;
		void MergeElements (TListOfListOfElementsID & theGroupsOfElementsID);
		%feature("compactdefaultargs") MergeEqualElements;
		%feature("autodoc", "	:rtype: None
") MergeEqualElements;
		void MergeEqualElements ();
		%feature("compactdefaultargs") CheckFreeBorderNodes;
		%feature("autodoc", "	:param theNode1:
	:type theNode1: SMDS_MeshNode *
	:param theNode2:
	:type theNode2: SMDS_MeshNode *
	:param theNode3: default value is 0
	:type theNode3: SMDS_MeshNode *
	:rtype: bool
") CheckFreeBorderNodes;
		static bool CheckFreeBorderNodes (const SMDS_MeshNode * theNode1,const SMDS_MeshNode * theNode2,const SMDS_MeshNode * theNode3 = 0);
		%feature("compactdefaultargs") FindFreeBorder;
		%feature("autodoc", "	:param theFirstNode:
	:type theFirstNode: SMDS_MeshNode *
	:param theSecondNode:
	:type theSecondNode: SMDS_MeshNode *
	:param theLastNode:
	:type theLastNode: SMDS_MeshNode *
	:param theNodes:
	:type theNodes: std::list<  SMDS_MeshNode *> &
	:param theFaces:
	:type theFaces: std::list<  SMDS_MeshElement *> &
	:rtype: bool
") FindFreeBorder;
		static bool FindFreeBorder (const SMDS_MeshNode * theFirstNode,const SMDS_MeshNode * theSecondNode,const SMDS_MeshNode * theLastNode,std::list< const SMDS_MeshNode *> & theNodes,std::list< const SMDS_MeshElement *> & theFaces);
		%feature("compactdefaultargs") SewFreeBorder;
		%feature("autodoc", "	:param theBorderFirstNode:
	:type theBorderFirstNode: SMDS_MeshNode *
	:param theBorderSecondNode:
	:type theBorderSecondNode: SMDS_MeshNode *
	:param theBorderLastNode:
	:type theBorderLastNode: SMDS_MeshNode *
	:param theSide2FirstNode:
	:type theSide2FirstNode: SMDS_MeshNode *
	:param theSide2SecondNode:
	:type theSide2SecondNode: SMDS_MeshNode *
	:param theSide2ThirdNode: default value is 0
	:type theSide2ThirdNode: SMDS_MeshNode *
	:param theSide2IsFreeBorder: default value is true
	:type theSide2IsFreeBorder: bool
	:param toCreatePolygons: default value is false
	:type toCreatePolygons: bool
	:param toCreatePolyedrs: default value is false
	:type toCreatePolyedrs: bool
	:rtype: Sew_Error
") SewFreeBorder;
		Sew_Error SewFreeBorder (const SMDS_MeshNode * theBorderFirstNode,const SMDS_MeshNode * theBorderSecondNode,const SMDS_MeshNode * theBorderLastNode,const SMDS_MeshNode * theSide2FirstNode,const SMDS_MeshNode * theSide2SecondNode,const SMDS_MeshNode * theSide2ThirdNode = 0,const bool theSide2IsFreeBorder = true,const bool toCreatePolygons = false,const bool toCreatePolyedrs = false);
		%feature("compactdefaultargs") SewSideElements;
		%feature("autodoc", "	:param theSide1:
	:type theSide1: TIDSortedElemSet &
	:param theSide2:
	:type theSide2: TIDSortedElemSet &
	:param theFirstNode1ToMerge:
	:type theFirstNode1ToMerge: SMDS_MeshNode *
	:param theFirstNode2ToMerge:
	:type theFirstNode2ToMerge: SMDS_MeshNode *
	:param theSecondNode1ToMerge:
	:type theSecondNode1ToMerge: SMDS_MeshNode *
	:param theSecondNode2ToMerge:
	:type theSecondNode2ToMerge: SMDS_MeshNode *
	:rtype: Sew_Error
") SewSideElements;
		Sew_Error SewSideElements (TIDSortedElemSet & theSide1,TIDSortedElemSet & theSide2,const SMDS_MeshNode * theFirstNode1ToMerge,const SMDS_MeshNode * theFirstNode2ToMerge,const SMDS_MeshNode * theSecondNode1ToMerge,const SMDS_MeshNode * theSecondNode2ToMerge);
		%feature("compactdefaultargs") InsertNodesIntoLink;
		%feature("autodoc", "	:param theFace:
	:type theFace: SMDS_MeshElement *
	:param theBetweenNode1:
	:type theBetweenNode1: SMDS_MeshNode *
	:param theBetweenNode2:
	:type theBetweenNode2: SMDS_MeshNode *
	:param theNodesToInsert:
	:type theNodesToInsert: std::list< SMDS_MeshNode *> &
	:param toCreatePoly: default value is false
	:type toCreatePoly: bool
	:rtype: None
") InsertNodesIntoLink;
		void InsertNodesIntoLink (const SMDS_MeshElement * theFace,const SMDS_MeshNode * theBetweenNode1,const SMDS_MeshNode * theBetweenNode2,std::list<const SMDS_MeshNode *> & theNodesToInsert,const bool toCreatePoly = false);
		%feature("compactdefaultargs") UpdateVolumes;
		%feature("autodoc", "	:param theBetweenNode1:
	:type theBetweenNode1: SMDS_MeshNode *
	:param theBetweenNode2:
	:type theBetweenNode2: SMDS_MeshNode *
	:param theNodesToInsert:
	:type theNodesToInsert: std::list< SMDS_MeshNode *> &
	:rtype: None
") UpdateVolumes;
		void UpdateVolumes (const SMDS_MeshNode * theBetweenNode1,const SMDS_MeshNode * theBetweenNode2,std::list<const SMDS_MeshNode *> & theNodesToInsert);
		%feature("compactdefaultargs") ConvertToQuadratic;
		%feature("autodoc", "	:param theForce3d:
	:type theForce3d: bool
	:rtype: None
") ConvertToQuadratic;
		void ConvertToQuadratic (const bool theForce3d);
		%feature("compactdefaultargs") ConvertFromQuadratic;
		%feature("autodoc", "	:rtype: bool
") ConvertFromQuadratic;
		bool ConvertFromQuadratic ();
		%feature("compactdefaultargs") AddToSameGroups;
		%feature("autodoc", "	:param elemToAdd:
	:type elemToAdd: SMDS_MeshElement *
	:param elemInGroups:
	:type elemInGroups: SMDS_MeshElement *
	:param aMesh:
	:type aMesh: SMESHDS_Mesh *
	:rtype: void
") AddToSameGroups;
		static void AddToSameGroups (const SMDS_MeshElement * elemToAdd,const SMDS_MeshElement * elemInGroups,SMESHDS_Mesh * aMesh);
		%feature("compactdefaultargs") RemoveElemFromGroups;
		%feature("autodoc", "	:param element:
	:type element: SMDS_MeshElement *
	:param aMesh:
	:type aMesh: SMESHDS_Mesh *
	:rtype: void
") RemoveElemFromGroups;
		static void RemoveElemFromGroups (const SMDS_MeshElement * element,SMESHDS_Mesh * aMesh);
		%feature("compactdefaultargs") ReplaceElemInGroups;
		%feature("autodoc", "	:param elemToRm:
	:type elemToRm: SMDS_MeshElement *
	:param elemToAdd:
	:type elemToAdd: SMDS_MeshElement *
	:param aMesh:
	:type aMesh: SMESHDS_Mesh *
	:rtype: void
") ReplaceElemInGroups;
		static void ReplaceElemInGroups (const SMDS_MeshElement * elemToRm,const SMDS_MeshElement * elemToAdd,SMESHDS_Mesh * aMesh);
		%feature("compactdefaultargs") GetLinkedNodes;
		%feature("autodoc", "	* /*! * \brief Return nodes linked to the given one in elements of the type */

	:param node:
	:type node: SMDS_MeshNode *
	:param linkedNodes:
	:type linkedNodes: TIDSortedElemSet &
	:param type: default value is SMDSAbs_All
	:type type: SMDSAbs_ElementType
	:rtype: void
") GetLinkedNodes;
		static void GetLinkedNodes (const SMDS_MeshNode * node,TIDSortedElemSet & linkedNodes,SMDSAbs_ElementType type = SMDSAbs_All);
		%feature("compactdefaultargs") FindFaceInSet;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param elemSet:
	:type elemSet: TIDSortedElemSet &
	:param avoidSet:
	:type avoidSet: TIDSortedElemSet &
	:rtype: SMDS_MeshElement *
") FindFaceInSet;
		static const SMDS_MeshElement * FindFaceInSet (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const TIDSortedElemSet & elemSet,const TIDSortedElemSet & avoidSet);
		%feature("compactdefaultargs") FindMatchingNodes;
		%feature("autodoc", "	* /*! * \brief Find corresponding nodes in two sets of faces * \param theSide1 - first face set * \param theSide2 - second first face * \param theFirstNode1 - a boundary node of set 1 * \param theFirstNode2 - a node of set 2 corresponding to theFirstNode1 * \param theSecondNode1 - a boundary node of set 1 linked with theFirstNode1 * \param theSecondNode2 - a node of set 2 corresponding to theSecondNode1 * \param nReplaceMap - output map of corresponding nodes * etval Sew_Error - is a success or not */

	:param theSide1:
	:type theSide1: std::set< SMDS_MeshElement *> &
	:param theSide2:
	:type theSide2: std::set< SMDS_MeshElement *> &
	:param theFirstNode1:
	:type theFirstNode1: SMDS_MeshNode *
	:param theFirstNode2:
	:type theFirstNode2: SMDS_MeshNode *
	:param theSecondNode1:
	:type theSecondNode1: SMDS_MeshNode *
	:param theSecondNode2:
	:type theSecondNode2: SMDS_MeshNode *
	:param nReplaceMap:
	:type nReplaceMap: TNodeNodeMap &
	:rtype: Sew_Error
") FindMatchingNodes;
		static Sew_Error FindMatchingNodes (std::set<const SMDS_MeshElement *> & theSide1,std::set<const SMDS_MeshElement *> & theSide2,const SMDS_MeshNode * theFirstNode1,const SMDS_MeshNode * theFirstNode2,const SMDS_MeshNode * theSecondNode1,const SMDS_MeshNode * theSecondNode2,TNodeNodeMap & nReplaceMap);
		%feature("compactdefaultargs") IsMedium;
		%feature("autodoc", "	* /*! * \brief Returns true if given node is medium * \param n - node to check * \param typeToCheck - type of elements containing the node to ask about node status * etval bool - check result */

	:param node:
	:type node: SMDS_MeshNode *
	:param typeToCheck: default value is SMDSAbs_All
	:type typeToCheck: SMDSAbs_ElementType
	:rtype: bool
") IsMedium;
		static bool IsMedium (const SMDS_MeshNode * node,const SMDSAbs_ElementType typeToCheck = SMDSAbs_All);
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "	:param theElem:
	:type theElem: SMDS_MeshElement *
	:rtype: int
") FindShape;
		int FindShape (const SMDS_MeshElement * theElem);
		%feature("compactdefaultargs") GetMesh;
		%feature("autodoc", "	:rtype: SMESH_Mesh *
") GetMesh;
		SMESH_Mesh * GetMesh ();
		%feature("compactdefaultargs") GetMeshDS;
		%feature("autodoc", "	:rtype: SMESHDS_Mesh *
") GetMeshDS;
		SMESHDS_Mesh * GetMeshDS ();
		%feature("compactdefaultargs") GetLastCreatedNodes;
		%feature("autodoc", "	:rtype: SMESH_SequenceOfElemPtr
") GetLastCreatedNodes;
		const SMESH_SequenceOfElemPtr & GetLastCreatedNodes ();
		%feature("compactdefaultargs") GetLastCreatedElems;
		%feature("autodoc", "	:rtype: SMESH_SequenceOfElemPtr
") GetLastCreatedElems;
		const SMESH_SequenceOfElemPtr & GetLastCreatedElems ();
		%feature("compactdefaultargs") DoubleNodes;
		%feature("autodoc", "	:param theListOfNodes:
	:type theListOfNodes: std::list< int> &
	:param theListOfModifiedElems:
	:type theListOfModifiedElems: std::list< int> &
	:rtype: bool
") DoubleNodes;
		bool DoubleNodes (const std::list< int> & theListOfNodes,const std::list< int> & theListOfModifiedElems);
		%feature("compactdefaultargs") DoubleNodes;
		%feature("autodoc", "	:param theElems:
	:type theElems: TIDSortedElemSet &
	:param theNodesNot:
	:type theNodesNot: TIDSortedElemSet &
	:param theAffectedElems:
	:type theAffectedElems: TIDSortedElemSet &
	:rtype: bool
") DoubleNodes;
		bool DoubleNodes (const TIDSortedElemSet & theElems,const TIDSortedElemSet & theNodesNot,const TIDSortedElemSet & theAffectedElems);
		%feature("compactdefaultargs") DoubleNodesInRegion;
		%feature("autodoc", "	:param theElems:
	:type theElems: TIDSortedElemSet &
	:param theNodesNot:
	:type theNodesNot: TIDSortedElemSet &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") DoubleNodesInRegion;
		bool DoubleNodesInRegion (const TIDSortedElemSet & theElems,const TIDSortedElemSet & theNodesNot,const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Make2DMeshFrom3D;
		%feature("autodoc", "	* /*! * \brief Generated skin mesh (containing 2D cells) from 3D mesh * The created 2D mesh elements based on nodes of free faces of boundary volumes * eturn True if operation has been completed successfully, False otherwise */

	:rtype: bool
") Make2DMeshFrom3D;
		bool Make2DMeshFrom3D ();
};


%extend SMESH_MeshEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_MeshEditor_PathPoint;
class SMESH_MeshEditor_PathPoint {
	public:
		%feature("compactdefaultargs") SMESH_MeshEditor_PathPoint;
		%feature("autodoc", "	:rtype: None
") SMESH_MeshEditor_PathPoint;
		 SMESH_MeshEditor_PathPoint ();
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	:param aP3D:
	:type aP3D: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const gp_Pnt & aP3D);
		%feature("compactdefaultargs") SetTangent;
		%feature("autodoc", "	:param aTgt:
	:type aTgt: gp_Dir
	:rtype: None
") SetTangent;
		void SetTangent (const gp_Dir & aTgt);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	:param aBeta:
	:type aBeta: double &
	:rtype: None
") SetAngle;
		void SetAngle (const double & aBeta);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	:param aPrm:
	:type aPrm: double &
	:rtype: None
") SetParameter;
		void SetParameter (const double & aPrm);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	:rtype: gp_Dir
") Tangent;
		const gp_Dir  Tangent ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	:rtype: double
") Angle;
		double Angle ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: double
") Parameter;
		double Parameter ();
};


%extend SMESH_MeshEditor_PathPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_MeshVSLink;
class SMESH_MeshVSLink : public MeshVS_DataSource3D {
	public:
		%feature("compactdefaultargs") SMESH_MeshVSLink;
		%feature("autodoc", "	* Constructor

	:param aMesh:
	:type aMesh: SMESH_Mesh *
	:rtype: None
") SMESH_MeshVSLink;
		 SMESH_MeshVSLink (const SMESH_Mesh * aMesh);
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "	* Returns geometry information about node ( if IsElement is False ) or element ( IsElement is True ) by co-ordinates. For element this method must return all its nodes co-ordinates in the strict order: X, Y, Z and with nodes order is the same as in wire bounding the face or link. NbNodes is number of nodes of element. It is recommended to return 1 for node. Type is an element type.

	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Coords:
	:type Coords: TColStd_Array1OfReal &
	:param NbNodes:
	:type NbNodes: int &
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeom;
		Standard_Boolean GetGeom (const Standard_Integer ID,const Standard_Boolean IsElement,TColStd_Array1OfReal & Coords,Standard_Integer &OutValue,MeshVS_EntityType & Type);
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param NbNodes:
	:type NbNodes: int &
	:param Data:
	:type Data: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:rtype: bool
") Get3DGeom;
		Standard_Boolean Get3DGeom (const Standard_Integer ID,Standard_Integer &OutValue,Handle_MeshVS_HArray1OfSequenceOfInteger & Data);
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "	* This method is similar to GetGeom, but returns only element or node type. This method is provided for a fine performance.

	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeomType;
		Standard_Boolean GetGeomType (const Standard_Integer ID,const Standard_Boolean IsElement,MeshVS_EntityType & Type);
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "	* This method returns by number an address of any entity which represents element or node data structure.

	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:rtype: Standard_Address
") GetAddr;
		Standard_Address GetAddr (const Standard_Integer ID,const Standard_Boolean IsElement);
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "	* This method returns information about what node this element consist of.

	:param ID:
	:type ID: int
	:param NodeIDs:
	:type NodeIDs: TColStd_Array1OfInteger &
	:param NbNodes:
	:type NbNodes: int &
	:rtype: bool
") GetNodesByElement;
		Standard_Boolean GetNodesByElement (const Standard_Integer ID,TColStd_Array1OfInteger & NodeIDs,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "	* This method returns map of all nodes the object consist of.

	:rtype: TColStd_PackedMapOfInteger
") GetAllNodes;
		const TColStd_PackedMapOfInteger & GetAllNodes ();
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "	* This method returns map of all elements the object consist of.

	:rtype: TColStd_PackedMapOfInteger
") GetAllElements;
		const TColStd_PackedMapOfInteger & GetAllElements ();
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "	* This method calculates normal of face, which is using for correct reflection presentation. There is default method, for advance reflection this method can be redefined.

	:param Id:
	:type Id: int
	:param Max:
	:type Max: int
	:param nx:
	:type nx: float &
	:param ny:
	:type ny: float &
	:param nz:
	:type nz: float &
	:rtype: bool
") GetNormal;
		Standard_Boolean GetNormal (const Standard_Integer Id,const Standard_Integer Max,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetAllGroups;
		%feature("autodoc", "	* This method returns map of all groups the object contains.

	:param Ids:
	:type Ids: TColStd_PackedMapOfInteger &
	:rtype: None
") GetAllGroups;
		void GetAllGroups (TColStd_PackedMapOfInteger & Ids);
		%feature("compactdefaultargs") DynamicType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") DynamicType;
		Handle_Standard_Type DynamicType ();
};


%extend SMESH_MeshVSLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_MesherHelper;
class SMESH_MesherHelper {
	public:
/* public enums */
enum MType {
	LINEAR = 0,
	QUADRATIC = 1,
	COMP = 2,
};

/* end public enums declaration */

		%feature("compactdefaultargs") IsMedium;
		%feature("autodoc", "	* /*! * \brief Returns true if given node is medium * \param n - node to check * \param typeToCheck - type of elements containing the node to ask about node status * etval bool - check result */

	:param node:
	:type node: SMDS_MeshNode *
	:param typeToCheck: default value is SMDSAbs_All
	:type typeToCheck: SMDSAbs_ElementType
	:rtype: bool
") IsMedium;
		static bool IsMedium (const SMDS_MeshNode * node,const SMDSAbs_ElementType typeToCheck = SMDSAbs_All);
		%feature("compactdefaultargs") LoadNodeColumns;
		%feature("autodoc", "	* /*! * \brief Load nodes bound to face into a map of node columns * \param theParam2ColumnMap - map of node columns to fill * \param theFace - the face on which nodes are searched for * \param theBaseEdge - the edge nodes of which are columns' bases * \param theMesh - the mesh containing nodes * etval bool - false if something is wrong * * The key of the map is a normalized parameter of each * base node on theBaseEdge. * This method works in supposition that nodes on the face * forms a rectangular grid and elements can be quardrangles or triangles */

	:param theParam2ColumnMap:
	:type theParam2ColumnMap: TParam2ColumnMap &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theBaseEdge:
	:type theBaseEdge: TopoDS_Edge &
	:param theMesh:
	:type theMesh: SMESHDS_Mesh *
	:rtype: bool
") LoadNodeColumns;
		static bool LoadNodeColumns (TParam2ColumnMap & theParam2ColumnMap,const TopoDS_Face & theFace,const TopoDS_Edge & theBaseEdge,SMESHDS_Mesh * theMesh);
		%feature("compactdefaultargs") GetSubShapeByNode;
		%feature("autodoc", "	* /*! * \brief Return support shape of a node * \param node - the node * \param meshDS - mesh DS * etval TopoDS_Shape - found support shape */

	:param node:
	:type node: SMDS_MeshNode *
	:param meshDS:
	:type meshDS: SMESHDS_Mesh *
	:rtype: TopoDS_Shape
") GetSubShapeByNode;
		static TopoDS_Shape GetSubShapeByNode (const SMDS_MeshNode * node,SMESHDS_Mesh * meshDS);
		%feature("compactdefaultargs") WrapIndex;
		%feature("autodoc", "	* /*! * \brief Return a valid node index, fixing the given one if necessary * \param ind - node index * \param nbNodes - total nb of nodes * etval int - valid node index */

	:param ind:
	:type ind: int
	:param nbNodes:
	:type nbNodes: int
	:rtype: int
") WrapIndex;
		static int WrapIndex (const int ind,const int nbNodes);
		%feature("compactdefaultargs") NbAncestors;
		%feature("autodoc", "	* /*! * \brief Return number of unique ancestors of the shape */

	:param shape:
	:type shape: TopoDS_Shape &
	:param mesh:
	:type mesh: SMESH_Mesh &
	:param ancestorType: default value is TopAbs_SHAPE
	:type ancestorType: TopAbs_ShapeEnum
	:rtype: int
") NbAncestors;
		static int NbAncestors (const TopoDS_Shape & shape,const SMESH_Mesh & mesh,TopAbs_ShapeEnum ancestorType = TopAbs_SHAPE);
		%feature("compactdefaultargs") SMESH_MesherHelper;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh &
	:rtype: None
") SMESH_MesherHelper;
		 SMESH_MesherHelper (SMESH_Mesh & theMesh);
		%feature("compactdefaultargs") GetMesh;
		%feature("autodoc", "	:rtype: SMESH_Mesh *
") GetMesh;
		SMESH_Mesh * GetMesh ();
		%feature("compactdefaultargs") GetMeshDS;
		%feature("autodoc", "	:rtype: SMESHDS_Mesh *
") GetMeshDS;
		SMESHDS_Mesh * GetMeshDS ();
		%feature("compactdefaultargs") IsQuadraticSubMesh;
		%feature("autodoc", "	* /*! * Check submesh for given shape: if all elements on this shape are quadratic, * quadratic elements will be created. Also fill myTLinkNodeMap */

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsQuadraticSubMesh;
		bool IsQuadraticSubMesh (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetIsQuadratic;
		%feature("autodoc", "	* /*! * \brief Set order of elements to create without calling IsQuadraticSubMesh() */

	:param theBuildQuadratic:
	:type theBuildQuadratic: bool
	:rtype: None
") SetIsQuadratic;
		void SetIsQuadratic (const bool theBuildQuadratic);
		%feature("compactdefaultargs") GetIsQuadratic;
		%feature("autodoc", "	* /*! * \brief Return myCreateQuadratic flag */

	:rtype: bool
") GetIsQuadratic;
		bool GetIsQuadratic ();
		%feature("compactdefaultargs") FixQuadraticElements;
		%feature("autodoc", "	* /*! * \brief Move medium nodes of faces and volumes to fix distorted elements * \param volumeOnly - fix nodes on geom faces or not if the shape is solid */

	:param volumeOnly: default value is true
	:type volumeOnly: bool
	:rtype: None
") FixQuadraticElements;
		void FixQuadraticElements (bool volumeOnly = true);
		%feature("compactdefaultargs") SetElementsOnShape;
		%feature("autodoc", "	* /*! * \brief To set created elements on the shape set by IsQuadraticSubMesh() * or the next methods. By defaul elements are set on the shape if * a mesh has no shape to be meshed */

	:param toSet:
	:type toSet: bool
	:rtype: None
") SetElementsOnShape;
		void SetElementsOnShape (bool toSet);
		%feature("compactdefaultargs") SetSubShape;
		%feature("autodoc", "	* /*! * \brief Set shape to make elements on without calling IsQuadraticSubMesh() */

	:param subShapeID:
	:type subShapeID: int
	:rtype: None
") SetSubShape;
		void SetSubShape (const int subShapeID);
		%feature("compactdefaultargs") SetSubShape;
		%feature("autodoc", "	* //!==SMESHDS_Mesh::ShapeToIndex(shape)

	:param subShape:
	:type subShape: TopoDS_Shape &
	:rtype: None
") SetSubShape;
		void SetSubShape (const TopoDS_Shape & subShape);
		%feature("compactdefaultargs") GetSubShapeID;
		%feature("autodoc", "	* /*! * \brief Return ID of the shape set by IsQuadraticSubMesh() or SetSubShape() * etval int - shape index in SMESHDS */

	:rtype: int
") GetSubShapeID;
		int GetSubShapeID ();
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "	* /*! * \brief Return the shape set by IsQuadraticSubMesh() or SetSubShape() */

	:rtype: TopoDS_Shape
") GetSubShape;
		TopoDS_Shape GetSubShape ();
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	* /*! * Creates a node */

	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:param ID: default value is 0
	:type ID: int
	:rtype: SMDS_MeshNode *
") AddNode;
		SMDS_MeshNode * AddNode (double x,double y,double z,int ID = 0);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* /*! * Creates quadratic or linear edge */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is true
	:type force3d: bool
	:rtype: SMDS_MeshEdge *
") AddEdge;
		SMDS_MeshEdge * AddEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const int id = 0,const bool force3d = true);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	* /*! * Creates quadratic or linear triangle */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is false
	:type force3d: bool
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const int id = 0,const bool force3d = false);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	* /*! * Creates quadratic or linear quadrangle */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is false
	:type force3d: bool
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const int id = 0,const bool force3d = false);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	* /*! * Creates quadratic or linear tetraahedron */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is true
	:type force3d: bool
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const int id = 0,const bool force3d = true);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	* /*! * Creates quadratic or linear pyramid */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is true
	:type force3d: bool
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const int id = 0,const bool force3d = true);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	* /*! * Creates quadratic or linear pentahedron */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is true
	:type force3d: bool
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const int id = 0,const bool force3d = true);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	* /*! * Creates quadratic or linear hexahedron */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n6:
	:type n6: SMDS_MeshNode *
	:param n7:
	:type n7: SMDS_MeshNode *
	:param n8:
	:type n8: SMDS_MeshNode *
	:param id: default value is 0
	:type id: int
	:param force3d: default value is true
	:type force3d: bool
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,const int id = 0,bool force3d = true);
		%feature("compactdefaultargs") GetNodeU;
		%feature("autodoc", "	* /*! * \brief Return U of the given node on the edge */

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theNode:
	:type theNode: SMDS_MeshNode *
	:param check: default value is 0
	:type check: bool *
	:rtype: double
") GetNodeU;
		double GetNodeU (const TopoDS_Edge & theEdge,const SMDS_MeshNode * theNode,bool * check = 0);
		%feature("compactdefaultargs") GetNodeUV;
		%feature("autodoc", "	* /*! * \brief Return node UV on face * \param inFaceNode - a node of element being created located inside a face */

	:param F:
	:type F: TopoDS_Face &
	:param n:
	:type n: SMDS_MeshNode *
	:param inFaceNode: default value is 0
	:type inFaceNode: SMDS_MeshNode *
	:param check: default value is 0
	:type check: bool *
	:rtype: gp_XY
") GetNodeUV;
		gp_XY GetNodeUV (const TopoDS_Face & F,const SMDS_MeshNode * n,const SMDS_MeshNode * inFaceNode = 0,bool * check = 0);
		%feature("compactdefaultargs") CheckNodeUV;
		%feature("autodoc", "	* /*! * \brief Check and fix node UV on a face * etval bool - false if UV is bad and could not be fixed */

	:param F:
	:type F: TopoDS_Face &
	:param n:
	:type n: SMDS_MeshNode *
	:param uv:
	:type uv: gp_XY
	:param tol:
	:type tol: double
	:rtype: bool
") CheckNodeUV;
		bool CheckNodeUV (const TopoDS_Face & F,const SMDS_MeshNode * n,gp_XY & uv,const double tol);
		%feature("compactdefaultargs") GetMiddleUV;
		%feature("autodoc", "	* /*! * \brief Return middle UV taking in account surface period */

	:param surface:
	:type surface: Handle_Geom_Surface &
	:param uv1:
	:type uv1: gp_XY
	:param uv2:
	:type uv2: gp_XY
	:rtype: gp_XY
") GetMiddleUV;
		static gp_XY GetMiddleUV (const Handle_Geom_Surface & surface,const gp_XY & uv1,const gp_XY & uv2);
		%feature("compactdefaultargs") GetNodeUVneedInFaceNode;
		%feature("autodoc", "	* /*! * \brief Check if inFaceNode argument is necessary for call GetNodeUV(F,..) * etval bool - return true if the face is periodic * * if F is Null, answer about subshape set through IsQuadraticSubMesh() or * SetSubShape() */

	:param F: default value is TopoDS_Face()
	:type F: TopoDS_Face &
	:rtype: bool
") GetNodeUVneedInFaceNode;
		bool GetNodeUVneedInFaceNode (const TopoDS_Face & F = TopoDS_Face());
		%feature("compactdefaultargs") IsDegenShape;
		%feature("autodoc", "	* /*! * \brief Check if shape is a degenerated edge or it's vertex * \param subShape - edge or vertex index in SMESHDS * etval bool - true if subShape is a degenerated shape * * It works only if IsQuadraticSubMesh() or SetSubShape() has been called */

	:param subShape:
	:type subShape: int
	:rtype: bool
") IsDegenShape;
		bool IsDegenShape (const int subShape);
		%feature("compactdefaultargs") IsSeamShape;
		%feature("autodoc", "	* /*! * \brief Check if shape is a seam edge or it's vertex * \param subShape - edge or vertex index in SMESHDS * etval bool - true if subShape is a seam shape * * It works only if IsQuadraticSubMesh() or SetSubShape() has been called. * Seam shape has two 2D alternative represenations on the face */

	:param subShape:
	:type subShape: int
	:rtype: bool
") IsSeamShape;
		bool IsSeamShape (const int subShape);
		%feature("compactdefaultargs") IsSeamShape;
		%feature("autodoc", "	* /*! * \brief Check if shape is a seam edge or it's vertex * \param subShape - edge or vertex * etval bool - true if subShape is a seam shape * * It works only if IsQuadraticSubMesh() or SetSubShape() has been called. * Seam shape has two 2D alternative represenations on the face */

	:param subShape:
	:type subShape: TopoDS_Shape &
	:rtype: bool
") IsSeamShape;
		bool IsSeamShape (const TopoDS_Shape & subShape);
		%feature("compactdefaultargs") IsRealSeam;
		%feature("autodoc", "	* /*! * \brief Return true if an edge or a vertex encounters twice in face wire * \param subShape - Id of edge or vertex */

	:param subShape:
	:type subShape: int
	:rtype: bool
") IsRealSeam;
		bool IsRealSeam (const int subShape);
		%feature("compactdefaultargs") IsRealSeam;
		%feature("autodoc", "	* /*! * \brief Return true if an edge or a vertex encounters twice in face wire * \param subShape - edge or vertex */

	:param subShape:
	:type subShape: TopoDS_Shape &
	:rtype: bool
") IsRealSeam;
		bool IsRealSeam (const TopoDS_Shape & subShape);
		%feature("compactdefaultargs") HasSeam;
		%feature("autodoc", "	* /*! * \brief Check if the shape set through IsQuadraticSubMesh() or SetSubShape() * has a seam edge * etval bool - true if it has */

	:rtype: bool
") HasSeam;
		bool HasSeam ();
		%feature("compactdefaultargs") GetPeriodicIndex;
		%feature("autodoc", "	* /*! * \brief Return index of periodic parametric direction of a closed face * etval int - 1 for U, 2 for V direction */

	:rtype: int
") GetPeriodicIndex;
		int GetPeriodicIndex ();
		%feature("compactdefaultargs") GetOtherParam;
		%feature("autodoc", "	* /*! * \brief Return an alternative parameter for a node on seam */

	:param param:
	:type param: double
	:rtype: double
") GetOtherParam;
		double GetOtherParam (const double param);
		%feature("compactdefaultargs") GetMediumNode;
		%feature("autodoc", "	* /** * Special function for search or creation medium node */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param force3d:
	:type force3d: bool
	:rtype: SMDS_MeshNode *
") GetMediumNode;
		const SMDS_MeshNode * GetMediumNode (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const bool force3d);
		%feature("compactdefaultargs") AddTLinkNode;
		%feature("autodoc", "	* /*! * Auxilary function for filling myTLinkNodeMap */

	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:rtype: None
") AddTLinkNode;
		void AddTLinkNode (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n12);
		%feature("compactdefaultargs") AddTLinkNodeMap;
		%feature("autodoc", "	* /** * Auxilary function for filling myTLinkNodeMap */

	:param aMap:
	:type aMap: TLinkNodeMap &
	:rtype: None
") AddTLinkNodeMap;
		void AddTLinkNodeMap (const TLinkNodeMap & aMap);
		%feature("compactdefaultargs") GetTLinkNodeMap;
		%feature("autodoc", "	* /** * Returns myTLinkNodeMap */

	:rtype: TLinkNodeMap
") GetTLinkNodeMap;
		const TLinkNodeMap & GetTLinkNodeMap ();
};


%extend SMESH_MesherHelper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_NodeSearcher;
class SMESH_NodeSearcher {
	public:
		%feature("compactdefaultargs") FindClosestTo;
		%feature("autodoc", "	:param pnt:
	:type pnt: gp_Pnt
	:rtype: SMDS_MeshNode *
") FindClosestTo;
		const SMDS_MeshNode * FindClosestTo (const gp_Pnt & pnt);
		%feature("compactdefaultargs") MoveNode;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:param toPnt:
	:type toPnt: gp_Pnt
	:rtype: None
") MoveNode;
		void MoveNode (const SMDS_MeshNode * node,const gp_Pnt & toPnt);
};


%extend SMESH_NodeSearcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_Pattern;
class SMESH_Pattern {
	public:
/* public enums */
enum ErrorCode {
	ERR_OK = 0,
	ERR_READ_NB_POINTS = 1,
	ERR_READ_POINT_COORDS = 2,
	ERR_READ_TOO_FEW_POINTS = 3,
	ERR_READ_3D_COORD = 4,
	ERR_READ_NO_KEYPOINT = 5,
	ERR_READ_BAD_INDEX = 6,
	ERR_READ_ELEM_POINTS = 7,
	ERR_READ_NO_ELEMS = 8,
	ERR_READ_BAD_KEY_POINT = 9,
	ERR_SAVE_NOT_LOADED = 10,
	ERR_LOAD_EMPTY_SUBMESH = 11,
	ERR_LOADF_NARROW_FACE = 12,
	ERR_LOADF_CLOSED_FACE = 13,
	ERR_LOADF_CANT_PROJECT = 14,
	ERR_LOADV_BAD_SHAPE = 15,
	ERR_LOADV_COMPUTE_PARAMS = 16,
	ERR_APPL_NOT_COMPUTED = 17,
	ERR_APPL_NOT_LOADED = 18,
	ERR_APPL_BAD_DIMENTION = 19,
	ERR_APPL_BAD_NB_VERTICES = 20,
	ERR_APPLF_BAD_TOPOLOGY = 21,
	ERR_APPLF_BAD_VERTEX = 22,
	ERR_APPLF_INTERNAL_EEROR = 23,
	ERR_APPLV_BAD_SHAPE = 24,
	ERR_APPLF_BAD_FACE_GEOM = 25,
	ERR_MAKEM_NOT_COMPUTED = 26,
};

/* end public enums declaration */

		%feature("compactdefaultargs") SMESH_Pattern;
		%feature("autodoc", "	:rtype: None
") SMESH_Pattern;
		 SMESH_Pattern ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param theFileContents:
	:type theFileContents: char *
	:rtype: bool
") Load;
		bool Load (const char * theFileContents);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theProject: default value is false
	:type theProject: bool
	:rtype: bool
") Load;
		bool Load (SMESH_Mesh * theMesh,const TopoDS_Face & theFace,bool theProject = false);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theBlock:
	:type theBlock: TopoDS_Shell &
	:rtype: bool
") Load;
		bool Load (SMESH_Mesh * theMesh,const TopoDS_Shell & theBlock);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	:param theFile:
	:type theFile: std::ostream &
	:rtype: bool
") Save;
		bool Save (std::ostream & theFile);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theFace:
	:type theFace: TopoDS_Face &
	:param theVertexOnKeyPoint1:
	:type theVertexOnKeyPoint1: TopoDS_Vertex &
	:param theReverse:
	:type theReverse: bool
	:rtype: bool
") Apply;
		bool Apply (const TopoDS_Face & theFace,const TopoDS_Vertex & theVertexOnKeyPoint1,const bool theReverse);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theBlock:
	:type theBlock: TopoDS_Shell &
	:param theVertex000:
	:type theVertex000: TopoDS_Vertex &
	:param theVertex001:
	:type theVertex001: TopoDS_Vertex &
	:rtype: bool
") Apply;
		bool Apply (const TopoDS_Shell & theBlock,const TopoDS_Vertex & theVertex000,const TopoDS_Vertex & theVertex001);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theFace:
	:type theFace: SMDS_MeshFace *
	:param theNodeIndexOnKeyPoint1:
	:type theNodeIndexOnKeyPoint1: int
	:param theReverse:
	:type theReverse: bool
	:rtype: bool
") Apply;
		bool Apply (const SMDS_MeshFace * theFace,const int theNodeIndexOnKeyPoint1,const bool theReverse);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theFace:
	:type theFace: SMDS_MeshFace *
	:param theSurface:
	:type theSurface: TopoDS_Shape &
	:param theNodeIndexOnKeyPoint1:
	:type theNodeIndexOnKeyPoint1: int
	:param theReverse:
	:type theReverse: bool
	:rtype: bool
") Apply;
		bool Apply (SMESH_Mesh * theMesh,const SMDS_MeshFace * theFace,const TopoDS_Shape & theSurface,const int theNodeIndexOnKeyPoint1,const bool theReverse);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theFaces:
	:type theFaces: std::set< SMDS_MeshFace *> &
	:param theNodeIndexOnKeyPoint1:
	:type theNodeIndexOnKeyPoint1: int
	:param theReverse:
	:type theReverse: bool
	:rtype: bool
") Apply;
		bool Apply (SMESH_Mesh * theMesh,std::set<const SMDS_MeshFace *> & theFaces,const int theNodeIndexOnKeyPoint1,const bool theReverse);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theVolume:
	:type theVolume: SMDS_MeshVolume *
	:param theNode000Index:
	:type theNode000Index: int
	:param theNode001Index:
	:type theNode001Index: int
	:rtype: bool
") Apply;
		bool Apply (const SMDS_MeshVolume * theVolume,const int theNode000Index,const int theNode001Index);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param theVolumes:
	:type theVolumes: std::set< SMDS_MeshVolume *> &
	:param theNode000Index:
	:type theNode000Index: int
	:param theNode001Index:
	:type theNode001Index: int
	:rtype: bool
") Apply;
		bool Apply (std::set<const SMDS_MeshVolume *> & theVolumes,const int theNode000Index,const int theNode001Index);
		%feature("compactdefaultargs") GetMappedPoints;
		%feature("autodoc", "	:param thePoints:
	:type thePoints: std::list< gp_XYZ *>
	:rtype: bool
") GetMappedPoints;
		bool GetMappedPoints (std::list<const gp_XYZ *> & thePoints);
		%feature("compactdefaultargs") MakeMesh;
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param toCreatePolygons: default value is false
	:type toCreatePolygons: bool
	:param toCreatePolyedrs: default value is false
	:type toCreatePolyedrs: bool
	:rtype: bool
") MakeMesh;
		bool MakeMesh (SMESH_Mesh * theMesh,const bool toCreatePolygons = false,const bool toCreatePolyedrs = false);
		%feature("compactdefaultargs") GetErrorCode;
		%feature("autodoc", "	:rtype: SMESH_Pattern::ErrorCode
") GetErrorCode;
		SMESH_Pattern::ErrorCode GetErrorCode ();
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "	:rtype: bool
") IsLoaded;
		bool IsLoaded ();
		%feature("compactdefaultargs") Is2D;
		%feature("autodoc", "	:rtype: bool
") Is2D;
		bool Is2D ();
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "	:param thePoints:
	:type thePoints: std::list< gp_XYZ *>
	:rtype: bool
") GetPoints;
		bool GetPoints (std::list<const gp_XYZ *> & thePoints);
		%feature("compactdefaultargs") GetKeyPointIDs;
		%feature("autodoc", "	:rtype: std::list< int>
") GetKeyPointIDs;
		const std::list< int> & GetKeyPointIDs ();
		%feature("compactdefaultargs") GetElementPointIDs;
		%feature("autodoc", "	:param applied:
	:type applied: bool
	:rtype: std::list< std::list< int> >
") GetElementPointIDs;
		const std::list< std::list< int> > & GetElementPointIDs (bool applied);
		%feature("compactdefaultargs") DumpPoints;
		%feature("autodoc", "	:rtype: None
") DumpPoints;
		void DumpPoints ();
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TopoDS_Shape
") GetSubShape;
		TopoDS_Shape GetSubShape (const int i);
};


%extend SMESH_Pattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_TLink;
class SMESH_TLink : public NLink {
	public:
		%feature("compactdefaultargs") SMESH_TLink;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:rtype: None
") SMESH_TLink;
		 SMESH_TLink (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2);
		%feature("compactdefaultargs") SMESH_TLink;
		%feature("autodoc", "	:param link:
	:type link: NLink &
	:rtype: None
") SMESH_TLink;
		 SMESH_TLink (const NLink & link);
		%feature("compactdefaultargs") node1;
		%feature("autodoc", "	:rtype: SMDS_MeshNode *
") node1;
		const SMDS_MeshNode * node1 ();
		%feature("compactdefaultargs") node2;
		%feature("autodoc", "	:rtype: SMDS_MeshNode *
") node2;
		const SMDS_MeshNode * node2 ();
};


%extend SMESH_TLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_subMesh;
class SMESH_subMesh {
	public:
/* public enums */
enum compute_state {
	NOT_READY = 0,
	READY_TO_COMPUTE = 1,
	COMPUTE_OK = 2,
	FAILED_TO_COMPUTE = 3,
};

enum algo_state {
	NO_ALGO = 0,
	MISSING_HYP = 1,
	HYP_OK = 2,
};

enum algo_event {
	ADD_HYP = 0,
	ADD_ALGO = 1,
	REMOVE_HYP = 2,
	REMOVE_ALGO = 3,
	ADD_FATHER_HYP = 4,
	ADD_FATHER_ALGO = 5,
	REMOVE_FATHER_HYP = 6,
	REMOVE_FATHER_ALGO = 7,
	MODIF_HYP = 8,
};

enum compute_event {
	MODIF_ALGO_STATE = 0,
	COMPUTE = 1,
	CLEAN = 2,
	SUBMESH_COMPUTED = 3,
	SUBMESH_RESTORED = 4,
	MESH_ENTITY_REMOVED = 5,
	CHECK_COMPUTE_STATE = 6,
};

enum event_type {
	ALGO_EVENT = 0,
	COMPUTE_EVENT = 1,
};

/* end public enums declaration */

		%feature("compactdefaultargs") SMESH_subMesh;
		%feature("autodoc", "	:param Id:
	:type Id: int
	:param father:
	:type father: SMESH_Mesh *
	:param meshDS:
	:type meshDS: SMESHDS_Mesh *
	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: None
") SMESH_subMesh;
		 SMESH_subMesh (int Id,SMESH_Mesh * father,SMESHDS_Mesh * meshDS,const TopoDS_Shape & aSubShape);
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	:rtype: int
") GetId;
		int GetId ();
		%feature("compactdefaultargs") GetFather;
		%feature("autodoc", "	:rtype: SMESH_Mesh *
") GetFather;
		SMESH_Mesh * GetFather ();
		%feature("compactdefaultargs") GetSubMeshDS;
		%feature("autodoc", "	:rtype: SMESHDS_SubMesh *
") GetSubMeshDS;
		SMESHDS_SubMesh * GetSubMeshDS ();
		%feature("compactdefaultargs") CreateSubMeshDS;
		%feature("autodoc", "	:rtype: SMESHDS_SubMesh *
") CreateSubMeshDS;
		SMESHDS_SubMesh * CreateSubMeshDS ();
		%feature("compactdefaultargs") GetFirstToCompute;
		%feature("autodoc", "	:rtype: SMESH_subMesh *
") GetFirstToCompute;
		SMESH_subMesh * GetFirstToCompute ();
		%feature("compactdefaultargs") DependsOn;
		%feature("autodoc", "	:rtype: std::map< int, SMESH_subMesh *>
") DependsOn;
		const std::map< int, SMESH_subMesh *> & DependsOn ();
		%feature("compactdefaultargs") getDependsOnIterator;
		%feature("autodoc", "	* /*! * \brief Return iterator on the submeshes this one depends on */

	:param includeSelf:
	:type includeSelf: bool
	:param complexShapeFirst:
	:type complexShapeFirst: bool
	:rtype: SMESH_subMeshIteratorPtr
") getDependsOnIterator;
		SMESH_subMeshIteratorPtr getDependsOnIterator (const bool includeSelf,const bool complexShapeFirst);
		%feature("compactdefaultargs") GetSubShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetSubShape;
		const TopoDS_Shape  GetSubShape ();
		%feature("compactdefaultargs") SetEventListener;
		%feature("autodoc", "	* /*! * \brief Sets an event listener and its data to a submesh * \param listener - the listener to store * \param data - the listener data to store * \param where - the submesh to store the listener and it's data * * The method remembers the submesh \awhere it puts the listener in order to delete * them when HYP_OK algo_state is lost * After being set, event listener is notified on each event of \awhere submesh. */

	:param listener:
	:type listener: EventListener *
	:param data:
	:type data: EventListenerData *
	:param where:
	:type where: SMESH_subMesh *
	:rtype: None
") SetEventListener;
		void SetEventListener (EventListener * listener,EventListenerData * data,SMESH_subMesh * where);
		%feature("compactdefaultargs") GetEventListenerData;
		%feature("autodoc", "	* /*! * \brief Return an event listener data * \param listener - the listener whose data is * etval EventListenerData* - found data, maybe NULL */

	:param listener:
	:type listener: EventListener *
	:rtype: EventListenerData *
") GetEventListenerData;
		EventListenerData * GetEventListenerData (EventListener * listener);
		%feature("compactdefaultargs") DeleteEventListener;
		%feature("autodoc", "	* /*! * \brief Unregister the listener and delete it and it's data * \param listener - the event listener to delete */

	:param listener:
	:type listener: EventListener *
	:rtype: None
") DeleteEventListener;
		void DeleteEventListener (EventListener * listener);
		%feature("compactdefaultargs") AlgoStateEngine;
		%feature("autodoc", "	:param event:
	:type event: int
	:param anHyp:
	:type anHyp: SMESH_Hypothesis *
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") AlgoStateEngine;
		SMESH_Hypothesis::Hypothesis_Status AlgoStateEngine (int event,SMESH_Hypothesis * anHyp);
		%feature("compactdefaultargs") SubMeshesAlgoStateEngine;
		%feature("autodoc", "	:param event:
	:type event: int
	:param anHyp:
	:type anHyp: SMESH_Hypothesis *
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") SubMeshesAlgoStateEngine;
		SMESH_Hypothesis::Hypothesis_Status SubMeshesAlgoStateEngine (int event,SMESH_Hypothesis * anHyp);
		%feature("compactdefaultargs") GetAlgoState;
		%feature("autodoc", "	:rtype: int
") GetAlgoState;
		int GetAlgoState ();
		%feature("compactdefaultargs") GetComputeState;
		%feature("autodoc", "	:rtype: int
") GetComputeState;
		int GetComputeState ();
		%feature("compactdefaultargs") GetComputeError;
		%feature("autodoc", "	:rtype: SMESH_ComputeErrorPtr
") GetComputeError;
		SMESH_ComputeErrorPtr & GetComputeError ();
		%feature("compactdefaultargs") DumpAlgoState;
		%feature("autodoc", "	:param isMain:
	:type isMain: bool
	:rtype: None
") DumpAlgoState;
		void DumpAlgoState (bool isMain);
		%feature("compactdefaultargs") ComputeStateEngine;
		%feature("autodoc", "	:param event:
	:type event: int
	:rtype: bool
") ComputeStateEngine;
		bool ComputeStateEngine (int event);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") IsConform;
		%feature("autodoc", "	:param theAlgo:
	:type theAlgo: SMESH_Algo *
	:rtype: bool
") IsConform;
		bool IsConform (const SMESH_Algo * theAlgo);
		%feature("compactdefaultargs") CanAddHypothesis;
		%feature("autodoc", "	:param theHypothesis:
	:type theHypothesis: SMESH_Hypothesis *
	:rtype: bool
") CanAddHypothesis;
		bool CanAddHypothesis (const SMESH_Hypothesis * theHypothesis);
		%feature("compactdefaultargs") IsApplicableHypotesis;
		%feature("autodoc", "	:param theHypothesis:
	:type theHypothesis: SMESH_Hypothesis *
	:param theShapeType:
	:type theShapeType: TopAbs_ShapeEnum
	:rtype: bool
") IsApplicableHypotesis;
		static bool IsApplicableHypotesis (const SMESH_Hypothesis * theHypothesis,const TopAbs_ShapeEnum theShapeType);
		%feature("compactdefaultargs") IsApplicableHypotesis;
		%feature("autodoc", "	:param theHypothesis:
	:type theHypothesis: SMESH_Hypothesis *
	:rtype: bool
") IsApplicableHypotesis;
		bool IsApplicableHypotesis (const SMESH_Hypothesis * theHypothesis);
		%feature("compactdefaultargs") CheckConcurentHypothesis;
		%feature("autodoc", "	:param theHypType:
	:type theHypType: int
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") CheckConcurentHypothesis;
		SMESH_Hypothesis::Hypothesis_Status CheckConcurentHypothesis (const int theHypType);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* /*! * \brief Return true if no mesh entities is bound to the submesh */

	:rtype: bool
") IsEmpty;
		bool IsEmpty ();
		%feature("compactdefaultargs") IsMeshComputed;
		%feature("autodoc", "	:rtype: bool
") IsMeshComputed;
		bool IsMeshComputed ();
		%feature("compactdefaultargs") SetIsAlwaysComputed;
		%feature("autodoc", "	* /*! * \brief Allow algo->Compute() if a subshape of lower dim is meshed but * none mesh entity is bound to it */

	:param isAlCo:
	:type isAlCo: bool
	:rtype: None
") SetIsAlwaysComputed;
		void SetIsAlwaysComputed (bool isAlCo);
		%feature("compactdefaultargs") IsAlwaysComputed;
		%feature("autodoc", "	:rtype: bool
") IsAlwaysComputed;
		bool IsAlwaysComputed ();
};


%extend SMESH_subMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_subMeshEventListener;
class SMESH_subMeshEventListener {
	public:
		%feature("compactdefaultargs") SMESH_subMeshEventListener;
		%feature("autodoc", "	* //!< if true, it will be deleted by SMESH_subMesh

	:param isDeletable:
	:type isDeletable: bool
	:rtype: None
") SMESH_subMeshEventListener;
		 SMESH_subMeshEventListener (bool isDeletable);
		%feature("compactdefaultargs") IsDeletable;
		%feature("autodoc", "	:rtype: bool
") IsDeletable;
		bool IsDeletable ();
		%feature("compactdefaultargs") ProcessEvent;
		%feature("autodoc", "	* /*! * \brief Do something on a certain event * \param event - algo_event or compute_event itself (of SMESH_subMesh) * \param eventType - ALGO_EVENT or COMPUTE_EVENT (of SMESH_subMesh) * \param subMesh - the submesh where the event occures * \param data - listener data stored in the subMesh * \param hyp - hypothesis, if eventType is algo_event * * The base implementation translates CLEAN event to the subMesh stored * in the listener data. Also it sends SUBMESH_COMPUTED event in case of * successful COMPUTE event. */

	:param event:
	:type event: int
	:param eventType:
	:type eventType: int
	:param subMesh:
	:type subMesh: SMESH_subMesh *
	:param data:
	:type data: SMESH_subMeshEventListenerData *
	:param hyp: default value is 0
	:type hyp: SMESH_Hypothesis *
	:rtype: None
") ProcessEvent;
		void ProcessEvent (const int event,const int eventType,SMESH_subMesh * subMesh,SMESH_subMeshEventListenerData * data,const SMESH_Hypothesis * hyp = 0);
};


%extend SMESH_subMeshEventListener {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESH_subMeshEventListenerData;
class SMESH_subMeshEventListenerData {
	public:
		bool myIsDeletable;
		int myType;
		std::list<SMESH_subMesh *> mySubMeshes;
		%feature("compactdefaultargs") SMESH_subMeshEventListenerData;
		%feature("autodoc", "	* //!< generally: submeshes depending

	:param isDeletable:
	:type isDeletable: bool
	:rtype: None
") SMESH_subMeshEventListenerData;
		 SMESH_subMeshEventListenerData (bool isDeletable);
		%feature("compactdefaultargs") IsDeletable;
		%feature("autodoc", "	:rtype: bool
") IsDeletable;
		bool IsDeletable ();
		%feature("compactdefaultargs") MakeData;
		%feature("autodoc", "	* /*! * \brief Create a default listener data. * \param dependentSM - subMesh to store * \param type - data type * etval SMESH_subMeshEventListenerData* - a new listener data * * See SMESH_subMeshEventListener::ProcessEvent() to know how the default * listener uses it (implementation is in SMESH_subMesh.cxx) */

	:param dependentSM:
	:type dependentSM: SMESH_subMesh *
	:param type: default value is 0
	:type type: int
	:rtype: SMESH_subMeshEventListenerData *
") MakeData;
		static SMESH_subMeshEventListenerData * MakeData (SMESH_subMesh * dependentSM,const int type = 0);
};


%extend SMESH_subMeshEventListenerData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
