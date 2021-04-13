#include "MeshDataSource.h"
#include <vector>
#include <gp_Pnt.hxx>
#include <gp_Vec.hxx>
#include <Precision.hxx>
#include <Standard_Type.hxx>
#include <TColgp_SequenceOfXYZ.hxx>
#include <TColStd_DataMapOfIntegerInteger.hxx>
#include <TColStd_DataMapOfIntegerReal.hxx>

IMPLEMENT_STANDARD_RTTIEXT(Mesh_DataSource, MeshVS_DataSource)

Mesh_DataSource::Mesh_DataSource(std::vector<gp_Pnt>& CoordData, std::vector<std::vector<int>>& Ele2NodeData)
{
	InitializeFromData(CoordData, Ele2NodeData);
}

Mesh_DataSource::Mesh_DataSource(const Handle(Poly_Triangulation)& polyTri)
{
	// initialize arrays
	std::vector<gp_Pnt> CoordData;
	std::vector<std::vector<int>> Ele2NodeData;
	CoordData.resize(polyTri->NbNodes());
	Ele2NodeData.resize(polyTri->NbTriangles());
	//convert node data
	const TColgp_Array1OfPnt& nodes = polyTri->Nodes();
	for (Standard_Integer nodeId = nodes.Lower(); nodeId <= nodes.Upper(); nodeId++) {
		const gp_Pnt& node = nodes.Value(nodeId);
		CoordData[nodeId - nodes.Lower()] = node;
	}
	// convert triangle data
	const Poly_Array1OfTriangle& triangles = polyTri->Triangles();
	for (Standard_Integer ElementID = triangles.Lower(); ElementID <= triangles.Upper(); ElementID++) {
		const Poly_Triangle& tri = triangles.Value(ElementID);
		Ele2NodeData[ElementID - triangles.Lower()] = std::vector<int>{ tri(1) - nodes.Lower(), tri(2) - nodes.Lower(), tri(3) - nodes.Lower() };
	}
	InitializeFromData(CoordData, Ele2NodeData);
}
//================================================================
// Function : SetElemNormals
// Purpose  :
//================================================================
void Mesh_DataSource::SetElemNormals
(std::vector<gp_Vec>& ElemNormalsData)
{
	for (size_t ElementId = 1; ElementId <= ElemNormalsData.size(); ElementId++)
	{
		myElemNormals->SetValue(ElementId, 1, ElemNormalsData[ElementId - 1].X());
		myElemNormals->SetValue(ElementId, 2, ElemNormalsData[ElementId - 1].Y());
		myElemNormals->SetValue(ElementId, 3, ElemNormalsData[ElementId - 1].Z());
	}
}

//================================================================
// Function : SetNodeNormals
// Purpose  :
//================================================================
void Mesh_DataSource::SetNodeNormals
(std::vector<std::vector<gp_Vec>>& NodeNormalsData)
{
	for (size_t ElementId = 1; ElementId <= myElemNodes->NbRows(); ElementId++)
	{
		for (Standard_Integer rankNode = 1; rankNode <= myElemNumberNodes->Value(ElementId); rankNode++) {
			myNodeNormals->SetValue(ElementId, 3 * (rankNode - 1) + 1, NodeNormalsData[ElementId - 1][rankNode - 1].X());
			myNodeNormals->SetValue(ElementId, 3 * (rankNode - 1) + 2, NodeNormalsData[ElementId - 1][rankNode - 1].Y());
			myNodeNormals->SetValue(ElementId, 3 * (rankNode - 1) + 3, NodeNormalsData[ElementId - 1][rankNode - 1].Z());
		}
	}
}

//================================================================
// Function : GetGeom
// Purpose  :
//================================================================
Standard_Boolean Mesh_DataSource::GetGeom
(const Standard_Integer ID, const Standard_Boolean IsElement,
	TColStd_Array1OfReal& Coords, Standard_Integer& NbNodes,
	MeshVS_EntityType& Type) const
{
	if (IsElement)
	{
		if (ID >= 1 && ID <= myElements.Extent())
		{
			Type = MeshVS_ET_Face;
			NbNodes = myElemNumberNodes->Value(ID);
			for (Standard_Integer i = 1, k = 1; i <= NbNodes; i++)
			{
				Standard_Integer IdxNode = myElemNodes->Value(ID, i);
				for (Standard_Integer j = 1; j <= 3; j++, k++)
					Coords(k) = myNodeCoords->Value(IdxNode, j);
			}
			return Standard_True;
		}
		else
			return Standard_False;
	}
	else
		if (ID >= 1 && ID <= myNodes.Extent())
		{
			Type = MeshVS_ET_Node;
			NbNodes = 1;
			Coords(1) = myNodeCoords->Value(ID, 1);
			Coords(2) = myNodeCoords->Value(ID, 2);
			Coords(3) = myNodeCoords->Value(ID, 3);
			return Standard_True;
		}
		else
			return Standard_False;
}

//================================================================
// Function : GetGeomType
// Purpose  :
//================================================================
Standard_Boolean Mesh_DataSource::GetGeomType
(const Standard_Integer,
	const Standard_Boolean IsElement,
	MeshVS_EntityType& Type) const
{
	if (IsElement)
	{
		Type = MeshVS_ET_Face;
		return Standard_True;
	}
	else
	{
		Type = MeshVS_ET_Node;
		return Standard_True;
	}
}

//================================================================
// Function : GetAddr
// Purpose  :
//================================================================
Standard_Address Mesh_DataSource::GetAddr
(const Standard_Integer, const Standard_Boolean) const
{
	return NULL;
}

//================================================================
// Function : GetNodesByElement
// Purpose  :
//================================================================
Standard_Boolean Mesh_DataSource::GetNodesByElement
(const Standard_Integer ID,
	TColStd_Array1OfInteger& theNodeIDs,
	Standard_Integer& theNbNodes) const
{
	if (ID >= 1 && ID <= myElements.Extent() && theNodeIDs.Length() >= 3)
	{
		Standard_Integer aLow = theNodeIDs.Lower();
		theNbNodes = myElemNumberNodes->Value(ID);
		for (Standard_Integer j = 1; j <= theNbNodes; j++)
		{
			theNodeIDs(aLow + j - 1) = myElemNodes->Value(ID, j);
		}
		return Standard_True;
	}
	return Standard_False;
}

//================================================================
// Function : GetAllNodes
// Purpose  :
//================================================================
const TColStd_PackedMapOfInteger& Mesh_DataSource::GetAllNodes() const
{
	return myNodes;
}

//================================================================
// Function : GetAllElements
// Purpose  :
//================================================================
const TColStd_PackedMapOfInteger& Mesh_DataSource::GetAllElements() const
{
	return myElements;
}

//================================================================
// Function : GetNormal
// Purpose  :
//================================================================
Standard_Boolean Mesh_DataSource::GetNormal
(const Standard_Integer Id, const Standard_Integer Max,
	Standard_Real& nx, Standard_Real& ny, Standard_Real& nz) const
{
	if (Id >= 1 && Id <= myElements.Extent() && Max >= 3)
	{
		nx = myElemNormals->Value(Id, 1);
		ny = myElemNormals->Value(Id, 2);
		nz = myElemNormals->Value(Id, 3);
		return Standard_True;
	}
	else
		return Standard_False;
}

//================================================================
// Function : GetNodeNormal
// Purpose  :
//================================================================
Standard_Boolean Mesh_DataSource::GetNodeNormal
(const Standard_Integer rankNode, const Standard_Integer ElementId,
	Standard_Real& nx, Standard_Real& ny, Standard_Real& nz) const
{
	if (ElementId >= 1 && ElementId <= myElements.Extent())
	{
		nx = myNodeNormals->Value(ElementId, 3 * (rankNode - 1) + 1);
		ny = myNodeNormals->Value(ElementId, 3 * (rankNode - 1) + 2);
		nz = myNodeNormals->Value(ElementId, 3 * (rankNode - 1) + 3);
		return Standard_True;
	}
	else
		return Standard_False;
}

//================================================================
// Function : InitializeFromData
// Purpose  :
//================================================================
void Mesh_DataSource::InitializeFromData
(std::vector<gp_Pnt>& CoordData, std::vector<std::vector<int>>& Ele2NodeData)
{
	//initialize arrays
	myNodeCoords = new TColStd_HArray2OfReal(1, CoordData.size(), 1, 3);
	myElemNodes = new TColStd_HArray2OfInteger(1, Ele2NodeData.size(), 1, 4);
	myElemNumberNodes = new TColStd_HArray1OfInteger(1, Ele2NodeData.size());
	myElemNormals = new TColStd_HArray2OfReal(1, Ele2NodeData.size(), 1, 3);
	myNodeNormals = new TColStd_HArray2OfReal(1, Ele2NodeData.size(), 1, 12);	
	// fill node ids and coordinates
	for (size_t nodeId = 1; nodeId <= CoordData.size(); nodeId++)
	{
		myNodes.Add(nodeId);
		myNodeCoords->SetValue(nodeId, 1, CoordData[nodeId - 1].X());
		myNodeCoords->SetValue(nodeId, 2, CoordData[nodeId - 1].Y());
		myNodeCoords->SetValue(nodeId, 3, CoordData[nodeId - 1].Z());
	}
	// fill element ids, number of nodes, associated node ids and normals
	for (size_t ElementId = 1; ElementId <= Ele2NodeData.size(); ElementId++)
	{
		myElements.Add(ElementId);
		myElemNumberNodes->SetValue(ElementId, std::min((size_t)4, Ele2NodeData[ElementId - 1].size()));
		for (Standard_Integer rankNode = 1; rankNode <= myElemNumberNodes->Value(ElementId); rankNode++)
		{
			Standard_Integer nodeId = Ele2NodeData[ElementId - 1][rankNode - 1] + 1;
			myElemNodes->SetValue(ElementId, rankNode, nodeId);
		}
		// compute face normal
		const gp_Pnt aP1 = gp_Pnt(CoordData[Ele2NodeData[ElementId - 1][0]]);
		const gp_Pnt aP2 = gp_Pnt(CoordData[Ele2NodeData[ElementId - 1][1]]);
		const gp_Pnt aP3 = gp_Pnt(CoordData[Ele2NodeData[ElementId - 1][2]]);
		gp_Vec aV1(aP1, aP2);
		gp_Vec aV2(aP2, aP3);
		gp_Vec aN = aV1.Crossed(aV2);
		if (aN.SquareMagnitude() > Precision::SquareConfusion())
			aN.Normalize();
		else
			aN.SetCoord(0.0, 0.0, 0.0);
		myElemNormals->SetValue(ElementId, 1, aN.X());
		myElemNormals->SetValue(ElementId, 2, aN.Y());
		myElemNormals->SetValue(ElementId, 3, aN.Z());
	}
	// compute node normal
	std::vector<std::vector<int>> Node2EleData;
	Node2EleData.resize(CoordData.size());
	for (size_t ElementId = 0; ElementId < Ele2NodeData.size(); ElementId++) {
		for (size_t rankNode = 0; rankNode < Ele2NodeData[ElementId].size(); rankNode++) {
			int nodeId = Ele2NodeData[ElementId][rankNode];
			Node2EleData[nodeId].push_back(ElementId);
		}
	}
	std::vector<gp_Vec> nodeNormals;
	nodeNormals.resize(CoordData.size());
	for (size_t nodeId = 0; nodeId < Node2EleData.size(); nodeId++) {
		gp_Vec aN = gp_Vec(0, 0, 0);
		for (size_t rankEle = 0; rankEle < Node2EleData[nodeId].size(); rankEle++) {
			int ElementId = Node2EleData[nodeId][rankEle] + 1;
			aN += gp_Vec(myElemNormals->Value(ElementId, 1), myElemNormals->Value(ElementId, 2), myElemNormals->Value(ElementId, 3));
		}
		if (aN.SquareMagnitude() > Precision::SquareConfusion())
			aN.Normalize();
		else
			aN.SetCoord(0.0, 0.0, 0.0);
		nodeNormals[nodeId] = aN;
	}
	for (size_t ElementId = 0; ElementId < Ele2NodeData.size(); ElementId++)
	{
		for (size_t rankNode = 0; rankNode < Ele2NodeData[ElementId].size(); rankNode++)
		{
			int nodeId = Ele2NodeData[ElementId][rankNode];
			gp_Vec aN = nodeNormals[nodeId];
			myNodeNormals->SetValue(ElementId + 1, 3 * rankNode + 1, aN.X());
			myNodeNormals->SetValue(ElementId + 1, 3 * rankNode + 2, aN.Y());
			myNodeNormals->SetValue(ElementId + 1, 3 * rankNode + 3, aN.Z());
		}
	}
}