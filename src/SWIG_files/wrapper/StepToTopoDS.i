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
%define STEPTOTOPODSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=STEPTOTOPODSDOCSTRING) StepToTopoDS

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


%include StepToTopoDS_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
enum StepToTopoDS_GeometricToolError {
	StepToTopoDS_GeometricToolDone = 0,
	StepToTopoDS_GeometricToolIsDegenerated = 1,
	StepToTopoDS_GeometricToolHasNoPCurve = 2,
	StepToTopoDS_GeometricToolWrong3dParameters = 3,
	StepToTopoDS_GeometricToolNoProjectiOnCurve = 4,
	StepToTopoDS_GeometricToolOther = 5,
};

enum StepToTopoDS_TranslateShellError {
	StepToTopoDS_TranslateShellDone = 0,
	StepToTopoDS_TranslateShellOther = 1,
};

enum StepToTopoDS_TranslatePolyLoopError {
	StepToTopoDS_TranslatePolyLoopDone = 0,
	StepToTopoDS_TranslatePolyLoopOther = 1,
};

enum StepToTopoDS_TranslateEdgeError {
	StepToTopoDS_TranslateEdgeDone = 0,
	StepToTopoDS_TranslateEdgeOther = 1,
};

enum StepToTopoDS_BuilderError {
	StepToTopoDS_BuilderDone = 0,
	StepToTopoDS_BuilderOther = 1,
};

enum StepToTopoDS_TranslateFaceError {
	StepToTopoDS_TranslateFaceDone = 0,
	StepToTopoDS_TranslateFaceOther = 1,
};

enum StepToTopoDS_TranslateVertexLoopError {
	StepToTopoDS_TranslateVertexLoopDone = 0,
	StepToTopoDS_TranslateVertexLoopOther = 1,
};

enum StepToTopoDS_TranslateEdgeLoopError {
	StepToTopoDS_TranslateEdgeLoopDone = 0,
	StepToTopoDS_TranslateEdgeLoopOther = 1,
};

enum StepToTopoDS_TranslateVertexError {
	StepToTopoDS_TranslateVertexDone = 0,
	StepToTopoDS_TranslateVertexOther = 1,
};

/* end public enums declaration */


%rename(steptotopods) StepToTopoDS;
class StepToTopoDS {
	public:
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_BuilderError
	:rtype: Handle_TCollection_HAsciiString
") DecodeBuilderError;
		static Handle_TCollection_HAsciiString DecodeBuilderError (const StepToTopoDS_BuilderError Error);
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateEdgeError
	:rtype: Handle_TCollection_HAsciiString
") DecodeEdgeError;
		static Handle_TCollection_HAsciiString DecodeEdgeError (const StepToTopoDS_TranslateEdgeError Error);
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateFaceError
	:rtype: Handle_TCollection_HAsciiString
") DecodeFaceError;
		static Handle_TCollection_HAsciiString DecodeFaceError (const StepToTopoDS_TranslateFaceError Error);
		%feature("compactdefaultargs") DecodeGeometricToolError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_GeometricToolError
	:rtype: char *
") DecodeGeometricToolError;
		static const char * DecodeGeometricToolError (const StepToTopoDS_GeometricToolError Error);
		%feature("compactdefaultargs") DecodePolyLoopError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslatePolyLoopError
	:rtype: Handle_TCollection_HAsciiString
") DecodePolyLoopError;
		static Handle_TCollection_HAsciiString DecodePolyLoopError (const StepToTopoDS_TranslatePolyLoopError Error);
		%feature("compactdefaultargs") DecodeShellError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateShellError
	:rtype: Handle_TCollection_HAsciiString
") DecodeShellError;
		static Handle_TCollection_HAsciiString DecodeShellError (const StepToTopoDS_TranslateShellError Error);
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateVertexError
	:rtype: Handle_TCollection_HAsciiString
") DecodeVertexError;
		static Handle_TCollection_HAsciiString DecodeVertexError (const StepToTopoDS_TranslateVertexError Error);
		%feature("compactdefaultargs") DecodeVertexLoopError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateVertexLoopError
	:rtype: Handle_TCollection_HAsciiString
") DecodeVertexLoopError;
		static Handle_TCollection_HAsciiString DecodeVertexLoopError (const StepToTopoDS_TranslateVertexLoopError Error);
};


%extend StepToTopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StepToTopoDS_CartesianPointHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value for the CartesianPoint

	:param K:
	:type K: Handle_StepGeom_CartesianPoint &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Handle_StepGeom_CartesianPoint & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two CartesianPoint are the same

	:param K1:
	:type K1: Handle_StepGeom_CartesianPoint &
	:param K2:
	:type K2: Handle_StepGeom_CartesianPoint &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Handle_StepGeom_CartesianPoint & K1,const Handle_StepGeom_CartesianPoint & K2);
};


%extend StepToTopoDS_CartesianPointHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StepToTopoDS_GeometricTool {
	public:
		%feature("compactdefaultargs") IsLikeSeam;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_SurfaceCurve &
	:param S:
	:type S: Handle_StepGeom_Surface &
	:param E:
	:type E: Handle_StepShape_Edge &
	:param EL:
	:type EL: Handle_StepShape_EdgeLoop &
	:rtype: bool
") IsLikeSeam;
		static Standard_Boolean IsLikeSeam (const Handle_StepGeom_SurfaceCurve & SC,const Handle_StepGeom_Surface & S,const Handle_StepShape_Edge & E,const Handle_StepShape_EdgeLoop & EL);
		%feature("compactdefaultargs") IsSeamCurve;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_SurfaceCurve &
	:param S:
	:type S: Handle_StepGeom_Surface &
	:param E:
	:type E: Handle_StepShape_Edge &
	:param EL:
	:type EL: Handle_StepShape_EdgeLoop &
	:rtype: bool
") IsSeamCurve;
		static Standard_Boolean IsSeamCurve (const Handle_StepGeom_SurfaceCurve & SC,const Handle_StepGeom_Surface & S,const Handle_StepShape_Edge & E,const Handle_StepShape_EdgeLoop & EL);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_SurfaceCurve &
	:param S:
	:type S: Handle_StepGeom_Surface &
	:param PC:
	:type PC: Handle_StepGeom_Pcurve &
	:param last: default value is 0
	:type last: int
	:rtype: int
") PCurve;
		static Standard_Integer PCurve (const Handle_StepGeom_SurfaceCurve & SC,const Handle_StepGeom_Surface & S,Handle_StepGeom_Pcurve & PC,const Standard_Integer last = 0);
		%feature("compactdefaultargs") UpdateParam3d;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param w1:
	:type w1: float &
	:param w2:
	:type w2: float &
	:param preci:
	:type preci: float
	:rtype: bool
") UpdateParam3d;
		static Standard_Boolean UpdateParam3d (const Handle_Geom_Curve & C,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real preci);
};


%extend StepToTopoDS_GeometricTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_NMTool;
class StepToTopoDS_NMTool {
	public:
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param RI:
	:type RI: Handle_StepRepr_RepresentationItem &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Bind;
		void Bind (const Handle_StepRepr_RepresentationItem & RI,const TopoDS_Shape & S);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param RIName:
	:type RIName: TCollection_AsciiString &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Bind;
		void Bind (const TCollection_AsciiString & RIName,const TopoDS_Shape & S);
		%feature("compactdefaultargs") CleanUp;
		%feature("autodoc", "	:rtype: None
") CleanUp;
		void CleanUp ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param RI:
	:type RI: Handle_StepRepr_RepresentationItem &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const Handle_StepRepr_RepresentationItem & RI);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param RIName:
	:type RIName: TCollection_AsciiString &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const TCollection_AsciiString & RIName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param MapOfRI:
	:type MapOfRI: StepToTopoDS_DataMapOfRI &
	:param MapOfRINames:
	:type MapOfRINames: StepToTopoDS_DataMapOfRINames &
	:rtype: None
") Init;
		void Init (const StepToTopoDS_DataMapOfRI & MapOfRI,const StepToTopoDS_DataMapOfRINames & MapOfRINames);
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param RI:
	:type RI: Handle_StepRepr_RepresentationItem &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_StepRepr_RepresentationItem & RI);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param RIName:
	:type RIName: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & RIName);
		%feature("compactdefaultargs") IsIDEASCase;
		%feature("autodoc", "	:rtype: bool
") IsIDEASCase;
		Standard_Boolean IsIDEASCase ();
		%feature("compactdefaultargs") IsPureNMShell;
		%feature("autodoc", "	:param Shell:
	:type Shell: TopoDS_Shape &
	:rtype: bool
") IsPureNMShell;
		Standard_Boolean IsPureNMShell (const TopoDS_Shape & Shell);
		%feature("compactdefaultargs") IsSuspectedAsClosing;
		%feature("autodoc", "	:param BaseShell:
	:type BaseShell: TopoDS_Shape &
	:param SuspectedShell:
	:type SuspectedShell: TopoDS_Shape &
	:rtype: bool
") IsSuspectedAsClosing;
		Standard_Boolean IsSuspectedAsClosing (const TopoDS_Shape & BaseShell,const TopoDS_Shape & SuspectedShell);
		%feature("compactdefaultargs") RegisterNMEdge;
		%feature("autodoc", "	:param Edge:
	:type Edge: TopoDS_Shape &
	:rtype: None
") RegisterNMEdge;
		void RegisterNMEdge (const TopoDS_Shape & Edge);
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "	:param isActive:
	:type isActive: bool
	:rtype: None
") SetActive;
		void SetActive (const Standard_Boolean isActive);
		%feature("compactdefaultargs") SetIDEASCase;
		%feature("autodoc", "	:param IDEASCase:
	:type IDEASCase: bool
	:rtype: None
") SetIDEASCase;
		void SetIDEASCase (const Standard_Boolean IDEASCase);
		%feature("compactdefaultargs") StepToTopoDS_NMTool;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_NMTool;
		 StepToTopoDS_NMTool ();
		%feature("compactdefaultargs") StepToTopoDS_NMTool;
		%feature("autodoc", "	:param MapOfRI:
	:type MapOfRI: StepToTopoDS_DataMapOfRI &
	:param MapOfRINames:
	:type MapOfRINames: StepToTopoDS_DataMapOfRINames &
	:rtype: None
") StepToTopoDS_NMTool;
		 StepToTopoDS_NMTool (const StepToTopoDS_DataMapOfRI & MapOfRI,const StepToTopoDS_DataMapOfRINames & MapOfRINames);
};


%extend StepToTopoDS_NMTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_PointPair;
class StepToTopoDS_PointPair {
	public:
		%feature("compactdefaultargs") StepToTopoDS_PointPair;
		%feature("autodoc", "	:param P1:
	:type P1: Handle_StepGeom_CartesianPoint &
	:param P2:
	:type P2: Handle_StepGeom_CartesianPoint &
	:rtype: None
") StepToTopoDS_PointPair;
		 StepToTopoDS_PointPair (const Handle_StepGeom_CartesianPoint & P1,const Handle_StepGeom_CartesianPoint & P2);
};


%extend StepToTopoDS_PointPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StepToTopoDS_PointPairHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a HasCode value for the PointPair

	:param K:
	:type K: StepToTopoDS_PointPair &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const StepToTopoDS_PointPair & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two PointPair are the same

	:param K1:
	:type K1: StepToTopoDS_PointPair &
	:param K2:
	:type K2: StepToTopoDS_PointPair &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const StepToTopoDS_PointPair & K1,const StepToTopoDS_PointPair & K2);
};


%extend StepToTopoDS_PointPairHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_Root;
class StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") MaxTol;
		%feature("autodoc", "	* Returns the value of 'MaxTol'

	:rtype: float
") MaxTol;
		Standard_Real MaxTol ();
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "	* Returns the value of 'MyPrecision'

	:rtype: float
") Precision;
		Standard_Real Precision ();
		%feature("compactdefaultargs") SetMaxTol;
		%feature("autodoc", "	* Sets the value of MaxTol

	:param maxpreci:
	:type maxpreci: float
	:rtype: None
") SetMaxTol;
		void SetMaxTol (const Standard_Real maxpreci);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets the value of 'MyPrecision'

	:param preci:
	:type preci: float
	:rtype: None
") SetPrecision;
		void SetPrecision (const Standard_Real preci);
};


%extend StepToTopoDS_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_Tool;
class StepToTopoDS_Tool {
	public:
		%feature("compactdefaultargs") AddContinuity;
		%feature("autodoc", "	:param GeomSurf:
	:type GeomSurf: Handle_Geom_Surface &
	:rtype: None
") AddContinuity;
		void AddContinuity (const Handle_Geom_Surface & GeomSurf);
		%feature("compactdefaultargs") AddContinuity;
		%feature("autodoc", "	:param GeomCurve:
	:type GeomCurve: Handle_Geom_Curve &
	:rtype: None
") AddContinuity;
		void AddContinuity (const Handle_Geom_Curve & GeomCurve);
		%feature("compactdefaultargs") AddContinuity;
		%feature("autodoc", "	:param GeomCur2d:
	:type GeomCur2d: Handle_Geom2d_Curve &
	:rtype: None
") AddContinuity;
		void AddContinuity (const Handle_Geom2d_Curve & GeomCur2d);
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param TRI:
	:type TRI: Handle_StepShape_TopologicalRepresentationItem &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Bind;
		void Bind (const Handle_StepShape_TopologicalRepresentationItem & TRI,const TopoDS_Shape & S);
		%feature("compactdefaultargs") BindEdge;
		%feature("autodoc", "	:param PP:
	:type PP: StepToTopoDS_PointPair &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BindEdge;
		void BindEdge (const StepToTopoDS_PointPair & PP,const TopoDS_Edge & E);
		%feature("compactdefaultargs") BindVertex;
		%feature("autodoc", "	:param P:
	:type P: Handle_StepGeom_CartesianPoint &
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") BindVertex;
		void BindVertex (const Handle_StepGeom_CartesianPoint & P,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") C0Cur2;
		%feature("autodoc", "	:rtype: int
") C0Cur2;
		Standard_Integer C0Cur2 ();
		%feature("compactdefaultargs") C0Cur3;
		%feature("autodoc", "	:rtype: int
") C0Cur3;
		Standard_Integer C0Cur3 ();
		%feature("compactdefaultargs") C0Surf;
		%feature("autodoc", "	:rtype: int
") C0Surf;
		Standard_Integer C0Surf ();
		%feature("compactdefaultargs") C1Cur2;
		%feature("autodoc", "	:rtype: int
") C1Cur2;
		Standard_Integer C1Cur2 ();
		%feature("compactdefaultargs") C1Cur3;
		%feature("autodoc", "	:rtype: int
") C1Cur3;
		Standard_Integer C1Cur3 ();
		%feature("compactdefaultargs") C1Surf;
		%feature("autodoc", "	:rtype: int
") C1Surf;
		Standard_Integer C1Surf ();
		%feature("compactdefaultargs") C2Cur2;
		%feature("autodoc", "	:rtype: int
") C2Cur2;
		Standard_Integer C2Cur2 ();
		%feature("compactdefaultargs") C2Cur3;
		%feature("autodoc", "	:rtype: int
") C2Cur3;
		Standard_Integer C2Cur3 ();
		%feature("compactdefaultargs") C2Surf;
		%feature("autodoc", "	:rtype: int
") C2Surf;
		Standard_Integer C2Surf ();
		%feature("compactdefaultargs") ClearEdgeMap;
		%feature("autodoc", "	:rtype: None
") ClearEdgeMap;
		void ClearEdgeMap ();
		%feature("compactdefaultargs") ClearVertexMap;
		%feature("autodoc", "	:rtype: None
") ClearVertexMap;
		void ClearVertexMap ();
		%feature("compactdefaultargs") ComputePCurve;
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") ComputePCurve;
		void ComputePCurve (const Standard_Boolean B);
		%feature("compactdefaultargs") ComputePCurve;
		%feature("autodoc", "	:rtype: bool
") ComputePCurve;
		Standard_Boolean ComputePCurve ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param TRI:
	:type TRI: Handle_StepShape_TopologicalRepresentationItem &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const Handle_StepShape_TopologicalRepresentationItem & TRI);
		%feature("compactdefaultargs") FindEdge;
		%feature("autodoc", "	:param PP:
	:type PP: StepToTopoDS_PointPair &
	:rtype: TopoDS_Edge
") FindEdge;
		const TopoDS_Edge  FindEdge (const StepToTopoDS_PointPair & PP);
		%feature("compactdefaultargs") FindVertex;
		%feature("autodoc", "	:param P:
	:type P: Handle_StepGeom_CartesianPoint &
	:rtype: TopoDS_Vertex
") FindVertex;
		const TopoDS_Vertex  FindVertex (const Handle_StepGeom_CartesianPoint & P);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Map:
	:type Map: StepToTopoDS_DataMapOfTRI &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") Init;
		void Init (const StepToTopoDS_DataMapOfTRI & Map,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param TRI:
	:type TRI: Handle_StepShape_TopologicalRepresentationItem &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_StepShape_TopologicalRepresentationItem & TRI);
		%feature("compactdefaultargs") IsEdgeBound;
		%feature("autodoc", "	:param PP:
	:type PP: StepToTopoDS_PointPair &
	:rtype: bool
") IsEdgeBound;
		Standard_Boolean IsEdgeBound (const StepToTopoDS_PointPair & PP);
		%feature("compactdefaultargs") IsVertexBound;
		%feature("autodoc", "	:param PG:
	:type PG: Handle_StepGeom_CartesianPoint &
	:rtype: bool
") IsVertexBound;
		Standard_Boolean IsVertexBound (const Handle_StepGeom_CartesianPoint & PG);
		%feature("compactdefaultargs") StepToTopoDS_Tool;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_Tool;
		 StepToTopoDS_Tool ();
		%feature("compactdefaultargs") StepToTopoDS_Tool;
		%feature("autodoc", "	:param Map:
	:type Map: StepToTopoDS_DataMapOfTRI &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") StepToTopoDS_Tool;
		 StepToTopoDS_Tool (const StepToTopoDS_DataMapOfTRI & Map,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
};


%extend StepToTopoDS_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_MakeTransformed;
class StepToTopoDS_MakeTransformed : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes a transformation to pass from an Origin placement to a Target placement. Returns True when done If not done, the transformation will by Identity

	:param Origin:
	:type Origin: Handle_StepGeom_Axis2Placement3d &
	:param Target:
	:type Target: Handle_StepGeom_Axis2Placement3d &
	:rtype: bool
") Compute;
		Standard_Boolean Compute (const Handle_StepGeom_Axis2Placement3d & Origin,const Handle_StepGeom_Axis2Placement3d & Target);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes a transformation defined by an operator 3D

	:param Operator:
	:type Operator: Handle_StepGeom_CartesianTransformationOperator3d &
	:rtype: bool
") Compute;
		Standard_Boolean Compute (const Handle_StepGeom_CartesianTransformationOperator3d & Operator);
		%feature("compactdefaultargs") StepToTopoDS_MakeTransformed;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_MakeTransformed;
		 StepToTopoDS_MakeTransformed ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Applies the computed transformation to a shape Returns False if the transformation is Identity

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") Transform;
		Standard_Boolean Transform (TopoDS_Shape & shape);
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Returns the computed transformation (Identity if not yet or if failed)

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();
		%feature("compactdefaultargs") TranslateMappedItem;
		%feature("autodoc", "	* Translates a MappedItem. More precisely A MappedItem has a MappingSource and a MappingTarget MappingSource has a MappedRepresentation and a MappingOrigin MappedRepresentation is the basic item to be instanced MappingOrigin is the starting placement MappingTarget is the final placement //! Hence, the transformation from MappingOrigin and MappingTarget is computed, the MappedRepr. is converted to a Shape, then transformed as an instance of this Shape

	:param mapit:
	:type mapit: Handle_StepRepr_MappedItem &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: TopoDS_Shape
") TranslateMappedItem;
		TopoDS_Shape TranslateMappedItem (const Handle_StepRepr_MappedItem & mapit,const Handle_Transfer_TransientProcess & TP);
};


%extend StepToTopoDS_MakeTransformed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateCompositeCurve;
class StepToTopoDS_TranslateCompositeCurve : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Translates standalone composite_curve

	:param CC:
	:type CC: Handle_StepGeom_CompositeCurve &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_StepGeom_CompositeCurve & CC,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Translates composite_curve lying on surface

	:param CC:
	:type CC: Handle_StepGeom_CompositeCurve &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param S:
	:type S: Handle_StepGeom_Surface &
	:param Surf:
	:type Surf: Handle_Geom_Surface &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_StepGeom_CompositeCurve & CC,const Handle_Transfer_TransientProcess & TP,const Handle_StepGeom_Surface & S,const Handle_Geom_Surface & Surf);
		%feature("compactdefaultargs") IsInfiniteSegment;
		%feature("autodoc", "	* Returns True if composite_curve contains a segment with infinite parameters.

	:rtype: bool
") IsInfiniteSegment;
		Standard_Boolean IsInfiniteSegment ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "	* Translates standalone composite_curve

	:param CC:
	:type CC: Handle_StepGeom_CompositeCurve &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve (const Handle_StepGeom_CompositeCurve & CC,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "	* Translates composite_curve lying on surface

	:param CC:
	:type CC: Handle_StepGeom_CompositeCurve &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param S:
	:type S: Handle_StepGeom_Surface &
	:param Surf:
	:type Surf: Handle_Geom_Surface &
	:rtype: None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve (const Handle_StepGeom_CompositeCurve & CC,const Handle_Transfer_TransientProcess & TP,const Handle_StepGeom_Surface & S,const Handle_Geom_Surface & Surf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns result of last translation or null wire if failed.

	:rtype: TopoDS_Wire
") Value;
		const TopoDS_Wire  Value ();
};


%extend StepToTopoDS_TranslateCompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateCurveBoundedSurface;
class StepToTopoDS_TranslateCurveBoundedSurface : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Translate surface

	:param CBS:
	:type CBS: Handle_StepGeom_CurveBoundedSurface &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_StepGeom_CurveBoundedSurface & CBS,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "	* Create empty tool

	:rtype: None
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "	* Translate surface

	:param CBS:
	:type CBS: Handle_StepGeom_CurveBoundedSurface &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface (const Handle_StepGeom_CurveBoundedSurface & CBS,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns result of last translation or null wire if failed.

	:rtype: TopoDS_Face
") Value;
		const TopoDS_Face  Value ();
};


%extend StepToTopoDS_TranslateCurveBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateEdge;
class StepToTopoDS_TranslateEdge : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslateEdgeError
") Error;
		StepToTopoDS_TranslateEdgeError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param E:
	:type E: Handle_StepShape_Edge &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_Edge & E,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") MakeFromCurve3D;
		%feature("autodoc", "	* Warning! C3D is assumed to be a Curve 3D ... other cases to checked before calling this

	:param C3D:
	:type C3D: Handle_StepGeom_Curve &
	:param EC:
	:type EC: Handle_StepShape_EdgeCurve &
	:param Vend:
	:type Vend: Handle_StepShape_Vertex &
	:param preci:
	:type preci: float
	:param E:
	:type E: TopoDS_Edge &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param T:
	:type T: StepToTopoDS_Tool &
	:rtype: None
") MakeFromCurve3D;
		void MakeFromCurve3D (const Handle_StepGeom_Curve & C3D,const Handle_StepShape_EdgeCurve & EC,const Handle_StepShape_Vertex & Vend,const Standard_Real preci,TopoDS_Edge & E,TopoDS_Vertex & V1,TopoDS_Vertex & V2,StepToTopoDS_Tool & T);
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "	:param PCU:
	:type PCU: Handle_StepGeom_Pcurve &
	:param ConvSurf:
	:type ConvSurf: Handle_Geom_Surface &
	:rtype: Handle_Geom2d_Curve
") MakePCurve;
		Handle_Geom2d_Curve MakePCurve (const Handle_StepGeom_Pcurve & PCU,const Handle_Geom_Surface & ConvSurf);
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "	:param E:
	:type E: Handle_StepShape_Edge &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge (const Handle_StepShape_Edge & E,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslateEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateEdgeLoop;
class StepToTopoDS_TranslateEdgeLoop : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslateEdgeLoopError
") Error;
		StepToTopoDS_TranslateEdgeLoopError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param FB:
	:type FB: Handle_StepShape_FaceBound &
	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param SS:
	:type SS: Handle_StepGeom_Surface &
	:param ss:
	:type ss: bool
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_FaceBound & FB,const TopoDS_Face & F,const Handle_Geom_Surface & S,const Handle_StepGeom_Surface & SS,const Standard_Boolean ss,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "	:param FB:
	:type FB: Handle_StepShape_FaceBound &
	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param SS:
	:type SS: Handle_StepGeom_Surface &
	:param ss:
	:type ss: bool
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop (const Handle_StepShape_FaceBound & FB,const TopoDS_Face & F,const Handle_Geom_Surface & S,const Handle_StepGeom_Surface & SS,const Standard_Boolean ss,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslateEdgeLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateFace;
class StepToTopoDS_TranslateFace : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslateFaceError
") Error;
		StepToTopoDS_TranslateFaceError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param FS:
	:type FS: Handle_StepShape_FaceSurface &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_FaceSurface & FS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "	:param FS:
	:type FS: Handle_StepShape_FaceSurface &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace (const Handle_StepShape_FaceSurface & FS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslateFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslatePolyLoop;
class StepToTopoDS_TranslatePolyLoop : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslatePolyLoopError
") Error;
		StepToTopoDS_TranslatePolyLoopError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param PL:
	:type PL: Handle_StepShape_PolyLoop &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param S:
	:type S: Handle_Geom_Surface &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_PolyLoop & PL,StepToTopoDS_Tool & T,const Handle_Geom_Surface & S,const TopoDS_Face & F);
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop ();
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "	:param PL:
	:type PL: Handle_StepShape_PolyLoop &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param S:
	:type S: Handle_Geom_Surface &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop (const Handle_StepShape_PolyLoop & PL,StepToTopoDS_Tool & T,const Handle_Geom_Surface & S,const TopoDS_Face & F);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslatePolyLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateShell;
class StepToTopoDS_TranslateShell : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslateShellError
") Error;
		StepToTopoDS_TranslateShellError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param CFS:
	:type CFS: Handle_StepShape_ConnectedFaceSet &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_ConnectedFaceSet & CFS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "	:param CFS:
	:type CFS: Handle_StepShape_ConnectedFaceSet &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell (const Handle_StepShape_ConnectedFaceSet & CFS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslateShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateVertex;
class StepToTopoDS_TranslateVertex : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslateVertexError
") Error;
		StepToTopoDS_TranslateVertexError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_Vertex &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_Vertex & V,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepShape_Vertex &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex (const Handle_StepShape_Vertex & V,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslateVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepToTopoDS_TranslateVertexLoop;
class StepToTopoDS_TranslateVertexLoop : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: StepToTopoDS_TranslateVertexLoopError
") Error;
		StepToTopoDS_TranslateVertexLoopError Error ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param VL:
	:type VL: Handle_StepShape_VertexLoop &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const Handle_StepShape_VertexLoop & VL,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "	:param VL:
	:type VL: Handle_StepShape_VertexLoop &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop (const Handle_StepShape_VertexLoop & VL,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend StepToTopoDS_TranslateVertexLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
