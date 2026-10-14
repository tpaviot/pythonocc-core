/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define HELIXBREPDOCSTRING
"HelixBRep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_helixbrep.html"
%enddef
%module (package="OCC.Core", docstring=HELIXBREPDOCSTRING) HelixBRep


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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<HelixBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i
%import gp.i
%import TColStd.i
%import TopoDS.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


%types(TopoDS_Compound *, TopoDS_CompSolid *, TopoDS_Solid *, TopoDS_Shell *,
       TopoDS_Face *, TopoDS_Wire *, TopoDS_Edge *, TopoDS_Vertex *);
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

/*******************************
* class HelixBRep_BuilderHelix *
*******************************/
class HelixBRep_BuilderHelix {
	public:
		/****** HelixBRep_BuilderHelix::HelixBRep_BuilderHelix ******/
		/****** md5 signature: 31c6e8dabe2e09d163c1b6cee2284da9 ******/
		%feature("compactdefaultargs") HelixBRep_BuilderHelix;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HelixBRep_BuilderHelix;
		 HelixBRep_BuilderHelix();

		/****** HelixBRep_BuilderHelix::ErrorStatus ******/
		/****** md5 signature: 13481d2945af376391a643c48d6d5825 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns error status of algorithm.
") ErrorStatus;
		int ErrorStatus();

		/****** HelixBRep_BuilderHelix::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs calculations.
") Perform;
		void Perform();

		/****** HelixBRep_BuilderHelix::SetApproxParameters ******/
		/****** md5 signature: 9ef5e23efff8224a17bc5333cad0f458 ******/
		%feature("compactdefaultargs") SetApproxParameters;
		%feature("autodoc", "
Parameters
----------
theTolerance: double
theMaxDegree: int
theContinuity: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets parameters for approximation.
") SetApproxParameters;
		void SetApproxParameters(const double theTolerance, const int theMaxDegree, const GeomAbs_Shape theContinuity);

		/****** HelixBRep_BuilderHelix::SetParameters ******/
		/****** md5 signature: 556b00b76efba746c2d40a95f8f35a0b ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax3
theDiams: TColStd_Array1OfReal
theHeights: TColStd_Array1OfReal
thePitches: TColStd_Array1OfReal
theIsPitches: TColStd_Array1OfBoolean

Return
-------
None

Description
-----------
Sets parameters of general composite helix.
") SetParameters;
		void SetParameters(const gp_Ax3 & theAxis, const TColStd_Array1OfReal & theDiams, const TColStd_Array1OfReal & theHeights, const TColStd_Array1OfReal & thePitches, const TColStd_Array1OfBoolean & theIsPitches);

		/****** HelixBRep_BuilderHelix::SetParameters ******/
		/****** md5 signature: 2adcc90d9fa8bd87670c302f0926dc7b ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax3
theDiam: double
theHeights: TColStd_Array1OfReal
thePitches: TColStd_Array1OfReal
theIsPitches: TColStd_Array1OfBoolean

Return
-------
None

Description
-----------
Sets parameters of pure helix.
") SetParameters;
		void SetParameters(const gp_Ax3 & theAxis, const double theDiam, const TColStd_Array1OfReal & theHeights, const TColStd_Array1OfReal & thePitches, const TColStd_Array1OfBoolean & theIsPitches);

		/****** HelixBRep_BuilderHelix::SetParameters ******/
		/****** md5 signature: c44b399462594f5dc89f3b8227212228 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax3
theDiam1: double
theDiam2: double
theHeights: TColStd_Array1OfReal
thePitches: TColStd_Array1OfReal
theIsPitches: TColStd_Array1OfBoolean

Return
-------
None

Description
-----------
Sets parameters of pure spiral.
") SetParameters;
		void SetParameters(const gp_Ax3 & theAxis, const double theDiam1, const double theDiam2, const TColStd_Array1OfReal & theHeights, const TColStd_Array1OfReal & thePitches, const TColStd_Array1OfBoolean & theIsPitches);

		/****** HelixBRep_BuilderHelix::SetParameters ******/
		/****** md5 signature: 6cb9e9ac2340d9df9b2110599390499d ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax3
theDiams: TColStd_Array1OfReal
thePitches: TColStd_Array1OfReal
theNbTurns: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Sets parameters of general composite helix.
") SetParameters;
		void SetParameters(const gp_Ax3 & theAxis, const TColStd_Array1OfReal & theDiams, const TColStd_Array1OfReal & thePitches, const TColStd_Array1OfReal & theNbTurns);

		/****** HelixBRep_BuilderHelix::SetParameters ******/
		/****** md5 signature: d20354a3939356f740dcab9e6111311d ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax3
theDiam: double
thePitches: TColStd_Array1OfReal
theNbTurns: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Sets parameters of pure helix.
") SetParameters;
		void SetParameters(const gp_Ax3 & theAxis, const double theDiam, const TColStd_Array1OfReal & thePitches, const TColStd_Array1OfReal & theNbTurns);

		/****** HelixBRep_BuilderHelix::SetParameters ******/
		/****** md5 signature: 68da7bb7f9aaae6e246ff75f6a2d1c2e ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax3
theDiam1: double
theDiam2: double
thePitches: TColStd_Array1OfReal
theNbTurns: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Sets parameters of pure spiral.
") SetParameters;
		void SetParameters(const gp_Ax3 & theAxis, const double theDiam1, const double theDiam2, const TColStd_Array1OfReal & thePitches, const TColStd_Array1OfReal & theNbTurns);

		/****** HelixBRep_BuilderHelix::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Gets result of algorithm.
") Shape;
		const TopoDS_Shape Shape();

		/****** HelixBRep_BuilderHelix::ToleranceReached ******/
		/****** md5 signature: 30e9580d438abb6d0f78978f7bdbf804 ******/
		%feature("compactdefaultargs") ToleranceReached;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets tolerance reached by approximation.
") ToleranceReached;
		double ToleranceReached();

		/****** HelixBRep_BuilderHelix::WarningStatus ******/
		/****** md5 signature: 414b0a191f67a5ee9c6e55a6a0bd7e86 ******/
		%feature("compactdefaultargs") WarningStatus;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns warning status of algorithm.
") WarningStatus;
		int WarningStatus();

};


%extend HelixBRep_BuilderHelix {
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
