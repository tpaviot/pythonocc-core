/*
Copyright 2008-2016 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") SMESHDS

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


%include SMESHDS_headers.i


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
typedef SMDS_Iterator <const SMESHDS_SubMesh *> SMESHDS_SubMeshIterator;
typedef boost::shared_ptr<SMESHDS_SubMeshIterator> SMESHDS_SubMeshIteratorPtr;
/* end typedefs declaration */

/* public enums */
enum SMESHDS_CommandType {
	SMESHDS_AddNode = 0,
	SMESHDS_AddEdge = 1,
	SMESHDS_AddTriangle = 2,
	SMESHDS_AddQuadrangle = 3,
	SMESHDS_AddPolygon = 4,
	SMESHDS_AddTetrahedron = 5,
	SMESHDS_AddPyramid = 6,
	SMESHDS_AddPrism = 7,
	SMESHDS_AddHexahedron = 8,
	SMESHDS_AddPolyhedron = 9,
	SMESHDS_RemoveNode = 10,
	SMESHDS_RemoveElement = 11,
	SMESHDS_MoveNode = 12,
	SMESHDS_ChangeElementNodes = 13,
	SMESHDS_ChangePolyhedronNodes = 14,
	SMESHDS_Renumber = 15,
	SMESHDS_ClearAll = 16,
	SMESHDS_AddQuadEdge = 17,
	SMESHDS_AddQuadTriangle = 18,
	SMESHDS_AddQuadQuadrangle = 19,
	SMESHDS_AddQuadTetrahedron = 20,
	SMESHDS_AddQuadPyramid = 21,
	SMESHDS_AddQuadPentahedron = 22,
	SMESHDS_AddQuadHexahedron = 23,
	SMESHDS_Add0DElement = 24,
};

/* end public enums declaration */

%nodefaultctor SMESHDS_Command;
class SMESHDS_Command {
	public:
		%feature("compactdefaultargs") SMESHDS_Command;
		%feature("autodoc", "	:param aType:
	:type aType: SMESHDS_CommandType
	:rtype: None
") SMESHDS_Command;
		 SMESHDS_Command (const SMESHDS_CommandType aType);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param NewNodeID:
	:type NewNodeID: int
	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") AddNode;
		void AddNode (int NewNodeID,double x,double y,double z);
		%feature("compactdefaultargs") Add0DElement;
		%feature("autodoc", "	:param New0DElementID:
	:type New0DElementID: int
	:param idnode:
	:type idnode: int
	:rtype: None
") Add0DElement;
		void Add0DElement (int New0DElementID,int idnode);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param NewEdgeID:
	:type NewEdgeID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:rtype: None
") AddEdge;
		void AddEdge (int NewEdgeID,int idnode1,int idnode2);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int idnode1,int idnode2,int idnode3);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int idnode1,int idnode2,int idnode3,int idnode4);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4,int idnode5);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:param idnode6:
	:type idnode6: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4,int idnode5,int idnode6);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:param idnode6:
	:type idnode6: int
	:param idnode7:
	:type idnode7: int
	:param idnode8:
	:type idnode8: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4,int idnode5,int idnode6,int idnode7,int idnode8);
		%feature("compactdefaultargs") AddPolygonalFace;
		%feature("autodoc", "	:param ElementID:
	:type ElementID: int
	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:rtype: None
") AddPolygonalFace;
		void AddPolygonalFace (const int ElementID,std::vector<int> nodes_ids);
		%feature("compactdefaultargs") AddPolyhedralVolume;
		%feature("autodoc", "	:param ElementID:
	:type ElementID: int
	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: None
") AddPolyhedralVolume;
		void AddPolyhedralVolume (const int ElementID,std::vector<int> nodes_ids,std::vector<int> quantities);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param NewEdgeID:
	:type NewEdgeID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n12:
	:type n12: int
	:rtype: None
") AddEdge;
		void AddEdge (int NewEdgeID,int n1,int n2,int n12);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int n1,int n2,int n3,int n12,int n23,int n31);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int n1,int n2,int n3,int n4,int n12,int n23,int n34,int n41);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n14:
	:type n14: int
	:param n24:
	:type n24: int
	:param n34:
	:type n34: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n12,int n23,int n31,int n14,int n24,int n34);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n15:
	:type n15: int
	:param n25:
	:type n25: int
	:param n35:
	:type n35: int
	:param n45:
	:type n45: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n5,int n12,int n23,int n34,int n41,int n15,int n25,int n35,int n45);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n45:
	:type n45: int
	:param n56:
	:type n56: int
	:param n64:
	:type n64: int
	:param n14:
	:type n14: int
	:param n25:
	:type n25: int
	:param n36:
	:type n36: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n5,int n6,int n12,int n23,int n31,int n45,int n56,int n64,int n14,int n25,int n36);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n7:
	:type n7: int
	:param n8:
	:type n8: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n56:
	:type n56: int
	:param n67:
	:type n67: int
	:param n78:
	:type n78: int
	:param n85:
	:type n85: int
	:param n15:
	:type n15: int
	:param n26:
	:type n26: int
	:param n37:
	:type n37: int
	:param n48:
	:type n48: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n5,int n6,int n7,int n8,int n12,int n23,int n34,int n41,int n56,int n67,int n78,int n85,int n15,int n26,int n37,int n48);
		%feature("compactdefaultargs") MoveNode;
		%feature("autodoc", "	:param NewNodeID:
	:type NewNodeID: int
	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") MoveNode;
		void MoveNode (int NewNodeID,double x,double y,double z);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	:param NodeID:
	:type NodeID: int
	:rtype: None
") RemoveNode;
		void RemoveNode (int NodeID);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	:param ElementID:
	:type ElementID: int
	:rtype: None
") RemoveElement;
		void RemoveElement (int ElementID);
		%feature("compactdefaultargs") ChangePolyhedronNodes;
		%feature("autodoc", "	:param ElementID:
	:type ElementID: int
	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: None
") ChangePolyhedronNodes;
		void ChangePolyhedronNodes (const int ElementID,std::vector<int> nodes_ids,std::vector<int> quantities);
		%feature("compactdefaultargs") Renumber;
		%feature("autodoc", "	:param isNodes:
	:type isNodes: bool
	:param startID:
	:type startID: int
	:param deltaID:
	:type deltaID: int
	:rtype: None
") Renumber;
		void Renumber (const bool isNodes,const int startID,const int deltaID);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: SMESHDS_CommandType
") GetType;
		SMESHDS_CommandType GetType ();
		%feature("compactdefaultargs") GetNumber;
		%feature("autodoc", "	:rtype: int
") GetNumber;
		int GetNumber ();
		%feature("compactdefaultargs") GetIndexes;
		%feature("autodoc", "	:rtype: std::list<int>
") GetIndexes;
		const std::list<int> & GetIndexes ();
		%feature("compactdefaultargs") GetCoords;
		%feature("autodoc", "	:rtype: std::list<double>
") GetCoords;
		const std::list<double> & GetCoords ();
};


%extend SMESHDS_Command {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESHDS_Document;
class SMESHDS_Document {
	public:
		%feature("compactdefaultargs") SMESHDS_Document;
		%feature("autodoc", "	:param UserID:
	:type UserID: int
	:rtype: None
") SMESHDS_Document;
		 SMESHDS_Document (int UserID);
		%feature("compactdefaultargs") NewMesh;
		%feature("autodoc", "	:param theIsEmbeddedMode:
	:type theIsEmbeddedMode: bool
	:rtype: int
") NewMesh;
		int NewMesh (bool theIsEmbeddedMode);
		%feature("compactdefaultargs") RemoveMesh;
		%feature("autodoc", "	:param MeshID:
	:type MeshID: int
	:rtype: None
") RemoveMesh;
		void RemoveMesh (int MeshID);
		%feature("compactdefaultargs") GetMesh;
		%feature("autodoc", "	:param MeshID:
	:type MeshID: int
	:rtype: SMESHDS_Mesh *
") GetMesh;
		SMESHDS_Mesh * GetMesh (int MeshID);
		%feature("compactdefaultargs") AddHypothesis;
		%feature("autodoc", "	:param H:
	:type H: SMESHDS_Hypothesis *
	:rtype: None
") AddHypothesis;
		void AddHypothesis (SMESHDS_Hypothesis * H);
		%feature("compactdefaultargs") RemoveHypothesis;
		%feature("autodoc", "	:param HypID:
	:type HypID: int
	:rtype: None
") RemoveHypothesis;
		void RemoveHypothesis (int HypID);
		%feature("compactdefaultargs") GetHypothesis;
		%feature("autodoc", "	:param HypID:
	:type HypID: int
	:rtype: SMESHDS_Hypothesis *
") GetHypothesis;
		SMESHDS_Hypothesis * GetHypothesis (int HypID);
		%feature("compactdefaultargs") NbMeshes;
		%feature("autodoc", "	:rtype: int
") NbMeshes;
		int NbMeshes ();
		%feature("compactdefaultargs") NbHypothesis;
		%feature("autodoc", "	:rtype: int
") NbHypothesis;
		int NbHypothesis ();
		%feature("compactdefaultargs") InitMeshesIterator;
		%feature("autodoc", "	:rtype: None
") InitMeshesIterator;
		void InitMeshesIterator ();
		%feature("compactdefaultargs") NextMesh;
		%feature("autodoc", "	:rtype: SMESHDS_Mesh *
") NextMesh;
		SMESHDS_Mesh * NextMesh ();
		%feature("compactdefaultargs") MoreMesh;
		%feature("autodoc", "	:rtype: bool
") MoreMesh;
		bool MoreMesh ();
		%feature("compactdefaultargs") InitHypothesisIterator;
		%feature("autodoc", "	:rtype: None
") InitHypothesisIterator;
		void InitHypothesisIterator ();
		%feature("compactdefaultargs") NextHypothesis;
		%feature("autodoc", "	:rtype: SMESHDS_Hypothesis *
") NextHypothesis;
		SMESHDS_Hypothesis * NextHypothesis ();
		%feature("compactdefaultargs") MoreHypothesis;
		%feature("autodoc", "	:rtype: bool
") MoreHypothesis;
		bool MoreHypothesis ();
};


%extend SMESHDS_Document {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESHDS_Mesh;
class SMESHDS_Mesh : public SMDS_Mesh {
	public:
		%feature("compactdefaultargs") SMESHDS_Mesh;
		%feature("autodoc", "	:param theMeshID:
	:type theMeshID: int
	:param theIsEmbeddedMode:
	:type theIsEmbeddedMode: bool
	:rtype: None
") SMESHDS_Mesh;
		 SMESHDS_Mesh (int theMeshID,bool theIsEmbeddedMode);
		%feature("compactdefaultargs") IsEmbeddedMode;
		%feature("autodoc", "	:rtype: bool
") IsEmbeddedMode;
		bool IsEmbeddedMode ();
		%feature("compactdefaultargs") ShapeToMesh;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") ShapeToMesh;
		void ShapeToMesh (const TopoDS_Shape & S);
		%feature("compactdefaultargs") ShapeToMesh;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ShapeToMesh;
		TopoDS_Shape ShapeToMesh ();
		%feature("compactdefaultargs") AddHypothesis;
		%feature("autodoc", "	:param SS:
	:type SS: TopoDS_Shape &
	:param H:
	:type H: SMESHDS_Hypothesis *
	:rtype: bool
") AddHypothesis;
		bool AddHypothesis (const TopoDS_Shape & SS,const SMESHDS_Hypothesis * H);
		%feature("compactdefaultargs") RemoveHypothesis;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param H:
	:type H: SMESHDS_Hypothesis *
	:rtype: bool
") RemoveHypothesis;
		bool RemoveHypothesis (const TopoDS_Shape & S,const SMESHDS_Hypothesis * H);
		%feature("compactdefaultargs") AddNodeWithID;
		%feature("autodoc", "	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshNode *
") AddNodeWithID;
		SMDS_MeshNode * AddNodeWithID (double x,double y,double z,int ID);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: SMDS_MeshNode *
") AddNode;
		SMDS_MeshNode * AddNode (double x,double y,double z);
		%feature("compactdefaultargs") Add0DElementWithID;
		%feature("autodoc", "	:param nodeID:
	:type nodeID: int
	:param ID:
	:type ID: int
	:rtype: SMDS_Mesh0DElement *
") Add0DElementWithID;
		SMDS_Mesh0DElement * Add0DElementWithID (int nodeID,int ID);
		%feature("compactdefaultargs") Add0DElementWithID;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_Mesh0DElement *
") Add0DElementWithID;
		SMDS_Mesh0DElement * Add0DElementWithID (const SMDS_MeshNode * node,int ID);
		%feature("compactdefaultargs") Add0DElement;
		%feature("autodoc", "	:param node:
	:type node: SMDS_MeshNode *
	:rtype: SMDS_Mesh0DElement *
") Add0DElement;
		SMDS_Mesh0DElement * Add0DElement (const SMDS_MeshNode * node);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (int n1,int n2,int ID);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,int ID);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:rtype: SMDS_MeshEdge *
") AddEdge;
		SMDS_MeshEdge * AddEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n12:
	:type n12: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (int n1,int n2,int n12,int ID);
		%feature("compactdefaultargs") AddEdgeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshEdge *
") AddEdgeWithID;
		SMDS_MeshEdge * AddEdgeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n12,int ID);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:rtype: SMDS_MeshEdge *
") AddEdge;
		SMDS_MeshEdge * AddEdge (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n12);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int n4,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int n12,int n23,int n31,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (int n1,int n2,int n3,int n4,int n12,int n23,int n34,int n41,int ID);
		%feature("compactdefaultargs") AddFaceWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddFaceWithID;
		SMDS_MeshFace * AddFaceWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,int ID);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:rtype: SMDS_MeshFace *
") AddFace;
		SMDS_MeshFace * AddFace (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
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
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
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
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n7:
	:type n7: int
	:param n8:
	:type n8: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int n7,int n8,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
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
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
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
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n14:
	:type n14: int
	:param n24:
	:type n24: int
	:param n34:
	:type n34: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n12,int n23,int n31,int n14,int n24,int n34,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n24:
	:type n24: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n14,const SMDS_MeshNode * n24,const SMDS_MeshNode * n34,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n24:
	:type n24: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n14,const SMDS_MeshNode * n24,const SMDS_MeshNode * n34);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n15:
	:type n15: int
	:param n25:
	:type n25: int
	:param n35:
	:type n35: int
	:param n45:
	:type n45: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n12,int n23,int n34,int n41,int n15,int n25,int n35,int n45,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n35:
	:type n35: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n15,const SMDS_MeshNode * n25,const SMDS_MeshNode * n35,const SMDS_MeshNode * n45,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
	:type n1: SMDS_MeshNode *
	:param n2:
	:type n2: SMDS_MeshNode *
	:param n3:
	:type n3: SMDS_MeshNode *
	:param n4:
	:type n4: SMDS_MeshNode *
	:param n5:
	:type n5: SMDS_MeshNode *
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n35:
	:type n35: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n15,const SMDS_MeshNode * n25,const SMDS_MeshNode * n35,const SMDS_MeshNode * n45);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n45:
	:type n45: int
	:param n56:
	:type n56: int
	:param n64:
	:type n64: int
	:param n14:
	:type n14: int
	:param n25:
	:type n25: int
	:param n36:
	:type n36: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int n12,int n23,int n31,int n45,int n56,int n64,int n14,int n25,int n36,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
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
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n64:
	:type n64: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n36:
	:type n36: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n45,const SMDS_MeshNode * n56,const SMDS_MeshNode * n64,const SMDS_MeshNode * n14,const SMDS_MeshNode * n25,const SMDS_MeshNode * n36,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
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
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n31:
	:type n31: SMDS_MeshNode *
	:param n45:
	:type n45: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n64:
	:type n64: SMDS_MeshNode *
	:param n14:
	:type n14: SMDS_MeshNode *
	:param n25:
	:type n25: SMDS_MeshNode *
	:param n36:
	:type n36: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n31,const SMDS_MeshNode * n45,const SMDS_MeshNode * n56,const SMDS_MeshNode * n64,const SMDS_MeshNode * n14,const SMDS_MeshNode * n25,const SMDS_MeshNode * n36);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n7:
	:type n7: int
	:param n8:
	:type n8: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n56:
	:type n56: int
	:param n67:
	:type n67: int
	:param n78:
	:type n78: int
	:param n85:
	:type n85: int
	:param n15:
	:type n15: int
	:param n26:
	:type n26: int
	:param n37:
	:type n37: int
	:param n48:
	:type n48: int
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (int n1,int n2,int n3,int n4,int n5,int n6,int n7,int n8,int n12,int n23,int n34,int n41,int n56,int n67,int n78,int n85,int n15,int n26,int n37,int n48,int ID);
		%feature("compactdefaultargs") AddVolumeWithID;
		%feature("autodoc", "	:param n1:
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
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n67:
	:type n67: SMDS_MeshNode *
	:param n78:
	:type n78: SMDS_MeshNode *
	:param n85:
	:type n85: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n26:
	:type n26: SMDS_MeshNode *
	:param n37:
	:type n37: SMDS_MeshNode *
	:param n48:
	:type n48: SMDS_MeshNode *
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddVolumeWithID;
		SMDS_MeshVolume * AddVolumeWithID (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n56,const SMDS_MeshNode * n67,const SMDS_MeshNode * n78,const SMDS_MeshNode * n85,const SMDS_MeshNode * n15,const SMDS_MeshNode * n26,const SMDS_MeshNode * n37,const SMDS_MeshNode * n48,int ID);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param n1:
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
	:param n12:
	:type n12: SMDS_MeshNode *
	:param n23:
	:type n23: SMDS_MeshNode *
	:param n34:
	:type n34: SMDS_MeshNode *
	:param n41:
	:type n41: SMDS_MeshNode *
	:param n56:
	:type n56: SMDS_MeshNode *
	:param n67:
	:type n67: SMDS_MeshNode *
	:param n78:
	:type n78: SMDS_MeshNode *
	:param n85:
	:type n85: SMDS_MeshNode *
	:param n15:
	:type n15: SMDS_MeshNode *
	:param n26:
	:type n26: SMDS_MeshNode *
	:param n37:
	:type n37: SMDS_MeshNode *
	:param n48:
	:type n48: SMDS_MeshNode *
	:rtype: SMDS_MeshVolume *
") AddVolume;
		SMDS_MeshVolume * AddVolume (const SMDS_MeshNode * n1,const SMDS_MeshNode * n2,const SMDS_MeshNode * n3,const SMDS_MeshNode * n4,const SMDS_MeshNode * n5,const SMDS_MeshNode * n6,const SMDS_MeshNode * n7,const SMDS_MeshNode * n8,const SMDS_MeshNode * n12,const SMDS_MeshNode * n23,const SMDS_MeshNode * n34,const SMDS_MeshNode * n41,const SMDS_MeshNode * n56,const SMDS_MeshNode * n67,const SMDS_MeshNode * n78,const SMDS_MeshNode * n85,const SMDS_MeshNode * n15,const SMDS_MeshNode * n26,const SMDS_MeshNode * n37,const SMDS_MeshNode * n48);
		%feature("compactdefaultargs") AddPolygonalFaceWithID;
		%feature("autodoc", "	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddPolygonalFaceWithID;
		SMDS_MeshFace * AddPolygonalFaceWithID (std::vector<int> nodes_ids,const int ID);
		%feature("compactdefaultargs") AddPolygonalFaceWithID;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshFace *
") AddPolygonalFaceWithID;
		SMDS_MeshFace * AddPolygonalFaceWithID (std::vector<const SMDS_MeshNode *> nodes,const int ID);
		%feature("compactdefaultargs") AddPolygonalFace;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:rtype: SMDS_MeshFace *
") AddPolygonalFace;
		SMDS_MeshFace * AddPolygonalFace (std::vector<const SMDS_MeshNode *> nodes);
		%feature("compactdefaultargs") AddPolyhedralVolumeWithID;
		%feature("autodoc", "	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param quantities:
	:type quantities: std::vector<int>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddPolyhedralVolumeWithID;
		SMDS_MeshVolume * AddPolyhedralVolumeWithID (std::vector<int> nodes_ids,std::vector<int> quantities,const int ID);
		%feature("compactdefaultargs") AddPolyhedralVolumeWithID;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param quantities:
	:type quantities: std::vector<int>
	:param ID:
	:type ID: int
	:rtype: SMDS_MeshVolume *
") AddPolyhedralVolumeWithID;
		SMDS_MeshVolume * AddPolyhedralVolumeWithID (std::vector<const SMDS_MeshNode *> nodes,std::vector<int> quantities,const int ID);
		%feature("compactdefaultargs") AddPolyhedralVolume;
		%feature("autodoc", "	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: SMDS_MeshVolume *
") AddPolyhedralVolume;
		SMDS_MeshVolume * AddPolyhedralVolume (std::vector<const SMDS_MeshNode *> nodes,std::vector<int> quantities);
		%feature("compactdefaultargs") MoveNode;
		%feature("autodoc", "	:param :
	:type : SMDS_MeshNode *
	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") MoveNode;
		void MoveNode (const SMDS_MeshNode * ,double x,double y,double z);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	:param :
	:type : SMDS_MeshNode *
	:rtype: None
") RemoveNode;
		void RemoveNode (const SMDS_MeshNode * );
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	:param :
	:type : SMDS_MeshElement *
	:rtype: None
") RemoveElement;
		void RemoveElement (const SMDS_MeshElement * );
		%feature("compactdefaultargs") RemoveFreeNode;
		%feature("autodoc", "	* /*! Remove only the given element/node and only if it is free. * Methods do not work for meshes with descendants. * Implemented for fast cleaning of meshes. */

	:param :
	:type : SMDS_MeshNode *
	:param :
	:type : SMESHDS_SubMesh *
	:param fromGroups: default value is true
	:type fromGroups: bool
	:rtype: None
") RemoveFreeNode;
		void RemoveFreeNode (const SMDS_MeshNode * ,SMESHDS_SubMesh * ,bool fromGroups = true);
		%feature("compactdefaultargs") RemoveFreeElement;
		%feature("autodoc", "	:param :
	:type : SMDS_MeshElement *
	:param :
	:type : SMESHDS_SubMesh *
	:param fromGroups: default value is true
	:type fromGroups: bool
	:rtype: None
") RemoveFreeElement;
		void RemoveFreeElement (const SMDS_MeshElement * ,SMESHDS_SubMesh * ,bool fromGroups = true);
		%feature("compactdefaultargs") ClearMesh;
		%feature("autodoc", "	:rtype: None
") ClearMesh;
		void ClearMesh ();
		%feature("compactdefaultargs") ChangePolygonNodes;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:rtype: bool
") ChangePolygonNodes;
		bool ChangePolygonNodes (const SMDS_MeshElement * elem,std::vector<const SMDS_MeshNode *> nodes);
		%feature("compactdefaultargs") ChangePolyhedronNodes;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:param nodes:
	:type nodes: std::vector< SMDS_MeshNode *>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: bool
") ChangePolyhedronNodes;
		bool ChangePolyhedronNodes (const SMDS_MeshElement * elem,std::vector<const SMDS_MeshNode *> nodes,std::vector<int> quantities);
		%feature("compactdefaultargs") Renumber;
		%feature("autodoc", "	:param isNodes:
	:type isNodes: bool
	:param startID: default value is 1
	:type startID: int
	:param deltaID: default value is 1
	:type deltaID: int
	:rtype: None
") Renumber;
		void Renumber (const bool isNodes,const int startID = 1,const int deltaID = 1);
		%feature("compactdefaultargs") SetNodeInVolume;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") SetNodeInVolume;
		void SetNodeInVolume (SMDS_MeshNode * aNode,const TopoDS_Shell & S);
		%feature("compactdefaultargs") SetNodeInVolume;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param S:
	:type S: TopoDS_Solid &
	:rtype: None
") SetNodeInVolume;
		void SetNodeInVolume (SMDS_MeshNode * aNode,const TopoDS_Solid & S);
		%feature("compactdefaultargs") SetNodeOnFace;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param S:
	:type S: TopoDS_Face &
	:param u: default value is 0
	:type u: double
	:param v: default value is 0
	:type v: double
	:rtype: None
") SetNodeOnFace;
		void SetNodeOnFace (SMDS_MeshNode * aNode,const TopoDS_Face & S,double u = 0,double v = 0);
		%feature("compactdefaultargs") SetNodeOnEdge;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param S:
	:type S: TopoDS_Edge &
	:param u: default value is 0
	:type u: double
	:rtype: None
") SetNodeOnEdge;
		void SetNodeOnEdge (SMDS_MeshNode * aNode,const TopoDS_Edge & S,double u = 0);
		%feature("compactdefaultargs") SetNodeOnVertex;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param S:
	:type S: TopoDS_Vertex &
	:rtype: None
") SetNodeOnVertex;
		void SetNodeOnVertex (SMDS_MeshNode * aNode,const TopoDS_Vertex & S);
		%feature("compactdefaultargs") UnSetNodeOnShape;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:rtype: None
") UnSetNodeOnShape;
		void UnSetNodeOnShape (const SMDS_MeshNode * aNode);
		%feature("compactdefaultargs") SetMeshElementOnShape;
		%feature("autodoc", "	:param anElt:
	:type anElt: SMDS_MeshElement *
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") SetMeshElementOnShape;
		void SetMeshElementOnShape (const SMDS_MeshElement * anElt,const TopoDS_Shape & S);
		%feature("compactdefaultargs") UnSetMeshElementOnShape;
		%feature("autodoc", "	:param anElt:
	:type anElt: SMDS_MeshElement *
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") UnSetMeshElementOnShape;
		void UnSetMeshElementOnShape (const SMDS_MeshElement * anElt,const TopoDS_Shape & S);
		%feature("compactdefaultargs") HasMeshElements;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasMeshElements;
		bool HasMeshElements (const TopoDS_Shape & S);
		%feature("compactdefaultargs") MeshElements;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: SMESHDS_SubMesh *
") MeshElements;
		SMESHDS_SubMesh * MeshElements (const TopoDS_Shape & S);
		%feature("compactdefaultargs") MeshElements;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: SMESHDS_SubMesh *
") MeshElements;
		SMESHDS_SubMesh * MeshElements (const int Index);
		%feature("compactdefaultargs") SubMeshIndices;
		%feature("autodoc", "	:rtype: std::list<int>
") SubMeshIndices;
		std::list<int> SubMeshIndices ();
		%feature("compactdefaultargs") SubMeshes;
		%feature("autodoc", "	:rtype: std::map<int, SMESHDS_SubMesh *>
") SubMeshes;
		const std::map<int, SMESHDS_SubMesh *> & SubMeshes ();
		%feature("compactdefaultargs") HasHypothesis;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasHypothesis;
		bool HasHypothesis (const TopoDS_Shape & S);
		%feature("compactdefaultargs") GetHypothesis;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: std::list< SMESHDS_Hypothesis *>
") GetHypothesis;
		const std::list<const SMESHDS_Hypothesis *> & GetHypothesis (const TopoDS_Shape & S);
		%feature("compactdefaultargs") GetScript;
		%feature("autodoc", "	:rtype: SMESHDS_Script *
") GetScript;
		SMESHDS_Script * GetScript ();
		%feature("compactdefaultargs") ClearScript;
		%feature("autodoc", "	:rtype: None
") ClearScript;
		void ClearScript ();
		%feature("compactdefaultargs") ShapeToIndex;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: int
") ShapeToIndex;
		int ShapeToIndex (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") IndexToShape;
		%feature("autodoc", "	:param ShapeIndex:
	:type ShapeIndex: int
	:rtype: TopoDS_Shape
") IndexToShape;
		const TopoDS_Shape  IndexToShape (int ShapeIndex);
		%feature("compactdefaultargs") MaxShapeIndex;
		%feature("autodoc", "	:rtype: int
") MaxShapeIndex;
		int MaxShapeIndex ();
		%feature("compactdefaultargs") NewSubMesh;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: SMESHDS_SubMesh *
") NewSubMesh;
		SMESHDS_SubMesh * NewSubMesh (int Index);
		%feature("compactdefaultargs") AddCompoundSubmesh;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param type: default value is TopAbs_SHAPE
	:type type: TopAbs_ShapeEnum
	:rtype: int
") AddCompoundSubmesh;
		int AddCompoundSubmesh (const TopoDS_Shape & S,TopAbs_ShapeEnum type = TopAbs_SHAPE);
		%feature("compactdefaultargs") SetNodeInVolume;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param Index:
	:type Index: int
	:rtype: None
") SetNodeInVolume;
		void SetNodeInVolume (const SMDS_MeshNode * aNode,int Index);
		%feature("compactdefaultargs") SetNodeOnFace;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param Index:
	:type Index: int
	:param u: default value is 0
	:type u: double
	:param v: default value is 0
	:type v: double
	:rtype: None
") SetNodeOnFace;
		void SetNodeOnFace (SMDS_MeshNode * aNode,int Index,double u = 0,double v = 0);
		%feature("compactdefaultargs") SetNodeOnEdge;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param Index:
	:type Index: int
	:param u: default value is 0
	:type u: double
	:rtype: None
") SetNodeOnEdge;
		void SetNodeOnEdge (SMDS_MeshNode * aNode,int Index,double u = 0);
		%feature("compactdefaultargs") SetNodeOnVertex;
		%feature("autodoc", "	:param aNode:
	:type aNode: SMDS_MeshNode *
	:param Index:
	:type Index: int
	:rtype: None
") SetNodeOnVertex;
		void SetNodeOnVertex (SMDS_MeshNode * aNode,int Index);
		%feature("compactdefaultargs") SetMeshElementOnShape;
		%feature("autodoc", "	:param anElt:
	:type anElt: SMDS_MeshElement *
	:param Index:
	:type Index: int
	:rtype: None
") SetMeshElementOnShape;
		void SetMeshElementOnShape (const SMDS_MeshElement * anElt,int Index);
		%feature("compactdefaultargs") AddGroup;
		%feature("autodoc", "	:param theGroup:
	:type theGroup: SMESHDS_GroupBase *
	:rtype: None
") AddGroup;
		void AddGroup (SMESHDS_GroupBase * theGroup);
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "	:param theGroup:
	:type theGroup: SMESHDS_GroupBase *
	:rtype: None
") RemoveGroup;
		void RemoveGroup (SMESHDS_GroupBase * theGroup);
		%feature("compactdefaultargs") GetNbGroups;
		%feature("autodoc", "	:rtype: int
") GetNbGroups;
		int GetNbGroups ();
		%feature("compactdefaultargs") GetGroups;
		%feature("autodoc", "	:rtype: std::set<SMESHDS_GroupBase *>
") GetGroups;
		const std::set<SMESHDS_GroupBase *> & GetGroups ();
		%feature("compactdefaultargs") IsGroupOfSubShapes;
		%feature("autodoc", "	:param aSubShape:
	:type aSubShape: TopoDS_Shape &
	:rtype: bool
") IsGroupOfSubShapes;
		bool IsGroupOfSubShapes (const TopoDS_Shape & aSubShape);
};


%extend SMESHDS_Mesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESHDS_Script;
class SMESHDS_Script {
	public:
		%feature("compactdefaultargs") SMESHDS_Script;
		%feature("autodoc", "	:param theIsEmbeddedMode:
	:type theIsEmbeddedMode: bool
	:rtype: None
") SMESHDS_Script;
		 SMESHDS_Script (bool theIsEmbeddedMode);
		%feature("compactdefaultargs") SetModified;
		%feature("autodoc", "	:param theModified:
	:type theModified: bool
	:rtype: None
") SetModified;
		void SetModified (bool theModified);
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	:rtype: bool
") IsModified;
		bool IsModified ();
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param NewNodeID:
	:type NewNodeID: int
	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") AddNode;
		void AddNode (int NewNodeID,double x,double y,double z);
		%feature("compactdefaultargs") Add0DElement;
		%feature("autodoc", "	:param New0DElementID:
	:type New0DElementID: int
	:param idnode:
	:type idnode: int
	:rtype: None
") Add0DElement;
		void Add0DElement (int New0DElementID,int idnode);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param NewEdgeID:
	:type NewEdgeID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:rtype: None
") AddEdge;
		void AddEdge (int NewEdgeID,int idnode1,int idnode2);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int idnode1,int idnode2,int idnode3);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int idnode1,int idnode2,int idnode3,int idnode4);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4,int idnode5);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:param idnode6:
	:type idnode6: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4,int idnode5,int idnode6);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param idnode1:
	:type idnode1: int
	:param idnode2:
	:type idnode2: int
	:param idnode3:
	:type idnode3: int
	:param idnode4:
	:type idnode4: int
	:param idnode5:
	:type idnode5: int
	:param idnode6:
	:type idnode6: int
	:param idnode7:
	:type idnode7: int
	:param idnode8:
	:type idnode8: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int idnode1,int idnode2,int idnode3,int idnode4,int idnode5,int idnode6,int idnode7,int idnode8);
		%feature("compactdefaultargs") AddPolygonalFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:rtype: None
") AddPolygonalFace;
		void AddPolygonalFace (const int NewFaceID,std::vector<int> nodes_ids);
		%feature("compactdefaultargs") AddPolyhedralVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: None
") AddPolyhedralVolume;
		void AddPolyhedralVolume (const int NewVolID,std::vector<int> nodes_ids,std::vector<int> quantities);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param NewEdgeID:
	:type NewEdgeID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n12:
	:type n12: int
	:rtype: None
") AddEdge;
		void AddEdge (int NewEdgeID,int n1,int n2,int n12);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int n1,int n2,int n3,int n12,int n23,int n31);
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	:param NewFaceID:
	:type NewFaceID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:rtype: None
") AddFace;
		void AddFace (int NewFaceID,int n1,int n2,int n3,int n4,int n12,int n23,int n34,int n41);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n14:
	:type n14: int
	:param n24:
	:type n24: int
	:param n34:
	:type n34: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n12,int n23,int n31,int n14,int n24,int n34);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n15:
	:type n15: int
	:param n25:
	:type n25: int
	:param n35:
	:type n35: int
	:param n45:
	:type n45: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n5,int n12,int n23,int n34,int n41,int n15,int n25,int n35,int n45);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n31:
	:type n31: int
	:param n45:
	:type n45: int
	:param n56:
	:type n56: int
	:param n64:
	:type n64: int
	:param n14:
	:type n14: int
	:param n25:
	:type n25: int
	:param n36:
	:type n36: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n5,int n6,int n12,int n23,int n31,int n45,int n56,int n64,int n14,int n25,int n36);
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "	:param NewVolID:
	:type NewVolID: int
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param n3:
	:type n3: int
	:param n4:
	:type n4: int
	:param n5:
	:type n5: int
	:param n6:
	:type n6: int
	:param n7:
	:type n7: int
	:param n8:
	:type n8: int
	:param n12:
	:type n12: int
	:param n23:
	:type n23: int
	:param n34:
	:type n34: int
	:param n41:
	:type n41: int
	:param n56:
	:type n56: int
	:param n67:
	:type n67: int
	:param n78:
	:type n78: int
	:param n85:
	:type n85: int
	:param n15:
	:type n15: int
	:param n26:
	:type n26: int
	:param n37:
	:type n37: int
	:param n48:
	:type n48: int
	:rtype: None
") AddVolume;
		void AddVolume (int NewVolID,int n1,int n2,int n3,int n4,int n5,int n6,int n7,int n8,int n12,int n23,int n34,int n41,int n56,int n67,int n78,int n85,int n15,int n26,int n37,int n48);
		%feature("compactdefaultargs") MoveNode;
		%feature("autodoc", "	:param NewNodeID:
	:type NewNodeID: int
	:param x:
	:type x: double
	:param y:
	:type y: double
	:param z:
	:type z: double
	:rtype: None
") MoveNode;
		void MoveNode (int NewNodeID,double x,double y,double z);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	:param NodeID:
	:type NodeID: int
	:rtype: None
") RemoveNode;
		void RemoveNode (int NodeID);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	:param ElementID:
	:type ElementID: int
	:rtype: None
") RemoveElement;
		void RemoveElement (int ElementID);
		%feature("compactdefaultargs") ChangePolyhedronNodes;
		%feature("autodoc", "	:param ElementID:
	:type ElementID: int
	:param nodes_ids:
	:type nodes_ids: std::vector<int>
	:param quantities:
	:type quantities: std::vector<int>
	:rtype: None
") ChangePolyhedronNodes;
		void ChangePolyhedronNodes (const int ElementID,std::vector<int> nodes_ids,std::vector<int> quantities);
		%feature("compactdefaultargs") Renumber;
		%feature("autodoc", "	:param isNodes:
	:type isNodes: bool
	:param startID:
	:type startID: int
	:param deltaID:
	:type deltaID: int
	:rtype: None
") Renumber;
		void Renumber (const bool isNodes,const int startID,const int deltaID);
		%feature("compactdefaultargs") ClearMesh;
		%feature("autodoc", "	:rtype: None
") ClearMesh;
		void ClearMesh ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") GetCommands;
		%feature("autodoc", "	:rtype: std::list<SMESHDS_Command *>
") GetCommands;
		const std::list<SMESHDS_Command *> & GetCommands ();
};


%extend SMESHDS_Script {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESHDS_SubMesh;
class SMESHDS_SubMesh {
	public:
		%feature("compactdefaultargs") IsComplexSubmesh;
		%feature("autodoc", "	:rtype: bool
") IsComplexSubmesh;
		bool IsComplexSubmesh ();
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "	:param ME:
	:type ME: SMDS_MeshElement *
	:rtype: None
") AddElement;
		void AddElement (const SMDS_MeshElement * ME);
		%feature("compactdefaultargs") RemoveElement;
		%feature("autodoc", "	:param ME:
	:type ME: SMDS_MeshElement *
	:param isElemDeleted:
	:type isElemDeleted: bool
	:rtype: bool
") RemoveElement;
		bool RemoveElement (const SMDS_MeshElement * ME,bool isElemDeleted);
		%feature("compactdefaultargs") AddNode;
		%feature("autodoc", "	:param ME:
	:type ME: SMDS_MeshNode *
	:rtype: None
") AddNode;
		void AddNode (const SMDS_MeshNode * ME);
		%feature("compactdefaultargs") RemoveNode;
		%feature("autodoc", "	:param ME:
	:type ME: SMDS_MeshNode *
	:param isNodeDeleted:
	:type isNodeDeleted: bool
	:rtype: bool
") RemoveNode;
		bool RemoveNode (const SMDS_MeshNode * ME,bool isNodeDeleted);
		%feature("compactdefaultargs") AddSubMesh;
		%feature("autodoc", "	:param theSubMesh:
	:type theSubMesh: SMESHDS_SubMesh *
	:rtype: None
") AddSubMesh;
		void AddSubMesh (const SMESHDS_SubMesh * theSubMesh);
		%feature("compactdefaultargs") RemoveSubMesh;
		%feature("autodoc", "	:param theSubMesh:
	:type theSubMesh: SMESHDS_SubMesh *
	:rtype: bool
") RemoveSubMesh;
		bool RemoveSubMesh (const SMESHDS_SubMesh * theSubMesh);
		%feature("compactdefaultargs") ContainsSubMesh;
		%feature("autodoc", "	:param theSubMesh:
	:type theSubMesh: SMESHDS_SubMesh *
	:rtype: bool
") ContainsSubMesh;
		bool ContainsSubMesh (const SMESHDS_SubMesh * theSubMesh);
		%feature("compactdefaultargs") NbSubMeshes;
		%feature("autodoc", "	:rtype: int
") NbSubMeshes;
		int NbSubMeshes ();
		%feature("compactdefaultargs") GetSubMeshIterator;
		%feature("autodoc", "	:rtype: SMESHDS_SubMeshIteratorPtr
") GetSubMeshIterator;
		SMESHDS_SubMeshIteratorPtr GetSubMeshIterator ();
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "	:rtype: int
") NbElements;
		int NbElements ();
		%feature("compactdefaultargs") GetElements;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") GetElements;
		SMDS_ElemIteratorPtr GetElements ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	:rtype: int
") NbNodes;
		int NbNodes ();
		%feature("compactdefaultargs") GetNodes;
		%feature("autodoc", "	:rtype: SMDS_NodeIteratorPtr
") GetNodes;
		SMDS_NodeIteratorPtr GetNodes ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param ME:
	:type ME: SMDS_MeshElement *
	:rtype: bool
") Contains;
		bool Contains (const SMDS_MeshElement * ME);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%extend SMESHDS_SubMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESHDS_Group;
class SMESHDS_Group : public SMESHDS_GroupBase {
	public:
		%feature("compactdefaultargs") SMESHDS_Group;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:param theMesh:
	:type theMesh: SMESHDS_Mesh *
	:param theType:
	:type theType: SMDSAbs_ElementType
	:rtype: None
") SMESHDS_Group;
		 SMESHDS_Group (const int theID,const SMESHDS_Mesh * theMesh,const SMDSAbs_ElementType theType);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	:param theType:
	:type theType: SMDSAbs_ElementType
	:rtype: None
") SetType;
		void SetType (SMDSAbs_ElementType theType);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		int Extent ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		bool IsEmpty ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:rtype: bool
") Contains;
		bool Contains (const int theID);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:rtype: bool
") Contains;
		bool Contains (const SMDS_MeshElement * elem);
		%feature("compactdefaultargs") GetElements;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") GetElements;
		SMDS_ElemIteratorPtr GetElements ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:rtype: bool
") Add;
		bool Add (const int theID);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:rtype: bool
") Remove;
		bool Remove (const int theID);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SMDSGroup;
		%feature("autodoc", "	:rtype: SMDS_MeshGroup
") SMDSGroup;
		SMDS_MeshGroup & SMDSGroup ();
};


%extend SMESHDS_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SMESHDS_GroupOnGeom;
class SMESHDS_GroupOnGeom : public SMESHDS_GroupBase {
	public:
		%feature("compactdefaultargs") SMESHDS_GroupOnGeom;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:param theMesh:
	:type theMesh: SMESHDS_Mesh *
	:param theType:
	:type theType: SMDSAbs_ElementType
	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SMESHDS_GroupOnGeom;
		 SMESHDS_GroupOnGeom (const int theID,const SMESHDS_Mesh * theMesh,const SMDSAbs_ElementType theType,const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetShape;
		TopoDS_Shape GetShape ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theID:
	:type theID: int
	:rtype: bool
") Contains;
		bool Contains (const int theID);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param elem:
	:type elem: SMDS_MeshElement *
	:rtype: bool
") Contains;
		bool Contains (const SMDS_MeshElement * elem);
		%feature("compactdefaultargs") GetElements;
		%feature("autodoc", "	:rtype: SMDS_ElemIteratorPtr
") GetElements;
		SMDS_ElemIteratorPtr GetElements ();
};


%extend SMESHDS_GroupOnGeom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
