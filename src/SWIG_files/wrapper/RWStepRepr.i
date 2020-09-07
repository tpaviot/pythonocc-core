/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define RWSTEPREPRDOCSTRING
"RWStepRepr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwsteprepr.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPREPRDOCSTRING) RWStepRepr


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
#include<RWStepRepr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<StepData_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import Interface.i
%import StepRepr.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************************
* class RWStepRepr_RWAllAroundShapeAspect *
******************************************/
class RWStepRepr_RWAllAroundShapeAspect {
	public:
		/****************** RWStepRepr_RWAllAroundShapeAspect ******************/
		/**** md5 signature: 657e1d639b766528a019415dd1a94316 ****/
		%feature("compactdefaultargs") RWStepRepr_RWAllAroundShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWAllAroundShapeAspect;
		 RWStepRepr_RWAllAroundShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: 6ff9af8a0a60bbeeba7ccd3e674d41f5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads allaroundshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_AllAroundShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: ca2377292022785d0bdf8b27ecea4b7b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_AllAroundShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fb111f251cd037850aa8a3d543b2a92d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes allaroundshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_AllAroundShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_AllAroundShapeAspect> & ent);

};


%extend RWStepRepr_RWAllAroundShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class RWStepRepr_RWApex *
**************************/
class RWStepRepr_RWApex {
	public:
		/****************** RWStepRepr_RWApex ******************/
		/**** md5 signature: e5f8eafcf5b7f84d02aa312111613904 ****/
		%feature("compactdefaultargs") RWStepRepr_RWApex;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWApex;
		 RWStepRepr_RWApex();

		/****************** ReadStep ******************/
		/**** md5 signature: 53b367615c73502f51675469bd1272b6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads apex.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Apex

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Apex> & ent);

		/****************** Share ******************/
		/**** md5 signature: 89c28ec9cd4e3afcf36242a053a60765 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_Apex
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Apex> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9bac65ea6fc386b3cec2ca24f6169c54 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes apex.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Apex

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Apex> & ent);

};


%extend RWStepRepr_RWApex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepRepr_RWAssemblyComponentUsage *
********************************************/
class RWStepRepr_RWAssemblyComponentUsage {
	public:
		/****************** RWStepRepr_RWAssemblyComponentUsage ******************/
		/**** md5 signature: 260076f4e4cae6311ef102e4d045aa4e ****/
		%feature("compactdefaultargs") RWStepRepr_RWAssemblyComponentUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWAssemblyComponentUsage;
		 RWStepRepr_RWAssemblyComponentUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: 9eeac239329b00041513af878a9ee5e0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads assemblycomponentusage.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_AssemblyComponentUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: f5e7f1f96fea48ef091837add2ba0716 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_AssemblyComponentUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8c693f3e2788f7db4f15c3dba18e60c0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes assemblycomponentusage.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_AssemblyComponentUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_AssemblyComponentUsage> & ent);

};


%extend RWStepRepr_RWAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWAssemblyComponentUsageSubstitute *
******************************************************/
class RWStepRepr_RWAssemblyComponentUsageSubstitute {
	public:
		/****************** RWStepRepr_RWAssemblyComponentUsageSubstitute ******************/
		/**** md5 signature: 3d933e009be5425bf910d1f691471c60 ****/
		%feature("compactdefaultargs") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWAssemblyComponentUsageSubstitute;
		 RWStepRepr_RWAssemblyComponentUsageSubstitute();

		/****************** ReadStep ******************/
		/**** md5 signature: e5242b0197f1d72e731df5c6597dfe92 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_AssemblyComponentUsageSubstitute

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);

		/****************** Share ******************/
		/**** md5 signature: 61b462dcb7cb9753d0742d3c268a0a58 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_AssemblyComponentUsageSubstitute
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 15eebbc3cd6f6e7bf4057ac774c17be3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_AssemblyComponentUsageSubstitute

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_AssemblyComponentUsageSubstitute> & ent);

};


%extend RWStepRepr_RWAssemblyComponentUsageSubstitute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWBetweenShapeAspect *
****************************************/
class RWStepRepr_RWBetweenShapeAspect {
	public:
		/****************** RWStepRepr_RWBetweenShapeAspect ******************/
		/**** md5 signature: def7b18b861bc7011e9c083e202cce62 ****/
		%feature("compactdefaultargs") RWStepRepr_RWBetweenShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWBetweenShapeAspect;
		 RWStepRepr_RWBetweenShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: e8f690f495698c3c835b59e96f74c6b2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads betweenshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_BetweenShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3781a3aeb72309b4d7425bb684338df1 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_BetweenShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_BetweenShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7aca4efe85b4e566019f3bdc84f971aa ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes betweenshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_BetweenShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_BetweenShapeAspect> & ent);

};


%extend RWStepRepr_RWBetweenShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepRepr_RWCentreOfSymmetry *
**************************************/
class RWStepRepr_RWCentreOfSymmetry {
	public:
		/****************** RWStepRepr_RWCentreOfSymmetry ******************/
		/**** md5 signature: 7da238499983ff4b167736f4c6c13e4d ****/
		%feature("compactdefaultargs") RWStepRepr_RWCentreOfSymmetry;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWCentreOfSymmetry;
		 RWStepRepr_RWCentreOfSymmetry();

		/****************** ReadStep ******************/
		/**** md5 signature: ad1136a7f9335e73f7a417adf1eac7f3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads centreofsymmetry.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CentreOfSymmetry

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4c29d4e4d20cca1c9ca71720b07ae4d5 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CentreOfSymmetry
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CentreOfSymmetry> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 752449a5be04d2d3dffd897f2eb82f8c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes centreofsymmetry.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CentreOfSymmetry

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CentreOfSymmetry> & ent);

};


%extend RWStepRepr_RWCentreOfSymmetry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepRepr_RWCharacterizedRepresentation *
*************************************************/
class RWStepRepr_RWCharacterizedRepresentation {
	public:
		/****************** RWStepRepr_RWCharacterizedRepresentation ******************/
		/**** md5 signature: de1a3b816146254252e40aae015f45db ****/
		%feature("compactdefaultargs") RWStepRepr_RWCharacterizedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCharacterizedRepresentation;
		 RWStepRepr_RWCharacterizedRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: f595eb3b339d8cae984e9aceb16673c3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CharacterizedRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2e78360edb4c93693f7ac38edf5a839d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_CharacterizedRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c81a288ddbe1b1325498014fae2ce3c4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CharacterizedRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CharacterizedRepresentation> & ent);

};


%extend RWStepRepr_RWCharacterizedRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp *
********************************************************************/
class RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	public:
		/****************** RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp ******************/
		/**** md5 signature: ede5a6d1fc62b6def242ec016f25e8f1 ****/
		%feature("compactdefaultargs") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp();

		/****************** ReadStep ******************/
		/**** md5 signature: 9dce67476a3ea3f2dd119d17d9f24101 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9a2f91c3cf72483cf0d12f3d9dd48cb2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2071c3178ac94e1b5c07a7d4d58ac270 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp> & ent);

};


%extend RWStepRepr_RWCompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepRepr_RWCompShAspAndDatumFeatAndShAsp *
***************************************************/
class RWStepRepr_RWCompShAspAndDatumFeatAndShAsp {
	public:
		/****************** RWStepRepr_RWCompShAspAndDatumFeatAndShAsp ******************/
		/**** md5 signature: 34f12af36f89592de2cd7daab695bd3f ****/
		%feature("compactdefaultargs") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCompShAspAndDatumFeatAndShAsp;
		 RWStepRepr_RWCompShAspAndDatumFeatAndShAsp();

		/****************** ReadStep ******************/
		/**** md5 signature: 308d433e18b74ed0bace9852a5103506 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompShAspAndDatumFeatAndShAsp

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);

		/****************** Share ******************/
		/**** md5 signature: a04359be3fbe9369f9efddc647b26856 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_CompShAspAndDatumFeatAndShAsp
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1b69ddc8e7df205d6d36231e6cb0844d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompShAspAndDatumFeatAndShAsp

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompShAspAndDatumFeatAndShAsp> & ent);

};


%extend RWStepRepr_RWCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWCompositeGroupShapeAspect *
***********************************************/
class RWStepRepr_RWCompositeGroupShapeAspect {
	public:
		/****************** RWStepRepr_RWCompositeGroupShapeAspect ******************/
		/**** md5 signature: a430ab5c0eba106a8f3710265de4d42a ****/
		%feature("compactdefaultargs") RWStepRepr_RWCompositeGroupShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWCompositeGroupShapeAspect;
		 RWStepRepr_RWCompositeGroupShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: 2c41bfb4c0515da20b302351222c8d08 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads compositegroupshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompositeGroupShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7f10557d9878b883576f0fe0469b3218 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CompositeGroupShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 36b168abd30cc5bd46645ad2103836a5 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes compositegroupshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompositeGroupShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompositeGroupShapeAspect> & ent);

};


%extend RWStepRepr_RWCompositeGroupShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepRepr_RWCompositeShapeAspect *
******************************************/
class RWStepRepr_RWCompositeShapeAspect {
	public:
		/****************** RWStepRepr_RWCompositeShapeAspect ******************/
		/**** md5 signature: 77bcd194ef06fa49a6098ba1da96c087 ****/
		%feature("compactdefaultargs") RWStepRepr_RWCompositeShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWCompositeShapeAspect;
		 RWStepRepr_RWCompositeShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: 5e4f025ddb34dd38ecaf82eebae64714 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads compositeshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompositeShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: 02f4dc3b5aa41d224fd3b443ac96c081 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CompositeShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompositeShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b343d141fe85693ff9424e4ca6344fbf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes compositeshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompositeShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompositeShapeAspect> & ent);

};


%extend RWStepRepr_RWCompositeShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWCompoundRepresentationItem *
************************************************/
class RWStepRepr_RWCompoundRepresentationItem {
	public:
		/****************** RWStepRepr_RWCompoundRepresentationItem ******************/
		/**** md5 signature: 1102001d25dcbcbf23fc2aa989536cc7 ****/
		%feature("compactdefaultargs") RWStepRepr_RWCompoundRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWCompoundRepresentationItem;
		 RWStepRepr_RWCompoundRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 40401c67fa443d19d712ac35a7d99e29 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_CompoundRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5b95f3f3cdd5c8031e84eed13875559e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_CompoundRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 75fd9c275f1d05c01c6e262f1584e3d3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_CompoundRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_CompoundRepresentationItem> & ent);

};


%extend RWStepRepr_RWCompoundRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepRepr_RWConfigurationDesign *
*****************************************/
class RWStepRepr_RWConfigurationDesign {
	public:
		/****************** RWStepRepr_RWConfigurationDesign ******************/
		/**** md5 signature: 85ee2cc3ff2ea1e61d89dcee04fe9beb ****/
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationDesign;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWConfigurationDesign;
		 RWStepRepr_RWConfigurationDesign();

		/****************** ReadStep ******************/
		/**** md5 signature: 188a335b869c905c5c71061b004dcea2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads configurationdesign.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConfigurationDesign

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConfigurationDesign> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7236f3622cb4673d45a49aad47608212 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ConfigurationDesign
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConfigurationDesign> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c8ece34243cf3aba2782c1de5f5bc9ca ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes configurationdesign.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConfigurationDesign

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConfigurationDesign> & ent);

};


%extend RWStepRepr_RWConfigurationDesign {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepRepr_RWConfigurationEffectivity *
**********************************************/
class RWStepRepr_RWConfigurationEffectivity {
	public:
		/****************** RWStepRepr_RWConfigurationEffectivity ******************/
		/**** md5 signature: 541d825e54e9b046542e974c24d6abd1 ****/
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationEffectivity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWConfigurationEffectivity;
		 RWStepRepr_RWConfigurationEffectivity();

		/****************** ReadStep ******************/
		/**** md5 signature: 6452a9540c39d916e3978c6c0c18d0f2 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads configurationeffectivity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConfigurationEffectivity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);

		/****************** Share ******************/
		/**** md5 signature: b4ee40ea22d19735aafb00bae55ed213 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ConfigurationEffectivity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ae5e194a9e25a977fa8ec94676be7753 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes configurationeffectivity.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConfigurationEffectivity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConfigurationEffectivity> & ent);

};


%extend RWStepRepr_RWConfigurationEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepRepr_RWConfigurationItem *
***************************************/
class RWStepRepr_RWConfigurationItem {
	public:
		/****************** RWStepRepr_RWConfigurationItem ******************/
		/**** md5 signature: a0e0914891f8592e2865c6e512855429 ****/
		%feature("compactdefaultargs") RWStepRepr_RWConfigurationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWConfigurationItem;
		 RWStepRepr_RWConfigurationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 50b5613348afaf72e7c7537900649cae ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads configurationitem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConfigurationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConfigurationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 66b0d047912e0379dd2e9b45e7813540 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ConfigurationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConfigurationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3a8a39c5d16cd56c39b102955d960119 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes configurationitem.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConfigurationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConfigurationItem> & ent);

};


%extend RWStepRepr_RWConfigurationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepRepr_RWConstructiveGeometryRepresentation *
********************************************************/
class RWStepRepr_RWConstructiveGeometryRepresentation {
	public:
		/****************** RWStepRepr_RWConstructiveGeometryRepresentation ******************/
		/**** md5 signature: c67ad5225e1ed3c3a94eb6ef608bc6de ****/
		%feature("compactdefaultargs") RWStepRepr_RWConstructiveGeometryRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWConstructiveGeometryRepresentation;
		 RWStepRepr_RWConstructiveGeometryRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 987937a42e2f8be4aeb439be6af7832c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConstructiveGeometryRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: ac8820d187439d2988a09a4d8e184ab6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ConstructiveGeometryRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ee12662fd73910e86488a3f3fad510da ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConstructiveGeometryRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentation> & ent);

};


%extend RWStepRepr_RWConstructiveGeometryRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class RWStepRepr_RWConstructiveGeometryRepresentationRelationship *
********************************************************************/
class RWStepRepr_RWConstructiveGeometryRepresentationRelationship {
	public:
		/****************** RWStepRepr_RWConstructiveGeometryRepresentationRelationship ******************/
		/**** md5 signature: a7291ddd04b0b00390400693be0d02a2 ****/
		%feature("compactdefaultargs") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWConstructiveGeometryRepresentationRelationship;
		 RWStepRepr_RWConstructiveGeometryRepresentationRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 0b520403520d1c0b77674c2827bf168d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ConstructiveGeometryRepresentationRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6ba20668ae8e99ed77ce169feef159df ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ConstructiveGeometryRepresentationRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3a0994bc3d97edde052cd32a0e0f8f03 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ConstructiveGeometryRepresentationRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ConstructiveGeometryRepresentationRelationship> & ent);

};


%extend RWStepRepr_RWConstructiveGeometryRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepRepr_RWContinuosShapeAspect *
******************************************/
class RWStepRepr_RWContinuosShapeAspect {
	public:
		/****************** RWStepRepr_RWContinuosShapeAspect ******************/
		/**** md5 signature: 4e784bea968a43b25b29a233955a2707 ****/
		%feature("compactdefaultargs") RWStepRepr_RWContinuosShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWContinuosShapeAspect;
		 RWStepRepr_RWContinuosShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: c9150420f7897be6a4438d45ea85dfab ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads continuosshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ContinuosShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: cc095bb57bd9ffde01d32804c836738d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ContinuosShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 228ea603253e3a9306eac8b684352586 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes continuosshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ContinuosShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ContinuosShapeAspect> & ent);

};


%extend RWStepRepr_RWContinuosShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepRepr_RWDataEnvironment *
*************************************/
class RWStepRepr_RWDataEnvironment {
	public:
		/****************** RWStepRepr_RWDataEnvironment ******************/
		/**** md5 signature: a3710a9434b160bc33685a4d51feff7a ****/
		%feature("compactdefaultargs") RWStepRepr_RWDataEnvironment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWDataEnvironment;
		 RWStepRepr_RWDataEnvironment();

		/****************** ReadStep ******************/
		/**** md5 signature: 77ef0c931c012dd31215d2d0d4e9b672 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dataenvironment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DataEnvironment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DataEnvironment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 8abc5ad5a77219737da30bdfeaa1fb4f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_DataEnvironment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_DataEnvironment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3755b0c542688b8c3b34927b3cb881e7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dataenvironment.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DataEnvironment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DataEnvironment> & ent);

};


%extend RWStepRepr_RWDataEnvironment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWDefinitionalRepresentation *
************************************************/
class RWStepRepr_RWDefinitionalRepresentation {
	public:
		/****************** RWStepRepr_RWDefinitionalRepresentation ******************/
		/**** md5 signature: 040a5f348e58d92691e2c0673661ba6e ****/
		%feature("compactdefaultargs") RWStepRepr_RWDefinitionalRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWDefinitionalRepresentation;
		 RWStepRepr_RWDefinitionalRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: e9f8b781bc677cb9a3b9d4c8d8839440 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DefinitionalRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: c7ab7753ebe1f2256e0fc1bce5a86c40 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_DefinitionalRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1ee42c1380eca05b33b328d736d317e1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DefinitionalRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DefinitionalRepresentation> & ent);

};


%extend RWStepRepr_RWDefinitionalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWDerivedShapeAspect *
****************************************/
class RWStepRepr_RWDerivedShapeAspect {
	public:
		/****************** RWStepRepr_RWDerivedShapeAspect ******************/
		/**** md5 signature: 34a8e8fc6a4aa54ec01ec66e4731f8b9 ****/
		%feature("compactdefaultargs") RWStepRepr_RWDerivedShapeAspect;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWDerivedShapeAspect;
		 RWStepRepr_RWDerivedShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: 146e56c36eda0ba0e29cb76188985983 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads derivedshapeaspect.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DerivedShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9d9450c6b4156ee4e1d6ee5aa25129ef ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_DerivedShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_DerivedShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1619604cb3a9d0003c68969ae54e1b7d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes derivedshapeaspect.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DerivedShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DerivedShapeAspect> & ent);

};


%extend RWStepRepr_RWDerivedShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepRepr_RWDescriptiveRepresentationItem *
***************************************************/
class RWStepRepr_RWDescriptiveRepresentationItem {
	public:
		/****************** RWStepRepr_RWDescriptiveRepresentationItem ******************/
		/**** md5 signature: 5e54fa7832595918416d8d27052c36a8 ****/
		%feature("compactdefaultargs") RWStepRepr_RWDescriptiveRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWDescriptiveRepresentationItem;
		 RWStepRepr_RWDescriptiveRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 502fddb784da7ad18ebd5d9ab859b6b1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_DescriptiveRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: d9b62debe0cb2234929ef4134ce99374 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_DescriptiveRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_DescriptiveRepresentationItem> & ent);

};


%extend RWStepRepr_RWDescriptiveRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepRepr_RWExtension *
*******************************/
class RWStepRepr_RWExtension {
	public:
		/****************** RWStepRepr_RWExtension ******************/
		/**** md5 signature: 7f05d691a5cc10b39a852f0155953755 ****/
		%feature("compactdefaultargs") RWStepRepr_RWExtension;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWExtension;
		 RWStepRepr_RWExtension();

		/****************** ReadStep ******************/
		/**** md5 signature: 3d4db4e0bcf3508b31ea75c59a36ca67 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads extension.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Extension

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Extension> & ent);

		/****************** Share ******************/
		/**** md5 signature: 1181cff25e158d3fb8ba2cc78f3f17ad ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_Extension
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Extension> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9081e96e978ffd45588d8e75728c481f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes extension.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Extension

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Extension> & ent);

};


%extend RWStepRepr_RWExtension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepRepr_RWFeatureForDatumTargetRelationship *
*******************************************************/
class RWStepRepr_RWFeatureForDatumTargetRelationship {
	public:
		/****************** RWStepRepr_RWFeatureForDatumTargetRelationship ******************/
		/**** md5 signature: 9c12ad7b97a29ba3b310fb7136b9c6ad ****/
		%feature("compactdefaultargs") RWStepRepr_RWFeatureForDatumTargetRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWFeatureForDatumTargetRelationship;
		 RWStepRepr_RWFeatureForDatumTargetRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 63e12ddf43d2c1b3cb0b1fa772fd0f2e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspectrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_FeatureForDatumTargetRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: de125aaaac38f0ee4a8c149f11b6a8f4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_FeatureForDatumTargetRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 73cf4bd1ee72b27b5e93d51cc07acde3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspectrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_FeatureForDatumTargetRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_FeatureForDatumTargetRelationship> & ent);

};


%extend RWStepRepr_RWFeatureForDatumTargetRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class RWStepRepr_RWFunctionallyDefinedTransformation *
*******************************************************/
class RWStepRepr_RWFunctionallyDefinedTransformation {
	public:
		/****************** RWStepRepr_RWFunctionallyDefinedTransformation ******************/
		/**** md5 signature: 8754f178fb891f6b576cf43f517fd027 ****/
		%feature("compactdefaultargs") RWStepRepr_RWFunctionallyDefinedTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWFunctionallyDefinedTransformation;
		 RWStepRepr_RWFunctionallyDefinedTransformation();

		/****************** ReadStep ******************/
		/**** md5 signature: f9315f45a118f3412c24b876835a5317 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_FunctionallyDefinedTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 63ed1e3b94a9630200e11705ac4e8838 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_FunctionallyDefinedTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_FunctionallyDefinedTransformation> & ent);

};


%extend RWStepRepr_RWFunctionallyDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWGeometricAlignment *
****************************************/
class RWStepRepr_RWGeometricAlignment {
	public:
		/****************** RWStepRepr_RWGeometricAlignment ******************/
		/**** md5 signature: 44146cf2df495642340f7a0b3bf5c445 ****/
		%feature("compactdefaultargs") RWStepRepr_RWGeometricAlignment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWGeometricAlignment;
		 RWStepRepr_RWGeometricAlignment();

		/****************** ReadStep ******************/
		/**** md5 signature: 129604b2fed42bf50765fc13d52b0071 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometricalignment.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_GeometricAlignment

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_GeometricAlignment> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4bfe0e78aa904ab39f7a83b80deb56b6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_GeometricAlignment
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_GeometricAlignment> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b2a4627f04d4b7bdb7c6026973c84ccf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometricalignment.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_GeometricAlignment

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_GeometricAlignment> & ent);

};


%extend RWStepRepr_RWGeometricAlignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWGlobalUncertaintyAssignedContext *
******************************************************/
class RWStepRepr_RWGlobalUncertaintyAssignedContext {
	public:
		/****************** RWStepRepr_RWGlobalUncertaintyAssignedContext ******************/
		/**** md5 signature: bfb5a909d7f3f303ebd6f104e278806f ****/
		%feature("compactdefaultargs") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWGlobalUncertaintyAssignedContext;
		 RWStepRepr_RWGlobalUncertaintyAssignedContext();

		/****************** ReadStep ******************/
		/**** md5 signature: a29106beca42d5ca59f4591d86008af9 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_GlobalUncertaintyAssignedContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5ff0e44ac3b59034a945d6458c6618cd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_GlobalUncertaintyAssignedContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7cfd82466a712d5369350d0a4b0481ca ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_GlobalUncertaintyAssignedContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & ent);

};


%extend RWStepRepr_RWGlobalUncertaintyAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWGlobalUnitAssignedContext *
***********************************************/
class RWStepRepr_RWGlobalUnitAssignedContext {
	public:
		/****************** RWStepRepr_RWGlobalUnitAssignedContext ******************/
		/**** md5 signature: 48f39d56147e65168aebe3265913e246 ****/
		%feature("compactdefaultargs") RWStepRepr_RWGlobalUnitAssignedContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWGlobalUnitAssignedContext;
		 RWStepRepr_RWGlobalUnitAssignedContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 2528b8b42d97f634b7afe68f27d1bdc6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_GlobalUnitAssignedContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);

		/****************** Share ******************/
		/**** md5 signature: d45e771f867a9e0c73584c60e149f622 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_GlobalUnitAssignedContext
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 89d89b52a91a75efa870c40bcd4812f5 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_GlobalUnitAssignedContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & ent);

};


%extend RWStepRepr_RWGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWIntegerRepresentationItem *
***********************************************/
class RWStepRepr_RWIntegerRepresentationItem {
	public:
		/****************** RWStepRepr_RWIntegerRepresentationItem ******************/
		/**** md5 signature: ace7537f9db48a53d4058ece0143ca24 ****/
		%feature("compactdefaultargs") RWStepRepr_RWIntegerRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWIntegerRepresentationItem;
		 RWStepRepr_RWIntegerRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 072b66ef56620b9ee1af7e25fd6c88cd ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_IntegerRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 85c84b78093d701908d714962101a087 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_IntegerRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_IntegerRepresentationItem> & ent);

};


%extend RWStepRepr_RWIntegerRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWItemDefinedTransformation *
***********************************************/
class RWStepRepr_RWItemDefinedTransformation {
	public:
		/****************** RWStepRepr_RWItemDefinedTransformation ******************/
		/**** md5 signature: 985d106dc9de49ebf00b0a9e074e3c1e ****/
		%feature("compactdefaultargs") RWStepRepr_RWItemDefinedTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWItemDefinedTransformation;
		 RWStepRepr_RWItemDefinedTransformation();

		/****************** ReadStep ******************/
		/**** md5 signature: e0caaa7e810ef508f58adedb00442746 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ItemDefinedTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);

		/****************** Share ******************/
		/**** md5 signature: d2ebbf422d309adc6154d1d2e51ff6f6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ItemDefinedTransformation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 76d87931ca1e53716a8a59a6317b6821 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ItemDefinedTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ItemDefinedTransformation> & ent);

};


%extend RWStepRepr_RWItemDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepRepr_RWMakeFromUsageOption *
*****************************************/
class RWStepRepr_RWMakeFromUsageOption {
	public:
		/****************** RWStepRepr_RWMakeFromUsageOption ******************/
		/**** md5 signature: 164551cd2006c754169a1e91d14bb6a4 ****/
		%feature("compactdefaultargs") RWStepRepr_RWMakeFromUsageOption;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWMakeFromUsageOption;
		 RWStepRepr_RWMakeFromUsageOption();

		/****************** ReadStep ******************/
		/**** md5 signature: d9e84a63ba6a3bcbd65b773b40aa071d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads makefromusageoption.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MakeFromUsageOption

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0c1174462e98b02dc63824df830ed867 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_MakeFromUsageOption
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MakeFromUsageOption> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9751a7ec1cb7066f1a9885fc3638a309 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes makefromusageoption.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MakeFromUsageOption

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MakeFromUsageOption> & ent);

};


%extend RWStepRepr_RWMakeFromUsageOption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStepRepr_RWMappedItem *
********************************/
class RWStepRepr_RWMappedItem {
	public:
		/****************** RWStepRepr_RWMappedItem ******************/
		/**** md5 signature: 5cde76684a14963a013c2b576c482375 ****/
		%feature("compactdefaultargs") RWStepRepr_RWMappedItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWMappedItem;
		 RWStepRepr_RWMappedItem();

		/****************** ReadStep ******************/
		/**** md5 signature: abf7773d2443173c7a3715885376ef56 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MappedItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MappedItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: ed758bdd2f2fa28b428730fed8b3530d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_MappedItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MappedItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 325a7d639bbb1aee3ee217bb3fea86ae ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MappedItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MappedItem> & ent);

};


%extend RWStepRepr_RWMappedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepRepr_RWMaterialDesignation *
*****************************************/
class RWStepRepr_RWMaterialDesignation {
	public:
		/****************** RWStepRepr_RWMaterialDesignation ******************/
		/**** md5 signature: cabecbca671ab57f6ecfe3a668e0d5df ****/
		%feature("compactdefaultargs") RWStepRepr_RWMaterialDesignation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWMaterialDesignation;
		 RWStepRepr_RWMaterialDesignation();

		/****************** ReadStep ******************/
		/**** md5 signature: c2b84d2b55d66bc27f3a9d26465644f4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MaterialDesignation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MaterialDesignation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 23d384326aba5605454cc333d6b3e5e5 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_MaterialDesignation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MaterialDesignation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 514a2fb1167ed50dbc5b383e3588fd7c ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MaterialDesignation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MaterialDesignation> & ent);

};


%extend RWStepRepr_RWMaterialDesignation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWStepRepr_RWMaterialProperty *
**************************************/
class RWStepRepr_RWMaterialProperty {
	public:
		/****************** RWStepRepr_RWMaterialProperty ******************/
		/**** md5 signature: 17090674b08eeee5f11e2fcc6ec90ca3 ****/
		%feature("compactdefaultargs") RWStepRepr_RWMaterialProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWMaterialProperty;
		 RWStepRepr_RWMaterialProperty();

		/****************** ReadStep ******************/
		/**** md5 signature: 28ee23017a856c223321a95842a43a4d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads materialproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MaterialProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MaterialProperty> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5abcfbcaf771167f943f06b374ee8ff2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_MaterialProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MaterialProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6e60217828b1467a4c0cc2a1e874f50b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes materialproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MaterialProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MaterialProperty> & ent);

};


%extend RWStepRepr_RWMaterialProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepRepr_RWMaterialPropertyRepresentation *
****************************************************/
class RWStepRepr_RWMaterialPropertyRepresentation {
	public:
		/****************** RWStepRepr_RWMaterialPropertyRepresentation ******************/
		/**** md5 signature: 00e646cdea2d30770fbd386ab977b3a3 ****/
		%feature("compactdefaultargs") RWStepRepr_RWMaterialPropertyRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWMaterialPropertyRepresentation;
		 RWStepRepr_RWMaterialPropertyRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: d37c2745a09154c4d79455dbfdb8f427 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads materialpropertyrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MaterialPropertyRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9d6690a8b8ce45fc1c777c2b43aa82e9 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_MaterialPropertyRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: d19bafebc5eeee68c341b8d823f1cf57 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes materialpropertyrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MaterialPropertyRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MaterialPropertyRepresentation> & ent);

};


%extend RWStepRepr_RWMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class RWStepRepr_RWMeasureRepresentationItem *
***********************************************/
class RWStepRepr_RWMeasureRepresentationItem {
	public:
		/****************** RWStepRepr_RWMeasureRepresentationItem ******************/
		/**** md5 signature: 78e9ddab09240c1aa9e602d5a9e908e1 ****/
		%feature("compactdefaultargs") RWStepRepr_RWMeasureRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWMeasureRepresentationItem;
		 RWStepRepr_RWMeasureRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 57ed5c1c3861ee76701dea5e208156a0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_MeasureRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4ee84805314aab60661793dadb792574 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_MeasureRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 67cf6a460ef905757f4fe40f0bbc9cbc ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_MeasureRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_MeasureRepresentationItem> & ent);

};


%extend RWStepRepr_RWMeasureRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepRepr_RWParallelOffset *
************************************/
class RWStepRepr_RWParallelOffset {
	public:
		/****************** RWStepRepr_RWParallelOffset ******************/
		/**** md5 signature: 0b6d6ef2386e12a8908089502df60299 ****/
		%feature("compactdefaultargs") RWStepRepr_RWParallelOffset;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWParallelOffset;
		 RWStepRepr_RWParallelOffset();

		/****************** ReadStep ******************/
		/**** md5 signature: f76242787f0d8d0f0f428cd2c4f0cfc5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads paralleloffset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ParallelOffset

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ParallelOffset> & ent);

		/****************** Share ******************/
		/**** md5 signature: cb0bd0aa3aa73a4311e8b55e40e3f1f7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ParallelOffset
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ParallelOffset> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2e52237b838dcc29167aa03de8f40ca9 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes paralleloffset.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ParallelOffset

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ParallelOffset> & ent);

};


%extend RWStepRepr_RWParallelOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepRepr_RWParametricRepresentationContext *
*****************************************************/
class RWStepRepr_RWParametricRepresentationContext {
	public:
		/****************** RWStepRepr_RWParametricRepresentationContext ******************/
		/**** md5 signature: 958c2c991e64ae3a3ffd5b879281cd26 ****/
		%feature("compactdefaultargs") RWStepRepr_RWParametricRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWParametricRepresentationContext;
		 RWStepRepr_RWParametricRepresentationContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 1427c96bc227068091ac23f433e1fc7d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ParametricRepresentationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 806863a18940dbbb5aff68b3ee4028b6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ParametricRepresentationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ParametricRepresentationContext> & ent);

};


%extend RWStepRepr_RWParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class RWStepRepr_RWPerpendicularTo *
*************************************/
class RWStepRepr_RWPerpendicularTo {
	public:
		/****************** RWStepRepr_RWPerpendicularTo ******************/
		/**** md5 signature: e4449efe73f6f89f4f72212b48805f39 ****/
		%feature("compactdefaultargs") RWStepRepr_RWPerpendicularTo;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPerpendicularTo;
		 RWStepRepr_RWPerpendicularTo();

		/****************** ReadStep ******************/
		/**** md5 signature: 79ff8a7a362990edf7c7732893a757fc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads perpendicularto.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PerpendicularTo

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PerpendicularTo> & ent);

		/****************** Share ******************/
		/**** md5 signature: d15e590d6af51af9662637557fa903f8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PerpendicularTo
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PerpendicularTo> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ca5828af05380b27223b58d56a307108 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes perpendicularto.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PerpendicularTo

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PerpendicularTo> & ent);

};


%extend RWStepRepr_RWPerpendicularTo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepRepr_RWProductConcept *
************************************/
class RWStepRepr_RWProductConcept {
	public:
		/****************** RWStepRepr_RWProductConcept ******************/
		/**** md5 signature: 831c77f6b0fdeeb9c0bcb5d0ecafdc7d ****/
		%feature("compactdefaultargs") RWStepRepr_RWProductConcept;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWProductConcept;
		 RWStepRepr_RWProductConcept();

		/****************** ReadStep ******************/
		/**** md5 signature: e3a95b9bb08e9248cdfba4fdd6712f7c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productconcept.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ProductConcept

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ProductConcept> & ent);

		/****************** Share ******************/
		/**** md5 signature: 67d154f1599691015f9618aaa1ccaa8a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ProductConcept
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ProductConcept> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b997de94f6d5266e485958a946f7394e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productconcept.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ProductConcept

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ProductConcept> & ent);

};


%extend RWStepRepr_RWProductConcept {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class RWStepRepr_RWProductDefinitionShape *
********************************************/
class RWStepRepr_RWProductDefinitionShape {
	public:
		/****************** RWStepRepr_RWProductDefinitionShape ******************/
		/**** md5 signature: fc3611fa5172fc03ba68a184f5fe0d9b ****/
		%feature("compactdefaultargs") RWStepRepr_RWProductDefinitionShape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWProductDefinitionShape;
		 RWStepRepr_RWProductDefinitionShape();

		/****************** ReadStep ******************/
		/**** md5 signature: 7b9376271031ae39c5ce29565469a4e7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads productdefinitionshape.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ProductDefinitionShape

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);

		/****************** Share ******************/
		/**** md5 signature: 48be89b3a4ca82ea03d4910af750a573 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ProductDefinitionShape
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ProductDefinitionShape> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3265bb56363c5a860f86adb7a78b2783 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes productdefinitionshape.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ProductDefinitionShape

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ProductDefinitionShape> & ent);

};


%extend RWStepRepr_RWProductDefinitionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWPropertyDefinition *
****************************************/
class RWStepRepr_RWPropertyDefinition {
	public:
		/****************** RWStepRepr_RWPropertyDefinition ******************/
		/**** md5 signature: c9f23407aef3016d83f3a325f37c8cab ****/
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPropertyDefinition;
		 RWStepRepr_RWPropertyDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: e4ae019203462f7cb1a550a2cddf81a0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads propertydefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PropertyDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PropertyDefinition> & ent);

		/****************** Share ******************/
		/**** md5 signature: 72d888b00f42847826a2bc47a9e6d8de ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PropertyDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PropertyDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1e832ccfb3520046d8c10b503edc1e18 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes propertydefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PropertyDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PropertyDefinition> & ent);

};


%extend RWStepRepr_RWPropertyDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepRepr_RWPropertyDefinitionRelationship *
****************************************************/
class RWStepRepr_RWPropertyDefinitionRelationship {
	public:
		/****************** RWStepRepr_RWPropertyDefinitionRelationship ******************/
		/**** md5 signature: 623bc44e904f645114f56551db222000 ****/
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPropertyDefinitionRelationship;
		 RWStepRepr_RWPropertyDefinitionRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 46daa8b98bc32cbd094897a326c6666d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads propertydefinitionrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PropertyDefinitionRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: 5f820ad09506f51ba163458a01cb3648 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PropertyDefinitionRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ec12047dbcfd26524aeb3c748a0fdb17 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes propertydefinitionrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PropertyDefinitionRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PropertyDefinitionRelationship> & ent);

};


%extend RWStepRepr_RWPropertyDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWPropertyDefinitionRepresentation *
******************************************************/
class RWStepRepr_RWPropertyDefinitionRepresentation {
	public:
		/****************** RWStepRepr_RWPropertyDefinitionRepresentation ******************/
		/**** md5 signature: 5602cf0d9467d32a32ae39d865fa134c ****/
		%feature("compactdefaultargs") RWStepRepr_RWPropertyDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWPropertyDefinitionRepresentation;
		 RWStepRepr_RWPropertyDefinitionRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: b3ed4f18ab164b0b01c11c3f49719fc4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads propertydefinitionrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_PropertyDefinitionRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: a0f981355aabc1412b3a14aad51631a4 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_PropertyDefinitionRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: f73c2fbaaf42f3aa75f59e681c90a918 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes propertydefinitionrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_PropertyDefinitionRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_PropertyDefinitionRepresentation> & ent);

};


%extend RWStepRepr_RWPropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWQuantifiedAssemblyComponentUsage *
******************************************************/
class RWStepRepr_RWQuantifiedAssemblyComponentUsage {
	public:
		/****************** RWStepRepr_RWQuantifiedAssemblyComponentUsage ******************/
		/**** md5 signature: d9d13a83f0b53fe799b1baf638c428c1 ****/
		%feature("compactdefaultargs") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWQuantifiedAssemblyComponentUsage;
		 RWStepRepr_RWQuantifiedAssemblyComponentUsage();

		/****************** ReadStep ******************/
		/**** md5 signature: a0ff4c5068ddaf7005e5d4d6917eccfc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads quantifiedassemblycomponentusage.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_QuantifiedAssemblyComponentUsage

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4feafadf6e08a8e212cc0613a43ba309 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_QuantifiedAssemblyComponentUsage
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 87f2bdcee25321e4897f5c6e4aa37eb0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes quantifiedassemblycomponentusage.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_QuantifiedAssemblyComponentUsage

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_QuantifiedAssemblyComponentUsage> & ent);

};


%extend RWStepRepr_RWQuantifiedAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepRepr_RWReprItemAndLengthMeasureWithUnit *
******************************************************/
class RWStepRepr_RWReprItemAndLengthMeasureWithUnit {
	public:
		/****************** RWStepRepr_RWReprItemAndLengthMeasureWithUnit ******************/
		/**** md5 signature: cdd9a85bc6f0feb6272a14bf41b39fb5 ****/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndLengthMeasureWithUnit;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 42a674066804b5abce8f6f773bd03b03 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndLengthMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 6f2d164a2fd52ee08da03c66638e02ba ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndLengthMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnit> & ent);

};


%extend RWStepRepr_RWReprItemAndLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI *
************************************************************/
class RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI {
	public:
		/****************** RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI ******************/
		/**** md5 signature: 33ba578bccb7e5fe3f9007db66a9bcd3 ****/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI();

		/****************** ReadStep ******************/
		/**** md5 signature: 5a6acf58d32ea9af976e59563a22eeeb ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 2364bc5e40616e0e2568170e7d8bef7a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI> & ent);

};


%extend RWStepRepr_RWReprItemAndLengthMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit *
**********************************************************/
class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit {
	public:
		/****************** RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit ******************/
		/**** md5 signature: 3e109eb6b5d8f8ac42b6a47e196612f4 ****/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit();

		/****************** ReadStep ******************/
		/**** md5 signature: 5acfc9e728ee463def65638a0a4d80a5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnit

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: eb3819da3565a95c10db9f01a9659045 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnit

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnit> & ent);

};


%extend RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI *
****************************************************************/
class RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	public:
		/****************** RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI ******************/
		/**** md5 signature: 7387c54433294ee9022bb9ea5d28a2a5 ****/
		%feature("compactdefaultargs") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		 RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI();

		/****************** ReadStep ******************/
		/**** md5 signature: eba80a64b87c3e5bbcb95ed9be8279d6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: abf0fe8bd096173299be1868a1b047c4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI> & ent);

};


%extend RWStepRepr_RWReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class RWStepRepr_RWRepresentation *
************************************/
class RWStepRepr_RWRepresentation {
	public:
		/****************** RWStepRepr_RWRepresentation ******************/
		/**** md5 signature: 77b3fceab1297c3b3bc13a2a2b93ca04 ****/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentation;
		 RWStepRepr_RWRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: cfe8f0af9cdd7455128e7bb78453d6d5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Representation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Representation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9922e62e9ea3dbd56f53f142c701e997 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_Representation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Representation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 603cfa06250e1f96290066ef50a8ac3a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Representation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Representation> & ent);

};


%extend RWStepRepr_RWRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepRepr_RWRepresentationContext *
*******************************************/
class RWStepRepr_RWRepresentationContext {
	public:
		/****************** RWStepRepr_RWRepresentationContext ******************/
		/**** md5 signature: 1a1aa8e42f6aae02fccc38bf3731bf56 ****/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationContext;
		 RWStepRepr_RWRepresentationContext();

		/****************** ReadStep ******************/
		/**** md5 signature: 42b8c83208a2efd8d5e71848d0ac17db ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationContext

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationContext> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: 781168c542ec11fc4a855867b05a6eab ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationContext

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationContext> & ent);

};


%extend RWStepRepr_RWRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepRepr_RWRepresentationItem *
****************************************/
class RWStepRepr_RWRepresentationItem {
	public:
		/****************** RWStepRepr_RWRepresentationItem ******************/
		/**** md5 signature: 3f0e96dd4db1153efdec7f590f9f86ac ****/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationItem;
		 RWStepRepr_RWRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 1746e8ce5f442178f59c379009a67b04 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: b99693c23b3107797d4342f21ffdba7b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationItem> & ent);

};


%extend RWStepRepr_RWRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepRepr_RWRepresentationMap *
***************************************/
class RWStepRepr_RWRepresentationMap {
	public:
		/****************** RWStepRepr_RWRepresentationMap ******************/
		/**** md5 signature: 8ca8e409eccbccf1fdda0f4117dcb3f5 ****/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationMap;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationMap;
		 RWStepRepr_RWRepresentationMap();

		/****************** ReadStep ******************/
		/**** md5 signature: 41deb5d6325f0dcf5b91248fc8da26da ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationMap

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationMap> & ent);

		/****************** Share ******************/
		/**** md5 signature: b87550f0536cacb043b0dd914f81e521 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_RepresentationMap
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_RepresentationMap> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: abd50cf97255bac2169aa48f53a60248 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationMap

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationMap> & ent);

};


%extend RWStepRepr_RWRepresentationMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWRepresentationRelationship *
************************************************/
class RWStepRepr_RWRepresentationRelationship {
	public:
		/****************** RWStepRepr_RWRepresentationRelationship ******************/
		/**** md5 signature: 049e3708c8219dc01e6b94592c092ad1 ****/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationRelationship;
		 RWStepRepr_RWRepresentationRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 6e51468069fe152c8338aa97edcf9d88 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: 66584eff5f61f7ccf1d8bed378b37e5a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_RepresentationRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_RepresentationRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: bb25e4d069ce2873e77ee4bffd0f395f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationRelationship> & ent);

};


%extend RWStepRepr_RWRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class RWStepRepr_RWRepresentationRelationshipWithTransformation *
******************************************************************/
class RWStepRepr_RWRepresentationRelationshipWithTransformation {
	public:
		/****************** RWStepRepr_RWRepresentationRelationshipWithTransformation ******************/
		/**** md5 signature: d5d00384f9660cbfd58342a672f3d6c0 ****/
		%feature("compactdefaultargs") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWRepresentationRelationshipWithTransformation();

		/****************** ReadStep ******************/
		/**** md5 signature: d47bf782c403de2ad50648c9b643a86f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_RepresentationRelationshipWithTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);

		/****************** Share ******************/
		/**** md5 signature: aa6fd68bf144c798542a19ceb4b395b8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_RepresentationRelationshipWithTransformation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ff5ba769640458f77d5857ceca565086 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_RepresentationRelationshipWithTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_RepresentationRelationshipWithTransformation> & ent);

};


%extend RWStepRepr_RWRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepRepr_RWShapeAspect *
*********************************/
class RWStepRepr_RWShapeAspect {
	public:
		/****************** RWStepRepr_RWShapeAspect ******************/
		/**** md5 signature: 585f43a51f3d0899ecd81546e28c96dd ****/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWShapeAspect;
		 RWStepRepr_RWShapeAspect();

		/****************** ReadStep ******************/
		/**** md5 signature: 150b4c487ac0c9d79322a07d8b3f0b91 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspect

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspect> & ent);

		/****************** Share ******************/
		/**** md5 signature: 24ca12e858e64fba48316a5bc7209f3a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ShapeAspect
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspect> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c51c412539591264b6374c84b94334d7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspect

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspect> & ent);

};


%extend RWStepRepr_RWShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepRepr_RWShapeAspectDerivingRelationship *
*****************************************************/
class RWStepRepr_RWShapeAspectDerivingRelationship {
	public:
		/****************** RWStepRepr_RWShapeAspectDerivingRelationship ******************/
		/**** md5 signature: 2ecbefe45d105fcc583460eaca6bcdc6 ****/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectDerivingRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWShapeAspectDerivingRelationship;
		 RWStepRepr_RWShapeAspectDerivingRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 0985b9dcb182e14990e9ed4c0334f954 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspectderivingrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspectDerivingRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6ed71ff918680bdae93fb45a3fff02ab ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ShapeAspectDerivingRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0a2c871aab77f6a789da311ce47396c5 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspectderivingrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspectDerivingRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspectDerivingRelationship> & ent);

};


%extend RWStepRepr_RWShapeAspectDerivingRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepRepr_RWShapeAspectRelationship *
*********************************************/
class RWStepRepr_RWShapeAspectRelationship {
	public:
		/****************** RWStepRepr_RWShapeAspectRelationship ******************/
		/**** md5 signature: 263f76c831670b8400837c7dfe2616e9 ****/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWShapeAspectRelationship;
		 RWStepRepr_RWShapeAspectRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: ffc2a34a57c2aa455eeaa1eadbb0cda5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspectrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspectRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: efebedc024bb214c9e084ad5aebc4e13 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ShapeAspectRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 978d6f896f47eb55c331bdeac6b8d5d7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspectrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspectRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspectRelationship> & ent);

};


%extend RWStepRepr_RWShapeAspectRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepRepr_RWShapeAspectTransition *
*******************************************/
class RWStepRepr_RWShapeAspectTransition {
	public:
		/****************** RWStepRepr_RWShapeAspectTransition ******************/
		/**** md5 signature: b16c7d29afb7d2f667e7a5981a985d66 ****/
		%feature("compactdefaultargs") RWStepRepr_RWShapeAspectTransition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWShapeAspectTransition;
		 RWStepRepr_RWShapeAspectTransition();

		/****************** ReadStep ******************/
		/**** md5 signature: c26c0cfd6cd13504995ef9058109e785 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads shapeaspecttransition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeAspectTransition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0079a78286230db0bd64d84b6a1c8a06 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_ShapeAspectTransition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeAspectTransition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e885a5eb479ab4eed5f39cabd2d5d5b1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes shapeaspecttransition.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeAspectTransition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeAspectTransition> & ent);

};


%extend RWStepRepr_RWShapeAspectTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class RWStepRepr_RWShapeRepresentationRelationshipWithTransformation *
***********************************************************************/
class RWStepRepr_RWShapeRepresentationRelationshipWithTransformation {
	public:
		/****************** RWStepRepr_RWShapeRepresentationRelationshipWithTransformation ******************/
		/**** md5 signature: 0335ffd047b75138e97f6c3e884a08ed ****/
		%feature("compactdefaultargs") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWShapeRepresentationRelationshipWithTransformation;
		 RWStepRepr_RWShapeRepresentationRelationshipWithTransformation();

		/****************** ReadStep ******************/
		/**** md5 signature: 9e9f6f403fed17597b5c7b2bd3a53187 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ShapeRepresentationRelationshipWithTransformation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);

		/****************** Share ******************/
		/**** md5 signature: b98b83d3f29eac15736c307d9c21d2df ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: StepRepr_ShapeRepresentationRelationshipWithTransformation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3775a876dd818e99c419bab81bdf2bde ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ShapeRepresentationRelationshipWithTransformation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ShapeRepresentationRelationshipWithTransformation> & ent);

};


%extend RWStepRepr_RWShapeRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class RWStepRepr_RWSpecifiedHigherUsageOccurrence *
****************************************************/
class RWStepRepr_RWSpecifiedHigherUsageOccurrence {
	public:
		/****************** RWStepRepr_RWSpecifiedHigherUsageOccurrence ******************/
		/**** md5 signature: 10876ff97c3bedcc25cbbbfb07de7633 ****/
		%feature("compactdefaultargs") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWSpecifiedHigherUsageOccurrence;
		 RWStepRepr_RWSpecifiedHigherUsageOccurrence();

		/****************** ReadStep ******************/
		/**** md5 signature: 0ea06daca700303e65c98082edc9fbab ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads specifiedhigherusageoccurrence.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_SpecifiedHigherUsageOccurrence

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7388b02ba353b47b7127998de5cfbdcd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_SpecifiedHigherUsageOccurrence
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 1b17574401aa9aeb4fb2c25e1bd5aae1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes specifiedhigherusageoccurrence.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_SpecifiedHigherUsageOccurrence

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_SpecifiedHigherUsageOccurrence> & ent);

};


%extend RWStepRepr_RWSpecifiedHigherUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class RWStepRepr_RWStructuralResponseProperty *
************************************************/
class RWStepRepr_RWStructuralResponseProperty {
	public:
		/****************** RWStepRepr_RWStructuralResponseProperty ******************/
		/**** md5 signature: a7015626963c8aad4339bc58b8cd168f ****/
		%feature("compactdefaultargs") RWStepRepr_RWStructuralResponseProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWStructuralResponseProperty;
		 RWStepRepr_RWStructuralResponseProperty();

		/****************** ReadStep ******************/
		/**** md5 signature: 197769a7d6f4c95809384c2108252007 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads structuralresponseproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_StructuralResponseProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6a5ec48572486755d69b3c3275a28d4b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_StructuralResponseProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_StructuralResponseProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b9bdb4a6e3911ed455bd53398f3ea73e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes structuralresponseproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_StructuralResponseProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_StructuralResponseProperty> & ent);

};


%extend RWStepRepr_RWStructuralResponseProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************************
* class RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation *
************************************************************************/
class RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation {
	public:
		/****************** RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation ******************/
		/**** md5 signature: 45972ea0eaa8e7fdb766ee1438c6ee6f ****/
		%feature("compactdefaultargs") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation;
		 RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 399a8e0cb4fa4674efd0300c391cc14e ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads structuralresponsepropertydefinitionrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: b8901964ae357b94555b2075898c3b7f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b0ac664880f263c9ca122741a9184d36 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes structuralresponsepropertydefinitionrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_StructuralResponsePropertyDefinitionRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_StructuralResponsePropertyDefinitionRepresentation> & ent);

};


%extend RWStepRepr_RWStructuralResponsePropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepRepr_RWTangent *
*****************************/
class RWStepRepr_RWTangent {
	public:
		/****************** RWStepRepr_RWTangent ******************/
		/**** md5 signature: fa00bcc27ce92e4dfb293d2a66195eae ****/
		%feature("compactdefaultargs") RWStepRepr_RWTangent;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepRepr_RWTangent;
		 RWStepRepr_RWTangent();

		/****************** ReadStep ******************/
		/**** md5 signature: 6c33692604259d7e6f1c9a8332a3e485 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads tangent.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_Tangent

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_Tangent> & ent);

		/****************** Share ******************/
		/**** md5 signature: fb7ce47308b6d0055f9f93a54e388696 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepRepr_Tangent
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepRepr_Tangent> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2c1d0796180217f1844aae695d61ff24 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes tangent.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_Tangent

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_Tangent> & ent);

};


%extend RWStepRepr_RWTangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepRepr_RWValueRepresentationItem *
*********************************************/
class RWStepRepr_RWValueRepresentationItem {
	public:
		/****************** RWStepRepr_RWValueRepresentationItem ******************/
		/**** md5 signature: 9360e412d50a274831bed7af381fa065 ****/
		%feature("compactdefaultargs") RWStepRepr_RWValueRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWStepRepr_RWValueRepresentationItem;
		 RWStepRepr_RWValueRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 51f87d6750b93b0767d142e0257259e7 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepRepr_ValueRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);

		/****************** WriteStep ******************/
		/**** md5 signature: c630f161a51bf9fc13f390e6c3bb95a4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "No available documentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepRepr_ValueRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepRepr_ValueRepresentationItem> & ent);

};


%extend RWStepRepr_RWValueRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
