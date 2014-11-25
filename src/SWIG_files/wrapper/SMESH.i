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
%module (package="OCC") SMESH

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

%include SMESH_headers.i

/* typedefs */
typedef const SMDS_MeshElement * SMDS_MeshElementPtr;
typedef std::set <int> TSetOfInt;
typedef boost::shared_ptr <SMESH_OctreeNodeIterator> SMESH_OctreeNodeIteratorPtr;
typedef std::map <const SMDS_MeshElement * , std::list <const SMDS_MeshElement *>> TElemOfElemListMap;
typedef boost::shared_ptr <Functor> SMESH::Controls::FunctorPtr;
typedef boost::shared_ptr <Predicate> SMESH::Controls::PredicatePtr;
typedef SMDS_Iterator <SMESH_OctreeNode *> SMESH_OctreeNodeIterator;
typedef SMESH_Hypothesis::Hypothesis_Status TAlgoStateErrorName;
typedef SMESH_subMeshEventListener EventListener;
typedef std::map <SMESH_TLink , const SMDS_MeshNode *>::iterator ItTLinkNode;
typedef boost::shared_ptr<SMDS_Iterator <SMESH_subMesh *>> SMESH_subMeshIteratorPtr;
typedef std::map <const SMDS_MeshNode * , const SMDS_MeshNode *> TNodeNodeMap;
typedef pair<const SMDS_MeshNode * , const SMDS_MeshNode *> NLink;
typedef const SMDS_MeshNode * SMDS_MeshNodePtr;
typedef std::map <SMESH_TLink , const SMDS_MeshNode *> TLinkNodeMap;
typedef SMESH_subMeshEventListenerData EventListenerData;
typedef boost::shared_ptr <NumericalFunctor> SMESH::Controls::NumericalFunctorPtr;
typedef std::set<const SMDS_MeshElement * , TIDCompare> TIDSortedElemSet;
typedef std::vector <const SMDS_MeshNode *> TNodeColumn;
typedef std::map<double , TNodeColumn> TParam2ColumnMap;
typedef boost::shared_ptr <SMESH_ComputeError> SMESH_ComputeErrorPtr;
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

%nodefaultctor SMESH_ComputeError;
class SMESH_ComputeError {
	public:
		%feature("autodoc", "	* //!< to explain COMPERR_BAD_INPUT_MESH

	:param error: default value is COMPERR_OK
	:type error: int
	:param comment: default value is ""
	:type comment: std::string
	:param algo: default value is 0
	:type algo: SMESH_Algo *
	:rtype: SMESH_ComputeErrorPtr
") New;
		static SMESH_ComputeErrorPtr New (int error = COMPERR_OK,std::string comment = "",const SMESH_Algo * algo = 0);
		%feature("autodoc", "	:param error: default value is COMPERR_OK
	:type error: int
	:param comment: default value is ""
	:type comment: std::string
	:param algo: default value is 0
	:type algo: SMESH_Algo *
	:rtype: None
") SMESH_ComputeError;
		 SMESH_ComputeError (int error = COMPERR_OK,std::string comment = "",const SMESH_Algo * algo = 0);
		%feature("autodoc", "	:rtype: bool
") IsOK;
		bool IsOK ();
		%feature("autodoc", "	:rtype: bool
") IsCommon;
		bool IsCommon ();
		%feature("autodoc", "	:rtype: inline std::string
") CommonName;
		inline std::string CommonName ();
};


%feature("shadow") SMESH_ComputeError::~SMESH_ComputeError %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_ComputeError {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_ElementSearcher;
class SMESH_ElementSearcher {
	public:
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


%feature("shadow") SMESH_ElementSearcher::~SMESH_ElementSearcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_ElementSearcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_Exception;
class SMESH_Exception : public std::exception {
	public:
		%feature("autodoc", "	:param text:
	:type text: char *
	:param fileName: default value is 0
	:type fileName: char *
	:param lineNumber: default value is 0
	:type lineNumber: unsigned int
	:rtype: None
") SMESH_Exception;
		 SMESH_Exception (const char * text,const char * fileName = 0,const unsigned int lineNumber = 0);
		%feature("autodoc", "	:param ex:
	:type ex: SMESH_Exception &
	:rtype: None
") SMESH_Exception;
		 SMESH_Exception (const SMESH_Exception & ex);
		%feature("autodoc", "	:param :
	:type : void
	:rtype: char *
") what;
		const char * what (void );
};


%feature("shadow") SMESH_Exception::~SMESH_Exception %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_Exception {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_Gen;
class SMESH_Gen {
	public:
		%feature("autodoc", "	:rtype: None
") SMESH_Gen;
		 SMESH_Gen ();
		%feature("autodoc", "	:param theStudyId:
	:type theStudyId: int
	:param theIsEmbeddedMode:
	:type theIsEmbeddedMode: bool
	:rtype: SMESH_Mesh *
") CreateMesh;
		SMESH_Mesh * CreateMesh (int theStudyId,bool theIsEmbeddedMode);
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
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") CheckAlgoState;
		bool CheckAlgoState (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("autodoc", "	* /*! * \brief Sets number of segments per diagonal of boundary box of geometry by which * default segment length of appropriate 1D hypotheses is defined */

	:param theNbSegments:
	:type theNbSegments: int
	:rtype: None
") SetBoundaryBoxSegmentation;
		void SetBoundaryBoxSegmentation (int theNbSegments);
		%feature("autodoc", "	:rtype: int
") GetBoundaryBoxSegmentation;
		int GetBoundaryBoxSegmentation ();
		%feature("autodoc", "	* /*! * \brief Sets default number of segments per edge */

	:param nb:
	:type nb: int
	:rtype: None
") SetDefaultNbSegments;
		void SetDefaultNbSegments (int nb);
		%feature("autodoc", "	:rtype: int
") GetDefaultNbSegments;
		int GetDefaultNbSegments ();
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param theErrors:
	:type theErrors: std::list< SMESH_Gen::TAlgoStateError> &
	:rtype: bool
") GetAlgoState;
		bool GetAlgoState (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,std::list< SMESH_Gen::TAlgoStateError> & theErrors);
		%feature("autodoc", "	:param studyId:
	:type studyId: int
	:rtype: StudyContextStruct *
") GetStudyContext;
		StudyContextStruct * GetStudyContext (int studyId);
		%feature("autodoc", "	:param aShapeType:
	:type aShapeType: TopAbs_ShapeEnum &
	:rtype: int
") GetShapeDim;
		static int GetShapeDim (const TopAbs_ShapeEnum & aShapeType);
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: int
") GetShapeDim;
		static int GetShapeDim (const TopoDS_Shape & aShape);
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param assignedTo: default value is 0
	:type assignedTo: TopoDS_Shape *
	:rtype: SMESH_Algo *
") GetAlgo;
		SMESH_Algo * GetAlgo (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,TopoDS_Shape * assignedTo = 0);
		%feature("autodoc", "	:param theHyp:
	:type theHyp: SMESH_Hypothesis *
	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:rtype: bool
") IsGlobalHypothesis;
		static bool IsGlobalHypothesis (const SMESH_Hypothesis * theHyp,SMESH_Mesh & aMesh);
		%feature("autodoc", "	:rtype: int
") GetANewId;
		int GetANewId ();
};


%feature("shadow") SMESH_Gen::~SMESH_Gen %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_Gen {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_Group;
class SMESH_Group {
	public:
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
		%feature("autodoc", "	:param theName:
	:type theName: char *
	:rtype: None
") SetName;
		void SetName (const char * theName);
		%feature("autodoc", "	:rtype: char *
") GetName;
		const char * GetName ();
		%feature("autodoc", "	:rtype: SMESHDS_GroupBase *
") GetGroupDS;
		SMESHDS_GroupBase * GetGroupDS ();
};


%feature("shadow") SMESH_Group::~SMESH_Group %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_Group {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_HypoPredicate;
class SMESH_HypoPredicate {
	public:
		%feature("autodoc", "	:param aHyp:
	:type aHyp: SMESH_Hypothesis *
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") IsOk;
		bool IsOk (const SMESH_Hypothesis * aHyp,const TopoDS_Shape & aShape);
};


%feature("shadow") SMESH_HypoPredicate::~SMESH_HypoPredicate %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_HypoPredicate {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_Hypothesis;
class SMESH_Hypothesis : public SMESHDS_Hypothesis {
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

	public:
		%feature("autodoc", "	:rtype: int
") GetDim;
		int GetDim ();
		%feature("autodoc", "	:rtype: int
") GetStudyId;
		int GetStudyId ();
		%feature("autodoc", "	:rtype: None
") NotifySubMeshesHypothesisModification;
		void NotifySubMeshesHypothesisModification ();
		%feature("autodoc", "	:rtype: int
") GetShapeType;
		int GetShapeType ();
		%feature("autodoc", "	:rtype: char *
") GetLibName;
		const char * GetLibName ();
		%feature("autodoc", "	:param theLibName:
	:type theLibName: char *
	:rtype: None
") SetLibName;
		void SetLibName (const char * theLibName);
		%feature("autodoc", "	:param theParameters:
	:type theParameters: char *
	:rtype: None
") SetParameters;
		void SetParameters (const char * theParameters);
		%feature("autodoc", "	:rtype: char *
") GetParameters;
		char * GetParameters ();
		%feature("autodoc", "	:param theParameters:
	:type theParameters: char *
	:rtype: None
") SetLastParameters;
		void SetLastParameters (const char * theParameters);
		%feature("autodoc", "	:rtype: char *
") GetLastParameters;
		char * GetLastParameters ();
		%feature("autodoc", "	:rtype: None
") ClearParameters;
		void ClearParameters ();
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") SetParametersByMesh;
		bool SetParametersByMesh (const SMESH_Mesh * theMesh,const TopoDS_Shape & theShape);
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by default parameters. * etval bool - true if parameter values have been successfully defined */

	:param dflts:
	:type dflts: SMESH_0D_Algo::TDefaults &
	:param theMesh: default value is 0
	:type theMesh: SMESH_Mesh *
	:rtype: bool
") SetParametersByDefaults;
		bool SetParametersByDefaults (const SMESH_0D_Algo::TDefaults & dflts,const SMESH_Mesh * theMesh = 0);
		%feature("autodoc", "	* /*! * \brief Return true if me is an auxiliary hypothesis * etval bool - auxiliary or not * * An auxiliary hypothesis is optional, i.e. an algorithm * can work without it and another hypothesis of the same * dimention can be assigned to the shape */

	:rtype: bool
") IsAuxiliary;
		bool IsAuxiliary ();
};


%feature("shadow") SMESH_Hypothesis::~SMESH_Hypothesis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_Hypothesis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_Mesh;
class SMESH_Mesh {
	public:
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
		%feature("autodoc", "	* /*! * \brief Set geometry to be meshed */

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") ShapeToMesh;
		void ShapeToMesh (const TopoDS_Shape & aShape);
		%feature("autodoc", "	* /*! * \brief Return geometry to be meshed. (It may be a PseudoShape()!) */

	:rtype: TopoDS_Shape
") GetShapeToMesh;
		TopoDS_Shape GetShapeToMesh ();
		%feature("autodoc", "	* /*! * \brief Return true if there is a geometry to be meshed, not PseudoShape() */

	:rtype: bool
") HasShapeToMesh;
		bool HasShapeToMesh ();
		%feature("autodoc", "	* /*! * \brief Return diagonal size of bounding box of shape to mesh. */

	:rtype: double
") GetShapeDiagonalSize;
		double GetShapeDiagonalSize ();
		%feature("autodoc", "	* /*! * \brief Return diagonal size of bounding box of a shape. */

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: double
") GetShapeDiagonalSize;
		static double GetShapeDiagonalSize (const TopoDS_Shape & aShape);
		%feature("autodoc", "	* /*! * \brief Return a solid which is returned by GetShapeToMesh() if * a real geometry to be meshed was not set */

	:rtype: TopoDS_Solid
") PseudoShape;
		static const TopoDS_Solid  PseudoShape ();
		%feature("autodoc", "	* /*! * \brief Remove all nodes and elements */

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* /*! * \brief Remove all nodes and elements of indicated shape */

	:param theShapeId:
	:type theShapeId: int
	:rtype: None
") ClearSubMesh;
		void ClearSubMesh (const int theShapeId);
		%feature("autodoc", "	:param theFileName:
	:type theFileName: char *
	:rtype: int
") UNVToMesh;
		int UNVToMesh (const char * theFileName);
		%feature("autodoc", "	* /*! * consult DriverMED_R_SMESHDS_Mesh::ReadStatus for returned value */

	:param theFileName:
	:type theFileName: char *
	:param theMeshName:
	:type theMeshName: char *
	:rtype: int
") MEDToMesh;
		int MEDToMesh (const char * theFileName,const char * theMeshName);
		%feature("autodoc", "	:param theFileName:
	:type theFileName: char *
	:rtype: int
") STLToMesh;
		int STLToMesh (const char * theFileName);
		%feature("autodoc", "	:param theFileName:
	:type theFileName: char *
	:rtype: int
") DATToMesh;
		int DATToMesh (const char * theFileName);
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:param anHypId:
	:type anHypId: int
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") AddHypothesis;
		SMESH_Hypothesis::Hypothesis_Status AddHypothesis (const TopoDS_Shape & aSubShape,int anHypId);
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:param anHypId:
	:type anHypId: int
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") RemoveHypothesis;
		SMESH_Hypothesis::Hypothesis_Status RemoveHypothesis (const TopoDS_Shape & aSubShape,int anHypId);
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: std::list< SMESHDS_Hypothesis *>
") GetHypothesisList;
		const std::list<const SMESHDS_Hypothesis *> & GetHypothesisList (const TopoDS_Shape & aSubShape);
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
		%feature("autodoc", "	:rtype: std::list<SMESHDS_Command *>
") GetLog;
		const std::list<SMESHDS_Command *> & GetLog ();
		%feature("autodoc", "	:rtype: None
") ClearLog;
		void ClearLog ();
		%feature("autodoc", "	:rtype: int
") GetId;
		int GetId ();
		%feature("autodoc", "	:rtype: SMESHDS_Mesh *
") GetMeshDS;
		SMESHDS_Mesh * GetMeshDS ();
		%feature("autodoc", "	:rtype: SMESH_Gen *
") GetGen;
		SMESH_Gen * GetGen ();
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: SMESH_subMesh *
") GetSubMesh;
		SMESH_subMesh * GetSubMesh (const TopoDS_Shape & aSubShape);
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: SMESH_subMesh *
") GetSubMeshContaining;
		SMESH_subMesh * GetSubMeshContaining (const TopoDS_Shape & aSubShape);
		%feature("autodoc", "	:param aShapeID:
	:type aShapeID: int
	:rtype: SMESH_subMesh *
") GetSubMeshContaining;
		SMESH_subMesh * GetSubMeshContaining (const int aShapeID);
		%feature("autodoc", "	* /*! * \brief Return submeshes of groups containing the given subshape */

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: std::list<SMESH_subMesh *>
") GetGroupSubMeshesContaining;
		std::list<SMESH_subMesh *> GetGroupSubMeshesContaining (const TopoDS_Shape & shape);
		%feature("autodoc", "	* /*! * \brief Say all submeshes that theChangedHyp has been modified */

	:param theChangedHyp:
	:type theChangedHyp: SMESH_Hypothesis *
	:rtype: None
") NotifySubMeshesHypothesisModification;
		void NotifySubMeshesHypothesisModification (const SMESH_Hypothesis * theChangedHyp);
		%feature("autodoc", "	:param anHyp:
	:type anHyp: SMESHDS_Hypothesis *
	:rtype: std::list< SMESH_subMesh *>
") GetSubMeshUsingHypothesis;
		const std::list< SMESH_subMesh *> & GetSubMeshUsingHypothesis (SMESHDS_Hypothesis * anHyp);
		%feature("autodoc", "	* /*! * \brief Return True if anHyp is used to mesh aSubShape */

	:param anHyp:
	:type anHyp: SMESHDS_Hypothesis *
	:param aSubMesh:
	:type aSubMesh: SMESH_subMesh *
	:rtype: bool
") IsUsedHypothesis;
		bool IsUsedHypothesis (SMESHDS_Hypothesis * anHyp,const SMESH_subMesh * aSubMesh);
		%feature("autodoc", "	* /*! * \brief check if a hypothesis alowing notconform mesh is present */

	:rtype: bool
") IsNotConformAllowed;
		bool IsNotConformAllowed ();
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsMainShape;
		bool IsMainShape (const TopoDS_Shape & theShape);
		%feature("autodoc", "	* /*! * \brief Return list of ancestors of theSubShape in the order * that lower dimention shapes come first */

	:param theSubShape:
	:type theSubShape: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") GetAncestors;
		const TopTools_ListOfShape & GetAncestors (const TopoDS_Shape & theSubShape);
		%feature("autodoc", "	:param theAutoColor:
	:type theAutoColor: bool
	:rtype: None
") SetAutoColor;
		void SetAutoColor (bool theAutoColor);
		%feature("autodoc", "	:rtype: bool
") GetAutoColor;
		bool GetAutoColor ();
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") GetAncestorMap;
		const TopTools_IndexedDataMapOfShapeListOfShape & GetAncestorMap ();
		%feature("autodoc", "	* /*! * \brief Check group names for duplications. * Consider maximum group name length stored in MED file */

	:rtype: bool
") HasDuplicatedGroupNamesMED;
		bool HasDuplicatedGroupNamesMED ();
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
		%feature("autodoc", "	:param file:
	:type file: char *
	:rtype: None
") ExportDAT;
		void ExportDAT (const char * file);
		%feature("autodoc", "	:param file:
	:type file: char *
	:rtype: None
") ExportUNV;
		void ExportUNV (const char * file);
		%feature("autodoc", "	:param file:
	:type file: char *
	:param isascii:
	:type isascii: bool
	:rtype: None
") ExportSTL;
		void ExportSTL (const char * file,const bool isascii);
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("autodoc", "	:rtype: int
") Nb0DElements;
		int Nb0DElements ();
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbEdges;
		int NbEdges (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbFaces;
		int NbFaces (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbTriangles;
		int NbTriangles (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbQuadrangles;
		int NbQuadrangles (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:rtype: int
") NbPolygons;
		int NbPolygons ();
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbVolumes;
		int NbVolumes (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbTetras;
		int NbTetras (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbHexas;
		int NbHexas (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbPyramids;
		int NbPyramids (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:param order: default value is ORDER_ANY
	:type order: SMDSAbs_ElementOrder
	:rtype: int
") NbPrisms;
		int NbPrisms (SMDSAbs_ElementOrder order = ORDER_ANY);
		%feature("autodoc", "	:rtype: int
") NbPolyhedrons;
		int NbPolyhedrons ();
		%feature("autodoc", "	:rtype: int
") NbSubMesh;
		int NbSubMesh ();
		%feature("autodoc", "	:rtype: int
") NbGroup;
		int NbGroup ();
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
		%feature("autodoc", "	:rtype: std::list<int>
") GetGroupIds;
		std::list<int> GetGroupIds ();
		%feature("autodoc", "	:param theGroupID:
	:type theGroupID: int
	:rtype: None
") RemoveGroup;
		void RemoveGroup (const int theGroupID);
		%feature("autodoc", "	:param theGroupID:
	:type theGroupID: int
	:rtype: SMESH_Group *
") ConvertToStandalone;
		SMESH_Group * ConvertToStandalone (int theGroupID);
		%feature("autodoc", "	:param id:
	:type id: int
	:param iselem:
	:type iselem: bool
	:rtype: SMDSAbs_ElementType
") GetElementType;
		SMDSAbs_ElementType GetElementType (const int id,const bool iselem);
		%feature("autodoc", "	:param save:
	:type save: ostream &
	:rtype: ostream
") Dump;
		ostream & Dump (ostream & save);
};


%feature("shadow") SMESH_Mesh::~SMESH_Mesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_Mesh {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_MeshEditor_PathPoint;
class SMESH_MeshEditor_PathPoint {
	public:
		%feature("autodoc", "	:rtype: None
") SMESH_MeshEditor_PathPoint;
		 SMESH_MeshEditor_PathPoint ();
		%feature("autodoc", "	:param aP3D:
	:type aP3D: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const gp_Pnt & aP3D);
		%feature("autodoc", "	:param aTgt:
	:type aTgt: gp_Dir
	:rtype: None
") SetTangent;
		void SetTangent (const gp_Dir & aTgt);
		%feature("autodoc", "	:param aBeta:
	:type aBeta: double &
	:rtype: None
") SetAngle;
		void SetAngle (const double & aBeta);
		%feature("autodoc", "	:param aPrm:
	:type aPrm: double &
	:rtype: None
") SetParameter;
		void SetParameter (const double & aPrm);
		%feature("autodoc", "	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	:rtype: gp_Dir
") Tangent;
		const gp_Dir  Tangent ();
		%feature("autodoc", "	:rtype: double
") Angle;
		double Angle ();
		%feature("autodoc", "	:rtype: double
") Parameter;
		double Parameter ();
};


%feature("shadow") SMESH_MeshEditor_PathPoint::~SMESH_MeshEditor_PathPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_MeshEditor_PathPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_MeshVSLink;
class SMESH_MeshVSLink : public MeshVS_DataSource3D {
	public:
		%feature("autodoc", "	* Constructor

	:param aMesh:
	:type aMesh: SMESH_Mesh *
	:rtype: None
") SMESH_MeshVSLink;
		 SMESH_MeshVSLink (const SMESH_Mesh * aMesh);
		%feature("autodoc", "	* Returns geometry information about node ( if IsElement is False ) or element ( IsElement is True )  by co-ordinates. For element this method must return all its nodes co-ordinates in the strict order: X, Y, Z and  with nodes order is the same as in wire bounding the face or link. NbNodes is number of nodes of element.  It is recommended to return 1 for node. Type is an element type.

	:param ID:
	:type ID: Standard_Integer
	:param IsElement:
	:type IsElement: bool
	:param Coords:
	:type Coords: TColStd_Array1OfReal &
	:param NbNodes:
	:type NbNodes: Standard_Integer &
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeom;
		Standard_Boolean GetGeom (const Standard_Integer ID,const Standard_Boolean IsElement,TColStd_Array1OfReal & Coords,Standard_Integer &OutValue,MeshVS_EntityType & Type);
		%feature("autodoc", "	:param ID:
	:type ID: Standard_Integer
	:param NbNodes:
	:type NbNodes: Standard_Integer &
	:param Data:
	:type Data: Handle_MeshVS_HArray1OfSequenceOfInteger &
	:rtype: bool
") Get3DGeom;
		Standard_Boolean Get3DGeom (const Standard_Integer ID,Standard_Integer &OutValue,Handle_MeshVS_HArray1OfSequenceOfInteger & Data);
		%feature("autodoc", "	* This method is similar to GetGeom, but returns only element or node type. This method is provided for  a fine performance.

	:param ID:
	:type ID: Standard_Integer
	:param IsElement:
	:type IsElement: bool
	:param Type:
	:type Type: MeshVS_EntityType &
	:rtype: bool
") GetGeomType;
		Standard_Boolean GetGeomType (const Standard_Integer ID,const Standard_Boolean IsElement,MeshVS_EntityType & Type);
		%feature("autodoc", "	* This method returns by number an address of any entity which represents element or node data structure.

	:param ID:
	:type ID: Standard_Integer
	:param IsElement:
	:type IsElement: bool
	:rtype: Standard_Address
") GetAddr;
		Standard_Address GetAddr (const Standard_Integer ID,const Standard_Boolean IsElement);
		%feature("autodoc", "	* This method returns information about what node this element consist of.

	:param ID:
	:type ID: Standard_Integer
	:param NodeIDs:
	:type NodeIDs: TColStd_Array1OfInteger &
	:param NbNodes:
	:type NbNodes: Standard_Integer &
	:rtype: bool
") GetNodesByElement;
		Standard_Boolean GetNodesByElement (const Standard_Integer ID,TColStd_Array1OfInteger & NodeIDs,Standard_Integer &OutValue);
		%feature("autodoc", "	* This method returns map of all nodes the object consist of.

	:rtype: TColStd_PackedMapOfInteger
") GetAllNodes;
		const TColStd_PackedMapOfInteger & GetAllNodes ();
		%feature("autodoc", "	* This method returns map of all elements the object consist of.

	:rtype: TColStd_PackedMapOfInteger
") GetAllElements;
		const TColStd_PackedMapOfInteger & GetAllElements ();
		%feature("autodoc", "	* This method calculates normal of face, which is using for correct reflection presentation.  There is default method, for advance reflection this method can be redefined.

	:param Id:
	:type Id: Standard_Integer
	:param Max:
	:type Max: Standard_Integer
	:param nx:
	:type nx: float &
	:param ny:
	:type ny: float &
	:param nz:
	:type nz: float &
	:rtype: bool
") GetNormal;
		Standard_Boolean GetNormal (const Standard_Integer Id,const Standard_Integer Max,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* This method returns map of all groups the object contains.

	:param Ids:
	:type Ids: TColStd_PackedMapOfInteger &
	:rtype: None
") GetAllGroups;
		void GetAllGroups (TColStd_PackedMapOfInteger & Ids);
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") DynamicType;
		const Handle_Standard_Type & DynamicType ();
};


%feature("shadow") SMESH_MeshVSLink::~SMESH_MeshVSLink %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_MeshVSLink {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_MesherHelper;
class SMESH_MesherHelper {
/* public enums */
enum MType {
	LINEAR = 0,
	QUADRATIC = 1,
	COMP = 2,
};

/* end public enums declaration */

	public:
		%feature("autodoc", "	* /*! * \brief Returns true if given node is medium * \param n - node to check * \param typeToCheck - type of elements containing the node to ask about node status * etval bool - check result */

	:param node:
	:type node: SMDS_MeshNode *
	:param typeToCheck: default value is SMDSAbs_All
	:type typeToCheck: SMDSAbs_ElementType
	:rtype: bool
") IsMedium;
		static bool IsMedium (const SMDS_MeshNode * node,const SMDSAbs_ElementType typeToCheck = SMDSAbs_All);
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
		%feature("autodoc", "	* /*! * \brief Return support shape of a node * \param node - the node * \param meshDS - mesh DS * etval TopoDS_Shape - found support shape */

	:param node:
	:type node: SMDS_MeshNode *
	:param meshDS:
	:type meshDS: SMESHDS_Mesh *
	:rtype: TopoDS_Shape
") GetSubShapeByNode;
		static TopoDS_Shape GetSubShapeByNode (const SMDS_MeshNode * node,SMESHDS_Mesh * meshDS);
		%feature("autodoc", "	* /*! * \brief Return a valid node index, fixing the given one if necessary * \param ind - node index * \param nbNodes - total nb of nodes * etval int - valid node index */

	:param ind:
	:type ind: int
	:param nbNodes:
	:type nbNodes: int
	:rtype: int
") WrapIndex;
		static int WrapIndex (const int ind,const int nbNodes);
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
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh &
	:rtype: None
") SMESH_MesherHelper;
		 SMESH_MesherHelper (SMESH_Mesh & theMesh);
		%feature("autodoc", "	:rtype: SMESH_Mesh *
") GetMesh;
		SMESH_Mesh * GetMesh ();
		%feature("autodoc", "	:rtype: SMESHDS_Mesh *
") GetMeshDS;
		SMESHDS_Mesh * GetMeshDS ();
		%feature("autodoc", "	* /*! * Check submesh for given shape: if all elements on this shape are quadratic, * quadratic elements will be created. Also fill myTLinkNodeMap */

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsQuadraticSubMesh;
		bool IsQuadraticSubMesh (const TopoDS_Shape & theShape);
		%feature("autodoc", "	* /*! * \brief Set order of elements to create without calling IsQuadraticSubMesh() */

	:param theBuildQuadratic:
	:type theBuildQuadratic: bool
	:rtype: None
") SetIsQuadratic;
		void SetIsQuadratic (const bool theBuildQuadratic);
		%feature("autodoc", "	* /*! * \brief Return myCreateQuadratic flag */

	:rtype: bool
") GetIsQuadratic;
		bool GetIsQuadratic ();
		%feature("autodoc", "	* /*! * \brief Move medium nodes of faces and volumes to fix distorted elements * \param volumeOnly - fix nodes on geom faces or not if the shape is solid */

	:param volumeOnly: default value is true
	:type volumeOnly: bool
	:rtype: None
") FixQuadraticElements;
		void FixQuadraticElements (bool volumeOnly = true);
		%feature("autodoc", "	* /*! * \brief To set created elements on the shape set by IsQuadraticSubMesh() * or the next methods. By defaul elements are set on the shape if * a mesh has no shape to be meshed */

	:param toSet:
	:type toSet: bool
	:rtype: None
") SetElementsOnShape;
		void SetElementsOnShape (bool toSet);
		%feature("autodoc", "	* /*! * \brief Set shape to make elements on without calling IsQuadraticSubMesh() */

	:param subShapeID:
	:type subShapeID: int
	:rtype: None
") SetSubShape;
		void SetSubShape (const int subShapeID);
		%feature("autodoc", "	* //!==SMESHDS_Mesh::ShapeToIndex(shape)

	:param subShape:
	:type subShape: TopoDS_Shape &
	:rtype: None
") SetSubShape;
		void SetSubShape (const TopoDS_Shape & subShape);
		%feature("autodoc", "	* /*! * \brief Return ID of the shape set by IsQuadraticSubMesh() or SetSubShape() * etval int - shape index in SMESHDS */

	:rtype: int
") GetSubShapeID;
		int GetSubShapeID ();
		%feature("autodoc", "	* /*! * \brief Return the shape set by IsQuadraticSubMesh() or SetSubShape() */

	:rtype: TopoDS_Shape
") GetSubShape;
		TopoDS_Shape GetSubShape ();
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
		%feature("autodoc", "	* /*! * \brief Check if inFaceNode argument is necessary for call GetNodeUV(F,..) * etval bool - return true if the face is periodic * * if F is Null, answer about subshape set through IsQuadraticSubMesh() or * SetSubShape() */

	:param F: default value is TopoDS_Face()
	:type F: TopoDS_Face &
	:rtype: bool
") GetNodeUVneedInFaceNode;
		bool GetNodeUVneedInFaceNode (const TopoDS_Face & F = TopoDS_Face());
		%feature("autodoc", "	* /*! * \brief Check if shape is a degenerated edge or it's vertex * \param subShape - edge or vertex index in SMESHDS * etval bool - true if subShape is a degenerated shape * * It works only if IsQuadraticSubMesh() or SetSubShape() has been called */

	:param subShape:
	:type subShape: int
	:rtype: bool
") IsDegenShape;
		bool IsDegenShape (const int subShape);
		%feature("autodoc", "	* /*! * \brief Check if shape is a seam edge or it's vertex * \param subShape - edge or vertex index in SMESHDS * etval bool - true if subShape is a seam shape * * It works only if IsQuadraticSubMesh() or SetSubShape() has been called. * Seam shape has two 2D alternative represenations on the face */

	:param subShape:
	:type subShape: int
	:rtype: bool
") IsSeamShape;
		bool IsSeamShape (const int subShape);
		%feature("autodoc", "	* /*! * \brief Check if shape is a seam edge or it's vertex * \param subShape - edge or vertex * etval bool - true if subShape is a seam shape * * It works only if IsQuadraticSubMesh() or SetSubShape() has been called. * Seam shape has two 2D alternative represenations on the face */

	:param subShape:
	:type subShape: TopoDS_Shape &
	:rtype: bool
") IsSeamShape;
		bool IsSeamShape (const TopoDS_Shape & subShape);
		%feature("autodoc", "	* /*! * \brief Return true if an edge or a vertex encounters twice in face wire * \param subShape - Id of edge or vertex */

	:param subShape:
	:type subShape: int
	:rtype: bool
") IsRealSeam;
		bool IsRealSeam (const int subShape);
		%feature("autodoc", "	* /*! * \brief Return true if an edge or a vertex encounters twice in face wire * \param subShape - edge or vertex */

	:param subShape:
	:type subShape: TopoDS_Shape &
	:rtype: bool
") IsRealSeam;
		bool IsRealSeam (const TopoDS_Shape & subShape);
		%feature("autodoc", "	* /*! * \brief Check if the shape set through IsQuadraticSubMesh() or SetSubShape() * has a seam edge * etval bool - true if it has */

	:rtype: bool
") HasSeam;
		bool HasSeam ();
		%feature("autodoc", "	* /*! * \brief Return index of periodic parametric direction of a closed face * etval int - 1 for U, 2 for V direction */

	:rtype: int
") GetPeriodicIndex;
		int GetPeriodicIndex ();
		%feature("autodoc", "	* /*! * \brief Return an alternative parameter for a node on seam */

	:param param:
	:type param: double
	:rtype: double
") GetOtherParam;
		double GetOtherParam (const double param);
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
		%feature("autodoc", "	* /** * Auxilary function for filling myTLinkNodeMap */

	:param aMap:
	:type aMap: TLinkNodeMap &
	:rtype: None
") AddTLinkNodeMap;
		void AddTLinkNodeMap (const TLinkNodeMap & aMap);
		%feature("autodoc", "	* /** * Returns myTLinkNodeMap */

	:rtype: TLinkNodeMap
") GetTLinkNodeMap;
		const TLinkNodeMap & GetTLinkNodeMap ();
};


%feature("shadow") SMESH_MesherHelper::~SMESH_MesherHelper %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_MesherHelper {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_NodeSearcher;
class SMESH_NodeSearcher {
	public:
		%feature("autodoc", "	:param pnt:
	:type pnt: gp_Pnt
	:rtype: SMDS_MeshNode *
") FindClosestTo;
		const SMDS_MeshNode * FindClosestTo (const gp_Pnt & pnt);
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:param toPnt:
	:type toPnt: gp_Pnt
	:rtype: None
") MoveNode;
		void MoveNode (const SMDS_MeshNode * node,const gp_Pnt & toPnt);
};


%feature("shadow") SMESH_NodeSearcher::~SMESH_NodeSearcher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_NodeSearcher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_Pattern;
class SMESH_Pattern {
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

	public:
		%feature("autodoc", "	:rtype: None
") SMESH_Pattern;
		 SMESH_Pattern ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param theFileContents:
	:type theFileContents: char *
	:rtype: bool
") Load;
		bool Load (const char * theFileContents);
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theProject: default value is false
	:type theProject: bool
	:rtype: bool
") Load;
		bool Load (SMESH_Mesh * theMesh,const TopoDS_Face & theFace,bool theProject = false);
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theBlock:
	:type theBlock: TopoDS_Shell &
	:rtype: bool
") Load;
		bool Load (SMESH_Mesh * theMesh,const TopoDS_Shell & theBlock);
		%feature("autodoc", "	:param theFile:
	:type theFile: std::ostream &
	:rtype: bool
") Save;
		bool Save (std::ostream & theFile);
		%feature("autodoc", "	:param theFace:
	:type theFace: TopoDS_Face &
	:param theVertexOnKeyPoint1:
	:type theVertexOnKeyPoint1: TopoDS_Vertex &
	:param theReverse:
	:type theReverse: bool
	:rtype: bool
") Apply;
		bool Apply (const TopoDS_Face & theFace,const TopoDS_Vertex & theVertexOnKeyPoint1,const bool theReverse);
		%feature("autodoc", "	:param theBlock:
	:type theBlock: TopoDS_Shell &
	:param theVertex000:
	:type theVertex000: TopoDS_Vertex &
	:param theVertex001:
	:type theVertex001: TopoDS_Vertex &
	:rtype: bool
") Apply;
		bool Apply (const TopoDS_Shell & theBlock,const TopoDS_Vertex & theVertex000,const TopoDS_Vertex & theVertex001);
		%feature("autodoc", "	:param theFace:
	:type theFace: SMDS_MeshFace *
	:param theNodeIndexOnKeyPoint1:
	:type theNodeIndexOnKeyPoint1: int
	:param theReverse:
	:type theReverse: bool
	:rtype: bool
") Apply;
		bool Apply (const SMDS_MeshFace * theFace,const int theNodeIndexOnKeyPoint1,const bool theReverse);
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
		%feature("autodoc", "	:param theVolume:
	:type theVolume: SMDS_MeshVolume *
	:param theNode000Index:
	:type theNode000Index: int
	:param theNode001Index:
	:type theNode001Index: int
	:rtype: bool
") Apply;
		bool Apply (const SMDS_MeshVolume * theVolume,const int theNode000Index,const int theNode001Index);
		%feature("autodoc", "	:param theVolumes:
	:type theVolumes: std::set< SMDS_MeshVolume *> &
	:param theNode000Index:
	:type theNode000Index: int
	:param theNode001Index:
	:type theNode001Index: int
	:rtype: bool
") Apply;
		bool Apply (std::set<const SMDS_MeshVolume *> & theVolumes,const int theNode000Index,const int theNode001Index);
		%feature("autodoc", "	:param thePoints:
	:type thePoints: std::list< gp_XYZ *>
	:rtype: bool
") GetMappedPoints;
		bool GetMappedPoints (std::list<const gp_XYZ *> & thePoints);
		%feature("autodoc", "	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param toCreatePolygons: default value is false
	:type toCreatePolygons: bool
	:param toCreatePolyedrs: default value is false
	:type toCreatePolyedrs: bool
	:rtype: bool
") MakeMesh;
		bool MakeMesh (SMESH_Mesh * theMesh,const bool toCreatePolygons = false,const bool toCreatePolyedrs = false);
		%feature("autodoc", "	:rtype: SMESH_Pattern::ErrorCode
") GetErrorCode;
		SMESH_Pattern::ErrorCode GetErrorCode ();
		%feature("autodoc", "	:rtype: bool
") IsLoaded;
		bool IsLoaded ();
		%feature("autodoc", "	:rtype: bool
") Is2D;
		bool Is2D ();
		%feature("autodoc", "	:param thePoints:
	:type thePoints: std::list< gp_XYZ *>
	:rtype: bool
") GetPoints;
		bool GetPoints (std::list<const gp_XYZ *> & thePoints);
		%feature("autodoc", "	:rtype: std::list< int>
") GetKeyPointIDs;
		const std::list< int> & GetKeyPointIDs ();
		%feature("autodoc", "	:param applied:
	:type applied: bool
	:rtype: std::list< std::list< int> >
") GetElementPointIDs;
		const std::list< std::list< int> > & GetElementPointIDs (bool applied);
		%feature("autodoc", "	:rtype: None
") DumpPoints;
		void DumpPoints ();
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TopoDS_Shape
") GetSubShape;
		TopoDS_Shape GetSubShape (const int i);
};


%feature("shadow") SMESH_Pattern::~SMESH_Pattern %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_Pattern {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_TLink;
class SMESH_TLink : public NLink {
	public:
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:rtype: None
") SMESH_TLink;
		 SMESH_TLink (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2);
		%feature("autodoc", "	:param link:
	:type link: NLink &
	:rtype: None
") SMESH_TLink;
		 SMESH_TLink (const NLink & link);
		%feature("autodoc", "	:rtype: SMDS_MeshNode *
") node1;
		const SMDS_MeshNode * node1 ();
		%feature("autodoc", "	:rtype: SMDS_MeshNode *
") node2;
		const SMDS_MeshNode * node2 ();
};


%feature("shadow") SMESH_TLink::~SMESH_TLink %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_TLink {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_subMesh;
class SMESH_subMesh {
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

	public:
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
		%feature("autodoc", "	:rtype: int
") GetId;
		int GetId ();
		%feature("autodoc", "	:rtype: SMESH_Mesh *
") GetFather;
		SMESH_Mesh * GetFather ();
		%feature("autodoc", "	:rtype: SMESHDS_SubMesh *
") GetSubMeshDS;
		SMESHDS_SubMesh * GetSubMeshDS ();
		%feature("autodoc", "	:rtype: SMESHDS_SubMesh *
") CreateSubMeshDS;
		SMESHDS_SubMesh * CreateSubMeshDS ();
		%feature("autodoc", "	:rtype: SMESH_subMesh *
") GetFirstToCompute;
		SMESH_subMesh * GetFirstToCompute ();
		%feature("autodoc", "	:rtype: std::map< int, SMESH_subMesh *>
") DependsOn;
		const std::map< int, SMESH_subMesh *> & DependsOn ();
		%feature("autodoc", "	* /*! * \brief Return iterator on the submeshes this one depends on */

	:param includeSelf:
	:type includeSelf: bool
	:param complexShapeFirst:
	:type complexShapeFirst: bool
	:rtype: SMESH_subMeshIteratorPtr
") getDependsOnIterator;
		SMESH_subMeshIteratorPtr getDependsOnIterator (const bool includeSelf,const bool complexShapeFirst);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetSubShape;
		const TopoDS_Shape  GetSubShape ();
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
		%feature("autodoc", "	* /*! * \brief Return an event listener data * \param listener - the listener whose data is * etval EventListenerData* - found data, maybe NULL */

	:param listener:
	:type listener: EventListener *
	:rtype: EventListenerData *
") GetEventListenerData;
		EventListenerData * GetEventListenerData (EventListener * listener);
		%feature("autodoc", "	* /*! * \brief Unregister the listener and delete it and it's data * \param listener - the event listener to delete */

	:param listener:
	:type listener: EventListener *
	:rtype: None
") DeleteEventListener;
		void DeleteEventListener (EventListener * listener);
		%feature("autodoc", "	:param event:
	:type event: int
	:param anHyp:
	:type anHyp: SMESH_Hypothesis *
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") AlgoStateEngine;
		SMESH_Hypothesis::Hypothesis_Status AlgoStateEngine (int event,SMESH_Hypothesis * anHyp);
		%feature("autodoc", "	:param event:
	:type event: int
	:param anHyp:
	:type anHyp: SMESH_Hypothesis *
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") SubMeshesAlgoStateEngine;
		SMESH_Hypothesis::Hypothesis_Status SubMeshesAlgoStateEngine (int event,SMESH_Hypothesis * anHyp);
		%feature("autodoc", "	:rtype: int
") GetAlgoState;
		int GetAlgoState ();
		%feature("autodoc", "	:rtype: int
") GetComputeState;
		int GetComputeState ();
		%feature("autodoc", "	:rtype: SMESH_ComputeErrorPtr
") GetComputeError;
		SMESH_ComputeErrorPtr & GetComputeError ();
		%feature("autodoc", "	:param isMain:
	:type isMain: bool
	:rtype: None
") DumpAlgoState;
		void DumpAlgoState (bool isMain);
		%feature("autodoc", "	:param event:
	:type event: int
	:rtype: bool
") ComputeStateEngine;
		bool ComputeStateEngine (int event);
		%feature("autodoc", "	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (MapShapeNbElems & aResMap);
		%feature("autodoc", "	:param theAlgo:
	:type theAlgo: SMESH_Algo *
	:rtype: bool
") IsConform;
		bool IsConform (const SMESH_Algo * theAlgo);
		%feature("autodoc", "	:param theHypothesis:
	:type theHypothesis: SMESH_Hypothesis *
	:rtype: bool
") CanAddHypothesis;
		bool CanAddHypothesis (const SMESH_Hypothesis * theHypothesis);
		%feature("autodoc", "	:param theHypothesis:
	:type theHypothesis: SMESH_Hypothesis *
	:param theShapeType:
	:type theShapeType: TopAbs_ShapeEnum
	:rtype: bool
") IsApplicableHypotesis;
		static bool IsApplicableHypotesis (const SMESH_Hypothesis * theHypothesis,const TopAbs_ShapeEnum theShapeType);
		%feature("autodoc", "	:param theHypothesis:
	:type theHypothesis: SMESH_Hypothesis *
	:rtype: bool
") IsApplicableHypotesis;
		bool IsApplicableHypotesis (const SMESH_Hypothesis * theHypothesis);
		%feature("autodoc", "	:param theHypType:
	:type theHypType: int
	:rtype: SMESH_Hypothesis::Hypothesis_Status
") CheckConcurentHypothesis;
		SMESH_Hypothesis::Hypothesis_Status CheckConcurentHypothesis (const int theHypType);
		%feature("autodoc", "	* /*! * \brief Return true if no mesh entities is bound to the submesh */

	:rtype: bool
") IsEmpty;
		bool IsEmpty ();
		%feature("autodoc", "	:rtype: bool
") IsMeshComputed;
		bool IsMeshComputed ();
		%feature("autodoc", "	* /*! * \brief Allow algo->Compute() if a subshape of lower dim is meshed but * none mesh entity is bound to it */

	:param isAlCo:
	:type isAlCo: bool
	:rtype: None
") SetIsAlwaysComputed;
		void SetIsAlwaysComputed (bool isAlCo);
		%feature("autodoc", "	:rtype: bool
") IsAlwaysComputed;
		bool IsAlwaysComputed ();
};


%feature("shadow") SMESH_subMesh::~SMESH_subMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_subMesh {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_subMeshEventListener;
class SMESH_subMeshEventListener {
	public:
		%feature("autodoc", "	* //!< if true, it will be deleted by SMESH_subMesh

	:param isDeletable:
	:type isDeletable: bool
	:rtype: None
") SMESH_subMeshEventListener;
		 SMESH_subMeshEventListener (bool isDeletable);
		%feature("autodoc", "	:rtype: bool
") IsDeletable;
		bool IsDeletable ();
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


%feature("shadow") SMESH_subMeshEventListener::~SMESH_subMeshEventListener %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_subMeshEventListener {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_subMeshEventListenerData;
class SMESH_subMeshEventListenerData {
	public:
		%feature("autodoc", "	* //!< generally: submeshes depending

	:param isDeletable:
	:type isDeletable: bool
	:rtype: None
") SMESH_subMeshEventListenerData;
		 SMESH_subMeshEventListenerData (bool isDeletable);
		%feature("autodoc", "	:rtype: bool
") IsDeletable;
		bool IsDeletable ();
		%feature("autodoc", "	* /*! * \brief Create a default listener data. * \param dependentSM - subMesh to store * \param type - data type * etval SMESH_subMeshEventListenerData* - a new listener data * * See SMESH_subMeshEventListener::ProcessEvent() to know how the default * listener uses it (implementation is in SMESH_subMesh.cxx) */

	:param dependentSM:
	:type dependentSM: SMESH_subMesh *
	:param type: default value is 0
	:type type: int
	:rtype: SMESH_subMeshEventListenerData *
") MakeData;
		static SMESH_subMeshEventListenerData * MakeData (SMESH_subMesh * dependentSM,const int type = 0);
};


%feature("shadow") SMESH_subMeshEventListenerData::~SMESH_subMeshEventListenerData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_subMeshEventListenerData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_HypoFilter;
class SMESH_HypoFilter : public SMESH_HypoPredicate {
/* public enums */
enum Logical {
	AND = 0,
	AND_NOT = 1,
	OR = 2,
	OR_NOT = 3,
};

enum Comparison {
	EQUAL = 0,
	NOT_EQUAL = 1,
	MORE = 2,
	LESS = 3,
};

/* end public enums declaration */

	public:
		%feature("autodoc", "	:rtype: None
") SMESH_HypoFilter;
		 SMESH_HypoFilter ();
		%feature("autodoc", "	:param aPredicate:
	:type aPredicate: SMESH_HypoPredicate *
	:param notNagate: default value is true
	:type notNagate: bool
	:rtype: None
") SMESH_HypoFilter;
		 SMESH_HypoFilter (SMESH_HypoPredicate * aPredicate,bool notNagate = true);
		%feature("autodoc", "	:param aPredicate:
	:type aPredicate: SMESH_HypoPredicate *
	:param notNagate: default value is true
	:type notNagate: bool
	:rtype: SMESH_HypoFilter
") Init;
		SMESH_HypoFilter & Init (SMESH_HypoPredicate * aPredicate,bool notNagate = true);
		%feature("autodoc", "	:param aPredicate:
	:type aPredicate: SMESH_HypoPredicate *
	:rtype: SMESH_HypoFilter
") And;
		SMESH_HypoFilter & And (SMESH_HypoPredicate * aPredicate);
		%feature("autodoc", "	:param aPredicate:
	:type aPredicate: SMESH_HypoPredicate *
	:rtype: SMESH_HypoFilter
") AndNot;
		SMESH_HypoFilter & AndNot (SMESH_HypoPredicate * aPredicate);
		%feature("autodoc", "	:param aPredicate:
	:type aPredicate: SMESH_HypoPredicate *
	:rtype: SMESH_HypoFilter
") Or;
		SMESH_HypoFilter & Or (SMESH_HypoPredicate * aPredicate);
		%feature("autodoc", "	:param aPredicate:
	:type aPredicate: SMESH_HypoPredicate *
	:rtype: SMESH_HypoFilter
") OrNot;
		SMESH_HypoFilter & OrNot (SMESH_HypoPredicate * aPredicate);
		%feature("autodoc", "	:rtype: SMESH_HypoPredicate *
") IsAlgo;
		static SMESH_HypoPredicate * IsAlgo ();
		%feature("autodoc", "	:rtype: SMESH_HypoPredicate *
") IsAuxiliary;
		static SMESH_HypoPredicate * IsAuxiliary ();
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: SMESH_HypoPredicate *
") IsApplicableTo;
		static SMESH_HypoPredicate * IsApplicableTo (const TopoDS_Shape & theShape);
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: SMESH_HypoPredicate *
") IsAssignedTo;
		static SMESH_HypoPredicate * IsAssignedTo (const TopoDS_Shape & theShape);
		%feature("autodoc", "	:param theHypo:
	:type theHypo: SMESH_Hypothesis *
	:rtype: SMESH_HypoPredicate *
") Is;
		static SMESH_HypoPredicate * Is (const SMESH_Hypothesis * theHypo);
		%feature("autodoc", "	:param theMainShape:
	:type theMainShape: TopoDS_Shape &
	:rtype: SMESH_HypoPredicate *
") IsGlobal;
		static SMESH_HypoPredicate * IsGlobal (const TopoDS_Shape & theMainShape);
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: SMESH_HypoPredicate *
") IsMoreLocalThan;
		static SMESH_HypoPredicate * IsMoreLocalThan (const TopoDS_Shape & theShape);
		%feature("autodoc", "	:param theName:
	:type theName: std::string &
	:rtype: SMESH_HypoPredicate *
") HasName;
		static SMESH_HypoPredicate * HasName (const std::string & theName);
		%feature("autodoc", "	:param theDim:
	:type theDim: int
	:rtype: SMESH_HypoPredicate *
") HasDim;
		static SMESH_HypoPredicate * HasDim (const int theDim);
		%feature("autodoc", "	:param theHypType:
	:type theHypType: int
	:rtype: SMESH_HypoPredicate *
") HasType;
		static SMESH_HypoPredicate * HasType (const int theHypType);
		%feature("autodoc", "	* /*! * \brief check aHyp or/and aShape it is assigned to */

	:param aHyp:
	:type aHyp: SMESH_Hypothesis *
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") IsOk;
		bool IsOk (const SMESH_Hypothesis * aHyp,const TopoDS_Shape & aShape);
		%feature("autodoc", "	* /*! * \brief return true if contains no predicates */

	:rtype: bool
") IsAny;
		bool IsAny ();
};


%feature("shadow") SMESH_HypoFilter::~SMESH_HypoFilter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_HypoFilter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor SMESH_OctreeNode;
class SMESH_OctreeNode : public SMESH_Octree {
	public:
		%feature("autodoc", "	:param theNodes:
	:type theNodes: std::set< SMDS_MeshNode *> &
	:param maxLevel: default value is -1
	:type maxLevel: int
	:param maxNbNodes: default value is 5
	:type maxNbNodes: int
	:param minBoxSize: default value is 0
	:type minBoxSize: double
	:rtype: None
") SMESH_OctreeNode;
		 SMESH_OctreeNode (const std::set<const SMDS_MeshNode *> & theNodes,const int maxLevel = -1,const int maxNbNodes = 5,const double minBoxSize = 0);
		%feature("autodoc", "	:param Node:
	:type Node: SMDS_MeshNode *
	:param precision: default value is 0
	:type precision: double
	:rtype: bool
") isInside;
		const bool isInside (const SMDS_MeshNode * Node,const double precision = 0);
		%feature("autodoc", "	:param Node:
	:type Node: SMDS_MeshNode *
	:param Result:
	:type Result: std::list< SMDS_MeshNode *> *
	:param precision: default value is 0
	:type precision: double
	:rtype: None
") NodesAround;
		void NodesAround (const SMDS_MeshNode * Node,std::list<const SMDS_MeshNode *> * Result,const double precision = 0);
		%feature("autodoc", "	:param Node:
	:type Node: SMDS_MeshNode *
	:param dist2Nodes:
	:type dist2Nodes: std::map<double,  SMDS_MeshNode *> &
	:param precision:
	:type precision: double
	:rtype: bool
") NodesAround;
		bool NodesAround (const SMDS_MeshNode * Node,std::map<double, const SMDS_MeshNode *> & dist2Nodes,double precision);
		%feature("autodoc", "	:param nodes:
	:type nodes: std::set< SMDS_MeshNode *> *
	:param theTolerance:
	:type theTolerance: double
	:param theGroupsOfNodes:
	:type theGroupsOfNodes: std::list< std::list<  SMDS_MeshNode *> > *
	:rtype: None
") FindCoincidentNodes;
		void FindCoincidentNodes (std::set<const SMDS_MeshNode *> * nodes,const double theTolerance,std::list< std::list< const SMDS_MeshNode *> > * theGroupsOfNodes);
		%feature("autodoc", "	:param nodes:
	:type nodes: std::set< SMDS_MeshNode *> &
	:param theGroupsOfNodes:
	:type theGroupsOfNodes: std::list< std::list<  SMDS_MeshNode *> > *
	:param theTolerance: default value is 0.00001
	:type theTolerance: double
	:param maxLevel: default value is -1
	:type maxLevel: int
	:param maxNbNodes: default value is 5
	:type maxNbNodes: int
	:rtype: void
") FindCoincidentNodes;
		static void FindCoincidentNodes (std::set<const SMDS_MeshNode *> & nodes,std::list< std::list< const SMDS_MeshNode *> > * theGroupsOfNodes,const double theTolerance = 0.00001,const int maxLevel = -1,const int maxNbNodes = 5);
		%feature("autodoc", "	* /*! * \brief Update data according to node movement */

	:param node:
	:type node: SMDS_MeshNode *
	:param toPnt:
	:type toPnt: gp_Pnt
	:rtype: None
") UpdateByMoveNode;
		void UpdateByMoveNode (const SMDS_MeshNode * node,const gp_Pnt & toPnt);
		%feature("autodoc", "	* /*! * \brief Return iterator over children */

	:rtype: SMESH_OctreeNodeIteratorPtr
") GetChildrenIterator;
		SMESH_OctreeNodeIteratorPtr GetChildrenIterator ();
		%feature("autodoc", "	* /*! * \brief Return nodes iterator */

	:rtype: SMDS_NodeIteratorPtr
") GetNodeIterator;
		SMDS_NodeIteratorPtr GetNodeIterator ();
		%feature("autodoc", "	* /*! * \brief Return nb nodes in a tree */

	:rtype: int
") NbNodes;
		int NbNodes ();
};


%feature("shadow") SMESH_OctreeNode::~SMESH_OctreeNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend SMESH_OctreeNode {
	void _kill_pointed() {
		delete $self;
	}
};
