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
%module (package="OCC") StdMeshers

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


%include StdMeshers_headers.i


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
typedef std::map<TNode , TNodeColumn> TNode2ColumnMap;
typedef std::map<double , TNodeColumn> TParam2ColumnMap;
typedef TopTools_IndexedMapOfOrientedShape TBlockShapes;
typedef uvPtStruct UVPtStruct;
typedef double Pt3[3];
typedef boost::shared_ptr<uvPtStruct> UVPtStructPtr;
typedef std::vector<StdMeshers_FaceSidePtr> TSideVector;
typedef boost::shared_ptr<SMESH_ComputeError> TError;
typedef std::map<double , TNodeColumn>::const_iterator TParam2ColumnIt;
typedef boost::shared_ptr<StdMeshers_FaceSide> StdMeshers_FaceSidePtr;
typedef std::vector <const SMDS_MeshNode *> TNodeColumn;
/* end typedefs declaration */

/* public enums */
enum TSideID {
	BOTTOM_SIDE = 0,
	RIGHT_SIDE = 1,
	TOP_SIDE = 2,
	LEFT_SIDE = 3,
	NB_SIDES = 4,
};

/* end public enums declaration */

%nodefaultctor StdMeshers_Arithmetic1D;
class StdMeshers_Arithmetic1D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_Arithmetic1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Arithmetic1D;
		 StdMeshers_Arithmetic1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	:param length:
	:type length: double
	:param isStartLength:
	:type isStartLength: bool
	:rtype: None
") SetLength;
		void SetLength (double length,bool isStartLength);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	:param isStartLength:
	:type isStartLength: bool
	:rtype: double
") GetLength;
		double GetLength (bool isStartLength);
		%feature("compactdefaultargs") SetReversedEdges;
		%feature("autodoc", "	:param ids:
	:type ids: std::vector<int> &
	:rtype: None
") SetReversedEdges;
		void SetReversedEdges (std::vector<int> & ids);
		%feature("compactdefaultargs") SetObjectEntry;
		%feature("autodoc", "	:param entry:
	:type entry: char *
	:rtype: None
") SetObjectEntry;
		void SetObjectEntry (const char * entry);
		%feature("compactdefaultargs") GetObjectEntry;
		%feature("autodoc", "	:rtype: char *
") GetObjectEntry;
		const char * GetObjectEntry ();
		%feature("compactdefaultargs") GetReversedEdges;
		%feature("autodoc", "	:rtype: std::vector<int>
") GetReversedEdges;
		const std::vector<int> & GetReversedEdges ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize start and end length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_Arithmetic1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_AutomaticLength;
class StdMeshers_AutomaticLength : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_AutomaticLength;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_AutomaticLength;
		 StdMeshers_AutomaticLength (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	* /*! * \brief Computes segment for a given edge */

	:param aMesh:
	:type aMesh: SMESH_Mesh *
	:param anEdge:
	:type anEdge: TopoDS_Shape &
	:rtype: double
") GetLength;
		double GetLength (const SMESH_Mesh * aMesh,const TopoDS_Shape & anEdge);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	* /*! * \brief Computes segment length for an edge of given length */

	:param aMesh:
	:type aMesh: SMESH_Mesh *
	:param edgeLength:
	:type edgeLength: double
	:rtype: double
") GetLength;
		double GetLength (const SMESH_Mesh * aMesh,const double edgeLength);
		%feature("compactdefaultargs") SetFineness;
		%feature("autodoc", "	* /*! * \brief Set Fineness * \param theFineness - The Fineness value [0.0-1.0], * 0 - coarse mesh * 1 - fine mesh * * Raise if theFineness is out of range * The 'Initial Number of Elements on the Shortest Edge' (S0) * is divided by (0.5 + 4.5 x theFineness) */

	:param theFineness:
	:type theFineness: double
	:rtype: None
") SetFineness;
		void SetFineness (double theFineness);
		%feature("compactdefaultargs") GetFineness;
		%feature("autodoc", "	* /*! * \brief Return mesh Fineness * etval double - Fineness value [0.0-1.0] */

	:rtype: double
") GetFineness;
		double GetFineness ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize Fineness by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_AutomaticLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_CompositeHexa_3D;
class StdMeshers_CompositeHexa_3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_CompositeHexa_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_CompositeHexa_3D;
		 StdMeshers_CompositeHexa_3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
};


%extend StdMeshers_CompositeHexa_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Deflection1D;
class StdMeshers_Deflection1D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_Deflection1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Deflection1D;
		 StdMeshers_Deflection1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	:param value:
	:type value: double
	:rtype: None
") SetDeflection;
		void SetDeflection (double value);
		%feature("compactdefaultargs") GetDeflection;
		%feature("autodoc", "	:rtype: double
") GetDeflection;
		double GetDeflection ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize deflection value by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_Deflection1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_FaceSide;
class StdMeshers_FaceSide {
	public:
		%feature("compactdefaultargs") StdMeshers_FaceSide;
		%feature("autodoc", "	* /*! * \brief Wrap one edge */

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theIsForward:
	:type theIsForward: bool
	:param theIgnoreMediumNodes:
	:type theIgnoreMediumNodes: bool
	:rtype: None
") StdMeshers_FaceSide;
		 StdMeshers_FaceSide (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,SMESH_Mesh * theMesh,const bool theIsForward,const bool theIgnoreMediumNodes);
		%feature("compactdefaultargs") StdMeshers_FaceSide;
		%feature("autodoc", "	* /*! * \brief Wrap several edges. Edges must be properly ordered and oriented. */

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdges:
	:type theEdges: std::list<TopoDS_Edge> &
	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theIsForward:
	:type theIsForward: bool
	:param theIgnoreMediumNodes:
	:type theIgnoreMediumNodes: bool
	:rtype: None
") StdMeshers_FaceSide;
		 StdMeshers_FaceSide (const TopoDS_Face & theFace,std::list<TopoDS_Edge> & theEdges,SMESH_Mesh * theMesh,const bool theIsForward,const bool theIgnoreMediumNodes);
		%feature("compactdefaultargs") StdMeshers_FaceSide;
		%feature("autodoc", "	* /*! * \brief Wrap for vertex using data from other FaceSide */

	:param theNode:
	:type theNode: SMDS_MeshNode *
	:param thePnt2d:
	:type thePnt2d: gp_Pnt2d
	:param theSide:
	:type theSide: StdMeshers_FaceSide *
	:rtype: None
") StdMeshers_FaceSide;
		 StdMeshers_FaceSide (const SMDS_MeshNode * theNode,const gp_Pnt2d thePnt2d,const StdMeshers_FaceSide * theSide);
		%feature("compactdefaultargs") GetFaceWires;
		%feature("autodoc", "	* /*! * \brief Return wires of a face as StdMeshers_FaceSide's */

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theMesh:
	:type theMesh: SMESH_Mesh &
	:param theIgnoreMediumNodes:
	:type theIgnoreMediumNodes: bool
	:param theError:
	:type theError: TError &
	:rtype: TSideVector
") GetFaceWires;
		static TSideVector GetFaceWires (const TopoDS_Face & theFace,SMESH_Mesh & theMesh,const bool theIgnoreMediumNodes,TError & theError);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* /*! * \brief Change orientation of side geometry */

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* /*! * \brief Return nb nodes on edges and vertices (+1 to be == GetUVPtStruct().size() ) */

	:rtype: int
") NbPoints;
		int NbPoints ();
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* /*! * \brief Return nb edges */

	:rtype: int
") NbSegments;
		int NbSegments ();
		%feature("compactdefaultargs") GetMesh;
		%feature("autodoc", "	* /*! * \brief Return mesh */

	:rtype: SMESH_Mesh *
") GetMesh;
		SMESH_Mesh * GetMesh ();
		%feature("compactdefaultargs") MissVertexNode;
		%feature("autodoc", "	* /*! * \brief Return true if there vertices without nodes */

	:rtype: bool
") MissVertexNode;
		bool MissVertexNode ();
		%feature("compactdefaultargs") GetUVPtStruct;
		%feature("autodoc", "	* /*! * \brief Return detailed data on nodes * \param isXConst - true if normalized parameter X is constant * \param constValue - constant parameter value * * Missing nodes are allowed only on internal vertices */

	:param isXConst: default value is 0
	:type isXConst: bool
	:param constValue: default value is 0
	:type constValue: double
	:rtype: std::vector<UVPtStruct>
") GetUVPtStruct;
		const std::vector<UVPtStruct> & GetUVPtStruct (bool isXConst = 0,double constValue = 0);
		%feature("compactdefaultargs") SimulateUVPtStruct;
		%feature("autodoc", "	* /*! * \brief Simulates detailed data on nodes * \param isXConst - true if normalized parameter X is constant * \param constValue - constant parameter value */

	:param nbSeg:
	:type nbSeg: int
	:param isXConst: default value is 0
	:type isXConst: bool
	:param constValue: default value is 0
	:type constValue: double
	:rtype: std::vector<UVPtStruct>
") SimulateUVPtStruct;
		const std::vector<UVPtStruct> & SimulateUVPtStruct (int nbSeg,bool isXConst = 0,double constValue = 0);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* /*! * \brief Return edge and parameter on edge by normalized parameter */

	:param U:
	:type U: double
	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: inline double
") Parameter;
		inline double Parameter (double U,TopoDS_Edge & edge);
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "	* /*! * \brief Return UV by normalized parameter */

	:param U:
	:type U: double
	:rtype: gp_Pnt2d
") Value2d;
		gp_Pnt2d Value2d (double U);
		%feature("compactdefaultargs") GetCurve2d;
		%feature("autodoc", "	* /*! * \brief Creates a Adaptor2d_Curve2d to be used in SMESH_Block */

	:rtype: Adaptor2d_Curve2d *
") GetCurve2d;
		Adaptor2d_Curve2d * GetCurve2d ();
		%feature("compactdefaultargs") GetCurve3d;
		%feature("autodoc", "	* /*! * \brief Creates a fully functional Adaptor_Curve */

	:rtype: BRepAdaptor_CompCurve *
") GetCurve3d;
		BRepAdaptor_CompCurve * GetCurve3d ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	* /*! * \brief Return nb of wrapped edges */

	:rtype: int
") NbEdges;
		int NbEdges ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* /*! * \brief Return i-th wrapped edge (count starts from zero) */

	:param i:
	:type i: int
	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge (int i);
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	* /*! * \brief Return 1st vertex of the i-the edge (count starts from zero) */

	:param i: default value is 0
	:type i: int
	:rtype: inline TopoDS_Vertex
") FirstVertex;
		inline TopoDS_Vertex FirstVertex (int i = 0);
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "	* /*! * \brief Return last vertex of the i-the edge (count starts from zero) */

	:param i: default value is -1
	:type i: int
	:rtype: inline TopoDS_Vertex
") LastVertex;
		inline TopoDS_Vertex LastVertex (int i = -1);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* /*! * \brief Return first normalized parameter of the i-the edge (count starts from zero) */

	:param i:
	:type i: int
	:rtype: inline double
") FirstParameter;
		inline double FirstParameter (int i);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* /*! * \brief Return ast normalized parameter of the i-the edge (count starts from zero) */

	:param i:
	:type i: int
	:rtype: inline double
") LastParameter;
		inline double LastParameter (int i);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	* /*! * \brief Return side length */

	:rtype: double
") Length;
		double Length ();
		%feature("compactdefaultargs") EdgeIndex;
		%feature("autodoc", "	* /*! * \brief Return edge index corresponding to normalized parameter */

	:param U:
	:type U: double
	:rtype: inline int
") EdgeIndex;
		inline int EdgeIndex (double U);
		%feature("compactdefaultargs") dump;
		%feature("autodoc", "	:param msg: default value is 0
	:type msg: char *
	:rtype: None
") dump;
		void dump (const char * msg = 0);
};


%extend StdMeshers_FaceSide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_FixedPoints1D;
class StdMeshers_FixedPoints1D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_FixedPoints1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_FixedPoints1D;
		 StdMeshers_FixedPoints1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "	:param listParams:
	:type listParams: std::vector<double> &
	:rtype: None
") SetPoints;
		void SetPoints (std::vector<double> & listParams);
		%feature("compactdefaultargs") SetNbSegments;
		%feature("autodoc", "	:param listNbSeg:
	:type listNbSeg: std::vector<int> &
	:rtype: None
") SetNbSegments;
		void SetNbSegments (std::vector<int> & listNbSeg);
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "	:rtype: std::vector<double>
") GetPoints;
		const std::vector<double> & GetPoints ();
		%feature("compactdefaultargs") GetNbSegments;
		%feature("autodoc", "	:rtype: std::vector<int>
") GetNbSegments;
		const std::vector<int> & GetNbSegments ();
		%feature("compactdefaultargs") SetReversedEdges;
		%feature("autodoc", "	:param ids:
	:type ids: std::vector<int> &
	:rtype: None
") SetReversedEdges;
		void SetReversedEdges (std::vector<int> & ids);
		%feature("compactdefaultargs") SetObjectEntry;
		%feature("autodoc", "	:param entry:
	:type entry: char *
	:rtype: None
") SetObjectEntry;
		void SetObjectEntry (const char * entry);
		%feature("compactdefaultargs") GetObjectEntry;
		%feature("autodoc", "	:rtype: char *
") GetObjectEntry;
		const char * GetObjectEntry ();
		%feature("compactdefaultargs") GetReversedEdges;
		%feature("autodoc", "	:rtype: std::vector<int>
") GetReversedEdges;
		const std::vector<int> & GetReversedEdges ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize start and end length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_FixedPoints1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Hexa_3D;
class StdMeshers_Hexa_3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Hexa_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Hexa_3D;
		 StdMeshers_Hexa_3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") OppositeVertex;
		%feature("autodoc", "	:param aVertex:
	:type aVertex: TopoDS_Vertex &
	:param aQuads0Vertices:
	:type aQuads0Vertices: TopTools_IndexedMapOfShape &
	:param aQuads:
	:type aQuads: FaceQuadStruct *
	:rtype: TopoDS_Vertex
") OppositeVertex;
		static TopoDS_Vertex OppositeVertex (const TopoDS_Vertex & aVertex,const TopTools_IndexedMapOfShape & aQuads0Vertices,FaceQuadStruct * aQuads[6]);
};


%extend StdMeshers_Hexa_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_LayerDistribution;
class StdMeshers_LayerDistribution : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_LayerDistribution;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_LayerDistribution;
		 StdMeshers_LayerDistribution (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetLayerDistribution;
		%feature("autodoc", "	* /*! * \brief Sets 1D hypothesis specifying distribution of layers * \param hyp1D - 1D hypothesis */

	:param hyp1D:
	:type hyp1D: SMESH_Hypothesis *
	:rtype: None
") SetLayerDistribution;
		void SetLayerDistribution (SMESH_Hypothesis * hyp1D);
		%feature("compactdefaultargs") GetLayerDistribution;
		%feature("autodoc", "	* /*! * \brief Returns 1D hypothesis specifying distribution of layers * etval SMESH::SMESH_Hypothesis_ptr - 1D hypothesis */

	:rtype: SMESH_Hypothesis *
") GetLayerDistribution;
		SMESH_Hypothesis * GetLayerDistribution ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize parameters by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Implementation does noting */

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
};


%extend StdMeshers_LayerDistribution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_LengthFromEdges;
class StdMeshers_LengthFromEdges : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_LengthFromEdges;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_LengthFromEdges;
		 StdMeshers_LengthFromEdges (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	:param mode:
	:type mode: int
	:rtype: None
") SetMode;
		void SetMode (int mode);
		%feature("compactdefaultargs") GetMode;
		%feature("autodoc", "	:rtype: int
") GetMode;
		int GetMode ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Just return false as this hypothesis does not have parameters values */

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
};


%extend StdMeshers_LengthFromEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_LocalLength;
class StdMeshers_LocalLength : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_LocalLength;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_LocalLength;
		 StdMeshers_LocalLength (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	:param length:
	:type length: double
	:rtype: None
") SetLength;
		void SetLength (double length);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	:param precision:
	:type precision: double
	:rtype: None
") SetPrecision;
		void SetPrecision (double precision);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	:rtype: double
") GetLength;
		double GetLength ();
		%feature("compactdefaultargs") GetPrecision;
		%feature("autodoc", "	:rtype: double
") GetPrecision;
		double GetPrecision ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize segment length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_LocalLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_MEFISTO_2D;
class StdMeshers_MEFISTO_2D : public SMESH_2D_Algo {
	public:
typedef boost::shared_ptr<StdMeshers_FaceSide> StdMeshers_FaceSidePtr;
typedef std::vector<StdMeshers_FaceSidePtr> TWireVector;
		%feature("compactdefaultargs") StdMeshers_MEFISTO_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_MEFISTO_2D;
		 StdMeshers_MEFISTO_2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") LoadPoints;
		%feature("autodoc", "	:param wires:
	:type wires: StdMeshers_MEFISTO_2D::TWireVector &
	:param uvslf:
	:type uvslf: R2 *
	:param mefistoToDS:
	:type mefistoToDS: std::vector<  SMDS_MeshNode *> &
	:param scalex:
	:type scalex: double
	:param scaley:
	:type scaley: double
	:rtype: bool
") LoadPoints;
		bool LoadPoints (StdMeshers_MEFISTO_2D::TWireVector & wires,R2 * uvslf,std::vector< const SMDS_MeshNode *> & mefistoToDS,double scalex,double scaley);
		%feature("compactdefaultargs") ComputeScaleOnFace;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aFace:
	:type aFace: TopoDS_Face &
	:param scalex:
	:type scalex: double &
	:param scaley:
	:type scaley: double &
	:rtype: None
") ComputeScaleOnFace;
		void ComputeScaleOnFace (SMESH_Mesh & aMesh,const TopoDS_Face & aFace,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") StoreResult;
		%feature("autodoc", "	:param nbst:
	:type nbst: Z
	:param uvst:
	:type uvst: R2 *
	:param nbt:
	:type nbt: Z
	:param nust:
	:type nust: Z *
	:param mefistoToDS:
	:type mefistoToDS: std::vector<  SMDS_MeshNode *> &
	:param scalex:
	:type scalex: double
	:param scaley:
	:type scaley: double
	:rtype: None
") StoreResult;
		void StoreResult (Z nbst,R2 * uvst,Z nbt,Z * nust,std::vector< const SMDS_MeshNode *> & mefistoToDS,double scalex,double scaley);
};


%extend StdMeshers_MEFISTO_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_MaxElementArea;
class StdMeshers_MaxElementArea : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_MaxElementArea;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_MaxElementArea;
		 StdMeshers_MaxElementArea (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetMaxArea;
		%feature("autodoc", "	:param maxArea:
	:type maxArea: double
	:rtype: None
") SetMaxArea;
		void SetMaxArea (double maxArea);
		%feature("compactdefaultargs") GetMaxArea;
		%feature("autodoc", "	:rtype: double
") GetMaxArea;
		double GetMaxArea ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize maximal area by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_MaxElementArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_MaxElementVolume;
class StdMeshers_MaxElementVolume : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_MaxElementVolume;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_MaxElementVolume;
		 StdMeshers_MaxElementVolume (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetMaxVolume;
		%feature("autodoc", "	:param maxVolume:
	:type maxVolume: double
	:rtype: None
") SetMaxVolume;
		void SetMaxVolume (double maxVolume);
		%feature("compactdefaultargs") GetMaxVolume;
		%feature("autodoc", "	:rtype: double
") GetMaxVolume;
		double GetMaxVolume ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize maximal volume by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_MaxElementVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_MaxLength;
class StdMeshers_MaxLength : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_MaxLength;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_MaxLength;
		 StdMeshers_MaxLength (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	:param length:
	:type length: double
	:rtype: None
") SetLength;
		void SetLength (double length);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	:rtype: double
") GetLength;
		double GetLength ();
		%feature("compactdefaultargs") HavePreestimatedLength;
		%feature("autodoc", "	:rtype: bool
") HavePreestimatedLength;
		bool HavePreestimatedLength ();
		%feature("compactdefaultargs") GetPreestimatedLength;
		%feature("autodoc", "	:rtype: double
") GetPreestimatedLength;
		double GetPreestimatedLength ();
		%feature("compactdefaultargs") SetPreestimatedLength;
		%feature("autodoc", "	:param length:
	:type length: double
	:rtype: None
") SetPreestimatedLength;
		void SetPreestimatedLength (double length);
		%feature("compactdefaultargs") SetUsePreestimatedLength;
		%feature("autodoc", "	:param toUse:
	:type toUse: bool
	:rtype: None
") SetUsePreestimatedLength;
		void SetUsePreestimatedLength (bool toUse);
		%feature("compactdefaultargs") GetUsePreestimatedLength;
		%feature("autodoc", "	:rtype: bool
") GetUsePreestimatedLength;
		bool GetUsePreestimatedLength ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize segment length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_MaxLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_NotConformAllowed;
class StdMeshers_NotConformAllowed : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_NotConformAllowed;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_NotConformAllowed;
		 StdMeshers_NotConformAllowed (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Just return false as this hypothesis does not have parameters values */

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
};


%extend StdMeshers_NotConformAllowed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_NumberOfLayers;
class StdMeshers_NumberOfLayers : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_NumberOfLayers;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_NumberOfLayers;
		 StdMeshers_NumberOfLayers (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetNumberOfLayers;
		%feature("autodoc", "	:param numberOfLayers:
	:type numberOfLayers: int
	:rtype: None
") SetNumberOfLayers;
		void SetNumberOfLayers (int numberOfLayers);
		%feature("compactdefaultargs") GetNumberOfLayers;
		%feature("autodoc", "	:rtype: int
") GetNumberOfLayers;
		int GetNumberOfLayers ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize parameters by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Implementation does noting */

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
};


%extend StdMeshers_NumberOfLayers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_NumberOfSegments;
class StdMeshers_NumberOfSegments : public SMESH_Hypothesis {
	public:
/* public enums */
enum DistrType {
	DT_Regular = 0,
	DT_Scale = 1,
	DT_TabFunc = 2,
	DT_ExprFunc = 3,
};

/* end public enums declaration */

		%feature("compactdefaultargs") StdMeshers_NumberOfSegments;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_NumberOfSegments;
		 StdMeshers_NumberOfSegments (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") BuildDistributionExpr;
		%feature("autodoc", "	:param :
	:type : char *
	:param :
	:type : int
	:param :
	:type : int
	:rtype: std::vector<double>
") BuildDistributionExpr;
		const std::vector<double> & BuildDistributionExpr (const char * ,int ,int );
		%feature("compactdefaultargs") BuildDistributionTab;
		%feature("autodoc", "	:param &:
	:type &: std::vector<double>
	:param :
	:type : int
	:param :
	:type : int
	:rtype: std::vector<double>
") BuildDistributionTab;
		const std::vector<double> & BuildDistributionTab (const std::vector<double> &,int ,int );
		%feature("compactdefaultargs") SetNumberOfSegments;
		%feature("autodoc", "	* /*! * \brief Set the number of segments * \param segmentsNumber - must be greater than zero */

	:param segmentsNumber:
	:type segmentsNumber: int
	:rtype: None
") SetNumberOfSegments;
		void SetNumberOfSegments (int segmentsNumber);
		%feature("compactdefaultargs") GetNumberOfSegments;
		%feature("autodoc", "	* /*! * \brief Get the number of segments */

	:rtype: int
") GetNumberOfSegments;
		int GetNumberOfSegments ();
		%feature("compactdefaultargs") SetDistrType;
		%feature("autodoc", "	* /*! * \brief Set distribution type */

	:param typ:
	:type typ: StdMeshers_NumberOfSegments::DistrType
	:rtype: None
") SetDistrType;
		void SetDistrType (StdMeshers_NumberOfSegments::DistrType typ);
		%feature("compactdefaultargs") GetDistrType;
		%feature("autodoc", "	* /*! * \brief Get distribution type */

	:rtype: StdMeshers_NumberOfSegments::DistrType
") GetDistrType;
		StdMeshers_NumberOfSegments::DistrType GetDistrType ();
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "	* /*! * \brief Set scale factor for scale distribution * \param scaleFactor - positive value different from 1 * * Throws SALOME_Exception if distribution type is not DT_Scale, * or scaleFactor is not a positive value different from 1 */

	:param scaleFactor:
	:type scaleFactor: double
	:rtype: None
") SetScaleFactor;
		void SetScaleFactor (double scaleFactor);
		%feature("compactdefaultargs") GetScaleFactor;
		%feature("autodoc", "	* /*! * \brief Get scale factor for scale distribution * * Throws SALOME_Exception if distribution type is not DT_Scale */

	:rtype: double
") GetScaleFactor;
		double GetScaleFactor ();
		%feature("compactdefaultargs") SetTableFunction;
		%feature("autodoc", "	* /*! * \brief Set table function for distribution DT_TabFunc * \param table - this vector contains the pairs (parameter, value) * following each by other, so the number of elements in the vector * must be even. The parameters must be in range [0,1] and sorted in * increase order. The values of function must be positive. * * Throws SALOME_Exception if distribution type is not DT_TabFunc */

	:param table:
	:type table: std::vector<double> &
	:rtype: None
") SetTableFunction;
		void SetTableFunction (const std::vector<double> & table);
		%feature("compactdefaultargs") GetTableFunction;
		%feature("autodoc", "	* /*! * \brief Get table function for distribution DT_TabFunc * * Throws SALOME_Exception if distribution type is not DT_TabFunc */

	:rtype: std::vector<double>
") GetTableFunction;
		const std::vector<double> & GetTableFunction ();
		%feature("compactdefaultargs") SetExpressionFunction;
		%feature("autodoc", "	* /*! * \brief Set expression function for distribution DT_ExprFunc * \param expr - string containing the expression of the function * f(t), e.g. 'sin(t)' * * Throws SALOME_Exception if distribution type is not DT_ExprFunc */

	:param expr:
	:type expr: char *
	:rtype: None
") SetExpressionFunction;
		void SetExpressionFunction (const char * expr);
		%feature("compactdefaultargs") GetExpressionFunction;
		%feature("autodoc", "	* /*! * \brief Get expression function for distribution DT_ExprFunc * * Throws SALOME_Exception if distribution type is not DT_ExprFunc */

	:rtype: char *
") GetExpressionFunction;
		const char * GetExpressionFunction ();
		%feature("compactdefaultargs") SetConversionMode;
		%feature("autodoc", "	* /*! * \brief Set conversion mode. When it is 0, it means 'exponent mode': * the function of distribution of density is used as an exponent of 10, i,e, 10^f(t). * When it is 1, it means 'cut negative mode'. The function of distribution is used as * F(t), where F(t0)=f(t0), if f(t0)>=0, otherwise F(t0) = 0. * This mode is sensible only when function distribution is used (DT_TabFunc or DT_ExprFunc) * * Throws SALOME_Exception if distribution type is not functional */

	:param conv:
	:type conv: int
	:rtype: None
") SetConversionMode;
		void SetConversionMode (int conv);
		%feature("compactdefaultargs") ConversionMode;
		%feature("autodoc", "	* /*! * \brief Returns conversion mode * * Throws SALOME_Exception if distribution type is not functional */

	:rtype: int
") ConversionMode;
		int ConversionMode ();
		%feature("compactdefaultargs") SetReversedEdges;
		%feature("autodoc", "	:param ids:
	:type ids: std::vector<int> &
	:rtype: None
") SetReversedEdges;
		void SetReversedEdges (std::vector<int> & ids);
		%feature("compactdefaultargs") SetObjectEntry;
		%feature("autodoc", "	:param entry:
	:type entry: char *
	:rtype: None
") SetObjectEntry;
		void SetObjectEntry (const char * entry);
		%feature("compactdefaultargs") GetObjectEntry;
		%feature("autodoc", "	:rtype: char *
") GetObjectEntry;
		const char * GetObjectEntry ();
		%feature("compactdefaultargs") GetReversedEdges;
		%feature("autodoc", "	:rtype: std::vector<int>
") GetReversedEdges;
		const std::vector<int> & GetReversedEdges ();
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize number of segments by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
};


%extend StdMeshers_NumberOfSegments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_PrismAsBlock;
class StdMeshers_PrismAsBlock : public SMESH_Block {
	public:
		%feature("compactdefaultargs") StdMeshers_PrismAsBlock;
		%feature("autodoc", "	* /*! * \brief Constructor. Initialization is needed */

	:rtype: None
") StdMeshers_PrismAsBlock;
		 StdMeshers_PrismAsBlock ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* /*! * \brief Initialization. * \param helper - helper loaded with mesh and 3D shape * \param shape3D - a closed shell or solid * etval bool - false if a mesh or a shape are KO * * Analyse shape geometry and mesh. * If there are triangles on one of faces, it becomes 'bottom' */

	:param helper:
	:type helper: SMESH_MesherHelper *
	:param shape3D:
	:type shape3D: TopoDS_Shape &
	:rtype: bool
") Init;
		bool Init (SMESH_MesherHelper * helper,const TopoDS_Shape & shape3D);
		%feature("compactdefaultargs") GetError;
		%feature("autodoc", "	* /*! * \brief Return problem description */

	:rtype: SMESH_ComputeErrorPtr
") GetError;
		SMESH_ComputeErrorPtr GetError ();
		%feature("compactdefaultargs") VerticalSize;
		%feature("autodoc", "	* /*! * \brief Return number of nodes on every vertical edge * etval int - number of nodes including end nodes */

	:rtype: int
") VerticalSize;
		int VerticalSize ();
		%feature("compactdefaultargs") HasNotQuadElemOnTop;
		%feature("autodoc", "	:rtype: bool
") HasNotQuadElemOnTop;
		bool HasNotQuadElemOnTop ();
		%feature("compactdefaultargs") GetNodeColumn;
		%feature("autodoc", "	* /*! * \brief Return pointer to column of nodes * \param node - bottom node from which the returned column goes up * etval const TNodeColumn* - the found column */

	:param node:
	:type node: SMDS_MeshNode *
	:rtype: TNodeColumn *
") GetNodeColumn;
		const TNodeColumn * GetNodeColumn (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") GetParam2ColumnMap;
		%feature("autodoc", "	* /*! * \brief Return TParam2ColumnMap for a base edge * \param baseEdgeID - base edge SMESHDS Index * \param isReverse - columns in-block orientation * etval const TParam2ColumnMap& - map */

	:param baseEdgeID:
	:type baseEdgeID: int
	:param isReverse:
	:type isReverse: bool &
	:rtype: TParam2ColumnMap
") GetParam2ColumnMap;
		const TParam2ColumnMap & GetParam2ColumnMap (const int baseEdgeID,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Mesh;
		%feature("autodoc", "	* /*! * \brief Return pointer to mesh * etval SMESH_Mesh - mesh */

	:rtype: SMESH_Mesh *
") Mesh;
		SMESH_Mesh * Mesh ();
		%feature("compactdefaultargs") MeshDS;
		%feature("autodoc", "	* /*! * \brief Return pointer to mesh DS * etval SMESHDS_Mesh - mesh DS */

	:rtype: SMESHDS_Mesh *
") MeshDS;
		SMESHDS_Mesh * MeshDS ();
		%feature("compactdefaultargs") SubMesh;
		%feature("autodoc", "	* /*! * \brief Return submesh of a shape * \param shapeID - shape given by in-block index * etval SMESH_subMesh* - found submesh */

	:param shapeID:
	:type shapeID: int
	:rtype: SMESH_subMesh *
") SubMesh;
		SMESH_subMesh * SubMesh (const int shapeID);
		%feature("compactdefaultargs") SubMeshDS;
		%feature("autodoc", "	* /*! * \brief Return submesh DS of a shape * \param shapeID - shape given by in-block index * etval SMESHDS_SubMesh* - found submesh DS */

	:param shapeID:
	:type shapeID: int
	:rtype: SMESHDS_SubMesh *
") SubMeshDS;
		SMESHDS_SubMesh * SubMeshDS (const int shapeID);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* /*! * \brief Return a in-block shape * \param shapeID - shape given by in-block index * etval SMESHDS_SubMesh* - found submesh */

	:param shapeID:
	:type shapeID: int
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const int shapeID);
		%feature("compactdefaultargs") ShapeID;
		%feature("autodoc", "	* /*! * \brief Return in-block ID of a shape * \param shape - block subshape * etval int - ID or zero if the shape has no ID */

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: int
") ShapeID;
		int ShapeID (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") IsForwardEdge;
		%feature("autodoc", "	* /*! * \brief Check curve orientation of a bootom edge * \param meshDS - mesh DS * \param columnsMap - node columns map of side face * \param bottomEdge - the bootom edge * \param sideFaceID - side face in-block ID * etval bool - true if orienation coinside with in-block froward orienation */

	:param meshDS:
	:type meshDS: SMESHDS_Mesh *
	:param columnsMap:
	:type columnsMap: TParam2ColumnMap &
	:param bottomEdge:
	:type bottomEdge: TopoDS_Edge &
	:param sideFaceID:
	:type sideFaceID: int
	:rtype: bool
") IsForwardEdge;
		static bool IsForwardEdge (SMESHDS_Mesh * meshDS,const TParam2ColumnMap & columnsMap,const TopoDS_Edge & bottomEdge,const int sideFaceID);
		%feature("compactdefaultargs") GetWallFaces;
		%feature("autodoc", "	* /*! * \brief Find wall faces by bottom edges * \param mesh - the mesh * \param mainShape - the prism * \param bottomFace - the bottom face * \param bottomEdges - edges bounding the bottom face * \param wallFaces - faces list to fill in */

	:param mesh:
	:type mesh: SMESH_Mesh *
	:param mainShape:
	:type mainShape: TopoDS_Shape &
	:param bottomFace:
	:type bottomFace: TopoDS_Shape &
	:param bottomEdges:
	:type bottomEdges: std::list< TopoDS_Edge> &
	:param wallFaces:
	:type wallFaces: std::list< TopoDS_Face> &
	:rtype: bool
") GetWallFaces;
		static bool GetWallFaces (SMESH_Mesh * mesh,const TopoDS_Shape & mainShape,const TopoDS_Shape & bottomFace,const std::list< TopoDS_Edge> & bottomEdges,std::list< TopoDS_Face> & wallFaces);
};


%extend StdMeshers_PrismAsBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Prism_3D;
class StdMeshers_Prism_3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Prism_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Prism_3D;
		 StdMeshers_Prism_3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") ProjectTriangles;
		%feature("autodoc", "	* /*! * \brief Enable removal of quadrangles from the bottom face and * triangles creation there by projection from the top * (sole face meshed with triangles is considered to be a bottom one). * If there are two faces with triangles, triangles must * be of the same topology, else the algo fails. * The method must be called before Compute() */

	:rtype: None
") ProjectTriangles;
		void ProjectTriangles ();
		%feature("compactdefaultargs") AddPrisms;
		%feature("autodoc", "	* /*! * \brief Create prisms * \param nodeColumns - columns of nodes generated from nodes of a mesh face * \param helper - helper initialized by mesh and shape to add prisms to */

	:param nodeColumns:
	:type nodeColumns: std::vector< TNodeColumn *> &
	:param helper:
	:type helper: SMESH_MesherHelper *
	:rtype: void
") AddPrisms;
		static void AddPrisms (std::vector<const TNodeColumn *> & nodeColumns,SMESH_MesherHelper * helper);
};


%extend StdMeshers_Prism_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_ProjectionSource1D;
class StdMeshers_ProjectionSource1D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_ProjectionSource1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_ProjectionSource1D;
		 StdMeshers_ProjectionSource1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetSourceEdge;
		%feature("autodoc", "	* /*! * Sets source <edge> to take a mesh pattern from */

	:param edge:
	:type edge: TopoDS_Shape &
	:rtype: None
") SetSourceEdge;
		void SetSourceEdge (const TopoDS_Shape & edge);
		%feature("compactdefaultargs") GetSourceEdge;
		%feature("autodoc", "	* /*! * Returns the source edge or a group containing edges */

	:rtype: TopoDS_Shape
") GetSourceEdge;
		TopoDS_Shape GetSourceEdge ();
		%feature("compactdefaultargs") IsCompoundSource;
		%feature("autodoc", "	* /*! * Returns true the source edge is a group of edges */

	:rtype: bool
") IsCompoundSource;
		bool IsCompoundSource ();
		%feature("compactdefaultargs") SetSourceMesh;
		%feature("autodoc", "	* /*! * Sets source <mesh> to take a mesh pattern from */

	:param mesh:
	:type mesh: SMESH_Mesh *
	:rtype: None
") SetSourceMesh;
		void SetSourceMesh (SMESH_Mesh * mesh);
		%feature("compactdefaultargs") GetSourceMesh;
		%feature("autodoc", "	* /*! * Return source mesh */

	:rtype: SMESH_Mesh *
") GetSourceMesh;
		SMESH_Mesh * GetSourceMesh ();
		%feature("compactdefaultargs") SetVertexAssociation;
		%feature("autodoc", "	* /*! * Sets vertex association between the source edge and the target one. * This parameter is optional */

	:param sourceVertex:
	:type sourceVertex: TopoDS_Shape &
	:param targetVertex:
	:type targetVertex: TopoDS_Shape &
	:rtype: None
") SetVertexAssociation;
		void SetVertexAssociation (const TopoDS_Shape & sourceVertex,const TopoDS_Shape & targetVertex);
		%feature("compactdefaultargs") GetSourceVertex;
		%feature("autodoc", "	* /*! * Returns the vertex associated with the target vertex. * Result may be nil if association not set */

	:rtype: TopoDS_Vertex
") GetSourceVertex;
		TopoDS_Vertex GetSourceVertex ();
		%feature("compactdefaultargs") GetTargetVertex;
		%feature("autodoc", "	* /*! * Returns the vertex associated with the source vertex. * Result may be nil if association not set */

	:rtype: TopoDS_Vertex
") GetTargetVertex;
		TopoDS_Vertex GetTargetVertex ();
		%feature("compactdefaultargs") HasVertexAssociation;
		%feature("autodoc", "	* /*! * \brief Test if vertex association defined * etval bool - test result */

	:rtype: bool
") HasVertexAssociation;
		bool HasVertexAssociation ();
		%feature("compactdefaultargs") GetStoreParams;
		%feature("autodoc", "	* /*! * \brief Return all parameters */

	:param s1:
	:type s1: TopoDS_Shape &
	:param s2:
	:type s2: TopoDS_Shape &
	:param s3:
	:type s3: TopoDS_Shape &
	:rtype: None
") GetStoreParams;
		void GetStoreParams (TopoDS_Shape & s1,TopoDS_Shape & s2,TopoDS_Shape & s3);
		%feature("compactdefaultargs") RestoreParams;
		%feature("autodoc", "	* /*! * \brief Set all parameters without notifying on modification */

	:param s1:
	:type s1: TopoDS_Shape &
	:param s2:
	:type s2: TopoDS_Shape &
	:param s3:
	:type s3: TopoDS_Shape &
	:param mesh:
	:type mesh: SMESH_Mesh *
	:rtype: None
") RestoreParams;
		void RestoreParams (const TopoDS_Shape & s1,const TopoDS_Shape & s2,const TopoDS_Shape & s3,SMESH_Mesh * mesh);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize parameters by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Implementation does noting */

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
};


%extend StdMeshers_ProjectionSource1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_ProjectionSource2D;
class StdMeshers_ProjectionSource2D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_ProjectionSource2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_ProjectionSource2D;
		 StdMeshers_ProjectionSource2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetSourceFace;
		%feature("autodoc", "	* /*! * Sets a source <face> to take a mesh pattern from */

	:param face:
	:type face: TopoDS_Shape &
	:rtype: None
") SetSourceFace;
		void SetSourceFace (const TopoDS_Shape & face);
		%feature("compactdefaultargs") GetSourceFace;
		%feature("autodoc", "	* /*! * Returns the source face or a group containing faces */

	:rtype: TopoDS_Shape
") GetSourceFace;
		TopoDS_Shape GetSourceFace ();
		%feature("compactdefaultargs") IsCompoundSource;
		%feature("autodoc", "	* /*! * Returns true the source face is a group of faces */

	:rtype: bool
") IsCompoundSource;
		bool IsCompoundSource ();
		%feature("compactdefaultargs") SetSourceMesh;
		%feature("autodoc", "	* /*! * Sets source <mesh> to take a mesh pattern from */

	:param mesh:
	:type mesh: SMESH_Mesh *
	:rtype: None
") SetSourceMesh;
		void SetSourceMesh (SMESH_Mesh * mesh);
		%feature("compactdefaultargs") GetSourceMesh;
		%feature("autodoc", "	* /*! * Return source mesh */

	:rtype: SMESH_Mesh *
") GetSourceMesh;
		SMESH_Mesh * GetSourceMesh ();
		%feature("compactdefaultargs") SetVertexAssociation;
		%feature("autodoc", "	* /*! * Sets vertex association between the source face and the target one. * This parameter is optional. * Two vertices must belong to one edge of a face */

	:param sourceVertex1:
	:type sourceVertex1: TopoDS_Shape &
	:param sourceVertex2:
	:type sourceVertex2: TopoDS_Shape &
	:param targetVertex1:
	:type targetVertex1: TopoDS_Shape &
	:param targetVertex2:
	:type targetVertex2: TopoDS_Shape &
	:rtype: None
") SetVertexAssociation;
		void SetVertexAssociation (const TopoDS_Shape & sourceVertex1,const TopoDS_Shape & sourceVertex2,const TopoDS_Shape & targetVertex1,const TopoDS_Shape & targetVertex2);
		%feature("compactdefaultargs") GetSourceVertex;
		%feature("autodoc", "	* /*! * Returns the <i>-th source vertex associated with the <i>-th target vertex. * Result may be nil if association not set. * Valid indices are 1 and 2 */

	:param i:
	:type i: int
	:rtype: TopoDS_Vertex
") GetSourceVertex;
		TopoDS_Vertex GetSourceVertex (int i);
		%feature("compactdefaultargs") GetTargetVertex;
		%feature("autodoc", "	* /*! * Returns the <i>-th target vertex associated with the <i>-th source vertex. * Result may be nil if association not set. * Valid indices are 1 and 2 */

	:param i:
	:type i: int
	:rtype: TopoDS_Vertex
") GetTargetVertex;
		TopoDS_Vertex GetTargetVertex (int i);
		%feature("compactdefaultargs") HasVertexAssociation;
		%feature("autodoc", "	* /*! * \brief Test if vertex association defined * etval bool - test result */

	:rtype: bool
") HasVertexAssociation;
		bool HasVertexAssociation ();
		%feature("compactdefaultargs") GetStoreParams;
		%feature("autodoc", "	* /*! * \brief Return all parameters */

	:param s1:
	:type s1: TopoDS_Shape &
	:param s2:
	:type s2: TopoDS_Shape &
	:param s3:
	:type s3: TopoDS_Shape &
	:param s4:
	:type s4: TopoDS_Shape &
	:param s5:
	:type s5: TopoDS_Shape &
	:rtype: None
") GetStoreParams;
		void GetStoreParams (TopoDS_Shape & s1,TopoDS_Shape & s2,TopoDS_Shape & s3,TopoDS_Shape & s4,TopoDS_Shape & s5);
		%feature("compactdefaultargs") RestoreParams;
		%feature("autodoc", "	* /*! * \brief Set all parameters without notifying on modification */

	:param s1:
	:type s1: TopoDS_Shape &
	:param s2:
	:type s2: TopoDS_Shape &
	:param s3:
	:type s3: TopoDS_Shape &
	:param s4:
	:type s4: TopoDS_Shape &
	:param s5:
	:type s5: TopoDS_Shape &
	:param mesh:
	:type mesh: SMESH_Mesh *
	:rtype: None
") RestoreParams;
		void RestoreParams (const TopoDS_Shape & s1,const TopoDS_Shape & s2,const TopoDS_Shape & s3,const TopoDS_Shape & s4,const TopoDS_Shape & s5,SMESH_Mesh * mesh);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize parameters by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Implementation does noting */

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
};


%extend StdMeshers_ProjectionSource2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_ProjectionSource3D;
class StdMeshers_ProjectionSource3D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_ProjectionSource3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_ProjectionSource3D;
		 StdMeshers_ProjectionSource3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetSource3DShape;
		%feature("autodoc", "	* /*! * Sets a source <shape> to take a mesh pattern from */

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") SetSource3DShape;
		void SetSource3DShape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") GetSource3DShape;
		%feature("autodoc", "	* /*! * Returns the source shape */

	:rtype: TopoDS_Shape
") GetSource3DShape;
		TopoDS_Shape GetSource3DShape ();
		%feature("compactdefaultargs") SetSourceMesh;
		%feature("autodoc", "	* /*! * Sets source <mesh> to take a mesh pattern from */

	:param mesh:
	:type mesh: SMESH_Mesh *
	:rtype: None
") SetSourceMesh;
		void SetSourceMesh (SMESH_Mesh * mesh);
		%feature("compactdefaultargs") GetSourceMesh;
		%feature("autodoc", "	* /*! * Return source mesh */

	:rtype: SMESH_Mesh *
") GetSourceMesh;
		SMESH_Mesh * GetSourceMesh ();
		%feature("compactdefaultargs") SetVertexAssociation;
		%feature("autodoc", "	* /*! * Sets vertex association between the source shape and the target one. * This parameter is optional. * Two vertices must belong to one edge of a shape */

	:param sourceVertex1:
	:type sourceVertex1: TopoDS_Shape &
	:param sourceVertex2:
	:type sourceVertex2: TopoDS_Shape &
	:param targetVertex1:
	:type targetVertex1: TopoDS_Shape &
	:param targetVertex2:
	:type targetVertex2: TopoDS_Shape &
	:rtype: None
") SetVertexAssociation;
		void SetVertexAssociation (const TopoDS_Shape & sourceVertex1,const TopoDS_Shape & sourceVertex2,const TopoDS_Shape & targetVertex1,const TopoDS_Shape & targetVertex2);
		%feature("compactdefaultargs") GetSourceVertex;
		%feature("autodoc", "	* /*! * Returns the <i>-th source vertex associated with the <i>-th target vertex. * Result may be nil if association not set. */

	:param i:
	:type i: int
	:rtype: TopoDS_Vertex
") GetSourceVertex;
		TopoDS_Vertex GetSourceVertex (int i);
		%feature("compactdefaultargs") GetTargetVertex;
		%feature("autodoc", "	* /*! * Returns the <i>-th target vertex associated with the <i>-th source vertex. * Result may be nil if association not set. */

	:param i:
	:type i: int
	:rtype: TopoDS_Vertex
") GetTargetVertex;
		TopoDS_Vertex GetTargetVertex (int i);
		%feature("compactdefaultargs") HasVertexAssociation;
		%feature("autodoc", "	* /*! * \brief Test if vertex association defined * etval bool - test result */

	:rtype: bool
") HasVertexAssociation;
		bool HasVertexAssociation ();
		%feature("compactdefaultargs") GetStoreParams;
		%feature("autodoc", "	* /*! * \brief Return all parameters */

	:param s1:
	:type s1: TopoDS_Shape &
	:param s2:
	:type s2: TopoDS_Shape &
	:param s3:
	:type s3: TopoDS_Shape &
	:param s4:
	:type s4: TopoDS_Shape &
	:param s5:
	:type s5: TopoDS_Shape &
	:rtype: None
") GetStoreParams;
		void GetStoreParams (TopoDS_Shape & s1,TopoDS_Shape & s2,TopoDS_Shape & s3,TopoDS_Shape & s4,TopoDS_Shape & s5);
		%feature("compactdefaultargs") RestoreParams;
		%feature("autodoc", "	* /*! * \brief Set all parameters without notifying on modification */

	:param s1:
	:type s1: TopoDS_Shape &
	:param s2:
	:type s2: TopoDS_Shape &
	:param s3:
	:type s3: TopoDS_Shape &
	:param s4:
	:type s4: TopoDS_Shape &
	:param s5:
	:type s5: TopoDS_Shape &
	:param mesh:
	:type mesh: SMESH_Mesh *
	:rtype: None
") RestoreParams;
		void RestoreParams (const TopoDS_Shape & s1,const TopoDS_Shape & s2,const TopoDS_Shape & s3,const TopoDS_Shape & s4,const TopoDS_Shape & s5,SMESH_Mesh * mesh);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize parameters by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Implementation does noting */

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
};


%extend StdMeshers_ProjectionSource3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Projection_1D;
class StdMeshers_Projection_1D : public SMESH_1D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Projection_1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Projection_1D;
		 StdMeshers_Projection_1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") SetEventListener;
		%feature("autodoc", "	* /*! * \brief Sets a default event listener to submesh of the source edge * \param whenSetToSubMesh - submesh where algo is set * * After being set, event listener is notified on each event of a submesh. * This method is called when a submesh gets HYP_OK algo_state. * Arranges that CLEAN event is translated from source submesh to * the whenSetToSubMesh submesh. */

	:param whenSetToSubMesh:
	:type whenSetToSubMesh: SMESH_subMesh *
	:rtype: None
") SetEventListener;
		void SetEventListener (SMESH_subMesh * whenSetToSubMesh);
};


%extend StdMeshers_Projection_1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Projection_2D;
class StdMeshers_Projection_2D : public SMESH_2D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Projection_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Projection_2D;
		 StdMeshers_Projection_2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") SetEventListener;
		%feature("autodoc", "	* /*! * \brief Sets a default event listener to submesh of the source face * \param whenSetToSubMesh - submesh where algo is set * * After being set, event listener is notified on each event of a submesh. * This method is called when a submesh gets HYP_OK algo_state. * Arranges that CLEAN event is translated from source submesh to * the whenSetToSubMesh submesh. */

	:param whenSetToSubMesh:
	:type whenSetToSubMesh: SMESH_subMesh *
	:rtype: None
") SetEventListener;
		void SetEventListener (SMESH_subMesh * whenSetToSubMesh);
};


%extend StdMeshers_Projection_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Projection_3D;
class StdMeshers_Projection_3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Projection_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Projection_3D;
		 StdMeshers_Projection_3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") SetEventListener;
		%feature("autodoc", "	* /*! * \brief Sets a default event listener to submesh of the source shape * \param whenSetToSubMesh - submesh where algo is set * * Arranges that CLEAN event is translated from source submesh to * the whenSetToSubMesh submesh. */

	:param whenSetToSubMesh:
	:type whenSetToSubMesh: SMESH_subMesh *
	:rtype: None
") SetEventListener;
		void SetEventListener (SMESH_subMesh * whenSetToSubMesh);
};


%extend StdMeshers_Projection_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Propagation;
class StdMeshers_Propagation : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_Propagation;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Propagation;
		 StdMeshers_Propagation (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: std::string
") GetName;
		static std::string GetName ();
		%feature("compactdefaultargs") SetPropagationMgr;
		%feature("autodoc", "	* /*! * \brief Set EventListener managing propagation of hypotheses * \param subMesh - edge submesh to set event listener on * * 1D algo is expected to call this method from it's SetEventListener() */

	:param subMesh:
	:type subMesh: SMESH_subMesh *
	:rtype: void
") SetPropagationMgr;
		static void SetPropagationMgr (SMESH_subMesh * subMesh);
		%feature("compactdefaultargs") GetPropagationSource;
		%feature("autodoc", "	* /*! * \brief Return an edge from which hypotheses are propagated * \param theMesh - mesh * \param theEdge - edge to which hypotheses are propagated * etval TopoDS_Edge - source edge, also passing orientation */

	:param theMesh:
	:type theMesh: SMESH_Mesh &
	:param theEdge:
	:type theEdge: TopoDS_Shape &
	:rtype: TopoDS_Edge
") GetPropagationSource;
		static TopoDS_Edge GetPropagationSource (SMESH_Mesh & theMesh,const TopoDS_Shape & theEdge);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Just return false as this hypothesis does not have parameters values */

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
};


%extend StdMeshers_Propagation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_QuadToTriaAdaptor;
class StdMeshers_QuadToTriaAdaptor {
	public:
		%feature("compactdefaultargs") StdMeshers_QuadToTriaAdaptor;
		%feature("autodoc", "	:rtype: None
") StdMeshers_QuadToTriaAdaptor;
		 StdMeshers_QuadToTriaAdaptor ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh);
		%feature("compactdefaultargs") GetTriangles;
		%feature("autodoc", "	:param aFace:
	:type aFace: SMDS_MeshElement *
	:rtype: std::list< SMDS_FaceOfNodes *> *
") GetTriangles;
		const std::list<const SMDS_FaceOfNodes *> * GetTriangles (const SMDS_MeshElement * aFace);
};


%extend StdMeshers_QuadToTriaAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_QuadrangleParams;
class StdMeshers_QuadrangleParams : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_QuadrangleParams;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_QuadrangleParams;
		 StdMeshers_QuadrangleParams (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetTriaVertex;
		%feature("autodoc", "	:param id:
	:type id: int
	:rtype: None
") SetTriaVertex;
		void SetTriaVertex (int id);
		%feature("compactdefaultargs") SetObjectEntry;
		%feature("autodoc", "	:param entry:
	:type entry: char *
	:rtype: None
") SetObjectEntry;
		void SetObjectEntry (const char * entry);
		%feature("compactdefaultargs") GetObjectEntry;
		%feature("autodoc", "	:rtype: char *
") GetObjectEntry;
		const char * GetObjectEntry ();
		%feature("compactdefaultargs") GetTriaVertex;
		%feature("autodoc", "	:rtype: int
") GetTriaVertex;
		int GetTriaVertex ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize start and end length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_QuadrangleParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_QuadranglePreference;
class StdMeshers_QuadranglePreference : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_QuadranglePreference;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_QuadranglePreference;
		 StdMeshers_QuadranglePreference (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Just return false as this hypothesis does not have parameters values */

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
};


%extend StdMeshers_QuadranglePreference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Quadrangle_2D;
class StdMeshers_Quadrangle_2D : public SMESH_2D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Quadrangle_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Quadrangle_2D;
		 StdMeshers_Quadrangle_2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") CheckAnd2Dcompute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param CreateQuadratic:
	:type CreateQuadratic: bool
	:rtype: FaceQuadStruct *
") CheckAnd2Dcompute;
		FaceQuadStruct * CheckAnd2Dcompute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,const bool CreateQuadratic);
};


%extend StdMeshers_Quadrangle_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_QuadraticMesh;
class StdMeshers_QuadraticMesh : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_QuadraticMesh;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_QuadraticMesh;
		 StdMeshers_QuadraticMesh (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Just return false as this hypothesis does not have parameters values */

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
};


%extend StdMeshers_QuadraticMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_RadialPrism_3D;
class StdMeshers_RadialPrism_3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_RadialPrism_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_RadialPrism_3D;
		 StdMeshers_RadialPrism_3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
};


%extend StdMeshers_RadialPrism_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_RadialQuadrangle_1D2D;
class StdMeshers_RadialQuadrangle_1D2D : public SMESH_2D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_RadialQuadrangle_1D2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_RadialQuadrangle_1D2D;
		 StdMeshers_RadialQuadrangle_1D2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") SubmeshRestored;
		%feature("autodoc", "	* /*! * \brief Allow algo to do something after persistent restoration * \param subMesh - restored submesh * * This method is called only if a submesh has HYP_OK algo_state. */

	:param subMesh:
	:type subMesh: SMESH_subMesh *
	:rtype: None
") SubmeshRestored;
		void SubmeshRestored (SMESH_subMesh * subMesh);
};


%extend StdMeshers_RadialQuadrangle_1D2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_Regular_1D;
class StdMeshers_Regular_1D : public SMESH_1D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_Regular_1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_Regular_1D;
		 StdMeshers_Regular_1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
		%feature("compactdefaultargs") GetUsedHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param bool: default value is true
	:type bool: 
	:rtype: std::list< SMESHDS_Hypothesis *>
") GetUsedHypothesis;
		const std::list<const SMESHDS_Hypothesis *> & GetUsedHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,const bool = true);
		%feature("compactdefaultargs") SetEventListener;
		%feature("autodoc", "	* /*! * \brief Sets event listener to submeshes if necessary * \param subMesh - submesh where algo is set * * This method is called when a submesh gets HYP_OK algo_state. * After being set, event listener is notified on each event of a submesh. */

	:param subMesh:
	:type subMesh: SMESH_subMesh *
	:rtype: None
") SetEventListener;
		void SetEventListener (SMESH_subMesh * subMesh);
		%feature("compactdefaultargs") SubmeshRestored;
		%feature("autodoc", "	* /*! * \brief Allow algo to do something after persistent restoration * \param subMesh - restored submesh * * This method is called only if a submesh has HYP_OK algo_state. */

	:param subMesh:
	:type subMesh: SMESH_subMesh *
	:rtype: None
") SubmeshRestored;
		void SubmeshRestored (SMESH_subMesh * subMesh);
};


%extend StdMeshers_Regular_1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_SegmentAroundVertex_0D;
class StdMeshers_SegmentAroundVertex_0D : public SMESH_0D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_SegmentAroundVertex_0D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_SegmentAroundVertex_0D;
		 StdMeshers_SegmentAroundVertex_0D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
};


%extend StdMeshers_SegmentAroundVertex_0D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_SegmentLengthAroundVertex;
class StdMeshers_SegmentLengthAroundVertex : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_SegmentLengthAroundVertex;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_SegmentLengthAroundVertex;
		 StdMeshers_SegmentLengthAroundVertex (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	:param length:
	:type length: double
	:rtype: None
") SetLength;
		void SetLength (double length);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	:rtype: double
") GetLength;
		double GetLength ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize segment length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_SegmentLengthAroundVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_StartEndLength;
class StdMeshers_StartEndLength : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_StartEndLength;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_StartEndLength;
		 StdMeshers_StartEndLength (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetLength;
		%feature("autodoc", "	:param length:
	:type length: double
	:param isStartLength:
	:type isStartLength: bool
	:rtype: None
") SetLength;
		void SetLength (double length,bool isStartLength);
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", "	:param isStartLength:
	:type isStartLength: bool
	:rtype: double
") GetLength;
		double GetLength (bool isStartLength);
		%feature("compactdefaultargs") SetReversedEdges;
		%feature("autodoc", "	:param ids:
	:type ids: std::vector<int> &
	:rtype: None
") SetReversedEdges;
		void SetReversedEdges (std::vector<int> & ids);
		%feature("compactdefaultargs") GetReversedEdges;
		%feature("autodoc", "	:rtype: std::vector<int>
") GetReversedEdges;
		const std::vector<int> & GetReversedEdges ();
		%feature("compactdefaultargs") SetObjectEntry;
		%feature("autodoc", "	:param entry:
	:type entry: char *
	:rtype: None
") SetObjectEntry;
		void SetObjectEntry (const char * entry);
		%feature("compactdefaultargs") GetObjectEntry;
		%feature("autodoc", "	:rtype: char *
") GetObjectEntry;
		const char * GetObjectEntry ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize start and end length by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined */

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
};


%extend StdMeshers_StartEndLength {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_TrianglePreference;
class StdMeshers_TrianglePreference : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") StdMeshers_TrianglePreference;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_TrianglePreference;
		 StdMeshers_TrianglePreference (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: std::ostream &
	:rtype: std::ostream
") SaveTo;
		std::ostream & SaveTo (std::ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: std::istream &
	:rtype: std::istream
") LoadFrom;
		std::istream & LoadFrom (std::istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Initialize my parameter values by the mesh built on the geometry * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if parameter values have been successfully defined * * Just return false as this hypothesis does not have parameters values */

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
};


%extend StdMeshers_TrianglePreference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_UseExisting_1D;
class StdMeshers_UseExisting_1D : public SMESH_1D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_UseExisting_1D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_UseExisting_1D;
		 StdMeshers_UseExisting_1D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
};


%extend StdMeshers_UseExisting_1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_UseExisting_2D;
class StdMeshers_UseExisting_2D : public SMESH_2D_Algo {
	public:
		%feature("compactdefaultargs") StdMeshers_UseExisting_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_UseExisting_2D;
		 StdMeshers_UseExisting_2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") CheckHypothesis;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aStatus:
	:type aStatus: SMESH_Hypothesis::Hypothesis_Status &
	:rtype: bool
") CheckHypothesis;
		bool CheckHypothesis (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,SMESH_Hypothesis::Hypothesis_Status & aStatus);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (SMESH_Mesh & aMesh,const TopoDS_Shape & aShape,MapShapeNbElems & aResMap);
};


%extend StdMeshers_UseExisting_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_LayerDistribution2D;
class StdMeshers_LayerDistribution2D : public StdMeshers_LayerDistribution {
	public:
		%feature("compactdefaultargs") StdMeshers_LayerDistribution2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_LayerDistribution2D;
		 StdMeshers_LayerDistribution2D (int hypId,int studyId,SMESH_Gen * gen);
};


%extend StdMeshers_LayerDistribution2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdMeshers_NumberOfLayers2D;
class StdMeshers_NumberOfLayers2D : public StdMeshers_NumberOfLayers {
	public:
		%feature("compactdefaultargs") StdMeshers_NumberOfLayers2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") StdMeshers_NumberOfLayers2D;
		 StdMeshers_NumberOfLayers2D (int hypId,int studyId,SMESH_Gen * gen);
};


%extend StdMeshers_NumberOfLayers2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
