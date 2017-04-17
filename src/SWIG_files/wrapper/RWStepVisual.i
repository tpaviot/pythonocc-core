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
%module (package="OCC") RWStepVisual

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


%include RWStepVisual_headers.i


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

%nodefaultctor RWStepVisual_RWAreaInSet;
class RWStepVisual_RWAreaInSet {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWAreaInSet;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWAreaInSet;
		 RWStepVisual_RWAreaInSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_AreaInSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_AreaInSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_AreaInSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_AreaInSet & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_AreaInSet &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_AreaInSet & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWAreaInSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWBackgroundColour;
class RWStepVisual_RWBackgroundColour {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWBackgroundColour;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWBackgroundColour;
		 RWStepVisual_RWBackgroundColour ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_BackgroundColour &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_BackgroundColour & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_BackgroundColour &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_BackgroundColour & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_BackgroundColour &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_BackgroundColour & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWBackgroundColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCameraImage;
class RWStepVisual_RWCameraImage {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCameraImage;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCameraImage;
		 RWStepVisual_RWCameraImage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CameraImage &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CameraImage & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CameraImage &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CameraImage & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CameraImage &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CameraImage & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCameraImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCameraModel;
class RWStepVisual_RWCameraModel {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCameraModel;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCameraModel;
		 RWStepVisual_RWCameraModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CameraModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CameraModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CameraModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CameraModel & ent);
};


%extend RWStepVisual_RWCameraModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCameraModelD2;
class RWStepVisual_RWCameraModelD2 {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD2;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCameraModelD2;
		 RWStepVisual_RWCameraModelD2 ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CameraModelD2 &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CameraModelD2 & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CameraModelD2 &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CameraModelD2 & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CameraModelD2 &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CameraModelD2 & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCameraModelD2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCameraModelD3;
class RWStepVisual_RWCameraModelD3 {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCameraModelD3;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCameraModelD3;
		 RWStepVisual_RWCameraModelD3 ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CameraModelD3 &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CameraModelD3 & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CameraModelD3 &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CameraModelD3 & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CameraModelD3 &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CameraModelD3 & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCameraModelD3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCameraUsage;
class RWStepVisual_RWCameraUsage {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCameraUsage;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCameraUsage;
		 RWStepVisual_RWCameraUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CameraUsage &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CameraUsage & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CameraUsage &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CameraUsage & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CameraUsage &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CameraUsage & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCameraUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWColour;
class RWStepVisual_RWColour {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWColour;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWColour;
		 RWStepVisual_RWColour ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_Colour &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_Colour & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_Colour &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_Colour & ent);
};


%extend RWStepVisual_RWColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWColourRgb;
class RWStepVisual_RWColourRgb {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWColourRgb;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWColourRgb;
		 RWStepVisual_RWColourRgb ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_ColourRgb &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_ColourRgb & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_ColourRgb &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_ColourRgb & ent);
};


%extend RWStepVisual_RWColourRgb {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWColourSpecification;
class RWStepVisual_RWColourSpecification {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWColourSpecification;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWColourSpecification;
		 RWStepVisual_RWColourSpecification ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_ColourSpecification &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_ColourSpecification & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_ColourSpecification &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_ColourSpecification & ent);
};


%extend RWStepVisual_RWColourSpecification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCompositeText;
class RWStepVisual_RWCompositeText {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCompositeText;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCompositeText;
		 RWStepVisual_RWCompositeText ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CompositeText &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CompositeText & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CompositeText &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CompositeText & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CompositeText &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CompositeText & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCompositeText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCompositeTextWithExtent;
class RWStepVisual_RWCompositeTextWithExtent {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCompositeTextWithExtent;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCompositeTextWithExtent;
		 RWStepVisual_RWCompositeTextWithExtent ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CompositeTextWithExtent &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CompositeTextWithExtent & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CompositeTextWithExtent &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CompositeTextWithExtent & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CompositeTextWithExtent &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CompositeTextWithExtent & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCompositeTextWithExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWContextDependentInvisibility;
class RWStepVisual_RWContextDependentInvisibility {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWContextDependentInvisibility;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWContextDependentInvisibility;
		 RWStepVisual_RWContextDependentInvisibility ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_ContextDependentInvisibility &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_ContextDependentInvisibility & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_ContextDependentInvisibility &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_ContextDependentInvisibility & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_ContextDependentInvisibility &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_ContextDependentInvisibility & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWContextDependentInvisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWContextDependentOverRidingStyledItem;
class RWStepVisual_RWContextDependentOverRidingStyledItem {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWContextDependentOverRidingStyledItem;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWContextDependentOverRidingStyledItem;
		 RWStepVisual_RWContextDependentOverRidingStyledItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_ContextDependentOverRidingStyledItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_ContextDependentOverRidingStyledItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_ContextDependentOverRidingStyledItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_ContextDependentOverRidingStyledItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_ContextDependentOverRidingStyledItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_ContextDependentOverRidingStyledItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWContextDependentOverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCurveStyle;
class RWStepVisual_RWCurveStyle {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCurveStyle;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCurveStyle;
		 RWStepVisual_RWCurveStyle ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CurveStyle &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CurveStyle & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CurveStyle &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CurveStyle & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CurveStyle &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CurveStyle & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCurveStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCurveStyleFont;
class RWStepVisual_RWCurveStyleFont {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCurveStyleFont;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCurveStyleFont;
		 RWStepVisual_RWCurveStyleFont ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CurveStyleFont &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CurveStyleFont & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CurveStyleFont &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CurveStyleFont & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_CurveStyleFont &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_CurveStyleFont & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWCurveStyleFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWCurveStyleFontPattern;
class RWStepVisual_RWCurveStyleFontPattern {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWCurveStyleFontPattern;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWCurveStyleFontPattern;
		 RWStepVisual_RWCurveStyleFontPattern ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_CurveStyleFontPattern & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_CurveStyleFontPattern &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_CurveStyleFontPattern & ent);
};


%extend RWStepVisual_RWCurveStyleFontPattern {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWDraughtingModel;
class RWStepVisual_RWDraughtingModel {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingModel;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepVisual_RWDraughtingModel;
		 RWStepVisual_RWDraughtingModel ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads DraughtingModel

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_DraughtingModel &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_DraughtingModel & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes DraughtingModel

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_DraughtingModel &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_DraughtingModel & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepVisual_DraughtingModel &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_DraughtingModel & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWDraughtingModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWDraughtingPreDefinedColour;
class RWStepVisual_RWDraughtingPreDefinedColour {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingPreDefinedColour;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWDraughtingPreDefinedColour;
		 RWStepVisual_RWDraughtingPreDefinedColour ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_DraughtingPreDefinedColour &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_DraughtingPreDefinedColour & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_DraughtingPreDefinedColour &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_DraughtingPreDefinedColour & ent);
};


%extend RWStepVisual_RWDraughtingPreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWDraughtingPreDefinedCurveFont;
class RWStepVisual_RWDraughtingPreDefinedCurveFont {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWDraughtingPreDefinedCurveFont;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWDraughtingPreDefinedCurveFont;
		 RWStepVisual_RWDraughtingPreDefinedCurveFont ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_DraughtingPreDefinedCurveFont &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_DraughtingPreDefinedCurveFont & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_DraughtingPreDefinedCurveFont &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_DraughtingPreDefinedCurveFont & ent);
};


%extend RWStepVisual_RWDraughtingPreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWExternallyDefinedCurveFont;
class RWStepVisual_RWExternallyDefinedCurveFont {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWExternallyDefinedCurveFont;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") RWStepVisual_RWExternallyDefinedCurveFont;
		 RWStepVisual_RWExternallyDefinedCurveFont ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	* Reads ExternallyDefinedCurveFont

	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_ExternallyDefinedCurveFont &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_ExternallyDefinedCurveFont & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	* Writes ExternallyDefinedCurveFont

	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_ExternallyDefinedCurveFont &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_ExternallyDefinedCurveFont & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	* Fills data for graph (shared items)

	:param ent:
	:type ent: Handle_StepVisual_ExternallyDefinedCurveFont &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_ExternallyDefinedCurveFont & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWExternallyDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWFillAreaStyle;
class RWStepVisual_RWFillAreaStyle {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWFillAreaStyle;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWFillAreaStyle;
		 RWStepVisual_RWFillAreaStyle ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_FillAreaStyle &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_FillAreaStyle & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_FillAreaStyle &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_FillAreaStyle & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_FillAreaStyle &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_FillAreaStyle & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWFillAreaStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWFillAreaStyleColour;
class RWStepVisual_RWFillAreaStyleColour {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWFillAreaStyleColour;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWFillAreaStyleColour;
		 RWStepVisual_RWFillAreaStyleColour ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_FillAreaStyleColour &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_FillAreaStyleColour & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_FillAreaStyleColour &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_FillAreaStyleColour & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_FillAreaStyleColour &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_FillAreaStyleColour & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWFillAreaStyleColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWInvisibility;
class RWStepVisual_RWInvisibility {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWInvisibility;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWInvisibility;
		 RWStepVisual_RWInvisibility ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_Invisibility &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_Invisibility & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_Invisibility &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_Invisibility & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_Invisibility &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_Invisibility & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWInvisibility {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWMechanicalDesignGeometricPresentationArea;
class RWStepVisual_RWMechanicalDesignGeometricPresentationArea {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWMechanicalDesignGeometricPresentationArea;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWMechanicalDesignGeometricPresentationArea;
		 RWStepVisual_RWMechanicalDesignGeometricPresentationArea ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_MechanicalDesignGeometricPresentationArea &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_MechanicalDesignGeometricPresentationArea & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_MechanicalDesignGeometricPresentationArea &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_MechanicalDesignGeometricPresentationArea & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_MechanicalDesignGeometricPresentationArea &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_MechanicalDesignGeometricPresentationArea & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWMechanicalDesignGeometricPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation;
class RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation;
		 RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_MechanicalDesignGeometricPresentationRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWMechanicalDesignGeometricPresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWOverRidingStyledItem;
class RWStepVisual_RWOverRidingStyledItem {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWOverRidingStyledItem;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWOverRidingStyledItem;
		 RWStepVisual_RWOverRidingStyledItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_OverRidingStyledItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_OverRidingStyledItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_OverRidingStyledItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_OverRidingStyledItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_OverRidingStyledItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_OverRidingStyledItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWOverRidingStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPlanarBox;
class RWStepVisual_RWPlanarBox {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPlanarBox;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPlanarBox;
		 RWStepVisual_RWPlanarBox ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PlanarBox &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PlanarBox & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PlanarBox &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PlanarBox & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PlanarBox &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PlanarBox & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPlanarBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPlanarExtent;
class RWStepVisual_RWPlanarExtent {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPlanarExtent;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPlanarExtent;
		 RWStepVisual_RWPlanarExtent ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PlanarExtent &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PlanarExtent & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PlanarExtent &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PlanarExtent & ent);
};


%extend RWStepVisual_RWPlanarExtent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPointStyle;
class RWStepVisual_RWPointStyle {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPointStyle;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPointStyle;
		 RWStepVisual_RWPointStyle ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PointStyle &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PointStyle & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PointStyle &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PointStyle & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PointStyle &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PointStyle & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPointStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPreDefinedColour;
class RWStepVisual_RWPreDefinedColour {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPreDefinedColour;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPreDefinedColour;
		 RWStepVisual_RWPreDefinedColour ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PreDefinedColour &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PreDefinedColour & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PreDefinedColour &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PreDefinedColour & ent);
};


%extend RWStepVisual_RWPreDefinedColour {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPreDefinedCurveFont;
class RWStepVisual_RWPreDefinedCurveFont {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPreDefinedCurveFont;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPreDefinedCurveFont;
		 RWStepVisual_RWPreDefinedCurveFont ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PreDefinedCurveFont &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PreDefinedCurveFont & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PreDefinedCurveFont &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PreDefinedCurveFont & ent);
};


%extend RWStepVisual_RWPreDefinedCurveFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPreDefinedItem;
class RWStepVisual_RWPreDefinedItem {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPreDefinedItem;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPreDefinedItem;
		 RWStepVisual_RWPreDefinedItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PreDefinedItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PreDefinedItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PreDefinedItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PreDefinedItem & ent);
};


%extend RWStepVisual_RWPreDefinedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationArea;
class RWStepVisual_RWPresentationArea {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationArea;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationArea;
		 RWStepVisual_RWPresentationArea ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationArea &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationArea & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationArea &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationArea & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationArea &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationArea & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationLayerAssignment;
class RWStepVisual_RWPresentationLayerAssignment {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationLayerAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationLayerAssignment;
		 RWStepVisual_RWPresentationLayerAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationLayerAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationLayerAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationLayerAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationLayerAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationLayerAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationLayerAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationLayerAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationLayerUsage;
class RWStepVisual_RWPresentationLayerUsage {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationLayerUsage;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationLayerUsage;
		 RWStepVisual_RWPresentationLayerUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationLayerUsage &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationLayerUsage & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationLayerUsage &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationLayerUsage & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationLayerUsage &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationLayerUsage & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationLayerUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationRepresentation;
class RWStepVisual_RWPresentationRepresentation {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationRepresentation;
		 RWStepVisual_RWPresentationRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationSet;
class RWStepVisual_RWPresentationSet {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationSet;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationSet;
		 RWStepVisual_RWPresentationSet ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationSet &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationSet & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationSet &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationSet & ent);
};


%extend RWStepVisual_RWPresentationSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationSize;
class RWStepVisual_RWPresentationSize {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationSize;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationSize;
		 RWStepVisual_RWPresentationSize ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationSize &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationSize & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationSize &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationSize & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationSize &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationSize & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationSize {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationStyleAssignment;
class RWStepVisual_RWPresentationStyleAssignment {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationStyleAssignment;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationStyleAssignment;
		 RWStepVisual_RWPresentationStyleAssignment ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationStyleAssignment & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationStyleAssignment &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationStyleAssignment & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationStyleAssignment &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationStyleAssignment & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationStyleAssignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationStyleByContext;
class RWStepVisual_RWPresentationStyleByContext {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationStyleByContext;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationStyleByContext;
		 RWStepVisual_RWPresentationStyleByContext ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationStyleByContext &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationStyleByContext & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationStyleByContext &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationStyleByContext & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationStyleByContext &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationStyleByContext & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationStyleByContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentationView;
class RWStepVisual_RWPresentationView {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentationView;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentationView;
		 RWStepVisual_RWPresentationView ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentationView &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentationView & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentationView &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentationView & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentationView &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentationView & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentationView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWPresentedItemRepresentation;
class RWStepVisual_RWPresentedItemRepresentation {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWPresentedItemRepresentation;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWPresentedItemRepresentation;
		 RWStepVisual_RWPresentedItemRepresentation ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_PresentedItemRepresentation &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_PresentedItemRepresentation & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_PresentedItemRepresentation &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_PresentedItemRepresentation & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_PresentedItemRepresentation &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_PresentedItemRepresentation & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWPresentedItemRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWStyledItem;
class RWStepVisual_RWStyledItem {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWStyledItem;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWStyledItem;
		 RWStepVisual_RWStyledItem ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_StyledItem &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_StyledItem & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_StyledItem &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_StyledItem & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_StyledItem &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_StyledItem & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWStyledItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceSideStyle;
class RWStepVisual_RWSurfaceSideStyle {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceSideStyle;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceSideStyle;
		 RWStepVisual_RWSurfaceSideStyle ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceSideStyle &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceSideStyle & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceSideStyle &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceSideStyle & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceSideStyle &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceSideStyle & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceSideStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleBoundary;
class RWStepVisual_RWSurfaceStyleBoundary {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleBoundary;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleBoundary;
		 RWStepVisual_RWSurfaceStyleBoundary ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleBoundary &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleBoundary & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleBoundary &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleBoundary & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleBoundary &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleBoundary & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleControlGrid;
class RWStepVisual_RWSurfaceStyleControlGrid {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleControlGrid;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleControlGrid;
		 RWStepVisual_RWSurfaceStyleControlGrid ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleControlGrid &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleControlGrid & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleControlGrid &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleControlGrid & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleControlGrid &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleControlGrid & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleControlGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleFillArea;
class RWStepVisual_RWSurfaceStyleFillArea {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleFillArea;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleFillArea;
		 RWStepVisual_RWSurfaceStyleFillArea ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleFillArea &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleFillArea & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleFillArea &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleFillArea & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleFillArea &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleFillArea & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleParameterLine;
class RWStepVisual_RWSurfaceStyleParameterLine {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleParameterLine;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleParameterLine;
		 RWStepVisual_RWSurfaceStyleParameterLine ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleParameterLine &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleParameterLine & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleParameterLine &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleParameterLine & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleParameterLine &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleParameterLine & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleParameterLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleSegmentationCurve;
class RWStepVisual_RWSurfaceStyleSegmentationCurve {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleSegmentationCurve;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleSegmentationCurve;
		 RWStepVisual_RWSurfaceStyleSegmentationCurve ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleSegmentationCurve &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleSegmentationCurve & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleSegmentationCurve &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleSegmentationCurve & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleSegmentationCurve &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleSegmentationCurve & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleSegmentationCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleSilhouette;
class RWStepVisual_RWSurfaceStyleSilhouette {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleSilhouette;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleSilhouette;
		 RWStepVisual_RWSurfaceStyleSilhouette ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleSilhouette &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleSilhouette & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleSilhouette &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleSilhouette & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleSilhouette &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleSilhouette & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleSilhouette {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWSurfaceStyleUsage;
class RWStepVisual_RWSurfaceStyleUsage {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWSurfaceStyleUsage;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWSurfaceStyleUsage;
		 RWStepVisual_RWSurfaceStyleUsage ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleUsage &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_SurfaceStyleUsage & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleUsage &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_SurfaceStyleUsage & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_SurfaceStyleUsage &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_SurfaceStyleUsage & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWSurfaceStyleUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWTemplate;
class RWStepVisual_RWTemplate {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWTemplate;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWTemplate;
		 RWStepVisual_RWTemplate ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_Template &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_Template & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_Template &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_Template & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_Template &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_Template & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWTemplate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWTemplateInstance;
class RWStepVisual_RWTemplateInstance {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWTemplateInstance;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWTemplateInstance;
		 RWStepVisual_RWTemplateInstance ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_TemplateInstance &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_TemplateInstance & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_TemplateInstance &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_TemplateInstance & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_TemplateInstance &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_TemplateInstance & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWTemplateInstance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWTextLiteral;
class RWStepVisual_RWTextLiteral {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWTextLiteral;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWTextLiteral;
		 RWStepVisual_RWTextLiteral ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_TextLiteral &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_TextLiteral & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_TextLiteral &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_TextLiteral & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_TextLiteral &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_TextLiteral & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWTextLiteral {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWTextStyle;
class RWStepVisual_RWTextStyle {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWTextStyle;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWTextStyle;
		 RWStepVisual_RWTextStyle ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_TextStyle &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_TextStyle & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_TextStyle &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_TextStyle & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_TextStyle &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_TextStyle & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWTextStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWTextStyleForDefinedFont;
class RWStepVisual_RWTextStyleForDefinedFont {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWTextStyleForDefinedFont;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWTextStyleForDefinedFont;
		 RWStepVisual_RWTextStyleForDefinedFont ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_TextStyleForDefinedFont &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_TextStyleForDefinedFont & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_TextStyleForDefinedFont &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_TextStyleForDefinedFont & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_TextStyleForDefinedFont &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_TextStyleForDefinedFont & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWTextStyleForDefinedFont {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWTextStyleWithBoxCharacteristics;
class RWStepVisual_RWTextStyleWithBoxCharacteristics {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWTextStyleWithBoxCharacteristics;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWTextStyleWithBoxCharacteristics;
		 RWStepVisual_RWTextStyleWithBoxCharacteristics ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_TextStyleWithBoxCharacteristics &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_TextStyleWithBoxCharacteristics & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_TextStyleWithBoxCharacteristics &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_TextStyleWithBoxCharacteristics & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_TextStyleWithBoxCharacteristics &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_TextStyleWithBoxCharacteristics & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWTextStyleWithBoxCharacteristics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWStepVisual_RWViewVolume;
class RWStepVisual_RWViewVolume {
	public:
		%feature("compactdefaultargs") RWStepVisual_RWViewVolume;
		%feature("autodoc", "	:rtype: None
") RWStepVisual_RWViewVolume;
		 RWStepVisual_RWViewVolume ();
		%feature("compactdefaultargs") ReadStep;
		%feature("autodoc", "	:param data:
	:type data: Handle_StepData_StepReaderData &
	:param num:
	:type num: int
	:param ach:
	:type ach: Handle_Interface_Check &
	:param ent:
	:type ent: Handle_StepVisual_ViewVolume &
	:rtype: None
") ReadStep;
		void ReadStep (const Handle_StepData_StepReaderData & data,const Standard_Integer num,Handle_Interface_Check & ach,const Handle_StepVisual_ViewVolume & ent);
		%feature("compactdefaultargs") WriteStep;
		%feature("autodoc", "	:param SW:
	:type SW: StepData_StepWriter &
	:param ent:
	:type ent: Handle_StepVisual_ViewVolume &
	:rtype: None
") WriteStep;
		void WriteStep (StepData_StepWriter & SW,const Handle_StepVisual_ViewVolume & ent);
		%feature("compactdefaultargs") Share;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_StepVisual_ViewVolume &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: None
") Share;
		void Share (const Handle_StepVisual_ViewVolume & ent,Interface_EntityIterator & iter);
};


%extend RWStepVisual_RWViewVolume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
