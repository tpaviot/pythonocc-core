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
%define RWSTEPFEADOCSTRING
"RWStepFEA module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstepfea.html"
%enddef
%module (package="OCC.Core", docstring=RWSTEPFEADOCSTRING) RWStepFEA


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
#include<RWStepFEA_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<Interface_module.hxx>
#include<StepFEA_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<MoniTool_module.hxx>
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
%import StepFEA.i

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

/**********************************************************
* class RWStepFEA_RWAlignedCurve3dElementCoordinateSystem *
**********************************************************/
class RWStepFEA_RWAlignedCurve3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWAlignedCurve3dElementCoordinateSystem ******************/
		/**** md5 signature: 3b6fd7ccc04949ed925f3005dc951447 ****/
		%feature("compactdefaultargs") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedCurve3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: cf6fbc965d27a9fbc7c3f74338cdb6b1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads alignedcurve3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_AlignedCurve3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 582713488646625ebe85d3094f3cf547 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_AlignedCurve3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: dabccdd7f2b0d24a81cafcfae2a59dcc ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes alignedcurve3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_AlignedCurve3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_AlignedCurve3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWAlignedCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class RWStepFEA_RWAlignedSurface3dElementCoordinateSystem *
************************************************************/
class RWStepFEA_RWAlignedSurface3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWAlignedSurface3dElementCoordinateSystem ******************/
		/**** md5 signature: 0020a115d8d0e0ebf8069d48a3a1c4f0 ****/
		%feature("compactdefaultargs") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedSurface3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: fdba9355b73a425e83163dd7fffa8d85 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads alignedsurface3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_AlignedSurface3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 970a9af8337294304854da098511d3fe ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_AlignedSurface3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e717034ecb0b761a813252ada84c03a8 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes alignedsurface3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_AlignedSurface3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_AlignedSurface3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWAlignedSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem *
*************************************************************/
class RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem ******************/
		/**** md5 signature: 9317a63bddbef45d046157c55c03eee5 ****/
		%feature("compactdefaultargs") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		 RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: aca560774b36f2495d3b5d1ab678b7be ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads arbitraryvolume3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: c0e65f09d8299acb6ce993dfb076d33e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 87a42f590246f77a34baa435159b97b6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes arbitraryvolume3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ArbitraryVolume3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ArbitraryVolume3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWConstantSurface3dElementCoordinateSystem *
*************************************************************/
class RWStepFEA_RWConstantSurface3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWConstantSurface3dElementCoordinateSystem ******************/
		/**** md5 signature: ce049e651e1fcf21b7b1e1e1ef75684d ****/
		%feature("compactdefaultargs") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		 RWStepFEA_RWConstantSurface3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: 95b03b027ae41601428eb833d47dab6f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads constantsurface3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ConstantSurface3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: d18b3ded2c7b7f474ee1d0e26b41672d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ConstantSurface3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 59d0b52d51bd79edeb6983dc5a98d900 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes constantsurface3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ConstantSurface3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ConstantSurface3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWConstantSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepFEA_RWCurve3dElementProperty *
*******************************************/
class RWStepFEA_RWCurve3dElementProperty {
	public:
		/****************** RWStepFEA_RWCurve3dElementProperty ******************/
		/**** md5 signature: fee8e75fc0a43d0097af10afa2bcc510 ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurve3dElementProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurve3dElementProperty;
		 RWStepFEA_RWCurve3dElementProperty();

		/****************** ReadStep ******************/
		/**** md5 signature: 6bb6c8a8cc161f78bbdb0f1051b6837f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curve3delementproperty.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Curve3dElementProperty

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Curve3dElementProperty> & ent);

		/****************** Share ******************/
		/**** md5 signature: 912562f86c89763ca94cdae2b3ef4988 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Curve3dElementProperty
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Curve3dElementProperty> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b8e1f2a69d4cff6c7e6dcadd7b71ed43 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curve3delementproperty.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Curve3dElementProperty

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Curve3dElementProperty> & ent);

};


%extend RWStepFEA_RWCurve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepFEA_RWCurve3dElementRepresentation *
*************************************************/
class RWStepFEA_RWCurve3dElementRepresentation {
	public:
		/****************** RWStepFEA_RWCurve3dElementRepresentation ******************/
		/**** md5 signature: c5340a63977fa58e004444f4e513fef6 ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurve3dElementRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurve3dElementRepresentation;
		 RWStepFEA_RWCurve3dElementRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 644b91fdaf6e051e72ac657fc3316beb ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curve3delementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Curve3dElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2fa92d273f9acf133a5db0f3ed206c73 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Curve3dElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8c593c7b3e193fd8fe0db8ef18538e3f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curve3delementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Curve3dElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWCurve3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWCurveElementEndOffset *
******************************************/
class RWStepFEA_RWCurveElementEndOffset {
	public:
		/****************** RWStepFEA_RWCurveElementEndOffset ******************/
		/**** md5 signature: ee5e90c1efb05eed9eb06bda97d9887c ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementEndOffset;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementEndOffset;
		 RWStepFEA_RWCurveElementEndOffset();

		/****************** ReadStep ******************/
		/**** md5 signature: 69910a8331011dd51222ca6bd373bb7c ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementendoffset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementEndOffset

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementEndOffset> & ent);

		/****************** Share ******************/
		/**** md5 signature: e8a1e17ac963c421f2c9e4a05f82fe8e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementEndOffset
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementEndOffset> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 91a7f92698b69ad2cd2df15050e70510 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementendoffset.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementEndOffset

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementEndOffset> & ent);

};


%extend RWStepFEA_RWCurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepFEA_RWCurveElementEndRelease *
*******************************************/
class RWStepFEA_RWCurveElementEndRelease {
	public:
		/****************** RWStepFEA_RWCurveElementEndRelease ******************/
		/**** md5 signature: 95785e59afe296eb498181a1f82f8eb5 ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementEndRelease;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementEndRelease;
		 RWStepFEA_RWCurveElementEndRelease();

		/****************** ReadStep ******************/
		/**** md5 signature: 072375d1c6849b9e2cd6e60f00b48e39 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementendrelease.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementEndRelease

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementEndRelease> & ent);

		/****************** Share ******************/
		/**** md5 signature: a1101d0b0152a1c84fc7067f4a21678f ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementEndRelease
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementEndRelease> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e00acf262f9fd92172205267155e96c4 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementendrelease.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementEndRelease

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementEndRelease> & ent);

};


%extend RWStepFEA_RWCurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepFEA_RWCurveElementInterval *
*****************************************/
class RWStepFEA_RWCurveElementInterval {
	public:
		/****************** RWStepFEA_RWCurveElementInterval ******************/
		/**** md5 signature: 7f2f05ef661f8c1dbf1ce5eda954855f ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementInterval;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementInterval;
		 RWStepFEA_RWCurveElementInterval();

		/****************** ReadStep ******************/
		/**** md5 signature: bfeefbc6d9c7a95624e55fbdfc92f426 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementinterval.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementInterval

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementInterval> & ent);

		/****************** Share ******************/
		/**** md5 signature: af880af2ea799b39b31c211542f190b2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementInterval
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementInterval> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: f5b0cfb150cf517660fc4e13ff730f56 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementinterval.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementInterval

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementInterval> & ent);

};


%extend RWStepFEA_RWCurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepFEA_RWCurveElementIntervalConstant *
*************************************************/
class RWStepFEA_RWCurveElementIntervalConstant {
	public:
		/****************** RWStepFEA_RWCurveElementIntervalConstant ******************/
		/**** md5 signature: f914e070e6b8556f18cf63859762223f ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementIntervalConstant;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementIntervalConstant;
		 RWStepFEA_RWCurveElementIntervalConstant();

		/****************** ReadStep ******************/
		/**** md5 signature: f84a84046341a3fe6ead30f46b01c0b0 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementintervalconstant.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementIntervalConstant

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent);

		/****************** Share ******************/
		/**** md5 signature: 45a3221618e5e8b784342a20690bd0c7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementIntervalConstant
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a01d55355418a72671310416e2d1b163 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementintervalconstant.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementIntervalConstant

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementIntervalConstant> & ent);

};


%extend RWStepFEA_RWCurveElementIntervalConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class RWStepFEA_RWCurveElementIntervalLinearlyVarying *
********************************************************/
class RWStepFEA_RWCurveElementIntervalLinearlyVarying {
	public:
		/****************** RWStepFEA_RWCurveElementIntervalLinearlyVarying ******************/
		/**** md5 signature: 4defaaa3ddb79e5837e0f304cefda3f2 ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		 RWStepFEA_RWCurveElementIntervalLinearlyVarying();

		/****************** ReadStep ******************/
		/**** md5 signature: 1572beffb845f945ce361c3a8ed84f86 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementintervallinearlyvarying.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementIntervalLinearlyVarying

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent);

		/****************** Share ******************/
		/**** md5 signature: 9f4e9f706a5f57a02e381f271028a9b6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementIntervalLinearlyVarying
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2042cbbc61eb70dd2d4f61c6490105b0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementintervallinearlyvarying.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementIntervalLinearlyVarying

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementIntervalLinearlyVarying> & ent);

};


%extend RWStepFEA_RWCurveElementIntervalLinearlyVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWStepFEA_RWCurveElementLocation *
*****************************************/
class RWStepFEA_RWCurveElementLocation {
	public:
		/****************** RWStepFEA_RWCurveElementLocation ******************/
		/**** md5 signature: 15e74e34bd1feeeb0b826be84bf107ca ****/
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementLocation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWCurveElementLocation;
		 RWStepFEA_RWCurveElementLocation();

		/****************** ReadStep ******************/
		/**** md5 signature: a03225b9782c1163e95f102a1a72f849 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads curveelementlocation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_CurveElementLocation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_CurveElementLocation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2245f0b69528e051160b12f2ad07be04 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_CurveElementLocation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_CurveElementLocation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fb9c63bc45b207decb36c77e9c07efec ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes curveelementlocation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_CurveElementLocation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_CurveElementLocation> & ent);

};


%extend RWStepFEA_RWCurveElementLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepFEA_RWDummyNode *
******************************/
class RWStepFEA_RWDummyNode {
	public:
		/****************** RWStepFEA_RWDummyNode ******************/
		/**** md5 signature: 22ca733d1bde1b9270a6aaed81a580c6 ****/
		%feature("compactdefaultargs") RWStepFEA_RWDummyNode;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWDummyNode;
		 RWStepFEA_RWDummyNode();

		/****************** ReadStep ******************/
		/**** md5 signature: ed25804b23058941daff25a3c428518b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads dummynode.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_DummyNode

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_DummyNode> & ent);

		/****************** Share ******************/
		/**** md5 signature: f96062e1ba87c8ab10b50e04ce65da82 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_DummyNode
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_DummyNode> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4e876993e0ab8aaa736164fb6129fb57 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes dummynode.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_DummyNode

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_DummyNode> & ent);

};


%extend RWStepFEA_RWDummyNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class RWStepFEA_RWElementGeometricRelationship *
*************************************************/
class RWStepFEA_RWElementGeometricRelationship {
	public:
		/****************** RWStepFEA_RWElementGeometricRelationship ******************/
		/**** md5 signature: 0784310b956a779881d98decacf035fc ****/
		%feature("compactdefaultargs") RWStepFEA_RWElementGeometricRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWElementGeometricRelationship;
		 RWStepFEA_RWElementGeometricRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: d2647efc4cebabd461da073ca03e5a8a ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementgeometricrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ElementGeometricRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: 04717fe76ddfab3d166387a5896b2798 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ElementGeometricRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3ddfc6b4883409b0c53426efe3347417 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementgeometricrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ElementGeometricRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ElementGeometricRelationship> & ent);

};


%extend RWStepFEA_RWElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepFEA_RWElementGroup *
*********************************/
class RWStepFEA_RWElementGroup {
	public:
		/****************** RWStepFEA_RWElementGroup ******************/
		/**** md5 signature: 6fe872c90b5fd5f7bbee1eb99e4ef4e2 ****/
		%feature("compactdefaultargs") RWStepFEA_RWElementGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWElementGroup;
		 RWStepFEA_RWElementGroup();

		/****************** ReadStep ******************/
		/**** md5 signature: f44907d3594a2f88bf19c3661ab5d675 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementgroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ElementGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ElementGroup> & ent);

		/****************** Share ******************/
		/**** md5 signature: f0ccc9e18329fa36dc113f39c9c95f4d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ElementGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ElementGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4ada9a359bd5af3063720ac636f890eb ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementgroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ElementGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ElementGroup> & ent);

};


%extend RWStepFEA_RWElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWElementRepresentation *
******************************************/
class RWStepFEA_RWElementRepresentation {
	public:
		/****************** RWStepFEA_RWElementRepresentation ******************/
		/**** md5 signature: 62ae710d393fc08564f840a12d3e246f ****/
		%feature("compactdefaultargs") RWStepFEA_RWElementRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWElementRepresentation;
		 RWStepFEA_RWElementRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 25bcbac375d901f81c913a318543d562 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads elementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ElementRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: a8cd815e5ec009de8e5ade2e10d2292a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6228b9d5497a558fea481adb1628d417 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes elementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ElementRepresentation> & ent);

};


%extend RWStepFEA_RWElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWFeaAreaDensity *
***********************************/
class RWStepFEA_RWFeaAreaDensity {
	public:
		/****************** RWStepFEA_RWFeaAreaDensity ******************/
		/**** md5 signature: 19ded727609bb476a56b12bb02aace6d ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaAreaDensity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaAreaDensity;
		 RWStepFEA_RWFeaAreaDensity();

		/****************** ReadStep ******************/
		/**** md5 signature: 4530ee57a4fb43bf6d43428ac0dce3db ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feaareadensity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaAreaDensity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaAreaDensity> & ent);

		/****************** Share ******************/
		/**** md5 signature: 122bdb563011b6fba0a193a22b007a74 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaAreaDensity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaAreaDensity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2c446433b70586eecfff15d687981e5f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feaareadensity.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaAreaDensity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaAreaDensity> & ent);

};


%extend RWStepFEA_RWFeaAreaDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepFEA_RWFeaAxis2Placement3d *
****************************************/
class RWStepFEA_RWFeaAxis2Placement3d {
	public:
		/****************** RWStepFEA_RWFeaAxis2Placement3d ******************/
		/**** md5 signature: 430504d3aa49017d38f11c2030c72209 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaAxis2Placement3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaAxis2Placement3d;
		 RWStepFEA_RWFeaAxis2Placement3d();

		/****************** ReadStep ******************/
		/**** md5 signature: dc7ef005cf2a20d9f7e68d332684a6f6 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feaaxis2placement3d.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaAxis2Placement3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent);

		/****************** Share ******************/
		/**** md5 signature: b86538915c21b6b3cd07d06442dbe5b0 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaAxis2Placement3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 6c4925f9521e2f6363d417ad68c595ac ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feaaxis2placement3d.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaAxis2Placement3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaAxis2Placement3d> & ent);

};


%extend RWStepFEA_RWFeaAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class RWStepFEA_RWFeaCurveSectionGeometricRelationship *
*********************************************************/
class RWStepFEA_RWFeaCurveSectionGeometricRelationship {
	public:
		/****************** RWStepFEA_RWFeaCurveSectionGeometricRelationship ******************/
		/**** md5 signature: 9c4424d05b4da1aa504b2f31757efd62 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		 RWStepFEA_RWFeaCurveSectionGeometricRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: 46307fc6832e2cdbf3da7bbce7ec35a4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feacurvesectiongeometricrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaCurveSectionGeometricRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: b3aa50924c9b5dd2330fa4329201e6f7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaCurveSectionGeometricRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 84ddbf87845a655a0770d51edb3205f3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feacurvesectiongeometricrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaCurveSectionGeometricRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaCurveSectionGeometricRelationship> & ent);

};


%extend RWStepFEA_RWFeaCurveSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepFEA_RWFeaGroup *
*****************************/
class RWStepFEA_RWFeaGroup {
	public:
		/****************** RWStepFEA_RWFeaGroup ******************/
		/**** md5 signature: 534829ba58f91ce23895e42f43b328ea ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaGroup;
		 RWStepFEA_RWFeaGroup();

		/****************** ReadStep ******************/
		/**** md5 signature: b62b9c43319fe42149eecd2e6f56c1b3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feagroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaGroup> & ent);

		/****************** Share ******************/
		/**** md5 signature: 78817b2b489b3db46c32e243e1cdadc2 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 32c7df2cd78d96c1fd1b316a521bfdb7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feagroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaGroup> & ent);

};


%extend RWStepFEA_RWFeaGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class RWStepFEA_RWFeaLinearElasticity *
****************************************/
class RWStepFEA_RWFeaLinearElasticity {
	public:
		/****************** RWStepFEA_RWFeaLinearElasticity ******************/
		/**** md5 signature: 5507582c2e6148fdf6c5d7670504d0ef ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaLinearElasticity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaLinearElasticity;
		 RWStepFEA_RWFeaLinearElasticity();

		/****************** ReadStep ******************/
		/**** md5 signature: 2dff1670a26ced743ef0f5718c196e7d ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads fealinearelasticity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaLinearElasticity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaLinearElasticity> & ent);

		/****************** Share ******************/
		/**** md5 signature: c4dd95ba8755f86105f8131348d8ec5b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaLinearElasticity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaLinearElasticity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cb306562ec845b9cb939d227086375b7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes fealinearelasticity.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaLinearElasticity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaLinearElasticity> & ent);

};


%extend RWStepFEA_RWFeaLinearElasticity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWFeaMassDensity *
***********************************/
class RWStepFEA_RWFeaMassDensity {
	public:
		/****************** RWStepFEA_RWFeaMassDensity ******************/
		/**** md5 signature: e77cbb006c109065307a268305f55621 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMassDensity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMassDensity;
		 RWStepFEA_RWFeaMassDensity();

		/****************** ReadStep ******************/
		/**** md5 signature: 780b3551be467c8ac78c40ae93f3b4d3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamassdensity.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMassDensity

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMassDensity> & ent);

		/****************** Share ******************/
		/**** md5 signature: 34a7691c1318c83c10d52ac50c8392ab ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMassDensity
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMassDensity> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 379a316b3f48487dd050600995a313d1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamassdensity.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMassDensity

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMassDensity> & ent);

};


%extend RWStepFEA_RWFeaMassDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class RWStepFEA_RWFeaMaterialPropertyRepresentation *
******************************************************/
class RWStepFEA_RWFeaMaterialPropertyRepresentation {
	public:
		/****************** RWStepFEA_RWFeaMaterialPropertyRepresentation ******************/
		/**** md5 signature: ae8675949fdfece55b2e3acb2b3a2357 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		 RWStepFEA_RWFeaMaterialPropertyRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 54deb642ba371fb90a7dd8fbbef14169 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamaterialpropertyrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMaterialPropertyRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: d244600e8b3c87f03e79eefd56ad07b8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMaterialPropertyRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 3ada9703f47ba65ece321c05545ddaa5 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamaterialpropertyrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMaterialPropertyRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentation> & ent);

};


%extend RWStepFEA_RWFeaMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class RWStepFEA_RWFeaMaterialPropertyRepresentationItem *
**********************************************************/
class RWStepFEA_RWFeaMaterialPropertyRepresentationItem {
	public:
		/****************** RWStepFEA_RWFeaMaterialPropertyRepresentationItem ******************/
		/**** md5 signature: f46f656a199dedb243beb1e7e9559c94 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		 RWStepFEA_RWFeaMaterialPropertyRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: 5e6b5805b04fb74378664812d5aea517 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamaterialpropertyrepresentationitem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMaterialPropertyRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 56a7ffddd4de5e3f860372f693579763 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMaterialPropertyRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 2ecdfdccaf59550ef89911dd73a7e942 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamaterialpropertyrepresentationitem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMaterialPropertyRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMaterialPropertyRepresentationItem> & ent);

};


%extend RWStepFEA_RWFeaMaterialPropertyRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWStepFEA_RWFeaModel *
*****************************/
class RWStepFEA_RWFeaModel {
	public:
		/****************** RWStepFEA_RWFeaModel ******************/
		/**** md5 signature: c26529c08886d6975487e888754592ea ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaModel;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaModel;
		 RWStepFEA_RWFeaModel();

		/****************** ReadStep ******************/
		/**** md5 signature: 2a6a5fa02c2f2f744366c6b6dda644c4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamodel.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaModel

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaModel> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3197b4c9368a26531eb20c86437e9d7e ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaModel
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaModel> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 34390a47c9fa6bbafd1173f0489efacf ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamodel.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaModel

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaModel> & ent);

};


%extend RWStepFEA_RWFeaModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWStepFEA_RWFeaModel3d *
*******************************/
class RWStepFEA_RWFeaModel3d {
	public:
		/****************** RWStepFEA_RWFeaModel3d ******************/
		/**** md5 signature: c287383a5f1fd06186730500e860d8df ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaModel3d;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaModel3d;
		 RWStepFEA_RWFeaModel3d();

		/****************** ReadStep ******************/
		/**** md5 signature: 1a03c38d05b792bcdd148fa27c3da7cc ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamodel3d.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaModel3d

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaModel3d> & ent);

		/****************** Share ******************/
		/**** md5 signature: c42230ab4c92be63664c8e6ec7a62c36 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaModel3d
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaModel3d> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 4af58dc190716bae6ae49543d06c258d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamodel3d.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaModel3d

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaModel3d> & ent);

};


%extend RWStepFEA_RWFeaModel3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepFEA_RWFeaModelDefinition *
***************************************/
class RWStepFEA_RWFeaModelDefinition {
	public:
		/****************** RWStepFEA_RWFeaModelDefinition ******************/
		/**** md5 signature: 16079759829e4a7e4160643af53e3acb ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaModelDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaModelDefinition;
		 RWStepFEA_RWFeaModelDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: 36ec789183042fb71104c8804ba6ea97 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamodeldefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaModelDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaModelDefinition> & ent);

		/****************** Share ******************/
		/**** md5 signature: 7650d5b90dddfeaf36e659951ae1297a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaModelDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaModelDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 9728b4e98e9b00967a276406996362b7 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamodeldefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaModelDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaModelDefinition> & ent);

};


%extend RWStepFEA_RWFeaModelDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWFeaMoistureAbsorption *
******************************************/
class RWStepFEA_RWFeaMoistureAbsorption {
	public:
		/****************** RWStepFEA_RWFeaMoistureAbsorption ******************/
		/**** md5 signature: a0f88d1f87debe2056970553d4ce8dc8 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaMoistureAbsorption;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaMoistureAbsorption;
		 RWStepFEA_RWFeaMoistureAbsorption();

		/****************** ReadStep ******************/
		/**** md5 signature: 67414aee2c38be2f3eb77e49bc939086 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feamoistureabsorption.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaMoistureAbsorption

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent);

		/****************** Share ******************/
		/**** md5 signature: 22c9292efd0a5e2275110ae94edbbd6b ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaMoistureAbsorption
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a9f92ff6620308eea17b8ee4c78ad73f ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feamoistureabsorption.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaMoistureAbsorption

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaMoistureAbsorption> & ent);

};


%extend RWStepFEA_RWFeaMoistureAbsorption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepFEA_RWFeaParametricPoint *
***************************************/
class RWStepFEA_RWFeaParametricPoint {
	public:
		/****************** RWStepFEA_RWFeaParametricPoint ******************/
		/**** md5 signature: 09ebe98b1693e165bdc365e5cde1db9e ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaParametricPoint;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaParametricPoint;
		 RWStepFEA_RWFeaParametricPoint();

		/****************** ReadStep ******************/
		/**** md5 signature: 195eb4fa56dfc1697ee9c971b3c58053 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feaparametricpoint.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaParametricPoint

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaParametricPoint> & ent);

		/****************** Share ******************/
		/**** md5 signature: 041f60bf617c06f9f4b55a0006d1df2d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaParametricPoint
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaParametricPoint> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e24a7a1bd2ab0368b913db7a38e1651e ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feaparametricpoint.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaParametricPoint

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaParametricPoint> & ent);

};


%extend RWStepFEA_RWFeaParametricPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWFeaRepresentationItem *
******************************************/
class RWStepFEA_RWFeaRepresentationItem {
	public:
		/****************** RWStepFEA_RWFeaRepresentationItem ******************/
		/**** md5 signature: 6900829ac8592bf4d20fbf631a7ac937 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaRepresentationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaRepresentationItem;
		 RWStepFEA_RWFeaRepresentationItem();

		/****************** ReadStep ******************/
		/**** md5 signature: a2ae8d58a8d193e83ff055bfa19f5607 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads fearepresentationitem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaRepresentationItem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaRepresentationItem> & ent);

		/****************** Share ******************/
		/**** md5 signature: d2049817047957965f2c123148914134 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaRepresentationItem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaRepresentationItem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: edee44f1ba042c16487e3e766879b439 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes fearepresentationitem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaRepresentationItem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaRepresentationItem> & ent);

};


%extend RWStepFEA_RWFeaRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************************
* class RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion *
*****************************************************************/
class RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion {
	public:
		/****************** RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion ******************/
		/**** md5 signature: f7f812d5a0ed5f40138e953da05c3177 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion();

		/****************** ReadStep ******************/
		/**** md5 signature: 6fdc3916f968d1f68d9cc3b2b6247790 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feasecantcoefficientoflinearthermalexpansion.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent);

		/****************** Share ******************/
		/**** md5 signature: ef297c291fc3337b0e02dba57edeea3c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 44745e17506578e2e97eb2d0a571cb73 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feasecantcoefficientoflinearthermalexpansion.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaSecantCoefficientOfLinearThermalExpansion

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaSecantCoefficientOfLinearThermalExpansion> & ent);

};


%extend RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class RWStepFEA_RWFeaShellBendingStiffness *
*********************************************/
class RWStepFEA_RWFeaShellBendingStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellBendingStiffness ******************/
		/**** md5 signature: e858e5bf065286f2c0e278e8acdaf717 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellBendingStiffness;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellBendingStiffness;
		 RWStepFEA_RWFeaShellBendingStiffness();

		/****************** ReadStep ******************/
		/**** md5 signature: 3e75c0f8b09379ea4f6b31cf91abcd7f ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellbendingstiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellBendingStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent);

		/****************** Share ******************/
		/**** md5 signature: cfee65b5ee80ae8b1f1c354b72f58690 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellBendingStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: a59f679cc5078e2609a98a0f3e4d1afa ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellbendingstiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellBendingStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellBendingStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellBendingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness *
*************************************************************/
class RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness ******************/
		/**** md5 signature: 3ff20029d05439084722f0c7e8a66df0 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		 RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness();

		/****************** ReadStep ******************/
		/**** md5 signature: 6961ce18c30f30da0651ad45424988d3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellmembranebendingcouplingstiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellMembraneBendingCouplingStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent);

		/****************** Share ******************/
		/**** md5 signature: e57dfa4e88e11c374765037b2cfa0b73 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellMembraneBendingCouplingStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 0212e50da7f62654c65f3494e7f0aad0 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellmembranebendingcouplingstiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellMembraneBendingCouplingStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellMembraneBendingCouplingStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class RWStepFEA_RWFeaShellMembraneStiffness *
**********************************************/
class RWStepFEA_RWFeaShellMembraneStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellMembraneStiffness ******************/
		/**** md5 signature: 57a66671cbeeaab91720e04907b69b47 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellMembraneStiffness;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellMembraneStiffness;
		 RWStepFEA_RWFeaShellMembraneStiffness();

		/****************** ReadStep ******************/
		/**** md5 signature: d0d04431ea08fc7051786f0c7f9f5024 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellmembranestiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellMembraneStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent);

		/****************** Share ******************/
		/**** md5 signature: 93fffe64eabf0772117ca337205b7e59 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellMembraneStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: fcb2066475ad9b40192a5e5525d95433 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellmembranestiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellMembraneStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellMembraneStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellMembraneStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class RWStepFEA_RWFeaShellShearStiffness *
*******************************************/
class RWStepFEA_RWFeaShellShearStiffness {
	public:
		/****************** RWStepFEA_RWFeaShellShearStiffness ******************/
		/**** md5 signature: 8353eca40f7b27a4859b18f95d54af71 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellShearStiffness;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaShellShearStiffness;
		 RWStepFEA_RWFeaShellShearStiffness();

		/****************** ReadStep ******************/
		/**** md5 signature: e2219de6788b3175b76244d8172d98b5 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feashellshearstiffness.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaShellShearStiffness

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent);

		/****************** Share ******************/
		/**** md5 signature: ce8d1f724626759e33eaf9ce750b13c6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaShellShearStiffness
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 60a628001a869f1e432ea2f0efbb5b8b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feashellshearstiffness.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaShellShearStiffness

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaShellShearStiffness> & ent);

};


%extend RWStepFEA_RWFeaShellShearStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class RWStepFEA_RWFeaSurfaceSectionGeometricRelationship *
***********************************************************/
class RWStepFEA_RWFeaSurfaceSectionGeometricRelationship {
	public:
		/****************** RWStepFEA_RWFeaSurfaceSectionGeometricRelationship ******************/
		/**** md5 signature: 6a02b51e3e32ae0df6687d7195281355 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		 RWStepFEA_RWFeaSurfaceSectionGeometricRelationship();

		/****************** ReadStep ******************/
		/**** md5 signature: acee9b9f1dc3fba61f0f1690c13158c8 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads feasurfacesectiongeometricrelationship.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaSurfaceSectionGeometricRelationship

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent);

		/****************** Share ******************/
		/**** md5 signature: 4bb46e304c40b5e96af017358f0b29bb ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaSurfaceSectionGeometricRelationship
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 05f285579f96183437e24c92ee617c35 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes feasurfacesectiongeometricrelationship.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaSurfaceSectionGeometricRelationship

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaSurfaceSectionGeometricRelationship> & ent);

};


%extend RWStepFEA_RWFeaSurfaceSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************************
* class RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion *
*********************************************************************/
class RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion {
	public:
		/****************** RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion ******************/
		/**** md5 signature: 1c58be76635746bf72f4a9ace5ac3648 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion();

		/****************** ReadStep ******************/
		/**** md5 signature: 2812437257ea33f9ac70bff60ba32aec ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads featangentialcoefficientoflinearthermalexpansion.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent);

		/****************** Share ******************/
		/**** md5 signature: 721bb03d44989af6aba921220a4b8fd3 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7c9f362d4026570848affb5a0de32833 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes featangentialcoefficientoflinearthermalexpansion.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion> & ent);

};


%extend RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class RWStepFEA_RWFreedomAndCoefficient *
******************************************/
class RWStepFEA_RWFreedomAndCoefficient {
	public:
		/****************** RWStepFEA_RWFreedomAndCoefficient ******************/
		/**** md5 signature: 177ce15f6d53d1b3665e2a1f0b300401 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFreedomAndCoefficient;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFreedomAndCoefficient;
		 RWStepFEA_RWFreedomAndCoefficient();

		/****************** ReadStep ******************/
		/**** md5 signature: 0ce41494e0b90fac5defca839335d467 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads freedomandcoefficient.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FreedomAndCoefficient

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent);

		/****************** Share ******************/
		/**** md5 signature: 31adbad37217b25f0a434c9339b7a6d8 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FreedomAndCoefficient
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 77d34181086442e998d01a69208b562a ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes freedomandcoefficient.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FreedomAndCoefficient

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FreedomAndCoefficient> & ent);

};


%extend RWStepFEA_RWFreedomAndCoefficient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWStepFEA_RWFreedomsList *
*********************************/
class RWStepFEA_RWFreedomsList {
	public:
		/****************** RWStepFEA_RWFreedomsList ******************/
		/**** md5 signature: 6f5b777d5aa685fb6d2b64bc9d7edae0 ****/
		%feature("compactdefaultargs") RWStepFEA_RWFreedomsList;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWFreedomsList;
		 RWStepFEA_RWFreedomsList();

		/****************** ReadStep ******************/
		/**** md5 signature: d9d7ddeab2025bca8027f063fe6070f4 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads freedomslist.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_FreedomsList

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_FreedomsList> & ent);

		/****************** Share ******************/
		/**** md5 signature: a283ea0182e8352d4410fbd2ed74060a ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_FreedomsList
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_FreedomsList> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b479e4fa68f4bcbcabcf867cf88cc87b ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes freedomslist.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_FreedomsList

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_FreedomsList> & ent);

};


%extend RWStepFEA_RWFreedomsList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWStepFEA_RWGeometricNode *
**********************************/
class RWStepFEA_RWGeometricNode {
	public:
		/****************** RWStepFEA_RWGeometricNode ******************/
		/**** md5 signature: 47e2361ec3fecbb0b7e5c5d84184366d ****/
		%feature("compactdefaultargs") RWStepFEA_RWGeometricNode;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWGeometricNode;
		 RWStepFEA_RWGeometricNode();

		/****************** ReadStep ******************/
		/**** md5 signature: 8de25498d20cda1321d68e7f2ef779ad ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads geometricnode.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_GeometricNode

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_GeometricNode> & ent);

		/****************** Share ******************/
		/**** md5 signature: d92b70c166a54f96d87bb13e6149b50d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_GeometricNode
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_GeometricNode> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e7943cc0323a5f1e01649437f55992ff ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes geometricnode.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_GeometricNode

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_GeometricNode> & ent);

};


%extend RWStepFEA_RWGeometricNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class RWStepFEA_RWNode *
*************************/
class RWStepFEA_RWNode {
	public:
		/****************** RWStepFEA_RWNode ******************/
		/**** md5 signature: 7385882c588958a0404cee7bb2b9825c ****/
		%feature("compactdefaultargs") RWStepFEA_RWNode;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNode;
		 RWStepFEA_RWNode();

		/****************** ReadStep ******************/
		/**** md5 signature: e4597b175db181f0fdaadc257c00a586 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads node.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Node

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Node> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6146673ea0e1053436eb2e5faa4b6e63 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Node
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Node> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 8b11f7c4668c3b625bd88c9827870ba1 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes node.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Node

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Node> & ent);

};


%extend RWStepFEA_RWNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWNodeDefinition *
***********************************/
class RWStepFEA_RWNodeDefinition {
	public:
		/****************** RWStepFEA_RWNodeDefinition ******************/
		/**** md5 signature: 7479efed79c03ff532baf340356bb715 ****/
		%feature("compactdefaultargs") RWStepFEA_RWNodeDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeDefinition;
		 RWStepFEA_RWNodeDefinition();

		/****************** ReadStep ******************/
		/**** md5 signature: d5a09d9c20f3ffab0c748423f9001ef3 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodedefinition.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeDefinition

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeDefinition> & ent);

		/****************** Share ******************/
		/**** md5 signature: ecd9db99210f3cb01d7c087ef8e5a417 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeDefinition
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeDefinition> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 135ec4603e5f287ab15792cebfa11515 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodedefinition.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeDefinition

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeDefinition> & ent);

};


%extend RWStepFEA_RWNodeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWStepFEA_RWNodeGroup *
******************************/
class RWStepFEA_RWNodeGroup {
	public:
		/****************** RWStepFEA_RWNodeGroup ******************/
		/**** md5 signature: 6a6c1da7547f446a3cf1f304cfbb24b7 ****/
		%feature("compactdefaultargs") RWStepFEA_RWNodeGroup;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeGroup;
		 RWStepFEA_RWNodeGroup();

		/****************** ReadStep ******************/
		/**** md5 signature: 7170bef8338978ab8686287eadb81eba ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodegroup.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeGroup

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeGroup> & ent);

		/****************** Share ******************/
		/**** md5 signature: ff1c63e741f86fd10525a737ba6b4d88 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeGroup
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeGroup> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e67b3beaf9bdb5555dc47dd50c5a51d6 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodegroup.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeGroup

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeGroup> & ent);

};


%extend RWStepFEA_RWNodeGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class RWStepFEA_RWNodeRepresentation *
***************************************/
class RWStepFEA_RWNodeRepresentation {
	public:
		/****************** RWStepFEA_RWNodeRepresentation ******************/
		/**** md5 signature: fd68c5e465bea72daf1d57a9613e246c ****/
		%feature("compactdefaultargs") RWStepFEA_RWNodeRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeRepresentation;
		 RWStepFEA_RWNodeRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 4690da904e31d491371061036d49cb07 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads noderepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3881345c4f2584e5d2415c3f890ee3bc ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ed2d9281621b7f734e357b3ab83a091d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes noderepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeRepresentation> & ent);

};


%extend RWStepFEA_RWNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWStepFEA_RWNodeSet *
****************************/
class RWStepFEA_RWNodeSet {
	public:
		/****************** RWStepFEA_RWNodeSet ******************/
		/**** md5 signature: 4fe5b810a15c94f98b74f33f65dc8af8 ****/
		%feature("compactdefaultargs") RWStepFEA_RWNodeSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeSet;
		 RWStepFEA_RWNodeSet();

		/****************** ReadStep ******************/
		/**** md5 signature: 563162f368b88d3caa21e81580827bd1 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodeset.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeSet

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeSet> & ent);

		/****************** Share ******************/
		/**** md5 signature: 10ae829a7b3c7fcd6315527b15a8108c ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeSet
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeSet> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 19ad3bb3ddda06c9e53ae814ffe56d8d ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodeset.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeSet

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeSet> & ent);

};


%extend RWStepFEA_RWNodeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class RWStepFEA_RWNodeWithSolutionCoordinateSystem *
*****************************************************/
class RWStepFEA_RWNodeWithSolutionCoordinateSystem {
	public:
		/****************** RWStepFEA_RWNodeWithSolutionCoordinateSystem ******************/
		/**** md5 signature: 3ce169b6ba42b92485ac17d369d3a5c6 ****/
		%feature("compactdefaultargs") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		 RWStepFEA_RWNodeWithSolutionCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: fee9f7de9c724bde27bbe535f85a5c49 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodewithsolutioncoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeWithSolutionCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 2f4848f949478ea2495b429d6e769e6d ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeWithSolutionCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 50fb4bcb6aa51299eec33652c7c1b1b3 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodewithsolutioncoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeWithSolutionCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeWithSolutionCoordinateSystem> & ent);

};


%extend RWStepFEA_RWNodeWithSolutionCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWStepFEA_RWNodeWithVector *
***********************************/
class RWStepFEA_RWNodeWithVector {
	public:
		/****************** RWStepFEA_RWNodeWithVector ******************/
		/**** md5 signature: 7e4917645249c3c0009bc8c393692a19 ****/
		%feature("compactdefaultargs") RWStepFEA_RWNodeWithVector;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWNodeWithVector;
		 RWStepFEA_RWNodeWithVector();

		/****************** ReadStep ******************/
		/**** md5 signature: d160cca41761618fe2fc9a2131939c6b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads nodewithvector.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_NodeWithVector

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_NodeWithVector> & ent);

		/****************** Share ******************/
		/**** md5 signature: 3e4947022e077537cbd4e1ca6e85e273 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_NodeWithVector
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_NodeWithVector> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: e75f75b4b7ec5acff47ee1b8e584d316 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes nodewithvector.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_NodeWithVector

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_NodeWithVector> & ent);

};


%extend RWStepFEA_RWNodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class RWStepFEA_RWParametricCurve3dElementCoordinateDirection *
****************************************************************/
class RWStepFEA_RWParametricCurve3dElementCoordinateDirection {
	public:
		/****************** RWStepFEA_RWParametricCurve3dElementCoordinateDirection ******************/
		/**** md5 signature: 585012fc0cf57ab0a13539104198ce27 ****/
		%feature("compactdefaultargs") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		 RWStepFEA_RWParametricCurve3dElementCoordinateDirection();

		/****************** ReadStep ******************/
		/**** md5 signature: 2b9c98109a9fe369702ec157b56fef03 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parametriccurve3delementcoordinatedirection.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ParametricCurve3dElementCoordinateDirection

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent);

		/****************** Share ******************/
		/**** md5 signature: 0f78a592916563f932e04e2de92058cd ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ParametricCurve3dElementCoordinateDirection
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: ff5075261d9f588dfacdc8d9dc853c40 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parametriccurve3delementcoordinatedirection.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ParametricCurve3dElementCoordinateDirection

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateDirection> & ent);

};


%extend RWStepFEA_RWParametricCurve3dElementCoordinateDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************
* class RWStepFEA_RWParametricCurve3dElementCoordinateSystem *
*************************************************************/
class RWStepFEA_RWParametricCurve3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWParametricCurve3dElementCoordinateSystem ******************/
		/**** md5 signature: 6d68bb773d7b2b2b53cee367b61b203c ****/
		%feature("compactdefaultargs") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		 RWStepFEA_RWParametricCurve3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: 9a912cb3e2840d90f1276e5458bcc738 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parametriccurve3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ParametricCurve3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 45f0c2184608b5a4d34d6f729ae90cd6 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ParametricCurve3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: b341fe0cf18a3448475c4b5d60a7b3fc ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parametriccurve3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ParametricCurve3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ParametricCurve3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWParametricCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************************
* class RWStepFEA_RWParametricSurface3dElementCoordinateSystem *
***************************************************************/
class RWStepFEA_RWParametricSurface3dElementCoordinateSystem {
	public:
		/****************** RWStepFEA_RWParametricSurface3dElementCoordinateSystem ******************/
		/**** md5 signature: 310b0dd53dab9f478025757642864380 ****/
		%feature("compactdefaultargs") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		 RWStepFEA_RWParametricSurface3dElementCoordinateSystem();

		/****************** ReadStep ******************/
		/**** md5 signature: 778116c8bfce6a886782cbfffaf23f6b ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads parametricsurface3delementcoordinatesystem.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_ParametricSurface3dElementCoordinateSystem

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent);

		/****************** Share ******************/
		/**** md5 signature: 6e70b61298cff4c8cb0eb08bb5cb93d7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_ParametricSurface3dElementCoordinateSystem
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: 7f31a610f110dccb2c8b6b821f684b34 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes parametricsurface3delementcoordinatesystem.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_ParametricSurface3dElementCoordinateSystem

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_ParametricSurface3dElementCoordinateSystem> & ent);

};


%extend RWStepFEA_RWParametricSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class RWStepFEA_RWSurface3dElementRepresentation *
***************************************************/
class RWStepFEA_RWSurface3dElementRepresentation {
	public:
		/****************** RWStepFEA_RWSurface3dElementRepresentation ******************/
		/**** md5 signature: de06f1297515e297b8e1b9556be5c0af ****/
		%feature("compactdefaultargs") RWStepFEA_RWSurface3dElementRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWSurface3dElementRepresentation;
		 RWStepFEA_RWSurface3dElementRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 0f4778054f1204a155b065a3031a0d32 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads surface3delementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Surface3dElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: fcfe697949e6b6ce1ec86a89d0024698 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Surface3dElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: cd506749a8711bc1ad691abaf3d51313 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes surface3delementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Surface3dElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Surface3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWSurface3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class RWStepFEA_RWVolume3dElementRepresentation *
**************************************************/
class RWStepFEA_RWVolume3dElementRepresentation {
	public:
		/****************** RWStepFEA_RWVolume3dElementRepresentation ******************/
		/**** md5 signature: a6c7939ced5bf58b0f4ce52833b7cff0 ****/
		%feature("compactdefaultargs") RWStepFEA_RWVolume3dElementRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWStepFEA_RWVolume3dElementRepresentation;
		 RWStepFEA_RWVolume3dElementRepresentation();

		/****************** ReadStep ******************/
		/**** md5 signature: 7413f69c7867fa465180a3ba0bfc8f06 ****/
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "Reads volume3delementrepresentation.

Parameters
----------
data: StepData_StepReaderData
num: int
ach: Interface_Check
ent: StepFEA_Volume3dElementRepresentation

Returns
-------
None
") ReadStep;
		void ReadStep(const opencascade::handle<StepData_StepReaderData> & data, const Standard_Integer num, opencascade::handle<Interface_Check> & ach, const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent);

		/****************** Share ******************/
		/**** md5 signature: e1cdb1f26c16fa3e8d4a54b1f65b54f7 ****/
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "Fills data for graph (shared items).

Parameters
----------
ent: StepFEA_Volume3dElementRepresentation
iter: Interface_EntityIterator

Returns
-------
None
") Share;
		void Share(const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent, Interface_EntityIterator & iter);

		/****************** WriteStep ******************/
		/**** md5 signature: c50b462f9aa62fb5837012f8652add23 ****/
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "Writes volume3delementrepresentation.

Parameters
----------
SW: StepData_StepWriter
ent: StepFEA_Volume3dElementRepresentation

Returns
-------
None
") WriteStep;
		void WriteStep(StepData_StepWriter & SW, const opencascade::handle<StepFEA_Volume3dElementRepresentation> & ent);

};


%extend RWStepFEA_RWVolume3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
