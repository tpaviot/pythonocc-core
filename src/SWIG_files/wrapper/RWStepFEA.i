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
%module (package="OCC") RWStepFEA

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


%include RWStepFEA_headers.i


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

%nodefaultctor RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
class RWStepFEA_RWAlignedCurve3dElementCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWAlignedCurve3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedCurve3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AlignedCurve3dElementCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_AlignedCurve3dElementCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_AlignedCurve3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AlignedCurve3dElementCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_AlignedCurve3dElementCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_AlignedCurve3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_AlignedCurve3dElementCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_AlignedCurve3dElementCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWAlignedCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
class RWStepFEA_RWAlignedSurface3dElementCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWAlignedSurface3dElementCoordinateSystem;
		 RWStepFEA_RWAlignedSurface3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AlignedSurface3dElementCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_AlignedSurface3dElementCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_AlignedSurface3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AlignedSurface3dElementCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_AlignedSurface3dElementCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_AlignedSurface3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_AlignedSurface3dElementCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_AlignedSurface3dElementCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWAlignedSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
class RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem;
		 RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ArbitraryVolume3dElementCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ArbitraryVolume3dElementCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ArbitraryVolume3dElementCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWArbitraryVolume3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
class RWStepFEA_RWConstantSurface3dElementCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWConstantSurface3dElementCoordinateSystem;
		 RWStepFEA_RWConstantSurface3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConstantSurface3dElementCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ConstantSurface3dElementCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ConstantSurface3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConstantSurface3dElementCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ConstantSurface3dElementCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ConstantSurface3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ConstantSurface3dElementCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ConstantSurface3dElementCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWConstantSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurve3dElementProperty;
class RWStepFEA_RWCurve3dElementProperty {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurve3dElementProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurve3dElementProperty;
		 RWStepFEA_RWCurve3dElementProperty ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Curve3dElementProperty

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_Curve3dElementProperty & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Curve3dElementProperty

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_Curve3dElementProperty &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_Curve3dElementProperty & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_Curve3dElementProperty &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_Curve3dElementProperty & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurve3dElementProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurve3dElementRepresentation;
class RWStepFEA_RWCurve3dElementRepresentation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurve3dElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurve3dElementRepresentation;
		 RWStepFEA_RWCurve3dElementRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Curve3dElementRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_Curve3dElementRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_Curve3dElementRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Curve3dElementRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_Curve3dElementRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_Curve3dElementRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_Curve3dElementRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_Curve3dElementRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurve3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurveElementEndOffset;
class RWStepFEA_RWCurveElementEndOffset {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementEndOffset;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurveElementEndOffset;
		 RWStepFEA_RWCurveElementEndOffset ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementEndOffset

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_CurveElementEndOffset & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementEndOffset

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementEndOffset &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_CurveElementEndOffset & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_CurveElementEndOffset &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_CurveElementEndOffset & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurveElementEndOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurveElementEndRelease;
class RWStepFEA_RWCurveElementEndRelease {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementEndRelease;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurveElementEndRelease;
		 RWStepFEA_RWCurveElementEndRelease ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementEndRelease

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_CurveElementEndRelease & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementEndRelease

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementEndRelease &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_CurveElementEndRelease & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_CurveElementEndRelease &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_CurveElementEndRelease & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurveElementEndRelease {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurveElementInterval;
class RWStepFEA_RWCurveElementInterval {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementInterval;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurveElementInterval;
		 RWStepFEA_RWCurveElementInterval ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementInterval

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_CurveElementInterval & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementInterval

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementInterval &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_CurveElementInterval & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_CurveElementInterval &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_CurveElementInterval & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurveElementInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurveElementIntervalConstant;
class RWStepFEA_RWCurveElementIntervalConstant {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementIntervalConstant;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurveElementIntervalConstant;
		 RWStepFEA_RWCurveElementIntervalConstant ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementIntervalConstant

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementIntervalConstant &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_CurveElementIntervalConstant & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementIntervalConstant

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementIntervalConstant &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_CurveElementIntervalConstant & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_CurveElementIntervalConstant &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_CurveElementIntervalConstant & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurveElementIntervalConstant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurveElementIntervalLinearlyVarying;
class RWStepFEA_RWCurveElementIntervalLinearlyVarying {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurveElementIntervalLinearlyVarying;
		 RWStepFEA_RWCurveElementIntervalLinearlyVarying ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementIntervalLinearlyVarying

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementIntervalLinearlyVarying &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_CurveElementIntervalLinearlyVarying & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementIntervalLinearlyVarying

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementIntervalLinearlyVarying &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_CurveElementIntervalLinearlyVarying & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_CurveElementIntervalLinearlyVarying &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_CurveElementIntervalLinearlyVarying & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurveElementIntervalLinearlyVarying {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWCurveElementLocation;
class RWStepFEA_RWCurveElementLocation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWCurveElementLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWCurveElementLocation;
		 RWStepFEA_RWCurveElementLocation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CurveElementLocation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementLocation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_CurveElementLocation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CurveElementLocation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_CurveElementLocation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_CurveElementLocation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_CurveElementLocation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_CurveElementLocation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWCurveElementLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWDummyNode;
class RWStepFEA_RWDummyNode {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWDummyNode;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWDummyNode;
		 RWStepFEA_RWDummyNode ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DummyNode

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_DummyNode &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_DummyNode & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DummyNode

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_DummyNode &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_DummyNode & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_DummyNode &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_DummyNode & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWDummyNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWElementGeometricRelationship;
class RWStepFEA_RWElementGeometricRelationship {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWElementGeometricRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWElementGeometricRelationship;
		 RWStepFEA_RWElementGeometricRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ElementGeometricRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ElementGeometricRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ElementGeometricRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ElementGeometricRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ElementGeometricRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ElementGeometricRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ElementGeometricRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWElementGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWElementGroup;
class RWStepFEA_RWElementGroup {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWElementGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWElementGroup;
		 RWStepFEA_RWElementGroup ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ElementGroup

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ElementGroup &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ElementGroup & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ElementGroup

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ElementGroup &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ElementGroup & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ElementGroup &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ElementGroup & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWElementGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWElementRepresentation;
class RWStepFEA_RWElementRepresentation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWElementRepresentation;
		 RWStepFEA_RWElementRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ElementRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ElementRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ElementRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ElementRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ElementRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ElementRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ElementRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaAreaDensity;
class RWStepFEA_RWFeaAreaDensity {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaAreaDensity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaAreaDensity;
		 RWStepFEA_RWFeaAreaDensity ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaAreaDensity

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaAreaDensity &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaAreaDensity & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaAreaDensity

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaAreaDensity &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaAreaDensity & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaAreaDensity &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaAreaDensity & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaAreaDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaAxis2Placement3d;
class RWStepFEA_RWFeaAxis2Placement3d {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaAxis2Placement3d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaAxis2Placement3d;
		 RWStepFEA_RWFeaAxis2Placement3d ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaAxis2Placement3d

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaAxis2Placement3d & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaAxis2Placement3d

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaAxis2Placement3d &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaAxis2Placement3d & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaAxis2Placement3d &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaAxis2Placement3d & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaCurveSectionGeometricRelationship;
class RWStepFEA_RWFeaCurveSectionGeometricRelationship {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaCurveSectionGeometricRelationship;
		 RWStepFEA_RWFeaCurveSectionGeometricRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaCurveSectionGeometricRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaCurveSectionGeometricRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaCurveSectionGeometricRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaCurveSectionGeometricRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaCurveSectionGeometricRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaCurveSectionGeometricRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaCurveSectionGeometricRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaCurveSectionGeometricRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaCurveSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaGroup;
class RWStepFEA_RWFeaGroup {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaGroup;
		 RWStepFEA_RWFeaGroup ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaGroup

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaGroup &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaGroup & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaGroup

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaGroup &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaGroup & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaGroup &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaGroup & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaLinearElasticity;
class RWStepFEA_RWFeaLinearElasticity {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaLinearElasticity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaLinearElasticity;
		 RWStepFEA_RWFeaLinearElasticity ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaLinearElasticity

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaLinearElasticity &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaLinearElasticity & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaLinearElasticity

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaLinearElasticity &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaLinearElasticity & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaLinearElasticity &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaLinearElasticity & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaLinearElasticity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaMassDensity;
class RWStepFEA_RWFeaMassDensity {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaMassDensity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaMassDensity;
		 RWStepFEA_RWFeaMassDensity ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaMassDensity

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaMassDensity &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaMassDensity & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaMassDensity

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaMassDensity &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaMassDensity & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaMassDensity &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaMassDensity & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaMassDensity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaMaterialPropertyRepresentation;
class RWStepFEA_RWFeaMaterialPropertyRepresentation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaMaterialPropertyRepresentation;
		 RWStepFEA_RWFeaMaterialPropertyRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaMaterialPropertyRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaMaterialPropertyRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaMaterialPropertyRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaMaterialPropertyRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaMaterialPropertyRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaMaterialPropertyRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaMaterialPropertyRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaMaterialPropertyRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
class RWStepFEA_RWFeaMaterialPropertyRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaMaterialPropertyRepresentationItem;
		 RWStepFEA_RWFeaMaterialPropertyRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaMaterialPropertyRepresentationItem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaMaterialPropertyRepresentationItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaMaterialPropertyRepresentationItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaMaterialPropertyRepresentationItem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaMaterialPropertyRepresentationItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaMaterialPropertyRepresentationItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaMaterialPropertyRepresentationItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaMaterialPropertyRepresentationItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaMaterialPropertyRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaModel;
class RWStepFEA_RWFeaModel {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaModel;
		 RWStepFEA_RWFeaModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaModel

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaModel

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaModel & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaModel &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaModel & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaModel3d;
class RWStepFEA_RWFeaModel3d {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaModel3d;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaModel3d;
		 RWStepFEA_RWFeaModel3d ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaModel3d

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaModel3d &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaModel3d & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaModel3d

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaModel3d &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaModel3d & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaModel3d &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaModel3d & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaModel3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaModelDefinition;
class RWStepFEA_RWFeaModelDefinition {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaModelDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaModelDefinition;
		 RWStepFEA_RWFeaModelDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaModelDefinition

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaModelDefinition &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaModelDefinition & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaModelDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaModelDefinition &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaModelDefinition & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaModelDefinition &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaModelDefinition & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaModelDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaMoistureAbsorption;
class RWStepFEA_RWFeaMoistureAbsorption {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaMoistureAbsorption;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaMoistureAbsorption;
		 RWStepFEA_RWFeaMoistureAbsorption ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaMoistureAbsorption

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaMoistureAbsorption &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaMoistureAbsorption & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaMoistureAbsorption

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaMoistureAbsorption &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaMoistureAbsorption & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaMoistureAbsorption &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaMoistureAbsorption & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaMoistureAbsorption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaParametricPoint;
class RWStepFEA_RWFeaParametricPoint {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaParametricPoint;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaParametricPoint;
		 RWStepFEA_RWFeaParametricPoint ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaParametricPoint

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaParametricPoint &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaParametricPoint & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaParametricPoint

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaParametricPoint &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaParametricPoint & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaParametricPoint &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaParametricPoint & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaParametricPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaRepresentationItem;
class RWStepFEA_RWFeaRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaRepresentationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaRepresentationItem;
		 RWStepFEA_RWFeaRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaRepresentationItem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaRepresentationItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaRepresentationItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaRepresentationItem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaRepresentationItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaRepresentationItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaRepresentationItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaRepresentationItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
class RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaSecantCoefficientOfLinearThermalExpansion

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaSecantCoefficientOfLinearThermalExpansion

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaSecantCoefficientOfLinearThermalExpansion & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaSecantCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaShellBendingStiffness;
class RWStepFEA_RWFeaShellBendingStiffness {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellBendingStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaShellBendingStiffness;
		 RWStepFEA_RWFeaShellBendingStiffness ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaShellBendingStiffness

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellBendingStiffness &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaShellBendingStiffness & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaShellBendingStiffness

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellBendingStiffness &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaShellBendingStiffness & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaShellBendingStiffness &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaShellBendingStiffness & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaShellBendingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
class RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness;
		 RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaShellMembraneBendingCouplingStiffness

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaShellMembraneBendingCouplingStiffness

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaShellMembraneBendingCouplingStiffness & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaShellMembraneBendingCouplingStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaShellMembraneStiffness;
class RWStepFEA_RWFeaShellMembraneStiffness {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellMembraneStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaShellMembraneStiffness;
		 RWStepFEA_RWFeaShellMembraneStiffness ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaShellMembraneStiffness

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellMembraneStiffness &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaShellMembraneStiffness & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaShellMembraneStiffness

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellMembraneStiffness &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaShellMembraneStiffness & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaShellMembraneStiffness &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaShellMembraneStiffness & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaShellMembraneStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaShellShearStiffness;
class RWStepFEA_RWFeaShellShearStiffness {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaShellShearStiffness;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaShellShearStiffness;
		 RWStepFEA_RWFeaShellShearStiffness ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaShellShearStiffness

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellShearStiffness &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaShellShearStiffness & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaShellShearStiffness

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaShellShearStiffness &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaShellShearStiffness & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaShellShearStiffness &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaShellShearStiffness & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaShellShearStiffness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
class RWStepFEA_RWFeaSurfaceSectionGeometricRelationship {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaSurfaceSectionGeometricRelationship;
		 RWStepFEA_RWFeaSurfaceSectionGeometricRelationship ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaSurfaceSectionGeometricRelationship

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaSurfaceSectionGeometricRelationship &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaSurfaceSectionGeometricRelationship & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaSurfaceSectionGeometricRelationship

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaSurfaceSectionGeometricRelationship &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaSurfaceSectionGeometricRelationship & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaSurfaceSectionGeometricRelationship &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaSurfaceSectionGeometricRelationship & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaSurfaceSectionGeometricRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
class RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion;
		 RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FeaTangentialCoefficientOfLinearThermalExpansion

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FeaTangentialCoefficientOfLinearThermalExpansion

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FeaTangentialCoefficientOfLinearThermalExpansion & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFeaTangentialCoefficientOfLinearThermalExpansion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFreedomAndCoefficient;
class RWStepFEA_RWFreedomAndCoefficient {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFreedomAndCoefficient;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFreedomAndCoefficient;
		 RWStepFEA_RWFreedomAndCoefficient ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FreedomAndCoefficient

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FreedomAndCoefficient &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FreedomAndCoefficient & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FreedomAndCoefficient

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FreedomAndCoefficient &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FreedomAndCoefficient & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FreedomAndCoefficient &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FreedomAndCoefficient & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFreedomAndCoefficient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWFreedomsList;
class RWStepFEA_RWFreedomsList {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWFreedomsList;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWFreedomsList;
		 RWStepFEA_RWFreedomsList ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FreedomsList

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_FreedomsList &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_FreedomsList & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FreedomsList

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_FreedomsList &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_FreedomsList & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_FreedomsList &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_FreedomsList & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWFreedomsList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWGeometricNode;
class RWStepFEA_RWGeometricNode {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWGeometricNode;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWGeometricNode;
		 RWStepFEA_RWGeometricNode ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads GeometricNode

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_GeometricNode &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_GeometricNode & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes GeometricNode

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_GeometricNode &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_GeometricNode & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_GeometricNode &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_GeometricNode & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWGeometricNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNode;
class RWStepFEA_RWNode {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNode;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNode;
		 RWStepFEA_RWNode ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Node

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_Node &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_Node & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Node

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_Node &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_Node & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_Node &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_Node & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNodeDefinition;
class RWStepFEA_RWNodeDefinition {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNodeDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNodeDefinition;
		 RWStepFEA_RWNodeDefinition ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NodeDefinition

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_NodeDefinition &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_NodeDefinition & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NodeDefinition

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_NodeDefinition &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_NodeDefinition & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_NodeDefinition &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_NodeDefinition & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNodeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNodeGroup;
class RWStepFEA_RWNodeGroup {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNodeGroup;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNodeGroup;
		 RWStepFEA_RWNodeGroup ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NodeGroup

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_NodeGroup &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_NodeGroup & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NodeGroup

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_NodeGroup &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_NodeGroup & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_NodeGroup &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_NodeGroup & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNodeGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNodeRepresentation;
class RWStepFEA_RWNodeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNodeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNodeRepresentation;
		 RWStepFEA_RWNodeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NodeRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_NodeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NodeRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_NodeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_NodeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_NodeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_NodeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNodeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNodeSet;
class RWStepFEA_RWNodeSet {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNodeSet;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNodeSet;
		 RWStepFEA_RWNodeSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NodeSet

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_NodeSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_NodeSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NodeSet

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_NodeSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_NodeSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_NodeSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_NodeSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNodeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNodeWithSolutionCoordinateSystem;
class RWStepFEA_RWNodeWithSolutionCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNodeWithSolutionCoordinateSystem;
		 RWStepFEA_RWNodeWithSolutionCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NodeWithSolutionCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_NodeWithSolutionCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_NodeWithSolutionCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NodeWithSolutionCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_NodeWithSolutionCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_NodeWithSolutionCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_NodeWithSolutionCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_NodeWithSolutionCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNodeWithSolutionCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWNodeWithVector;
class RWStepFEA_RWNodeWithVector {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWNodeWithVector;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWNodeWithVector;
		 RWStepFEA_RWNodeWithVector ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NodeWithVector

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_NodeWithVector &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_NodeWithVector & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NodeWithVector

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_NodeWithVector &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_NodeWithVector & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_NodeWithVector &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_NodeWithVector & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWNodeWithVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
class RWStepFEA_RWParametricCurve3dElementCoordinateDirection {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWParametricCurve3dElementCoordinateDirection;
		 RWStepFEA_RWParametricCurve3dElementCoordinateDirection ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ParametricCurve3dElementCoordinateDirection

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ParametricCurve3dElementCoordinateDirection &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ParametricCurve3dElementCoordinateDirection

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ParametricCurve3dElementCoordinateDirection &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ParametricCurve3dElementCoordinateDirection &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ParametricCurve3dElementCoordinateDirection & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWParametricCurve3dElementCoordinateDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
class RWStepFEA_RWParametricCurve3dElementCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWParametricCurve3dElementCoordinateSystem;
		 RWStepFEA_RWParametricCurve3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ParametricCurve3dElementCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ParametricCurve3dElementCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ParametricCurve3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ParametricCurve3dElementCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ParametricCurve3dElementCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ParametricCurve3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ParametricCurve3dElementCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ParametricCurve3dElementCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWParametricCurve3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
class RWStepFEA_RWParametricSurface3dElementCoordinateSystem {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWParametricSurface3dElementCoordinateSystem;
		 RWStepFEA_RWParametricSurface3dElementCoordinateSystem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ParametricSurface3dElementCoordinateSystem

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_ParametricSurface3dElementCoordinateSystem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_ParametricSurface3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ParametricSurface3dElementCoordinateSystem

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_ParametricSurface3dElementCoordinateSystem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_ParametricSurface3dElementCoordinateSystem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_ParametricSurface3dElementCoordinateSystem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_ParametricSurface3dElementCoordinateSystem & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWParametricSurface3dElementCoordinateSystem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWSurface3dElementRepresentation;
class RWStepFEA_RWSurface3dElementRepresentation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWSurface3dElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWSurface3dElementRepresentation;
		 RWStepFEA_RWSurface3dElementRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Surface3dElementRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_Surface3dElementRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_Surface3dElementRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Surface3dElementRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_Surface3dElementRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_Surface3dElementRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_Surface3dElementRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_Surface3dElementRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWSurface3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepFEA_RWVolume3dElementRepresentation;
class RWStepFEA_RWVolume3dElementRepresentation {
	public:
		%feature("compactdefaultargs") RWStepFEA_RWVolume3dElementRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepFEA_RWVolume3dElementRepresentation;
		 RWStepFEA_RWVolume3dElementRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Volume3dElementRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepFEA_Volume3dElementRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepFEA_Volume3dElementRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Volume3dElementRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepFEA_Volume3dElementRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepFEA_Volume3dElementRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepFEA_Volume3dElementRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepFEA_Volume3dElementRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepFEA_RWVolume3dElementRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
