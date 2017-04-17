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
%module (package="OCC") RWStepShape

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


%include RWStepShape_headers.i


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

%nodefaultctor RWStepShape_RWAdvancedBrepShapeRepresentation;
class RWStepShape_RWAdvancedBrepShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWAdvancedBrepShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWAdvancedBrepShapeRepresentation;
		 RWStepShape_RWAdvancedBrepShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_AdvancedBrepShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_AdvancedBrepShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_AdvancedBrepShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_AdvancedBrepShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_AdvancedBrepShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_AdvancedBrepShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWAdvancedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWAdvancedFace;
class RWStepShape_RWAdvancedFace {
	public:
		%feature("compactdefaultargs") RWStepShape_RWAdvancedFace;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWAdvancedFace;
		 RWStepShape_RWAdvancedFace ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_AdvancedFace &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_AdvancedFace & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_AdvancedFace &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_AdvancedFace & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_AdvancedFace &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_AdvancedFace & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWAdvancedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWAngularLocation;
class RWStepShape_RWAngularLocation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWAngularLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWAngularLocation;
		 RWStepShape_RWAngularLocation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AngularLocation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_AngularLocation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_AngularLocation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AngularLocation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_AngularLocation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_AngularLocation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_AngularLocation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_AngularLocation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWAngularLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWAngularSize;
class RWStepShape_RWAngularSize {
	public:
		%feature("compactdefaultargs") RWStepShape_RWAngularSize;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWAngularSize;
		 RWStepShape_RWAngularSize ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads AngularSize

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_AngularSize &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_AngularSize & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes AngularSize

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_AngularSize &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_AngularSize & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_AngularSize &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_AngularSize & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWAngularSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWBlock;
class RWStepShape_RWBlock {
	public:
		%feature("compactdefaultargs") RWStepShape_RWBlock;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWBlock;
		 RWStepShape_RWBlock ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Block &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Block & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Block &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Block & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_Block &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Block & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWBooleanResult;
class RWStepShape_RWBooleanResult {
	public:
		%feature("compactdefaultargs") RWStepShape_RWBooleanResult;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWBooleanResult;
		 RWStepShape_RWBooleanResult ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_BooleanResult &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_BooleanResult & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_BooleanResult &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_BooleanResult & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_BooleanResult &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_BooleanResult & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWBooleanResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWBoxDomain;
class RWStepShape_RWBoxDomain {
	public:
		%feature("compactdefaultargs") RWStepShape_RWBoxDomain;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWBoxDomain;
		 RWStepShape_RWBoxDomain ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_BoxDomain &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_BoxDomain & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_BoxDomain &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_BoxDomain & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_BoxDomain &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_BoxDomain & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWBoxDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWBoxedHalfSpace;
class RWStepShape_RWBoxedHalfSpace {
	public:
		%feature("compactdefaultargs") RWStepShape_RWBoxedHalfSpace;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWBoxedHalfSpace;
		 RWStepShape_RWBoxedHalfSpace ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_BoxedHalfSpace &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_BoxedHalfSpace & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_BoxedHalfSpace &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_BoxedHalfSpace & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_BoxedHalfSpace &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_BoxedHalfSpace & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWBoxedHalfSpace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWBrepWithVoids;
class RWStepShape_RWBrepWithVoids {
	public:
		%feature("compactdefaultargs") RWStepShape_RWBrepWithVoids;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWBrepWithVoids;
		 RWStepShape_RWBrepWithVoids ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_BrepWithVoids &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_BrepWithVoids & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_BrepWithVoids &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_BrepWithVoids & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_BrepWithVoids &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_BrepWithVoids & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_BrepWithVoids &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") Check;
		void Check (const Handle_StepShape_BrepWithVoids & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
};


%extend RWStepShape_RWBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWClosedShell;
class RWStepShape_RWClosedShell {
	public:
		%feature("compactdefaultargs") RWStepShape_RWClosedShell;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWClosedShell;
		 RWStepShape_RWClosedShell ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ClosedShell &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ClosedShell & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ClosedShell &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ClosedShell & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ClosedShell &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ClosedShell & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWCompoundShapeRepresentation;
class RWStepShape_RWCompoundShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWCompoundShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWCompoundShapeRepresentation;
		 RWStepShape_RWCompoundShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads CompoundShapeRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_CompoundShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_CompoundShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes CompoundShapeRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_CompoundShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_CompoundShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_CompoundShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_CompoundShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWCompoundShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWConnectedEdgeSet;
class RWStepShape_RWConnectedEdgeSet {
	public:
		%feature("compactdefaultargs") RWStepShape_RWConnectedEdgeSet;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWConnectedEdgeSet;
		 RWStepShape_RWConnectedEdgeSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConnectedEdgeSet

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ConnectedEdgeSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConnectedEdgeSet

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ConnectedEdgeSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ConnectedEdgeSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_ConnectedEdgeSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ConnectedEdgeSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWConnectedEdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWConnectedFaceSet;
class RWStepShape_RWConnectedFaceSet {
	public:
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceSet;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWConnectedFaceSet;
		 RWStepShape_RWConnectedFaceSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ConnectedFaceSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ConnectedFaceSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ConnectedFaceSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWConnectedFaceSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWConnectedFaceShapeRepresentation;
class RWStepShape_RWConnectedFaceShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWConnectedFaceShapeRepresentation;
		 RWStepShape_RWConnectedFaceShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConnectedFaceShapeRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ConnectedFaceShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConnectedFaceShapeRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ConnectedFaceShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ConnectedFaceShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWConnectedFaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWConnectedFaceSubSet;
class RWStepShape_RWConnectedFaceSubSet {
	public:
		%feature("compactdefaultargs") RWStepShape_RWConnectedFaceSubSet;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWConnectedFaceSubSet;
		 RWStepShape_RWConnectedFaceSubSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ConnectedFaceSubSet

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceSubSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ConnectedFaceSubSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ConnectedFaceSubSet

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceSubSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ConnectedFaceSubSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_ConnectedFaceSubSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ConnectedFaceSubSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWConnectedFaceSubSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWContextDependentShapeRepresentation;
class RWStepShape_RWContextDependentShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWContextDependentShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWContextDependentShapeRepresentation;
		 RWStepShape_RWContextDependentShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ContextDependentShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ContextDependentShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ContextDependentShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ContextDependentShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ContextDependentShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ContextDependentShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWContextDependentShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWCsgShapeRepresentation;
class RWStepShape_RWCsgShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWCsgShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWCsgShapeRepresentation;
		 RWStepShape_RWCsgShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_CsgShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_CsgShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_CsgShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_CsgShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_CsgShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_CsgShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWCsgShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWCsgSolid;
class RWStepShape_RWCsgSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWCsgSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWCsgSolid;
		 RWStepShape_RWCsgSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_CsgSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_CsgSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_CsgSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_CsgSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_CsgSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_CsgSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWCsgSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
class RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation;
		 RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_DefinitionalRepresentationAndShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWDefinitionalRepresentationAndShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWDimensionalCharacteristicRepresentation;
class RWStepShape_RWDimensionalCharacteristicRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWDimensionalCharacteristicRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWDimensionalCharacteristicRepresentation;
		 RWStepShape_RWDimensionalCharacteristicRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DimensionalCharacteristicRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_DimensionalCharacteristicRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_DimensionalCharacteristicRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DimensionalCharacteristicRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_DimensionalCharacteristicRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_DimensionalCharacteristicRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_DimensionalCharacteristicRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_DimensionalCharacteristicRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWDimensionalCharacteristicRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWDimensionalLocation;
class RWStepShape_RWDimensionalLocation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWDimensionalLocation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWDimensionalLocation;
		 RWStepShape_RWDimensionalLocation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DimensionalLocation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_DimensionalLocation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_DimensionalLocation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DimensionalLocation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_DimensionalLocation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_DimensionalLocation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_DimensionalLocation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_DimensionalLocation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWDimensionalLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWDimensionalLocationWithPath;
class RWStepShape_RWDimensionalLocationWithPath {
	public:
		%feature("compactdefaultargs") RWStepShape_RWDimensionalLocationWithPath;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWDimensionalLocationWithPath;
		 RWStepShape_RWDimensionalLocationWithPath ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DimensionalLocationWithPath

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_DimensionalLocationWithPath &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_DimensionalLocationWithPath & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DimensionalLocationWithPath

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_DimensionalLocationWithPath &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_DimensionalLocationWithPath & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_DimensionalLocationWithPath &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_DimensionalLocationWithPath & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWDimensionalLocationWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWDimensionalSize;
class RWStepShape_RWDimensionalSize {
	public:
		%feature("compactdefaultargs") RWStepShape_RWDimensionalSize;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWDimensionalSize;
		 RWStepShape_RWDimensionalSize ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DimensionalSize

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_DimensionalSize &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_DimensionalSize & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DimensionalSize

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_DimensionalSize &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_DimensionalSize & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_DimensionalSize &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_DimensionalSize & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWDimensionalSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWDimensionalSizeWithPath;
class RWStepShape_RWDimensionalSizeWithPath {
	public:
		%feature("compactdefaultargs") RWStepShape_RWDimensionalSizeWithPath;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWDimensionalSizeWithPath;
		 RWStepShape_RWDimensionalSizeWithPath ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DimensionalSizeWithPath

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_DimensionalSizeWithPath &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_DimensionalSizeWithPath & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DimensionalSizeWithPath

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_DimensionalSizeWithPath &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_DimensionalSizeWithPath & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_DimensionalSizeWithPath &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_DimensionalSizeWithPath & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWDimensionalSizeWithPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWEdge;
class RWStepShape_RWEdge {
	public:
		%feature("compactdefaultargs") RWStepShape_RWEdge;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWEdge;
		 RWStepShape_RWEdge ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Edge &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Edge & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Edge &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Edge & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_Edge &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Edge & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWEdgeBasedWireframeModel;
class RWStepShape_RWEdgeBasedWireframeModel {
	public:
		%feature("compactdefaultargs") RWStepShape_RWEdgeBasedWireframeModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWEdgeBasedWireframeModel;
		 RWStepShape_RWEdgeBasedWireframeModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads EdgeBasedWireframeModel

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_EdgeBasedWireframeModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_EdgeBasedWireframeModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes EdgeBasedWireframeModel

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_EdgeBasedWireframeModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_EdgeBasedWireframeModel & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_EdgeBasedWireframeModel &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_EdgeBasedWireframeModel & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWEdgeBasedWireframeModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
class RWStepShape_RWEdgeBasedWireframeShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWEdgeBasedWireframeShapeRepresentation;
		 RWStepShape_RWEdgeBasedWireframeShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads EdgeBasedWireframeShapeRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_EdgeBasedWireframeShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_EdgeBasedWireframeShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes EdgeBasedWireframeShapeRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_EdgeBasedWireframeShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_EdgeBasedWireframeShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_EdgeBasedWireframeShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_EdgeBasedWireframeShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWEdgeBasedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWEdgeCurve;
class RWStepShape_RWEdgeCurve {
	public:
		%feature("compactdefaultargs") RWStepShape_RWEdgeCurve;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWEdgeCurve;
		 RWStepShape_RWEdgeCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_EdgeCurve &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_EdgeCurve & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_EdgeCurve &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_EdgeCurve & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_EdgeCurve &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_EdgeCurve & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_EdgeCurve &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") Check;
		void Check (const Handle_StepShape_EdgeCurve & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
};


%extend RWStepShape_RWEdgeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWEdgeLoop;
class RWStepShape_RWEdgeLoop {
	public:
		%feature("compactdefaultargs") RWStepShape_RWEdgeLoop;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWEdgeLoop;
		 RWStepShape_RWEdgeLoop ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_EdgeLoop &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_EdgeLoop & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_EdgeLoop &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_EdgeLoop & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_EdgeLoop &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_EdgeLoop & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_EdgeLoop &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") Check;
		void Check (const Handle_StepShape_EdgeLoop & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
};


%extend RWStepShape_RWEdgeLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWExtrudedAreaSolid;
class RWStepShape_RWExtrudedAreaSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWExtrudedAreaSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWExtrudedAreaSolid;
		 RWStepShape_RWExtrudedAreaSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ExtrudedAreaSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ExtrudedAreaSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ExtrudedAreaSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ExtrudedAreaSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ExtrudedAreaSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ExtrudedAreaSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWExtrudedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWExtrudedFaceSolid;
class RWStepShape_RWExtrudedFaceSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWExtrudedFaceSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWExtrudedFaceSolid;
		 RWStepShape_RWExtrudedFaceSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ExtrudedFaceSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ExtrudedFaceSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ExtrudedFaceSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ExtrudedFaceSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ExtrudedFaceSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ExtrudedFaceSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWExtrudedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFace;
class RWStepShape_RWFace {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFace;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFace;
		 RWStepShape_RWFace ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Face &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Face & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Face &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Face & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_Face &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Face & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFaceBasedSurfaceModel;
class RWStepShape_RWFaceBasedSurfaceModel {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFaceBasedSurfaceModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWFaceBasedSurfaceModel;
		 RWStepShape_RWFaceBasedSurfaceModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads FaceBasedSurfaceModel

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FaceBasedSurfaceModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FaceBasedSurfaceModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes FaceBasedSurfaceModel

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FaceBasedSurfaceModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FaceBasedSurfaceModel & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_FaceBasedSurfaceModel &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FaceBasedSurfaceModel & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFaceBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFaceBound;
class RWStepShape_RWFaceBound {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFaceBound;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFaceBound;
		 RWStepShape_RWFaceBound ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FaceBound &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FaceBound & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FaceBound &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FaceBound & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FaceBound &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FaceBound & ent,Interface_EntityIterator & iter);
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FaceBound &
	:param shares:
	:type shares: Interface_ShareTool &
	:param ach:
	:type ach: Handle_Interface_Check &
	:rtype: None
") Check;
		void Check (const Handle_StepShape_FaceBound & ent,const Interface_ShareTool & shares,Handle_Interface_Check & ach);
};


%extend RWStepShape_RWFaceBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFaceOuterBound;
class RWStepShape_RWFaceOuterBound {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFaceOuterBound;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFaceOuterBound;
		 RWStepShape_RWFaceOuterBound ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FaceOuterBound &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FaceOuterBound & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FaceOuterBound &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FaceOuterBound & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FaceOuterBound &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FaceOuterBound & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFaceOuterBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFaceSurface;
class RWStepShape_RWFaceSurface {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFaceSurface;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFaceSurface;
		 RWStepShape_RWFaceSurface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FaceSurface &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FaceSurface & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FaceSurface &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FaceSurface & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FaceSurface &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FaceSurface & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFacetedBrep;
class RWStepShape_RWFacetedBrep {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrep;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFacetedBrep;
		 RWStepShape_RWFacetedBrep ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FacetedBrep &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FacetedBrep & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FacetedBrep &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FacetedBrep & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FacetedBrep &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FacetedBrep & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFacetedBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFacetedBrepAndBrepWithVoids;
class RWStepShape_RWFacetedBrepAndBrepWithVoids {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrepAndBrepWithVoids;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFacetedBrepAndBrepWithVoids;
		 RWStepShape_RWFacetedBrepAndBrepWithVoids ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FacetedBrepAndBrepWithVoids &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FacetedBrepAndBrepWithVoids & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FacetedBrepAndBrepWithVoids &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FacetedBrepAndBrepWithVoids & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FacetedBrepAndBrepWithVoids &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FacetedBrepAndBrepWithVoids & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFacetedBrepAndBrepWithVoids {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWFacetedBrepShapeRepresentation;
class RWStepShape_RWFacetedBrepShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWFacetedBrepShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWFacetedBrepShapeRepresentation;
		 RWStepShape_RWFacetedBrepShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_FacetedBrepShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_FacetedBrepShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_FacetedBrepShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_FacetedBrepShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_FacetedBrepShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_FacetedBrepShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWFacetedBrepShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWGeometricCurveSet;
class RWStepShape_RWGeometricCurveSet {
	public:
		%feature("compactdefaultargs") RWStepShape_RWGeometricCurveSet;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWGeometricCurveSet;
		 RWStepShape_RWGeometricCurveSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_GeometricCurveSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_GeometricCurveSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_GeometricCurveSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_GeometricCurveSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_GeometricCurveSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_GeometricCurveSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWGeometricCurveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWGeometricSet;
class RWStepShape_RWGeometricSet {
	public:
		%feature("compactdefaultargs") RWStepShape_RWGeometricSet;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWGeometricSet;
		 RWStepShape_RWGeometricSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_GeometricSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_GeometricSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_GeometricSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_GeometricSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_GeometricSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_GeometricSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWGeometricSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
class RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation;
		 RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_GeometricallyBoundedSurfaceShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWGeometricallyBoundedSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
class RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation;
		 RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_GeometricallyBoundedWireframeShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWGeometricallyBoundedWireframeShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWHalfSpaceSolid;
class RWStepShape_RWHalfSpaceSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWHalfSpaceSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWHalfSpaceSolid;
		 RWStepShape_RWHalfSpaceSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_HalfSpaceSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_HalfSpaceSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_HalfSpaceSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_HalfSpaceSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_HalfSpaceSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_HalfSpaceSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWHalfSpaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWLimitsAndFits;
class RWStepShape_RWLimitsAndFits {
	public:
		%feature("compactdefaultargs") RWStepShape_RWLimitsAndFits;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWLimitsAndFits;
		 RWStepShape_RWLimitsAndFits ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_LimitsAndFits &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_LimitsAndFits & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_LimitsAndFits &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_LimitsAndFits & ent);
};


%extend RWStepShape_RWLimitsAndFits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWLoop;
class RWStepShape_RWLoop {
	public:
		%feature("compactdefaultargs") RWStepShape_RWLoop;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWLoop;
		 RWStepShape_RWLoop ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Loop &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Loop & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Loop &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Loop & ent);
};


%extend RWStepShape_RWLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWLoopAndPath;
class RWStepShape_RWLoopAndPath {
	public:
		%feature("compactdefaultargs") RWStepShape_RWLoopAndPath;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWLoopAndPath;
		 RWStepShape_RWLoopAndPath ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_LoopAndPath &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_LoopAndPath & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_LoopAndPath &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_LoopAndPath & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_LoopAndPath &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_LoopAndPath & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWLoopAndPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWManifoldSolidBrep;
class RWStepShape_RWManifoldSolidBrep {
	public:
		%feature("compactdefaultargs") RWStepShape_RWManifoldSolidBrep;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWManifoldSolidBrep;
		 RWStepShape_RWManifoldSolidBrep ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ManifoldSolidBrep &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ManifoldSolidBrep & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ManifoldSolidBrep &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ManifoldSolidBrep & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ManifoldSolidBrep &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ManifoldSolidBrep & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWManifoldSolidBrep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWManifoldSurfaceShapeRepresentation;
class RWStepShape_RWManifoldSurfaceShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWManifoldSurfaceShapeRepresentation;
		 RWStepShape_RWManifoldSurfaceShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ManifoldSurfaceShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ManifoldSurfaceShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ManifoldSurfaceShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ManifoldSurfaceShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ManifoldSurfaceShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ManifoldSurfaceShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWMeasureQualification;
class RWStepShape_RWMeasureQualification {
	public:
		%feature("compactdefaultargs") RWStepShape_RWMeasureQualification;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWMeasureQualification;
		 RWStepShape_RWMeasureQualification ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_MeasureQualification &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_MeasureQualification & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_MeasureQualification &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_MeasureQualification & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_MeasureQualification &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_MeasureQualification & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWMeasureQualification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
class RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem;
		 RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_MeasureRepresentationItemAndQualifiedRepresentationItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWMeasureRepresentationItemAndQualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
class RWStepShape_RWNonManifoldSurfaceShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWNonManifoldSurfaceShapeRepresentation;
		 RWStepShape_RWNonManifoldSurfaceShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads NonManifoldSurfaceShapeRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_NonManifoldSurfaceShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_NonManifoldSurfaceShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes NonManifoldSurfaceShapeRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_NonManifoldSurfaceShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_NonManifoldSurfaceShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_NonManifoldSurfaceShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_NonManifoldSurfaceShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWNonManifoldSurfaceShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWOpenShell;
class RWStepShape_RWOpenShell {
	public:
		%feature("compactdefaultargs") RWStepShape_RWOpenShell;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWOpenShell;
		 RWStepShape_RWOpenShell ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_OpenShell &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_OpenShell & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_OpenShell &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_OpenShell & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_OpenShell &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_OpenShell & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWOpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWOrientedClosedShell;
class RWStepShape_RWOrientedClosedShell {
	public:
		%feature("compactdefaultargs") RWStepShape_RWOrientedClosedShell;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWOrientedClosedShell;
		 RWStepShape_RWOrientedClosedShell ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_OrientedClosedShell & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_OrientedClosedShell &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_OrientedClosedShell & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_OrientedClosedShell &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_OrientedClosedShell & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWOrientedClosedShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWOrientedEdge;
class RWStepShape_RWOrientedEdge {
	public:
		%feature("compactdefaultargs") RWStepShape_RWOrientedEdge;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWOrientedEdge;
		 RWStepShape_RWOrientedEdge ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_OrientedEdge &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_OrientedEdge & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_OrientedEdge &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_OrientedEdge & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_OrientedEdge &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_OrientedEdge & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWOrientedEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWOrientedFace;
class RWStepShape_RWOrientedFace {
	public:
		%feature("compactdefaultargs") RWStepShape_RWOrientedFace;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWOrientedFace;
		 RWStepShape_RWOrientedFace ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_OrientedFace &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_OrientedFace & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_OrientedFace &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_OrientedFace & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_OrientedFace &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_OrientedFace & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWOrientedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWOrientedOpenShell;
class RWStepShape_RWOrientedOpenShell {
	public:
		%feature("compactdefaultargs") RWStepShape_RWOrientedOpenShell;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWOrientedOpenShell;
		 RWStepShape_RWOrientedOpenShell ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_OrientedOpenShell &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_OrientedOpenShell & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_OrientedOpenShell &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_OrientedOpenShell & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_OrientedOpenShell &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_OrientedOpenShell & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWOrientedOpenShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWOrientedPath;
class RWStepShape_RWOrientedPath {
	public:
		%feature("compactdefaultargs") RWStepShape_RWOrientedPath;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWOrientedPath;
		 RWStepShape_RWOrientedPath ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_OrientedPath &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_OrientedPath & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_OrientedPath &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_OrientedPath & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_OrientedPath &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_OrientedPath & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWOrientedPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWPath;
class RWStepShape_RWPath {
	public:
		%feature("compactdefaultargs") RWStepShape_RWPath;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWPath;
		 RWStepShape_RWPath ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Path &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Path & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Path &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Path & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_Path &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Path & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWPath {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWPlusMinusTolerance;
class RWStepShape_RWPlusMinusTolerance {
	public:
		%feature("compactdefaultargs") RWStepShape_RWPlusMinusTolerance;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWPlusMinusTolerance;
		 RWStepShape_RWPlusMinusTolerance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_PlusMinusTolerance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_PlusMinusTolerance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_PlusMinusTolerance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_PlusMinusTolerance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_PlusMinusTolerance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_PlusMinusTolerance & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWPlusMinusTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWPointRepresentation;
class RWStepShape_RWPointRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWPointRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWPointRepresentation;
		 RWStepShape_RWPointRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads PointRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_PointRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_PointRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes PointRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_PointRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_PointRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_PointRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_PointRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWPointRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWPolyLoop;
class RWStepShape_RWPolyLoop {
	public:
		%feature("compactdefaultargs") RWStepShape_RWPolyLoop;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWPolyLoop;
		 RWStepShape_RWPolyLoop ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_PolyLoop &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_PolyLoop & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_PolyLoop &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_PolyLoop & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_PolyLoop &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_PolyLoop & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWPolyLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWPrecisionQualifier;
class RWStepShape_RWPrecisionQualifier {
	public:
		%feature("compactdefaultargs") RWStepShape_RWPrecisionQualifier;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWPrecisionQualifier;
		 RWStepShape_RWPrecisionQualifier ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_PrecisionQualifier &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_PrecisionQualifier & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_PrecisionQualifier &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_PrecisionQualifier & ent);
};


%extend RWStepShape_RWPrecisionQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWQualifiedRepresentationItem;
class RWStepShape_RWQualifiedRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepShape_RWQualifiedRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWQualifiedRepresentationItem;
		 RWStepShape_RWQualifiedRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_QualifiedRepresentationItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_QualifiedRepresentationItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_QualifiedRepresentationItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_QualifiedRepresentationItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_QualifiedRepresentationItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_QualifiedRepresentationItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWQualifiedRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWRevolvedAreaSolid;
class RWStepShape_RWRevolvedAreaSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWRevolvedAreaSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWRevolvedAreaSolid;
		 RWStepShape_RWRevolvedAreaSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_RevolvedAreaSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_RevolvedAreaSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_RevolvedAreaSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_RevolvedAreaSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_RevolvedAreaSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_RevolvedAreaSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWRevolvedAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWRevolvedFaceSolid;
class RWStepShape_RWRevolvedFaceSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWRevolvedFaceSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWRevolvedFaceSolid;
		 RWStepShape_RWRevolvedFaceSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_RevolvedFaceSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_RevolvedFaceSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_RevolvedFaceSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_RevolvedFaceSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_RevolvedFaceSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_RevolvedFaceSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWRevolvedFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWRightAngularWedge;
class RWStepShape_RWRightAngularWedge {
	public:
		%feature("compactdefaultargs") RWStepShape_RWRightAngularWedge;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWRightAngularWedge;
		 RWStepShape_RWRightAngularWedge ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_RightAngularWedge &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_RightAngularWedge & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_RightAngularWedge &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_RightAngularWedge & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_RightAngularWedge &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_RightAngularWedge & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWRightAngularWedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWRightCircularCone;
class RWStepShape_RWRightCircularCone {
	public:
		%feature("compactdefaultargs") RWStepShape_RWRightCircularCone;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWRightCircularCone;
		 RWStepShape_RWRightCircularCone ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_RightCircularCone &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_RightCircularCone & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_RightCircularCone &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_RightCircularCone & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_RightCircularCone &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_RightCircularCone & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWRightCircularCone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWRightCircularCylinder;
class RWStepShape_RWRightCircularCylinder {
	public:
		%feature("compactdefaultargs") RWStepShape_RWRightCircularCylinder;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWRightCircularCylinder;
		 RWStepShape_RWRightCircularCylinder ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_RightCircularCylinder &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_RightCircularCylinder & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_RightCircularCylinder &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_RightCircularCylinder & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_RightCircularCylinder &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_RightCircularCylinder & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWRightCircularCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSeamEdge;
class RWStepShape_RWSeamEdge {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSeamEdge;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWSeamEdge;
		 RWStepShape_RWSeamEdge ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads SeamEdge

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_SeamEdge &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_SeamEdge & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes SeamEdge

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_SeamEdge &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_SeamEdge & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_SeamEdge &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_SeamEdge & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSeamEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWShapeDefinitionRepresentation;
class RWStepShape_RWShapeDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWShapeDefinitionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWShapeDefinitionRepresentation;
		 RWStepShape_RWShapeDefinitionRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeDefinitionRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ShapeDefinitionRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ShapeDefinitionRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeDefinitionRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ShapeDefinitionRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ShapeDefinitionRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_ShapeDefinitionRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ShapeDefinitionRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWShapeDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWShapeDimensionRepresentation;
class RWStepShape_RWShapeDimensionRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWShapeDimensionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWShapeDimensionRepresentation;
		 RWStepShape_RWShapeDimensionRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeDimensionRepresentation

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ShapeDimensionRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ShapeDimensionRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeDimensionRepresentation

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ShapeDimensionRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ShapeDimensionRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_ShapeDimensionRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ShapeDimensionRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWShapeDimensionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWShapeRepresentation;
class RWStepShape_RWShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWShapeRepresentation;
		 RWStepShape_RWShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWShapeRepresentationWithParameters;
class RWStepShape_RWShapeRepresentationWithParameters {
	public:
		%feature("compactdefaultargs") RWStepShape_RWShapeRepresentationWithParameters;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWShapeRepresentationWithParameters;
		 RWStepShape_RWShapeRepresentationWithParameters ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ShapeRepresentationWithParameters

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ShapeRepresentationWithParameters &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ShapeRepresentationWithParameters & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ShapeRepresentationWithParameters

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ShapeRepresentationWithParameters &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ShapeRepresentationWithParameters & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_ShapeRepresentationWithParameters &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ShapeRepresentationWithParameters & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWShapeRepresentationWithParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWShellBasedSurfaceModel;
class RWStepShape_RWShellBasedSurfaceModel {
	public:
		%feature("compactdefaultargs") RWStepShape_RWShellBasedSurfaceModel;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWShellBasedSurfaceModel;
		 RWStepShape_RWShellBasedSurfaceModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ShellBasedSurfaceModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ShellBasedSurfaceModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ShellBasedSurfaceModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ShellBasedSurfaceModel & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ShellBasedSurfaceModel &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ShellBasedSurfaceModel & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWShellBasedSurfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSolidModel;
class RWStepShape_RWSolidModel {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSolidModel;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWSolidModel;
		 RWStepShape_RWSolidModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_SolidModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_SolidModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_SolidModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_SolidModel & ent);
};


%extend RWStepShape_RWSolidModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSolidReplica;
class RWStepShape_RWSolidReplica {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSolidReplica;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWSolidReplica;
		 RWStepShape_RWSolidReplica ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_SolidReplica &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_SolidReplica & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_SolidReplica &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_SolidReplica & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_SolidReplica &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_SolidReplica & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSolidReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSphere;
class RWStepShape_RWSphere {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSphere;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWSphere;
		 RWStepShape_RWSphere ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Sphere &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Sphere & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Sphere &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Sphere & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_Sphere &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Sphere & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSubedge;
class RWStepShape_RWSubedge {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSubedge;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWSubedge;
		 RWStepShape_RWSubedge ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Subedge

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Subedge &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Subedge & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Subedge

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Subedge &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Subedge & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_Subedge &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Subedge & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSubedge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSubface;
class RWStepShape_RWSubface {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSubface;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepShape_RWSubface;
		 RWStepShape_RWSubface ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads Subface

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Subface &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Subface & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes Subface

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Subface &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Subface & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepShape_Subface &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Subface & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSubface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSweptAreaSolid;
class RWStepShape_RWSweptAreaSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSweptAreaSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWSweptAreaSolid;
		 RWStepShape_RWSweptAreaSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_SweptAreaSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_SweptAreaSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_SweptAreaSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_SweptAreaSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_SweptAreaSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_SweptAreaSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSweptAreaSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWSweptFaceSolid;
class RWStepShape_RWSweptFaceSolid {
	public:
		%feature("compactdefaultargs") RWStepShape_RWSweptFaceSolid;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWSweptFaceSolid;
		 RWStepShape_RWSweptFaceSolid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_SweptFaceSolid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_SweptFaceSolid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_SweptFaceSolid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_SweptFaceSolid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_SweptFaceSolid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_SweptFaceSolid & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWSweptFaceSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWToleranceValue;
class RWStepShape_RWToleranceValue {
	public:
		%feature("compactdefaultargs") RWStepShape_RWToleranceValue;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWToleranceValue;
		 RWStepShape_RWToleranceValue ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_ToleranceValue &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_ToleranceValue & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_ToleranceValue &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_ToleranceValue & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_ToleranceValue &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_ToleranceValue & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWToleranceValue {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWTopologicalRepresentationItem;
class RWStepShape_RWTopologicalRepresentationItem {
	public:
		%feature("compactdefaultargs") RWStepShape_RWTopologicalRepresentationItem;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWTopologicalRepresentationItem;
		 RWStepShape_RWTopologicalRepresentationItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_TopologicalRepresentationItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_TopologicalRepresentationItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_TopologicalRepresentationItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_TopologicalRepresentationItem & ent);
};


%extend RWStepShape_RWTopologicalRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWTorus;
class RWStepShape_RWTorus {
	public:
		%feature("compactdefaultargs") RWStepShape_RWTorus;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWTorus;
		 RWStepShape_RWTorus ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Torus &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Torus & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Torus &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Torus & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_Torus &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_Torus & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWTorus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWTransitionalShapeRepresentation;
class RWStepShape_RWTransitionalShapeRepresentation {
	public:
		%feature("compactdefaultargs") RWStepShape_RWTransitionalShapeRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWTransitionalShapeRepresentation;
		 RWStepShape_RWTransitionalShapeRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_TransitionalShapeRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_TransitionalShapeRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_TransitionalShapeRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_TransitionalShapeRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_TransitionalShapeRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_TransitionalShapeRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWTransitionalShapeRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWTypeQualifier;
class RWStepShape_RWTypeQualifier {
	public:
		%feature("compactdefaultargs") RWStepShape_RWTypeQualifier;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWTypeQualifier;
		 RWStepShape_RWTypeQualifier ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_TypeQualifier &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_TypeQualifier & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_TypeQualifier &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_TypeQualifier & ent);
};


%extend RWStepShape_RWTypeQualifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWVertex;
class RWStepShape_RWVertex {
	public:
		%feature("compactdefaultargs") RWStepShape_RWVertex;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWVertex;
		 RWStepShape_RWVertex ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_Vertex &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_Vertex & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_Vertex &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_Vertex & ent);
};


%extend RWStepShape_RWVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWVertexLoop;
class RWStepShape_RWVertexLoop {
	public:
		%feature("compactdefaultargs") RWStepShape_RWVertexLoop;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWVertexLoop;
		 RWStepShape_RWVertexLoop ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_VertexLoop &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_VertexLoop & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_VertexLoop &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_VertexLoop & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_VertexLoop &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_VertexLoop & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWVertexLoop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepShape_RWVertexPoint;
class RWStepShape_RWVertexPoint {
	public:
		%feature("compactdefaultargs") RWStepShape_RWVertexPoint;
		%feature("autodoc", "	:rtype: None
") RWStepShape_RWVertexPoint;
		 RWStepShape_RWVertexPoint ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepShape_VertexPoint &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepShape_VertexPoint & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepShape_VertexPoint &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepShape_VertexPoint & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepShape_VertexPoint &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepShape_VertexPoint & ent,Interface_EntityIterator & iter);
};


%extend RWStepShape_RWVertexPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
