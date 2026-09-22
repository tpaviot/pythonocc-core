#ifndef _MeshDS_DataSource_HeaderFile
#define _MeshDS_DataSource_HeaderFile

#include <vector>

#include <MeshVS_DataSource.hxx>
#include <MeshVS_EntityType.hxx>
#include <NCollection_Array1.hxx>
#include <Poly_Triangulation.hxx>
#include <Standard_Handle.hxx>
#include <Standard_Type.hxx>
#include <TColStd_PackedMapOfInteger.hxx>
#include <gp_Pnt.hxx>
#include <gp_Vec.hxx>

class MeshDS_DataSource;
DEFINE_STANDARD_HANDLE(MeshDS_DataSource, MeshVS_DataSource)

//! MeshVS data source for a surface mesh made of triangles and quadrangles.
//!
//! The mesh is given by its nodes and its elements, each element being the
//! list of its 3 or 4 nodes, as 0-based node indices. Following the MeshVS
//! convention, node and element ids exposed by the data source are 1-based
//! and contiguous: node i of the input is node i+1 of the data source.
//!
//! Element normals are computed from the three first nodes of each element,
//! node normals by averaging the normals of the elements sharing the node.
//! Both can be overridden with SetElemNormals() and SetNodeNormals().
class MeshDS_DataSource : public MeshVS_DataSource
{
public:
  //! Initializes the data source from a list of nodes and a list of
  //! elements, each element being 3 or 4 0-based node indices.
  //! Raises Standard_ConstructionError if an element does not have 3 or 4
  //! nodes, Standard_OutOfRange if a node index is out of range.
  MeshDS_DataSource(const std::vector<gp_Pnt>&             theNodes,
                    const std::vector<std::vector<int>>&   theElements);

  //! Initializes the data source from row-major arrays, typically numpy
  //! arrays: theVertices is a theNbVertices x 3 array of coordinates,
  //! theFaces a theNbFaces x 3 (triangles) or theNbFaces x 4 (quadrangles)
  //! array of 0-based node indices.
  //! Raises Standard_DimensionMismatch if the arrays do not have 3 (or 4)
  //! columns, Standard_OutOfRange if a node index is out of range.
  MeshDS_DataSource(double* theVertices,
                    int     theNbVertices,
                    int     theNbCoords,
                    int*    theFaces,
                    int     theNbFaces,
                    int     theNbFaceNodes);

  //! Initializes the data source from a triangulation. When the
  //! triangulation carries normals, they are used as node normals.
  MeshDS_DataSource(const occ::handle<Poly_Triangulation>& theTriangulation);

  //! Number of nodes.
  int NbNodes() const { return static_cast<int>(myNodeCoords.size() / 3); }

  //! Number of elements.
  int NbElements() const { return static_cast<int>(myElemNbNodes.size()); }

  //! Sets the normal of each element, one vector per element.
  //! Raises Standard_DimensionMismatch if the number of normals differs
  //! from the number of elements.
  void SetElemNormals(const std::vector<gp_Vec>& theElemNormals);

  //! Sets the normal at each node of each element, one list of vectors
  //! per element, one vector per node of the element.
  //! Raises Standard_DimensionMismatch if the numbers do not match the
  //! elements.
  void SetNodeNormals(const std::vector<std::vector<gp_Vec>>& theNodeNormals);

  //! Returns the coordinates of node ID (IsElement false), or the
  //! coordinates of all the nodes of element ID, X, Y, Z of each node in
  //! turn. Coords must hold 3 * NbNodes values.
  bool GetGeom(const int                   ID,
               const bool                  IsElement,
               NCollection_Array1<double>& Coords,
               int&                        NbNodes,
               MeshVS_EntityType&          Type) const override;

  //! Returns the type of node or element ID.
  bool GetGeomType(const int ID, const bool IsElement, MeshVS_EntityType& Type) const override;

  //! No data structure is attached to nodes and elements, returns nullptr.
  void* GetAddr(const int ID, const bool IsElement) const override;

  //! Returns the ids of the nodes of element ID.
  bool GetNodesByElement(const int                ID,
                         NCollection_Array1<int>& NodeIDs,
                         int&                     NbNodes) const override;

  //! Returns the ids of all the nodes.
  const TColStd_PackedMapOfInteger& GetAllNodes() const override;

  //! Returns the ids of all the elements.
  const TColStd_PackedMapOfInteger& GetAllElements() const override;

  //! Returns the normal of element Id, used for flat shading.
  bool GetNormal(const int Id, const int Max, double& nx, double& ny, double& nz) const override;

  //! Returns the normal at node rankNode (1-based rank within the element)
  //! of element ElementId, used for smooth shading.
  bool GetNodeNormal(const int rankNode,
                     const int ElementId,
                     double&   nx,
                     double&   ny,
                     double&   nz) const override;

  DEFINE_STANDARD_RTTIEXT(MeshDS_DataSource, MeshVS_DataSource)

private:
  //! Maximum number of nodes of an element (quadrangle).
  static constexpr int MaxNodesPerElement = 4;

  //! Fills the data source from flat arrays. theCoords holds 3 values per
  //! node; theElemNodes theStride 0-based node indices per element, of
  //! which the theElemNbNodes[i] first ones are used (all of them when
  //! theElemNbNodes is nullptr).
  void Initialize(int           theNbNodes,
                  const double* theCoords,
                  int           theNbElements,
                  const int*    theElemNodes,
                  const int*    theElemNbNodes,
                  int           theStride);

  //! Computes the element normals from the three first nodes of each
  //! element, then the node normals as the average of the normals of the
  //! elements sharing each node.
  void ComputeNormals();

  bool IsValidElement(const int theId) const
  {
    return theId >= 1 && theId <= NbElements();
  }

  TColStd_PackedMapOfInteger myNodes;
  TColStd_PackedMapOfInteger myElements;
  //! X, Y, Z of each node
  std::vector<double> myNodeCoords;
  //! MaxNodesPerElement 1-based node ids per element, unused ones set to 0
  std::vector<int> myElemNodes;
  //! number of nodes of each element
  std::vector<int> myElemNbNodes;
  //! X, Y, Z of the normal of each element
  std::vector<double> myElemNormals;
  //! X, Y, Z of the normal at each of the MaxNodesPerElement nodes of each element
  std::vector<double> myNodeNormals;
};

#endif // _MeshDS_DataSource_HeaderFile
