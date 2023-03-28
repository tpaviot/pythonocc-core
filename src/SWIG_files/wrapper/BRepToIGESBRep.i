/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define BREPTOIGESBREPDOCSTRING
"BRepToIGESBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_breptoigesbrep.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOIGESBREPDOCSTRING) BRepToIGESBRep


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BRepToIGESBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepToIGES_module.hxx>
#include<TopoDS_module.hxx>
#include<IGESData_module.hxx>
#include<Message_module.hxx>
#include<IGESSolid_module.hxx>
#include<MoniTool_module.hxx>
#include<Message_module.hxx>
#include<IGESBasic_module.hxx>
#include<IGESGeom_module.hxx>
#include<Geom_module.hxx>
#include<Interface_module.hxx>
#include<Transfer_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepToIGES.i
%import TopoDS.i
%import IGESData.i
%import Message.i
%import IGESSolid.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class BRepToIGESBRep_Entity *
******************************/
class BRepToIGESBRep_Entity : public BRepToIGES_BREntity {
	public:
		/****************** BRepToIGESBRep_Entity ******************/
		/**** md5 signature: 68abd1e8ae64270fbccf3a08fc9fdbbf ****/
		%feature("compactdefaultargs") BRepToIGESBRep_Entity;
		%feature("autodoc", "Creates a tool entity.

Returns
-------
None
") BRepToIGESBRep_Entity;
		 BRepToIGESBRep_Entity();

		/****************** AddEdge ******************/
		/**** md5 signature: f4ad3fcc68186c6f3f369cfababda74f ****/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Stores <myedge> in 'myedges' and <mycurve3d> in 'mycurves'. returns the index of <myedge>.

Parameters
----------
myedge: TopoDS_Edge
mycurve3d: IGESData_IGESEntity

Returns
-------
int
") AddEdge;
		Standard_Integer AddEdge(const TopoDS_Edge & myedge, const opencascade::handle<IGESData_IGESEntity> & mycurve3d);

		/****************** AddVertex ******************/
		/**** md5 signature: eb60c5b126ff6d184304dc48bfb9fa3a ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Stores <myvertex> in 'myvertices' returns the index of <myvertex>.

Parameters
----------
myvertex: TopoDS_Vertex

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const TopoDS_Vertex & myvertex);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents of the fields.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IndexEdge ******************/
		/**** md5 signature: 99282164ca62e8eceb9155e25182fe45 ****/
		%feature("compactdefaultargs") IndexEdge;
		%feature("autodoc", "Returns the index of <myedge> in 'myedges'.

Parameters
----------
myedge: TopoDS_Edge

Returns
-------
int
") IndexEdge;
		Standard_Integer IndexEdge(const TopoDS_Edge & myedge);

		/****************** IndexVertex ******************/
		/**** md5 signature: fb1f0c4212bb5f4a8fcfe744bd2d4009 ****/
		%feature("compactdefaultargs") IndexVertex;
		%feature("autodoc", "Returns the index of <myvertex> in 'myvertices'.

Parameters
----------
myvertex: TopoDS_Vertex

Returns
-------
int
") IndexVertex;
		Standard_Integer IndexVertex(const TopoDS_Vertex & myvertex);

		/****************** TransferCompSolid ******************/
		/**** md5 signature: 40785b5d35a62debe69fca1bc3364330 ****/
		%feature("compactdefaultargs") TransferCompSolid;
		%feature("autodoc", "Transfert an compsolid entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_CompSolid
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCompSolid;
		opencascade::handle<IGESData_IGESEntity> TransferCompSolid(const TopoDS_CompSolid & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferCompound ******************/
		/**** md5 signature: 84815d201dd7ab7dafb870ef423d829f ****/
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", "Transfert a compound entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Compound
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferCompound;
		opencascade::handle<IGESData_IGESEntity> TransferCompound(const TopoDS_Compound & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferEdge ******************/
		/**** md5 signature: 1fc8149953c5a26bf61be75b45b3197f ****/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "Transfert an edge entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myedge: TopoDS_Edge

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferEdge;
		opencascade::handle<IGESData_IGESEntity> TransferEdge(const TopoDS_Edge & myedge);

		/****************** TransferEdge ******************/
		/**** md5 signature: cf4862a3def50c02c1b020b9a634d6c4 ****/
		%feature("compactdefaultargs") TransferEdge;
		%feature("autodoc", "Transfert an edge entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
myedge: TopoDS_Edge
myface: TopoDS_Face
length: float

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferEdge;
		opencascade::handle<IGESData_IGESEntity> TransferEdge(const TopoDS_Edge & myedge, const TopoDS_Face & myface, const Standard_Real length);

		/****************** TransferEdgeList ******************/
		/**** md5 signature: 63e1edad07a1e288948c13550c02e2d9 ****/
		%feature("compactdefaultargs") TransferEdgeList;
		%feature("autodoc", "Transfert an edge entity from topods to iges.

Returns
-------
None
") TransferEdgeList;
		void TransferEdgeList();

		/****************** TransferFace ******************/
		/**** md5 signature: ae259ba8ebcb3492653bd726cf3b7a6e ****/
		%feature("compactdefaultargs") TransferFace;
		%feature("autodoc", "Transfert a face entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Face

Returns
-------
opencascade::handle<IGESSolid_Face>
") TransferFace;
		opencascade::handle<IGESSolid_Face> TransferFace(const TopoDS_Face & start);

		/****************** TransferShape ******************/
		/**** md5 signature: 92dbcddc61bc2869b1ea4425778dfeda ****/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "Returns the result of the transfert of any shape if the transfer has failed, this member return a nullentity.

Parameters
----------
start: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESData_IGESEntity>
") TransferShape;
		virtual opencascade::handle<IGESData_IGESEntity> TransferShape(const TopoDS_Shape & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferShell ******************/
		/**** md5 signature: aadb48d7ff36e7632442c80a3321f7c7 ****/
		%feature("compactdefaultargs") TransferShell;
		%feature("autodoc", "Transfert an shell entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Shell
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESSolid_Shell>
") TransferShell;
		opencascade::handle<IGESSolid_Shell> TransferShell(const TopoDS_Shell & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferSolid ******************/
		/**** md5 signature: f6577b6897466b543bf4964a499b72bc ****/
		%feature("compactdefaultargs") TransferSolid;
		%feature("autodoc", "Transfert a solid entity from topods to iges if this entity could not be converted, this member returns a nullentity.

Parameters
----------
start: TopoDS_Solid
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<IGESSolid_ManifoldSolid>
") TransferSolid;
		opencascade::handle<IGESSolid_ManifoldSolid> TransferSolid(const TopoDS_Solid & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** TransferVertexList ******************/
		/**** md5 signature: 99a21e2b470390a4b5e62e68232b5bdc ****/
		%feature("compactdefaultargs") TransferVertexList;
		%feature("autodoc", "Create the vertexlist entity.

Returns
-------
None
") TransferVertexList;
		void TransferVertexList();

		/****************** TransferWire ******************/
		/**** md5 signature: ab8dabd523923b3a896d13e890d7cada ****/
		%feature("compactdefaultargs") TransferWire;
		%feature("autodoc", "Transfert a wire entity from topods to iges. returns the curve associated to mywire in the parametric space of myface. if this entity could not be converted, this member returns a nullentity.

Parameters
----------
mywire: TopoDS_Wire
myface: TopoDS_Face
length: float

Returns
-------
opencascade::handle<IGESSolid_Loop>
") TransferWire;
		opencascade::handle<IGESSolid_Loop> TransferWire(const TopoDS_Wire & mywire, const TopoDS_Face & myface, const Standard_Real length);

};


%extend BRepToIGESBRep_Entity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
