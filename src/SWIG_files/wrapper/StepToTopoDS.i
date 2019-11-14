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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define STEPTOTOPODSDOCSTRING
"StepToTopoDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_StepToTopoDS.html"
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


%{
#include<StepToTopoDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepRepr_module.hxx>
#include<StepGeom_module.hxx>
#include<StepShape_module.hxx>
#include<TCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Transfer_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepRepr.i
%import StepGeom.i
%import StepShape.i
%import TCollection.i
%import Geom.i
%import TopoDS.i
%import gp.i
%import Transfer.i
%import Geom2d.i
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

/* handles */
/* end handles declaration */

/* templates */
%template(StepToTopoDS_PointEdgeMap) NCollection_DataMap <StepToTopoDS_PointPair , TopoDS_Edge , StepToTopoDS_PointPairHasher>;
%template(StepToTopoDS_DataMapOfRI) NCollection_DataMap <opencascade::handle <StepRepr_RepresentationItem>, TopoDS_Shape , TColStd_MapTransientHasher>;
%template(StepToTopoDS_PointVertexMap) NCollection_DataMap <opencascade::handle <StepGeom_CartesianPoint>, TopoDS_Vertex , StepToTopoDS_CartesianPointHasher>;
%template(StepToTopoDS_DataMapOfRINames) NCollection_DataMap <TCollection_AsciiString , TopoDS_Shape , TCollection_AsciiString>;
%template(StepToTopoDS_DataMapOfTRI) NCollection_DataMap <opencascade::handle <StepShape_TopologicalRepresentationItem>, TopoDS_Shape , TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <StepToTopoDS_PointPair , TopoDS_Edge , StepToTopoDS_PointPairHasher> StepToTopoDS_PointEdgeMap;
typedef NCollection_DataMap <StepToTopoDS_PointPair , TopoDS_Edge , StepToTopoDS_PointPairHasher>::Iterator StepToTopoDS_DataMapIteratorOfPointEdgeMap;
typedef NCollection_DataMap <opencascade::handle <StepRepr_RepresentationItem>, TopoDS_Shape , TColStd_MapTransientHasher> StepToTopoDS_DataMapOfRI;
typedef NCollection_DataMap <opencascade::handle <StepRepr_RepresentationItem>, TopoDS_Shape , TColStd_MapTransientHasher>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfRI;
typedef NCollection_DataMap <opencascade::handle <StepGeom_CartesianPoint>, TopoDS_Vertex , StepToTopoDS_CartesianPointHasher> StepToTopoDS_PointVertexMap;
typedef NCollection_DataMap <opencascade::handle <StepGeom_CartesianPoint>, TopoDS_Vertex , StepToTopoDS_CartesianPointHasher>::Iterator StepToTopoDS_DataMapIteratorOfPointVertexMap;
typedef NCollection_DataMap <TCollection_AsciiString , TopoDS_Shape , TCollection_AsciiString> StepToTopoDS_DataMapOfRINames;
typedef NCollection_DataMap <TCollection_AsciiString , TopoDS_Shape , TCollection_AsciiString>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfRINames;
typedef NCollection_DataMap <opencascade::handle <StepShape_TopologicalRepresentationItem>, TopoDS_Shape , TColStd_MapTransientHasher> StepToTopoDS_DataMapOfTRI;
typedef NCollection_DataMap <opencascade::handle <StepShape_TopologicalRepresentationItem>, TopoDS_Shape , TColStd_MapTransientHasher>::Iterator StepToTopoDS_DataMapIteratorOfDataMapOfTRI;
/* end typedefs declaration */

%rename(steptotopods) StepToTopoDS;
class StepToTopoDS {
	public:
		%feature("compactdefaultargs") DecodeBuilderError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_BuilderError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeBuilderError;
		static opencascade::handle<TCollection_HAsciiString> DecodeBuilderError (const StepToTopoDS_BuilderError Error);
		%feature("compactdefaultargs") DecodeEdgeError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateEdgeError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeEdgeError;
		static opencascade::handle<TCollection_HAsciiString> DecodeEdgeError (const StepToTopoDS_TranslateEdgeError Error);
		%feature("compactdefaultargs") DecodeFaceError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateFaceError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeFaceError;
		static opencascade::handle<TCollection_HAsciiString> DecodeFaceError (const StepToTopoDS_TranslateFaceError Error);
		%feature("compactdefaultargs") DecodeGeometricToolError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_GeometricToolError
	:rtype: char *
") DecodeGeometricToolError;
		static const char * DecodeGeometricToolError (const StepToTopoDS_GeometricToolError Error);
		%feature("compactdefaultargs") DecodePolyLoopError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslatePolyLoopError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodePolyLoopError;
		static opencascade::handle<TCollection_HAsciiString> DecodePolyLoopError (const StepToTopoDS_TranslatePolyLoopError Error);
		%feature("compactdefaultargs") DecodeShellError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateShellError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeShellError;
		static opencascade::handle<TCollection_HAsciiString> DecodeShellError (const StepToTopoDS_TranslateShellError Error);
		%feature("compactdefaultargs") DecodeVertexError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateVertexError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeVertexError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexError (const StepToTopoDS_TranslateVertexError Error);
		%feature("compactdefaultargs") DecodeVertexLoopError;
		%feature("autodoc", "	:param Error:
	:type Error: StepToTopoDS_TranslateVertexLoopError
	:rtype: opencascade::handle<TCollection_HAsciiString>
") DecodeVertexLoopError;
		static opencascade::handle<TCollection_HAsciiString> DecodeVertexLoopError (const StepToTopoDS_TranslateVertexLoopError Error);
};


%extend StepToTopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StepToTopoDS_CartesianPointHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Computes a hash code for the cartesian point, in the range [1, theUpperBound] @param theCartesianPoint the cartesian point which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param theCartesianPoint:
	:type theCartesianPoint: opencascade::handle<StepGeom_CartesianPoint> &
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const opencascade::handle<StepGeom_CartesianPoint> & theCartesianPoint,Standard_Integer theUpperBound);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True when the two CartesianPoint are the same

	:param K1:
	:type K1: opencascade::handle<StepGeom_CartesianPoint> &
	:param K2:
	:type K2: opencascade::handle<StepGeom_CartesianPoint> &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const opencascade::handle<StepGeom_CartesianPoint> & K1,const opencascade::handle<StepGeom_CartesianPoint> & K2);
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
	:type SC: opencascade::handle<StepGeom_SurfaceCurve> &
	:param S:
	:type S: opencascade::handle<StepGeom_Surface> &
	:param E:
	:type E: opencascade::handle<StepShape_Edge> &
	:param EL:
	:type EL: opencascade::handle<StepShape_EdgeLoop> &
	:rtype: bool
") IsLikeSeam;
		static Standard_Boolean IsLikeSeam (const opencascade::handle<StepGeom_SurfaceCurve> & SC,const opencascade::handle<StepGeom_Surface> & S,const opencascade::handle<StepShape_Edge> & E,const opencascade::handle<StepShape_EdgeLoop> & EL);
		%feature("compactdefaultargs") IsSeamCurve;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_SurfaceCurve> &
	:param S:
	:type S: opencascade::handle<StepGeom_Surface> &
	:param E:
	:type E: opencascade::handle<StepShape_Edge> &
	:param EL:
	:type EL: opencascade::handle<StepShape_EdgeLoop> &
	:rtype: bool
") IsSeamCurve;
		static Standard_Boolean IsSeamCurve (const opencascade::handle<StepGeom_SurfaceCurve> & SC,const opencascade::handle<StepGeom_Surface> & S,const opencascade::handle<StepShape_Edge> & E,const opencascade::handle<StepShape_EdgeLoop> & EL);
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_SurfaceCurve> &
	:param S:
	:type S: opencascade::handle<StepGeom_Surface> &
	:param PC:
	:type PC: opencascade::handle<StepGeom_Pcurve> &
	:param last: default value is 0
	:type last: int
	:rtype: int
") PCurve;
		static Standard_Integer PCurve (const opencascade::handle<StepGeom_SurfaceCurve> & SC,const opencascade::handle<StepGeom_Surface> & S,opencascade::handle<StepGeom_Pcurve> & PC,const Standard_Integer last = 0);
		%feature("compactdefaultargs") UpdateParam3d;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Geom_Curve> &
	:param w1:
	:type w1: float &
	:param w2:
	:type w2: float &
	:param preci:
	:type preci: float
	:rtype: bool
") UpdateParam3d;
		static Standard_Boolean UpdateParam3d (const opencascade::handle<Geom_Curve> & C,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Real preci);
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
	:type RI: opencascade::handle<StepRepr_RepresentationItem> &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Bind;
		void Bind (const opencascade::handle<StepRepr_RepresentationItem> & RI,const TopoDS_Shape & S);
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
	:type RI: opencascade::handle<StepRepr_RepresentationItem> &
	:rtype: TopoDS_Shape
") Find;
		const TopoDS_Shape  Find (const opencascade::handle<StepRepr_RepresentationItem> & RI);
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
	:type RI: opencascade::handle<StepRepr_RepresentationItem> &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const opencascade::handle<StepRepr_RepresentationItem> & RI);
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
	:type P1: opencascade::handle<StepGeom_CartesianPoint> &
	:param P2:
	:type P2: opencascade::handle<StepGeom_CartesianPoint> &
	:rtype: None
") StepToTopoDS_PointPair;
		 StepToTopoDS_PointPair (const opencascade::handle<StepGeom_CartesianPoint> & P1,const opencascade::handle<StepGeom_CartesianPoint> & P2);
};


%extend StepToTopoDS_PointPair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StepToTopoDS_PointPairHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Computes a hash code for the point pair, in the range [1, theUpperBound] @param thePointPair the point pair which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param thePointPair:
	:type thePointPair: StepToTopoDS_PointPair &
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const StepToTopoDS_PointPair & thePointPair,Standard_Integer theUpperBound);
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
%nodefaultctor StepToTopoDS_MakeTransformed;
class StepToTopoDS_MakeTransformed : public StepToTopoDS_Root {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes a transformation to pass from an Origin placement to a Target placement. Returns True when done If not done, the transformation will by Identity

	:param Origin:
	:type Origin: opencascade::handle<StepGeom_Axis2Placement3d> &
	:param Target:
	:type Target: opencascade::handle<StepGeom_Axis2Placement3d> &
	:rtype: bool
") Compute;
		Standard_Boolean Compute (const opencascade::handle<StepGeom_Axis2Placement3d> & Origin,const opencascade::handle<StepGeom_Axis2Placement3d> & Target);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes a transformation defined by an operator 3D

	:param Operator:
	:type Operator: opencascade::handle<StepGeom_CartesianTransformationOperator3d> &
	:rtype: bool
") Compute;
		Standard_Boolean Compute (const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & Operator);
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
	:type mapit: opencascade::handle<StepRepr_MappedItem> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:rtype: TopoDS_Shape
") TranslateMappedItem;
		TopoDS_Shape TranslateMappedItem (const opencascade::handle<StepRepr_MappedItem> & mapit,const opencascade::handle<Transfer_TransientProcess> & TP);
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
	:type CC: opencascade::handle<StepGeom_CompositeCurve> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<StepGeom_CompositeCurve> & CC,const opencascade::handle<Transfer_TransientProcess> & TP);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Translates composite_curve lying on surface

	:param CC:
	:type CC: opencascade::handle<StepGeom_CompositeCurve> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:param S:
	:type S: opencascade::handle<StepGeom_Surface> &
	:param Surf:
	:type Surf: opencascade::handle<Geom_Surface> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<StepGeom_CompositeCurve> & CC,const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<StepGeom_Surface> & S,const opencascade::handle<Geom_Surface> & Surf);
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
	:type CC: opencascade::handle<StepGeom_CompositeCurve> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:rtype: None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve (const opencascade::handle<StepGeom_CompositeCurve> & CC,const opencascade::handle<Transfer_TransientProcess> & TP);
		%feature("compactdefaultargs") StepToTopoDS_TranslateCompositeCurve;
		%feature("autodoc", "	* Translates composite_curve lying on surface

	:param CC:
	:type CC: opencascade::handle<StepGeom_CompositeCurve> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:param S:
	:type S: opencascade::handle<StepGeom_Surface> &
	:param Surf:
	:type Surf: opencascade::handle<Geom_Surface> &
	:rtype: None
") StepToTopoDS_TranslateCompositeCurve;
		 StepToTopoDS_TranslateCompositeCurve (const opencascade::handle<StepGeom_CompositeCurve> & CC,const opencascade::handle<Transfer_TransientProcess> & TP,const opencascade::handle<StepGeom_Surface> & S,const opencascade::handle<Geom_Surface> & Surf);
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
	:type CBS: opencascade::handle<StepGeom_CurveBoundedSurface> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<StepGeom_CurveBoundedSurface> & CBS,const opencascade::handle<Transfer_TransientProcess> & TP);
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "	* Create empty tool

	:rtype: None
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateCurveBoundedSurface;
		%feature("autodoc", "	* Translate surface

	:param CBS:
	:type CBS: opencascade::handle<StepGeom_CurveBoundedSurface> &
	:param TP:
	:type TP: opencascade::handle<Transfer_TransientProcess> &
	:rtype: None
") StepToTopoDS_TranslateCurveBoundedSurface;
		 StepToTopoDS_TranslateCurveBoundedSurface (const opencascade::handle<StepGeom_CurveBoundedSurface> & CBS,const opencascade::handle<Transfer_TransientProcess> & TP);
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
	:type E: opencascade::handle<StepShape_Edge> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_Edge> & E,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") MakeFromCurve3D;
		%feature("autodoc", "	* Warning! C3D is assumed to be a Curve 3D ... other cases to checked before calling this

	:param C3D:
	:type C3D: opencascade::handle<StepGeom_Curve> &
	:param EC:
	:type EC: opencascade::handle<StepShape_EdgeCurve> &
	:param Vend:
	:type Vend: opencascade::handle<StepShape_Vertex> &
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
		void MakeFromCurve3D (const opencascade::handle<StepGeom_Curve> & C3D,const opencascade::handle<StepShape_EdgeCurve> & EC,const opencascade::handle<StepShape_Vertex> & Vend,const Standard_Real preci,TopoDS_Edge & E,TopoDS_Vertex & V1,TopoDS_Vertex & V2,StepToTopoDS_Tool & T);
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "	:param PCU:
	:type PCU: opencascade::handle<StepGeom_Pcurve> &
	:param ConvSurf:
	:type ConvSurf: opencascade::handle<Geom_Surface> &
	:rtype: opencascade::handle<Geom2d_Curve>
") MakePCurve;
		opencascade::handle<Geom2d_Curve> MakePCurve (const opencascade::handle<StepGeom_Pcurve> & PCU,const opencascade::handle<Geom_Surface> & ConvSurf);
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdge;
		%feature("autodoc", "	:param E:
	:type E: opencascade::handle<StepShape_Edge> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateEdge;
		 StepToTopoDS_TranslateEdge (const opencascade::handle<StepShape_Edge> & E,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
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
	:type FB: opencascade::handle<StepShape_FaceBound> &
	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: opencascade::handle<Geom_Surface> &
	:param SS:
	:type SS: opencascade::handle<StepGeom_Surface> &
	:param ss:
	:type ss: bool
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_FaceBound> & FB,const TopoDS_Face & F,const opencascade::handle<Geom_Surface> & S,const opencascade::handle<StepGeom_Surface> & SS,const Standard_Boolean ss,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateEdgeLoop;
		%feature("autodoc", "	:param FB:
	:type FB: opencascade::handle<StepShape_FaceBound> &
	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: opencascade::handle<Geom_Surface> &
	:param SS:
	:type SS: opencascade::handle<StepGeom_Surface> &
	:param ss:
	:type ss: bool
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateEdgeLoop;
		 StepToTopoDS_TranslateEdgeLoop (const opencascade::handle<StepShape_FaceBound> & FB,const TopoDS_Face & F,const opencascade::handle<Geom_Surface> & S,const opencascade::handle<StepGeom_Surface> & SS,const Standard_Boolean ss,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
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
	:type FS: opencascade::handle<StepShape_FaceSurface> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_FaceSurface> & FS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateFace;
		%feature("autodoc", "	:param FS:
	:type FS: opencascade::handle<StepShape_FaceSurface> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateFace;
		 StepToTopoDS_TranslateFace (const opencascade::handle<StepShape_FaceSurface> & FS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
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
	:type PL: opencascade::handle<StepShape_PolyLoop> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param S:
	:type S: opencascade::handle<Geom_Surface> &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_PolyLoop> & PL,StepToTopoDS_Tool & T,const opencascade::handle<Geom_Surface> & S,const TopoDS_Face & F);
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop ();
		%feature("compactdefaultargs") StepToTopoDS_TranslatePolyLoop;
		%feature("autodoc", "	:param PL:
	:type PL: opencascade::handle<StepShape_PolyLoop> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param S:
	:type S: opencascade::handle<Geom_Surface> &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") StepToTopoDS_TranslatePolyLoop;
		 StepToTopoDS_TranslatePolyLoop (const opencascade::handle<StepShape_PolyLoop> & PL,StepToTopoDS_Tool & T,const opencascade::handle<Geom_Surface> & S,const TopoDS_Face & F);
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
	:type CFS: opencascade::handle<StepShape_ConnectedFaceSet> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_ConnectedFaceSet> & CFS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateShell;
		%feature("autodoc", "	:param CFS:
	:type CFS: opencascade::handle<StepShape_ConnectedFaceSet> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateShell;
		 StepToTopoDS_TranslateShell (const opencascade::handle<StepShape_ConnectedFaceSet> & CFS,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
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
	:type V: opencascade::handle<StepShape_Vertex> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_Vertex> & V,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertex;
		%feature("autodoc", "	:param V:
	:type V: opencascade::handle<StepShape_Vertex> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateVertex;
		 StepToTopoDS_TranslateVertex (const opencascade::handle<StepShape_Vertex> & V,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
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
	:type VL: opencascade::handle<StepShape_VertexLoop> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") Init;
		void Init (const opencascade::handle<StepShape_VertexLoop> & VL,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "	:rtype: None
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop ();
		%feature("compactdefaultargs") StepToTopoDS_TranslateVertexLoop;
		%feature("autodoc", "	:param VL:
	:type VL: opencascade::handle<StepShape_VertexLoop> &
	:param T:
	:type T: StepToTopoDS_Tool &
	:param NMTool:
	:type NMTool: StepToTopoDS_NMTool &
	:rtype: None
") StepToTopoDS_TranslateVertexLoop;
		 StepToTopoDS_TranslateVertexLoop (const opencascade::handle<StepShape_VertexLoop> & VL,StepToTopoDS_Tool & T,StepToTopoDS_NMTool & NMTool);
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
