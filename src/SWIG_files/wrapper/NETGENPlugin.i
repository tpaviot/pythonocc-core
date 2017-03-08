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
%module (package="OCC") NETGENPlugin

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


%include NETGENPlugin_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor NETGENPlugin_Hypothesis;
class NETGENPlugin_Hypothesis : public SMESH_Hypothesis {
	public:
/* public enums */
enum Fineness {
	VeryCoarse = 0,
	Coarse = 1,
	Moderate = 2,
	Fine = 3,
	VeryFine = 4,
	UserDefined = 5,
};

/* end public enums declaration */

		%feature("compactdefaultargs") NETGENPlugin_Hypothesis;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_Hypothesis;
		 NETGENPlugin_Hypothesis (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetMaxSize;
		%feature("autodoc", "	:param theSize:
	:type theSize: double
	:rtype: None
") SetMaxSize;
		void SetMaxSize (double theSize);
		%feature("compactdefaultargs") GetMaxSize;
		%feature("autodoc", "	:rtype: double
") GetMaxSize;
		double GetMaxSize ();
		%feature("compactdefaultargs") SetSecondOrder;
		%feature("autodoc", "	:param theVal:
	:type theVal: bool
	:rtype: None
") SetSecondOrder;
		void SetSecondOrder (bool theVal);
		%feature("compactdefaultargs") GetSecondOrder;
		%feature("autodoc", "	:rtype: bool
") GetSecondOrder;
		bool GetSecondOrder ();
		%feature("compactdefaultargs") SetOptimize;
		%feature("autodoc", "	:param theVal:
	:type theVal: bool
	:rtype: None
") SetOptimize;
		void SetOptimize (bool theVal);
		%feature("compactdefaultargs") GetOptimize;
		%feature("autodoc", "	:rtype: bool
") GetOptimize;
		bool GetOptimize ();
		%feature("compactdefaultargs") SetFineness;
		%feature("autodoc", "	:param theFineness:
	:type theFineness: Fineness
	:rtype: None
") SetFineness;
		void SetFineness (Fineness theFineness);
		%feature("compactdefaultargs") GetFineness;
		%feature("autodoc", "	:rtype: NETGENPlugin_Hypothesis::Fineness
") GetFineness;
		NETGENPlugin_Hypothesis::Fineness GetFineness ();
		%feature("compactdefaultargs") SetGrowthRate;
		%feature("autodoc", "	:param theRate:
	:type theRate: double
	:rtype: None
") SetGrowthRate;
		void SetGrowthRate (double theRate);
		%feature("compactdefaultargs") GetGrowthRate;
		%feature("autodoc", "	:rtype: double
") GetGrowthRate;
		double GetGrowthRate ();
		%feature("compactdefaultargs") SetNbSegPerEdge;
		%feature("autodoc", "	:param theVal:
	:type theVal: double
	:rtype: None
") SetNbSegPerEdge;
		void SetNbSegPerEdge (double theVal);
		%feature("compactdefaultargs") GetNbSegPerEdge;
		%feature("autodoc", "	:rtype: double
") GetNbSegPerEdge;
		double GetNbSegPerEdge ();
		%feature("compactdefaultargs") SetNbSegPerRadius;
		%feature("autodoc", "	:param theVal:
	:type theVal: double
	:rtype: None
") SetNbSegPerRadius;
		void SetNbSegPerRadius (double theVal);
		%feature("compactdefaultargs") GetNbSegPerRadius;
		%feature("autodoc", "	:rtype: double
") GetNbSegPerRadius;
		double GetNbSegPerRadius ();
		%feature("compactdefaultargs") GetDefaultMaxSize;
		%feature("autodoc", "	:rtype: double
") GetDefaultMaxSize;
		static double GetDefaultMaxSize ();
		%feature("compactdefaultargs") GetDefaultFineness;
		%feature("autodoc", "	:rtype: NETGENPlugin_Hypothesis::Fineness
") GetDefaultFineness;
		static NETGENPlugin_Hypothesis::Fineness GetDefaultFineness ();
		%feature("compactdefaultargs") GetDefaultGrowthRate;
		%feature("autodoc", "	:rtype: double
") GetDefaultGrowthRate;
		static double GetDefaultGrowthRate ();
		%feature("compactdefaultargs") GetDefaultNbSegPerEdge;
		%feature("autodoc", "	:rtype: double
") GetDefaultNbSegPerEdge;
		static double GetDefaultNbSegPerEdge ();
		%feature("compactdefaultargs") GetDefaultNbSegPerRadius;
		%feature("autodoc", "	:rtype: double
") GetDefaultNbSegPerRadius;
		static double GetDefaultNbSegPerRadius ();
		%feature("compactdefaultargs") GetDefaultSecondOrder;
		%feature("autodoc", "	:rtype: bool
") GetDefaultSecondOrder;
		static bool GetDefaultSecondOrder ();
		%feature("compactdefaultargs") GetDefaultOptimize;
		%feature("autodoc", "	:rtype: bool
") GetDefaultOptimize;
		static bool GetDefaultOptimize ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: ostream &
	:rtype: ostream
") SaveTo;
		ostream & SaveTo (ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: istream &
	:rtype: istream
") LoadFrom;
		istream & LoadFrom (istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Does nothing * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - always false */

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


%extend NETGENPlugin_Hypothesis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_Mesher;
class NETGENPlugin_Mesher {
	public:
		%feature("compactdefaultargs") NETGENPlugin_Mesher;
		%feature("autodoc", "	:param mesh:
	:type mesh: SMESH_Mesh *
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param isVolume:
	:type isVolume: bool
	:rtype: None
") NETGENPlugin_Mesher;
		 NETGENPlugin_Mesher (SMESH_Mesh * mesh,const TopoDS_Shape & aShape,const bool isVolume);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param hyp:
	:type hyp: NETGENPlugin_Hypothesis *
	:rtype: None
") SetParameters;
		void SetParameters (const NETGENPlugin_Hypothesis * hyp);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	:param hyp:
	:type hyp: NETGENPlugin_SimpleHypothesis_2D *
	:rtype: None
") SetParameters;
		void SetParameters (const NETGENPlugin_SimpleHypothesis_2D * hyp);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:rtype: bool
") Compute;
		bool Compute ();
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	:param aResMap:
	:type aResMap: MapShapeNbElems &
	:rtype: bool
") Evaluate;
		bool Evaluate (MapShapeNbElems & aResMap);
};


%extend NETGENPlugin_Mesher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_NETGEN_2D;
class NETGENPlugin_NETGEN_2D : public SMESH_2D_Algo {
	public:
		%feature("compactdefaultargs") NETGENPlugin_NETGEN_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_NETGEN_2D;
		 NETGENPlugin_NETGEN_2D (int hypId,int studyId,SMESH_Gen * gen);
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


%extend NETGENPlugin_NETGEN_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_NETGEN_2D3D;
class NETGENPlugin_NETGEN_2D3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") NETGENPlugin_NETGEN_2D3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_NETGEN_2D3D;
		 NETGENPlugin_NETGEN_2D3D (int hypId,int studyId,SMESH_Gen * gen);
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


%extend NETGENPlugin_NETGEN_2D3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_NETGEN_3D;
class NETGENPlugin_NETGEN_3D : public SMESH_3D_Algo {
	public:
		%feature("compactdefaultargs") NETGENPlugin_NETGEN_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_NETGEN_3D;
		 NETGENPlugin_NETGEN_3D (int hypId,int studyId,SMESH_Gen * gen);
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
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aMesh:
	:type aMesh: SMESH_Mesh &
	:param aHelper:
	:type aHelper: SMESH_MesherHelper *
	:rtype: bool
") Compute;
		bool Compute (SMESH_Mesh & aMesh,SMESH_MesherHelper * aHelper);
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


%extend NETGENPlugin_NETGEN_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_SimpleHypothesis_2D;
class NETGENPlugin_SimpleHypothesis_2D : public SMESH_Hypothesis {
	public:
		%feature("compactdefaultargs") NETGENPlugin_SimpleHypothesis_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_SimpleHypothesis_2D;
		 NETGENPlugin_SimpleHypothesis_2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetNumberOfSegments;
		%feature("autodoc", "	* /*! * Sets <number of segments> value */

	:param nb:
	:type nb: int
	:rtype: None
") SetNumberOfSegments;
		void SetNumberOfSegments (int nb);
		%feature("compactdefaultargs") GetNumberOfSegments;
		%feature("autodoc", "	* /*! * Returns <number of segments> value. * Can be zero in case if LocalLength() has been set */

	:rtype: int
") GetNumberOfSegments;
		int GetNumberOfSegments ();
		%feature("compactdefaultargs") SetLocalLength;
		%feature("autodoc", "	* /*! * Sets <segment length> value */

	:param segmentLength:
	:type segmentLength: double
	:rtype: None
") SetLocalLength;
		void SetLocalLength (double segmentLength);
		%feature("compactdefaultargs") GetLocalLength;
		%feature("autodoc", "	* /*! * Returns <segment length> value. * Can be zero in case if NumberOfSegments() has been set */

	:rtype: double
") GetLocalLength;
		double GetLocalLength ();
		%feature("compactdefaultargs") LengthFromEdges;
		%feature("autodoc", "	* /*! * Sets <maximum element area> to be dependent on 1D discretization */

	:rtype: None
") LengthFromEdges;
		void LengthFromEdges ();
		%feature("compactdefaultargs") SetMaxElementArea;
		%feature("autodoc", "	* /*! * Sets <maximum element area> value. * Zero or negative value means same as LengthFromEdges(). */

	:param area:
	:type area: double
	:rtype: None
") SetMaxElementArea;
		void SetMaxElementArea (double area);
		%feature("compactdefaultargs") GetMaxElementArea;
		%feature("autodoc", "	* /*! * Returns <maximum element area> value. * Can be zero in case of LengthFromEdges() */

	:rtype: double
") GetMaxElementArea;
		double GetMaxElementArea ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: ostream &
	:rtype: ostream
") SaveTo;
		ostream & SaveTo (ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: istream &
	:rtype: istream
") LoadFrom;
		istream & LoadFrom (istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Set parameters by mesh * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if theShape is meshed */

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


%extend NETGENPlugin_SimpleHypothesis_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_Hypothesis_2D;
class NETGENPlugin_Hypothesis_2D : public NETGENPlugin_Hypothesis {
	public:
		%feature("compactdefaultargs") NETGENPlugin_Hypothesis_2D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_Hypothesis_2D;
		 NETGENPlugin_Hypothesis_2D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") SetQuadAllowed;
		%feature("autodoc", "	:param theVal:
	:type theVal: bool
	:rtype: None
") SetQuadAllowed;
		void SetQuadAllowed (bool theVal);
		%feature("compactdefaultargs") GetQuadAllowed;
		%feature("autodoc", "	:rtype: bool
") GetQuadAllowed;
		bool GetQuadAllowed ();
		%feature("compactdefaultargs") GetDefaultQuadAllowed;
		%feature("autodoc", "	:rtype: bool
") GetDefaultQuadAllowed;
		static bool GetDefaultQuadAllowed ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: ostream &
	:rtype: ostream
") SaveTo;
		ostream & SaveTo (ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: istream &
	:rtype: istream
") LoadFrom;
		istream & LoadFrom (istream & load);
};


%extend NETGENPlugin_Hypothesis_2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor NETGENPlugin_SimpleHypothesis_3D;
class NETGENPlugin_SimpleHypothesis_3D : public NETGENPlugin_SimpleHypothesis_2D {
	public:
		%feature("compactdefaultargs") NETGENPlugin_SimpleHypothesis_3D;
		%feature("autodoc", "	:param hypId:
	:type hypId: int
	:param studyId:
	:type studyId: int
	:param gen:
	:type gen: SMESH_Gen *
	:rtype: None
") NETGENPlugin_SimpleHypothesis_3D;
		 NETGENPlugin_SimpleHypothesis_3D (int hypId,int studyId,SMESH_Gen * gen);
		%feature("compactdefaultargs") LengthFromFaces;
		%feature("autodoc", "	:rtype: None
") LengthFromFaces;
		void LengthFromFaces ();
		%feature("compactdefaultargs") SetMaxElementVolume;
		%feature("autodoc", "	:param value:
	:type value: double
	:rtype: None
") SetMaxElementVolume;
		void SetMaxElementVolume (double value);
		%feature("compactdefaultargs") GetMaxElementVolume;
		%feature("autodoc", "	:rtype: double
") GetMaxElementVolume;
		double GetMaxElementVolume ();
		%feature("compactdefaultargs") SaveTo;
		%feature("autodoc", "	:param save:
	:type save: ostream &
	:rtype: ostream
") SaveTo;
		ostream & SaveTo (ostream & save);
		%feature("compactdefaultargs") LoadFrom;
		%feature("autodoc", "	:param load:
	:type load: istream &
	:rtype: istream
") LoadFrom;
		istream & LoadFrom (istream & load);
		%feature("compactdefaultargs") SetParametersByMesh;
		%feature("autodoc", "	* /*! * \brief Set parameters by mesh * \param theMesh - the built mesh * \param theShape - the geometry of interest * etval bool - true if theShape is meshed */

	:param theMesh:
	:type theMesh: SMESH_Mesh *
	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") SetParametersByMesh;
		bool SetParametersByMesh (const SMESH_Mesh * theMesh,const TopoDS_Shape & theShape);
};


%extend NETGENPlugin_SimpleHypothesis_3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
