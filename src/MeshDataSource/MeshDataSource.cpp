#include "MeshDataSource.h"

#include <Precision.hxx>
#include <Standard_ConstructionError.hxx>
#include <Standard_DimensionMismatch.hxx>
#include <Standard_OutOfRange.hxx>

IMPLEMENT_STANDARD_RTTIEXT(MeshDS_DataSource, MeshVS_DataSource)

namespace
{
//! Unit normal of the triangle (P1, P2, P3), null vector when degenerated.
gp_Vec triangleNormal(const gp_Pnt& theP1, const gp_Pnt& theP2, const gp_Pnt& theP3)
{
  gp_Vec aNormal = gp_Vec(theP1, theP2).Crossed(gp_Vec(theP2, theP3));
  if (aNormal.SquareMagnitude() > Precision::SquareConfusion())
  {
    aNormal.Normalize();
  }
  else
  {
    aNormal.SetCoord(0.0, 0.0, 0.0);
  }
  return aNormal;
}

//! Normalizes a vector, null vector when degenerated.
void normalize(gp_Vec& theVec)
{
  if (theVec.SquareMagnitude() > Precision::SquareConfusion())
  {
    theVec.Normalize();
  }
  else
  {
    theVec.SetCoord(0.0, 0.0, 0.0);
  }
}

//! Writes X, Y, Z of theVec at theCoords[theIndex..theIndex+2].
void setCoords(std::vector<double>& theCoords, const size_t theIndex, const gp_Vec& theVec)
{
  theCoords[theIndex]     = theVec.X();
  theCoords[theIndex + 1] = theVec.Y();
  theCoords[theIndex + 2] = theVec.Z();
}
} // namespace

//=================================================================================================

MeshDS_DataSource::MeshDS_DataSource(const std::vector<gp_Pnt>&           theNodes,
                                     const std::vector<std::vector<int>>& theElements)
{
  const int aNbNodes    = static_cast<int>(theNodes.size());
  const int aNbElements = static_cast<int>(theElements.size());

  // flatten the input: the element connectivity is padded to
  // MaxNodesPerElement, the coordinates copied contiguously
  std::vector<double> aCoords(3 * static_cast<size_t>(aNbNodes));
  for (int aNode = 0; aNode < aNbNodes; ++aNode)
  {
    theNodes[aNode].Coord(aCoords[3 * aNode], aCoords[3 * aNode + 1], aCoords[3 * aNode + 2]);
  }

  std::vector<int> anElemNodes(static_cast<size_t>(MaxNodesPerElement) * aNbElements, 0);
  std::vector<int> anElemNbNodes(aNbElements);
  for (int anElem = 0; anElem < aNbElements; ++anElem)
  {
    const std::vector<int>& aNodes = theElements[anElem];
    if (aNodes.size() < 3 || aNodes.size() > static_cast<size_t>(MaxNodesPerElement))
    {
      throw Standard_ConstructionError(
        "MeshDS_DataSource: an element must have 3 or 4 nodes");
    }
    anElemNbNodes[anElem] = static_cast<int>(aNodes.size());
    std::copy(aNodes.begin(), aNodes.end(), anElemNodes.begin() + MaxNodesPerElement * anElem);
  }

  Initialize(aNbNodes,
             aCoords.data(),
             aNbElements,
             anElemNodes.data(),
             anElemNbNodes.data(),
             MaxNodesPerElement);
}

//=================================================================================================

MeshDS_DataSource::MeshDS_DataSource(double* theVertices,
                                     int     theNbVertices,
                                     int     theNbCoords,
                                     int*    theFaces,
                                     int     theNbFaces,
                                     int     theNbFaceNodes)
{
  if (theNbCoords != 3)
  {
    throw Standard_DimensionMismatch(
      "MeshDS_DataSource: the vertices array must have 3 columns (X, Y, Z)");
  }
  if (theNbFaceNodes != 3 && theNbFaceNodes != MaxNodesPerElement)
  {
    throw Standard_DimensionMismatch(
      "MeshDS_DataSource: the faces array must have 3 (triangles) or 4 (quadrangles) columns");
  }
  Initialize(theNbVertices, theVertices, theNbFaces, theFaces, nullptr, theNbFaceNodes);
}

//=================================================================================================

MeshDS_DataSource::MeshDS_DataSource(const occ::handle<Poly_Triangulation>& theTriangulation)
{
  if (theTriangulation.IsNull())
  {
    throw Standard_ConstructionError("MeshDS_DataSource: null triangulation");
  }
  const int aNbNodes     = theTriangulation->NbNodes();
  const int aNbTriangles = theTriangulation->NbTriangles();

  std::vector<double> aCoords(3 * static_cast<size_t>(aNbNodes));
  for (int aNode = 1; aNode <= aNbNodes; ++aNode)
  {
    const size_t anIndex = 3 * static_cast<size_t>(aNode - 1);
    theTriangulation->Node(aNode).Coord(aCoords[anIndex], aCoords[anIndex + 1], aCoords[anIndex + 2]);
  }

  // Poly_Triangle node indices are 1-based, the connectivity is 0-based
  std::vector<int> aTriangles(3 * static_cast<size_t>(aNbTriangles));
  for (int aTri = 1; aTri <= aNbTriangles; ++aTri)
  {
    const size_t anIndex = 3 * static_cast<size_t>(aTri - 1);
    theTriangulation->Triangle(aTri).Get(aTriangles[anIndex], aTriangles[anIndex + 1], aTriangles[anIndex + 2]);
    for (size_t i = anIndex; i < anIndex + 3; ++i)
    {
      --aTriangles[i];
    }
  }

  Initialize(aNbNodes, aCoords.data(), aNbTriangles, aTriangles.data(), nullptr, 3);

  // the triangulation normals are better than the averaged element normals
  if (theTriangulation->HasNormals())
  {
    for (int aTri = 0; aTri < aNbTriangles; ++aTri)
    {
      for (int aRank = 0; aRank < 3; ++aRank)
      {
        const int aNodeId = aTriangles[3 * static_cast<size_t>(aTri) + aRank] + 1;
        setCoords(myNodeNormals,
                  3 * (static_cast<size_t>(MaxNodesPerElement) * aTri + aRank),
                  gp_Vec(theTriangulation->Normal(aNodeId)));
      }
    }
  }
}

//=================================================================================================

void MeshDS_DataSource::Initialize(int           theNbNodes,
                                   const double* theCoords,
                                   int           theNbElements,
                                   const int*    theElemNodes,
                                   const int*    theElemNbNodes,
                                   int           theStride)
{
  if (theNbNodes < 0 || theNbElements < 0)
  {
    throw Standard_ConstructionError("MeshDS_DataSource: negative number of nodes or elements");
  }

  myNodeCoords.assign(theCoords, theCoords + 3 * static_cast<size_t>(theNbNodes));
  for (int aNode = 1; aNode <= theNbNodes; ++aNode)
  {
    myNodes.Add(aNode);
  }

  myElemNodes.assign(static_cast<size_t>(MaxNodesPerElement) * theNbElements, 0);
  myElemNbNodes.resize(theNbElements);
  for (int anElem = 0; anElem < theNbElements; ++anElem)
  {
    myElements.Add(anElem + 1);
    const int  aNbElemNodes = theElemNbNodes != nullptr ? theElemNbNodes[anElem] : theStride;
    const int* anInput      = theElemNodes + static_cast<size_t>(theStride) * anElem;
    int*       anOutput     = myElemNodes.data() + static_cast<size_t>(MaxNodesPerElement) * anElem;
    myElemNbNodes[anElem]   = aNbElemNodes;
    for (int aRank = 0; aRank < aNbElemNodes; ++aRank)
    {
      const int aNodeIndex = anInput[aRank];
      if (aNodeIndex < 0 || aNodeIndex >= theNbNodes)
      {
        throw Standard_OutOfRange("MeshDS_DataSource: element node index out of range");
      }
      anOutput[aRank] = aNodeIndex + 1;
    }
  }

  ComputeNormals();
}

//=================================================================================================

void MeshDS_DataSource::ComputeNormals()
{
  const int aNbNodes    = NbNodes();
  const int aNbElements = NbElements();

  // element normals, from the three first nodes
  myElemNormals.resize(3 * static_cast<size_t>(aNbElements));
  for (int anElem = 0; anElem < aNbElements; ++anElem)
  {
    const int* aNodeIds = myElemNodes.data() + static_cast<size_t>(MaxNodesPerElement) * anElem;
    gp_Pnt     aPnts[3];
    for (int aRank = 0; aRank < 3; ++aRank)
    {
      const double* aCoord = myNodeCoords.data() + 3 * static_cast<size_t>(aNodeIds[aRank] - 1);
      aPnts[aRank].SetCoord(aCoord[0], aCoord[1], aCoord[2]);
    }
    setCoords(myElemNormals, 3 * static_cast<size_t>(anElem), triangleNormal(aPnts[0], aPnts[1], aPnts[2]));
  }

  // node normals: average of the normals of the elements sharing the node
  std::vector<gp_Vec> aNodeNormals(aNbNodes, gp_Vec(0.0, 0.0, 0.0));
  for (int anElem = 0; anElem < aNbElements; ++anElem)
  {
    const int*    aNodeIds = myElemNodes.data() + static_cast<size_t>(MaxNodesPerElement) * anElem;
    const double* aNormal  = myElemNormals.data() + 3 * static_cast<size_t>(anElem);
    const gp_Vec  anElemNormal(aNormal[0], aNormal[1], aNormal[2]);
    for (int aRank = 0; aRank < myElemNbNodes[anElem]; ++aRank)
    {
      aNodeNormals[aNodeIds[aRank] - 1] += anElemNormal;
    }
  }
  for (gp_Vec& aNormal : aNodeNormals)
  {
    normalize(aNormal);
  }

  // stored per element node, as queried by GetNodeNormal
  myNodeNormals.assign(3 * static_cast<size_t>(MaxNodesPerElement) * aNbElements, 0.0);
  for (int anElem = 0; anElem < aNbElements; ++anElem)
  {
    const int* aNodeIds = myElemNodes.data() + static_cast<size_t>(MaxNodesPerElement) * anElem;
    for (int aRank = 0; aRank < myElemNbNodes[anElem]; ++aRank)
    {
      setCoords(myNodeNormals,
                3 * (static_cast<size_t>(MaxNodesPerElement) * anElem + aRank),
                aNodeNormals[aNodeIds[aRank] - 1]);
    }
  }
}

//=================================================================================================

void MeshDS_DataSource::SetElemNormals(const std::vector<gp_Vec>& theElemNormals)
{
  if (theElemNormals.size() != static_cast<size_t>(NbElements()))
  {
    throw Standard_DimensionMismatch("MeshDS_DataSource: one normal per element is expected");
  }
  for (size_t anElem = 0; anElem < theElemNormals.size(); ++anElem)
  {
    setCoords(myElemNormals, 3 * anElem, theElemNormals[anElem]);
  }
}

//=================================================================================================

void MeshDS_DataSource::SetNodeNormals(const std::vector<std::vector<gp_Vec>>& theNodeNormals)
{
  if (theNodeNormals.size() != static_cast<size_t>(NbElements()))
  {
    throw Standard_DimensionMismatch(
      "MeshDS_DataSource: one list of node normals per element is expected");
  }
  for (size_t anElem = 0; anElem < theNodeNormals.size(); ++anElem)
  {
    if (theNodeNormals[anElem].size() != static_cast<size_t>(myElemNbNodes[anElem]))
    {
      throw Standard_DimensionMismatch(
        "MeshDS_DataSource: one normal per node of the element is expected");
    }
  }
  for (size_t anElem = 0; anElem < theNodeNormals.size(); ++anElem)
  {
    for (size_t aRank = 0; aRank < theNodeNormals[anElem].size(); ++aRank)
    {
      setCoords(myNodeNormals,
                3 * (static_cast<size_t>(MaxNodesPerElement) * anElem + aRank),
                theNodeNormals[anElem][aRank]);
    }
  }
}

//=================================================================================================

bool MeshDS_DataSource::GetGeom(const int                   ID,
                                const bool                  IsElement,
                                NCollection_Array1<double>& Coords,
                                int&                        NbNodes,
                                MeshVS_EntityType&          Type) const
{
  if (IsElement)
  {
    if (!IsValidElement(ID))
    {
      return false;
    }
    NbNodes = myElemNbNodes[ID - 1];
    if (Coords.Length() < 3 * NbNodes)
    {
      return false;
    }
    Type = MeshVS_ET_Face;
    const int* aNodeIds = myElemNodes.data() + static_cast<size_t>(MaxNodesPerElement) * (ID - 1);
    int        k        = Coords.Lower();
    for (int aRank = 0; aRank < NbNodes; ++aRank)
    {
      const double* aCoord = myNodeCoords.data() + 3 * static_cast<size_t>(aNodeIds[aRank] - 1);
      Coords(k++)          = aCoord[0];
      Coords(k++)          = aCoord[1];
      Coords(k++)          = aCoord[2];
    }
    return true;
  }

  if (ID < 1 || ID > this->NbNodes() || Coords.Length() < 3)
  {
    return false;
  }
  Type                 = MeshVS_ET_Node;
  NbNodes              = 1;
  const double* aCoord = myNodeCoords.data() + 3 * static_cast<size_t>(ID - 1);
  const int     aLower = Coords.Lower();
  Coords(aLower)       = aCoord[0];
  Coords(aLower + 1)   = aCoord[1];
  Coords(aLower + 2)   = aCoord[2];
  return true;
}

//=================================================================================================

bool MeshDS_DataSource::GetGeomType(const int, const bool IsElement, MeshVS_EntityType& Type) const
{
  Type = IsElement ? MeshVS_ET_Face : MeshVS_ET_Node;
  return true;
}

//=================================================================================================

void* MeshDS_DataSource::GetAddr(const int, const bool) const
{
  return nullptr;
}

//=================================================================================================

bool MeshDS_DataSource::GetNodesByElement(const int                ID,
                                          NCollection_Array1<int>& NodeIDs,
                                          int&                     NbNodes) const
{
  if (!IsValidElement(ID))
  {
    return false;
  }
  NbNodes = myElemNbNodes[ID - 1];
  if (NodeIDs.Length() < NbNodes)
  {
    return false;
  }
  const int* aNodeIds = myElemNodes.data() + static_cast<size_t>(MaxNodesPerElement) * (ID - 1);
  const int  aLower   = NodeIDs.Lower();
  for (int aRank = 0; aRank < NbNodes; ++aRank)
  {
    NodeIDs(aLower + aRank) = aNodeIds[aRank];
  }
  return true;
}

//=================================================================================================

const TColStd_PackedMapOfInteger& MeshDS_DataSource::GetAllNodes() const
{
  return myNodes;
}

//=================================================================================================

const TColStd_PackedMapOfInteger& MeshDS_DataSource::GetAllElements() const
{
  return myElements;
}

//=================================================================================================

bool MeshDS_DataSource::GetNormal(const int Id,
                                  const int Max,
                                  double&   nx,
                                  double&   ny,
                                  double&   nz) const
{
  if (!IsValidElement(Id) || Max < 3)
  {
    return false;
  }
  const double* aNormal = myElemNormals.data() + 3 * static_cast<size_t>(Id - 1);
  nx                    = aNormal[0];
  ny                    = aNormal[1];
  nz                    = aNormal[2];
  return true;
}

//=================================================================================================

bool MeshDS_DataSource::GetNodeNormal(const int rankNode,
                                      const int ElementId,
                                      double&   nx,
                                      double&   ny,
                                      double&   nz) const
{
  if (!IsValidElement(ElementId) || rankNode < 1 || rankNode > myElemNbNodes[ElementId - 1])
  {
    return false;
  }
  const double* aNormal =
    myNodeNormals.data()
    + 3 * (static_cast<size_t>(MaxNodesPerElement) * (ElementId - 1) + (rankNode - 1));
  nx = aNormal[0];
  ny = aNormal[1];
  nz = aNormal[2];
  return true;
}
