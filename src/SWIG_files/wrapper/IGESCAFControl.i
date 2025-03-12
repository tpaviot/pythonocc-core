/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define IGESCAFCONTROLDOCSTRING
"IGESCAFControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_igescafcontrol.html"
%enddef
%module (package="OCC.Core", docstring=IGESCAFCONTROLDOCSTRING) IGESCAFControl


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
#include<IGESCAFControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Quantity_module.hxx>
#include<IGESControl_module.hxx>
#include<XSControl_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<Geom2d_module.hxx>
#include<IFSelect_module.hxx>
#include<Interface_module.hxx>
#include<IGESData_module.hxx>
#include<Geom_module.hxx>
#include<Transfer_module.hxx>
#include<PCDM_module.hxx>
#include<TopTools_module.hxx>
#include<CDF_module.hxx>
#include<Message_module.hxx>
#include<CDM_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TopLoc_module.hxx>
#include<XSControl_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TColGeom_module.hxx>
#include<MoniTool_module.hxx>
#include<IGESToBRep_module.hxx>
#include<BRep_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<Bnd_module.hxx>
#include<BRep_module.hxx>
#include<BRepTools_module.hxx>
#include<DE_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Quantity.i
%import IGESControl.i
%import XSControl.i
%import TCollection.i
%import TDocStd.i
%import Message.i
%import TDF.i

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

/***********************
* class IGESCAFControl *
***********************/
%rename(igescafcontrol) IGESCAFControl;
class IGESCAFControl {
	public:
		/****** IGESCAFControl::DecodeColor ******/
		/****** md5 signature: 412697bd8d78fc5979403a70aef21561 ******/
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "
Parameters
----------
col: int

Return
-------
Quantity_Color

Description
-----------
Provides a tool for writing IGES file Converts IGES color index to CASCADE color.
") DecodeColor;
		static Quantity_Color DecodeColor(const Standard_Integer col);

		/****** IGESCAFControl::EncodeColor ******/
		/****** md5 signature: b104ced61ad034521f1117876167864c ******/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "
Parameters
----------
col: Quantity_Color

Return
-------
int

Description
-----------
Tries to Convert CASCADE color to IGES color index If no corresponding color defined in IGES, returns 0.
") EncodeColor;
		static Standard_Integer EncodeColor(const Quantity_Color & col);

};


%extend IGESCAFControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESCAFControl_Reader *
******************************/
class IGESCAFControl_Reader : public IGESControl_Reader {
	public:
		/****** IGESCAFControl_Reader::IGESCAFControl_Reader ******/
		/****** md5 signature: 247dc9b3de494ba90e36e7db39edee6b ******/
		%feature("compactdefaultargs") IGESCAFControl_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a reader with an empty IGES model and sets ColorMode, LayerMode and NameMode to Standard_True.
") IGESCAFControl_Reader;
		 IGESCAFControl_Reader();

		/****** IGESCAFControl_Reader::IGESCAFControl_Reader ******/
		/****** md5 signature: ed2325657273ea5f907b2a7d8ba9ffcc ******/
		%feature("compactdefaultargs") IGESCAFControl_Reader;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
FromScratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for IGES.
") IGESCAFControl_Reader;
		 IGESCAFControl_Reader(const opencascade::handle<XSControl_WorkSession> & theWS, const Standard_Boolean FromScratch = Standard_True);

		/****** IGESCAFControl_Reader::GetColorMode ******/
		/****** md5 signature: cddb885e605f1794a5a6486023f65736 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****** IGESCAFControl_Reader::GetLayerMode ******/
		/****** md5 signature: b6b1458608d2429d13e63a07c0b392d8 ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****** IGESCAFControl_Reader::GetNameMode ******/
		/****** md5 signature: 1097f532a68b4625a0108cddc8366238 ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****** IGESCAFControl_Reader::Perform ******/
		/****** md5 signature: cee56f371ea8e972dad6b23f2e3d3bd3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFileName: str
theDoc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
No available documentation.
") Perform;
		Standard_Boolean Perform(TCollection_AsciiString theFileName, const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Reader::Perform ******/
		/****** md5 signature: 7404bc4c3b80e5147b5cfd67bfcd62d1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFileName: str
theDoc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translate IGES file given by filename into the document Return True if succeeded, and False in case of fail.
") Perform;
		Standard_Boolean Perform(Standard_CString theFileName, const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Reader::SetColorMode ******/
		/****** md5 signature: 7026741e7d147d7065572beb98babc6e ******/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Set ColorMode for indicate read Colors or not.
") SetColorMode;
		void SetColorMode(const Standard_Boolean theMode);

		/****** IGESCAFControl_Reader::SetLayerMode ******/
		/****** md5 signature: 81f87cc05a87da11feacb0420dc37c4b ******/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Set LayerMode for indicate read Layers or not.
") SetLayerMode;
		void SetLayerMode(const Standard_Boolean theMode);

		/****** IGESCAFControl_Reader::SetNameMode ******/
		/****** md5 signature: a69a0615cbbe8af82773337e918a7087 ******/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Set NameMode for indicate read Name or not.
") SetNameMode;
		void SetNameMode(const Standard_Boolean theMode);

		/****** IGESCAFControl_Reader::Transfer ******/
		/****** md5 signature: df90f76568165a7e5bd8481bb89b6fc9 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates currently loaded IGES file into the document Returns True if succeeded, and False in case of fail.
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend IGESCAFControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IGESCAFControl_Writer *
******************************/
class IGESCAFControl_Writer : public IGESControl_Writer {
	public:
		/****** IGESCAFControl_Writer::IGESCAFControl_Writer ******/
		/****** md5 signature: 34a554f8fe0d098b53da598d84fdc271 ******/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer with an empty IGES model and sets ColorMode, LayerMode and NameMode to Standard_True.
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer();

		/****** IGESCAFControl_Writer::IGESCAFControl_Writer ******/
		/****** md5 signature: 185eb49db43948a75dc15c0c48b3f1bc ******/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for IGES.
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** IGESCAFControl_Writer::IGESCAFControl_Writer ******/
		/****** md5 signature: 2137ed6437df5579966ff34bb02a88c7 ******/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
theUnit: str

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for IGES Sets target Unit for the writing process.
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & theWS, Standard_CString theUnit);

		/****** IGESCAFControl_Writer::GetColorMode ******/
		/****** md5 signature: 010da6a8a0e8a61fdb607fd6faba2b56 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****** IGESCAFControl_Writer::GetLayerMode ******/
		/****** md5 signature: d677385c303e067613f92bc738509727 ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****** IGESCAFControl_Writer::GetNameMode ******/
		/****** md5 signature: 2dd32a893d6f5f4666ac3752ace2d12f ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****** IGESCAFControl_Writer::Perform ******/
		/****** md5 signature: 82a9ff51a493dfcaea368ecaef792fdb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
doc: TDocStd_Document
filename: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
No available documentation.
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & doc, TCollection_AsciiString filename, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::Perform ******/
		/****** md5 signature: 1ef00b1bd520cd3b05cc4f00e91c494d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
doc: TDocStd_Document
filename: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document and writes it to a IGES file Returns True if translation is OK.
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & doc, Standard_CString filename, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::SetColorMode ******/
		/****** md5 signature: e8d41838c31a9460a1c83d84b1f572a1 ******/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "
Parameters
----------
colormode: bool

Return
-------
None

Description
-----------
Set ColorMode for indicate write Colors or not.
") SetColorMode;
		void SetColorMode(const Standard_Boolean colormode);

		/****** IGESCAFControl_Writer::SetLayerMode ******/
		/****** md5 signature: 3ec21c8de4b114a83bb0b34cb3b98662 ******/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "
Parameters
----------
layermode: bool

Return
-------
None

Description
-----------
Set LayerMode for indicate write Layers or not.
") SetLayerMode;
		void SetLayerMode(const Standard_Boolean layermode);

		/****** IGESCAFControl_Writer::SetNameMode ******/
		/****** md5 signature: 43ccb5d3fb024d8191f251ee74d0f6ba ******/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "
Parameters
----------
namemode: bool

Return
-------
None

Description
-----------
Set NameMode for indicate write Name or not.
") SetNameMode;
		void SetNameMode(const Standard_Boolean namemode);

		/****** IGESCAFControl_Writer::Transfer ******/
		/****** md5 signature: 31249612d40a7a08f4519552635fb88d ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
doc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document to a IGES model Returns True if translation is OK.
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::Transfer ******/
		/****** md5 signature: f3e872ca158bc684049cac94dc49b992 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
labels: TDF_LabelSequence
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers labels to a IGES model Returns True if translation is OK.
") Transfer;
		Standard_Boolean Transfer(const TDF_LabelSequence & labels, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::Transfer ******/
		/****** md5 signature: 04ca4aafde66fce5eeebd12288b3c0bd ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers label to a IGES model Returns True if translation is OK.
") Transfer;
		Standard_Boolean Transfer(const TDF_Label & label, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend IGESCAFControl_Writer {
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
/* deprecated methods */
%pythoncode {
@deprecated
def igescafcontrol_DecodeColor(*args):
	return igescafcontrol.DecodeColor(*args)

@deprecated
def igescafcontrol_EncodeColor(*args):
	return igescafcontrol.EncodeColor(*args)

}
